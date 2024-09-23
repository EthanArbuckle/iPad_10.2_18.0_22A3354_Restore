@implementation TUILiveKeyView

- (TUILiveKeyView)initWithKey:(id)a3 renderTraits:(id)a4 displayContents:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  TUILiveKeyView *v12;
  void *v13;
  void *v14;
  void *imageName;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TUILiveKeyView;
  v12 = -[TUILiveKeyView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (!v12)
    goto LABEL_33;
  objc_msgSend(v11, "displayString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(v11, "fallbackContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&v12->_keyCap, v14);
  if (!v13)
  {

  }
  v12->_keyStyle = objc_msgSend(v9, "style");
  v12->_isShowingHighlight = 0;
  v12->_fontSize = 0.0;
  if (objc_msgSend(v9, "style") == -1)
    v12->_keyStyle = 2;
  objc_storeStrong((id *)&v12->_traits, a4);
  objc_msgSend(v10, "symbolStyle");
  imageName = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(imageName, "usesSymbolImage")
    && (!objc_msgSend(v11, "stringKeycapOverImage") || objc_msgSend(v11, "forceImageKeycap")))
  {
    objc_msgSend(v11, "displayStringImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v18 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v11, "displayStringImage");
    v17 = objc_claimAutoreleasedReturnValue();
    imageName = v12->_imageName;
    v12->_imageName = (NSString *)v17;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

LABEL_15:
  objc_msgSend(v9, "backingTree");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "displayType");

  if (v20 == 23)
    v12->_isShift = 1;
  v12->_usesBlueBackground = 0;
  if (objc_msgSend(v9, "layoutType") == 3)
  {
    objc_msgSend(v10, "backgroundGradient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "flatColorName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsString:", CFSTR("Blue"));

    if (v23)
      v12->_usesBlueBackground = 1;
    v12->_layoutType = 3;
    v12->_layoutShape = 0;
  }
  else if (objc_msgSend(v9, "layoutType") == 4)
  {
    v12->_layoutType = 4;
    v12->_layoutShape = 0;
    objc_msgSend(v9, "backingTree");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v25);

  }
  else
  {
    if (objc_msgSend(v9, "layoutShape") == -1)
      v26 = 0;
    else
      v26 = objc_msgSend(v9, "layoutShape");
    v12->_layoutShape = v26;
    if (objc_msgSend(v9, "layoutType") == -1)
      v12->_layoutType = 2;
    else
      v12->_layoutType = objc_msgSend(v9, "layoutType");
  }
  v12->_usesImage = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView setBackgroundColor:](v12, "setBackgroundColor:", v27);

  -[TUILiveKeyView makeKeyBackgrounds](v12, "makeKeyBackgrounds");
  if (v18)
    -[TUILiveKeyView keyWithSymbolView](v12, "keyWithSymbolView");
  else
    -[TUILiveKeyView keyWithLabel](v12, "keyWithLabel");
LABEL_33:

  return v12;
}

