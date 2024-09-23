@implementation DBSBrightnessSliderCell

- (DBSBrightnessSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  DBSBrightnessSliderCell *v5;
  uint64_t v6;
  NSMutableArray *controlAndWarningLayoutConstraints;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DBSBrightnessSliderCell;
  v5 = -[PSSliderTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_opt_new();
    controlAndWarningLayoutConstraints = v5->_controlAndWarningLayoutConstraints;
    v5->_controlAndWarningLayoutConstraints = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  DBSBrightnessSliderCell *v52;
  void *v53;
  void *v54;
  char isKindOfClass;
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
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  objc_super v97;
  _QWORD v98[4];
  _QWORD v99[6];

  v99[4] = *MEMORY[0x24BDAC8D0];
  v97.receiver = self;
  v97.super_class = (Class)DBSBrightnessSliderCell;
  -[PSSliderTableCell refreshCellContentsWithSpecifier:](&v97, sel_refreshCellContentsWithSpecifier_, a3);
  v4 = (void *)MEMORY[0x24BDD1628];
  -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[DBSBrightnessSliderCell warningContainerView](self, "warningContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[DBSBrightnessSliderCell setWarningContainerView:](self, "setWarningContainerView:", 0);
  -[DBSBrightnessSliderCell setReferenceWarningLabel:](self, "setReferenceWarningLabel:", 0);
  -[PSTableCell specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brightnessLimited"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v96);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    -[DBSBrightnessSliderCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x24BEBD708]);
    v94 = (void *)v14;
    objc_msgSend(v15, "setFont:", v14);
    DBS_LocalizedStringForDisplays(CFSTR("REFERENCE_WARNING"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v16);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "altTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSBrightnessSliderCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v19);

    objc_msgSend(v15, "setNumberOfLines:", 0);
    objc_msgSend(v15, "setLineBreakMode:", 0);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "addSubview:", v11);
    objc_msgSend(v20, "addSubview:", v15);
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v20);

    -[PSControlTableCell control](self, "control");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("warningSymbolImageView, referenceWarningLabel"), v11, v15, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[warningSymbolImageView]-10-[referenceWarningLabel]-0-|"), 0, 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v26);

    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1628];
    v89 = v15;
    _NSDictionaryOfVariableBindings(CFSTR("referenceWarningLabel"), v15, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[referenceWarningLabel]-0-|"), 0, 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v30);

    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("control, warningContainerView"), v22, v20, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-8-[control]-0-[warningContainerView]-8-|"), 0, 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v34);

    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x24BDD1628];
    v93 = v22;
    v87 = v20;
    _NSDictionaryOfVariableBindings(CFSTR("warningContainerView, control"), v20, v22, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[warningContainerView(<=control)]"), 0, 0, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v38);

    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layoutMarginsGuide");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v77);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v75;
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "layoutMarginsGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v68;
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v43;
    objc_msgSend(v15, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v11;
    objc_msgSend(v11, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObjectsFromArray:", v47);

    v48 = (void *)MEMORY[0x24BDD1628];
    -[DBSBrightnessSliderCell controlAndWarningLayoutConstraints](self, "controlAndWarningLayoutConstraints");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v48;
    v51 = v89;
    objc_msgSend(v50, "activateConstraints:", v49);

    -[DBSBrightnessSliderCell setReferenceWarningLabel:](self, "setReferenceWarningLabel:", v89);
    v52 = self;
    v53 = v87;
    -[DBSBrightnessSliderCell setWarningContainerView:](v52, "setWarningContainerView:", v87);
  }
  else
  {
    -[PSControlTableCell control](self, "control");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
    -[PSControlTableCell control](self, "control");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v84 = (void *)MEMORY[0x24BDD1628];
    -[PSControlTableCell control](self, "control");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "layoutMarginsGuide");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v88 = objc_claimAutoreleasedReturnValue();
    v95 = v57;
    objc_msgSend(v57, "constraintEqualToAnchor:", v88);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v93;
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "layoutMarginsGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v78);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v76;
    -[PSControlTableCell control](self, "control");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v60, 1.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v61;
    -[DBSBrightnessSliderCell contentView](self, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSControlTableCell control](self, "control");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v65, 1.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v66;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "activateConstraints:", v67);

    v53 = (void *)v88;
    v51 = v90;

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)DBSBrightnessSliderCell;
  -[DBSBrightnessSliderCell sizeThatFits:](&v14, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PSTableCell specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brightnessLimited"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    -[UILabel intrinsicContentSize](self->_referenceWarningLabel, "intrinsicContentSize");
    v7 = v7 + v11 + 16.0;
  }
  v12 = v5;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSMutableArray)controlAndWarningLayoutConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setControlAndWarningLayoutConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UILabel)referenceWarningLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setReferenceWarningLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (UIView)warningContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setWarningContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningContainerView, 0);
  objc_storeStrong((id *)&self->_referenceWarningLabel, 0);
  objc_storeStrong((id *)&self->_controlAndWarningLayoutConstraints, 0);
}

@end
