@implementation PXPeopleAlertContentViewController

- (PXPeopleAlertContentViewController)initWithPerson:(id)a3 message:(id)a4
{
  id v8;
  id v9;
  PXPeopleAlertContentViewController *v10;
  PXPeopleAlertContentViewController *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleAlertContentViewController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleAlertContentViewController.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message.length > 0"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleAlertContentViewController;
  v10 = -[PXPeopleAlertContentViewController init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v11->_message, a4);
  }

  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXPeopleScalableAvatarView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  objc_super v40;
  _QWORD v41[11];

  v41[9] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)PXPeopleAlertContentViewController;
  -[PXPeopleAlertContentViewController viewWillAppear:](&v40, sel_viewWillAppear_, a3);
  -[PXPeopleAlertContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PXPeopleAlertContentViewController message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v8);

  objc_msgSend(v4, "addSubview:", v5);
  v9 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 130.0, 130.0);
  -[PXPeopleAlertContentViewController person](self, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView setPerson:](v9, "setPerson:", v10);

  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v9);
  v28 = (void *)MEMORY[0x1E0CB3718];
  -[PXPeopleScalableAvatarView widthAnchor](v9, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView heightAnchor](v9, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v37;
  -[PXPeopleScalableAvatarView widthAnchor](v9, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToConstant:", 130.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v35;
  -[PXPeopleScalableAvatarView centerXAnchor](v9, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v32;
  -[PXPeopleScalableAvatarView topAnchor](v9, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v29;
  objc_msgSend(v5, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(v4, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v24;
  objc_msgSend(v5, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView bottomAnchor](v9, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v21;
  objc_msgSend(v5, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -20.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v11;
  objc_msgSend(v5, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 30.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v14;
  objc_msgSend(v5, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -30.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v18);

}

- (PHPerson)person
{
  return self->_person;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
