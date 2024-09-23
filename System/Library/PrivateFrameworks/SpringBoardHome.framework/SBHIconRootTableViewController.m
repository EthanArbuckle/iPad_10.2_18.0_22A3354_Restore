@implementation SBHIconRootTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHIconRootTableViewController;
  -[SBHIconRootTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBHIconRootTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, CFSTR("RootIcon"));

}

- (void)setFolder:(id)a3
{
  SBFolder *v5;
  void *v6;
  SBFolder *v7;

  v5 = (SBFolder *)a3;
  if (self->_folder != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_folder, a3);
    -[SBHIconRootTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (UIViewController)deepestFolderController
{
  return 0;
}

- (int64_t)orientation
{
  return 1;
}

- (BOOL)isEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconRootTableViewController;
  return -[SBHIconRootTableViewController isEditing](&v3, sel_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconRootTableViewController;
  -[SBHIconRootTableViewController setEditing:](&v3, sel_setEditing_, a3);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHIconRootTableViewController;
  -[SBHIconRootTableViewController setEditing:animated:](&v4, sel_setEditing_animated_, a3, a4);
}

- (BOOL)isScrolling
{
  return 0;
}

- (BOOL)isScrollTracking
{
  void *v2;
  char v3;

  -[SBHIconRootTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTracking");

  return v3;
}

- (void)cancelScrolling
{
  id v2;

  -[SBHIconRootTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelTouchTracking");

}

- (int64_t)currentPageIndex
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SBHIconRootTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "section");

  return v5;
}

- (void)setCurrentPageIndex:(int64_t)a3
{
  -[SBHIconRootTableViewController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, 0, 0);
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[SBHIconRootTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectForRowAtIndexPath:", v10);
  objc_msgSend(v9, "setContentOffset:animated:", v5);
  if (v8)
    v8[2](v8);

  return 1;
}

- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SBHIconRootTableViewController folder](self, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForIcon:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = SBFolderRelativeListIndex(v11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__SBHIconRootTableViewController_revealIcon_animated_completionHandler___block_invoke;
    v13[3] = &unk_1E8D859C0;
    v14 = v8;
    -[SBHIconRootTableViewController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", v12, v5, v13);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __72__SBHIconRootTableViewController_revealIcon_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationRoot"));
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBIconLocationRoot"));
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return 0;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBHIconRootTableViewController folder](self, "folder", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listCount");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[SBHIconRootTableViewController folder](self, "folder", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "numberOfIcons");
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RootIcon"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconRootTableViewController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconRootTableViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayNameForLocation:", CFSTR("SBIconLocationRoot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v7, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconRootTableViewController iconImageCache](self, "iconImageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForIcon:compatibleWithTraitCollection:options:", v9, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v15);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBHIconRootTableViewController folder](self, "folder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "launchFromLocation:context:", CFSTR("SBIconLocationRoot"), 0);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (SBFolder)folder
{
  return self->_folder;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setFolderIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_folderIconImageCache, a3);
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageCache, a3);
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->_contentVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
