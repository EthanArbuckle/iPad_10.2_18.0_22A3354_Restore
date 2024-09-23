@implementation UIStatusBar_Placeholder

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;

  __UIStatusBarManagerForWindow(a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "defaultStatusBarHeightInOrientation:", a4);
    v11 = v10;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v11 = 20.0;
    if (!v13)
    {
      if (+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
        v14 = 20.0;
      else
        v14 = 44.0;
      if ((unint64_t)(a4 - 3) >= 2)
        v11 = v14;
      else
        v11 = 0.0;
    }
  }

  return v11;
}

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  id v6;
  int v7;
  int v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar_Placeholder;
  v6 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v12, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v9 = _UIInternalPreference_UIStatusBarPlaceholderHasColor;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIStatusBarPlaceholderHasColor)
      {
        while (v7 >= v9)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_UIStatusBarPlaceholderHasColor, (uint64_t)CFSTR("UIStatusBarPlaceholderHasColor"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v9 = _UIInternalPreference_UIStatusBarPlaceholderHasColor;
          if (v7 == _UIInternalPreference_UIStatusBarPlaceholderHasColor)
            return v6;
        }
        if (byte_1EDDA8324)
        {
          +[UIColor systemGreenColor](UIColor, "systemGreenColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setBackgroundColor:", v11);

        }
      }
    }
  }
  return v6;
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v8 = _requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced____s_category;
  if (!_requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced____s_category)
  {
    v8 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Changing the style on the status bar instance directly is not supported anymore, please update your app.", v10, 2u);
  }
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar_Placeholder;
  v6 = a4;
  v7 = a3;
  -[UIStatusBar_Base setStyleRequest:animationParameters:](&v11, sel_setStyleRequest_animationParameters_, v7, v6);
  v8 = objc_msgSend(v7, "style", v11.receiver, v11.super_class);
  v9 = objc_msgSend(v7, "legibilityStyle");
  objc_msgSend(v7, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBar_Placeholder _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v8, 0, v9, v10, v6, 0);
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Placeholder;
  v6 = a4;
  v7 = a3;
  -[UIStatusBar_Base setForegroundColor:animationParameters:](&v8, sel_setForegroundColor_animationParameters_, v7, v6);
  -[UIStatusBar_Placeholder _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", -[UIStatusBar_Base _requestStyle](self, "_requestStyle", v8.receiver, v8.super_class), 0, -[UIStatusBar_Base legibilityStyle](self, "legibilityStyle"), v7, v6, 0);

}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar_Placeholder;
  v6 = a4;
  -[UIStatusBar_Base setLegibilityStyle:animationParameters:](&v9, sel_setLegibilityStyle_animationParameters_, a3, v6);
  v7 = -[UIStatusBar_Base _requestStyle](self, "_requestStyle", v9.receiver, v9.super_class);
  -[UIStatusBar_Base foregroundColor](self, "foregroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar_Placeholder _requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:](self, "_requestStyle:partStyles:legibilityStyle:foregroundColor:animationParameters:forced:", v7, 0, a3, v8, v6, 0);

}

- (int64_t)currentStyle
{
  void *v2;
  int64_t v3;

  _UIStatusBarManagerForNoWindow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarStyle");

  return v3;
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)_setHidden:(BOOL)a3 animationParameters:(id)a4
{
  unint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIStatusBar_Placeholder;
  -[UIStatusBar_Base _setHidden:animationParameters:](&v7, sel__setHidden_animationParameters_, a3, a4);
  v4 = _setHidden_animationParameters____s_category;
  if (!_setHidden_animationParameters____s_category)
  {
    v4 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_setHidden_animationParameters____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Hiding the status bar instance directly is not supported anymore, please update your app.", v6, 2u);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
