@implementation _TVRUILoadingCell

- (_TVRUILoadingCell)initWithFrame:(CGRect)a3
{
  _TVRUILoadingCell *v3;
  _TVRUILoadingCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRUILoadingCell;
  v3 = -[_TVRUILoadingCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVRUILoadingCell configureHierarchy](v3, "configureHierarchy");
  return v4;
}

- (void)configureHierarchy
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIActivityIndicatorView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIActivityIndicatorView *activityIndicatorView;
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
  UIActivityIndicatorView *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _TVRUILoadingCell *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[8];
  _QWORD v54[3];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  -[_TVRUILoadingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  v5 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "lightTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  v48 = self;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TVRUILoading"), &stru_24DE30718, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v9);

  v10 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v4, "addSubview:", v10);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v54[0] = v4;
  v54[1] = v5;
  v54[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v15++), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v13);
  }

  v36 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v45;
  objc_msgSend(v5, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v42;
  -[UIActivityIndicatorView leadingAnchor](v10, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 10.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v39;
  -[UIActivityIndicatorView centerYAnchor](v10, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v33;
  -[UIActivityIndicatorView trailingAnchor](v10, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v29;
  objc_msgSend(v4, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v38 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v17;
  objc_msgSend(v4, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v20;
  objc_msgSend(v4, "centerXAnchor");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v3;
  v34 = v3;
  v23 = (void *)v21;
  objc_msgSend(v22, "centerXAnchor");
  v32 = v5;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v26);

  activityIndicatorView = v48->_activityIndicatorView;
  v48->_activityIndicatorView = v38;

}

- (void)animate
{
  id v2;

  -[_TVRUILoadingCell activityIndicatorView](self, "activityIndicatorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
