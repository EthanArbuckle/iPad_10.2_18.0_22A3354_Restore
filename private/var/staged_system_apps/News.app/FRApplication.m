@implementation FRApplication

- (void)registerPlatformSpecificLaunchOptions:(id)a3 transitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, const UIApplicationLaunchOptionsKey);

  v12 = (void (**)(id, void *, const UIApplicationLaunchOptionsKey))a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplication launchURLAction](self, "launchURLAction"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplication launchURLAction](self, "launchURLAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
    v12[2](v12, v9, UIApplicationLaunchOptionsURLKey);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplication launchURLAction](self, "launchURLAction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));
    objc_msgSend(v6, "setActions:", v11);

  }
}

- (FRApplication)init
{
  FRApplication *v2;
  FRApplication *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  UIOpenURLAction *v8;
  UIOpenURLAction *launchURLAction;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FRApplication;
  v2 = -[FRApplication init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->shouldChangeWindowFrameSize = 0;
    v4 = NewsCoreUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("news.ppt.extendedLaunchURL")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
      v8 = (UIOpenURLAction *)objc_msgSend(objc_alloc((Class)UIOpenURLAction), "initWithURL:", v7);
      launchURLAction = v3->_launchURLAction;
      v3->_launchURLAction = v8;

    }
  }
  return v3;
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplication launchURLAction](self, "launchURLAction"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplication launchURLAction](self, "launchURLAction"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
    objc_msgSend(v12, "setActions:", v16);

  }
  if (+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "workspace:didCreateScene:withTransitionContext:completion:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)FRApplication;
    -[FRApplication workspace:didCreateScene:withTransitionContext:completion:](&v17, "workspace:didCreateScene:withTransitionContext:completion:", v10, v11, v12, v13);
  }

}

- (id)_extendLaunchTest
{
  return CFSTR("ExtendedLaunch");
}

- (UIOpenURLAction)launchURLAction
{
  return self->_launchURLAction;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (void)sendEvent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRApplication;
  -[FRApplication sendEvent:](&v3, "sendEvent:", a3);
}

- (BOOL)shouldChangeWindowFrameSize
{
  return self->shouldChangeWindowFrameSize;
}

- (void)setShouldChangeWindowFrameSize:(BOOL)a3
{
  self->shouldChangeWindowFrameSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURLAction, 0);
}

@end
