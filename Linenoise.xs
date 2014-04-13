#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "linenoise.h"

static SV* completion = NULL;
static linenoiseCompletions* completions = NULL;

void completionCallback(const char* string, linenoiseCompletions* completions);

void
completionCallback(string, ctx)
const char* string;
linenoiseCompletions* ctx;
{
    if (completion) {
        completions = ctx;
        dTHX;
        dSP;
        ENTER;
        SAVETMPS;
        PUSHMARK(SP);
        XPUSHs(sv_2mortal(newSVpv(string, 0)));
        PUTBACK;
        call_sv(completion, G_DISCARD);
        FREETMPS;
        LEAVE;
    }
}

#include "ppport.h"

MODULE = Linenoise		PACKAGE = Linenoise		

PROTOTYPES: DISABLED

void set_multiline(input)
  int input
  CODE:
    linenoiseSetMultiLine(input);

void print_keycodes()
  CODE:
    linenoisePrintKeyCodes();

void clear_screen()
  CODE:
    linenoiseClearScreen();

SV * prompt(str)
  char * str
  CODE:
    char * result = linenoise(str);
    SV * sv = newSVpv((const char*)result, 0);
    RETVAL = sv;
    free(result);
  OUTPUT:
    RETVAL

int history_add(line)
  char * line
  CODE:
    RETVAL = linenoiseHistoryAdd(line);
  OUTPUT:
    RETVAL

int history_set_maxlen(len)
  int len
  CODE:
    RETVAL = linenoiseHistorySetMaxLen(len);
  OUTPUT:
    RETVAL

int history_save(filename)
  char * filename
  CODE:
    RETVAL = linenoiseHistorySave(filename);
  OUTPUT:
    RETVAL

int history_load(filename)
  char * filename
  CODE:
    RETVAL = linenoiseHistoryLoad(filename);
  OUTPUT:
    RETVAL

void set_completion_callback(cb)
  SV* cb
  CODE:
    if (completion) {
        SvSetSV(completion, cb);
    } else {
        completion = newSVsv(cb);
    }
    linenoiseSetCompletionCallback(completionCallback);

void add_completion(string)
  char* string
CODE:
  linenoiseAddCompletion(completions, string);


