@implementation WatchQuickAction

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 activationCallback:(id)a4
{
  id v6;
  id v7;
  WatchQuickAction *v8;
  WatchQuickAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WatchQuickAction;
  v8 = -[WatchQuickAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[WatchQuickAction _commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:](v8, "_commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:", v6, 1, 0, 0, v7, 0);

  return v9;
}

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 activationCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  WatchQuickAction *v11;
  WatchQuickAction *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WatchQuickAction;
  v11 = -[WatchQuickAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[WatchQuickAction _commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:](v11, "_commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:", v8, 1, v9, 0, v10, 0);

  return v12;
}

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 hostingView:(id)a5 activationCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WatchQuickAction *v14;
  WatchQuickAction *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WatchQuickAction;
  v14 = -[WatchQuickAction init](&v17, sel_init);
  v15 = v14;
  if (v14)
    -[WatchQuickAction _commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:](v14, "_commonInitLocalizedTitle:quickActionType:targetView:hostingView:withQuickActivationCallback:withQuickActivationEndCallback:", v10, 1, v11, v12, v13, 0);

  return v15;
}

- (void)start
{
  -[WatchQuickAction startWithCallback:](self, "startWithCallback:", 0);
}

- (void)startWithCallback:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WatchQuickAction *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v13[0] = CFSTR("id");
  -[WatchQuickAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("started");
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WatchQuickAction started](self, "started"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  wqa_dump_call_stack(CFSTR("quick action start"), v7);

  -[WatchQuickAction _updateOverlaysIfNecessary](self, "_updateOverlaysIfNecessary");
  if (-[WatchQuickAction started](self, "started"))
  {
    if (v4)
      v4[2](v4, 1, 0);
  }
  else
  {
    -[WatchQuickAction setStarted:](self, "setStarted:", 1);
    +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerQuickActions:startupCallback:", v9, v4);

    -[WatchQuickAction viewToOverlay](self, "viewToOverlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WatchQuickAction viewToOverlay](self, "viewToOverlay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_wqa_registerQuickActionForBoundingPathChanges:", self);

    }
  }

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  WatchQuickAction *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("id");
  -[WatchQuickAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("started");
  v16[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WatchQuickAction started](self, "started"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  wqa_dump_call_stack(CFSTR("quick action cancel"), v5);

  if (-[WatchQuickAction started](self, "started"))
  {
    -[WatchQuickAction setStarted:](self, "setStarted:", 0);
    v6 = self;
    -[WatchQuickAction identifier](v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unregisterQuickActionIdentifiers:startupCallback:", v9, 0);

    }
    -[WatchQuickAction animationHandler](v6, "animationHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "quickActionDidBecomeInactive:", v6);
    -[WatchQuickAction viewToOverlay](v6, "viewToOverlay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WatchQuickAction viewToOverlay](v6, "viewToOverlay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_wqa_unregisterExistingQuickActionForBoundingPathChanges");

    }
  }
}

- (void)updateLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
  -[WatchQuickAction _updateOverlaysIfNecessary](self, "_updateOverlaysIfNecessary");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WatchQuickAction viewToOverlay](self, "viewToOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_wqa_unregisterExistingQuickActionForBoundingPathChanges");

  -[WatchQuickAction cancel](self, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)WatchQuickAction;
  -[WatchQuickAction dealloc](&v4, sel_dealloc);
}

- (void)_commonInitLocalizedTitle:(id)a3 quickActionType:(int64_t)a4 targetView:(id)a5 hostingView:(id)a6 withQuickActivationCallback:(id)a7 withQuickActivationEndCallback:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  NSString *identifier;
  void *v22;
  id activationCallback;
  NSString *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x24BDD1880];
  v18 = a7;
  objc_msgSend(v17, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v20;

  objc_storeStrong((id *)&self->_localizedTitle, a3);
  v22 = (void *)MEMORY[0x22E2EA5A8](v18);

  activationCallback = self->_activationCallback;
  self->_activationCallback = v22;

  *(_OWORD *)&self->_overlayCornerRadius = xmmword_22B0DFC30;
  self->_overlayInset.y = 2.0;
  -[WatchQuickAction setInternalQuickActionType:](self, "setInternalQuickActionType:", a4);
  -[WatchQuickAction setAllowsResizingAnimations:](self, "setAllowsResizingAnimations:", 1);
  if (v15)
  {
    -[WatchQuickAction _applyOverlayFromView:withHostingView:](self, "_applyOverlayFromView:withHostingView:", v15, v16);
    objc_msgSend(v15, "setQuickActionHostObserver:", self);
  }
  v24 = self->_identifier;
  v26 = CFSTR("id");
  v27[0] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  wqa_dump_call_stack(CFSTR("quick action init"), v25);

}

