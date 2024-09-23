@implementation PBFGalleryViewController

- (void)dealloc
{
  BSInvalidatable *inUseAssertion;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_inUseAssertion, "invalidate");
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFGalleryViewController;
  -[PBFGalleryViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  PBFPosterExtensionDataStoreXPCServiceGlue *v3;
  PBFPosterExtensionDataStoreXPCServiceGlue *glue;
  void *v5;
  PBFPosterGalleryPreviewViewController *previewViewController;
  PBFPosterGalleryPreviewViewController *v7;
  PBFPosterGalleryPreviewViewController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIAction *v12;
  UIAction *renderingAction;
  void *v14;
  void *v15;
  UIAction *v16;
  UIAction *previewingAction;
  void *v18;
  void *v19;
  UIAction *v20;
  UIAction *editingAction;
  void *v22;
  UIAction *v23;
  void *v24;
  void *v25;
  UIBarButtonItem *v26;
  UIBarButtonItem *environmentItem;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  void *v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)PBFGalleryViewController;
  -[PBFGalleryViewController viewDidLoad](&v46, sel_viewDidLoad);
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v3 = (PBFPosterExtensionDataStoreXPCServiceGlue *)objc_claimAutoreleasedReturnValue();
  glue = self->_glue;
  self->_glue = v3;

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  -[PBFGalleryViewController _setupDataProvider](self, "_setupDataProvider");
  previewViewController = self->_previewViewController;
  if (!previewViewController)
  {
    v7 = -[PBFPosterGalleryPreviewViewController initWithNibName:bundle:]([PBFPosterGalleryPreviewViewController alloc], "initWithNibName:bundle:", 0, 0);
    v8 = self->_previewViewController;
    self->_previewViewController = v7;

    -[PBFPosterGalleryPreviewViewController setDelegate:](self->_previewViewController, "setDelegate:", self);
    -[PBFPosterGalleryPreviewViewController setEditingSceneDelegate:](self->_previewViewController, "setEditingSceneDelegate:", self);
    previewViewController = self->_previewViewController;
  }
  -[PBFPosterGalleryPreviewViewController setDataProvider:](previewViewController, "setDataProvider:", self->_dataProvider);
  -[PBFGalleryViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_previewViewController);
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("livephoto"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke;
  v43[3] = &unk_1E86F6210;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", CFSTR("Rendering"), v10, CFSTR("Rendering"), v43);
  v12 = (UIAction *)objc_claimAutoreleasedReturnValue();
  renderingAction = self->_renderingAction;
  self->_renderingAction = v12;

  v14 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("camera"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_2;
  v41[3] = &unk_1E86F6210;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", CFSTR("Previewing"), v15, CFSTR("Previewing"), v41);
  v16 = (UIAction *)objc_claimAutoreleasedReturnValue();
  previewingAction = self->_previewingAction;
  self->_previewingAction = v16;

  v18 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.pencil"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_3;
  v39[3] = &unk_1E86F6210;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", CFSTR("Editing"), v19, CFSTR("Editing"), v39);
  v20 = (UIAction *)objc_claimAutoreleasedReturnValue();
  editingAction = self->_editingAction;
  self->_editingAction = v20;

  v22 = (void *)MEMORY[0x1E0DC39D0];
  v23 = self->_previewingAction;
  v48[0] = self->_renderingAction;
  v48[1] = v23;
  v48[2] = self->_editingAction;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "menuWithTitle:children:", CFSTR("Environment"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:menu:", CFSTR("Environment"), v25);
  environmentItem = self->_environmentItem;
  self->_environmentItem = v26;

  -[PBFGalleryViewController navigationItem](self, "navigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLeftBarButtonItem:", self->_environmentItem);

  v29 = (void *)MEMORY[0x1E0DC39D0];
  v30 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("flame.fill"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __39__PBFGalleryViewController_viewDidLoad__block_invoke_4;
  v37[3] = &unk_1E86F6210;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", CFSTR("Reload from Proactive"), v31, CFSTR("ReloadFromProactive"), v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "menuWithTitle:children:", CFSTR("Reload"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:menu:", CFSTR("Reload"), v34);
  -[PBFGalleryViewController navigationItem](self, "navigationItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setRightBarButtonItem:", v35);

  -[PBFGalleryViewController _selectEditingEnvironment](self, "_selectEditingEnvironment");
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectRenderingEnvironment");

}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectPreviewingEnvironment");

}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectEditingEnvironment");

}

