@implementation UIDatePickerContainerView

void __39___UIDatePickerContainerView_setFrame___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissPresentationAnimated:", 0);

}

void __40___UIDatePickerContainerView_setBounds___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissPresentationAnimated:", 0);

}

@end
