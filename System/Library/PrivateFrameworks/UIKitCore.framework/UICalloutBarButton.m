@implementation UICalloutBarButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 inView:(id)a8 visualStyle:(id)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v10 = *(_QWORD *)&a7;
  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  +[UIButton buttonWithType:](UICalloutBarButton, "buttonWithType:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setupWithTitle:subtitle:maxWidth:action:type:visualStyle:", v18, v17, a6, v10, v15, a5);

  objc_msgSend(v16, "addSubview:", v19);
  return v19;
}

+ (id)buttonWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = *(_QWORD *)&a5;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  +[UIButton buttonWithType:](UICalloutBarButton, "buttonWithType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setupWithTitle:action:type:visualStyle:", v13, a4, v8, v11);

  objc_msgSend(v12, "addSubview:", v14);
  return v14;
}

+ (id)buttonWithImage:(id)a3 action:(SEL)a4 type:(int)a5 inView:(id)a6 visualStyle:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = *(_QWORD *)&a5;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  +[UIButton buttonWithType:](UICalloutBarButton, "buttonWithType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setupWithImage:action:type:visualStyle:", v13, a4, v8, v11);

  objc_msgSend(v12, "addSubview:", v14);
  return v14;
}

+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 inView:(id)a7 visualStyle:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = *(_QWORD *)&a6;
  v13 = a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  +[UIButton buttonWithType:](UICalloutBarButton, "buttonWithType:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setupWithTitle:image:action:type:visualStyle:", v16, v15, a5, v9, v13);

  objc_msgSend(v14, "addSubview:", v17);
  return v17;
}

- (void)_commonSetupWithAction:(SEL)a3 type:(int)a4 visualStyle:(id)a5
{
  id v9;
  void *v10;
  void *v11;

  objc_storeStrong((id *)&self->m_visualStyle, a5);
  v9 = a5;
  self->m_action = a3;
  self->m_type = a4;
  self->m_contentScale = 1.0;
  self->m_additionalContentHeight = 0.0;
  -[UIView setHidden:](self, "setHidden:", 1);
  -[UIButton setAutosizesToFit:](self, "setAutosizesToFit:", 0);
  -[UIView setExclusiveTouch:](self, "setExclusiveTouch:", 1);
  -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_flash_forEvent_, 64);
  -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_touchDown, 1);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.85, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v10, 2);
  -[UIButton titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 0);

  -[UIControl setPointerInteractionEnabled:](self, "setPointerInteractionEnabled:", 1);
}

- (void)setupWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5 action:(SEL)a6 type:(int)a7 visualStyle:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  UILabel *v55;
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
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[4];

  v9 = *(_QWORD *)&a7;
  v75[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  -[UICalloutBarButton _commonSetupWithAction:type:visualStyle:](self, "_commonSetupWithAction:type:visualStyle:", a6, v9, a8);
  self->m_isText = 0;
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v16);
  UISCalloutBarFontSize();
  v18 = v17;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v20);
  UISCalloutBarFontSize();
  v22 = v21;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd"), "_legacy_sizeWithFont:", v19);
  v26 = v25;
  if (v24 < a5)
    a5 = v24;
  objc_msgSend(v14, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v19, 0, a5, 3.40282347e38);
  v28 = v27;
  v30 = v29;
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v15, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v23, 0, a5, 3.40282347e38);
    v32 = v31;
    v34 = v33;
  }
  else
  {
    v32 = *MEMORY[0x1E0C9D820];
    v34 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v67 = (void *)v23;
  if (v28 >= v32)
    v35 = v28;
  else
    v35 = v32;
  v36 = v35 + 34.0;
  v37 = v35 <= 16.0;
  v38 = 50.0;
  if (!v37)
    v38 = v36;
  self->m_contentWidth = v38;
  self->m_additionalContentHeight = fmax(v30 + v34 + 8.0 + -36.0, 0.0);
  v66 = (void *)objc_opt_new();
  v39 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 17.0, 4.0, v28, v30);
  v69 = v14;
  -[UILabel setText:](v39, "setText:", v14);
  -[UILabel setNumberOfLines:](v39, "setNumberOfLines:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v39, "setBackgroundColor:", v40);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v39, "setTextColor:", v41);

  v68 = (void *)v19;
  -[UILabel setFont:](v39, "setFont:", v19);
  -[UILabel setLineBreakMode:](v39, "setLineBreakMode:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", v39);
  if (!objc_msgSend(v15, "length") && v30 < v26 + v26)
  {
    -[UIView frame](v39, "frame");
    -[UILabel setFrame:](v39, "setFrame:");
  }
  v42 = (void *)MEMORY[0x1E0D156E0];
  v74[0] = CFSTR("padding");
  v74[1] = CFSTR("width");
  v75[0] = &unk_1E1A95860;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 + 2.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("titleLabel"), v39, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(padding)-[titleLabel(<=width)]"), 0, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v46);

  v47 = (void *)MEMORY[0x1E0D156E0];
  v72[0] = CFSTR("padding");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView frame](v39, "frame");
  objc_msgSend(v48, "numberWithDouble:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = CFSTR("height");
  v73[0] = v50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("titleLabel"), v39, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(padding)-[titleLabel(<=height)]"), 0, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v54);

  if (objc_msgSend(v15, "length"))
  {
    v55 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 17.0, v30 + 4.0, v32, v34);
    -[UILabel setText:](v55, "setText:", v15);
    -[UILabel setNumberOfLines:](v55, "setNumberOfLines:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v55, "setBackgroundColor:", v56);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v55, "setTextColor:", v57);

    -[UILabel setFont:](v55, "setFont:", v67);
    -[UILabel setLineBreakMode:](v55, "setLineBreakMode:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self, "addSubview:", v55);
    v58 = (void *)MEMORY[0x1E0D156E0];
    v70[0] = CFSTR("padding");
    v70[1] = CFSTR("width");
    v71[0] = &unk_1E1A95860;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32 + 2.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v59;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("label"), v55, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-padding-[label(<=width)]"), 0, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v62);

    v63 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("titleLabel, label"), v39, v55, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[titleLabel]-0-[label]"), 0, 0, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v65);

  }
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v66);

}

