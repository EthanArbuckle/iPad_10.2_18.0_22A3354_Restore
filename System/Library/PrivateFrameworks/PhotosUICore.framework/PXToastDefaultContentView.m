@implementation PXToastDefaultContentView

- (PXToastDefaultContentView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXToastDefaultContentView.m"), 19, CFSTR("%s is not available as initializer"), "-[PXToastDefaultContentView initWithFrame:]");

  abort();
}

- (PXToastDefaultContentView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXToastDefaultContentView.m"), 23, CFSTR("%s is not available as initializer"), "-[PXToastDefaultContentView initWithCoder:]");

  abort();
}

- (PXToastDefaultContentView)initWithToastConfiguration:(id)a3
{
  id v4;
  PXToastDefaultContentView *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
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
  double v23;
  double v24;
  double v25;
  double v26;
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
  uint64_t v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
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
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[7];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)PXToastDefaultContentView;
  v5 = -[PXToastDefaultContentView initWithFrame:](&v62, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v4, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    v60 = (void *)v6;
    objc_msgSend(v8, "setTextColor:", v6);
    v59 = (void *)v7;
    objc_msgSend(v8, "setFont:", v7);
    objc_msgSend(v8, "setLineBreakMode:", 5);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXToastDefaultContentView addSubview:](v5, "addSubview:", v8);
    v10 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXToastDefaultContentView centerYAnchor](v5, "centerYAnchor");
    v61 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v13;
    -[PXToastDefaultContentView heightAnchor](v5, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v17);

    v4 = v61;
    objc_msgSend(v61, "iconSystemImageName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v59);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "systemImageNamed:withConfiguration:", v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = v21;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
      objc_msgSend(v22, "setTintColor:", v60);
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PXToastDefaultContentView addSubview:](v5, "addSubview:", v22);
      objc_msgSend(v21, "size");
      v24 = v23;
      v26 = v25;
      v52 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v22, "widthAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToConstant:", v24);
      v49 = objc_claimAutoreleasedReturnValue();
      v64[0] = v49;
      objc_msgSend(v22, "heightAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToConstant:", v26);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v58;
      objc_msgSend(v22, "trailingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:constant:", v55, -8.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v54;
      objc_msgSend(v22, "centerYAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXToastDefaultContentView centerYAnchor](v5, "centerYAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v64[3] = v47;
      -[PXToastDefaultContentView heightAnchor](v5, "heightAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "heightAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v44, 20.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v64[4] = v43;
      -[PXToastDefaultContentView leadingAnchor](v5, "leadingAnchor");
      v57 = v18;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -15.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v64[5] = v29;
      -[PXToastDefaultContentView trailingAnchor](v5, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 15.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v64[6] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "activateConstraints:", v33);

      v34 = (void *)v49;
      v4 = v61;

      v35 = v53;
      v36 = v46;

      v37 = v51;
      v38 = v56;

      v18 = v57;
    }
    else
    {
      v39 = (void *)MEMORY[0x1E0CB3718];
      -[PXToastDefaultContentView leadingAnchor](v5, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:constant:", v22, -15.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v35;
      -[PXToastDefaultContentView trailingAnchor](v5, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:constant:", v37, 15.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v39;
      v36 = (void *)v40;
      objc_msgSend(v41, "activateConstraints:", v40);
    }

    objc_msgSend((id)objc_opt_class(), "configureBackgroundOfToastContentView:", v5);
  }

  return v5;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)PXToastDefaultContentView;
  -[PXToastDefaultContentView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXToastDefaultContentView bounds](self, "bounds");
  v3 = CGRectGetHeight(v6) * 0.5;
  -[PXToastDefaultContentView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

+ (void)configureBackgroundOfToastContentView:(id)a3
{
  id v3;
  double v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1045220557;
  objc_msgSend(v6, "setShadowOpacity:", v4);
  objc_msgSend(v6, "setShadowRadius:", 4.0);
  objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

}

@end
