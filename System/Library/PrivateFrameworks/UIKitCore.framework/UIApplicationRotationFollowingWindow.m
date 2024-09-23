@implementation UIApplicationRotationFollowingWindow

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (id)_topMostWindow
{
  if (!self->_limitToWindowLevel)
    self = 0;
  return self;
}

- (BOOL)isInterfaceAutorotationDisabled
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  if (-[UIWindow isInterfaceAutorotationDisabled](&v8, sel_isInterfaceAutorotationDisabled))
    return 1;
  -[UIWindow rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationRotationFollowingWindow _topMostWindow](self, "_topMostWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safeWindowForAutorotationBelowWindow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "isInterfaceAutorotationDisabled");

  return v3;
}

- (void)setLimitToWindowLevel:(BOOL)a3
{
  self->_limitToWindowLevel = a3;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  v5 = -[UIWindow _initWithFrame:debugName:windowScene:](&v8, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_commonApplicationRotationFollowingWindowInit");
  return v6;
}

- (void)_commonApplicationRotationFollowingWindowInit
{
  -[UIWindow _setWindowControlsStatusBarOrientation:](self, "_setWindowControlsStatusBarOrientation:", 0);
  InsertWindow(self);
}

- (void)applicationWindow:(id)a3 didRotateWithOrientation:(int64_t)a4 duration:(double)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UIWindow rootViewController](self, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIWindow windowScene](self, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

      }
      else
      {
        objc_msgSend(v16, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWindow windowScene](self, "windowScene");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
          goto LABEL_3;
      }
      objc_msgSend(v16, "screen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow screen](self, "screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_3;
      -[UIWindow screen](self, "screen");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 != v16)
        goto LABEL_3;
    }
    if (-[UIApplicationRotationFollowingWindow _shouldAutorotateToInterfaceOrientation:](self, "_shouldAutorotateToInterfaceOrientation:", a4))
    {
      -[UIWindow rootViewController](self, "rootViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:](self, "_setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:", v15, a4, 0, 0, 1, a5);

    }
  }
LABEL_3:

}

- (void)setPriorityLevel:(int64_t)a3
{
  UIApplicationRotationFollowingWindow *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_priorityLevel = a3;
  v3 = self;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  GetRotationFollowingWindows();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      v10 = v6 + v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        if (*(UIApplicationRotationFollowingWindow **)(*((_QWORD *)&v12 + 1) + 8 * v9) == v3)
        {

          if (v7 + v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            GetRotationFollowingWindows();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removePointerAtIndex:", v7 + v9, (_QWORD)v12);

          }
          goto LABEL_12;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }

LABEL_12:
  InsertWindow(v3);

}

- (int64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  objc_super v15;
  char v16;

  if (self->super._viewOrientation)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationRotationFollowingWindow _topMostWindow](self, "_topMostWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_safeWindowForAutorotationBelowWindow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_safeViewControllerForRotationWithDismissCheck:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (a3 && objc_msgSend(v9, "_overrideInterfaceOrientationMechanics") == a3)
      {
        v10 = 1;
        goto LABEL_14;
      }
      v16 = 0;
      v11 = objc_msgSend(v7, "_shouldAutorotateToInterfaceOrientation:checkForDismissal:isRotationDisabled:", a3, 1, &v16);
      objc_msgSend(v9, "_existingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v13, "interfaceOrientation") == a3;
      if (!v16)
      {
        if ((v11 & 1) != 0 || objc_msgSend(v9, "__supportedInterfaceOrientations"))
          v10 = v11;

        goto LABEL_14;
      }

      if (v13)
      {
LABEL_14:

        return v10;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)UIApplicationRotationFollowingWindow;
    v10 = -[UIWindow _shouldAutorotateToInterfaceOrientation:](&v15, sel__shouldAutorotateToInterfaceOrientation_, a3);
    goto LABEL_14;
  }
  return 1;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (UIApplicationRotationFollowingWindow)init
{
  UIApplicationRotationFollowingWindow *v2;
  UIApplicationRotationFollowingWindow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIApplicationRotationFollowingWindow;
  v2 = -[UIWindow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIApplicationRotationFollowingWindow _commonApplicationRotationFollowingWindowInit](v2, "_commonApplicationRotationFollowingWindowInit");
  return v3;
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIApplicationRotationFollowingWindow;
  v4 = -[UIWindow _initWithFrame:attached:](&v7, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_commonApplicationRotationFollowingWindowInit");
  return v5;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  v5 = -[UIWindow _initWithFrame:debugName:attached:](&v8, sel__initWithFrame_debugName_attached_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_commonApplicationRotationFollowingWindowInit");
  return v6;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIApplicationRotationFollowingWindow;
  v6 = -[UIWindow _initWithFrame:debugName:scene:attached:](&v9, sel__initWithFrame_debugName_scene_attached_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "_commonApplicationRotationFollowingWindowInit");
  return v7;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIApplicationRotationFollowingWindow;
  v5 = -[UIWindow _initWithFrame:debugName:displayConfiguration:](&v8, sel__initWithFrame_debugName_displayConfiguration_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_commonApplicationRotationFollowingWindowInit");
  return v6;
}

- (UIApplicationRotationFollowingWindow)initWithWindowScene:(id)a3
{
  UIApplicationRotationFollowingWindow *v3;
  UIApplicationRotationFollowingWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIApplicationRotationFollowingWindow;
  v3 = -[UIWindow initWithWindowScene:](&v6, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
    -[UIApplicationRotationFollowingWindow _commonApplicationRotationFollowingWindowInit](v3, "_commonApplicationRotationFollowingWindowInit");
  return v4;
}

- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Rotation error: %@ %@ returned a UIApplicationRotationFollowingWindow %@"), v6, v7, self);

  return 0;
}

- (BOOL)limitToWindowLevel
{
  return self->_limitToWindowLevel;
}

@end
