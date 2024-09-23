@implementation CarDynamicBlurView

- (CarDynamicBlurView)initWithBlurViewContext:(int64_t)a3 delegate:(id)a4
{
  id v6;
  CarDynamicBlurView *v7;
  CarDynamicBlurView *v8;
  MapsLightLevelController *v9;
  MapsLightLevelController *lightLevelController;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarDynamicBlurView;
  v7 = -[CarDynamicBlurView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    -[CarDynamicBlurView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    v8->_context = a3;
    v9 = -[MapsLightLevelController initWithWindowScene:]([MapsLightLevelController alloc], "initWithWindowScene:", 0);
    lightLevelController = v8->_lightLevelController;
    v8->_lightLevelController = v9;

    -[MapsLightLevelController addObserver:](v8->_lightLevelController, "addObserver:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    v8->_shouldUseNightMode = objc_msgSend(v11, "shouldUseNightMode");

    -[CarDynamicBlurView _createContentView](v8, "_createContentView");
    -[CarDynamicBlurView _redraw](v8, "_redraw");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "_redraw", CFSTR("CarDisplayDidUpdateTraitCollectionNotification"), 0);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsLightLevelController removeObserver:](self->_lightLevelController, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CarDynamicBlurView;
  -[CarDynamicBlurView dealloc](&v3, "dealloc");
}

- (void)_createContentView
{
  UIView *v3;
  UIView *contentView;

  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)didAddSubview:(id)a3
{
  id v3;
  Class v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarDynamicBlurView;
  v3 = a3;
  -[CarDynamicBlurView didAddSubview:](&v5, "didAddSubview:", v3);
  v4 = NSClassFromString(CFSTR("_UIDebugColorBoundsView"));
  objc_opt_isKindOfClass(v3, v4);

}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  self->_hasCornerValues = 1;
  self->_cornerRadius = a3;
  self->_continuous = a4;
  self->_maskedCorners = a5;
  -[CarDynamicBlurView _updateCornerValues](self, "_updateCornerValues");
}

- (void)_updateCornerValues
{
  if (self->_hasCornerValues)
    -[CarVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_visualEffectView, "_setCornerRadius:continuous:maskedCorners:", self->_continuous, self->_maskedCorners, self->_cornerRadius);
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "shouldUseNightMode");
  if (self->_shouldUseNightMode != v5)
  {
    self->_shouldUseNightMode = v5;
    -[CarDynamicBlurView _redraw](self, "_redraw");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  int64_t handledUserInterfaceStyle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarDynamicBlurView;
  -[CarDynamicBlurView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  handledUserInterfaceStyle = self->_handledUserInterfaceStyle;

  if (v5 != (id)handledUserInterfaceStyle)
    -[CarDynamicBlurView _redraw](self, "_redraw");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarDynamicBlurView;
  -[CarDynamicBlurView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView window](self, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    -[MapsLightLevelController setWindowScene:](self->_lightLevelController, "setWindowScene:", v5);

    -[CarDynamicBlurView _redraw](self, "_redraw");
  }
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarDynamicBlurView;
  -[CarDynamicBlurView didMoveToSuperview](&v4, "didMoveToSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView superview](self, "superview"));

  if (v3)
    -[CarDynamicBlurView _redraw](self, "_redraw");
}

- (int64_t)correctedUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView superview](self, "superview"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView superview](self, "superview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v4, "userInterfaceStyle");
  }

  return (int64_t)v6;
}

- (void)_redraw
{
  -[CarDynamicBlurView _recalculateBlurModeWithInterfaceStyle:](self, "_recalculateBlurModeWithInterfaceStyle:", -[CarDynamicBlurView correctedUserInterfaceStyle](self, "correctedUserInterfaceStyle"));
}

- (void)_recalculateBlurModeWithInterfaceStyle:(int64_t)a3
{
  uint64_t v3;

  if (self->_shouldUseNightMode)
  {
    v3 = 3;
  }
  else if (a3 == 2)
  {
    v3 = 2;
  }
  else if (a3 == 1)
  {
    if (self->_context == 1)
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 1;
  }
  self->_handledUserInterfaceStyle = a3;
  -[CarDynamicBlurView setCurrentMode:](self, "setCurrentMode:", v3);
}

- (void)setCurrentMode:(int)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  CarDynamicBlurView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  objc_class *v16;
  NSString *v17;
  id v18;
  uint64_t currentMode;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  CarDynamicBlurView *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;

  if (self->_currentMode != a3)
  {
    v3 = *(_QWORD *)&a3;
    v5 = sub_1004332CC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      self->_currentMode = v3;
      -[CarDynamicBlurView _changeVisualEffect](self, "_changeVisualEffect");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dynamicBlurViewDidChangeBlurMode:", self->_currentMode);

      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = v13;
    v15 = objc_loadWeakRetained((id *)&v7->_delegate);
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    currentMode = self->_currentMode;
    if (currentMode >= 4)
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentMode));
    else
      v20 = *(&off_1011DB4F8 + currentMode);
    v21 = v20;
    if (v3 >= 4)
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v3));
    else
      v22 = *(&off_1011DB4F8 + (int)v3);
    *(_DWORD *)buf = 138544386;
    v25 = v14;
    v26 = 2112;
    v27 = v18;
    v28 = 2048;
    v29 = v7;
    v30 = 2112;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] CarBlur for %@ (%p) changed from %@ to %@", buf, 0x34u);

    goto LABEL_15;
  }
}

