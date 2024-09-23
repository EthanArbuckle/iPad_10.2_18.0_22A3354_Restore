@implementation DumpPanicArgParser

- (DumpPanicArgParser)initWithArgs:(char *)a3 count:(int)a4
{
  int v7;
  void *v8;
  void *v9;

  -[DumpPanicArgParser setOutput_dir:](self, "setOutput_dir:", 0);
  -[DumpPanicArgParser setRestoreos:](self, "setRestoreos:", 0);
  -[DumpPanicArgParser setHelp:](self, "setHelp:", 0);
  -[DumpPanicArgParser setForce_run:](self, "setForce_run:", 0);
  optreset = 1;
  optind = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        v7 = getopt_long(a4, a3, "ar:chf", (const option *)&off_100039AC8, 0);
        if (v7 <= 103)
          break;
        if (v7 == 114)
        {
          -[DumpPanicArgParser setRestoreos:](self, "setRestoreos:", 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
          -[DumpPanicArgParser setOutput_dir:](self, "setOutput_dir:", v9);

        }
        else if (v7 == 104)
        {
          -[DumpPanicArgParser setHelp:](self, "setHelp:", 1);
        }
      }
      if (v7 != 102)
        break;
      -[DumpPanicArgParser setForce_run:](self, "setForce_run:", 1);
    }
  }
  while (v7 != -1);
  return self;
}

- (void)usage
{
  fwrite("usage: DumpPanic [OPTIONS] \n", 0x1CuLL, 1uLL, __stderrp);
  fwrite("  -r, --restoreos DIRECTORY\n\t\t               special-case mode for restore environment\n\n", 0x58uLL, 1uLL, __stderrp);
  fwrite("  -o, --outputpath DIRECTORY\n\t\t              output directory for logs\n\n", 0x48uLL, 1uLL, __stderrp);
  fwrite("  -f, --force\n\t\t             force DumpPanic to run\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("  -h, --help\n\t\t              show this help\n\n", 0x2DuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
}

- (BOOL)help
{
  return self->_help;
}

- (void)setHelp:(BOOL)a3
{
  self->_help = a3;
}

- (BOOL)restoreos
{
  return self->_restoreos;
}

- (void)setRestoreos:(BOOL)a3
{
  self->_restoreos = a3;
}

- (NSURL)output_dir
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutput_dir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)force_run
{
  return self->_force_run;
}

- (void)setForce_run:(BOOL)a3
{
  self->_force_run = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output_dir, 0);
}

+ (id)withArgs:(char *)a3 count:(int)a4
{
  return -[DumpPanicArgParser initWithArgs:count:]([DumpPanicArgParser alloc], "initWithArgs:count:", a3, *(_QWORD *)&a4);
}

@end
