@implementation SBHLibraryPodFolderController

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  void (**v21)(id, void *, _BYTE *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootFolder");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v30 = 0;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[SBFolderController folderView](self, "folderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iconListViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v19)
      {
        v9 = *(_QWORD *)v27;
        v18 = *(_QWORD *)v27;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(v8);
            v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v11, "icons");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v23;
              while (2)
              {
                v16 = 0;
                do
                {
                  if (*(_QWORD *)v23 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(v11, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {
                    v4[2](v4, v17, &v30);
                    if (v30)
                    {

                      goto LABEL_22;
                    }
                  }

                  ++v16;
                }
                while (v14 != v16);
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
                if (v14)
                  continue;
                break;
              }
            }

            ++v10;
            v9 = v18;
          }
          while (v10 != v19);
          v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        }
        while (v19);
      }

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __71__SBHLibraryPodFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
      v20[3] = &unk_1E8D87408;
      v21 = v4;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v20);
      v8 = v21;
LABEL_22:

    }
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController enumerateDisplayedIconViewsUsingBlock:](&v31, sel_enumerateDisplayedIconViewsUsingBlock_, v4);
  }

}

- (void)enumerateViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned __int8 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v30 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v20)
  {
    v7 = *(_QWORD *)v27;
    v21 = v6;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "icons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v9, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
              {
                objc_msgSend(v15, "customIconImageViewController");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v4[2](v4, v17, &v30);
                v18 = v30;

                if (v18)
                {

                  v6 = v21;
                  goto LABEL_19;
                }
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v21;
        v7 = v19;
      }
      v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v20);
  }
LABEL_19:

}

uint64_t __71__SBHLibraryPodFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateDisplayedIconViewsUsingBlock:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__SBHLibraryPodFolderController_isDisplayingIcon_inLocation___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIcon:inLocation:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    if (v6 && v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__SBHLibraryPodFolderController_isDisplayingIcon_inLocation___block_invoke;
      v12[3] = &unk_1E8D87390;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
      v10 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    v10 = -[SBFolderController isDisplayingIcon:inLocation:](&v20, sel_isDisplayingIcon_inLocation_, v6, v7);
  }

  return v10;
}

void __55__SBHLibraryPodFolderController_presentedIconLocations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "presentedIconLocations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (NSSet)presentedIconLocations
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController presentedIconLocations](&v9, sel_presentedIconLocations);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBHLibraryPodFolderController_presentedIconLocations__block_invoke;
  v7[3] = &unk_1E8D87368;
  v5 = v4;
  v8 = v5;
  -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v7);

  return (NSSet *)v5;
}

- (SBHLibraryPodFolderController)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SBHLibraryPodFolderController *v7;
  void *v8;
  int v9;
  SBHLibraryCategoriesFolderDataSource *v10;
  void *v11;
  uint64_t v12;
  SBHLibraryCategoriesFolderDataSource *dataSource;
  void *v14;
  uint64_t v15;
  ATXAppDirectoryClient *loggingClient;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v18.receiver = self;
  v18.super_class = (Class)SBHLibraryPodFolderController;
  v7 = -[SBFolderController initWithConfiguration:](&v18, sel_initWithConfiguration_, v4);
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "iconLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBIconLocationAppLibrary"));

    if (v9)
    {
      v10 = [SBHLibraryCategoriesFolderDataSource alloc];
      objc_msgSend(v6, "categoriesFolder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBHLibraryCategoriesFolderDataSource initWithCategoriesFolder:](v10, "initWithCategoriesFolder:", v11);
      dataSource = v7->_dataSource;
      v7->_dataSource = (SBHLibraryCategoriesFolderDataSource *)v12;

      -[SBHLibraryCategoriesFolderDataSource addObserver:](v7->_dataSource, "addObserver:", v7);
      -[SBHLibraryCategoriesFolderDataSource categoriesFolder](v7->_dataSource, "categoriesFolder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderController setFolder:](v7, "setFolder:", v14);

    }
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    loggingClient = v7->_loggingClient;
    v7->_loggingClient = (ATXAppDirectoryClient *)v15;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapToDismissRecognizer;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController viewDidLoad](&v8, sel_viewDidLoad);
  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFolder:", v4);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTapGesture_);
  tapToDismissRecognizer = self->_tapToDismissRecognizer;
  self->_tapToDismissRecognizer = v5;

  -[UITapGestureRecognizer setAllowableMovement:](self->_tapToDismissRecognizer, "setAllowableMovement:", 10.0);
  -[UITapGestureRecognizer setDelegate:](self->_tapToDismissRecognizer, "setDelegate:", self);
  objc_msgSend(v3, "scalingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", self->_tapToDismissRecognizer);

}