void __39__PBFGalleryViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadGalleryUsingProactive:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *inUseAssertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFGalleryViewController;
  -[PBFGalleryViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_inUseAssertion)
  {
    -[PBFPosterExtensionDataStoreXPCServiceGlue acquireSnapshotterInUseAssertionWithReason:](self->_glue, "acquireSnapshotterInUseAssertionWithReason:", CFSTR("GalleryViewController"));
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v4;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BSInvalidatable *inUseAssertion;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFGalleryViewController;
  -[PBFGalleryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[BSInvalidatable invalidate](self->_inUseAssertion, "invalidate");
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PBFGalleryViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __83__PBFGalleryViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "configureForGallery:", *(_QWORD *)(a1 + 40));
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if (-[UIAction state](self->_renderingAction, "state"))
  {
    if (-[UIAction state](self->_previewingAction, "state"))
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[PBFPosterGalleryPreviewViewController presentPreview:withMode:fromView:](self->_previewViewController, "presentPreview:withMode:fromView:", v9, v8, v7);

}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  PREditingSceneViewControllerTopButtonLayout *result;
  id v18;

  -[PBFGalleryViewController view](self, "view", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "prui_leadingTopButtonFrame");
  retstr->leadingTopButtonFrame.origin.x = v9;
  retstr->leadingTopButtonFrame.origin.y = v10;
  retstr->leadingTopButtonFrame.size.width = v11;
  retstr->leadingTopButtonFrame.size.height = v12;
  objc_msgSend(v18, "prui_trailingTopButtonFrame");
  retstr->trailingTopButtonFrame.origin.x = v13;
  retstr->trailingTopButtonFrame.origin.y = v14;
  retstr->trailingTopButtonFrame.size.width = v15;
  retstr->trailingTopButtonFrame.size.height = v16;

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a4 == 1)
  {
    objc_msgSend(v11, "contentsIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D7FA60]);
    objc_msgSend(v12, "_path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v19, 0, v15, v13, 0);

    objc_msgSend(v17, "switcherConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "ingestNewPosterConfiguration:", v20);
    v30 = 0;
    v23 = (id)objc_msgSend(v17, "updateDataStoreForSwitcherConfiguration:reason:error:", v22, CFSTR("ingest new poster from gallery"), &v30);
    v24 = v30;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __140__PBFGalleryViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v26[3] = &unk_1E86F6238;
    v27 = v11;
    v28 = v24;
    v29 = v14;
    v25 = v24;
    dispatch_async(MEMORY[0x1E0C80D38], v26);

  }
  else
  {
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
    (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  }

}

uint64_t __140__PBFGalleryViewController_editingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_setupDataProvider
{
  PBFGalleryMutableDataProvider *v3;
  PBFGalleryMutableDataProvider *dataProvider;

  if (!self->_dataProvider)
  {
    v3 = objc_alloc_init(PBFGalleryMutableDataProvider);
    dataProvider = self->_dataProvider;
    self->_dataProvider = v3;

    -[PBFGalleryViewController _reload](self, "_reload");
  }
}

- (void)_fetchNewGalleryFromProactive:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke;
  v6[3] = &unk_1E86F34D8;
  v6[4] = self;
  objc_msgSend(v5, "fetchGalleryConfigurationWithOptions:completion:", a3, v6);

}

void __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  _QWORD block[5];

  v6 = a5;
  if (v6)
  {
    PBFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_cold_1((uint64_t)v6, v7);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_41;
  block[3] = &unk_1E86F2518;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reload");
}

- (void)_reload
{
  void *v3;
  id v4;

  -[PBFPosterExtensionDataStoreXPCServiceGlue dataStore](self->_glue, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentGalleryConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[PBFGalleryMutableDataProvider configureForGallery:](self->_dataProvider, "configureForGallery:", v4);
}

- (void)_selectRenderingEnvironment
{
  -[UIAction setState:](self->_renderingAction, "setState:", 0);
  -[UIAction setState:](self->_previewingAction, "setState:", 1);
  -[UIAction setState:](self->_editingAction, "setState:", 1);
  -[UIBarButtonItem setTitle:](self->_environmentItem, "setTitle:", CFSTR("On Tap: Rendering"));
}

- (void)_selectPreviewingEnvironment
{
  -[UIAction setState:](self->_renderingAction, "setState:", 1);
  -[UIAction setState:](self->_previewingAction, "setState:", 0);
  -[UIAction setState:](self->_editingAction, "setState:", 1);
  -[UIBarButtonItem setTitle:](self->_environmentItem, "setTitle:", CFSTR("On Tap: Previewing"));
}

- (void)_selectEditingEnvironment
{
  -[UIAction setState:](self->_renderingAction, "setState:", 1);
  -[UIAction setState:](self->_previewingAction, "setState:", 1);
  -[UIAction setState:](self->_editingAction, "setState:", 0);
  -[UIBarButtonItem setTitle:](self->_environmentItem, "setTitle:", CFSTR("On Tap: Editing"));
}

- (void)_reloadGalleryUsingProactive:(id)a3
{
  -[PBFGalleryViewController _fetchNewGalleryFromProactive:](self, "_fetchNewGalleryFromProactive:", 10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_environmentItem, 0);
  objc_storeStrong((id *)&self->_editingAction, 0);
  objc_storeStrong((id *)&self->_previewingAction, 0);
  objc_storeStrong((id *)&self->_renderingAction, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_glue, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

void __58__PBFGalleryViewController__fetchNewGalleryFromProactive___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Error updating face gallery configuration: %@", (uint8_t *)&v2, 0xCu);
}

@end
