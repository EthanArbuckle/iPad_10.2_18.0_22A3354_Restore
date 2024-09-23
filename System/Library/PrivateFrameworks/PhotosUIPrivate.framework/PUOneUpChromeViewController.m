@implementation PUOneUpChromeViewController

- (PUOneUpChromeViewController)initWithBrowsingSession:(id)a3 actionsController:(id)a4
{
  id v4;
  PUOneUpChromeViewController *result;

  v4 = a3;
  swift_unknownObjectRetain();
  OneUpChromeViewController.init(browsingSession:actionsController:)();
  return result;
}

- (UIView)ppt_scrubberView
{
  PUOneUpChromeViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AAB9BC10();
  v4 = v3;

  return (UIView *)v4;
}

- (double)horizontalGuideInset
{
  PUOneUpChromeViewController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1AAB9BCE8();
  v4 = v3;

  return v4;
}

- (BOOL)_hideScrubberWhenAccessoryIsVisible
{
  return sub_1AAB9BD68() & 1;
}

- (void)set_hideScrubberWhenAccessoryIsVisible:(BOOL)a3
{
  sub_1AAB9BD9C(a3);
}

- (BOOL)hideScrubberWhenAccessoryIsVisible
{
  PUOneUpChromeViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1AAB9BDDC();

  return v3 & 1;
}

- (void)setHideScrubberWhenAccessoryIsVisible:(BOOL)a3
{
  PUOneUpChromeViewController *v3;

  v3 = self;
  sub_1AAB9B104();

}

- (BOOL)_wantsAirPlayButton
{
  return sub_1AAB9BF04() & 1;
}

- (void)set_wantsAirPlayButton:(BOOL)a3
{
  sub_1AAB9BF38(a3);
}

- (BOOL)wantsAirPlayButton
{
  PUOneUpChromeViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1AAB9BF78();

  return v3 & 1;
}

- (void)setWantsAirPlayButton:(BOOL)a3
{
  PUOneUpChromeViewController *v3;

  v3 = self;
  sub_1AAB9B104();

}

- (BOOL)_wantsShowInLibraryButton
{
  return sub_1AAB9C06C() & 1;
}

- (void)set_wantsShowInLibraryButton:(BOOL)a3
{
  sub_1AAB9C0A0(a3);
}

- (BOOL)wantsShowInLibraryButton
{
  PUOneUpChromeViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1AAB9C0E0();

  return v3 & 1;
}

- (void)setWantsShowInLibraryButton:(BOOL)a3
{
  PUOneUpChromeViewController *v3;

  v3 = self;
  sub_1AAB9B104();

}

- (void)invalidateIsDeviceUnlocked
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  sub_1AAB9C144();

}

- (void)updateIsDeviceUnlockedIfNeeded
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  sub_1AAB9C1B4();

}

- (void)updateIsDeviceLocked
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  sub_1AAB9C21C();

}

- (BOOL)shouldAllowGestureToBeginAt:(id)a3
{
  PUOneUpChromeViewController *v5;
  unsigned __int8 v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AAB9C308(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)updateDismissalStateWithIsInteractivelyDismissing:(BOOL)a3 dismissalProgress:(double)a4
{
  PUOneUpChromeViewController *v4;

  v4 = self;
  sub_1AAB9C414();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PUOneUpChromeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAB9C5DC();
}

- (void)loadView
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  OneUpChromeViewController.loadView()();

}

- (void)viewDidLoad
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  OneUpChromeViewController.viewDidLoad()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  PUOneUpChromeViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  OneUpChromeViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)viewWillLayoutSubviews
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  OneUpChromeViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  PUOneUpChromeViewController *v2;

  v2 = self;
  OneUpChromeViewController.viewDidLayoutSubviews()();

}

- (BOOL)prefersStatusBarHidden
{
  PUOneUpChromeViewController *v2;
  BOOL v3;

  v2 = self;
  v3 = OneUpChromeViewController.prefersStatusBarHidden.getter();

  return v3;
}