+ (id)iconLocation
{
  return CFSTR("SBIconLocationAppLibrary");
}

+ (Class)configurationClass
{
  return (Class)objc_opt_self();
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHLibraryPodFolderController _updateContentOverlayInsetsForSelfAndChildren](self, "_updateContentOverlayInsetsForSelfAndChildren");
  -[SBHLibraryPodFolderController _reloadAppIcons](self, "_reloadAppIcons");
}

- (void)handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBHLibraryPodFolderController tapToDismissRecognizer](self, "tapToDismissRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 == v8)
  {
    v6 = objc_msgSend(v8, "state") == 3;
    v5 = v8;
    if (v6)
    {
      -[SBHLibraryPodFolderController podFolderControllerDelegate](self, "podFolderControllerDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "libraryPodFolderControllerRequestsDismissal:", self);

      v5 = v8;
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SBHLibraryPodFolderController tapToDismissRecognizer](self, "tapToDismissRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SBHLibraryPodFolderController contentScrollView](self, "contentScrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v11 == v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v6 = a4;
  -[SBHLibraryPodFolderController tapToDismissRecognizer](self, "tapToDismissRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 1;
  if (v7 == v16)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[SBFolderController iconListViews](self, "iconListViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v17[0] = v12;
          v17[1] = 3221225472;
          v17[2] = __70__SBHLibraryPodFolderController_gestureRecognizer_shouldReceiveTouch___block_invoke;
          v17[3] = &unk_1E8D87318;
          v18 = v6;
          v19 = &v24;
          objc_msgSend(v14, "enumerateIconViewsUsingBlock:", v17);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v10);
    }

    v8 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }

  return v8;
}

BOOL __70__SBHLibraryPodFolderController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  _BOOL8 result;
  CGPoint v21;
  CGRect v22;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  v21.x = v9;
  v21.y = v11;
  result = CGRectContainsPoint(v22, v21);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)shouldOpenFolderIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHLibraryPodFolderController _ourFolderContainsFolder:](self, "_ourFolderContainsFolder:", v5);

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHLibraryPodFolderController;
    v7 = -[SBFolderController shouldOpenFolderIcon:](&v9, sel_shouldOpenFolderIcon_, v4);
  }

  return v7;
}

- (BOOL)isOpen
{
  return 1;
}

- (void)configureInnerFolderControllerConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[SBHLibraryCategoriesFolderDataSource categoriesFolder](self->_dataSource, "categoriesFolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategoriesFolder:", v7);

  }
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController configureInnerFolderControllerConfiguration:](&v14, sel_configureInnerFolderControllerConfiguration_, v4);
  objc_opt_class();
  objc_msgSend(v4, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expandedPodFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFolder:", v12);

    objc_msgSend(v11, "expandedPodFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIcon:", v10);

  }
}

