@implementation PUParallaxLayerStackDebugStyleTableViewCell

- (id)newTonalityControl
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E59BA1E0);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_updateDelegate_, 4096);
  return v3;
}

- (id)colorButtonWithColor:(id)a3 title:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0DC3670];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v10, "setSupportsAlpha:", 0);
  objc_msgSend(v10, "setSelectedColor:", v8);

  objc_msgSend(v10, "setTitle:", v7);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_updateColor_, 4096);
  return v10;
}

- (id)intensitySliderWithWidth:(double)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0DC3C80]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setMinimumValue:", v7);
  LODWORD(v8) = 1.0;
  objc_msgSend(v6, "setMaximumValue:", v8);
  LODWORD(v9) = 1.0;
  objc_msgSend(v6, "setValue:", v9);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_updateSlider_, 4096);
  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v13);

  return v6;
}

- (void)rebuildControlsViewForStyle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *styleKind;
  void *v7;
  id v8;
  void *v9;
  UISegmentedControl *v10;
  UISegmentedControl *tonalityControl;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UISlider *v22;
  UISlider *colorSlider;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIColorWell *v32;
  UIColorWell *colorButton1;
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
  id v44;
  void *v45;
  void *v46;
  UIColorWell *v47;
  UIColorWell *v48;
  void *v49;
  void *v50;
  void *v51;
  UIColorWell *v52;
  UIColorWell *colorButton2;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "kind");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  styleKind = self->_styleKind;
  self->_styleKind = v5;

  -[PUParallaxLayerStackDebugStyleTableViewCell controlsView](self, "controlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[PUParallaxLayerStackDebugStyleTableViewCell setControlsView:](self, "setControlsView:", 0);
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D75608])
    || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755B8]))
  {
    v8 = v4;
    StackView(1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlignment:", 1);
    v10 = -[PUParallaxLayerStackDebugStyleTableViewCell newTonalityControl](self, "newTonalityControl");
    tonalityControl = self->_tonalityControl;
    self->_tonalityControl = v10;

    v12 = objc_msgSend(v8, "tonality");
    -[UISegmentedControl setSelectedSegmentIndex:](self->_tonalityControl, "setSelectedSegmentIndex:", v12 != 3);
    objc_msgSend(v9, "addArrangedSubview:", self->_tonalityControl);
    -[PUParallaxLayerStackDebugStyleTableViewCell setControlsView:](self, "setControlsView:", v9);
LABEL_17:

    goto LABEL_18;
  }
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755C8]))
  {
    v13 = v4;
    StackView(1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlignment:", 1);
    StackView(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tone");
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0D71210], "lowKeyTone");
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0D71210], "highKeyTone");
    v21 = v20;
    -[PUParallaxLayerStackDebugStyleTableViewCell intensitySliderWithWidth:](self, "intensitySliderWithWidth:", 100.0);
    v22 = (UISlider *)objc_claimAutoreleasedReturnValue();
    colorSlider = self->_colorSlider;
    self->_colorSlider = v22;

    *(float *)&v24 = v19;
    -[UISlider setMinimumValue:](self->_colorSlider, "setMinimumValue:", v24);
    *(float *)&v25 = v21;
    -[UISlider setMaximumValue:](self->_colorSlider, "setMaximumValue:", v25);
    if (v17 >= v21)
      v26 = v21;
    else
      v26 = v17;
    if (v19 >= v26)
      v26 = v19;
    *(float *)&v26 = v26;
    -[UISlider setValue:](self->_colorSlider, "setValue:", v26);
    objc_msgSend(v14, "addArrangedSubview:", self->_colorSlider);
    v27 = objc_alloc(MEMORY[0x1E0DC3658]);
    objc_msgSend(v13, "color");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend(v27, "initWithCGColor:", objc_msgSend(v28, "CGColor"));
    goto LABEL_15;
  }
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755D8])
    || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755E0])
    || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755F8]))
  {
    StackView(1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlignment:", 1);
    StackView(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "color");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "colorWithCGColor:", objc_msgSend(v31, "CGColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    -[PUParallaxLayerStackDebugStyleTableViewCell colorButtonWithColor:title:](self, "colorButtonWithColor:title:", v29, CFSTR("Color"));
    v32 = (UIColorWell *)objc_claimAutoreleasedReturnValue();
    colorButton1 = self->_colorButton1;
    self->_colorButton1 = v32;

    objc_msgSend(v14, "addArrangedSubview:", self->_colorButton1);
    objc_msgSend(v9, "addArrangedSubview:", v14);
    -[PUParallaxLayerStackDebugStyleTableViewCell setControlsView:](self, "setControlsView:", v9);
LABEL_16:

    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755D0]))
  {
    v44 = v4;
    StackView(1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlignment:", 1);
    StackView(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v44, "primaryColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "colorWithCGColor:", objc_msgSend(v46, "CGColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUParallaxLayerStackDebugStyleTableViewCell colorButtonWithColor:title:](self, "colorButtonWithColor:title:", v29, CFSTR("Primary Color"));
    v47 = (UIColorWell *)objc_claimAutoreleasedReturnValue();
    v48 = self->_colorButton1;
    self->_colorButton1 = v47;

    objc_msgSend(v14, "addArrangedSubview:", self->_colorButton1);
    v49 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v44, "secondaryColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "colorWithCGColor:", objc_msgSend(v50, "CGColor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUParallaxLayerStackDebugStyleTableViewCell colorButtonWithColor:title:](self, "colorButtonWithColor:title:", v51, CFSTR("Secondary Color"));
    v52 = (UIColorWell *)objc_claimAutoreleasedReturnValue();
    colorButton2 = self->_colorButton2;
    self->_colorButton2 = v52;

    objc_msgSend(v14, "addArrangedSubview:", self->_colorButton2);
    objc_msgSend(v9, "addArrangedSubview:", v14);
    -[PUParallaxLayerStackDebugStyleTableViewCell setControlsView:](self, "setControlsView:", v9);

    goto LABEL_16;
  }
