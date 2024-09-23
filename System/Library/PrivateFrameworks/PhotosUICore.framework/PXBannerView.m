@implementation PXBannerView

- (PXBannerView)initWithFrame:(CGRect)a3 padding:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXBannerView *v8;
  PXBannerView *v9;
  objc_super v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11.receiver = self;
  v11.super_class = (Class)PXBannerView;
  v8 = -[PXBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_padding.top = top;
    v8->_padding.left = left;
    v8->_padding.bottom = bottom;
    v8->_padding.right = right;
    -[PXBannerView _reloadViews](v8, "_reloadViews");
  }
  return v9;
}

- (PXBannerView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBannerView.m"), 93, CFSTR("%s is not available as initializer"), "-[PXBannerView initWithFrame:]");

  abort();
}

- (PXBannerView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBannerView.m"), 97, CFSTR("%s is not available as initializer"), "-[PXBannerView init]");

  abort();
}

- (void)setConfiguration:(id)a3
{
  PXBannerViewConfiguration *v4;
  char v5;
  PXBannerViewConfiguration *v6;
  PXBannerViewConfiguration *configuration;
  PXBannerViewConfiguration *v8;

  v8 = (PXBannerViewConfiguration *)a3;
  v4 = self->_configuration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXBannerViewConfiguration isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (PXBannerViewConfiguration *)-[PXBannerViewConfiguration copy](v8, "copy");
      configuration = self->_configuration;
      self->_configuration = v6;

      -[PXBannerView _reloadViews](self, "_reloadViews");
    }
  }

}

- (void)_reloadViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[10];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[PXBannerView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v72 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v5);
  }

  -[PXBannerView configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wantsCancelButton");
  -[PXBannerView padding](self, "padding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v41 = v9;
  if (v9)
    v17 = v10 + 4.0;
  else
    v17 = v10;
  -[PXBannerView setAutoresizingMask:](self, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView _labelWithTitle:](self, "_labelWithTitle:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v8;
  objc_msgSend(v8, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView _labelWithSubtitle:](self, "_labelWithSubtitle:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXBannerView _createActionButton](self, "_createActionButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView _createCancelButton](self, "_createCancelButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v24, "setAxis:", 1);
  objc_msgSend(v24, "setAlignment:", 1);
  objc_msgSend(v24, "setSpacing:", -1.0);
  objc_msgSend(v24, "addArrangedSubview:", v19);
  objc_msgSend(v24, "addArrangedSubview:", v21);
  -[PXBannerView addSubview:](self, "addSubview:", v24);
  -[PXBannerView addSubview:](self, "addSubview:", v22);
  -[PXBannerView addSubview:](self, "addSubview:", v23);
  v25 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  if (v25)
    v26 = v12;
  else
    v26 = 0.0;
  if (v25)
    v27 = v16;
  else
    v27 = 0.0;
  v55 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v24, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView topAnchor](self, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:constant:", v66, v26);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v65;
  objc_msgSend(v24, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView leadingAnchor](self, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, v14);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v62;
  objc_msgSend(v24, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView centerYAnchor](self, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v59;
  -[PXBannerView bottomAnchor](self, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:constant:", v57, v27);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v56;
  objc_msgSend(v21, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v19;
  objc_msgSend(v19, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v52;
  v68 = v21;
  objc_msgSend(v21, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView leadingAnchor](self, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, v14);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v49;
  v43 = v23;
  objc_msgSend(v23, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView trailingAnchor](self, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -v17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v75[6] = v46;
  objc_msgSend(v23, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView centerYAnchor](self, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75[7] = v42;
  objc_msgSend(v22, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBannerView centerYAnchor](self, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v75[8] = v30;
  objc_msgSend(v22, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v32, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v75[9] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v34);

  if (v22)
  {
    if (v41)
    {
      objc_msgSend(v22, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -10.0;
      v38 = v35;
      v39 = v36;
    }
    else
    {
      objc_msgSend(v43, "setHidden:", 1);
      objc_msgSend(v22, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBannerView trailingAnchor](self, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v35;
      v39 = v36;
      v37 = -v17;
    }
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

  }
}

- (id)_labelWithTitle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0DC3990];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  MEMORY[0x1A85CC970](12, 32770, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "sizeToFit");
  return v5;
}

- (id)_labelWithSubtitle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DC3990];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  MEMORY[0x1A85CC970](11, 0x8000, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "sizeToFit");
  return v5;
}

- (id)_createActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 0);
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v5);

  -[PXBannerView configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  objc_msgSend(v3, "setTitleTextAttributesTransformer:", &__block_literal_global_5194);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v3);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1144766464;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleContinueButton_, 0x2000);

  return v8;
}

- (id)_createCancelButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 2, 20.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("multiply"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithSymbolConfiguration:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v7);

  objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v3);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleCancelButton_, 0x2000);

  return v8;
}

- (void)_handleContinueButton:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  -[PXBannerView configuration](self, "configuration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionButtonHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXBannerView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBannerView.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    objc_msgSend(v5, "primaryActionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__PXBannerView__handleContinueButton___block_invoke;
    v10[3] = &unk_1E5117000;
    v11 = v6;
    objc_msgSend(v7, "preparePresentationEnvironmentForBannerView:actionIdentifier:completionHandler:", self, v8, v10);

  }
}

- (void)_handleCancelButton:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  -[PXBannerView configuration](self, "configuration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelButtonHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXBannerView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBannerView.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    objc_msgSend(v5, "cancelActionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__PXBannerView__handleCancelButton___block_invoke;
    v10[3] = &unk_1E5117000;
    v11 = v6;
    objc_msgSend(v7, "preparePresentationEnvironmentForBannerView:actionIdentifier:completionHandler:", self, v8, v10);

  }
}

- (PXBannerViewConfiguration)configuration
{
  return self->_configuration;
}

- (PXBannerViewDelegate)delegate
{
  return (PXBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)padding
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_padding, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __36__PXBannerView__handleCancelButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "PXBannerView: Cancel: error preparing presentation environment: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __38__PXBannerView__handleContinueButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "PXBannerView: Continue: error preparing presentation environment: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __35__PXBannerView__createActionButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  MEMORY[0x1A85CC970](10, 2, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

@end