- (Class)controllerClassForFolder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  objc_class *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHLibraryPodFolderController;
  v5 = -[SBFolderController controllerClassForFolder:](&v11, sel_controllerClassForFolder_, v4);
  if (-[objc_class isEqual:](v5, "isEqual:", objc_opt_class()))
  {
    -[SBFolderController folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v6) & 1) == 0)
    {
      objc_msgSend(v4, "rootFolder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", v6);

      if (v8)
        v5 = (objc_class *)objc_opt_class();
    }

  }
  v9 = v5;

  return v9;
}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SBHLibraryPodFolderController *v10;
  SBHLibraryPodFolderController *v11;
  objc_super v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SBHLibraryPodFolderController _nestingViewControllerForPushing](self, "_nestingViewControllerForPushing");
  v10 = (SBHLibraryPodFolderController *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == self)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHLibraryPodFolderController;
    -[SBNestingViewController pushNestedViewController:animated:withCompletion:](&v12, sel_pushNestedViewController_animated_withCompletion_, v9, v5, v8);
  }
  else
  {
    -[SBHLibraryPodFolderController pushNestedViewController:animated:withCompletion:](v10, "pushNestedViewController:animated:withCompletion:", v9, v5, v8);
  }

}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBHLibraryPodFolderController _nestingViewControllerForPushing](self, "_nestingViewControllerForPushing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (SBIconListView)currentIconListView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SBHLibraryPodFolderController _nestingViewControllerForPushing](self, "_nestingViewControllerForPushing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deepestNestedDescendantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SBFolderController folderView](self, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconListViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v26 = v8;
          objc_msgSend(v8, "icons");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v28;
LABEL_9:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
              objc_msgSend(v14, "category");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "expandedPodFolder");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "folder");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16 == v17)
                break;

              if (v11 == ++v13)
              {
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v11)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            objc_msgSend(v26, "iconViewForIcon:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "customIconImageViewController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "iconListView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              goto LABEL_20;
          }
          else
          {
LABEL_15:

          }
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v25);
    }
    v20 = 0;
LABEL_20:

  }
  else
  {
    -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentIconListView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SBIconListView *)v20;
}

- (void)setContentAlpha:(double)a3
{
  id v4;

  -[SBHLibraryPodFolderController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)setLibraryCategoryMap:(id)a3
{
  SBHLibraryCategoryMap *v4;
  SBHLibraryCategoryMap *libraryCategoryMap;
  id v6;

  v6 = a3;
  if (!-[SBHLibraryCategoryMap isEqualToCategoryMap:](self->_libraryCategoryMap, "isEqualToCategoryMap:"))
  {
    v4 = (SBHLibraryCategoryMap *)objc_msgSend(v6, "copy");
    libraryCategoryMap = self->_libraryCategoryMap;
    self->_libraryCategoryMap = v4;

    -[SBHLibraryPodFolderController _reloadAppIcons](self, "_reloadAppIcons");
  }

}

- (void)dismissDisplayedContextMenu
{
  -[SBHLibraryPodFolderController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_19);
}

void __60__SBHLibraryPodFolderController_dismissDisplayedContextMenu__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isShowingContextMenu"))
  {
    objc_msgSend(v4, "dismissContextMenuWithCompletion:", 0);
    *a3 = 1;
  }

}

- (id)folderIconViewForIcon:(id)a3 folderRelativeIconIndexPath:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id *v35;
  uint64_t v36;
  void *v37;
  id obj;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[SBFolderController folderView](self, "folderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  v8 = 0;
  if (!v32)
  {
    v26 = 0;
    goto LABEL_30;
  }
  v9 = *(_QWORD *)v48;
  v34 = v7;
  v35 = a4;
  v31 = *(_QWORD *)v48;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v48 != v9)
        objc_enumerationMutation(v7);
      v33 = v10;
      v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v11, "icons", v31);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v40)
      {
        v12 = *(_QWORD *)v44;
        v36 = *(_QWORD *)v44;
        v37 = v11;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v44 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
            objc_msgSend(v14, "category");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "displayedIconViewForIcon:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v16)
              goto LABEL_19;
            objc_msgSend(v16, "customIconImageViewController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "iconListView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "model");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "folder");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "indexPathForIcon:", v39);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v18;
            if (v22)
            {
              v42 = v8;
              objc_msgSend(v21, "folderContainingIndexPath:relativeIndexPath:", v22, &v42);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v42;

              objc_msgSend(v23, "icon");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "displayedIconViewForIcon:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = v24;
              goto LABEL_14;
            }
            if (!objc_msgSend(v15, "overflowBehavior"))
            {
              objc_msgSend(v15, "expandedPodFolder");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "containsIcon:", v39);

              if (v28)
              {
                objc_msgSend(v15, "additionalItemsIndicatorIcon");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "displayedIconViewForIcon:", v23);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

              }
              else
              {
                v26 = 0;
              }
              v12 = v36;
              v11 = v37;
              goto LABEL_18;
            }
            v26 = 0;