- (void)setupWithTitle:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v18;
  void *v19;
  NSDate *v20;
  NSDate *m_appearanceDate;
  id v22;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  -[UICalloutBarButton _commonSetupWithAction:type:visualStyle:](self, "_commonSetupWithAction:type:visualStyle:", a4, v7, a6);
  self->m_isText = 1;
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v11);
  UISCalloutBarFontSize();
  v13 = v12;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v13);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_legacy_sizeWithFont:", v22);
  v15 = v14 + 34.0;
  v16 = v14 < 16.0;
  v17 = 50.0;
  if (!v16)
    v17 = v15;
  self->m_contentWidth = v17;
  -[UIButton setTitle:forState:](self, "setTitle:forState:", v10, 0);

  -[UIButton titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v19);

  objc_msgSend(v18, "setFont:", v22);
  objc_msgSend(v18, "setTextAlignment:", 1);
  if (sel_paste_ == a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    m_appearanceDate = self->m_appearanceDate;
    self->m_appearanceDate = v20;

  }
}

+ (id)symbolConfigurationForScale:(double)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v3);
  UISCalloutBarFontSize();
  v5 = v4;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setupWithImage:(id)a3 action:(SEL)a4 type:(int)a5 visualStyle:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  -[UICalloutBarButton _commonSetupWithAction:type:visualStyle:](self, "_commonSetupWithAction:type:visualStyle:", a4, v7, a6);
  self->m_isText = 0;
  -[UIButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](self, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_flatImageWithColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](self, "setImage:forState:", v12, 0);

  +[UICalloutBarButton symbolConfigurationForScale:](UICalloutBarButton, "symbolConfigurationForScale:", 1.0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v23, 0);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self, "setTintColor:", v13);

  -[UIButton _effectiveSizeForImage:](self, "_effectiveSizeForImage:", v10);
  v15 = v14;

  v16 = 16.0;
  if (v15 >= 16.0)
    v16 = v15;
  v17 = 34.0;
  if ((_DWORD)v7 == 3)
    v17 = 14.0;
  self->m_contentWidth = v17 + v16;
  -[UIButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v18);
  UISCalloutBarFontSize();
  v20 = v19;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

}

