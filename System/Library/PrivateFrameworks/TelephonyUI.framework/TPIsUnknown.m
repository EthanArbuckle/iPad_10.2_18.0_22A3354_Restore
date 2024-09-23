@implementation TPIsUnknown

void __TPIsUnknown_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  int v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "size");
  v3 = (int)v2;

  v6 = 0;
  if (v3 >= 2208)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v6 = 1;
  }
  TPIsUnknown_isUnknown = v6;
}

@end
