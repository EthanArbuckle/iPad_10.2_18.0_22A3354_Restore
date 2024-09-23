@implementation PXPeopleDetailViewController

- (PXPeopleDetailViewController)initWithPeople:(id)a3 ignoreSharedLibraryFilters:(BOOL)a4
{
  return -[PXPeopleDetailViewController initWithPeople:options:ignoreSharedLibraryFilters:](self, "initWithPeople:options:ignoreSharedLibraryFilters:", a3, 0, a4);
}

- (PXPeopleDetailViewController)initWithPeople:(id)a3 options:(unint64_t)a4 ignoreSharedLibraryFilters:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  PXPeopleDetailsContext *v9;
  PXPhotosDetailsConfiguration *v10;
  PXPeopleDetailViewController *v11;
  uint64_t v12;
  NSArray *people;
  PXPeopleDetailViewController *v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v9 = -[PXPeopleDetailsContext initWithPeople:parentContext:ignoreSharedLibraryFilters:]([PXPeopleDetailsContext alloc], "initWithPeople:parentContext:ignoreSharedLibraryFilters:", v8, 0, v5);
    v10 = objc_alloc_init(PXPhotosDetailsConfiguration);
    -[PXPhotosDetailsConfiguration setBarsControllerClass:](v10, "setBarsControllerClass:", objc_opt_class());
    -[PXPhotosDetailsConfiguration setOptions:](v10, "setOptions:", a4);
    v16.receiver = self;
    v16.super_class = (Class)PXPeopleDetailViewController;
    v11 = -[PXPhotosDetailsUIViewController initWithContext:configuration:](&v16, sel_initWithContext_configuration_, v9, v10);
    if (v11)
    {
      v12 = objc_msgSend(v8, "copy");
      people = v11->_people;
      v11->_people = (NSArray *)v12;

    }
    self = v11;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailViewController;
  -[PXPhotosDetailsUIViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);

  -[PXPeopleDetailViewController _setupHeader](self, "_setupHeader");
}

- (BOOL)shouldUpdateStatusBarTitle
{
  return 0;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return 1;
}

- (void)presentBootstrapViewControllerWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PXPeopleDetailViewController people](self, "people");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v12, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Detail/PXPeopleDetailViewController.m"), "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v9, v10, "-[PXPeopleDetailViewController presentBootstrapViewControllerWithType:]", 75);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallerInfo:", v11);

  +[PXPeopleUtilities showBootstrapIfNeededWithContext:fromParentVC:force:delegate:](PXPeopleUtilities, "showBootstrapIfNeededWithContext:fromParentVC:force:delegate:", v6, self, a3 == 1, 0);
}

- (void)_replaceSelfWithNewDetailViewForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  PXPeopleDetailViewController *v11;
  void *v12;
  PXPeopleDetailViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("PUOneUpViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastViewedAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    v11 = [PXPeopleDetailViewController alloc];
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXPeopleDetailViewController initWithPeople:ignoreSharedLibraryFilters:](v11, "initWithPeople:ignoreSharedLibraryFilters:", v12, 0);

    if (v10)
      -[PXPhotosDetailsUIViewController setInitiallyPresentedAssetReference:](v13, "setInitiallyPresentedAssetReference:", v10);
    objc_msgSend(v6, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v16 = objc_msgSend(v15, "indexOfObject:", self);
    objc_msgSend(v15, "removeObjectsInRange:", v16, objc_msgSend(v15, "count") - v16);
    if (v13)
    {
      objc_msgSend(v15, "addObject:", v13);
    }
    else
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Popping people detail view because a replacement view controller came back as nil.", v18, 2u);
      }

    }
    objc_msgSend(v6, "setViewControllers:animated:", v15, 0);

  }
}

- (void)_setupHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPhotosDetailsUIViewController barsController](self, "barsController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailViewController people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__launchNaming_, 64);
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPeopleTitleView:", v4);
    if (v7)
    {
      objc_msgSend(v9, "setPerson:", v7);

    }
  }
  else
  {
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v8);

    objc_msgSend(v9, "setPeopleTitleView:", v4);
  }
  -[PXPeopleDetailViewController _updateHeader](self, "_updateHeader");

}

- (void)_updateHeader
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPhotosDetailsUIViewController barsController](self, "barsController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailViewController people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities titleStringForPeople:](PXPeopleUtilities, "titleStringForPeople:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    PXLocalizedStringFromTable(CFSTR("PXPeopleAddNameNoPlus"), CFSTR("PhotosUICore"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(v9, "peopleTitleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v4, 0);
  -[PXPeopleDetailViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (void)_launchNaming:(id)a3
{
  -[PXPeopleDetailViewController presentBootstrapViewControllerWithType:](self, "presentBootstrapViewControllerWithType:", 1);
}

- (void)_updateDataSourceWithCollectionForPerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  +[PXPeopleUtilities assetCollectionListFetchResultForPerson:](PXPeopleUtilities, "assetCollectionListFetchResultForPerson:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollectionListFetchResult:", v6);

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXPeopleDetailViewController people](self, "people");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    -[PXPeopleDetailViewController people](self, "people");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "changeDetailsForObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        v29 = 2112;
        v30 = (uint64_t)v10;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Change details for person (%@): %@", buf, 0x16u);
      }

      objc_msgSend(v9, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && objc_msgSend(v13, "verifiedType") != -2)
      {
        objc_msgSend(v13, "px_localizedName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_localizedName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if ((v22 & 1) == 0)
        {
          v26 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPeopleDetailViewController setPeople:](self, "setPeople:", v23);

          -[PXPeopleDetailViewController refreshName](self, "refreshName");
        }
      }
      else
      {
        PLUIGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend(v13, "verifiedType");
          *(_DWORD *)buf = 138412546;
          v28 = v13;
          v29 = 2048;
          v30 = v15;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Current person is missing or tombstoned. %@ (%ld)", buf, 0x16u);
        }

        objc_msgSend(v9, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXPeopleUtilities finalMergeTargetPersonForPersonWithUUID:](PXPeopleUtilities, "finalMergeTargetPersonForPersonWithUUID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        PLUIGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v17;
            _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Replacing the people detail view with the final merge target person %@.", buf, 0xCu);
          }

          -[PXPeopleDetailViewController _replaceSelfWithNewDetailViewForPerson:](self, "_replaceSelfWithNewDetailViewForPerson:", v17);
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Dismissing the people detail view because current person is missing and no final merge target can be found.", buf, 2u);
          }

          -[PXPeopleDetailViewController navigationController](self, "navigationController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (id)objc_msgSend(v24, "popToRootViewControllerAnimated:", 1);

        }
      }

    }
  }

}

- (NSArray)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
}

@end
