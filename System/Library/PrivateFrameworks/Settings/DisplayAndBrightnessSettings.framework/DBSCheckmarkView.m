@implementation DBSCheckmarkView

- (DBSCheckmarkView)initWithFrame:(CGRect)a3
{
  DBSCheckmarkView *v3;
  DBSCheckmarkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSCheckmarkView;
  v3 = -[DBSCheckmarkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selected = 0;
    -[DBSCheckmarkView _configureView](v3, "_configureView");
  }
  return v4;
}

- (void)_configureView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  id v75;

  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  -[DBSCheckmarkView set_checkmarkImageView:](self, "set_checkmarkImageView:", v8);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("checkmark.circle.fill"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_imageThatSuppressesAccessibilityHairlineThickening");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMode:", 4);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

  v17 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPreferredSymbolConfiguration:", v18);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView addSubview:](self, "addSubview:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v4, v5, v6, v7);
  -[DBSCheckmarkView set_circleImageView:](self, "set_circleImageView:", v21);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("circle"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageWithRenderingMode:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v23);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentMode:", 4);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v28);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", v17, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPreferredSymbolConfiguration:", v30);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView addSubview:](self, "addSubview:", v32);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v75 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView leadingAnchor](self, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v36);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView trailingAnchor](self, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v40);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView topAnchor](self, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v44);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView bottomAnchor](self, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v48);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView leadingAnchor](self, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v52);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView trailingAnchor](self, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v56);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView topAnchor](self, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v60);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView bottomAnchor](self, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v64);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "widthAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:multiplier:", v68, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v69);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "widthAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:multiplier:", v73, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObject:", v74);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v75);
}

- (void)_updateViewState
{
  _BOOL4 v3;
  _OWORD *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  memset(&v14, 0, sizeof(v14));
  v3 = -[DBSCheckmarkView isSelected](self, "isSelected");
  v4 = (_OWORD *)MEMORY[0x24BDBD8B8];
  if (v3)
  {
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v14.c = v5;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.01, 0.01);
  }
  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4[1];
  *(_OWORD *)&v13.a = *v4;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = v4[2];
  objc_msgSend(v6, "setTransform:", &v13);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v8, "setTransform:", &v13);

  -[DBSCheckmarkView _checkmarkImageView](self, "_checkmarkImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DBSCheckmarkView isSelected](self, "isSelected"))
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v9, "setAlpha:", v10);

  -[DBSCheckmarkView _circleImageView](self, "_circleImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DBSCheckmarkView isSelected](self, "isSelected"))
    v12 = 0.0;
  else
    v12 = 1.0;
  objc_msgSend(v11, "setAlpha:", v12);

}

- (void)setSelected:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_selected != a3)
  {
    self->_selected = a3;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __32__DBSCheckmarkView_setSelected___block_invoke;
    v3[3] = &unk_24F025E70;
    v3[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2054, v3, 0);
  }
}

uint64_t __32__DBSCheckmarkView_setSelected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewState");
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)_checkmarkImageView
{
  return self->__checkmarkImageView;
}

- (void)set_checkmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->__checkmarkImageView, a3);
}

- (UIImageView)_circleImageView
{
  return self->__circleImageView;
}

- (void)set_circleImageView:(id)a3
{
  objc_storeStrong((id *)&self->__circleImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__circleImageView, 0);
  objc_storeStrong((id *)&self->__checkmarkImageView, 0);
}

@end
