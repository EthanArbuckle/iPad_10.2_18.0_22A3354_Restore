@implementation PXPeopleInternalAnnotationPersonSummaryViewController

- (PXPeopleInternalAnnotationPersonSummaryViewController)initWithPerson:(id)a3 withDismissCompletion:(id)a4 withCancelCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleInternalAnnotationPersonSummaryViewController *v12;
  PXPeopleInternalAnnotationPersonSummaryViewController *v13;
  void *v14;
  id dismissCompletion;
  void *v16;
  id cancelCompletion;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXPeopleInternalAnnotationPersonSummaryViewController;
  v12 = -[PXPeopleInternalAnnotationPersonSummaryViewController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_person, a3);
    v14 = _Block_copy(v10);
    dismissCompletion = v13->_dismissCompletion;
    v13->_dismissCompletion = v14;

    v16 = _Block_copy(v11);
    cancelCompletion = v13->_cancelCompletion;
    v13->_cancelCompletion = v16;

  }
  return v13;
}

- (void)viewDidLoad
{
  PXPeopleScalableAvatarView *v3;
  PXPeopleScalableAvatarView *avatarView;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  int v22;
  const __CFString *v23;
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
  const __CFString *v36;
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
  void *v59;
  objc_super v60;
  _QWORD v61[10];

  v61[8] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)PXPeopleInternalAnnotationPersonSummaryViewController;
  -[PXPeopleInternalAnnotationPersonSummaryViewController viewDidLoad](&v60, sel_viewDidLoad);
  v3 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  avatarView = self->_avatarView;
  self->_avatarView = v3;

  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPeopleScalableAvatarView setPerson:](self->_avatarView, "setPerson:", self->_person);
  -[PHPerson px_localizedName](self->_person, "px_localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[PHPerson px_localizedName](self->_person, "px_localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Annotating %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationPersonSummaryViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
  else
  {
    -[PXPeopleInternalAnnotationPersonSummaryViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", CFSTR("Annotating Photos"));
  }

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Next"), 2, self, sel_nextTapped_);
  -[PXPeopleInternalAnnotationPersonSummaryViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v11;
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Cancel"), 2, self, sel__cancelTapped_);
  -[PXPeopleInternalAnnotationPersonSummaryViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)v13;
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_avatarView);

  v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setNumberOfLines:", 0);
  objc_msgSend(v18, "setTextAlignment:", 1);
  -[PHPerson px_localizedName](self->_person, "px_localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    -[PHPerson px_localizedName](self->_person, "px_localizedName");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
  }
  else
  {
    -[PXPeopleInternalAnnotationPersonSummaryViewController person](self, "person");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = -[__CFString px_isHuman](v21, "px_isHuman");
    v23 = CFSTR("pet");
    if (v22)
      v23 = CFSTR("human");
    v36 = v23;
  }
  PXStringWithValidatedFormat();
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setText:", v44, v36);
  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v18);

  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)MEMORY[0x1E0CB3718];
  -[PXPeopleScalableAvatarView topAnchor](self->_avatarView, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v56, 12.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v55;
  -[PXPeopleScalableAvatarView centerXAnchor](self->_avatarView, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerXAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v51;
  -[PXPeopleScalableAvatarView heightAnchor](self->_avatarView, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView widthAnchor](self->_avatarView, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v48;
  -[PXPeopleScalableAvatarView heightAnchor](self->_avatarView, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleInternalAnnotationPersonSummaryViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", v43, 0.2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v42;
  objc_msgSend(v18, "firstBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView bottomAnchor](self->_avatarView, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 95.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v38;
  objc_msgSend(v18, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v28;
  v41 = v26;
  objc_msgSend(v26, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v31;
  objc_msgSend(v26, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v33, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v35);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleInternalAnnotationPersonSummaryViewController;
  -[PXPeopleInternalAnnotationPersonSummaryViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PXPeopleInternalAnnotationPersonSummaryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleInternalAnnotationPersonSummaryViewController;
  -[PXPeopleInternalAnnotationPersonSummaryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPeopleInternalAnnotationPersonSummaryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 1, 1);

}

- (void)nextTapped:(id)a3
{
  id v4;

  -[PXPeopleInternalAnnotationPersonSummaryViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, self->_dismissCompletion);

}

- (void)_cancelTapped:(id)a3
{
  id v4;

  -[PXPeopleInternalAnnotationPersonSummaryViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, self->_cancelCompletion);

}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (id)dismissCompletion
{
  return self->_dismissCompletion;
}

- (id)cancelCompletion
{
  return self->_cancelCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong(&self->_dismissCompletion, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
