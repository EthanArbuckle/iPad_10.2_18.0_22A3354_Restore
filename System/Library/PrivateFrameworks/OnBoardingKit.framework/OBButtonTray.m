@implementation OBButtonTray

- (OBButtonTray)initWithFrame:(CGRect)a3
{
  OBButtonTray *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  OBButtonTrayLayoutGuide *v13;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  objc_super v76;
  _QWORD v77[14];

  v77[12] = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)OBButtonTray;
  v3 = -[OBButtonTray initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[OBButtonTray setButtons:](v3, "setButtons:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    -[OBButtonTray setStackView:](v3, "setStackView:", v5);

    -[OBButtonTray stackView](v3, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAxis:", 1);

    -[OBButtonTray stackView](v3, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSpacing:", 5.0);

    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[OBButtonTray setPrivacyContainer:](v3, "setPrivacyContainer:", v8);

    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[OBButtonTray setBackdropContainer:](v3, "setBackdropContainer:", v10);

    -[OBButtonTray stackView](v3, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v13 = objc_alloc_init(OBButtonTrayLayoutGuide);
    -[OBButtonTray setButtonLayoutGuide:](v3, "setButtonLayoutGuide:", v13);

    -[OBButtonTray buttonLayoutGuide](v3, "buttonLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray addLayoutGuide:](v3, "addLayoutGuide:", v14);

    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray addSubview:](v3, "addSubview:", v15);

    -[OBButtonTray stackView](v3, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray addSubview:](v3, "addSubview:", v16);

    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray addSubview:](v3, "addSubview:", v17);

    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray topAnchor](v3, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setButtonViewTopConstraint:](v3, "setButtonViewTopConstraint:", v21);

    -[OBButtonTray buttonLayoutGuide](v3, "buttonLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray stackView](v3, "stackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setButtonViewBottomConstraint:](v3, "setButtonViewBottomConstraint:", v26);

    -[OBButtonTray buttonLayoutGuide](v3, "buttonLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray stackView](v3, "stackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setButtonViewLeadingConstraint:](v3, "setButtonViewLeadingConstraint:", v31);

    -[OBButtonTray buttonLayoutGuide](v3, "buttonLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray stackView](v3, "stackView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setButtonViewTrailingConstraint:](v3, "setButtonViewTrailingConstraint:", v36);

    v59 = (void *)MEMORY[0x1E0CB3718];
    -[OBButtonTray stackView](v3, "stackView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v71;
    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray leadingAnchor](v3, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v67;
    -[OBButtonTray privacyContainer](v3, "privacyContainer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray trailingAnchor](v3, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v63;
    -[OBButtonTray buttonViewTopConstraint](v3, "buttonViewTopConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v62;
    -[OBButtonTray buttonViewBottomConstraint](v3, "buttonViewBottomConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v61;
    -[OBButtonTray buttonViewLeadingConstraint](v3, "buttonViewLeadingConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v77[5] = v60;
    -[OBButtonTray buttonViewTrailingConstraint](v3, "buttonViewTrailingConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v77[6] = v58;
    -[OBButtonTray buttonLayoutGuide](v3, "buttonLayoutGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v77[7] = v55;
    -[OBButtonTray widthAnchor](v3, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:multiplier:", v52, 1.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[8] = v51;
    -[OBButtonTray heightAnchor](v3, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:multiplier:", v48, 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v77[9] = v47;
    -[OBButtonTray leadingAnchor](v3, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v77[10] = v40;
    -[OBButtonTray bottomAnchor](v3, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray backdropContainer](v3, "backdropContainer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v77[11] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v45);

    -[OBButtonTray setBackdropStyle:](v3, "setBackdropStyle:", 1);
    -[OBButtonTray _setUpBackdrops](v3, "_setUpBackdrops");
  }
  return v3;
}

- (void)removeFromSuperview
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
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[OBButtonTray stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray buttonViewLeadingConstraint](self, "buttonViewLeadingConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  -[OBButtonTray buttonViewTrailingConstraint](self, "buttonViewTrailingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v6);

  -[OBButtonTray buttonLayoutGuide](self, "buttonLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  v19.receiver = self;
  v19.super_class = (Class)OBButtonTray;
  -[OBButtonTray removeFromSuperview](&v19, sel_removeFromSuperview);
  -[OBButtonTray buttonLayoutGuide](self, "buttonLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray setButtonViewLeadingConstraint:](self, "setButtonViewLeadingConstraint:", v13);

  -[OBButtonTray buttonLayoutGuide](self, "buttonLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray setButtonViewTrailingConstraint:](self, "setButtonViewTrailingConstraint:", v18);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBButtonTray;
  -[OBButtonTray layoutSubviews](&v3, sel_layoutSubviews);
  -[OBButtonTray _updateTrayVisibility](self, "_updateTrayVisibility");
}

- (NSArray)allButtons
{
  void *v2;
  void *v3;

  -[OBButtonTray buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)showButtonsBusy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[OBButtonTray buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showsBusyIndicator");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[OBButtonTray buttons](self, "buttons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)showButtonsAvailable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[OBButtonTray buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hidesBusyIndicator");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[OBButtonTray buttons](self, "buttons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    -[OBButtonTray buttons](self, "buttons", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("A link button cannot be placed above a bold button."), 0);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v18);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
  -[OBButtonTray stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v4);

  -[OBButtonTray buttons](self, "buttons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
  -[OBButtonTray parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isViewLoaded");

  if (v13)
  {
    -[OBButtonTray parentViewController](self, "parentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

    -[OBButtonTray parentViewController](self, "parentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutIfNeeded");

  }
}

- (void)removeButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[OBButtonTray stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v4);

  -[OBButtonTray buttons](self, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(v4, "removeFromSuperview");
  -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
  -[OBButtonTray parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "isViewLoaded");

  if ((_DWORD)v6)
  {
    -[OBButtonTray parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[OBButtonTray parentViewController](self, "parentViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
}

- (void)removeAllButtons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[OBButtonTray buttons](self, "buttons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        -[OBButtonTray stackView](self, "stackView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeArrangedSubview:", v8);

        objc_msgSend(v8, "removeFromSuperview");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[OBButtonTray buttons](self, "buttons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
  -[OBButtonTray parentViewController](self, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[OBButtonTray parentViewController](self, "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

}

- (void)setBackdropStyle:(int64_t)a3
{
  self->_backdropStyle = a3;
  -[OBButtonTray _updateTrayVisibility](self, "_updateTrayVisibility");
}

- (void)setPrivacyLinkForBundles:(id)a3
{
  id v4;

  +[OBPrivacyLinkController linkWithBundleIdentifiers:](OBPrivacyLinkController, "linkWithBundleIdentifiers:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray setPrivacyLinkController:](self, "setPrivacyLinkController:", v4);

}

- (double)_privacyLinkControllerBottomPadding
{
  uint64_t v2;
  BOOL v3;
  double result;

  v2 = MGGetProductType();
  v3 = v2 == 1895344378 || v2 == 2903084588;
  result = 24.0;
  if (v3)
    return 14.0;
  return result;
}

- (void)setPrivacyLinkController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OBPrivacyLinkController *privacyLinkController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
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
  id v46;
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
  id v60;
  _QWORD v61[7];

  v61[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[OBButtonTray captionLabel](self, "captionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Privacy link not permitted with caption text."), 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v46);
  }
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

    privacyLinkController = self->_privacyLinkController;
    self->_privacyLinkController = 0;

  }
  if (v5)
  {
    objc_storeStrong((id *)&self->_privacyLinkController, a3);
    -[OBButtonTray parentViewController](self, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addChildViewController:", v13);

    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBButtonTray privacyContainer](self, "privacyContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v18);

    -[OBButtonTray _privacyLinkControllerBottomPadding](self, "_privacyLinkControllerBottomPadding");
    v20 = v19;
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray leadingAnchor](self, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray parentViewController](self, "parentViewController");
    v60 = v5;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "directionalLayoutMargins");
    objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setPrivacyLinkControllerLeadingConstraint:](self, "setPrivacyLinkControllerLeadingConstraint:", v28);

    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray trailingAnchor](self, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray parentViewController](self, "parentViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "directionalLayoutMargins");
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, -v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setPrivacyLinkControllerTrailingConstraint:](self, "setPrivacyLinkControllerTrailingConstraint:", v36);

    v50 = (void *)MEMORY[0x1E0CB3718];
    -[OBButtonTray privacyLinkControllerLeadingConstraint](self, "privacyLinkControllerLeadingConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v59;
    -[OBButtonTray privacyLinkControllerTrailingConstraint](self, "privacyLinkControllerTrailingConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v58;
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyContainer](self, "privacyContainer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v52;
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyContainer](self, "privacyContainer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v38;
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "textView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lastBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray privacyContainer](self, "privacyContainer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, -v20);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v45);

    v5 = v60;
    -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBButtonTray;
  -[OBButtonTray traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBButtonTray _updateCaptionTextAppearance](self, "_updateCaptionTextAppearance");
}

- (void)setDetached:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_detached != a3)
  {
    self->_detached = a3;
    -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
    -[OBButtonTray bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    -[OBButtonTray intrinsicContentSize](self, "intrinsicContentSize");
    if (v5 != v9 || v7 != v8)
    {
      -[OBButtonTray invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[OBButtonTray setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)hasContent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[OBButtonTray stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setCaptionText:(id)a3
{
  -[OBButtonTray _setCaptionText:style:learnMoreURL:](self, "_setCaptionText:style:learnMoreURL:", a3, 1, 0);
}

- (void)setCaptionText:(id)a3 learnMoreURL:(id)a4
{
  -[OBButtonTray _setCaptionText:style:learnMoreURL:](self, "_setCaptionText:style:learnMoreURL:", a3, 1, a4);
}

- (void)setCaptionText:(id)a3 style:(int64_t)a4
{
  -[OBButtonTray _setCaptionText:style:learnMoreURL:](self, "_setCaptionText:style:learnMoreURL:", a3, a4, 0);
}

- (void)_setCaptionText:(id)a3 style:(int64_t)a4 learnMoreURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OBLinkableTemplateLabel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v24 = a3;
  v8 = a5;
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Caption text not permitted with a privacy link."), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  -[OBButtonTray captionLabel](self, "captionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[OBButtonTray stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray captionLabel](self, "captionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeArrangedSubview:", v12);

    -[OBButtonTray captionLabel](self, "captionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

  }
  if (objc_msgSend(v24, "length"))
  {
    v14 = objc_alloc_init(OBLinkableTemplateLabel);
    -[OBButtonTray setCaptionLabel:](self, "setCaptionLabel:", v14);

    -[OBButtonTray captionLabel](self, "captionLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBButtonTray captionLabel](self, "captionLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v24);

    -[OBButtonTray captionLabel](self, "captionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);

    -[OBButtonTray stackView](self, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray captionLabel](self, "captionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertArrangedSubview:atIndex:", v19, 0);

    -[OBButtonTray stackView](self, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray captionLabel](self, "captionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCustomSpacing:afterView:", v21, 24.0);

    -[OBButtonTray setCaptionStyle:](self, "setCaptionStyle:", a4);
    -[OBButtonTray _updateCaptionTextAppearance](self, "_updateCaptionTextAppearance");
    -[OBButtonTray captionLabel](self, "captionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLearnMoreURL:", v8);

  }
}

- (void)_updateCaptionTextAppearance
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[OBButtonTray captionStyle](self, "captionStyle");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray captionLabel](self, "captionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    v6 = (void *)MEMORY[0x1E0DC1350];
    v7 = (_QWORD *)MEMORY[0x1E0DC4A88];
  }
  else
  {
    if (v3 != 1)
      return;
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray captionLabel](self, "captionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    v6 = (void *)MEMORY[0x1E0DC1350];
    v7 = (_QWORD *)MEMORY[0x1E0DC4AA0];
  }
  objc_msgSend(v6, "preferredFontForTextStyle:", *v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray captionLabel](self, "captionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)OBButtonTray;
  -[OBButtonTray didMoveToSuperview](&v17, sel_didMoveToSuperview);
  -[OBButtonTray superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v5)
  {
    -[OBButtonTray parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directionalLayoutMargins");
    v11 = v10;
    -[OBButtonTray privacyLinkControllerLeadingConstraint](self, "privacyLinkControllerLeadingConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v11);

    -[OBButtonTray parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "directionalLayoutMargins");
    v15 = -v14;
    -[OBButtonTray privacyLinkControllerTrailingConstraint](self, "privacyLinkControllerTrailingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v15);

  }
  else
  {
    -[OBButtonTray privacyLinkControllerLeadingConstraint](self, "privacyLinkControllerLeadingConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 0.0);

    -[OBButtonTray privacyLinkControllerTrailingConstraint](self, "privacyLinkControllerTrailingConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", 0.0);
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBButtonTray;
  -[OBButtonTray didMoveToWindow](&v3, sel_didMoveToWindow);
  -[OBButtonTray _updateButtonConstraints](self, "_updateButtonConstraints");
}

- (void)_updateButtonConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[OBButtonTray buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[OBButtonTray captionLabel](self, "captionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
LABEL_5:
    -[OBButtonTray topPadding](self, "topPadding");
    v6 = v5;
    -[OBButtonTray buttonViewTopConstraint](self, "buttonViewTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

    -[OBButtonTray bottomPadding](self, "bottomPadding");
    v9 = v8;
    -[OBButtonTray buttonViewBottomConstraint](self, "buttonViewBottomConstraint");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", v9);

    return;
  }
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_5;
}

- (double)topPadding
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;

  v3 = 5.0;
  if (!-[OBButtonTray _shouldHandleLandscapeiPhoneLayout](self, "_shouldHandleLandscapeiPhoneLayout"))
  {
    -[OBButtonTray buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v3 = 24.0;
    if (v5 == 1)
    {
      -[OBButtonTray buttons](self, "buttons");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[OBButtonTray parentViewController](self, "parentViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tabBarController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = 6.0;
        if (!v9)
        {
          +[OBDevice currentDevice](OBDevice, "currentDevice");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "type") == 2)
          {
            -[OBButtonTray parentViewController](self, "parentViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "ob_isFormSheet") ^ 1;

          }
          else
          {
            v12 = 1;
          }

          +[OBDevice currentDevice](OBDevice, "currentDevice");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "hasHomeButton");

          if ((v12 & ~v14) != 0)
            v3 = 34.0;
          else
            v3 = 5.0;
        }
      }

    }
  }
  return v3;
}

- (double)bottomPadding
{
  BOOL v3;
  double result;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int isKindOfClass;
  void *v23;

  v3 = -[OBButtonTray isDetached](self, "isDetached");
  result = 20.0;
  if (!v3)
  {
    -[OBButtonTray buttons](self, "buttons", 20.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = 0.0;
    if (v6 == 1)
    {
      -[OBButtonTray buttons](self, "buttons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[OBTrayButton standardHeight](OBTrayButton, "standardHeight");
        v7 = v10 + 5.0;
      }

    }
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 2)
    {
      -[OBButtonTray parentViewController](self, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "ob_isFormSheet");

    }
    else
    {
      v13 = 0;
    }

    -[OBButtonTray parentViewController](self, "parentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tabBarController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 6.0;
    if (v15)
      return v7 + v16;
    v16 = 5.0;
    v17 = MGGetProductType();
    if (v17 == 1895344378 || v17 == 2903084588)
      return v7 + v16;
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v18, "hasHomeButton") | v13) & 1) != 0)
    {

    }
    else
    {
      v19 = -[OBButtonTray _shouldHandleLandscapeiPhoneLayout](self, "_shouldHandleLandscapeiPhoneLayout");

      if (!v19)
      {
        v16 = 34.0;
        return v7 + v16;
      }
    }
    -[OBButtonTray buttons](self, "buttons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[OBButtonTray buttons](self, "buttons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = (unint64_t)objc_msgSend(v23, "count") > 1;

    if ((v20 & isKindOfClass) != 0)
      v16 = 24.0;
    else
      v16 = 5.0;
    return v7 + v16;
  }
  return result;
}

- (void)_setUpBackdrops
{
  id v3;
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
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEffect:", v4);
  -[OBButtonTray setEffectView:](self, "setEffectView:", v5);

  -[OBButtonTray effectView](self, "effectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBButtonTray backdropContainer](self, "backdropContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray effectView](self, "effectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[OBButtonTray backdropContainer](self, "backdropContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray effectView](self, "effectView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v27, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  -[OBButtonTray backdropContainer](self, "backdropContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray effectView](self, "effectView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:multiplier:", v21, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  -[OBButtonTray backdropContainer](self, "backdropContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray effectView](self, "effectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  -[OBButtonTray backdropContainer](self, "backdropContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBButtonTray effectView](self, "effectView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v17);

  -[OBButtonTray _updateTrayVisibility](self, "_updateTrayVisibility");
}

- (void)_updateTrayVisibility
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  -[OBButtonTray stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[OBButtonTray setHidden:](self, "setHidden:", 0);
  }
  else
  {
    -[OBButtonTray privacyLinkController](self, "privacyLinkController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBButtonTray setHidden:](self, "setHidden:", v5 == 0);

  }
  v6 = -[OBButtonTray backdropStyle](self, "backdropStyle") == 1;
  -[OBButtonTray effectView](self, "effectView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGSize result;

  -[OBButtonTray buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[OBButtonTray captionLabel](self, "captionLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[OBButtonTray bounds](self, "bounds");
    v14 = v25;
    v21 = 0.0;
    goto LABEL_8;
  }
LABEL_5:
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;

  if (v8 > 0.0)
  {
    -[OBButtonTray _privacyLinkControllerBottomPadding](self, "_privacyLinkControllerBottomPadding");
    v8 = v8 + v9;
  }
  -[OBButtonTray captionLabel](self, "captionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11;

  -[OBButtonTray bounds](self, "bounds");
  v14 = v13;
  -[OBButtonTray stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  -[OBButtonTray bottomPadding](self, "bottomPadding");
  v19 = v18 + v17;
  -[OBButtonTray topPadding](self, "topPadding");
  v21 = v8 + v12 + v20 + v19;

LABEL_8:
  v22 = v14;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)_shouldHandleLandscapeiPhoneLayout
{
  void *v3;
  BOOL v4;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == 1
    && (unint64_t)(+[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", self)- 3) < 2;

  return v4;
}

- (CGSize)detachedSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGSize result;

  -[OBButtonTray buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[OBButtonTray privacyLinkController](self, "privacyLinkController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[OBButtonTray captionLabel](self, "captionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[OBButtonTray bounds](self, "bounds");
    v6 = v15;
    v11 = 0.0;
    goto LABEL_6;
  }
LABEL_5:
  -[OBButtonTray bounds](self, "bounds");
  v6 = v5;
  -[OBButtonTray stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 + 20.0;
  -[OBButtonTray topPadding](self, "topPadding");
  v11 = v10 + v9;

LABEL_6:
  v12 = v6;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (OBButtonTrayLayoutGuide)buttonLayoutGuide
{
  return self->_buttonLayoutGuide;
}

- (void)setButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLayoutGuide, a3);
}

- (OBLinkableTemplateLabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabel, a3);
}

- (int64_t)captionStyle
{
  return self->_captionStyle;
}

- (void)setCaptionStyle:(int64_t)a3
{
  self->_captionStyle = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIView)backdropContainer
{
  return self->_backdropContainer;
}

- (void)setBackdropContainer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropContainer, a3);
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (NSLayoutConstraint)buttonViewTopConstraint
{
  return self->_buttonViewTopConstraint;
}

- (void)setButtonViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewTopConstraint, a3);
}

- (NSLayoutConstraint)buttonViewBottomConstraint
{
  return self->_buttonViewBottomConstraint;
}

- (void)setButtonViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewBottomConstraint, a3);
}

- (NSLayoutConstraint)buttonViewLeadingConstraint
{
  return self->_buttonViewLeadingConstraint;
}

- (void)setButtonViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)buttonViewTrailingConstraint
{
  return self->_buttonViewTrailingConstraint;
}

- (void)setButtonViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)privacyLinkControllerLeadingConstraint
{
  return self->_privacyLinkControllerLeadingConstraint;
}

- (void)setPrivacyLinkControllerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLinkControllerLeadingConstraint, a3);
}

- (NSLayoutConstraint)privacyLinkControllerTrailingConstraint
{
  return self->_privacyLinkControllerTrailingConstraint;
}

- (void)setPrivacyLinkControllerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLinkControllerTrailingConstraint, a3);
}

- (UIView)privacyContainer
{
  return self->_privacyContainer;
}

- (void)setPrivacyContainer:(id)a3
{
  objc_storeStrong((id *)&self->_privacyContainer, a3);
}

- (BOOL)isDetached
{
  return self->_detached;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyContainer, 0);
  objc_storeStrong((id *)&self->_privacyLinkControllerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_privacyLinkControllerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_backdropContainer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end
