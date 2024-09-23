@implementation IsTallDevice

void __IsTallDevice_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v11.origin.x = v4;
    v11.origin.y = v6;
    v11.size.width = v8;
    v11.size.height = v10;
    IsTallDevice___isTallDevice = CGRectGetHeight(v11) + -568.0 > -2.22044605e-16;
  }
}

@end