- (PUOneUpChromeViewControllerDelegate)_delegate
{
  sub_1AAB9FD68();
}

- (void)set_delegate:(id)a3
{
  PUOneUpChromeViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAB9FDC4();

}

- (PUOneUpChromeViewControllerDelegate)delegate
{
  PUOneUpChromeViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AAB9B814();
  v4 = v3;

  return (PUOneUpChromeViewControllerDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  PUOneUpChromeViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAB9B144((uint64_t)a3, (uint64_t)&unk_1AB0E4958, (uint64_t)sub_1AABA47F4, (void (*)(uint64_t))MEMORY[0x1E0DEEEC0]);

}

- (UIEdgeInsets)_contentGuideInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_1AABA040C(&OBJC_IVAR___PUOneUpChromeViewController__contentGuideInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)set_contentGuideInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PUOneUpChromeViewController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  sub_1AABA0498(&OBJC_IVAR___PUOneUpChromeViewController__contentGuideInsets, top, left, bottom, right);

}

- (UIEdgeInsets)contentGuideInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  sub_1AABA05EC(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.contentGuideInsets.getter);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  PUOneUpChromeViewController *v3;

  v3 = self;
  sub_1AAB9B1D0();

}

- (UIColor)_backgroundColorOverride
{
  return (UIColor *)sub_1AABA0128();
}

- (void)set_backgroundColorOverride:(id)a3
{
  id v5;
  PUOneUpChromeViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AABA019C(a3);

}

- (UIColor)backgroundColorOverride
{
  PUOneUpChromeViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  OneUpChromeViewController.backgroundColorOverride.getter();
  v4 = v3;

  return (UIColor *)v4;
}

- (void)setBackgroundColorOverride:(id)a3
{
  id v4;
  PUOneUpChromeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAB9B194();

}

- (UIEdgeInsets)_contentDecorationAdditionalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_1AABA040C(&OBJC_IVAR___PUOneUpChromeViewController__contentDecorationAdditionalInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)set_contentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PUOneUpChromeViewController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  sub_1AABA0498(&OBJC_IVAR___PUOneUpChromeViewController__contentDecorationAdditionalInsets, top, left, bottom, right);

}

- (UIEdgeInsets)contentDecorationAdditionalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  sub_1AABA05EC(self, (uint64_t)a2, (void (*)(void))OneUpChromeViewController.contentDecorationAdditionalInsets.getter);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  PUOneUpChromeViewController *v3;

  v3 = self;
  sub_1AAB9B1D0();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  PUOneUpChromeViewController *v8;

  v7 = a3;
  v8 = self;
  OneUpChromeViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);

}

- (UIEdgeInsets)contentGuideInsetsForViewSize:(CGSize)a3
{
  PUOneUpChromeViewController *v3;
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
  double v15;
  UIEdgeInsets result;

  v3 = self;
  sub_1AABA0A1C();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (PUOneUpChromeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  OneUpChromeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpChromeViewController__chromeEnvironmentUpdater);
  OUTLINED_FUNCTION_54_1();
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUOneUpChromeViewController__delegate);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpChromeViewController__backgroundColorOverride);
  OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpChromeViewController_chromeHostingController);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpChromeViewController_legibilityHostingController);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUOneUpChromeViewController_browsingSession);
  OUTLINED_FUNCTION_53_1();
  v3 = (char *)self + OBJC_IVAR___PUOneUpChromeViewController_logger;
  v4 = sub_1AB08C0DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PUOneUpChromeViewController___observationRegistrar;
  v6 = sub_1AB08B0A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3
{
  return 0;
}

- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3
{
  PUOneUpChromeViewController *v3;
  void *v4;
  void *v5;

  v3 = self;
  OneUpChromeViewController.oneUpActionsControllerPopoverSourceView(actionType:)();
  v5 = v4;

  return v5;
}

- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = OneUpChromeViewController.oneUpActionsControllerPopoverSourceRect(in:actionType:)();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end
