@implementation SBHPopoverView

- (SBHPopoverView)initWithArrowLocation:(int64_t)a3
{
  SBHPopoverView *v4;
  SBHPopoverView *v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
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
  objc_super v54;
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  _QWORD v58[6];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)SBHPopoverView;
  v4 = -[SBHPopoverView init](&v54, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SBHPopoverView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[SBHPopoverView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHPopoverView _createBackgroundView](v5, "_createBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(v6, "_setContinuousCornerRadius:", 26.0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v5->_backgroundView, v6);
    -[SBHPopoverView addSubview:](v5, "addSubview:", v6);
    -[SBHPopoverView _arrowViewForArrowLocation:arrowSize:](v5, "_arrowViewForArrowLocation:arrowSize:", a3, 36.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHPopoverView addSubview:](v5, "addSubview:", v7);
    v8 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 36.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v10;
    v53 = v7;
    objc_msgSend(v7, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 36.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v13);

    switch(a3)
    {
      case 0:
        v40 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v6, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView topAnchor](v5, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v14;
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", 12.0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v50;
        objc_msgSend(v6, "bottomAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView bottomAnchor](v5, "bottomAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v15;
        objc_msgSend(v15, "constraintEqualToAnchor:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = v47;
        objc_msgSend(v6, "leadingAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView leadingAnchor](v5, "leadingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v16;
        objc_msgSend(v16, "constraintEqualToAnchor:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v58[2] = v44;
        objc_msgSend(v6, "trailingAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView trailingAnchor](v5, "trailingAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v17;
        objc_msgSend(v17, "constraintEqualToAnchor:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v58[3] = v41;
        objc_msgSend(v53, "centerYAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v58[4] = v20;
        objc_msgSend(v53, "centerXAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "centerXAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v58[5] = v23;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v58;
        goto LABEL_7;
      case 1:
        v40 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v6, "topAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView topAnchor](v5, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v26;
        objc_msgSend(v26, "constraintEqualToAnchor:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v50;
        objc_msgSend(v6, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView bottomAnchor](v5, "bottomAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v27;
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", -12.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v47;
        objc_msgSend(v6, "leadingAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView leadingAnchor](v5, "leadingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v28;
        objc_msgSend(v28, "constraintEqualToAnchor:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v44;
        objc_msgSend(v6, "trailingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView trailingAnchor](v5, "trailingAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v29;
        objc_msgSend(v29, "constraintEqualToAnchor:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[3] = v41;
        objc_msgSend(v53, "centerYAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bottomAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v57[4] = v20;
        objc_msgSend(v53, "centerXAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "centerXAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v57[5] = v23;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v57;
        goto LABEL_7;
      case 2:
        v40 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v6, "topAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView topAnchor](v5, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v30;
        objc_msgSend(v30, "constraintEqualToAnchor:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v50;
        objc_msgSend(v6, "bottomAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView bottomAnchor](v5, "bottomAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v31;
        objc_msgSend(v31, "constraintEqualToAnchor:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v47;
        objc_msgSend(v6, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView leadingAnchor](v5, "leadingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v32;
        objc_msgSend(v32, "constraintEqualToAnchor:constant:", 12.0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v44;
        objc_msgSend(v6, "trailingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView trailingAnchor](v5, "trailingAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v33;
        objc_msgSend(v33, "constraintEqualToAnchor:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v56[3] = v41;
        objc_msgSend(v53, "centerXAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v56[4] = v20;
        objc_msgSend(v53, "centerYAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "centerYAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v56[5] = v23;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v56;
        goto LABEL_7;
      case 3:
        v40 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v6, "topAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView topAnchor](v5, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v34;
        objc_msgSend(v34, "constraintEqualToAnchor:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v50;
        objc_msgSend(v6, "bottomAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView bottomAnchor](v5, "bottomAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v35;
        objc_msgSend(v35, "constraintEqualToAnchor:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v47;
        objc_msgSend(v6, "leadingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView leadingAnchor](v5, "leadingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v36;
        objc_msgSend(v36, "constraintEqualToAnchor:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2] = v44;
        objc_msgSend(v6, "trailingAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHPopoverView trailingAnchor](v5, "trailingAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v37;
        objc_msgSend(v37, "constraintEqualToAnchor:constant:", -12.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v55[3] = v41;
        objc_msgSend(v53, "centerXAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trailingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v55[4] = v20;
        objc_msgSend(v53, "centerYAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "centerYAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v55[5] = v23;
        v24 = (void *)MEMORY[0x1E0C99D20];
        v25 = v55;
LABEL_7:
        objc_msgSend(v24, "arrayWithObjects:count:", v25, 6);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "activateConstraints:", v38);

        break;
      default:
        break;
    }

  }
  return v5;
}

- (id)_arrowViewForArrowLocation:(int64_t)a3 arrowSize:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v7 = (void *)MEMORY[0x1E0DC3870];
  SBHBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("PopoverArrow"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
  -[SBHPopoverView _createBackgroundView](self, "_createBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskView:", v10);
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, a4, a4);
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, a4, a4);
  if (a3 == 3 || a3 == 2)
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  memset(&v15, 0, sizeof(v15));
  BSDegreesToRadians();
  CGAffineTransformMakeRotation(&v15, v12);
  v14 = v15;
  objc_msgSend(v11, "setTransform:", &v14);

  return v11;
}

- (id)_createBackgroundView
{
  void *v2;

  +[SBIconView componentBackgroundView](SBIconView, "componentBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setOverrideUserInterfaceStyle:", 2);
  return v2;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
