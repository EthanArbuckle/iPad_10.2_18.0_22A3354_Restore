@implementation PVEffectDebugKeyRowView

- (PVEffectDebugKeyRowView)initWithFrame:(CGRect)a3 config:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PVEffectDebugKeyRowView *v10;
  PVEffectDebugKeyRowView *v11;
  id v12;
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
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
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
  objc_super v54;
  _QWORD v55[2];
  _QWORD v56[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v56[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)PVEffectDebugKeyRowView;
  v10 = -[PVEffectDebugKeyRowView initWithFrame:](&v54, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_enabled = 1;
    v12 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[PVEffectDebugKeyRowView bounds](v11, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setAlignment:", 3);
    objc_msgSend(v13, "setAxis:", 0);
    objc_msgSend(v13, "setDistribution:", 0);
    objc_msgSend(v13, "setSpacing:", 8.0);
    -[PVEffectDebugKeyRowView addSubview:](v11, "addSubview:", v13);
    v47 = (void *)MEMORY[0x1E0CB3718];
    -[PVEffectDebugKeyRowView leftAnchor](v11, "leftAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v50;
    -[PVEffectDebugKeyRowView rightAnchor](v11, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v14;
    -[PVEffectDebugKeyRowView topAnchor](v11, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v53 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v17;
    -[PVEffectDebugKeyRowView bottomAnchor](v11, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v21);

    v9 = v53;
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("icon"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugKeyRowView setIconView:](v11, "setIconView:", v22);
    objc_msgSend(v22, "image");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugKeyRowView setIcon:](v11, "setIcon:", v23);

    objc_msgSend(v22, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageWithRenderingMode:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugKeyRowView setIconTemplate:](v11, "setIconTemplate:", v25);

    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addArrangedSubview:", v22);
    v26 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v22, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    objc_msgSend(v27, "constraintEqualToConstant:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v29;
    objc_msgSend(v22, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    objc_msgSend(v30, "constraintEqualToConstant:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v33);

    v34 = objc_alloc(MEMORY[0x1E0CEA700]);
    v35 = *MEMORY[0x1E0C9D648];
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v39 = (void *)objc_msgSend(v34, "initWithFrame:", *MEMORY[0x1E0C9D648], v36, v37, v38);
    -[PVEffectDebugKeyRowView setLabelView:](v11, "setLabelView:", v39);
    objc_msgSend(v39, "font");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "fontWithSize:", 15.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFont:", v41);

    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("title"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v42);

    objc_msgSend(v39, "sizeToFit");
    objc_msgSend(v13, "addArrangedSubview:", v39);
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("action"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA38]), "initWithFrame:primaryAction:", v43, v35, v36, v37, v38);
      -[PVEffectDebugKeyRowView setSwitchView:](v11, "setSwitchView:", v44);
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("on"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setOn:", objc_msgSend(v45, "BOOLValue"));

      objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v13, "addArrangedSubview:", v44);

    }
  }

  return v11;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    if (a3)
    {
      -[PVEffectDebugKeyRowView icon](self, "icon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
    }
    else
    {
      -[PVEffectDebugKeyRowView iconTemplate](self, "iconTemplate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 2;
    }
    -[PVEffectDebugKeyRowView iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v5);

    -[PVEffectDebugKeyRowView iconView](self, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintAdjustmentMode:", v6);

    -[PVEffectDebugKeyRowView labelView](self, "labelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", v3);

    -[PVEffectDebugKeyRowView switchView](self, "switchView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", v3);

  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UILabel)labelView
{
  return self->_labelView;
}

- (void)setLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_labelView, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void)setSwitchView:(id)a3
{
  objc_storeStrong((id *)&self->_switchView, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIImage)iconTemplate
{
  return self->_iconTemplate;
}

- (void)setIconTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_iconTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTemplate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
