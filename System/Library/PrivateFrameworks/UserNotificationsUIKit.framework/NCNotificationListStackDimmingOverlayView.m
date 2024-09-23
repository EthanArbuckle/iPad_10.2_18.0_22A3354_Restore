@implementation NCNotificationListStackDimmingOverlayView

- (NCNotificationListStackDimmingOverlayView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  NCNotificationListStackDimmingOverlayView *v5;
  NCNotificationListStackDimmingOverlayView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListStackDimmingOverlayView;
  v5 = -[NCNotificationListStackDimmingOverlayView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[NCNotificationListStackDimmingOverlayView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[NCNotificationListStackDimmingOverlayView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:", a4);
    -[NCNotificationListStackDimmingOverlayView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[NCNotificationListStackDimmingOverlayView setAlpha:](v6, "setAlpha:", 0.0);
    -[NCNotificationListStackDimmingOverlayView _updateStackDimmingVisualStyling](v6, "_updateStackDimmingVisualStyling");
  }
  return v6;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListStackDimmingOverlayView;
  -[NCNotificationListStackDimmingOverlayView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[NCNotificationListStackDimmingOverlayView _updateStackDimmingVisualStyling](self, "_updateStackDimmingVisualStyling");
}

- (void)_updateStackDimmingVisualStyling
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[NCNotificationListStackDimmingOverlayView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = CFSTR("stackDimmingLight");
  if (v4 == 2)
    v5 = CFSTR("stackDimmingDark");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0D474B8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_visualStylingProviderForStyleSetNamed:inBundle:", v6, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListStackDimmingOverlayView alpha](self, "alpha");
  v10 = v9;
  objc_msgSend(v12, "_visualStylingForStyle:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListStackDimmingOverlayView mt_replaceVisualStyling:](self, "mt_replaceVisualStyling:", v11);

  -[NCNotificationListStackDimmingOverlayView setAlpha:](self, "setAlpha:", v10);
}

@end
