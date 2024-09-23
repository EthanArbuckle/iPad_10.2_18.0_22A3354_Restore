@implementation UIContextMenuHeaderView

void __42___UIContextMenuHeaderView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v2);

  objc_msgSend(v4, "_updateCompositingFilterForCurrentState");
}

void __42___UIContextMenuHeaderView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = a2;
  v2 = objc_msgSend(v4, "_titleLabelNumberOfLines");
  objc_msgSend(v4, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", v2);

  objc_msgSend(v4, "_updateLayoutMargins");
}

@end
