@implementation PXPeopleMergeContentViewController

- (PXPeopleMergeContentViewController)initWithTargetPerson:(id)a3 draggedPerson:(id)a4
{
  id v7;
  id v8;
  PXPeopleMergeContentViewController *v9;
  PXPeopleMergeContentViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleMergeContentViewController;
  v9 = -[PXPeopleMergeContentViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetPerson, a3);
    objc_storeStrong((id *)&v10->_draggedPerson, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPeopleMergeContentViewController *v4;
  void *v5;
  void *v6;
  PXPeopleMergeContentViewController *v7;

  v4 = +[PXPeopleMergeContentViewController allocWithZone:](PXPeopleMergeContentViewController, "allocWithZone:", a3);
  -[PXPeopleMergeContentViewController targetPerson](self, "targetPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleMergeContentViewController draggedPerson](self, "draggedPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPeopleMergeContentViewController initWithTargetPerson:draggedPerson:](v4, "initWithTargetPerson:draggedPerson:", v5, v6);

  return v7;
}

- (CGSize)preferredContentSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  if ((unint64_t)(v3 - 3) >= 2)
    v9 = v6;
  else
    v9 = v8;
  v10 = 320.0;
  v11 = dbl_1A7C0C8E0[v9 == 320.0];
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  PXPeopleScalableAvatarView *v4;
  void *v5;
  PXPeopleScalableAvatarView *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PXPeopleScalableAvatarView *v24;
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
  PXPeopleScalableAvatarView *v48;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PXPeopleScalableAvatarView *v73;
  void *v74;
  objc_super v75;
  _QWORD v76[19];

  v76[17] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)PXPeopleMergeContentViewController;
  -[PXPeopleMergeContentViewController viewDidLoad](&v75, sel_viewDidLoad);
  -[PXPeopleMergeContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 128.25, 128.25);
  -[PXPeopleMergeContentViewController targetPerson](self, "targetPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView setPersonAndWaitForImage:](v4, "setPersonAndWaitForImage:", v5);

  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 128.25, 128.25);
  -[PXPeopleMergeContentViewController draggedPerson](self, "draggedPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView setPersonAndWaitForImage:](v6, "setPersonAndWaitForImage:", v7);

  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.forward"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = 1.0 / v13;

  objc_msgSend(v3, "addSubview:", v10);
  objc_msgSend(v8, "setImage:", v72);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v15);

  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v3, "addSubview:", v6);
  objc_msgSend(v3, "addSubview:", v8);
  -[PXPeopleScalableAvatarView heightAnchor](v6, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v17, 0.899999976);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = 1132068864;
  v62 = v18;
  objc_msgSend(v18, "setPriority:", v19);
  -[PXPeopleScalableAvatarView leadingAnchor](v6, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v21, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView trailingAnchor](v4, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v23, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintLessThanOrEqualToConstant:", 190.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v70;
  objc_msgSend(v10, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v66;
  objc_msgSend(v10, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v63;
  v67 = v10;
  objc_msgSend(v10, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v58;
  objc_msgSend(v10, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", v14);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v56;
  -[PXPeopleScalableAvatarView widthAnchor](v6, "widthAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView heightAnchor](v6, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v51;
  v73 = v6;
  -[PXPeopleScalableAvatarView centerYAnchor](v6, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v76[6] = v47;
  v76[7] = v18;
  v76[8] = v60;
  objc_msgSend(v8, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView trailingAnchor](v6, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 14.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v76[9] = v44;
  objc_msgSend(v8, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  v48 = v4;
  -[PXPeopleScalableAvatarView leadingAnchor](v4, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -14.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v76[10] = v40;
  v55 = v8;
  objc_msgSend(v8, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v76[11] = v37;
  objc_msgSend(v8, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v3;
  objc_msgSend(v3, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v76[12] = v25;
  -[PXPeopleScalableAvatarView centerYAnchor](v4, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v76[13] = v28;
  -[PXPeopleScalableAvatarView widthAnchor](v24, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView heightAnchor](v24, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v76[14] = v31;
  -[PXPeopleScalableAvatarView heightAnchor](v24, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView heightAnchor](v73, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v76[15] = v34;
  v76[16] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 17);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);
}

- (PHPerson)targetPerson
{
  return self->_targetPerson;
}

- (void)setTargetPerson:(id)a3
{
  objc_storeStrong((id *)&self->_targetPerson, a3);
}

- (PHPerson)draggedPerson
{
  return self->_draggedPerson;
}

- (void)setDraggedPerson:(id)a3
{
  objc_storeStrong((id *)&self->_draggedPerson, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedPerson, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
}

@end
