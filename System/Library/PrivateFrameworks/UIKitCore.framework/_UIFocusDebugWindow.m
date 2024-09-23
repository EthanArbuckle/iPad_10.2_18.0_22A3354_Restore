@implementation _UIFocusDebugWindow

+ (id)moduleClasses
{
  if (qword_1ECD7EB88 != -1)
    dispatch_once(&qword_1ECD7EB88, &__block_literal_global_315);
  return (id)qword_1ECD7EB80;
}

+ (BOOL)hasAnyModules
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "moduleClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (_UIFocusDebugWindow)initWithWindowScene:(id)a3
{
  id v4;
  _UIFocusDebugWindow *v5;
  _UIFocusDebugWindow *v6;
  void *v7;
  void *v8;
  uint64_t i;
  _UIFocusDebugModuleContainer *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *cacheModules;
  UILongPressGestureRecognizer *v36;
  _UIFocusDebugWindow *v38;
  id v39;
  id obj;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  void *v62;
  _QWORD v63[4];
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_UIFocusDebugWindow;
  v5 = -[UIWindow initWithWindowScene:](&v61, sel_initWithWindowScene_, v4);
  v6 = v5;
  if (v5)
  {
    v39 = v4;
    -[UIWindow setWindowLevel:](v5, "setWindowLevel:", 16000000.0);
    -[_UIFocusDebugWindow _updateTimer](v6, "_updateTimer");
    v7 = (void *)objc_opt_new();
    -[UIView bounds](v6, "bounds");
    objc_msgSend(v7, "setFrame:", 10.0, 30.0, 320.0, CGRectGetHeight(v66));
    objc_msgSend(v7, "setAutoresizingMask:", 16);
    -[UIView addSubview:](v6, "addSubview:", v7);
    objc_storeStrong((id *)&v6->_scrollView, v7);
    v8 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v38 = v6;
    objc_msgSend((id)objc_opt_class(), "moduleClasses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = v7;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v45)
    {
      v43 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v58 != v43)
            objc_enumerationMutation(obj);
          v56 = objc_alloc_init(*(Class *)(*((_QWORD *)&v57 + 1) + 8 * i));
          v10 = -[_UIFocusDebugModuleContainer initWithModule:]([_UIFocusDebugModuleContainer alloc], "initWithModule:", v56);
          -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v7, "addSubview:", v10);
          -[UIView widthAnchor](v10, "widthAnchor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "widthAnchor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "constraintEqualToAnchor:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v14) = 1140457472;
          objc_msgSend(v13, "setPriority:", v14);
          v46 = (void *)MEMORY[0x1E0D156E0];
          v55 = v13;
          v63[0] = v13;
          -[UIView leadingAnchor](v10, "leadingAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "contentLayoutGuide");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "leadingAnchor");
          v54 = v15;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "constraintEqualToAnchor:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = v51;
          -[UIView trailingAnchor](v10, "trailingAnchor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "contentLayoutGuide");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "trailingAnchor");
          v50 = v16;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "constraintEqualToAnchor:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v63[2] = v47;
          -[UIView topAnchor](v10, "topAnchor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bottomAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (uint64_t)v20;
          if (!v20)
          {
            objc_msgSend(v7, "contentLayoutGuide");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "topAnchor");
            v21 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v21;
          }
          objc_msgSend(v8, "lastObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            v23 = 10.0;
          else
            v23 = 0.0;
          objc_msgSend(v17, "constraintEqualToAnchor:constant:", v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v63[3] = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "activateConstraints:", v25);

          if (!v20)
          {

          }
          objc_msgSend(v8, "addObject:", v56);

          v7 = v44;
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v45);
    }

    if (objc_msgSend(v8, "count"))
    {
      v26 = (void *)MEMORY[0x1E0D156E0];
      objc_msgSend(v8, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "superview");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentLayoutGuide");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activateConstraints:", v33);

      v7 = v44;
    }
    v34 = objc_msgSend(v8, "copy");
    v6 = v38;
    cacheModules = v38->_cacheModules;
    v38->_cacheModules = (NSArray *)v34;

    v36 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v38, sel_drag_);
    -[UILongPressGestureRecognizer setNumberOfTapsRequired:](v36, "setNumberOfTapsRequired:", 1);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v36, "setMinimumPressDuration:", 0.2);
    -[UIView addGestureRecognizer:](v38, "addGestureRecognizer:", v36);

    v4 = v39;
  }

  return v6;
}

- (void)drag:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  if (v9 == 2)
  {
    v10 = v6 - self->_lastDragPoint.x;
    v11 = v8 - self->_lastDragPoint.y;
    -[UIView frame](self->_scrollView, "frame");
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v10 + v12, v11 + v13);
  }
  self->_lastDragPoint.x = v6;
  self->_lastDragPoint.y = v8;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusDebugWindow;
  -[UIWindow setHidden:](&v4, sel_setHidden_, a3);
  -[_UIFocusDebugWindow _updateTimer](self, "_updateTimer");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UIFocusDebugWindow *v5;
  _UIFocusDebugWindow *v6;
  _UIFocusDebugWindow *v7;
  _UIFocusDebugWindow *v8;
  void *v9;
  uint64_t v10;
  _UIFocusDebugWindow *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIFocusDebugWindow;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UIFocusDebugWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    v11 = 0;
  }
  else
  {
    v7 = v5;
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v9, "superview");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
        if (!v10)
        {
          v8 = 0;
          break;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v11 = v8;

  }
  return v11;
}

- (BOOL)_shouldInformFocusAboutBecomingVisible
{
  return 0;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)_updateTimer
{
  NSTimer **p_timer;
  id WeakRetained;
  void *v5;
  id v6;

  p_timer = &self->_timer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_timer);
  objc_msgSend(WeakRetained, "invalidate");

  if (!-[UIView isHidden](self, "isHidden"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__update_, 0, 1, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_timer, v5);

    v6 = objc_loadWeakRetained((id *)p_timer);
    -[_UIFocusDebugWindow _update:](self, "_update:", v6);

  }
}

- (void)_update:(id)a3
{
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = _UIKitProcessIsBeingDebugged() ^ 1;
  -[UIView setHidden:](self->_scrollView, "setHidden:", v4);
  if ((v4 & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_cacheModules;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "update", (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_cacheModules, 0);
  objc_destroyWeak((id *)&self->_timer);
}

@end
