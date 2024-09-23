@implementation BKBookSceneMainViewController

- (id)modalPresentingViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSceneMainViewController rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  v4 = objc_opt_class(UIViewController);
  v5 = BUClassAndProtocolCast(v3, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = v6;

    v2 = v7;
  }

  return v2;
}

- (BKAuxiliarySceneMainFlowController)mainFlowController
{
  BKAuxiliarySceneMainFlowController *mainFlowController;
  BKAuxiliarySceneMainFlowController *v4;
  BKAuxiliarySceneMainFlowController *v5;

  mainFlowController = self->_mainFlowController;
  if (!mainFlowController)
  {
    v4 = objc_alloc_init(BKAuxiliarySceneMainFlowController);
    v5 = self->_mainFlowController;
    self->_mainFlowController = v4;

    -[BKAuxiliarySceneMainFlowController setDelegate:](self->_mainFlowController, "setDelegate:", self);
    mainFlowController = self->_mainFlowController;
  }
  return mainFlowController;
}

- (id)rootViewController
{
  BKBookSceneMainViewController *v2;
  uint64_t v3;
  void *v4;
  BKBookSceneMainViewController *v5;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[BKBookSceneMainViewController parentViewController](v2, "parentViewController"));
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = v4;

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSceneMainViewController parentViewController](v5, "parentViewController"));
      v2 = v5;
    }
    while (v4);
  }
  else
  {
    v5 = v2;
  }
  return v5;
}

- (id)flowControllerModalPresentingViewController
{
  return -[BKBookSceneMainViewController modalPresentingViewController](self, "modalPresentingViewController");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012FA28;
  v9[3] = &unk_1008E8308;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);
  v8.receiver = self;
  v8.super_class = (Class)BKBookSceneMainViewController;
  -[BKBookSceneMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)setMainFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_mainFlowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainFlowController, 0);
}

@end
