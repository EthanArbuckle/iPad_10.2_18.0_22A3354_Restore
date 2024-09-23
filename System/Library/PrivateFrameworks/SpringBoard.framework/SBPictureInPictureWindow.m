@implementation SBPictureInPictureWindow

- (SBPictureInPictureWindow)initWithWindowScene:(id)a3
{
  SBPictureInPictureWindow *v3;
  SBPictureInPictureWindow *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPictureInPictureWindow;
  v3 = -[SBPictureInPictureWindow initWithWindowScene:](&v7, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
  {
    -[SBPictureInPictureWindow layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisableUpdateMask:", 32);

  }
  return v4;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (void)setWindowScene:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPictureInPictureWindow;
  -[SBPictureInPictureWindow setWindowScene:](&v5, sel_setWindowScene_, a3);
  -[SBPictureInPictureWindow rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteWindowSceneDidChange");

}

- (void)setRootViewController:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7.receiver = self;
  v7.super_class = (Class)SBPictureInPictureWindow;
  -[SBPictureInPictureWindow setRootViewController:](&v7, sel_setRootViewController_, v5);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBPictureInPictureWindow *v5;
  void *v6;
  SBPictureInPictureWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPictureInPictureWindow;
  -[SBPictureInPictureWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBPictureInPictureWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[SBPictureInPictureWindow rootViewController](self, "rootViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "view"),
        v7 = (SBPictureInPictureWindow *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {

    v5 = 0;
  }
  return v5;
}

@end