LABEL_18:

            if (v26)
            {

              v7 = v34;
              a4 = v35;
              goto LABEL_30;
            }
LABEL_19:

            ++v13;
          }
          while (v40 != v13);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          v40 = v29;
        }
        while (v29);
      }

      v10 = v33 + 1;
      v7 = v34;
      a4 = v35;
      v9 = v31;
    }
    while (v33 + 1 != v32);
    v26 = 0;
    v32 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  }
  while (v32);
LABEL_30:

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v26;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController iconListView:didAddIconView:](&v12, sel_iconListView_didAddIconView_, a3, v6);
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customIconImageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "iconListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLayoutObserver:", self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__SBHLibraryPodFolderController_iconListView_didAddIconView___block_invoke;
    v11[3] = &unk_1E8D87340;
    v11[4] = self;
    objc_msgSend(v10, "enumerateIconViewsUsingBlock:", v11);

  }
  else
  {
    objc_msgSend(v6, "addObserver:", self);
  }

}

uint64_t __61__SBHLibraryPodFolderController_iconListView_didAddIconView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderController;
  v6 = a4;
  -[SBFolderController iconListView:didRemoveIconView:](&v7, sel_iconListView_didRemoveIconView_, a3, v6);
  objc_msgSend(v6, "removeObserver:", self, v7.receiver, v7.super_class);

}

- (void)iconViewDidHandleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  SBHLibraryCategoryMap *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __CFString *v38;
  SBHLibraryCategoryMap *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SBHLibraryPodFolderController;
  -[SBFolderController iconViewDidHandleTap:](&v44, sel_iconViewDidHandleTap_, v4);
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController folder](self, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "iconLocation");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsIcon:", v5) & 1) == 0)
  {
    v38 = v7;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[SBHLibraryCategoriesFolderDataSource categoryIdentifiers](self->_dataSource, "categoryIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = v9;
      v34 = v6;
      v36 = v4;
      v11 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          -[SBHLibraryCategoriesFolderDataSource categoryForIdentifier:](self->_dataSource, "categoryForIdentifier:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "compactPodFolder");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsIcon:", v5);

          if (v15)
          {
            objc_msgSend(v13, "compactPodFolder");
            v16 = objc_claimAutoreleasedReturnValue();

            v7 = CFSTR("SBIconLocationAppLibraryCategoryPod");
            v6 = (void *)v16;
            v4 = v36;
            goto LABEL_13;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v10)
          continue;
        break;
      }
      v6 = v34;
      v4 = v36;
    }