- (void)updateKeyStyle:(int64_t)a3
{
  void *v4;
  void *v5;

  if (self->_keyStyle != a3)
  {
    self->_keyStyle = a3;
    -[TUILiveKeyView keyLabel](self, "keyLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[TUILiveKeyView updateLabelInsets](self, "updateLabelInsets");
    -[TUILiveKeyView symbolImageView](self, "symbolImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[TUILiveKeyView updateSymbolInsets](self, "updateSymbolInsets");
  }
}

- (void)updateRenderTraits:(id)a3 displayContents:(id)a4
{
  uint64_t v4;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  UIKBRenderTraits *v29;

  v29 = (UIKBRenderTraits *)a3;
  v8 = a4;
  if (self->_traits == v29)
    goto LABEL_21;
  objc_storeStrong((id *)&self->_traits, a3);
  if (-[TUILiveKeyView layoutType](self, "layoutType") == 3)
  {
    -[TUILiveKeyView renderConfig](self, "renderConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controlKeyBackgroundName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      goto LABEL_6;
    }
    v4 = -[TUILiveKeyView usesBlueBackground](self, "usesBlueBackground");

    if ((_DWORD)v4)
    {
LABEL_6:
      v11 = -[TUILiveKeyView usesBlueBackground](self, "usesBlueBackground");
      v12 = v11;
      if (v11)
      {
        v13 = (void *)*MEMORY[0x1E0DC4D48];
      }
      else
      {
        -[TUILiveKeyView renderConfig](self, "renderConfig");
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "controlKeyBackgroundName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = UIKBGetNamedColor();
      -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shapeLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFillColor:", v14);

      if (!v12)
      {

      }
    }
  }
  if (-[TUILiveKeyView usesImage](self, "usesImage"))
  {
    objc_msgSend(v8, "displayStringImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView setImageName:](self, "setImageName:", v17);

    -[TUILiveKeyView keyWithSymbolView](self, "keyWithSymbolView");
  }
  else
  {
    objc_msgSend(v8, "displayString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v8, "fallbackContents");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "displayString");
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v20, "length"))
    {
      -[TUILiveKeyView keyCap](self, "keyCap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView updateLabelText:](self, "updateLabelText:", v22);

    }
    -[UIKBRenderTraits symbolStyle](v29, "symbolStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fontSize");
    v25 = v24;
    -[TUILiveKeyView fontSize](self, "fontSize");
    v27 = v26;

    if (v25 != v27)
    {
      -[UIKBRenderTraits symbolStyle](v29, "symbolStyle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fontSize");
      -[TUILiveKeyView updateFontSize:](self, "updateFontSize:");

    }
  }
LABEL_21:

}

- (void)makeKeyBackgrounds
{
  uint64_t v3;
  void *v4;
  void *v5;
  TUIDrawingView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TUIDrawingView *v11;
  void *v12;
  void *v13;
  TUIDrawingView *v14;
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
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
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
  _QWORD v65[10];

  v65[8] = *MEMORY[0x1E0C80C00];
  -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[TUILiveKeyView keyCapShadow](self, "keyCapShadow"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v6 = [TUIDrawingView alloc];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = -[TUIDrawingView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    -[TUILiveKeyView setKeyCapShadow:](self, "setKeyCapShadow:", v11);

    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView addSubview:](self, "addSubview:", v13);

    v14 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v7, v8, v9, v10);
    -[TUILiveKeyView setKeyCapBackground:](self, "setKeyCapBackground:", v14);

    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView addSubview:](self, "addSubview:", v16);

    v48 = (void *)MEMORY[0x1E0CB3718];
    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v60;
    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v55;
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v50;
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v44;
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView topAnchor](self, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65[4] = v40;
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView leadingAnchor](self, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = v36;
    -[TUILiveKeyView bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65[6] = v20;
    -[TUILiveKeyView trailingAnchor](self, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65[7] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v25);

  }
  -[TUILiveKeyView shadowColor](self, "shadowColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");
  -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shapeLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFillColor:", v27);

  if (-[TUILiveKeyView layoutType](self, "layoutType") == 2 || -[TUILiveKeyView layoutType](self, "layoutType") == 4)
  {
    -[TUILiveKeyView keyCapColor](self, "keyCapColor");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUILiveKeyView controlKeyColor](self, "controlKeyColor");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v30;
  if (-[TUILiveKeyView usesBlueBackground](self, "usesBlueBackground"))
    v32 = UIKBGetNamedColor();
  else
    v32 = objc_msgSend(objc_retainAutorelease(v31), "CGColor");
  v33 = v32;
  -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "shapeLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFillColor:", v33);

}

- (void)keyWithSymbolView
{
  void *v3;
  void *v4;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  -[TUILiveKeyView symbolImageView](self, "symbolImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[TUILiveKeyView usesImage](self, "usesImage"))
    {
      -[TUILiveKeyView imageName](self, "imageName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[TUILiveKeyView imageName](self, "imageName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUILiveKeyView imageWithName:](self, "imageWithName:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImage:", v6);

      }
    }
  }
  else
  {
    -[TUILiveKeyView imageName](self, "imageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TUILiveKeyView imageName](self, "imageName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView imageWithName:](self, "imageWithName:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
      -[TUILiveKeyView setSymbolImageView:](self, "setSymbolImageView:", v11);

      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setContentMode:", 1);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTintColor:", v14);

      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView addSubview:](self, "addSubview:", v16);

      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "centerXAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView centerXAnchor](self, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setHorizontalContentConstraint:](self, "setHorizontalContentConstraint:", v20);

      -[TUILiveKeyView keyStyle](self, "keyStyle");
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "centerYAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView centerYAnchor](self, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setVerticalContentConstraint:](self, "setVerticalContentConstraint:", v24);

      v25 = (void *)MEMORY[0x1E0CB3718];
      -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v26;
      -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateConstraints:", v28);

    }
  }
  -[TUILiveKeyView symbolImageView](self, "symbolImageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0DC3658];
    -[TUILiveKeyView traits](self, "traits");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "symbolStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "colorWithCGColor:", UIKBGetNamedColor());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView symbolImageView](self, "symbolImageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTintColor:", v34);

  }
  -[TUILiveKeyView updateSymbolInsets](self, "updateSymbolInsets");
}

