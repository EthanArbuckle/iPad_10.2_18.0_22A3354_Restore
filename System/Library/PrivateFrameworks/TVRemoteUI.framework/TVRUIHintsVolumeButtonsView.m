@implementation TVRUIHintsVolumeButtonsView

- (TVRUIHintsVolumeButtonsView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5 buttonHeight:(double)a6
{
  uint64_t v7;
  id v11;
  TVRUIHintsVolumeButtonsView *v12;
  TVRUIHintsVolumeButtonsView *v13;
  id *p_styleProvider;
  uint64_t v15;
  NSMutableArray *buttonConstraints;
  UIView *v17;
  UIView *volumeUpButtonView;
  double v19;
  double v20;
  void *v21;
  void *v22;
  UIView *v23;
  UIView *volumeDownButtonView;
  double v25;
  double v26;
  void *v27;
  void *v28;
  TVRUIHintsGlyphView *v29;
  void *v30;
  uint64_t v31;
  TVRUIHintsGlyphView *glyphView;
  objc_super v34;

  v7 = *(_QWORD *)&a5;
  v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)TVRUIHintsVolumeButtonsView;
  v12 = -[TVRUIHintsVolumeButtonsView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v13 = v12;
  if (v12)
  {
    p_styleProvider = (id *)&v12->_styleProvider;
    objc_storeStrong((id *)&v12->_styleProvider, a4);
    v13->_presentation = a3;
    v13->_buttonHeight = a6;
    v13->_buttonEdge = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    buttonConstraints = v13->_buttonConstraints;
    v13->_buttonConstraints = (NSMutableArray *)v15;

    v17 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    volumeUpButtonView = v13->_volumeUpButtonView;
    v13->_volumeUpButtonView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13->_volumeUpButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_styleProvider, "buttonOutlineWidth");
    v20 = v19;
    -[UIView layer](v13->_volumeUpButtonView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", v20);

    objc_msgSend(*p_styleProvider, "primaryTintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->_volumeUpButtonView, "setBackgroundColor:", v22);

    -[TVRUIHintsVolumeButtonsView addSubview:](v13, "addSubview:", v13->_volumeUpButtonView);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    volumeDownButtonView = v13->_volumeDownButtonView;
    v13->_volumeDownButtonView = v23;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13->_volumeDownButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_styleProvider, "buttonOutlineWidth");
    v26 = v25;
    -[UIView layer](v13->_volumeDownButtonView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", v26);

    objc_msgSend(*p_styleProvider, "primaryTintColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->_volumeDownButtonView, "setBackgroundColor:", v28);

    -[TVRUIHintsVolumeButtonsView addSubview:](v13, "addSubview:", v13->_volumeDownButtonView);
    v29 = [TVRUIHintsGlyphView alloc];
    objc_msgSend(*p_styleProvider, "volumeImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TVRUIHintsGlyphView initWithImage:styleProvider:](v29, "initWithImage:styleProvider:", v30, *p_styleProvider);
    glyphView = v13->_glyphView;
    v13->_glyphView = (TVRUIHintsGlyphView *)v31;

    -[TVRUIHintsGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v13->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIHintsVolumeButtonsView addSubview:](v13, "addSubview:", v13->_glyphView);
    -[TVRUIHintsVolumeButtonsView _updateViewForButtonEdge:](v13, "_updateViewForButtonEdge:", v7);
  }

  return v13;
}

- (void)setPresentation:(unint64_t)a3
{
  if (self->_presentation != a3)
  {
    self->_presentation = a3;
    -[TVRUIHintsVolumeButtonsView _updateViewForButtonEdge:](self, "_updateViewForButtonEdge:", -[TVRUIHintsVolumeButtonsView buttonEdge](self, "buttonEdge"));
  }
}

- (void)_updateViewForButtonEdge:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  unint64_t presentation;
  UIView *volumeDownButtonView;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  -[TVRUIHintsStyleProvider buttonOutlineWidth](self->_styleProvider, "buttonOutlineWidth");
  v6 = v5;
  presentation = self->_presentation;
  switch(presentation)
  {
    case 0uLL:
      -[TVRUIHintsGlyphView setAlpha:](self->_glyphView, "setAlpha:", 1.0);
      -[UIView setAlpha:](self->_volumeUpButtonView, "setAlpha:", 1.0);
      -[UIView setAlpha:](self->_volumeDownButtonView, "setAlpha:", 1.0);
      goto LABEL_10;
    case 1uLL:
      -[TVRUIHintsGlyphView setAlpha:](self->_glyphView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_volumeUpButtonView, "setAlpha:", 1.0);
      volumeDownButtonView = self->_volumeDownButtonView;
      v9 = 0.0;
      break;
    case 2uLL:
      -[TVRUIHintsGlyphView setAlpha:](self->_glyphView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_volumeUpButtonView, "setAlpha:", 0.0);
      volumeDownButtonView = self->_volumeDownButtonView;
      v9 = 1.0;
      break;
    default:
      goto LABEL_10;
  }
  -[UIView setAlpha:](volumeDownButtonView, "setAlpha:", v9);
  -[TVRUIHintsVolumeButtonsView styleProvider](self, "styleProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "supportsSBHints"))
  {
    -[TVRUIHintsVolumeButtonsView styleProvider](self, "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hintButtonWidth");
    v6 = v12;

  }
LABEL_10:
  -[UIView layer](self->_volumeUpButtonView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v6);

  -[UIView layer](self->_volumeDownButtonView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v6);

  -[TVRUIHintsVolumeButtonsView _setupConstraintsForButtonEdge:buttonWidth:](self, "_setupConstraintsForButtonEdge:buttonWidth:", v3, v6);
}

- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  NSMutableArray *buttonConstraints;
  void *v22;
  double v23;
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
  uint64_t v35;
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
  NSMutableArray *v52;
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
  _QWORD v68[12];

  v68[10] = *MEMORY[0x24BDAC8D0];
  -[TVRUIHintsVolumeButtonsView buttonConstraints](self, "buttonConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0x24BDD1000uLL;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD1628];
    -[TVRUIHintsVolumeButtonsView buttonConstraints](self, "buttonConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[TVRUIHintsVolumeButtonsView buttonConstraints](self, "buttonConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

  }
  if (a3 == 2)
  {
    buttonConstraints = self->_buttonConstraints;
    -[TVRUIHintsVolumeButtonsView _constraintsForLeftAndRightSideButtonsWithButtonWidth:](self, "_constraintsForLeftAndRightSideButtonsWithButtonWidth:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](buttonConstraints, "addObjectsFromArray:", v22);

    v14 = self->_buttonConstraints;
    -[TVRUIHintsVolumeButtonsView glyphView](self, "glyphView");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject rightAnchor](v15, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsVolumeButtonsView styleProvider](self, "styleProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageMargin");
    v20 = -v23;
  }
  else
  {
    if (a3 == 1)
    {
      v52 = self->_buttonConstraints;
      -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "heightAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToConstant:", a4 + a4);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v65;
      -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "leftAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView leftAnchor](self, "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v61;
      -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "widthAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView buttonHeight](self, "buttonHeight");
      objc_msgSend(v59, "constraintEqualToConstant:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v58;
      -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView bottomAnchor](self, "bottomAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, a4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v54;
      -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "heightAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToConstant:", a4 + a4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v68[4] = v50;
      -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "widthAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView buttonHeight](self, "buttonHeight");
      objc_msgSend(v48, "constraintEqualToConstant:");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v68[5] = v47;
      -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "rightAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView rightAnchor](self, "rightAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v44);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v68[6] = v43;
      -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView bottomAnchor](self, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, a4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68[7] = v39;
      -[TVRUIHintsVolumeButtonsView glyphView](self, "glyphView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "centerXAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView centerXAnchor](self, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v68[8] = v27;
      -[TVRUIHintsVolumeButtonsView glyphView](self, "glyphView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsStyleProvider imageMargin](self->_styleProvider, "imageMargin");
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v68[9] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v52, "addObjectsFromArray:", v33);

      v8 = 0x24BDD1000;
      goto LABEL_13;
    }
    if (a3)
    {
      _TVRUIHintsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[TVRUIHintsVolumeButtonsView _setupConstraintsForButtonEdge:buttonWidth:].cold.1(v15);
      goto LABEL_12;
    }
    v12 = self->_buttonConstraints;
    -[TVRUIHintsVolumeButtonsView _constraintsForLeftAndRightSideButtonsWithButtonWidth:](self, "_constraintsForLeftAndRightSideButtonsWithButtonWidth:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v13);

    v14 = self->_buttonConstraints;
    -[TVRUIHintsVolumeButtonsView glyphView](self, "glyphView");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject leftAnchor](v15, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsVolumeButtonsView styleProvider](self, "styleProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageMargin");
  }
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v14, "addObject:", v24);

LABEL_12:
LABEL_13:
  -[TVRUIHintsVolumeButtonsView buttonConstraints](self, "buttonConstraints");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = *(void **)(v8 + 1576);
    -[TVRUIHintsVolumeButtonsView buttonConstraints](self, "buttonConstraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v37);

  }
}

- (id)_constraintsForLeftAndRightSideButtonsWithButtonWidth:(double)a3
{
  double v5;
  double v6;
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
  id v18;
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
  _QWORD v43[11];

  v43[9] = *MEMORY[0x24BDAC8D0];
  -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3 + a3;
  objc_msgSend(v41, "constraintEqualToConstant:", a3 + a3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leftAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView leftAnchor](self, "leftAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -a3;
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v36;
  -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView topAnchor](self, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v32;
  -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView buttonHeight](self, "buttonHeight");
  objc_msgSend(v30, "constraintEqualToConstant:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v29;
  -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v26;
  -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView leftAnchor](self, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v22;
  -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v7;
  -[TVRUIHintsVolumeButtonsView volumeDownButtonView](self, "volumeDownButtonView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView volumeUpButtonView](self, "volumeUpButtonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v12;
  -[TVRUIHintsVolumeButtonsView glyphView](self, "glyphView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsVolumeButtonsView centerYAnchor](self, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 9);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (TVRUIHintsGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (UIView)volumeUpButtonView
{
  return self->_volumeUpButtonView;
}

- (void)setVolumeUpButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_volumeUpButtonView, a3);
}

- (UIView)volumeDownButtonView
{
  return self->_volumeDownButtonView;
}

- (void)setVolumeDownButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_volumeDownButtonView, a3);
}

- (unint64_t)presentation
{
  return self->_presentation;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (NSMutableArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (unsigned)buttonEdge
{
  return self->_buttonEdge;
}

- (void)setButtonEdge:(unsigned int)a3
{
  self->_buttonEdge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_volumeDownButtonView, 0);
  objc_storeStrong((id *)&self->_volumeUpButtonView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

- (void)_setupConstraintsForButtonEdge:(os_log_t)log buttonWidth:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21B042000, log, OS_LOG_TYPE_FAULT, "Volume buttons edge is being reported as the bottom of the device", v1, 2u);
}

@end