LABEL_13:

  }
  if (objc_msgSend(v5, "isLaunchEnabled")
    && objc_msgSend(v5, "isLeafIcon")
    && objc_msgSend(v6, "isLibraryCategoryFolder"))
  {
    -[SBHLibraryPodFolderController loggingClient](self, "loggingClient");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_libraryCategoryMap;
    objc_msgSend(v6, "libraryCategoryIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leafIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v18, "predictionCategoryID");
    v20 = objc_msgSend(v18, "predictionCategoryIndex");
    v37 = v18;
    -[SBHLibraryCategoryMap sortedApplicationIdentifiersForCategoryIdentifier:](v17, "sortedApplicationIdentifiersForCategoryIdentifier:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "indexOfObject:", v19);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v17;
    -[SBHLibraryCategoryMap metadata](v17, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("response"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqual:](v7, "isEqual:", CFSTR("SBIconLocationAppLibraryCategoryPodRecents")))
    {
      v26 = v35;
      objc_msgSend(v35, "logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:", v23, 4, v20, v19, v22, v25);
LABEL_19:
      v27 = v26;
LABEL_25:

      goto LABEL_26;
    }
    v32 = v22;
    v26 = v35;
    if (-[__CFString isEqual:](v7, "isEqual:", CFSTR("SBIconLocationAppLibraryCategoryPodSuggestions")))
    {
      v27 = v35;
      v28 = v35;
      v29 = v23;
      v30 = 3;
    }
    else
    {
      v27 = v35;
      if (!-[__CFString isEqual:](v7, "isEqual:", CFSTR("SBIconLocationAppLibraryCategoryPod")))
      {
        if (-[__CFString isEqual:](v7, "isEqual:", CFSTR("SBIconLocationAppLibraryCategoryPodExpanded")))
        {
          objc_msgSend(v35, "logLaunchFromExpandedCategoryWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:", v23, v33, v20, v19, v32, v25);
          goto LABEL_25;
        }
        SBLogProactiveAppLibrary();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[SBHLibraryPodFolderController iconViewDidHandleTap:].cold.1((uint64_t)v19, (uint64_t)v7, v31);

        goto LABEL_19;
      }
      v28 = v35;
      v29 = v23;
      v30 = v33;
    }
    objc_msgSend(v28, "logLaunchFromCategoryPreviewWithDate:categoryID:categoryIndex:bundleID:bundleIndex:appDirectoryResponse:", v29, v30, v20, v19, v32, v25);
    goto LABEL_25;
  }
LABEL_26:

}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHLibraryPodFolderController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return -[SBHLibraryPodFolderController iconViewForIcon:location:options:](self, "iconViewForIcon:location:options:", a3, a4, 0);
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  -[SBFolderController folder](self, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRootFolder");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    if (v8 && v9)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__4;
      v22 = __Block_byref_object_dispose__4;
      v23 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __66__SBHLibraryPodFolderController_iconViewForIcon_location_options___block_invoke;
      v14[3] = &unk_1E8D87390;
      v15 = v8;
      v16 = v9;
      v17 = &v18;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v14);
      v12 = (id)v19[5];

      _Block_object_dispose(&v18, 8);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController iconViewForIcon:location:options:](&v24, sel_iconViewForIcon_location_options_, v8, v9, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __66__SBHLibraryPodFolderController_iconViewForIcon_location_options___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "iconViewForIcon:location:", a1[4], a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    *a3 = 1;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    if (v6 && v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__4;
      v20 = __Block_byref_object_dispose__4;
      v21 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__SBHLibraryPodFolderController_firstIconViewForIcon_inLocations___block_invoke;
      v12[3] = &unk_1E8D87390;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
      v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController firstIconViewForIcon:inLocations:](&v22, sel_firstIconViewForIcon_inLocations_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __66__SBHLibraryPodFolderController_firstIconViewForIcon_inLocations___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "firstIconViewForIcon:inLocations:", a1[4], a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    *a3 = 1;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootFolder");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__4;
      v16 = __Block_byref_object_dispose__4;
      v17 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__SBHLibraryPodFolderController_firstIconViewForIcon___block_invoke;
      v9[3] = &unk_1E8D873B8;
      v10 = v4;
      v11 = &v12;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v9);
      v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController firstIconViewForIcon:](&v18, sel_firstIconViewForIcon_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __54__SBHLibraryPodFolderController_firstIconViewForIcon___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "firstIconViewForIcon:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    *a3 = 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootFolder");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__4;
      v16 = __Block_byref_object_dispose__4;
      v17 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __77__SBHLibraryPodFolderController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke;
      v9[3] = &unk_1E8D873B8;
      v10 = v4;
      v11 = &v12;
      -[SBHLibraryPodFolderController enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:](self, "enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:", v9);
      v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController firstIconViewForIcon:](&v18, sel_firstIconViewForIcon_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __77__SBHLibraryPodFolderController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "firstIconViewForIcon:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    *a3 = 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    if (v6 && v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62__SBHLibraryPodFolderController_isDisplayingIcon_inLocations___block_invoke;
      v12[3] = &unk_1E8D87390;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
      v10 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    v10 = -[SBFolderController isDisplayingIcon:inLocations:](&v20, sel_isDisplayingIcon_inLocations_, v6, v7);
  }

  return v10;
}

