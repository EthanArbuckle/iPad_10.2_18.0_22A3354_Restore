@implementation PUAlbumPickerViewController

- (PUAlbumPickerViewController)initWithSessionInfo:(id)a3
{
  return -[PUAlbumPickerViewController initWithSpec:sessionInfo:](self, "initWithSpec:sessionInfo:", 0, a3);
}

- (PUAlbumPickerViewController)initWithSpec:(id)a3 sessionInfo:(id)a4
{
  id v7;
  id v8;
  PUAlbumPickerViewController *v9;
  PUAlbumPickerViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUAlbumPickerViewController;
  v9 = -[PUAlbumPickerViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    objc_storeStrong((id *)&v10->_albumPickerSessionInfo, a4);
    -[PUSessionInfo addSessionInfoObserver:](v10->_albumPickerSessionInfo, "addSessionInfoObserver:", v10);
    -[PUAlbumPickerViewControllerSpec configureSessionInfo:](v10->_spec, "configureSessionInfo:", v10->_albumPickerSessionInfo);
  }

  return v10;
}

- (PUAlbumPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumPickerViewController.m"), 59, CFSTR("%s is not available as initializer"), "-[PUAlbumPickerViewController initWithNibName:bundle:]");

  abort();
}

- (PUAlbumPickerViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumPickerViewController.m"), 63, CFSTR("%s is not available as initializer"), "-[PUAlbumPickerViewController initWithCoder:]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PUSessionInfo removeSessionInfoObserver:](self->_albumPickerSessionInfo, "removeSessionInfoObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUAlbumPickerViewController;
  -[PUAlbumPickerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAlbumPickerViewController;
  -[PUAlbumPickerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUAlbumPickerViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PUAlbumPickerViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAlbumPickerViewController;
  -[PUAlbumPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUAlbumPickerViewController _loadSubviewsIfNeeded](self, "_loadSubviewsIfNeeded");
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[PUAlbumPickerViewController spec](self, "spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (void)_loadSubviewsIfNeeded
{
  void *v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUNavigationController *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  if (!-[PUAlbumPickerViewController didLoadSubviews](self, "didLoadSubviews"))
  {
    -[PUAlbumPickerViewController setDidLoadSubviews:](self, "setDidLoadSubviews:", 1);
    -[PUAlbumPickerViewController spec](self, "spec");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      -[PUAlbumPickerViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "userInterfaceIdiom");
      v5 = off_1E5885758;
      if (v4 != 1)
        v5 = off_1E5885750;
      v26 = objc_alloc_init(*v5);
      -[PUAlbumPickerViewController _setSpec:](self, "_setSpec:");

    }
    -[PUAlbumPickerViewController albumPickerSessionInfo](self, "albumPickerSessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "configureSessionInfo:", v6);

    -[PUAlbumPickerViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
    v7 = (void *)objc_msgSend(v26, "newAlbumListViewController");
    -[PUAlbumPickerViewController albumPickerSessionInfo](self, "albumPickerSessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSessionInfo:", v8);

    PULocalizedString(CFSTR("ADD_TO_ALBUM"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    objc_msgSend(v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("ALBUMS_TAB_ROOT_CONTROLLER_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_setDefaultBackBarButtonItemWithTitle:", v11);

    -[PUAlbumPickerViewController _setAlbumListViewController:](self, "_setAlbumListViewController:", v7);
    -[PUAlbumPickerViewController collectionList](self, "collectionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v12);
    objc_msgSend(v13, "setCollectionTypesToInclude:", 4980738);
    objc_msgSend(v13, "setSeparateSectionsForSmartAndUserCollections:", 1);
    objc_msgSend(v13, "setSkipSyndicatedAssetFetches:", 1);
    objc_msgSend(v7, "setDataSourceManagerConfiguration:", v13);
    v14 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v7);
    -[PUAlbumPickerViewController addChildViewController:](self, "addChildViewController:", v14);
    -[PUNavigationController didMoveToParentViewController:](v14, "didMoveToParentViewController:", self);
    -[PUAlbumPickerViewController _setContentNavigationController:](self, "_setContentNavigationController:", v14);
    -[PUAlbumPickerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[PUAlbumPickerViewController contentNavigationController](self, "contentNavigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);
    objc_msgSend(v15, "addSubview:", v25);

  }
}

- (void)setCollectionList:(id)a3
{
  void *v5;
  void *v6;
  PHCollectionList *v7;

  v7 = (PHCollectionList *)a3;
  if (self->_collectionList != v7)
  {
    objc_storeStrong((id *)&self->_collectionList, a3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v7);
    objc_msgSend(v5, "setSeparateSectionsForSmartAndUserCollections:", 1);
    objc_msgSend(v5, "setCollectionTypesToInclude:", 4980736);
    -[PUAlbumPickerViewController _albumListViewController](self, "_albumListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSourceManagerConfiguration:", v5);

  }
}

- (void)sessionInfoStatusDidChange:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;

  v4 = -[PUSessionInfo status](self->_albumPickerSessionInfo, "status", a3);
  if (v4)
  {
    if (v4 == 1)
    {
      -[PUSessionInfo targetAlbum](self->_albumPickerSessionInfo, "targetAlbum");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[PUAlbumPickerViewController completionHandler](self, "completionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
    if (v5)
    {
      -[PUAlbumPickerViewController completionHandler](self, "completionHandler");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, v8);

      -[PUAlbumPickerViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
      v6 = (void *)v8;
    }

  }
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (UINavigationController)contentNavigationController
{
  return self->_contentNavigationController;
}

- (void)_setContentNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_contentNavigationController, a3);
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (PUAlbumPickerViewControllerSpec)spec
{
  return self->_spec;
}

- (void)_setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PUAlbumPickerSessionInfo)albumPickerSessionInfo
{
  return self->_albumPickerSessionInfo;
}

- (void)_setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_albumPickerSessionInfo, a3);
}

- (BOOL)didLoadSubviews
{
  return self->_didLoadSubviews;
}

- (void)setDidLoadSubviews:(BOOL)a3
{
  self->_didLoadSubviews = a3;
}

- (PUAlbumListViewController)_albumListViewController
{
  return self->__albumListViewController;
}

- (void)_setAlbumListViewController:(id)a3
{
  objc_storeStrong((id *)&self->__albumListViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__albumListViewController, 0);
  objc_storeStrong((id *)&self->_albumPickerSessionInfo, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_contentNavigationController, 0);
}

@end
