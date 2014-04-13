use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Linenoise',
    VERSION_FROM      => 'lib/Linenoise.pm', # finds $VERSION
    PREREQ_PM         => { 'Test::More' => 0 }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Linenoise.pm', # retrieve abstract from module
       AUTHOR         => 'darkgrin <darkgrin@yahoo.com>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    OBJECT            => '$(O_FILES)', # link all the C files too
);
