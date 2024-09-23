@implementation _UISceneHostingUpdateStomperClientComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationFence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(v4, "setAnimationFence:", 0);
  objc_msgSend(v9, "settingsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsProperty:", sel_frame);

  if (v7)
  {
    objc_msgSend(v9, "mutableSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setFrame:", 0.0, 0.0);

  }
}

@end