uint64_t __62__SBHLibraryPodFolderController_isDisplayingIcon_inLocations___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIcon:inLocations:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  objc_super v16;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootFolder");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__SBHLibraryPodFolderController_isDisplayingIcon___block_invoke;
      v9[3] = &unk_1E8D873B8;
      v10 = v4;
      v11 = &v12;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v9);
      v7 = *((_BYTE *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryPodFolderController;
    v7 = -[SBFolderController isDisplayingIcon:](&v16, sel_isDisplayingIcon_, v4);
  }

  return v7;
}

uint64_t __50__SBHLibraryPodFolderController_isDisplayingIcon___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIcon:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  objc_super v16;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootFolder");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__SBHLibraryPodFolderController_isDisplayingIconView___block_invoke;
      v9[3] = &unk_1E8D873B8;
      v10 = v4;
      v11 = &v12;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v9);
      v7 = *((_BYTE *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryPodFolderController;
    v7 = -[SBFolderController isDisplayingIconView:](&v16, sel_isDisplayingIconView_, v4);
  }

  return v7;
}

uint64_t __54__SBHLibraryPodFolderController_isDisplayingIconView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIconView:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    if (v6 && v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__SBHLibraryPodFolderController_isDisplayingIconView_inLocation___block_invoke;
      v12[3] = &unk_1E8D87390;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
      v10 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    v10 = -[SBFolderController isDisplayingIconView:inLocation:](&v20, sel_isDisplayingIconView_inLocation_, v6, v7);
  }

  return v10;
}

uint64_t __65__SBHLibraryPodFolderController_isDisplayingIconView_inLocation___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIconView:inLocation:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    if (v6 && v7)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __79__SBHLibraryPodFolderController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
      v10[3] = &unk_1E8D873E0;
      v11 = v6;
      v12 = v7;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v10);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController enumerateDisplayedIconViewsForIcon:usingBlock:](&v13, sel_enumerateDisplayedIconViewsForIcon_usingBlock_, v6, v7);
  }

}

uint64_t __79__SBHLibraryPodFolderController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateDisplayedIconViewsForIcon:usingBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRootFolder");

  if ((v9 & 1) != 0)
  {
    if (v6 && objc_msgSend(v7, "count"))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__4;
      v20 = __Block_byref_object_dispose__4;
      v21 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__SBHLibraryPodFolderController_firstIconViewForIcon_excludingLocations___block_invoke;
      v12[3] = &unk_1E8D87390;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[SBHLibraryPodFolderController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
      v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBHLibraryPodFolderController;
    -[SBFolderController firstIconViewForIcon:excludingLocations:](&v22, sel_firstIconViewForIcon_excludingLocations_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __73__SBHLibraryPodFolderController_firstIconViewForIcon_excludingLocations___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "firstIconViewForIcon:excludingLocations:", a1[4], a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }

}

- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLibrarySearchControllerScrollViewDelegate:", v4);

}

- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate
{
  void *v2;
  void *v3;

  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySearchControllerScrollViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSUIScrollViewDelegate *)v3;
}

- (BOOL)_ourFolderContainsFolder:(id)a3
{
  SBHLibraryCategoriesFolderDataSource *dataSource;
  id v4;
  void *v5;
  void *v6;

  dataSource = self->_dataSource;
  v4 = a3;
  -[SBHLibraryCategoriesFolderDataSource categoriesFolder](dataSource, "categoriesFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (void)enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unsigned __int8 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v34 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v23)
  {
    v7 = *(_QWORD *)v31;
    v25 = v6;
    v22 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v6);
        v24 = v8;
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v9, "icons", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              if (objc_msgSend(v15, "isCategoryIcon"))
              {
                objc_msgSend(v15, "category");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "categoryIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "predictionCategoryID");

                if ((unint64_t)(v18 - 3) < 2)
                  continue;
              }
              objc_msgSend(v9, "displayedIconViewForIcon:", v15);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "customIconImageViewController");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, v20, &v34);
              v21 = v34;

              if (v21)
              {

                v6 = v25;
                goto LABEL_20;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            if (v12)
              continue;
            break;
          }
        }

        v8 = v24 + 1;
        v6 = v25;
        v7 = v22;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v23);
  }