- (void)updateSymbolInsets
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v3 = -[TUILiveKeyView keyStyle](self, "keyStyle");
  -[TUILiveKeyView symbolImageView](self, "symbolImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baselineOffsetFromBottom");
  v7 = v6;

  -[TUILiveKeyView traits](self, "traits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symbolStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textOffset");
  if (v3 == 1)
    v11 = -v10;
  else
    v11 = v10;
  if (v3 == 1)
    v12 = -2.0;
  else
    v12 = -3.0;

  -[TUILiveKeyView traits](self, "traits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "symbolStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textOffset");
  v16 = v15;

  -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v11 + v12);

  -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v16 + v7 * -0.5);

}

- (id)imageWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TUILiveKeyView traits](self, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView symbolImageConfigForRenderTraits:traitCollection:](self, "symbolImageConfigForRenderTraits:traitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)symbolImageConfigForRenderTraits:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "symbolStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x18D78729C](objc_msgSend(v7, "fontWeightForSymbolImage"));

  if (!v8)
  {
    objc_msgSend(v5, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x18D78729C](objc_msgSend(v9, "fontWeight"));

    if (v10)
      v8 = v10;
    else
      v8 = 4;
  }
  objc_msgSend(v5, "symbolStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontSizeForSymbolImage");
  v13 = v12;

  if (v13 == 0.0)
  {
    objc_msgSend(v5, "symbolStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontSize");
    v13 = v15;

  }
  v16 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v5, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configurationWithPointSize:weight:scale:", v8, objc_msgSend(v17, "symbolScale"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "configurationWithTraitCollection:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)keyWithLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TUILiveKeyView keyLabel](self, "keyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TUILiveKeyView keyCap](self, "keyCap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView labelForKeyCap:](self, "labelForKeyCap:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView setKeyLabel:](self, "setKeyLabel:", v5);

  }
  -[TUILiveKeyView keyCap](self, "keyCap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView updateLabelText:](self, "updateLabelText:", v6);

}

- (id)labelForKeyCap:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setText:", v5);

  if (-[TUILiveKeyView usesBlueBackground](self, "usesBlueBackground"))
  {
    v7 = (void *)MEMORY[0x1E0DC3658];
    -[TUILiveKeyView traits](self, "traits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithCGColor:", UIKBGetNamedColor());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v11);

  }
  -[TUILiveKeyView addSubview:](self, "addSubview:", v6);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUILiveKeyView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v15;
  v30[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v19);

  objc_msgSend(v6, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView leadingAnchor](self, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUILiveKeyView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v22;
  v29[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v26);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);
  -[TUILiveKeyView labelBottom](self, "labelBottom");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    -[TUILiveKeyView setLabelBottom:](self, "setLabelBottom:", v18);
    -[TUILiveKeyView setLabelLeading:](self, "setLabelLeading:", v22);
    -[TUILiveKeyView setLabelTrailing:](self, "setLabelTrailing:", v25);
  }
  -[TUILiveKeyView updateLabelInsets](self, "updateLabelInsets");

  return v6;
}

