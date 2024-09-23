@implementation PRComplicationGalleryDetailViewController

- (void)loadView
{
  PRComplicationGalleryDetailView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  PRComplicationGalleryDetailPageViewController *v23;
  void *v24;
  void *v25;
  PRComplicationGalleryDetailPageViewController *v26;
  void *v27;
  PRComplicationGalleryDetailView *v28;
  id v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PRComplicationGalleryDetailView);
  -[PRComplicationGalleryDetailView setDelegate:](v3, "setDelegate:", self);
  -[PRComplicationGalleryDetailViewController setView:](self, "setView:", v3);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = v3;
  v29 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[PRComplicationGalleryDetailView addLayoutGuide:](v3, "addLayoutGuide:");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PRComplicationGalleryDetailViewController applicationWidgetCollection](self, "applicationWidgetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v11 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
        -[PRComplicationGalleryDetailViewController applicationWidgetCollection](self, "applicationWidgetCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isDisfavored");

        v14 = -[PRComplicationGalleryDetailViewController addWidgetSheetLocation](self, "addWidgetSheetLocation");
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          if (v13)
            v17 = objc_msgSend(v10, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v14);
          else
            v17 = objc_msgSend(v10, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v14);
        }
        else
        {
          v17 = objc_msgSend(v10, "sbh_supportedSizeClasses");
        }
        v18 = v17;
        v19 = v10;
        if (objc_msgSend(v19, "sbh_supportsRemovableBackgroundOrAccessoryFamilies"))
        {
          v20 = v18 & v11;
          -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "widgetDragHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = [PRComplicationGalleryDetailPageViewController alloc];
          -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PRComplicationGalleryDetailPageViewController initWithGalleryItem:listLayoutProvider:iconViewProvider:widgetDragHandler:allowedFamilies:](v23, "initWithGalleryItem:listLayoutProvider:iconViewProvider:widgetDragHandler:allowedFamilies:", v19, v24, v25, v22, v20);

          -[PRComplicationGalleryDetailPageViewController setDelegate:](v26, "setDelegate:", self);
          -[PRComplicationGalleryDetailPageViewController setLayoutGuide:](v26, "setLayoutGuide:", v29);
          objc_msgSend(v31, "addObject:", v26);
          -[PRComplicationGalleryDetailPageViewController view](v26, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v27);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  -[PRComplicationGalleryDetailViewController setPageViewControllers:](self, "setPageViewControllers:", v31);
  -[PRComplicationGalleryDetailView setPages:](v28, "setPages:", v30);
  -[PRComplicationGalleryDetailViewController _updateContent](self, "_updateContent");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRComplicationGalleryDetailViewController;
  -[PRComplicationGalleryDetailViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PRComplicationGalleryDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[PRComplicationGalleryDetailViewController _updateParallax](self, "_updateParallax");
}

- (unint64_t)addWidgetSheetLocation
{
  return 1;
}

- (void)setAppName:(id)a3
{
  NSString *v4;
  NSString *appName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_appName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    appName = self->_appName;
    self->_appName = v4;

    -[PRComplicationGalleryDetailViewController _updateContent](self, "_updateContent");
  }

}

- (void)setIconImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[PRComplicationGalleryDetailViewController _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)setShowsCloseButton:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PRComplicationGalleryDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRComplicationGalleryDetailViewController _complicationGalleryDetailView](self, "_complicationGalleryDetailView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsCloseButton:", v3);

}

- (BOOL)showsCloseButton
{
  void *v3;
  char v4;

  -[PRComplicationGalleryDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRComplicationGalleryDetailViewController _complicationGalleryDetailView](self, "_complicationGalleryDetailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsCloseButton");

  return v4;
}

- (void)setShowsBackgroundView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PRComplicationGalleryDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRComplicationGalleryDetailViewController _complicationGalleryDetailView](self, "_complicationGalleryDetailView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsBackgroundView:", v3);

}

- (BOOL)showsBackgroundView
{
  void *v3;
  char v4;

  -[PRComplicationGalleryDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRComplicationGalleryDetailViewController _complicationGalleryDetailView](self, "_complicationGalleryDetailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsBackgroundView");

  return v4;
}

- (void)_updateContent
{
  id v3;

  -[PRComplicationGalleryDetailViewController _complicationGalleryDetailView](self, "_complicationGalleryDetailView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", self->_appName);
  objc_msgSend(v3, "setIconImage:", self->_iconImage);

}

- (void)complicationGalleryView:(id)a3 didUpdateVisiblePagesWithAppearedBlock:(id)a4
{
  id v5;
  NSArray *pageViewControllers;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  pageViewControllers = self->_pageViewControllers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__PRComplicationGalleryDetailViewController_complicationGalleryView_didUpdateVisiblePagesWithAppearedBlock___block_invoke;
  v8[3] = &unk_1E2185BE0;
  v9 = v5;
  v7 = v5;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](pageViewControllers, "enumerateObjectsWithOptions:usingBlock:", 0, v8);

}

void __108__PRComplicationGalleryDetailViewController_complicationGalleryView_didUpdateVisiblePagesWithAppearedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v5 && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3) & 1) != 0;
  objc_msgSend(v7, "bs_endAppearanceTransition:", v6);

}

- (void)complicationGalleryViewDidTapClose:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidCancel:", self);

}

- (void)_updateParallax
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pageViewControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[PRComplicationGalleryDetailViewController view](self, "view", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateParallaxEffectInReferenceView:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)complicationGalleryDetailPageViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addWidgetSheetViewController:didSelectWidgetIconView:", self, v5);

}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (void)setApplicationWidgetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_applicationWidgetCollection, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSArray)pageViewControllers
{
  return self->_pageViewControllers;
}

- (void)setPageViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