LABEL_18:
  if (self->_controlsView)
  {
    -[PUParallaxLayerStackDebugStyleTableViewCell contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", self->_controlsView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_controlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (void *)MEMORY[0x1E0CB3718];
    -[UIView trailingAnchor](self->_controlsView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugStyleTableViewCell trailingAnchor](self, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -50.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v38;
    -[UIView centerYAnchor](self->_controlsView, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugStyleTableViewCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v43);

  }
}

- (void)applyToStyle:(id)a3
{
  UISegmentedControl *tonalityControl;
  id v5;
  uint64_t v6;
  void *v7;
  UIColorWell *colorButton1;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D75608])
    || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755B8]))
  {
    tonalityControl = self->_tonalityControl;
    v5 = v21;
    if (-[UISegmentedControl selectedSegmentIndex](tonalityControl, "selectedSegmentIndex"))
      v6 = 1;
    else
      v6 = 3;
    objc_msgSend(v5, "setTonality:", v6);
  }
  else
  {
    if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755C8]))
    {
      v7 = (void *)MEMORY[0x1E0D75170];
      colorButton1 = self->_colorButton1;
      v9 = v21;
      -[UIColorWell selectedColor](colorButton1, "selectedColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "colorWithCGColor:", objc_msgSend(v10, "CGColor"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "hue");
      v12 = v11;
      v13 = objc_alloc(MEMORY[0x1E0D75170]);
      -[UISlider value](self->_colorSlider, "value");
      v15 = (void *)objc_msgSend(v13, "initWithHue:tone:", v12, v14);
      objc_msgSend(v9, "setColor:", v15);

    }
    else if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755D8])
           || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755E0])
           || -[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755F8]))
    {
      v16 = (void *)MEMORY[0x1E0D75170];
      -[UIColorWell selectedColor](self->_colorButton1, "selectedColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setColor:", v15);
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755D0]))
        goto LABEL_15;
      v17 = (void *)MEMORY[0x1E0D75170];
      -[UIColorWell selectedColor](self->_colorButton1, "selectedColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v17, "colorWithCGColor:", objc_msgSend(v18, "CGColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPrimaryColor:", v19);

      v20 = (void *)MEMORY[0x1E0D75170];
      -[UIColorWell selectedColor](self->_colorButton2, "selectedColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSecondaryColor:", v15);
    }

  }
LABEL_15:

}

- (void)updateColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755C8]))
  {
    v4 = (void *)MEMORY[0x1E0D75170];
    objc_msgSend(v8, "selectedColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "tone");
    *(float *)&v7 = v7;
    -[UISlider setValue:](self->_colorSlider, "setValue:", v7);

  }
  -[PUParallaxLayerStackDebugStyleTableViewCell updateDelegate:](self, "updateDelegate:", v8);

}

- (void)updateSlider:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  float v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[NSString isEqualToString:](self->_styleKind, "isEqualToString:", *MEMORY[0x1E0D755C8]))
  {
    v4 = (void *)MEMORY[0x1E0D75170];
    -[UIColorWell selectedColor](self->_colorButton1, "selectedColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0D75170]);
    objc_msgSend(v6, "hue");
    v9 = v8;
    -[UISlider value](self->_colorSlider, "value");
    v11 = (void *)objc_msgSend(v7, "initWithHue:tone:", v9, v10);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(v11, "CGColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColorWell setSelectedColor:](self->_colorButton1, "setSelectedColor:", v12);

  }
  -[PUParallaxLayerStackDebugStyleTableViewCell updateDelegate:](self, "updateDelegate:", v13);

}

- (void)updateDelegate:(id)a3
{
  id v4;

  -[PUParallaxLayerStackDebugStyleTableViewCell styleCellDelegate](self, "styleCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellValueUpdated:", self);

}

- (PUParallaxLayerStackDebugStyleTableViewCellDelegate)styleCellDelegate
{
  return (PUParallaxLayerStackDebugStyleTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_styleCellDelegate);
}

- (void)setStyleCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_styleCellDelegate, a3);
}

- (NSString)styleKind
{
  return self->_styleKind;
}

- (void)setStyleKind:(id)a3
{
  objc_storeStrong((id *)&self->_styleKind, a3);
}

- (UIView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsView, a3);
}

- (UISlider)colorSlider
{
  return self->_colorSlider;
}

- (void)setColorSlider:(id)a3
{
  objc_storeStrong((id *)&self->_colorSlider, a3);
}

- (UIColorWell)colorButton1
{
  return self->_colorButton1;
}

- (void)setColorButton1:(id)a3
{
  objc_storeStrong((id *)&self->_colorButton1, a3);
}

- (UIColorWell)colorButton2
{
  return self->_colorButton2;
}

- (void)setColorButton2:(id)a3
{
  objc_storeStrong((id *)&self->_colorButton2, a3);
}

- (UISegmentedControl)tonalityControl
{
  return self->_tonalityControl;
}

- (void)setTonalityControl:(id)a3
{
  objc_storeStrong((id *)&self->_tonalityControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tonalityControl, 0);
  objc_storeStrong((id *)&self->_colorButton2, 0);
  objc_storeStrong((id *)&self->_colorButton1, 0);
  objc_storeStrong((id *)&self->_colorSlider, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_styleKind, 0);
  objc_destroyWeak((id *)&self->_styleCellDelegate);
}

@end