- (void)_changeVisualEffect
{
  id v3;
  NSObject *v4;
  CarDynamicBlurView *v5;
  int *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  objc_class *v14;
  NSString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  int currentMode;
  id v20;
  NSObject *v21;
  CarDynamicBlurView *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  CarVisualEffectView *v42;
  CarVisualEffectView *visualEffectView;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UIView *contentView;
  void *v51;
  void *v52;
  _BYTE buf[24];
  int *v54;
  __int16 v55;
  void *v56;

  v3 = sub_1004332CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v5 = self;
  v6 = (int *)v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
  v13 = v12;
  v14 = (objc_class *)objc_opt_class(v6);
  v15 = NSStringFromClass(v14);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  v17 = v6[22];
  if (v17 >= 4)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6[22]));
  else
    v18 = *(&off_1011DB4F8 + v17);
  *(_DWORD *)buf = 138544130;
  *(_QWORD *)&buf[4] = v13;
  *(_WORD *)&buf[12] = 2112;
  *(_QWORD *)&buf[14] = v16;
  *(_WORD *)&buf[22] = 2048;
  v54 = v6;
  v55 = 2112;
  v56 = v18;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ (%p) effect changed to %@", buf, 0x2Au);

LABEL_14:
  currentMode = self->_currentMode;
  if (currentMode == 3)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 0.800000012));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 30.0));
    v34 = +[CarVisualEffectView isDisablingBlur](CarVisualEffectView, "isDisablingBlur");
    v35 = 1.0;
    if (!v34)
      v35 = 0.939999998;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.109803922, v35));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect effectCompositingColor:](UIVisualEffect, "effectCompositingColor:", v36));

    *(_QWORD *)buf = v33;
    *(_QWORD *)&buf[8] = v32;
    *(_QWORD *)&buf[16] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 3));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect effectCombiningEffects:](UIVisualEffect, "effectCombiningEffects:", v38));

    goto LABEL_30;
  }
  if (currentMode != 2)
  {
    if (currentMode == 1)
    {
LABEL_35:
      v41 = sub_1008E718C();
      v40 = objc_claimAutoreleasedReturnValue(v41);
      goto LABEL_36;
    }
    v20 = sub_1004332CC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      goto LABEL_35;
    }
    v22 = self;
    v23 = (objc_class *)objc_opt_class(v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_23;
      }

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_23:

    v29 = v28;
    v30 = self->_currentMode;
    if (v30 >= 4)
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentMode));
    else
      v31 = *(&off_1011DB4F8 + v30);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v31;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] _blurEffectForMode called with invalid mode %@", buf, 0x16u);

    goto LABEL_34;
  }
  if (+[CarVisualEffectView isDisablingBlur](CarVisualEffectView, "isDisablingBlur"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.266666681, 0.298039228, 0.313725501, 1.0));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect effectCompositingColor:](UIVisualEffect, "effectCompositingColor:", v32));
LABEL_30:

    goto LABEL_37;
  }
  v40 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 18));
LABEL_36:
  v39 = (void *)v40;
LABEL_37:
  -[CarVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
  v42 = -[CarVisualEffectView initWithEffect:]([CarVisualEffectView alloc], "initWithEffect:", v39);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v42;

  -[CarVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = self->_currentMode;
  if (v44 >= 4)
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentMode));
  else
    v45 = *(&off_1011DB4F8 + v44);
  -[CarVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarVisualEffectView contentView](self->_visualEffectView, "contentView"));
  objc_msgSend(v46, "setClipsToBounds:", 1);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarVisualEffectView contentView](self->_visualEffectView, "contentView"));
  objc_msgSend(v47, "addSubview:", self->_contentView);

  -[CarDynamicBlurView _updateCornerValues](self, "_updateCornerValues");
  -[CarDynamicBlurView addSubview:](self, "addSubview:", self->_visualEffectView);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarVisualEffectView _maps_constraintsForCenteringInView:](self->_visualEffectView, "_maps_constraintsForCenteringInView:", self));
  objc_msgSend(v48, "addObjectsFromArray:", v49);

  contentView = self->_contentView;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarVisualEffectView contentView](self->_visualEffectView, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsForCenteringInView:](contentView, "_maps_constraintsForCenteringInView:", v51));
  objc_msgSend(v48, "addObjectsFromArray:", v52);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);
}

- (int)currentMode
{
  return self->_currentMode;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_lightLevelController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
