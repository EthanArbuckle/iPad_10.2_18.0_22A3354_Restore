@implementation ICSDataclassSpecifierCell

- (ICSDataclassSpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ICSDataclassSpecifierCell *v4;
  ICSDataclassSpecifierCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSDataclassSpecifierCell;
  v4 = -[ICSDataclassSpecifierCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ICSDataclassSpecifierCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[ICSDataclassSpecifierCell _setupViews](v5, "_setupViews");
  }
  return v5;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  _QWORD v98[14];

  v98[12] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD668]);
  -[ICSDataclassSpecifierCell setHeaderImageView:](self, "setHeaderImageView:", v3);

  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 1);

  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1132068864;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v7);

  v8 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[ICSDataclassSpecifierCell setHeaderTitleLabel:](self, "setHeaderTitleLabel:", v8);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE248], *MEMORY[0x24BEBB5E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v13);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 5);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextAlignment:", 1);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);

  v18 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  -[ICSDataclassSpecifierCell setHeaderSubTitleTextView:](self, "setHeaderSubTitleTextView:", v18);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[ICSDataclassSpecifierCell _subTitleFont](ICSDataclassSpecifierCell, "_subTitleFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  v22 = *MEMORY[0x24BEBE158];
  v23 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v24 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v25 = *(double *)(MEMORY[0x24BEBE158] + 24);
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLayoutMargins:", v22, v23, v24, v25);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextContainerInset:", v22, v23, v24, v25);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 1);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setScrollEnabled:", 0);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSelectable:", 1);

  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEditable:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v35);

  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v37);

  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", v39);

  v75 = (void *)MEMORY[0x24BDD1628];
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "heightAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToConstant:", 56.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v95;
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "widthAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", 56.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v92;
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v88, 24.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v87;
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "centerXAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "centerXAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v82;
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, 32.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v77;
  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, -16.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v98[5] = v71;
  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 24.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v98[6] = v66;
  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v98[7] = v61;
  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -8.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v98[8] = v56;
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 24.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v98[9] = v51;
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerXAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v98[10] = v43;
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, -12.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v98[11] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "activateConstraints:", v49);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSDataclassSpecifierCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v15, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSTableCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_251C6B070);

  -[ICSDataclassSpecifierCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

  -[ICSDataclassSpecifierCell headerImageView](self, "headerImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  -[ICSDataclassSpecifierCell headerTitleLabel](self, "headerTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  +[ICSDataclassSpecifierCell _attributedStringFromSpecifier:](ICSDataclassSpecifierCell, "_attributedStringFromSpecifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierCell headerSubTitleTextView](self, "headerSubTitleTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setAttributedText:", v11);
  }
  else
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);

  }
  -[ICSDataclassSpecifierCell setNeedsLayout](self, "setNeedsLayout");

}

+ (id)_subTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB608]);
}

+ (id)_subTitleAttributes
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v3, "setAlignment:", 1);
  v7[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(a1, "_subTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = *MEMORY[0x24BEBB3A8];
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (_NSRange)_rangeForLinkFromSpecifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v3 = *MEMORY[0x24BE75D28];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAUIDataclassAttributedLinkText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AAUIDataclassAttributedLink"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("%@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 2)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "length");
      v11 = objc_msgSend(v7, "length");

    }
    else
    {
      v10 = 0;
      v11 = 0;
    }

  }
  v14 = v10;
  v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

+ (id)_attributedStringFromSpecifier:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE75D28];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AAUIDataclassAttributedLinkText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AAUIDataclassAttributedLink"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("%@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 2)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x24BEBB368];
      v13 = v28;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v25, v24);
      v26[0] = v13;
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      v26[1] = *MEMORY[0x24BEBB388];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v18);
      objc_msgSend(v15, "appendAttributedString:", v19);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v23);
      objc_msgSend(v15, "appendAttributedString:", v20);
      objc_msgSend(a1, "_subTitleAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAttributes:range:", v21, 0, objc_msgSend(v15, "length"));

      v11 = (void *)objc_msgSend(v15, "copy");
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleLabel, a3);
}

- (UITextView)headerSubTitleTextView
{
  return self->_headerSubTitleTextView;
}

- (void)setHeaderSubTitleTextView:(id)a3
{
  objc_storeStrong((id *)&self->_headerSubTitleTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubTitleTextView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end