LABEL_20:

}

- (id)_nestingViewControllerForPushing
{
  SBHLibraryPodFolderController *v2;
  SBHLibraryPodFolderController *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = v2;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v6 = v5,
            v4,
            objc_msgSend(v6, "parentNestingViewController"),
            v7 = objc_claimAutoreleasedReturnValue(),
            v4 = v6,
            !v7))
      {
        objc_msgSend(v5, "parentViewController");
        v7 = objc_claimAutoreleasedReturnValue();
      }

      v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v4 = 0;
  }
  -[SBHLibraryPodFolderController podFolderControllerDelegate](v3, "podFolderControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "libraryPodFolderController:nestingViewControllerForPushingWithProposedController:", v3, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return v4;
}

- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SBHLibraryPodFolderController podFolderControllerDelegate](self, "podFolderControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "categoryIdentifiersCount");

  objc_msgSend(v5, "libraryPodFolderController:willLayoutDisplayedCategories:", self, v6);
  if (-[SBHLibraryPodFolderController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBFolderController folderView](self, "folderView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIconListsWithAnimationType:forceRelayout:", 0, 1);

  }
}

- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v12 = a4;
  v6 = a3;
  -[SBHLibraryPodFolderController podFolderControllerDelegate](self, "podFolderControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "categoryIdentifiersCount");

  objc_msgSend(v7, "libraryPodFolderController:willLayoutDisplayedCategories:", self, v8);
  v9 = -[SBHLibraryPodFolderController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  if (((v9 ^ 1) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[SBFolderController folderView](self, "folderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v10, "iconListViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__SBHLibraryPodFolderController_categoriesDataSource_shouldAnimateLayoutForCategories___block_invoke;
    v13[3] = &unk_1E8D87430;
    v14 = v12;
    v15 = (uint64_t)((unint64_t)(v9 ^ 1u) << 63) >> 63;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  }
  if (v9)
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __87__SBHLibraryPodFolderController_categoriesDataSource_shouldAnimateLayoutForCategories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "icons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "icon");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "category");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "categoryIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12))
          {
            objc_msgSend(v9, "customIconImageViewController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "iconListView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setNeedsLayout");
            objc_msgSend(v14, "layoutIconsIfNeededWithAnimationType:options:", *(_QWORD *)(a1 + 40), 0);

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (void)_reloadAppIcons
{
  SBHLibraryCategoriesFolderDataSource *dataSource;
  id v3;
  id v4;

  dataSource = self->_dataSource;
  -[SBHLibraryPodFolderController libraryCategoryMap](self, "libraryCategoryMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](dataSource, "reloadDataWithCategoryMap:", v4);

}

- (BOOL)_isViewControllerVisible
{
  return -[SBHLibraryPodFolderController _appearState](self, "_appearState") - 1 < 2;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageCache, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (UITapGestureRecognizer)tapToDismissRecognizer
{
  return self->_tapToDismissRecognizer;
}

- (SBHLibraryCategoriesFolderDataSource)dataSource
{
  return self->_dataSource;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (SBHLibraryPodFolderControllerDelegate)podFolderControllerDelegate
{
  return (SBHLibraryPodFolderControllerDelegate *)objc_loadWeakRetained((id *)&self->_podFolderControllerDelegate);
}

- (void)setPodFolderControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_podFolderControllerDelegate, a3);
}

- (ATXAppDirectoryClient)loggingClient
{
  return self->_loggingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_destroyWeak((id *)&self->_podFolderControllerDelegate);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tapToDismissRecognizer, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
}

- (void)iconViewDidHandleTap:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Launch of %{public}@ from %{public}@ not logged", (uint8_t *)&v3, 0x16u);
}

@end