- (id)fontForLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[TUILiveKeyView traits](self, "traits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView fontForSymbolStyle:](self, "fontForSymbolStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fontForSymbolStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWeight");
  v6 = v5;
  objc_msgSend(v3, "fontSize");
  v8 = v7;

  v9 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4D58]);
  v10 = 22.0;
  if (v8 > 0.0)
    v10 = v8;
  if (v9)
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", v10, v6);
  else
    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithName:size:traits:", v4, 4096, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateFontSize:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  -[TUILiveKeyView fontSize](self, "fontSize");
  if (v5 == 0.0)
  {
    -[TUILiveKeyView fontForLabel](self, "fontForLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyLabel](self, "keyLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);
  }
  else
  {
    -[TUILiveKeyView fontSize](self, "fontSize");
    if (vabdd_f64(a3, v8) < 1.0)
      return;
    -[TUILiveKeyView keyLabel](self, "keyLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontWithSize:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUILiveKeyView keyLabel](self, "keyLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

  }
  -[TUILiveKeyView setFontSize:](self, "setFontSize:", a3);
}

- (void)updateLabelText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TUILiveKeyView setKeyCap:](self, "setKeyCap:");
  -[TUILiveKeyView keyLabel](self, "keyLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[TUILiveKeyView layoutType](self, "layoutType") == 2
      || -[TUILiveKeyView layoutType](self, "layoutType") == 3
      && (-[TUILiveKeyView imageName](self, "imageName"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      -[TUILiveKeyView keyLabel](self, "keyLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v7);

    }
  }

}

- (void)updateLabelInsets
{
  double v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  double v8;
  id v9;

  if (-[TUILiveKeyView keyStyle](self, "keyStyle") == 2)
    v3 = 5.0;
  else
    v3 = 4.0;
  if (-[TUILiveKeyView layoutType](self, "layoutType") == 3)
  {
    if (-[TUILiveKeyView keyStyle](self, "keyStyle") == 2)
      v3 = 10.0;
    else
      v3 = 4.0;
  }
  -[TUILiveKeyView labelBottom](self, "labelBottom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

  v5 = -[TUILiveKeyView keyStyle](self, "keyStyle");
  v6 = -[TUILiveKeyView layoutType](self, "layoutType");
  if (v5 == 2 || v6 == 3)
    v8 = 6.0;
  else
    v8 = 3.0;
  -[TUILiveKeyView labelTrailing](self, "labelTrailing");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v8);

}

- (void)updateLabelWeight:(int64_t)a3
{
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
  _QWORD *v40;
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
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  if (-[TUILiveKeyView keyStyle](self, "keyStyle") == 1)
    return;
  -[TUILiveKeyView symbolImageView](self, "symbolImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return;
  switch(a3)
  {
    case 2:
      -[TUILiveKeyView keyLabel](self, "keyLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextAlignment:", 2);

      -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isActive") & 1) != 0)
      {
        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CB3718];
          -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = v17;
          -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v61[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deactivateConstraints:", v19);

        }
      }
      else
      {

      }
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        return;
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView trailingAnchor](self, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -10.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setHorizontalContentConstraint:](self, "setHorizontalContentConstraint:", v31);

      -[TUILiveKeyView bottomAnchor](self, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 8.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setVerticalContentConstraint:](self, "setVerticalContentConstraint:", v35);

      v36 = (void *)MEMORY[0x1E0CB3718];
      -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v37;
      -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v60;
LABEL_24:
      objc_msgSend(v39, "arrayWithObjects:count:", v40, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "activateConstraints:", v59);

      -[TUILiveKeyView layoutIfNeeded](self, "layoutIfNeeded");
      return;
    case 1:
      -[TUILiveKeyView keyLabel](self, "keyLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextAlignment:", 0);

      -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isActive") & 1) != 0)
      {
        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3718];
          -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v63[0] = v24;
          -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "deactivateConstraints:", v26);

        }
      }
      else
      {

      }
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        return;
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView leadingAnchor](self, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 10.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setHorizontalContentConstraint:](self, "setHorizontalContentConstraint:", v45);

      -[TUILiveKeyView bottomAnchor](self, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 8.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUILiveKeyView setVerticalContentConstraint:](self, "setVerticalContentConstraint:", v49);

      v36 = (void *)MEMORY[0x1E0CB3718];
      -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v37;
      -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v62;
      goto LABEL_24;
    case 0:
      -[TUILiveKeyView keyLabel](self, "keyLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextAlignment:", 1);

      -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isActive") & 1) != 0)
      {
        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = (void *)MEMORY[0x1E0CB3718];
          -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = v10;
          -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v65[1] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deactivateConstraints:", v12);

        }
      }
      else
      {

      }
      -[TUILiveKeyView symbolImageView](self, "symbolImageView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "centerXAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUILiveKeyView leadingAnchor](self, "leadingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "constraintEqualToAnchor:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUILiveKeyView setHorizontalContentConstraint:](self, "setHorizontalContentConstraint:", v54);

        -[TUILiveKeyView symbolImageView](self, "symbolImageView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "centerYAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUILiveKeyView centerYAnchor](self, "centerYAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToAnchor:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUILiveKeyView setVerticalContentConstraint:](self, "setVerticalContentConstraint:", v58);

        v36 = (void *)MEMORY[0x1E0CB3718];
        -[TUILiveKeyView horizontalContentConstraint](self, "horizontalContentConstraint");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v37;
        -[TUILiveKeyView verticalContentConstraint](self, "verticalContentConstraint");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v38;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = v64;
        goto LABEL_24;
      }
      break;
  }
}

