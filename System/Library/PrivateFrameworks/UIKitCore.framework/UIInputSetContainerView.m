@implementation UIInputSetContainerView

- (void)setCenter:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;
  objc_super v5;

  v3 = a3.x + self->_offsetOrigin.x;
  v4 = a3.y + self->_offsetOrigin.y;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSetContainerView;
  -[UIView setCenter:](&v5, sel_setCenter_, v3, v4);
}

- (id)_inheritedRenderConfig
{
  return self->_renderConfig;
}

- (void)performWithoutGeometryObserverNotifications:(id)a3
{
  self->_disableGeometryObserverNotifications = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_disableGeometryObserverNotifications = 0;
}

- (void)addSubview:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputSetContainerView;
  -[UIView addSubview:](&v3, sel_addSubview_, a3);
}

+ (BOOL)_shouldHitTestInputViewFirst
{
  return 0;
}

- (UIInputSetContainerView)initWithFrame:(CGRect)a3
{
  UIInputSetContainerView *v3;
  UIInputSetContainerView *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInputSetContainerView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v10.receiver = v3;
    v10.super_class = (Class)UIInputSetContainerView;
    -[UIView _inheritedRenderConfig](&v10, sel__inheritedRenderConfig);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    -[UIInputSetContainerView _setRenderConfig:](v4, "_setRenderConfig:", v8);
  }
  return v4;
}

- (void)_setRenderConfig:(id)a3
{
  UIKBRenderConfig *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIKBRenderConfig *renderConfig;
  UIKBRenderConfig *v11;
  void *v12;
  objc_super v13;

  v4 = (UIKBRenderConfig *)a3;
  if (-[UIKBRenderConfig lightKeyboard](v4, "lightKeyboard"))
    v5 = 1;
  else
    v5 = 2;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteInputViewHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "inputViewWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", v5);

  }
  else
  {
    -[UIView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v5);
  }
  renderConfig = self->_renderConfig;
  self->_renderConfig = v4;
  v11 = v4;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateGuideBackdropRenderConfig:animated:", v11, 0);

  v13.receiver = self;
  v13.super_class = (Class)UIInputSetContainerView;
  -[UIView _setRenderConfig:](&v13, sel__setRenderConfig_, v11);

}

+ (BOOL)_notifyOnExplicitLayout
{
  return 0;
}

- (void)didAddSubview:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInputSetContainerView;
  -[UIView didAddSubview:](&v6, sel_didAddSubview_, a3);
  -[UIView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "_sortSubviewsOfView:", self);
}

- (void)setFrame:(CGRect)a3
{
  CGFloat v3;
  CGFloat v4;
  objc_super v5;

  v3 = a3.origin.x + self->_offsetOrigin.x;
  v4 = a3.origin.y + self->_offsetOrigin.y;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSetContainerView;
  -[UIView setFrame:](&v5, sel_setFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (BOOL)hasHostedViews
{
  return -[NSMutableDictionary count](self->_hostedViews, "count") != 0;
}

- (void)dealloc
{
  NSMutableDictionary *hostedViews;
  objc_super v4;

  hostedViews = self->_hostedViews;
  self->_hostedViews = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIInputSetContainerView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)_didRemoveSubview:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  NSMutableDictionary *hostedViews;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInputSetContainerView;
  v4 = a3;
  -[UIView _didRemoveSubview:](&v8, sel__didRemoveSubview_, v4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_hostedViews, "objectForKey:", v5);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_hostedViews, "removeObjectForKey:", v5);
    if (!-[NSMutableDictionary count](self->_hostedViews, "count"))
    {
      hostedViews = self->_hostedViews;
      self->_hostedViews = 0;

    }
    v6[2](v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViews, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

- (id)_inputWindowController
{
  void *v2;
  void *v3;
  id v4;

  -[UIView nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (CGRect)_accessoryViewFrame
{
  void *v2;
  void *v3;
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
  CGRect result;

  -[UIInputSetContainerView _inputWindowController](self, "_inputWindowController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_setAccessoryViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIInputSetContainerView _inputWindowController](self, "_inputWindowController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputAccessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);

  -[UIInputSetContainerView _inputWindowController](self, "_inputWindowController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostingNeedsLayout");

}

- (UIScreen)hostingScreen
{
  void *v2;
  void *v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScreen *)v3;
}

- (void)addHostedView:(id)a3 withViewRemovalHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *hostedViews;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("subview must not be nil"));
    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("removalHandler must not be nil"));
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_hostedViews, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  hostedViews = self->_hostedViews;
  if (!hostedViews)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_hostedViews;
    self->_hostedViews = v11;

    hostedViews = self->_hostedViews;
  }
  v13 = (void *)objc_msgSend(v6, "copy");
  -[NSMutableDictionary setObject:forKey:](hostedViews, "setObject:forKey:", v13, v7);

  -[UIInputSetContainerView addSubview:](self, "addSubview:", v14);
}

- (BOOL)_disableGeometryObserverNotification
{
  return self->_disableGeometryObserverNotifications;
}

- (void)setOffsetOrigin:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  -[UIView origin](self, "origin");
  v7 = v6 - self->_offsetOrigin.x;
  v9 = v8 - self->_offsetOrigin.y;
  self->_offsetOrigin.x = x;
  self->_offsetOrigin.y = y;
  -[UIView setOrigin:](self, "setOrigin:", v7, v9);
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (CGPoint)offsetOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_offsetOrigin.x;
  y = self->_offsetOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
