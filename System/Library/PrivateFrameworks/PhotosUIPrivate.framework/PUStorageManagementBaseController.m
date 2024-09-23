@implementation PUStorageManagementBaseController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  PHPhotoLibrary *v5;
  PHPhotoLibrary *photoLibrary;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUStorageManagementBaseController;
  -[PUStorageManagementBaseController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CD16F8]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (PHPhotoLibrary *)objc_msgSend(v3, "initWithPhotoLibraryURL:", v4);
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v5;

  -[PUStorageManagementBaseController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[PUStorageManagementBaseController photosViewConfigurationWithShouldExpunge:](self, "photosViewConfigurationWithShouldExpunge:", v8 != objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v9);
  objc_msgSend(v10, "setContainerViewController:", self);
  objc_msgSend(v10, "setGridPresentationBarsUpdateDelegate:", self);
  objc_msgSend(v9, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  -[PUStorageManagementBaseController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v10, 1);
  -[PUStorageManagementBaseController px_setOneUpPresentationStyle:](self, "px_setOneUpPresentationStyle:", 1);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[PUStorageManagementBaseController contentScrollViewForEdge:](self, "contentScrollViewForEdge:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageManagementBaseController contentScrollViewForEdge:](self, "contentScrollViewForEdge:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentScrollView:forEdge:", v5, 1);
  objc_msgSend(v4, "setContentScrollView:forEdge:", v6, 4);
  v7.receiver = self;
  v7.super_class = (Class)PUStorageManagementBaseController;
  -[PUStorageManagementBaseController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_, v4);

}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStorageManagementBaseController.m"), 66, CFSTR("Method %s is a responsibility of subclass %@"), "-[PUStorageManagementBaseController photosViewConfigurationWithShouldExpunge:]", v7);

  abort();
}

- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a5;
  v6 = a4;
  v27 = a3;
  -[PUStorageManagementBaseController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUStorageManagementBaseController isGridControllerEditing](self, "isGridControllerEditing");
  -[PUStorageManagementBaseController setIsGridControllerEditing:](self, "setIsGridControllerEditing:", v5);
  if (v5)
  {
    objc_msgSend(v9, "leftBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", v11, v6);

  }
  else if (v10)
  {
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", MEMORY[0x1E0C9AA60], v6);
  }
  objc_msgSend(v9, "rightBarButtonItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItems:animated:", v12, v6);

  objc_msgSend(v27, "toolbarItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageManagementBaseController setToolbarItems:animated:](self, "setToolbarItems:animated:", v13, v6);

  -[PUStorageManagementBaseController title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v14);

  -[PUStorageManagementBaseController parentViewController](self, "parentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "containsString:", CFSTR("SwiftUI")))
  {
    objc_msgSend(v15, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItems:animated:", v19, v6);

    objc_msgSend(v15, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftBarButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItems:animated:", v21, v6);

    objc_msgSend(v27, "toolbarItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToolbarItems:animated:", v22, v6);

    objc_msgSend(v8, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v23);

  }
  -[PUStorageManagementBaseController parentViewController](self, "parentViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftItemsSupplementBackButton:", 0);

}

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  void *v5;
  id preferenceValue;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  preferenceValue = self->_preferenceValue;
  self->_preferenceValue = v5;

}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)isGridControllerEditing
{
  return self->_isGridControllerEditing;
}

- (void)setIsGridControllerEditing:(BOOL)a3
{
  self->_isGridControllerEditing = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
