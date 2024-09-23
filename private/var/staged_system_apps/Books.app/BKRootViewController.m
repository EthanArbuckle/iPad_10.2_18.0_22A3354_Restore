@implementation BKRootViewController

- (id)flowControllers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController rootViewController](self, "rootViewController"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___IMFlowControllerHosting, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flowControllers"));

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController rootViewController](self, "rootViewController"));

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController rootViewController](self, "rootViewController"));
    v7 = objc_msgSend(v6, "supportedInterfaceOrientations");

    return (unint64_t)v7;
  }
  else if (isPad(v4, v5))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKRootViewController;
  -[BKRootViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[TUISyncLayoutController flush](self->_syncLayoutController, "flush");
}

- (void)setRootViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_rootViewController;
  UIViewController *rootViewController;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIViewController *v22;

  v5 = (UIViewController *)a3;
  p_rootViewController = &self->_rootViewController;
  rootViewController = self->_rootViewController;
  v22 = v5;
  if (rootViewController != v5)
  {
    -[UIViewController willMoveToParentViewController:](rootViewController, "willMoveToParentViewController:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_rootViewController, "view"));
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](*p_rootViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_rootViewController, a3);
    -[BKRootViewController addChildViewController:](self, "addChildViewController:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController view](self, "view"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v22, "view"));
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v22, "view"));
    objc_msgSend(v19, "setAutoresizingMask:", 18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v22, "view"));
    objc_msgSend(v20, "addSubview:", v21);

    -[UIViewController didMoveToParentViewController:](v22, "didMoveToParentViewController:", self);
    -[UIViewController setOverrideUserInterfaceStyle:](*p_rootViewController, "setOverrideUserInterfaceStyle:", -[BKRootViewController _computedUserInterfaceStyle](self, "_computedUserInterfaceStyle"));
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKRootViewController;
  -[BKRootViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKRootViewController view](self, "view", a3));
  objc_msgSend(v3, "setNeedsLayout");

}

- (BKRootViewController)init
{
  BKRootViewController *v2;
  BKRootViewController *v3;
  TUISyncLayoutController *v4;
  TUISyncLayoutController *syncLayoutController;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKRootViewController;
  v2 = -[BKRootViewController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[BKRootViewController setDefinesPresentationContext:](v2, "setDefinesPresentationContext:", 1);
    v4 = (TUISyncLayoutController *)objc_msgSend(objc_alloc((Class)TUISyncLayoutController), "initWithDelegate:", v3);
    syncLayoutController = v3->_syncLayoutController;
    v3->_syncLayoutController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "_userInterfaceStyleDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  }
  return v3;
}

- (int64_t)_computedUserInterfaceStyle
{
  if (UIAccessibilityIsInvertColorsEnabled())
    return 2;
  else
    return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)BKRootViewController;
  -[BKRootViewController dealloc](&v4, "dealloc");
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  BKRootViewController *v3;
  uint64_t v4;
  void *v5;
  BKRootViewController *v6;
  id v7;
  BKRootViewController *v8;

  v3 = (BKRootViewController *)objc_claimAutoreleasedReturnValue(-[BKRootViewController presentedViewController](self, "presentedViewController"));
  if (v3
    && ((v4 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, v3),
         v5 = (void *)objc_claimAutoreleasedReturnValue(v4),
         v5,
         v6 = v3,
         v5)
     || (v7 = -[BKRootViewController modalPresentationStyle](v3, "modalPresentationStyle"), v6 = self, v7 == (id)2)))
  {
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  UIViewController *modalSheetVC;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  BKRootViewController *v15;
  id v16;
  BOOL v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController presentedViewController](self, "presentedViewController"));
  modalSheetVC = self->_modalSheetVC;
  self->_modalSheetVC = 0;

  if (v10 && objc_msgSend(v10, "modalPresentationStyle") == (id)2)
  {
    objc_storeStrong((id *)&self->_modalSheetVC, v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000775EC;
    v13[3] = &unk_1008E7360;
    v14 = v8;
    v17 = v6;
    v15 = self;
    v16 = v9;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v6, v13);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BKRootViewController;
    -[BKRootViewController bc_presentCardViewController:animated:completion:](&v12, "bc_presentCardViewController:animated:completion:", v8, v6, v9);
  }

}

- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  BKRootViewController *v10;
  id v11;
  BOOL v12;

  v5 = a4;
  v9[1] = 3221225472;
  v9[2] = sub_1000776D8;
  v9[3] = &unk_1008E7388;
  v12 = a4;
  v10 = self;
  v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)BKRootViewController;
  v9[0] = _NSConcreteStackBlock;
  v7 = v11;
  -[BKRootViewController bc_dismissCardViewController:animated:completion:](&v8, "bc_dismissCardViewController:animated:completion:", a3, v5, v9);

}

