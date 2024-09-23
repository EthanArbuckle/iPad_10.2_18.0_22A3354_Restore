@implementation OBSetupAssistantFinishedController

- (OBSetupAssistantFinishedController)initWithTitle:(id)a3
{
  id v4;
  OBSetupAssistantFinishedController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OBButtonTray *v15;
  OBButtonTray *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OBSetupAssistantFinishedController;
  v5 = -[OBSetupAssistantFinishedController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[OBSetupAssistantFinishedController setTitleLabel:](v5, "setTitleLabel:", v6);

    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[OBSetupAssistantFinishedController _headerFont](v5, "_headerFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v4);

    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[OBSetupAssistantFinishedController titleLabel](v5, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 0);

    v15 = [OBButtonTray alloc];
    v16 = -[OBButtonTray initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBSetupAssistantFinishedController setButtonTray:](v5, "setButtonTray:", v16);

    -[OBSetupAssistantFinishedController buttonTray](v5, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBSetupAssistantFinishedController buttonTray](v5, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    v19 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[OBSetupAssistantFinishedController setInstructionalLabel:](v5, "setInstructionalLabel:", v19);

    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

    -[OBSetupAssistantFinishedController _instructionFont](v5, "_instructionFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v4);

    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextAlignment:", 1);

    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNumberOfLines:", 0);

    -[OBSetupAssistantFinishedController instructionalLabel](v5, "instructionalLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  uint64_t v20;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  objc_super v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[15];

  v109[13] = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)OBSetupAssistantFinishedController;
  -[OBBaseWelcomeController viewDidLoad](&v106, sel_viewDidLoad);
  -[OBSetupAssistantFinishedController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[OBSetupAssistantFinishedController contentView](self, "contentView");
  else
    -[OBSetupAssistantFinishedController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[OBSetupAssistantFinishedController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[OBSetupAssistantFinishedController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  v68 = (void *)MEMORY[0x1E0CB3718];
  -[OBSetupAssistantFinishedController view](self, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "layoutMarginsGuide");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "leftAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v97);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v95;
  -[OBSetupAssistantFinishedController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "layoutMarginsGuide");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "rightAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v88;
  -[OBSetupAssistantFinishedController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "layoutMarginsGuide");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "centerXAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v83;
  -[OBSetupAssistantFinishedController view](self, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v79;
  objc_msgSend(v4, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "layoutMarginsGuide");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v75, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v74;
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 0.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v109[5] = v69;
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v109[6] = v63;
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 0.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v109[7] = v58;
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "buttonLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutMarginsGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v109[8] = v51;
  -[OBSetupAssistantFinishedController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layoutMarginsGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leftAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v109[9] = v45;
  -[OBSetupAssistantFinishedController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v109[10] = v39;
  -[OBSetupAssistantFinishedController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v109[11] = v13;
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v4;
  objc_msgSend(v4, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v16, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109[12] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "activateConstraints:", v18);

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  v102 = (void *)MEMORY[0x1E0CB3718];
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "buttonLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v20 == 2)
  {
    objc_msgSend(v22, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 360.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v25;
    -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buttonLayoutGuide");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v27;
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v108[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "activateConstraints:", v31);
  }
  else
  {
    objc_msgSend(v22, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController view](self, "view");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "layoutMarginsGuide");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v100;
    -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "buttonLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantFinishedController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v98 = v21;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = v23;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "activateConstraints:", v36);

    v25 = v94;
    v24 = v92;

    v23 = v33;
    v26 = v96;

    v21 = v98;
  }

  -[OBBaseWelcomeController setTemplateType:](self, "setTemplateType:", 2);
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  NSDirectionalEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantFinishedController;
  -[OBBaseWelcomeController directionalLayoutMargins](&v6, sel_directionalLayoutMargins);
  v5 = 0.0;
  result.trailing = v4;
  result.bottom = v5;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBSetupAssistantFinishedController;
  -[OBSetupAssistantFinishedController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[OBSetupAssistantFinishedController _headerFont](self, "_headerFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[OBSetupAssistantFinishedController _instructionFont](self, "_instructionFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)setButtonTitle:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[OBSetupAssistantFinishedController boldButton](self, "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 0);

  +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController setBoldButton:](self, "setBoldButton:", v11);

  -[OBSetupAssistantFinishedController setBoldButtonBlock:](self, "setBoldButtonBlock:", v6);
  -[OBSetupAssistantFinishedController boldButton](self, "boldButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v7, 0);

  -[OBSetupAssistantFinishedController boldButton](self, "boldButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 0x2000);

  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantFinishedController boldButton](self, "boldButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", v14);

}

- (void)setInstructionalText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[OBSetupAssistantFinishedController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[OBSetupAssistantFinishedController instructionalLabel](self, "instructionalLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

}

- (id)_headerFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "templateType");

  if (v4 == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v6, "boldSystemFontOfSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_instructionFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "boldSystemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)buttonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[OBSetupAssistantFinishedController boldButtonBlock](self, "boldButtonBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[OBSetupAssistantFinishedController boldButtonBlock](self, "boldButtonBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)contentView
{
  return 0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (id)boldButtonBlock
{
  return self->_boldButtonBlock;
}

- (void)setBoldButtonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (UILabel)instructionalLabel
{
  return self->_instructionalLabel;
}

- (void)setInstructionalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionalLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionalLabel, 0);
  objc_storeStrong(&self->_boldButtonBlock, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
