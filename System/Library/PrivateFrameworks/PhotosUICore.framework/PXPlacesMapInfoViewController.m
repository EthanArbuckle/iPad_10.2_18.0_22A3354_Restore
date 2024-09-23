@implementation PXPlacesMapInfoViewController

- (PXPlacesMapInfoViewController)initWithMapModeController:(id)a3
{
  id v5;
  PXPlacesMapInfoViewController *v6;
  PXPlacesMapInfoViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapInfoViewController;
  v6 = -[PXPlacesMapInfoViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapModeController, a3);
    -[PXPlacesMapInfoViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
  }

  return v7;
}

- (PXPlacesMapInfoViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapInfoViewController.m"), 72, CFSTR("%s is not available as initializer"), "-[PXPlacesMapInfoViewController init]");

  abort();
}

- (PXPlacesMapInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapInfoViewController.m"), 76, CFSTR("%s is not available as initializer"), "-[PXPlacesMapInfoViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapInfoViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapInfoViewController.m"), 80, CFSTR("%s is not available as initializer"), "-[PXPlacesMapInfoViewController initWithCoder:]");

  abort();
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)PXPlacesMapInfoViewController;
  -[PXPlacesMapInfoViewController viewDidLoad](&v47, sel_viewDidLoad);
  PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapInfoViewController setTitle:](self, "setTitle:", v3);

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_tappedDone_);
  -[PXPlacesMapInfoViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v4;
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  v6 = objc_alloc(MEMORY[0x1E0DC3C58]);
  PXLocalizedStringFromTable(CFSTR("PXPlacesMapTypeStandardButtonTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v7;
  PXLocalizedStringFromTable(CFSTR("PXPlacesMapTypeHybridButtonTitle"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v8;
  PXLocalizedStringFromTable(CFSTR("PXPlacesMapTypeSatelliteButtonTitle"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithItems:", v10);

  -[PXPlacesMapInfoViewController mapModeController](self, "mapModeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mapStyle");
  if (v13 == 2)
    v14 = 2;
  else
    v14 = v13 == 1;
  objc_msgSend(v11, "setSelectedSegmentIndex:", v14);

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_mapTypeChanged_, 4096);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXPlaces3dMapButtonTitle"), CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapInfoViewController mapModeController](self, "mapModeController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsPerspectiveToggling");

  if ((v18 & 1) != 0)
  {
    -[PXPlacesMapInfoViewController mapModeController](self, "mapModeController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "is3DPerspectiveActive");

    if (v20)
    {
      PXLocalizedStringFromTable(CFSTR("PXPlaces2dMapButtonTitle"), CFSTR("PhotosUICore"));
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }
  }
  else
  {
    objc_msgSend(v15, "setEnabled:", 0);
  }
  v45 = v16;
  objc_msgSend(v15, "setTitle:forState:", v16, 0);
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_tapped3dButton_, 64);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v23);

  objc_msgSend(v22, "setAlpha:", 0.5);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tappedDimView_);
  objc_msgSend(v22, "addGestureRecognizer:", v24);

  v25 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  objc_msgSend(v25, "addSubview:", v11);
  objc_msgSend(v25, "addSubview:", v15);
  _NSDictionaryOfVariableBindings(CFSTR("mapTypeControl, map3dControl"), v11, v15, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[mapTypeControl]-[map3dControl]-|"), 0, 0, v27);
  v28 = v11;
  v44 = v11;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v29);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[mapTypeControl]-|"), 0, 0, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v30);

  v31 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v28, "superview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 9, 0, v32, 9, 1.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraint:", v33);

  -[PXPlacesMapInfoViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackgroundColor:", v35);

  objc_msgSend(v34, "addSubview:", v22);
  objc_msgSend(v34, "addSubview:", v25);
  objc_msgSend(v22, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  _NSDictionaryOfVariableBindings(CFSTR("dimView, buttonContainer"), v22, v25, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[dimView][buttonContainer]|"), 0, 0, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addConstraints:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[dimView]|"), 0, 0, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addConstraints:", v42);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[buttonContainer]|"), 0, 0, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addConstraints:", v43);

}

- (void)tappedDone:(id)a3
{
  id v3;

  -[PXPlacesMapInfoViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)tappedDimView:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[PXPlacesMapInfoViewController presentingViewController](self, "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)tapped3dButton:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  -[PXPlacesMapInfoViewController mapModeController](self, "mapModeController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "togglePerspectiveIfPossible");

  if ((v5 & 1) == 0)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to toggle perspective, check that the Map supports pitching", v8, 2u);
    }

  }
  -[PXPlacesMapInfoViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)mapTypeChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v8, "selectedSegmentIndex");
    if (v4 == 2)
      v5 = 2;
    else
      v5 = v4 == 1;
    -[PXPlacesMapInfoViewController mapModeController](self, "mapModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMapStyle:", v5);

  }
  -[PXPlacesMapInfoViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (PXPlacesMapModeController)mapModeController
{
  return self->_mapModeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapModeController, 0);
}

@end
