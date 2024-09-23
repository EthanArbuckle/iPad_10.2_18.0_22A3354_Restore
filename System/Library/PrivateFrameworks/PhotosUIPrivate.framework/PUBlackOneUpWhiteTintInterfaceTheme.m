@implementation PUBlackOneUpWhiteTintInterfaceTheme

- (id)tintColorForBarStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUBlackOneUpWhiteTintInterfaceTheme;
  -[PUFlatWhiteInterfaceTheme tintColorForBarStyle:](&v7, sel_tintColorForBarStyle_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

@end