- (BOOL)isEqual:(id)a3
{
  WatchQuickAction *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WatchQuickAction *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WatchQuickAction identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WatchQuickAction identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[WatchQuickAction hostingView](self, "hostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WatchQuickAction localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WatchQuickAction hostingView](self, "hostingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WatchQuickAction hostingView](self, "hostingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WatchQuickAction identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@<%p>] title=%@, hostingView=[%@<%p>], id=\"%@\"), v6, self, v7, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WatchQuickAction identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@<%p>] title=%@, id=\"%@\"), v6, self, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v13;
}

- (void)setOverlayTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_overlayTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overlayTintColor, a3);
    -[WatchQuickAction _updateOverlaysIfNecessary](self, "_updateOverlaysIfNecessary");
  }

}

- (void)setOverlayCornerRadius:(double)a3
{
  if (self->_overlayCornerRadius != a3)
  {
    self->_overlayCornerRadius = a3;
    -[WatchQuickAction _updateOverlaysIfNecessary](self, "_updateOverlaysIfNecessary");
  }
}

- (void)setOverlayInset:(CGPoint)a3
{
  if (self->_overlayInset.x != a3.x || self->_overlayInset.y != a3.y)
  {
    self->_overlayInset = a3;
    -[WatchQuickAction _updateOverlaysIfNecessary](self, "_updateOverlaysIfNecessary");
  }
}

- (void)_updateOverlaysIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  -[WatchQuickAction viewToOverlay](self, "viewToOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WatchQuickAction viewToOverlay](self, "viewToOverlay");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WatchQuickAction hostingView](self, "hostingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WatchQuickAction _applyOverlayFromView:withHostingView:](self, "_applyOverlayFromView:withHostingView:", v5, v4);

  }
}

- (void)_applyOverlayFromView:(id)a3 withHostingView:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;

  v47 = a3;
  v6 = a4;
  -[WatchQuickAction setViewToOverlay:](self, "setViewToOverlay:", v47);
  if (v6)
    v7 = v6;
  else
    v7 = v47;
  v8 = v7;
  objc_msgSend(v47, "parentFocusEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "focusItemContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toCoordinateSpace:", v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[WatchQuickAction overlayInset](self, "overlayInset");
  v30 = v29;
  -[WatchQuickAction overlayInset](self, "overlayInset");
  v32 = v31;
  v48.origin.x = v22;
  v48.origin.y = v24;
  v48.size.width = v26;
  v48.size.height = v28;
  v49 = CGRectInset(v48, v30, v32);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  objc_msgSend(v47, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WatchQuickAction overlayCornerRadius](self, "overlayCornerRadius");
  if (v38 >= 0.0)
  {
    -[WatchQuickAction overlayCornerRadius](self, "overlayCornerRadius");
    goto LABEL_8;
  }
  objc_msgSend(v37, "cornerRadius");
  v39 = 8.0;
  if (v40 > 0.0)
  {
    objc_msgSend(v37, "cornerRadius");
LABEL_8:
    v39 = v41;
  }
  objc_msgSend(v37, "cornerRadius");
  if (v42 > 0.0
    && (objc_msgSend(v37, "cornerCurve"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BDE58E8]),
        v43,
        v44))
  {
    objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, v39);
    v45 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v39);
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v45;
  -[WatchQuickAction applyBezierPath:withHostingView:](self, "applyBezierPath:withHostingView:", v45, v8);

}