- (void)setupWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6 visualStyle:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v8 = *(_QWORD *)&a6;
  v12 = a4;
  v13 = a3;
  -[UICalloutBarButton _commonSetupWithAction:type:visualStyle:](self, "_commonSetupWithAction:type:visualStyle:", a5, v8, a7);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v14);
  UISCalloutBarFontSize();
  v16 = v15;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v16);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_legacy_sizeWithFont:", v27);
  if (v17 < 16.0)
    v17 = 16.0;
  self->m_contentWidth = v17;
  -[UIButton setTitle:forState:](self, "setTitle:forState:", v13, 0);

  -[UIButton titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v19);

  objc_msgSend(v18, "setFont:", v27);
  objc_msgSend(v18, "setTextAlignment:", 1);
  -[UIButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](self, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self, "setTintColor:", v20);

  -[UIButton setImage:forState:](self, "setImage:forState:", v12, 0);
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v27, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v21, 0);
  self->m_contentWidth = self->m_contentWidth + 5.0;
  if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
    v22 = -5.0;
  else
    v22 = 5.0;
  -[UIButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, -v22, 0.0);
  -[UIButton _effectiveSizeForImage:](self, "_effectiveSizeForImage:", v12);
  v24 = v23;

  v25 = v24 + self->m_contentWidth;
  if (v25 < 16.0)
    v25 = 16.0;
  v26 = 34.0;
  if ((_DWORD)v8 == 3)
    v26 = 14.0;
  self->m_contentWidth = v26 + v25;
  -[UIButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);

}

- (void)dealloc
{
  objc_super v3;

  -[UICalloutBarButton cancelFlash](self, "cancelFlash");
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBarButton;
  -[UIButton dealloc](&v3, sel_dealloc);
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UICalloutBarButton cancelFlash](self, "cancelFlash");
  -[UIView _setInteractionTintColor:](self, "_setInteractionTintColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBarButton;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (double)buttonHorizontalPadding
{
  void *v2;
  double v3;
  double v4;

  -[_UICalloutBarVisualStyle buttonMetrics](self->m_visualStyle, "buttonMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalPadding");
  v4 = v3;

  return v4;
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (CGRect)adjustRectForPosition:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  int m_position;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v9 = 1.0 / v8;
  m_position = self->m_position;
  if (m_position != 1)
  {
    if (m_position)
      goto LABEL_5;
    v9 = v9 + 0.0;
  }
  x = x + v9;
LABEL_5:
  v11 = x + 5.0;
  if (!self->m_padLeft)
    v11 = x;
  if (self->m_padRight)
    v11 = v11 + -5.0;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)UICalloutBarButton;
  -[UIButton titleRectForContentRect:](&v14, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UICalloutBarButton adjustRectForPosition:](self, "adjustRectForPosition:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UICalloutBarButton buttonHorizontalPadding](self, "buttonHorizontalPadding");
  if (self->m_contentScale >= 0.642857143 || (v13 = 8.0, self->m_position == 4))
    v13 = -2.0;
  v15.origin.x = v12 + v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  return CGRectInset(v15, v13, 0.0);
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  v9.receiver = self;
  v9.super_class = (Class)UICalloutBarButton;
  -[UIButton imageRectForContentRect:](&v9, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UICalloutBarButton adjustRectForPosition:](self, "adjustRectForPosition:");
  v8 = v7 + self->m_imageVerticalAdjust;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v4;
  return result;
}

- (void)configureSecurePasteButtonWithWidth:(double)a3 height:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _UISlotView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", self->m_action);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "localizedStringForLocalization:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:](self, "setTitle:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->m_securePasteButtonSlotView);
    if (WeakRetained)
    {
      v11 = (_UISlotView *)objc_loadWeakRetained((id *)&self->m_securePasteButtonSlotView);
    }
    else
    {
      v11 = objc_alloc_init(_UISlotView);
      objc_storeWeak((id *)&self->m_securePasteButtonSlotView, v11);
    }
    -[UIButton contentRectForBounds:](self, "contentRectForBounds:", 0.0, 0.0, a3, a4);
    -[UICalloutBarButton titleRectForContentRect:](self, "titleRectForContentRect:");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)MEMORY[0x1E0D6C0D8];
    v19 = objc_msgSend(v8, "secureName");
    if (self->m_position == 4)
      v20 = NAN;
    else
      v20 = v17;
    objc_msgSend(v18, "calloutBarPasteButtonTagWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:", v19, (unint64_t)(self->m_contentScale * 10.0), a3, a4, v13, v15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v22 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke;
    v31[3] = &unk_1E16B59B0;
    v23 = v21;
    v32 = v23;
    -[_UISlotView _setSlotStyleResolver:](v11, "_setSlotStyleResolver:", v31);
    v25 = v22;
    v26 = 3221225472;
    v27 = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_2;
    v28 = &unk_1E16B5A28;
    v24 = v23;
    v29 = v24;
    objc_copyWeak(&v30, &location);
    -[_UISlotView _setSlotAnyContentProvider:](v11, "_setSlotAnyContentProvider:", &v25);
    -[_UISlotView _overlayView:centerInView:](v11, "_overlayView:centerInView:", self, self, v25, v26, v27, v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }

}

