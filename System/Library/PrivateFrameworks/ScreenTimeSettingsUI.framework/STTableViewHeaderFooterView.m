@implementation STTableViewHeaderFooterView

- (STTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  return -[STTableViewHeaderFooterView initWithReuseIdentifier:useLayoutMarginsGuide:](self, "initWithReuseIdentifier:useLayoutMarginsGuide:", a3, 0);
}

- (STTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3 useLayoutMarginsGuide:(BOOL)a4
{
  _BOOL4 v4;
  STTableViewHeaderFooterView *v5;
  STTableViewHeaderFooterView *v6;
  void *v7;
  uint64_t v8;
  UILayoutGuide *contentLayoutGuide;
  NSArray *rtlContentLayoutGuideConstraints;
  NSArray *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UILayoutGuide *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
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
  NSArray *v58;
  void *v59;
  objc_super v60;
  objc_super v61;
  objc_super v62;
  _QWORD v63[14];

  v4 = a4;
  v63[12] = *MEMORY[0x24BDAC8D0];
  v62.receiver = self;
  v62.super_class = (Class)STTableViewHeaderFooterView;
  v5 = -[STTableViewHeaderFooterView initWithReuseIdentifier:](&v62, sel_initWithReuseIdentifier_, a3);
  v6 = v5;
  if (v5)
  {
    -[STTableViewHeaderFooterView setTableViewStyle:](v5, "setTableViewStyle:", 1);
    -[STTableViewHeaderFooterView textLabel](v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR(" "));
    objc_msgSend(v7, "setHidden:", 1);
    v61.receiver = v6;
    v61.super_class = (Class)STTableViewHeaderFooterView;
    -[STTableViewHeaderFooterView setNeedsLayout](&v61, sel_setNeedsLayout);
    v60.receiver = v6;
    v60.super_class = (Class)STTableViewHeaderFooterView;
    -[STTableViewHeaderFooterView layoutIfNeeded](&v60, sel_layoutIfNeeded);
    if (v4)
    {
      -[STTableViewHeaderFooterView layoutMarginsGuide](v6, "layoutMarginsGuide");
      v8 = objc_claimAutoreleasedReturnValue();
      contentLayoutGuide = v6->_contentLayoutGuide;
      v6->_contentLayoutGuide = (UILayoutGuide *)v8;

      rtlContentLayoutGuideConstraints = v6->_rtlContentLayoutGuideConstraints;
      v6->_rtlContentLayoutGuideConstraints = 0;
    }
    else
    {
      -[STTableViewHeaderFooterView contentView](v6, "contentView");
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      -[NSArray addLayoutGuide:](v11, "addLayoutGuide:", v12);
      v13 = (void *)objc_opt_new();
      -[NSArray addLayoutGuide:](v11, "addLayoutGuide:", v13);
      v14 = objc_opt_new();
      v15 = v6->_contentLayoutGuide;
      v6->_contentLayoutGuide = (UILayoutGuide *)v14;

      -[NSArray addLayoutGuide:](v11, "addLayoutGuide:", v6->_contentLayoutGuide);
      -[UILayoutGuide topAnchor](v6->_contentLayoutGuide, "topAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray topAnchor](v11, "topAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v54);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v53;
      -[UILayoutGuide bottomAnchor](v6->_contentLayoutGuide, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray bottomAnchor](v11, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v51);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v50;
      objc_msgSend(v12, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](v6->_contentLayoutGuide, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v47;
      objc_msgSend(v12, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](v6->_contentLayoutGuide, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v45);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v63[3] = v44;
      objc_msgSend(v12, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray leadingAnchor](v11, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63[4] = v41;
      objc_msgSend(v12, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](v6->_contentLayoutGuide, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v63[5] = v38;
      objc_msgSend(v13, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](v6->_contentLayoutGuide, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v36);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v63[6] = v35;
      objc_msgSend(v13, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](v6->_contentLayoutGuide, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v63[7] = v32;
      objc_msgSend(v13, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](v6->_contentLayoutGuide, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v63[8] = v29;
      objc_msgSend(v13, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v11;
      -[NSArray trailingAnchor](v11, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v63[9] = v17;
      objc_msgSend(v12, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v7;
      objc_msgSend(v7, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v63[10] = v20;
      v57 = v12;
      objc_msgSend(v12, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v13;
      objc_msgSend(v13, "widthAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63[11] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[STTableViewHeaderFooterView effectiveUserInterfaceLayoutDirection](v6, "effectiveUserInterfaceLayoutDirection"))
      {
        v25 = v24;
        v26 = v6->_rtlContentLayoutGuideConstraints;
        v6->_rtlContentLayoutGuideConstraints = v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v24);
        v26 = v6->_rtlContentLayoutGuideConstraints;
        v6->_rtlContentLayoutGuideConstraints = 0;
      }

      rtlContentLayoutGuideConstraints = v58;
      v7 = v59;
    }

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[STTableViewHeaderFooterView rtlContentLayoutGuideConstraints](self, "rtlContentLayoutGuideConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[STTableViewHeaderFooterView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[STTableViewHeaderFooterView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
        -[STTableViewHeaderFooterView setRtlContentLayoutGuideConstraints:](self, "setRtlContentLayoutGuideConstraints:", 0);
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)STTableViewHeaderFooterView;
  -[STTableViewHeaderFooterView layoutSubviews](&v5, sel_layoutSubviews);

}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSArray)rtlContentLayoutGuideConstraints
{
  return self->_rtlContentLayoutGuideConstraints;
}

- (void)setRtlContentLayoutGuideConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtlContentLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
