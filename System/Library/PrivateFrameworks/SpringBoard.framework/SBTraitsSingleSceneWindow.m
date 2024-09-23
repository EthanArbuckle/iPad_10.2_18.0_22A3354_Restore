@implementation SBTraitsSingleSceneWindow

- (id)rootViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTraitsSingleSceneWindow;
  -[SBTraitsSingleSceneWindow rootViewController](&v3, sel_rootViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setRootViewController:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSingleSceneWindow.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootViewController == nil || [rootViewController isKindOfClass:[SBTraitsOrientedContentViewController class]]"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SBTraitsSingleSceneWindow;
  -[SBTraitsSingleSceneWindow setRootViewController:](&v7, sel_setRootViewController_, v5);

}

- (SBTraitsSingleSceneWindow)initWithWindowScene:(id)a3
{
  SBTraitsSingleSceneWindow *v3;
  SBTraitsSingleSceneWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTraitsSingleSceneWindow;
  v3 = -[SBTraitsSingleSceneWindow initWithWindowScene:](&v6, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_sceneContentVisible = 1;
    -[SBTraitsSingleSceneWindow setAutorotates:forceUpdateInterfaceOrientation:](v3, "setAutorotates:forceUpdateInterfaceOrientation:", 0, 1);
    -[SBTraitsSingleSceneWindow beginDisablingInterfaceAutorotation](v4, "beginDisablingInterfaceAutorotation");
  }
  return v4;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBTraitsSingleSceneWindow *v5;
  SBTraitsSingleSceneWindow *v6;
  SBTraitsSingleSceneWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsSingleSceneWindow;
  -[SBTraitsSingleSceneWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBTraitsSingleSceneWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (BOOL)isContentHidden
{
  return !self->_sceneContentVisible;
}

- (BOOL)isSceneContentVisible
{
  return self->_sceneContentVisible;
}

- (void)setSceneContentVisible:(BOOL)a3
{
  self->_sceneContentVisible = a3;
}

@end