- (void)applyBezierPath:(id)a3 withHostingView:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[WatchQuickAction setVisualsToken:](self, "setVisualsToken:", -[WatchQuickAction visualsToken](self, "visualsToken") + 1);
  -[WatchQuickAction setHostingView:](self, "setHostingView:", v6);

  -[WatchQuickAction setPath:](self, "setPath:", v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WatchQuickAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WatchQuickAction internalQuickActionType](self, "internalQuickActionType"), CFSTR("quickActionType"));
  -[WatchQuickAction localizedTitle](self, "localizedTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedTitle"));

}

- (WatchQuickAction)initWithCoder:(id)a3
{
  id v4;
  WatchQuickAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedTitle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WatchQuickAction;
  v5 = -[WatchQuickAction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_internalQuickActionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("quickActionType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("localizedTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v8;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)activationCallback
{
  return self->_activationCallback;
}

- (WatchQuickActionAnimationHandler)animationHandler
{
  return (WatchQuickActionAnimationHandler *)objc_loadWeakRetained((id *)&self->_animationHandler);
}

- (void)setAnimationHandler:(id)a3
{
  objc_storeWeak((id *)&self->_animationHandler, a3);
}

- (UIView)viewToOverlay
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToOverlay);
}

- (void)setViewToOverlay:(id)a3
{
  objc_storeWeak((id *)&self->_viewToOverlay, a3);
}

- (UIView)hostingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostingView);
}

- (void)setHostingView:(id)a3
{
  objc_storeWeak((id *)&self->_hostingView, a3);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (int64_t)visualsToken
{
  return self->_visualsToken;
}

- (void)setVisualsToken:(int64_t)a3
{
  self->_visualsToken = a3;
}

- (int64_t)internalQuickActionType
{
  return self->_internalQuickActionType;
}

- (void)setInternalQuickActionType:(int64_t)a3
{
  self->_internalQuickActionType = a3;
}

- (WQAHostLifecycleObserver)hostLifecycleObserver
{
  return (WQAHostLifecycleObserver *)objc_loadWeakRetained((id *)&self->_hostLifecycleObserver);
}

- (void)setHostLifecycleObserver:(id)a3
{
  objc_storeWeak((id *)&self->_hostLifecycleObserver, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (UIColor)overlayTintColor
{
  return self->_overlayTintColor;
}

- (BOOL)allowsResizingAnimations
{
  return self->_allowsResizingAnimations;
}

- (void)setAllowsResizingAnimations:(BOOL)a3
{
  self->_allowsResizingAnimations = a3;
}

- (double)overlayCornerRadius
{
  return self->_overlayCornerRadius;
}

- (CGPoint)overlayInset
{
  double x;
  double y;
  CGPoint result;

  x = self->_overlayInset.x;
  y = self->_overlayInset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayTintColor, 0);
  objc_destroyWeak((id *)&self->_hostLifecycleObserver);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_hostingView);
  objc_destroyWeak((id *)&self->_viewToOverlay);
  objc_destroyWeak((id *)&self->_animationHandler);
  objc_storeStrong(&self->_activationCallback, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)serializedDataFromQuickAction:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

+ (id)quickActionFromSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v9;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)quickActionHostDidInvalidate
{
  id v3;

  -[WatchQuickAction hostLifecycleObserver](self, "hostLifecycleObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quickActionHostInvalidated:", self);

}

- (BOOL)canShowOverlays
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[WatchQuickAction quickActionHostingView](self, "quickActionHostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WatchQuickAction quickActionPrimaryView](self, "quickActionPrimaryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WatchQuickAction quickActionPath](self, "quickActionPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
