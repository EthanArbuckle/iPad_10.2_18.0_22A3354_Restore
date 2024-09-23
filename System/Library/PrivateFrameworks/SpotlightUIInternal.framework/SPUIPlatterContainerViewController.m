@implementation SPUIPlatterContainerViewController

- (SPUIPlatterContainerViewController)initWithNavigationController:(id)a3
{
  id v4;
  SPUIPlatterContainerViewController *v5;
  SPUIPlatterContainerViewController *v6;
  void *v7;
  SPUIBorderedVisualEffectView *v8;
  void *v9;
  SPUIBorderedVisualEffectView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SPUIBoxView *v20;
  void *v21;
  SPUIBoxView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v29;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SPUIPlatterContainerViewController;
  v5 = -[SPUIPlatterContainerViewController initWithNibName:bundle:](&v31, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[SPUIPlatterContainerViewController setNavController:](v5, "setNavController:", v4);
    -[SPUIPlatterContainerViewController navController](v6, "navController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSizingDelegate:", v6);

    -[SPUIPlatterContainerViewController addChildViewController:](v6, "addChildViewController:", v4);
    v8 = [SPUIBorderedVisualEffectView alloc];
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SPUIBorderedVisualEffectView initWithEffect:](v8, "initWithEffect:", v9);

    -[SPUIBorderedVisualEffectView contentView](v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[SPUIBorderedVisualEffectView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", 20.0);
    -[SPUIBorderedVisualEffectView contentView](v10, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setContinuousCornerRadius:", 20.0);

    -[SPUIBorderedVisualEffectView contentView](v10, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    -[SPUIPlatterContainerViewController navController](v6, "navController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

    -[SPUIBorderedVisualEffectView contentView](v10, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

    -[SPUIPlatterContainerViewController setVisualEffectView:](v6, "setVisualEffectView:", v10);
    objc_msgSend(MEMORY[0x24BEB4BA0], "requireIntrinsicSizeForView:", v10);
    v19 = (void *)objc_opt_new();
    -[SPUIPlatterContainerViewController setPlatterBackgroundView:](v6, "setPlatterBackgroundView:", v19);
    objc_msgSend(MEMORY[0x24BEB4BA0], "requireIntrinsicSizeForView:", v19);
    v20 = [SPUIBoxView alloc];
    v32[0] = v19;
    v32[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NUIContainerBoxView initWithArrangedSubviews:](v20, "initWithArrangedSubviews:", v21);
    -[SPUIPlatterContainerViewController setView:](v6, "setView:", v22);

    -[SPUIPlatterContainerViewController view](v6, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInsetsLayoutMarginsFromSafeArea:", 0);

    -[SPUIPlatterContainerViewController view](v6, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLayoutMarginsRelativeArrangement:", 1);

    -[SPUIPlatterContainerViewController view](v6, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setVerticalAlignment:", 1);

    -[SPUIPlatterContainerViewController view](v6, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHorizontalAlignment:", 3);

    -[SPUIPlatterContainerViewController view](v6, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v6);

    -[SPUIPlatterContainerViewController hardwareKeyboardAvailabilityChangedAnimated:](v6, "hardwareKeyboardAvailabilityChangedAnimated:", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v29, 0, (CFNotificationSuspensionBehavior)0);

  }
  return v6;
}

+ (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

- (void)hardwareKeyboardAvailabilityChangedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  double v6;
  _QWORD v7[9];

  v3 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "isHardwareKeyboardAttached") == 0;
  v6 = 40.0;
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __82__SPUIPlatterContainerViewController_hardwareKeyboardAvailabilityChangedAnimated___block_invoke;
  v7[3] = &unk_24F9D5F60;
  if (!v5)
    v6 = 80.0;
  v7[4] = self;
  *(double *)&v7[5] = v6;
  v7[6] = 0;
  *(double *)&v7[7] = v6;
  v7[8] = 0;
  objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:animated:", v7, v3);
}

void __82__SPUIPlatterContainerViewController_hardwareKeyboardAvailabilityChangedAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutMargins:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)navigationViewDidInvalidateSizeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD aBlock[5];

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke;
  aBlock[3] = &unk_24F9D5CC8;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v6 = v5;
  if (v3)
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_2;
    v7[3] = &unk_24F9D5E10;
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    v5[2](v5);
  }

}

void __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateIntrinsicContentSize");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

void __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BE85288];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_3;
  v2[3] = &unk_24F9D5E10;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "performAnimatableChanges:", v2);

}

uint64_t __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a5;
  -[SPUIPlatterContainerViewController visualEffectView](self, "visualEffectView");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {

    goto LABEL_5;
  }
  v8 = (void *)v7;
  -[SPUIPlatterContainerViewController platterBackgroundView](self, "platterBackgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE85210], "idealPlatterWidth");
    v10 = v12;
    -[SPUIPlatterContainerViewController navController](self, "navController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentHeight");
    v11 = v14;

    goto LABEL_6;
  }
  v10 = *MEMORY[0x24BE047D8];
  v11 = *(double *)(MEMORY[0x24BE047D8] + 8);
LABEL_6:

  v15 = v10;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a3;
  -[SPUIPlatterContainerViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v24;
  if (v4 == v24)
  {
    -[SPUIPlatterContainerViewController visualEffectView](self, "visualEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(v24, "bounds");
    v14 = v13;
    objc_msgSend(v24, "layoutMargins");
    v16 = v14 - v15;
    objc_msgSend(v24, "layoutMargins");
    v18 = v16 - v17;
    -[SPUIPlatterContainerViewController navController](self, "navController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v18;
    v21 = CGRectEqualToRect(v25, v26);

    v5 = v24;
    if (!v21)
    {
      -[SPUIPlatterContainerViewController navController](self, "navController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v8, v10, v12, v18);

      v5 = v24;
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGPoint v12;
  CGRect v13;

  v4 = a3;
  -[SPUIPlatterContainerViewController visualEffectView](self, "visualEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[SPUIPlatterContainerViewController visualEffectView](self, "visualEffectView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12.x = v7;
  v12.y = v9;
  LOBYTE(v4) = !CGRectContainsPoint(v13, v12);

  return (char)v4;
}

- (UIEdgeInsets)layoutMarginsForContainer
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SPUIPlatterContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)SPUIPlatterContainerViewController;
  -[SPUIPlatterContainerViewController dealloc](&v5, sel_dealloc);
}

- (UIView)platterBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 968, 1);
}

- (void)setPlatterBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (UIVisualEffectView)visualEffectView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setVisualEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (SPUINavigationController)navController
{
  return (SPUINavigationController *)objc_getProperty(self, a2, 984, 1);
}

- (void)setNavController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return (UIGestureRecognizer *)objc_getProperty(self, a2, 992, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_platterBackgroundView, 0);
}

@end
