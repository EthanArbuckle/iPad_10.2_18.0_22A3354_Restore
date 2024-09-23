@implementation STTableCell

- (STTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STTableCell *v5;
  uint64_t v6;
  NSMutableArray *childViewControllers;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UILayoutGuide *contentLayoutGuide;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *rtlContentLayoutGuideConstraints;
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
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;
  _QWORD v61[14];

  v61[12] = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)STTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v60, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_opt_new();
    childViewControllers = v5->_childViewControllers;
    v5->_childViewControllers = (NSMutableArray *)v6;

    -[STTableCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", CFSTR(" "));
    objc_msgSend(v8, "setHidden:", 1);
    -[PSTableCell valueLabel](v5, "valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    v55 = -[STTableCell effectiveUserInterfaceLayoutDirection](v5, "effectiveUserInterfaceLayoutDirection");
    if (v55 == 1)
    {
      -[STTableCell setNeedsLayout](v5, "setNeedsLayout");
      -[STTableCell layoutIfNeeded](v5, "layoutIfNeeded");
    }
    -[STTableCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    objc_msgSend(v10, "addLayoutGuide:", v11);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v10, "addLayoutGuide:", v12);
    v13 = objc_opt_new();
    contentLayoutGuide = v5->_contentLayoutGuide;
    v5->_contentLayoutGuide = (UILayoutGuide *)v13;

    objc_msgSend(v10, "addLayoutGuide:", v5->_contentLayoutGuide);
    -[UILayoutGuide topAnchor](v5->_contentLayoutGuide, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v52;
    -[UILayoutGuide bottomAnchor](v5->_contentLayoutGuide, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v49;
    objc_msgSend(v11, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v5->_contentLayoutGuide, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v46;
    objc_msgSend(v11, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v5->_contentLayoutGuide, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v43;
    objc_msgSend(v11, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v40;
    objc_msgSend(v11, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v5->_contentLayoutGuide, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61[5] = v37;
    objc_msgSend(v12, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v5->_contentLayoutGuide, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v61[6] = v33;
    objc_msgSend(v12, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v5->_contentLayoutGuide, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61[7] = v30;
    objc_msgSend(v12, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v5->_contentLayoutGuide, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61[8] = v27;
    objc_msgSend(v12, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v10;
    objc_msgSend(v10, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61[9] = v17;
    objc_msgSend(v11, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v8;
    objc_msgSend(v8, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v61[10] = v20;
    v57 = v11;
    objc_msgSend(v11, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v12;
    objc_msgSend(v12, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61[11] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55 == 1)
    {
      v24 = v36;
      rtlContentLayoutGuideConstraints = v5->_rtlContentLayoutGuideConstraints;
      v5->_rtlContentLayoutGuideConstraints = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v36);
      rtlContentLayoutGuideConstraints = v5->_rtlContentLayoutGuideConstraints;
      v5->_rtlContentLayoutGuideConstraints = 0;
    }

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STTableCell rtlContentLayoutGuideConstraints](self, "rtlContentLayoutGuideConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[STTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[STTableCell superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
        -[STTableCell setRtlContentLayoutGuideConstraints:](self, "setRtlContentLayoutGuideConstraints:", 0);
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)STTableCell;
  -[PSTableCell layoutSubviews](&v5, sel_layoutSubviews);

}

- (BOOL)canReload
{
  return 1;
}

- (void)willMoveToSuperview:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)STTableCell;
  -[STTableCell willMoveToSuperview:](&v26, sel_willMoveToSuperview_);
  -[STTableCell parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[STTableCell superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 && !v6)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[STTableCell childViewControllers](self, "childViewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v5, "addChildViewController:", v12);
            objc_msgSend(v12, "didMoveToParentViewController:", v5);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v9);
      }
LABEL_21:

      goto LABEL_22;
    }
    if (!a3 && v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[STTableCell childViewControllers](self, "childViewControllers", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v7);
            v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
            objc_msgSend(v17, "willMoveToParentViewController:", 0);
            objc_msgSend(v17, "removeFromParentViewController");
          }
          v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        }
        while (v14);
      }
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSMutableArray)childViewControllers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1208, 1);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (NSArray)rtlContentLayoutGuideConstraints
{
  return self->_rtlContentLayoutGuideConstraints;
}

- (void)setRtlContentLayoutGuideConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtlContentLayoutGuideConstraints, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_childViewControllers, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
