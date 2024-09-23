@implementation CLTTool

- (CLTTool)init
{
  CLTTool *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLTTool;
  v2 = -[CLTTool init](&v4, sel_init);
  if (v2)
    objc_storeStrong((id *)&s_sharedTool, v2);
  return v2;
}

- (int)main
{
  unsigned int i;

  for (i = 1; i != 31; ++i)
  {
    if (i > 0xC || ((1 << i) & 0x1D70) == 0)
      signal(i, (void (__cdecl *)(int))signal_handler);
  }
  return 0;
}

- (void)handleSignal:(int)a3
{
  exit(0);
}

@end
