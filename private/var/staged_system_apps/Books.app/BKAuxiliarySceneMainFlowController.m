@implementation BKAuxiliarySceneMainFlowController

- (id)presenterSceneController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneControllerForViewController:](BKAppDelegate, "sceneControllerForViewController:", v3));

  return v4;
}

- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, v4, 0);

}

- (id)presenterModalPresentingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "flowControllerModalPresentingViewController"));

  return v3;
}

- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setTransitioningDelegate:", self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000BB3F0;
  v16[3] = &unk_1008E96E8;
  v16[4] = self;
  v20 = v6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController presenterModalPresentingViewController](self, "presenterModalPresentingViewController"));
  v17 = v10;
  v18 = v8;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  v13 = objc_retainBlock(v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bc_descendentPresentedViewController"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bc_descendentPresentedViewController"));
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", v6, v13);

  }
  else
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }

}

- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void ***v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  BKAuxiliarySceneMainFlowController *v19;
  id v20;
  BOOL v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[BKAuxiliarySceneMainFlowController presenterVisibleViewControllerWillChangeAnimated:](self, "presenterVisibleViewControllerWillChangeAnimated:", v6);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000BB5D8;
  v17 = &unk_1008E7360;
  v10 = v8;
  v21 = v6;
  v19 = self;
  v20 = v9;
  v18 = v10;
  v11 = v9;
  v12 = objc_retainBlock(&v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bc_descendentPresentedViewController", v14, v15, v16, v17));
  if (v13)
    -[BKAuxiliarySceneMainFlowController presenterDismissModalController:animated:completion:](self, "presenterDismissModalController:animated:completion:", v13, v6, v12);
  else
    ((void (*)(void ***))v12[2])(v12);

}

- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_descendentPresentedViewController"));

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BB7A4;
    v12[3] = &unk_1008E7388;
    v12[4] = self;
    v14 = v4;
    v13 = v6;
    -[BKAuxiliarySceneMainFlowController presenterDismissModalController:animated:completion:](self, "presenterDismissModalController:animated:completion:", v9, v4, v12);

  }
  else
  {
    v10 = objc_retainBlock(v6);
    v11 = v10;
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);

  }
}

- (BOOL)presenterShouldOpenBookUsingLargeCover
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController presenterFirstVisibleChildConformingToProtocol:](self, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appLaunchCoordinator"));
    v6 = objc_msgSend(v5, "appLaunchCoordinatorHasAppLaunched");

    v3 = v6 ^ 1;
  }

  return v3;
}

- (BOOL)presenterCanShowStoreProductOnCurrentContent
{
  return 1;
}

- (void)presenterFinishModalTransitionsWithCompletion:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  objc_msgSend(v5, "mainFlowController:visibleViewControllerWillChangeAnimated:", self, v3);

}

- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  objc_msgSend(v5, "mainFlowController:visibleViewControllerDidChangeAnimated:", self, v3);

}

- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_firstVisibleChildConformingToProtocol:includePresented:", v4, 1));

  return v7;
}

- (id)presenterViewControllersConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BBA24;
  v10[3] = &unk_1008E9888;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "im_enumerateChildrenConformingToProtocol:block:", v4, v10);

  return v8;
}

- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  objc_msgSend(v5, "im_finishOngoingModalTransitionAnimations:", v4);

}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAuxiliarySceneMainFlowController presenterFirstVisibleChildConformingToProtocol:](self, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCUCoverEffectsEnvironment));
  v3 = objc_msgSend(v2, "coverEffectsNightMode");

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (BKAuxiliarySceneMainFlowControllerDelegate)delegate
{
  return (BKAuxiliarySceneMainFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
