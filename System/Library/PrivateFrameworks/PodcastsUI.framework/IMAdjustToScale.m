@implementation IMAdjustToScale

void __IMAdjustToScale_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  IMAdjustToScale___s = v2;
}

void __IMAdjustToScale_block_invoke_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  IMAdjustToScale___s_0 = v2;
}

@end