- (UIEdgeInsets)drawingInsets
{
  double v3;
  double v4;
  double v5;
  int64_t v6;
  double v7;
  UIEdgeInsets result;

  if (-[TUILiveKeyView keyStyle](self, "keyStyle") == 2)
  {
    v3 = 3.0;
    v4 = 11.0;
    v5 = 9.0;
  }
  else
  {
    v6 = -[TUILiveKeyView keyStyle](self, "keyStyle");
    if (v6 == 3)
      v3 = 2.0;
    else
      v3 = 3.0;
    v5 = 7.0;
    if (v6 == 3)
      v4 = 7.0;
    else
      v4 = 8.0;
  }
  v7 = 1.0;
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (id)roundedRectForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)MEMORY[0x1E0DC3508];
  -[TUILiveKeyView traits](self, "traits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "roundRectRadius");
  objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fillWithBlendMode:alpha:", 7, 0.5);
  return v11;
}

- (id)shadowPathForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView traits](self, "traits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "roundRectRadius");
  v12 = v11;

  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v13 = CGRectGetMaxY(v17) - v12;
  objc_msgSend(v8, "moveToPoint:", x, v13);
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v14 = CGRectGetMaxX(v18) - v12;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", v14, CGRectGetMaxY(v19));
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, CGRectGetMaxX(v20) - v12, v13, v12, 1.57079633, 0.0);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v15 = v13 + 1.0;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, CGRectGetMaxX(v21) - v12, v15, v12, 0.0, 1.57079633);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  objc_msgSend(v8, "addLineToPoint:", x + v12, CGRectGetMaxY(v22) + 1.0);
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x + v12, v15, v12, 1.57079633, 3.14159265);
  objc_msgSend(v8, "closePath");
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUILiveKeyView;
  -[TUILiveKeyView layoutSubviews](&v15, sel_layoutSubviews);
  -[TUILiveKeyView drawingInsets](self, "drawingInsets");
  -[TUILiveKeyView bounds](self, "bounds");
  UIRectInset();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUILiveKeyView roundedRectForRect:](self, "roundedRectForRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView keyCapBackground](self, "keyCapBackground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPath:", v11);

  -[TUILiveKeyView shadowPathForRect:](self, "shadowPathForRect:", v4, v6, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUILiveKeyView keyCapShadow](self, "keyCapShadow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPath:", v13);

}

