@implementation TVRUIHintsUserIntentButtonView

- (TVRUIHintsUserIntentButtonView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5
{
  uint64_t v5;
  id v9;
  TVRUIHintsUserIntentButtonView *v10;
  TVRUIHintsUserIntentButtonView *v11;
  id *p_styleProvider;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TVRUIHintsGlyphView *v19;
  TVRUIHintsGlyphView *glyphView;
  objc_super v22;

  v5 = *(_QWORD *)&a5;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TVRUIHintsUserIntentButtonView;
  v10 = -[TVRUIHintsUserIntentButtonView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    p_styleProvider = (id *)&v10->_styleProvider;
    objc_storeStrong((id *)&v10->_styleProvider, a4);
    v11->_presentation = a3;
    v11->_buttonEdge = v5;
    v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[TVRUIHintsUserIntentButtonView setButtonOutline:](v11, "setButtonOutline:", v13);

    -[TVRUIHintsUserIntentButtonView buttonOutline](v11, "buttonOutline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(*p_styleProvider, "primaryTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](v11, "buttonOutline");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[TVRUIHintsUserIntentButtonView buttonOutline](v11, "buttonOutline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView addSubview:](v11, "addSubview:", v17);

    objc_msgSend(*p_styleProvider, "siriImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TVRUIHintsGlyphView initWithImage:styleProvider:]([TVRUIHintsGlyphView alloc], "initWithImage:styleProvider:", v18, *p_styleProvider);
    glyphView = v11->_glyphView;
    v11->_glyphView = v19;

    -[TVRUIHintsGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v11->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIHintsUserIntentButtonView addSubview:](v11, "addSubview:", v11->_glyphView);
    -[TVRUIHintsUserIntentButtonView _updateViewForButtonEdge:](v11, "_updateViewForButtonEdge:", v5);

  }
  return v11;
}

- (void)setPresentation:(unint64_t)a3
{
  if (self->_presentation != a3)
  {
    self->_presentation = a3;
    -[TVRUIHintsUserIntentButtonView _updateViewForButtonEdge:](self, "_updateViewForButtonEdge:", -[TVRUIHintsUserIntentButtonView buttonEdge](self, "buttonEdge"));
  }
}

- (void)_updateViewForButtonEdge:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  unint64_t presentation;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  -[TVRUIHintsStyleProvider buttonOutlineWidth](self->_styleProvider, "buttonOutlineWidth");
  v6 = v5;
  presentation = self->_presentation;
  -[TVRUIHintsUserIntentButtonView glyphView](self, "glyphView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (presentation == 1)
  {
    objc_msgSend(v8, "setAlpha:", 0.0);

    -[TVRUIHintsUserIntentButtonView styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "supportsSBHints"))
    {
      -[TVRUIHintsUserIntentButtonView styleProvider](self, "styleProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hintButtonWidth");
      v6 = v11;

    }
  }
  else
  {
    objc_msgSend(v8, "setAlpha:", 1.0);
  }

  -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v6);

  -[TVRUIHintsUserIntentButtonView _setupConstraintsForButtonEdge:buttonWidth:](self, "_setupConstraintsForButtonEdge:buttonWidth:", v3, v6);
}

- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  NSArray *v31;
  NSArray *buttonConstraints;
  NSObject *v33;
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

  -[TVRUIHintsUserIntentButtonView buttonConstraints](self, "buttonConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0x24BDD1000uLL;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD1628];
    -[TVRUIHintsUserIntentButtonView buttonConstraints](self, "buttonConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[TVRUIHintsUserIntentButtonView setButtonConstraints:](self, "setButtonConstraints:", 0);
  }
  if (a3 == 2)
  {
    v52 = (void *)MEMORY[0x24BDBCE30];
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToConstant:", a4 + a4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "rightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView rightAnchor](self, "rightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v60, a4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView topAnchor](self, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v54);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView bottomAnchor](self, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView glyphView](self, "glyphView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView centerYAnchor](self, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView glyphView](self, "glyphView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsStyleProvider imageMargin](self->_styleProvider, "imageMargin");
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "arrayWithObjects:", v48, v70, v38, v22, v24, v30, 0);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    buttonConstraints = self->_buttonConstraints;
    self->_buttonConstraints = v31;

    v8 = 0x24BDD1000;
    v21 = v68;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v49 = (void *)MEMORY[0x24BDBCE30];
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", a4 + a4);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leftAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView leftAnchor](self, "leftAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v57);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "rightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView rightAnchor](self, "rightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v51);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView bottomAnchor](self, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v43, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView glyphView](self, "glyphView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView centerXAnchor](self, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView glyphView](self, "glyphView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsUserIntentButtonView buttonOutline](self, "buttonOutline");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsStyleProvider imageMargin](self->_styleProvider, "imageMargin");
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "arrayWithObjects:", v69, v67, v37, v11, v13, v18, 0);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_buttonConstraints;
    self->_buttonConstraints = v19;

    v8 = 0x24BDD1000;
    v21 = v65;
LABEL_7:

    goto LABEL_11;
  }
  _TVRUIHintsLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    -[TVRUIHintsUserIntentButtonView _setupConstraintsForButtonEdge:buttonWidth:].cold.1(v33);

LABEL_11:
  -[TVRUIHintsUserIntentButtonView buttonConstraints](self, "buttonConstraints");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = *(void **)(v8 + 1576);
    -[TVRUIHintsUserIntentButtonView buttonConstraints](self, "buttonConstraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v36);

  }
}

- (TVRUIHintsGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (unint64_t)presentation
{
  return self->_presentation;
}

- (UIView)buttonOutline
{
  return self->_buttonOutline;
}

- (void)setButtonOutline:(id)a3
{
  objc_storeStrong((id *)&self->_buttonOutline, a3);
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (NSArray)buttonConstraints
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
  objc_storeStrong((id *)&self->_buttonOutline, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

- (void)_setupConstraintsForButtonEdge:(os_log_t)log buttonWidth:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21B042000, log, OS_LOG_TYPE_FAULT, "User intent buttons edge is being reported as the left or bottom of the device", v1, 2u);
}

@end
