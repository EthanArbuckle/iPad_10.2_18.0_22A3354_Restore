@implementation _UITextFieldNoBackgroundProvider

- (void)addToTextField:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldNoBackgroundProvider;
  -[_UITextFieldBackgroundProvider addToTextField:](&v6, sel_addToTextField_, v4);
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v4, "setClipsToBounds:", 0);
    objc_msgSend(v4, "_contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 0);

  }
}

- (int64_t)associatedBorderStyle
{
  return 0;
}

@end
