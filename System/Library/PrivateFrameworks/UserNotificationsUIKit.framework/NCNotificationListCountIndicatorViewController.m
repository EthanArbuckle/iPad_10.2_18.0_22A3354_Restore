@implementation NCNotificationListCountIndicatorViewController

- (void)viewDidLoad
{
  NCNotificationListCountIndicatorViewController *v2;

  v2 = self;
  NCNotificationListCountIndicatorViewController.viewDidLoad()();

}

- (void)loadView
{
  id v3;
  NCNotificationListCountIndicatorViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)NCNotificationListCountIndicatorView);
  v4 = self;
  v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[NCNotificationListCountIndicatorViewController setView:](v4, sel_setView_, v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCNotificationListCountIndicatorViewControllerDelegate)delegate
{
  return (NCNotificationListCountIndicatorViewControllerDelegate *)(id)MEMORY[0x1D17DD63C]((char *)self + OBJC_IVAR___NCNotificationListCountIndicatorViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (DNDModeConfiguration)activeDNDModeConfiguration
{
  return (DNDModeConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR___NCNotificationListCountIndicatorViewController_activeDNDModeConfiguration));
}

- (void)setActiveDNDModeConfiguration:(id)a3
{
  id v5;
  NCNotificationListCountIndicatorViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1CFD70724(a3);

}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count);
}

- (void)setCount:(int64_t)a3
{
  uint64_t v3;
  NCNotificationListCountIndicatorViewController *v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListCountIndicatorViewController_count) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1CFD707E4();

  }
}

- (NSString)incomingTitle
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_incomingTitle))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1CFD7C49C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setIncomingTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NCNotificationListCountIndicatorViewController *v7;

  if (a3)
  {
    v4 = sub_1CFD7C4C0();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1CFD70C6C(v4, v6);

}

- (void)setDisplayStyleSetting:(int64_t)a3
{
  NCNotificationListCountIndicatorViewController *v4;

  v4 = self;
  sub_1CFD70CE0((id)a3);

}

- (UIEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_edgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  NCNotificationListCountIndicatorViewController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  sub_1CFD70E2C(top, left, bottom, right);

}

- (CGRect)visibleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVisibleFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  NCNotificationListCountIndicatorViewController *v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v8 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v9 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  v10 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                  + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame);
  *(CGRect *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___NCNotificationListCountIndicatorViewController_visibleFrame) = a3;
  v11 = self;
  v12.origin.x = v7;
  v12.origin.y = v8;
  v12.size.width = v9;
  v12.size.height = v10;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v12, v13))
    sub_1CFD707E4();

}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  NCNotificationListCountIndicatorViewController *v4;
  id v5;
  id v6;

  v4 = self;
  v5 = a3;
  -[NCNotificationListCountIndicatorViewController loadViewIfNeeded](v4, sel_loadViewIfNeeded);
  v6 = -[NCNotificationListCountIndicatorViewController view](v4, sel_view);
  if (v6)
  {
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_adjustForLegibilitySettingsChange_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return sub_1CFD70FE4(self, (uint64_t)a2, (SEL *)&selRef_adjustForContentSizeCategoryChange);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return sub_1CFD70FE4(self, (uint64_t)a2, (SEL *)&selRef_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  NCNotificationListCountIndicatorViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  -[NCNotificationListCountIndicatorViewController loadViewIfNeeded](v4, sel_loadViewIfNeeded);
  v5 = -[NCNotificationListCountIndicatorViewController view](v4, sel_view);
  if (v5)
  {
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setAdjustsFontForContentSizeCategory_, v3);

  }
  else
  {
    __break(1u);
  }
}

- (NCNotificationListCountIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1CFD7C4C0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (NCNotificationListCountIndicatorViewController *)NCNotificationListCountIndicatorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (NCNotificationListCountIndicatorViewController)initWithCoder:(id)a3
{
  return (NCNotificationListCountIndicatorViewController *)NCNotificationListCountIndicatorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1CFD3E3A0((uint64_t)self + OBJC_IVAR___NCNotificationListCountIndicatorViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationListCountIndicatorViewController_activeDNDModeConfiguration));
  swift_bridgeObjectRelease();
}

- (void)notificationListCountIndicatorViewTapped:(id)a3
{
  id v4;
  NCNotificationListCountIndicatorViewControllerDelegate *v5;
  NCNotificationListCountIndicatorViewController *v6;

  v4 = a3;
  v6 = self;
  v5 = -[NCNotificationListCountIndicatorViewController delegate](v6, sel_delegate);
  if (v5)
  {
    -[NCNotificationListCountIndicatorViewControllerDelegate notificationListCountIndicatorViewControllerTapped:](v5, sel_notificationListCountIndicatorViewControllerTapped_, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)notificationListCountIndicatorViewLongPressed:(id)a3 presentingView:(id)a4
{
  id v6;
  NCNotificationListCountIndicatorViewController *v7;
  DNDModeConfiguration *v8;
  NCNotificationListCountIndicatorViewControllerDelegate *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  v8 = -[NCNotificationListCountIndicatorViewController activeDNDModeConfiguration](v7, sel_activeDNDModeConfiguration);

  if (v8
    && (v9 = -[NCNotificationListCountIndicatorViewController delegate](v7, sel_delegate)) != 0)
  {
    -[NCNotificationListCountIndicatorViewControllerDelegate notificationListCountIndicatorViewControllerLongPressed:presentingView:](v9, sel_notificationListCountIndicatorViewControllerLongPressed_presentingView_, v7, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

@end
