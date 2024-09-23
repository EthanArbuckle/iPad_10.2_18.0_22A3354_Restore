@implementation UIView(UIContentUnavailableView)

+ (_SMUContentUnavailableView)smu_contentUnavailableView
{
  void *v0;
  _SMUContentUnavailableView *v1;

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[UIContentUnavailableView initWithConfiguration:]([_SMUContentUnavailableView alloc], "initWithConfiguration:", v0);

  return v1;
}

@end