uint64_t __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedStyleForStyle:", a2);
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_3;
  block[3] = &unk_1E16B5A00;
  v16[1] = a2;
  v13 = v7;
  v14 = *(id *)(a1 + 32);
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  +[_UIConcretePasteboard _remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:](_UIConcretePasteboard, "_remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_4;
    block[3] = &unk_1E16B59D8;
    v5 = *(id *)(a1 + 48);
    v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);

  }
}

void __65__UICalloutBarButton_configureSecurePasteButtonWithWidth_height___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    +[UIColor clearColor](UIColor, "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTitleColor:forState:", v2, 0);

  }
}

- (unsigned)_secureName
{
  void *v2;
  void *v3;
  unsigned int v4;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", self->m_action);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "secureName");
  else
    v4 = 0;

  return v4;
}

- (void)configureForSingle:(int)a3
{
  self->m_position = 3;
  self->m_single = 1;
  self->m_padLeft = a3 == 3;
  self->m_padRight = a3 == 4;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureForLeftPosition:(int)a3
{
  self->m_position = 0;
  self->m_single = 0;
  self->m_padLeft = a3 == 3;
  self->m_padRight = 0;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureForMiddlePosition
{
  self->m_position = 1;
  self->m_single = 0;
  self->m_padLeft = 0;
  self->m_padRight = 0;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureForRightPosition:(int)a3
{
  self->m_position = 2;
  self->m_single = 0;
  self->m_padLeft = 0;
  self->m_padRight = a3 == 4;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureForVerticalPosition:(int)a3
{
  self->m_position = 4;
  self->m_single = 0;
  self->m_padLeft = a3 == 3;
  self->m_padRight = 0;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isSecurePasteButton
{
  char *m_action;

  m_action = (char *)self->m_action;
  return m_action == sel_paste_
      || m_action == sel_pasteAndMatchStyle_
      || m_action == sel_pasteAndGo_
      || m_action == sel_pasteAndSearch_;
}

- (void)setContentScale:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->m_contentScale != a3)
  {
    self->m_contentScale = a3;
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UISSlotContentSizeCategoryFromContentSizeCategory(v4);
    UISCalloutBarFontSize();
    v6 = v5;

    objc_msgSend(off_1E167A828, "systemFontOfSize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    +[UICalloutBarButton symbolConfigurationForScale:](UICalloutBarButton, "symbolConfigurationForScale:", self->m_contentScale);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton imageView](self, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSymbolConfiguration:", v10);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (a3 || !-[UICalloutBarButton forceFlash](self, "forceFlash"))
  {
    +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)UICalloutBarButton;
    -[UIButton setHighlighted:](&v6, sel_setHighlighted_, v3);
    objc_msgSend(v5, "buttonHighlighted:highlighted:", self, v3);

  }
}

- (void)fadeAndSendActionWithAuthenticationMessage:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = _MergedGlobals_21_3;
  if (!_MergedGlobals_21_3)
  {
    v5 = __UILogCategoryGetNode("CalloutBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_MergedGlobals_21_3);
  }
  v6 = *(id *)(v5 + 8);
  v7 = os_signpost_id_make_with_pointer(*(os_log_t *)(v5 + 8), self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FadeAndSendAction", ", buf, 2u);
    }
  }

  -[UICalloutBarButton cancelFlash](self, "cancelFlash");
  +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v4);

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performSelector:withObject:", sel_buttonPressed_, self);

  v10 = qword_1ECD7B8F0;
  if (!qword_1ECD7B8F0)
  {
    v10 = __UILogCategoryGetNode("CalloutBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD7B8F0);
  }
  v11 = *(id *)(v10 + 8);
  v12 = os_signpost_id_make_with_pointer(*(os_log_t *)(v10 + 8), self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_END, v13, "FadeAndSendAction", ", v14, 2u);
    }
  }

}