- (BOOL)shouldAutorotate
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController rootViewController](self, "rootViewController"));
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (void)_userInterfaceStyleDidChange:(id)a3
{
  int64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = -[BKRootViewController _computedUserInterfaceStyle](self, "_computedUserInterfaceStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController rootViewController](self, "rootViewController"));
    objc_msgSend(v6, "setOverrideUserInterfaceStyle:", v5);

  }
  else
  {
    -[BKRootViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v7, 0);
  }

}

- (id)analyticsSessionHost
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneControllerForViewController:", self));

  v5 = objc_opt_class(BKSceneController);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsSessionHost"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v11 = v10;

  return v11;
}

- (id)_defaultCollectionIDForBehavior:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1009F4D98;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1009F4D98, &stru_1008E73C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1009F4D90, "objectForKeyedSubscript:", v4));

  return v5;
}

- (BOOL)_behaviorIsAllowed:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController _defaultCollectionIDForBehavior:](self, "_defaultCollectionIDForBehavior:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v6 = a3;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKRootViewController _defaultCollectionIDForBehavior:](self, "_defaultCollectionIDForBehavior:", a4));
  if (v46)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDragSession"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionController"));

      v9 = objc_opt_new(NSMutableArray);
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v44 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reverseObjectEnumerator"));

      obj = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
            v17 = objc_opt_class(BKLibraryAsset);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localObject"));
            v19 = BUDynamicCast(v17, v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

            v21 = objc_opt_class(BSUIItemDescription);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localObject"));
            v23 = BUDynamicCast(v21, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

            v25 = objc_opt_class(BCAssetDragInfo);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localObject"));
            v27 = BUDynamicCast(v25, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "assetID"));
            v30 = objc_msgSend(v29, "length");

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "assetID"));
              v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "libraryAssetOnMainQueueWithAssetID:", v32));

              v20 = (void *)v33;
            }
            if (v20)
            {
              -[NSMutableArray addObject:](v9, "addObject:", v20);
            }
            else if (v24)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "storeID"));
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_100077E70;
              v50[3] = &unk_1008E73F0;
              v51 = v24;
              v52 = v46;
              objc_msgSend(v45, "addStoreID:toCollectionID:forceToTop:completion:", v34, v52, 1, v50);

            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        }
        while (v13);
      }

      if (-[NSMutableArray count](v9, "count"))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "collectionProvider"));

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "collectionOnMainQueueWithCollectionID:error:", v46, 0));
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100077EC0;
        v48[3] = &unk_1008E7418;
        v49 = v46;
        objc_msgSend(v45, "addBooks:toCollection:forceToTop:completion:", v9, v37, 1, v48);

      }
      v6 = v44;
    }
    else
    {
      v38 = sub_10012A4BC();
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = sub_10012B6D8(v6, v39);

      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sceneControllerForViewController:", self));

        v43 = objc_msgSend(v42, "newShowURLTransaction");
        sub_10012A7FC(v6, v46, v43);
        if (sub_10012B530(v6))
          sub_10012A708(v6);

      }
    }
  }

}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v6 = a3;
  if (-[BKRootViewController _behaviorIsAllowed:](self, "_behaviorIsAllowed:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDragSession"));

    if (v7)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = v6;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
      v9 = objc_msgSend((id)v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation((id)v8);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v14 = objc_opt_class(BKLibraryAsset);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localObject"));
            v16 = BUDynamicCast(v14, v15);
            v17 = objc_claimAutoreleasedReturnValue(v16);

            v18 = objc_opt_class(BSUIItemDescription);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localObject"));
            v20 = BUDynamicCast(v18, v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);

            v22 = objc_opt_class(BCAssetDragInfo);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localObject"));
            v24 = BUDynamicCast(v22, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "assetID"));
            v27 = objc_msgSend(v26, "length");

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "assetID"));
              v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "libraryAssetOnMainQueueWithAssetID:", v29));

              v17 = v30;
            }

            if (v17 | v21)
            {

              LOBYTE(v8) = 1;
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend((id)v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v10)
            continue;
          break;
        }
      }

      LOBYTE(v8) = 0;
LABEL_16:
      v6 = v34;
    }
    else
    {
      v31 = sub_10012A350();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v8 = objc_msgSend(v6, "hasItemsConformingToTypeIdentifiers:", v32);

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (UIViewController)modalSheetVC
{
  return self->_modalSheetVC;
}

- (void)setModalSheetVC:(id)a3
{
  objc_storeStrong((id *)&self->_modalSheetVC, a3);
}

- (UIViewController)fakeAudiobookVC
{
  return self->_fakeAudiobookVC;
}

- (void)setFakeAudiobookVC:(id)a3
{
  objc_storeStrong((id *)&self->_fakeAudiobookVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeAudiobookVC, 0);
  objc_storeStrong((id *)&self->_modalSheetVC, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
}

@end
