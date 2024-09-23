@implementation UIPopoverView

void __91___UIPopoverView_initWithFrame_backgroundViewClass_embeddedInView_contentExtendsOverArrow___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_continuousCornerRadius");
  objc_msgSend(v2, "_setContinuousCornerRadius:");

}

uint64_t __35___UIPopoverView_willMoveToWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

uint64_t __36___UIPopoverView_setArrowDirection___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSubview:belowSubview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));

  objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
}

uint64_t __37___UIPopoverView_setBackgroundStyle___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "standardChromeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundStyle:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __44___UIPopoverView_setPopoverBackgroundColor___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "standardChromeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPopoverBackgroundColor:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __40___UIPopoverView__setFrame_arrowOffset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSubview:belowSubview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
}

@end