- (id)keyCapColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__TUILiveKeyView_keyCapColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)highlightedKeyCapColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__TUILiveKeyView_highlightedKeyCapColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)controlKeyColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__TUILiveKeyView_controlKeyColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)highlightedControlKeyColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__TUILiveKeyView_highlightedControlKeyColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)controlShadowColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__TUILiveKeyView_controlShadowColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shadowColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__TUILiveKeyView_shadowColor__block_invoke;
  v3[3] = &unk_1E24FB300;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)keyIsStringType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 1
    || objc_msgSend(v3, "interactionType") == 2
    || objc_msgSend(v3, "interactionType") == 16;

  return v4;
}

- (BOOL)keyIsSpaceType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 15 || objc_msgSend(v3, "displayType") == 25;

  return v4;
}

- (BOOL)keyIsControlType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 4
    || objc_msgSend(v3, "interactionType") == 5
    || objc_msgSend(v3, "interactionType") == 6
    || objc_msgSend(v3, "interactionType") == 9
    || objc_msgSend(v3, "interactionType") == 10
    || objc_msgSend(v3, "interactionType") == 11
    || objc_msgSend(v3, "interactionType") == 13
    || objc_msgSend(v3, "interactionType") == 14
    || objc_msgSend(v3, "interactionType") == 37
    || objc_msgSend(v3, "interactionType") == 38
    || objc_msgSend(v3, "interactionType") == 17;

  return v4;
}

- (id)nameFromControlType:(int)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 2:
      result = CFSTR("command");
      break;
    case 3:
      result = CFSTR("delete.left");
      break;
    case 4:
LABEL_5:
      result = CFSTR("mic");
      break;
    case 5:
      result = CFSTR("keyboard.chevron.compact.down");
      break;
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 22:
    case 24:
    case 25:
      return result;
    case 9:
      result = CFSTR("emoji.face.grinning");
      break;
    case 13:
      result = CFSTR("globe");
      break;
    case 14:
      result = &stru_1E24FC6C0;
      break;
    case 21:
      result = CFSTR("return");
      break;
    case 23:
      result = CFSTR("shift");
      break;
    case 26:
      result = CFSTR("arrow.right.to.line");
      break;
    default:
      switch(a3)
      {
        case '-':
          result = CFSTR("arrow.backward");
          break;
        case '.':
          result = CFSTR("arrow.forward");
          break;
        case '/':
        case '0':
        case '1':
        case '2':
          return result;
        case '3':
          result = CFSTR("capslock");
          break;
        case '4':
          goto LABEL_5;
        case '5':
          result = CFSTR("scribble");
          break;
        case '6':
          result = CFSTR("keyboard");
          break;
        default:
          if (a3 == 31)
            result = CFSTR("mic");
          else
            result = 0;
          break;
      }
      break;
  }
  return result;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setRenderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_renderConfig, a3);
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_keyLabel, a3);
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageView, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (NSString)keyCap
{
  return self->_keyCap;
}

- (void)setKeyCap:(id)a3
{
  objc_storeStrong((id *)&self->_keyCap, a3);
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setBackgroundMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaskView, a3);
}

- (TUIDrawingView)keyCapBackground
{
  return self->_keyCapBackground;
}

- (void)setKeyCapBackground:(id)a3
{
  objc_storeStrong((id *)&self->_keyCapBackground, a3);
}