- (void)cancelFlash
{
  if (-[UICalloutBarButton forceFlash](self, "forceFlash"))
  {
    objc_msgSend((id)UIApp, "endIgnoringInteractionEvents");
    -[UICalloutBarButton setForceFlash:](self, "setForceFlash:", 0);
  }
}

- (void)flash:(id)a3 forEvent:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a4;
  -[UICalloutBarButton setHighlighted:](self, "setHighlighted:", 1);
  -[UICalloutBarButton setForceFlash:](self, "setForceFlash:", 1);
  objc_msgSend((id)UIApp, "beginIgnoringInteractionEvents");
  if (-[UICalloutBarButton isSecurePasteButton](self, "isSecurePasteButton"))
  {
    objc_msgSend(v5, "_authenticationMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalloutBarButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_fadeAndSendActionWithAuthenticationMessage_, v6, 0.1);

  }
  else
  {
    -[UICalloutBarButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_fadeAndSendActionWithAuthenticationMessage_, 0, 0.1);
  }
  v7 = flash_forEvent____s_category;
  if (!flash_forEvent____s_category)
  {
    v7 = __UILogCategoryGetNode("CalloutBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&flash_forEvent____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Flash", ", v9, 2u);
  }

}

- (void)touchDown
{
  if (self->m_action == sel_paste_)
    _UIPasteboardAnalyticsReportEvent(CFSTR("CalloutBar"), self->m_appearanceDate);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  uint64_t v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfButton:", self);

  -[UIView bounds](self, "bounds");
  v16 = CGRectInset(v15, -1.0, 0.0);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v12, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  UITargetedPreview *v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  v5 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", self);
  -[UIView frame](self, "frame");
  v16 = CGRectInset(v15, 2.0, 2.0);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  -[UICalloutBarButton cornerRadius](self, "cornerRadius");
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v10 + -2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__UICalloutBarButton_pointerInteraction_willEnterRegion_animator___block_invoke;
    v13[3] = &unk_1E16B1888;
    v13[4] = self;
    v13[5] = v12;
    objc_msgSend(v8, "addAnimations:", v13);
  }

}

void __66__UICalloutBarButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  id v2;

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonHovered:index:hovered:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__UICalloutBarButton_pointerInteraction_willExitRegion_animator___block_invoke;
    v13[3] = &unk_1E16B1888;
    v13[4] = self;
    v13[5] = v12;
    objc_msgSend(v8, "addAnimations:", v13);
  }

}

void __65__UICalloutBarButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  id v2;

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonHovered:index:hovered:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (SEL)action
{
  return self->m_action;
}

- (double)contentWidth
{
  return self->m_contentWidth;
}

- (double)contentScale
{
  return self->m_contentScale;
}

- (double)additionalContentHeight
{
  return self->m_additionalContentHeight;
}

- (int)type
{
  return self->m_type;
}

- (_UICalloutBarVisualStyle)visualStyle
{
  return self->m_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->m_visualStyle, a3);
}

- (UITextReplacement)textReplacement
{
  return self->m_textReplacement;
}

- (void)setTextReplacement:(id)a3
{
  objc_storeStrong((id *)&self->m_textReplacement, a3);
}

- (BOOL)forceFlash
{
  return self->forceFlash;
}

- (void)setForceFlash:(BOOL)a3
{
  self->forceFlash = a3;
}

- (int64_t)page
{
  return self->m_page;
}

- (void)setPage:(int64_t)a3
{
  self->m_page = a3;
}

- (double)dividerOffset
{
  return self->m_dividerOffset;
}

- (void)setDividerOffset:(double)a3
{
  self->m_dividerOffset = a3;
}

- (double)imageVerticalAdjust
{
  return self->m_imageVerticalAdjust;
}

- (void)setImageVerticalAdjust:(double)a3
{
  self->m_imageVerticalAdjust = a3;
}

- (BOOL)dontDismiss
{
  return self->m_dontDismiss;
}

- (void)setDontDismiss:(BOOL)a3
{
  self->m_dontDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_destroyWeak((id *)&self->m_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->m_appearanceDate, 0);
  objc_storeStrong((id *)&self->m_textReplacement, 0);
}

- (double)_scaleFactorForImage
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)_UISSlotContentSizeCategoryFromContentSizeCategory(v4) >= 9)
  {
    UISGetFontContentSizeCategory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(v6);
  return v7;
}

@end
