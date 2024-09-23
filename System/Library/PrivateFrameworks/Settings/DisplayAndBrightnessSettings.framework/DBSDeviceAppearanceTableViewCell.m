@implementation DBSDeviceAppearanceTableViewCell

- (DBSDeviceAppearanceTableViewCell)init
{
  DBSDeviceAppearanceTableViewCell *v2;
  DBSDeviceAppearanceTableViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DBSDeviceAppearanceTableViewCell;
  v2 = -[DBSDeviceAppearanceTableViewCell init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DBSDeviceAppearanceTableViewCell _configureView](v2, "_configureView");
  return v3;
}

- (DBSDeviceAppearanceTableViewCell)initWithFrame:(CGRect)a3
{
  DBSDeviceAppearanceTableViewCell *v3;
  DBSDeviceAppearanceTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSDeviceAppearanceTableViewCell;
  v3 = -[DBSDeviceAppearanceTableViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DBSDeviceAppearanceTableViewCell _configureView](v3, "_configureView");
  return v4;
}

- (DBSDeviceAppearanceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DBSDeviceAppearanceTableViewCell *v4;
  DBSDeviceAppearanceTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBSDeviceAppearanceTableViewCell;
  v4 = -[DBSDeviceAppearanceTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[DBSDeviceAppearanceTableViewCell _configureView](v4, "_configureView");
  return v5;
}

- (DBSDeviceAppearanceTableViewCell)initWithCoder:(id)a3
{
  DBSDeviceAppearanceTableViewCell *v3;
  DBSDeviceAppearanceTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSDeviceAppearanceTableViewCell;
  v3 = -[DBSDeviceAppearanceTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DBSDeviceAppearanceTableViewCell _configureView](v3, "_configureView");
  return v4;
}

- (void)_configureView
{
  DBSDeviceAppearanceOptionView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  DBSDeviceAppearanceOptionView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DBSDeviceAppearanceOptionView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
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
  id v89;

  v3 = [DBSDeviceAppearanceOptionView alloc];
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[DBSDeviceAppearanceOptionView initWithFrame:appearanceOption:](v3, "initWithFrame:appearanceOption:", 0, *MEMORY[0x24BDBF090], v5, v6, v7);
  -[DBSDeviceAppearanceTableViewCell set_lightOptionView:](self, "set_lightOptionView:", v8);

  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("DBSDeviceAppearanceOptionLight"));

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = -[DBSDeviceAppearanceOptionView initWithFrame:appearanceOption:]([DBSDeviceAppearanceOptionView alloc], "initWithFrame:appearanceOption:", 1, v4, v5, v6, v7);
  -[DBSDeviceAppearanceTableViewCell set_darkOptionView:](self, "set_darkOptionView:", v14);

  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("DBSDeviceAppearanceOptionDark"));

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDeviceAppearanceTableViewCell set_leadingGuide:](self, "set_leadingGuide:", v20);

  v21 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDeviceAppearanceTableViewCell set_middleGuide:](self, "set_middleGuide:", v21);

  v22 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDeviceAppearanceTableViewCell set_trailingGuide:](self, "set_trailingGuide:", v22);

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _leadingGuide](self, "_leadingGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addLayoutGuide:", v24);

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _middleGuide](self, "_middleGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addLayoutGuide:", v26);

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _trailingGuide](self, "_trailingGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addLayoutGuide:", v28);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _leadingGuide](self, "_leadingGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v33);

  -[DBSDeviceAppearanceTableViewCell _leadingGuide](self, "_leadingGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v38);

  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _middleGuide](self, "_middleGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v43);

  -[DBSDeviceAppearanceTableViewCell _middleGuide](self, "_middleGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v48);

  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _trailingGuide](self, "_trailingGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v53);

  -[DBSDeviceAppearanceTableViewCell _trailingGuide](self, "_trailingGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v58);

  -[DBSDeviceAppearanceTableViewCell _leadingGuide](self, "_leadingGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _middleGuide](self, "_middleGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v62, 1.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v63);

  -[DBSDeviceAppearanceTableViewCell _middleGuide](self, "_middleGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _trailingGuide](self, "_trailingGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:multiplier:", v67, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v68);

  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v72, 2.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v73);

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _lightOptionView](self, "_lightOptionView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v77, 2.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v78);

  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v82, 2.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v83);

  -[DBSDeviceAppearanceTableViewCell contentView](self, "contentView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDeviceAppearanceTableViewCell _darkOptionView](self, "_darkOptionView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v87, 2.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "addObject:", v88);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v89);
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)userDidTapOnAppearanceOptionView:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;

  v4 = objc_msgSend(a3, "appearanceOption");
  -[DBSDeviceAppearanceTableViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    -[DBSDeviceAppearanceTableViewCell delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceAppearanceTableViewCellUserDidTapOnDarkAppearance:", self);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[DBSDeviceAppearanceTableViewCell delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceAppearanceTableViewCellUserDidTapOnLightAppearance:", self);
  }

}

- (DBSDeviceAppearanceTableViewCellDelegate)delegate
{
  return (DBSDeviceAppearanceTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DBSDeviceAppearanceOptionView)_lightOptionView
{
  return self->__lightOptionView;
}

- (void)set_lightOptionView:(id)a3
{
  objc_storeStrong((id *)&self->__lightOptionView, a3);
}

- (DBSDeviceAppearanceOptionView)_darkOptionView
{
  return self->__darkOptionView;
}

- (void)set_darkOptionView:(id)a3
{
  objc_storeStrong((id *)&self->__darkOptionView, a3);
}

- (UILayoutGuide)_leadingGuide
{
  return self->__leadingGuide;
}

- (void)set_leadingGuide:(id)a3
{
  objc_storeStrong((id *)&self->__leadingGuide, a3);
}

- (UILayoutGuide)_middleGuide
{
  return self->__middleGuide;
}

- (void)set_middleGuide:(id)a3
{
  objc_storeStrong((id *)&self->__middleGuide, a3);
}

- (UILayoutGuide)_trailingGuide
{
  return self->__trailingGuide;
}

- (void)set_trailingGuide:(id)a3
{
  objc_storeStrong((id *)&self->__trailingGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trailingGuide, 0);
  objc_storeStrong((id *)&self->__middleGuide, 0);
  objc_storeStrong((id *)&self->__leadingGuide, 0);
  objc_storeStrong((id *)&self->__darkOptionView, 0);
  objc_storeStrong((id *)&self->__lightOptionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