- (TUIDrawingView)keyCapShadow
{
  return self->_keyCapShadow;
}

- (void)setKeyCapShadow:(id)a3
{
  objc_storeStrong((id *)&self->_keyCapShadow, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BOOL)usesImage
{
  return self->_usesImage;
}

- (void)setUsesImage:(BOOL)a3
{
  self->_usesImage = a3;
}

- (BOOL)isShift
{
  return self->_isShift;
}

- (void)setIsShift:(BOOL)a3
{
  self->_isShift = a3;
}

- (BOOL)isShowingHighlight
{
  return self->_isShowingHighlight;
}

- (void)setIsShowingHighlight:(BOOL)a3
{
  self->_isShowingHighlight = a3;
}

- (BOOL)usesBlueBackground
{
  return self->_usesBlueBackground;
}

- (void)setUsesBlueBackground:(BOOL)a3
{
  self->_usesBlueBackground = a3;
}

- (NSLayoutConstraint)horizontalContentConstraint
{
  return self->_horizontalContentConstraint;
}

- (void)setHorizontalContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalContentConstraint, a3);
}

- (NSLayoutConstraint)verticalContentConstraint
{
  return self->_verticalContentConstraint;
}

- (void)setVerticalContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalContentConstraint, a3);
}

- (NSLayoutConstraint)labelBottom
{
  return self->_labelBottom;
}

- (void)setLabelBottom:(id)a3
{
  objc_storeStrong((id *)&self->_labelBottom, a3);
}

- (NSLayoutConstraint)labelLeading
{
  return self->_labelLeading;
}

- (void)setLabelLeading:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeading, a3);
}

- (NSLayoutConstraint)labelTrailing
{
  return self->_labelTrailing;
}

- (void)setLabelTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailing, a3);
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutShape
{
  return self->_layoutShape;
}

- (void)setLayoutShape:(int64_t)a3
{
  self->_layoutShape = a3;
}

- (int64_t)keyStyle
{
  return self->_keyStyle;
}

- (void)setKeyStyle:(int64_t)a3
{
  self->_keyStyle = a3;
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_labelTrailing, 0);
  objc_storeStrong((id *)&self->_labelLeading, 0);
  objc_storeStrong((id *)&self->_labelBottom, 0);
  objc_storeStrong((id *)&self->_verticalContentConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalContentConstraint, 0);
  objc_storeStrong((id *)&self->_keyCapShadow, 0);
  objc_storeStrong((id *)&self->_keyCapBackground, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_keyCap, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

id __29__TUILiveKeyView_shadowColor__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL4 v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle") == 2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, dbl_18C80CDA0[v2]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__TUILiveKeyView_controlShadowColor__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL4 v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle") == 2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, dbl_18C80CDA0[v2]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __44__TUILiveKeyView_highlightedControlKeyColor__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceStyle") == 2)
  {
    v2 = 0.42;
    v3 = 1.0;
    v4 = 0.42;
    v5 = 0.42;
  }
  else
  {
    v2 = 0.49;
    v4 = 0.51;
    v5 = 0.54;
    v3 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __33__TUILiveKeyView_controlKeyColor__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceStyle") == 2)
  {
    v2 = 0.580392157;
    v3 = 0.26;
    v4 = 0.580392157;
    v5 = 0.580392157;
  }
  else
  {
    v2 = 0.28627451;
    v4 = 0.368627451;
    v5 = 0.498039216;
    v3 = 0.23;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__TUILiveKeyView_highlightedKeyCapColor__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceStyle") == 2)
  {
    v2 = 0.42;
    v3 = 1.0;
    v4 = 0.42;
    v5 = 0.42;
  }
  else
  {
    v2 = 0.49;
    v4 = 0.51;
    v5 = 0.54;
    v3 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __29__TUILiveKeyView_keyCapColor__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL4 v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle") == 2;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", dbl_18C80CDB0[v2]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
