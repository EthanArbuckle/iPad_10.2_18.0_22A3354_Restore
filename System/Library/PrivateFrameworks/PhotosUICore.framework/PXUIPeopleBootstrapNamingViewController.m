@implementation PXUIPeopleBootstrapNamingViewController

- (PXUIPeopleBootstrapNamingViewController)initWithContext:(id)a3
{
  id v5;
  PXUIPeopleBootstrapNamingViewController *v6;
  PXUIPeopleBootstrapNamingViewController *v7;
  void *v8;
  PXPeopleNamePickerViewController *v9;
  PXPeopleNamePickerViewController *v10;
  uint64_t v11;
  void *namePicker;
  uint64_t v13;
  PXPeopleNamePickerViewController *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  v6 = -[PXUIPeopleBootstrapNamingViewController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bootstrapContext, a3);
    objc_msgSend(v5, "face");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PXPeopleNamePickerViewController alloc];
    v10 = v9;
    if (v8)
    {
      v11 = -[PXPeopleNamePickerViewController initWithFace:](v9, "initWithFace:", v8);
      namePicker = v7->_namePicker;
      v7->_namePicker = (PXPeopleNamePickerViewController *)v11;
    }
    else
    {
      -[PXUIPeopleBootstrapNamingViewController person](v7, "person");
      namePicker = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PXPeopleNamePickerViewController initWithPerson:](v10, "initWithPerson:", namePicker);
      v14 = v7->_namePicker;
      v7->_namePicker = (PXPeopleNamePickerViewController *)v13;

    }
    -[PXPeopleNamePickerViewController setDelegate:](v7->_namePicker, "setDelegate:", v7);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PXUIPeopleBootstrapNamingViewController *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[13];

  v62[11] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  -[PXUIPeopleBootstrapNamingViewController viewDidLoad](&v61, sel_viewDidLoad);
  -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIPeopleBootstrapNamingViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "didMoveToParentViewController:", self);
  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = self;
  -[PXUIPeopleBootstrapNamingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v60);
  objc_msgSend(v3, "adjustForAccessoryViewYOffset:", 80.0);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v58 = v3;
  objc_msgSend(v3, "resultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v5, "addSubview:", v6);
  -[PXUIPeopleBootstrapNamingViewController setPickerBackgroundView:](self, "setPickerBackgroundView:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v5, "addSubview:", v10);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "resultsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "separatorColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v13);

  objc_msgSend(v6, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "leadingAnchor");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = 1.0 / v17;

  objc_msgSend(v6, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", 80.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v56;
  objc_msgSend(v4, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v51;
  objc_msgSend(v6, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v46;
  v55 = v4;
  objc_msgSend(v4, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v5;
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v40;
  objc_msgSend(v10, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v14;
  objc_msgSend(v39, "constraintEqualToAnchor:", v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v38;
  objc_msgSend(v6, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v36;
  objc_msgSend(v4, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v31;
  objc_msgSend(v10, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v15;
  objc_msgSend(v19, "constraintEqualToAnchor:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v20;
  v45 = v10;
  objc_msgSend(v10, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v23;
  objc_msgSend(v10, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v25;
  objc_msgSend(v6, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
  objc_msgSend(v58, "resultsController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "backgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBackgroundColor:", v30);

  -[PXUIPeopleBootstrapNamingViewController _updateNavigationBarForCurrentTraitCollection](v59, "_updateNavigationBarForCurrentTraitCollection");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  -[PXUIPeopleBootstrapNamingViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUIPeopleBootstrapNamingViewController;
  -[PXUIPeopleBootstrapNamingViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXUIPeopleBootstrapNamingViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");
}

- (PHPerson)person
{
  void *v2;
  void *v3;
  id v4;

  -[PXUIPeopleBootstrapNamingViewController bootstrapContext](self, "bootstrapContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (PHPerson *)v4;
}

- (unint64_t)type
{
  void *v2;
  unint64_t v3;

  -[PXUIPeopleBootstrapNamingViewController bootstrapContext](self, "bootstrapContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bootstrapType");

  return v3;
}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  id v3;

  -[PXUIPeopleBootstrapNamingViewController _localizedTitleString](self, "_localizedTitleString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIPeopleBootstrapNamingViewController setTitle:](self, "setTitle:", v3);

}

- (id)_localizedTitleString
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PXUIPeopleBootstrapNamingViewController type](self, "type");
  if (v2 > 2)
    v3 = CFSTR("PXPeopleAddNameNoPlus");
  else
    v3 = off_1E5117320[v2];
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_captureStringSelectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXPeopleNameSelection *v7;
  id v8;

  if (-[PXUIPeopleBootstrapNamingViewController textDidChange](self, "textDidChange"))
  {
    -[PXUIPeopleBootstrapNamingViewController selection](self, "selection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nameField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = -[PXPeopleNameSelection initWithName:]([PXPeopleNameSelection alloc], "initWithName:", v6);
      -[PXUIPeopleBootstrapNamingViewController setSelection:](self, "setSelection:", v7);

    }
  }
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (void)willTransitionToNextInFlow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  objc_msgSend(v7, "endNamingSession");
  -[PXUIPeopleBootstrapNamingViewController _captureStringSelectionIfNeeded](self, "_captureStringSelectionIfNeeded");
  -[PXUIPeopleBootstrapNamingViewController selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIPeopleBootstrapNamingViewController bootstrapContext](self, "bootstrapContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNameSelection:", v5);

}

- (void)namePickerController:(id)a3 didPickPerson:(id)a4
{
  PXPeopleNameSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = -[PXPeopleNameSelection initWithSelectedPerson:]([PXPeopleNameSelection alloc], "initWithSelectedPerson:", v10);
  -[PXUIPeopleBootstrapNamingViewController setSelection:](self, "setSelection:", v5);

  if (v10)
  {
    -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "px_localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalizedName:", v8);

    objc_msgSend(v7, "finishEditing");
  }
  -[PXUIPeopleBootstrapNamingViewController actionDelegate](self, "actionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestAdvanceToNextInFlow");

}

- (void)namePickerController:(id)a3 didPickContact:(id)a4
{
  PXPeopleNameSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = -[PXPeopleNameSelection initWithContact:]([PXPeopleNameSelection alloc], "initWithContact:", v11);
  -[PXUIPeopleBootstrapNamingViewController setSelection:](self, "setSelection:", v5);

  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD16C0], "px_localizedNameFromContact:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalizedName:", v9);
    objc_msgSend(v8, "finishEditing");

  }
  -[PXUIPeopleBootstrapNamingViewController actionDelegate](self, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestAdvanceToNextInFlow");

}

- (void)namePickerController:(id)a3 didPickString:(id)a4
{
  id v5;
  PXPeopleNameSelection *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = -[PXPeopleNameSelection initWithName:]([PXPeopleNameSelection alloc], "initWithName:", v5);
  -[PXUIPeopleBootstrapNamingViewController setSelection:](self, "setSelection:", v6);

  -[PXUIPeopleBootstrapNamingViewController namePicker](self, "namePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLocalizedName:", v5);
  objc_msgSend(v8, "finishEditing");

}

- (void)namePickerControllerWillChangeText:(id)a3
{
  -[PXUIPeopleBootstrapNamingViewController setSelection:](self, "setSelection:", 0);
  -[PXUIPeopleBootstrapNamingViewController setTextDidChange:](self, "setTextDidChange:", 1);
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (PXPeopleFlowViewControllerActionDelegate)actionDelegate
{
  return (PXPeopleFlowViewControllerActionDelegate *)objc_loadWeakRetained((id *)&self->actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->actionDelegate, a3);
}

- (PXPeopleNamePickerViewController)namePicker
{
  return self->_namePicker;
}

- (void)setNamePicker:(id)a3
{
  objc_storeStrong((id *)&self->_namePicker, a3);
}

- (PXPeopleNameSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_storeStrong((id *)&self->_selection, a3);
}

- (UIView)pickerBackgroundView
{
  return self->_pickerBackgroundView;
}

- (void)setPickerBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerBackgroundView, a3);
}

- (NSLayoutConstraint)pickerBackgroundViewHeightConstraint
{
  return self->_pickerBackgroundViewHeightConstraint;
}

- (void)setPickerBackgroundViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pickerBackgroundViewHeightConstraint, a3);
}

- (BOOL)textDidChange
{
  return self->_textDidChange;
}

- (void)setTextDidChange:(BOOL)a3
{
  self->_textDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerBackgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pickerBackgroundView, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_namePicker, 0);
  objc_destroyWeak((id *)&self->actionDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

@end
