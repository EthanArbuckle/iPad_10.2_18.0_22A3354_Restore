@implementation WALegibilityLabel

- (WALegibilityLabel)initWithFrame:(CGRect)a3
{
  void *v4;
  WALegibilityLabel *v5;

  objc_msgSend(MEMORY[0x24BDF70F0], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WALegibilityLabel initWithSettings:strength:](self, "initWithSettings:strength:", v4, *MEMORY[0x24BDF8160]);

  return v5;
}

- (WALegibilityLabel)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WALegibilityLabel.m"), 50, CFSTR("Not supported"));

  return -[WALegibilityLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  WALegibilityLabel *v9;

  v6 = (void *)MEMORY[0x24BDF6A70];
  v7 = a3;
  objc_msgSend(v6, "systemFontSize");
  objc_msgSend(v6, "systemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WALegibilityLabel initWithSettings:strength:text:font:](self, "initWithSettings:strength:text:font:", v7, 0, v8, a4);

  return v9;
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6
{
  return -[WALegibilityLabel initWithSettings:strength:text:font:options:](self, "initWithSettings:strength:text:font:options:", a3, a5, a6, 0, a4);
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  WALegibilityLabel *v20;
  WALegibilityLabel *v21;
  uint64_t v22;
  NSString *text;
  uint64_t v24;
  UILabel *lookasideLabel;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILayoutGuide *v34;
  UILayoutGuide *firstBaselineLayoutGuide;
  UILayoutGuide *v36;
  UILayoutGuide *lastBaselineLayoutGuide;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  id v69;
  id v70;
  id v71;
  objc_super v72;
  _QWORD v73[8];
  _QWORD v74[6];

  v74[4] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v72.receiver = self;
  v72.super_class = (Class)WALegibilityLabel;
  v16 = *MEMORY[0x24BDBF090];
  v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v20 = -[WALegibilityLabel initWithFrame:](&v72, sel_initWithFrame_, *MEMORY[0x24BDBF090], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    v22 = objc_msgSend(v14, "copy");
    text = v21->_text;
    v21->_text = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v16, v17, v18, v19);
    v71 = v13;
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    -[UILabel setHidden:](v21->_lookasideLabel, "setHidden:", 1);
    -[UILabel setText:](v21->_lookasideLabel, "setText:", v21->_text);
    -[UILabel setFont:](v21->_lookasideLabel, "setFont:", v21->_font);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v21->_lookasideLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WALegibilityLabel addSubview:](v21, "addSubview:", v21->_lookasideLabel);
    v57 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](v21->_lookasideLabel, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel topAnchor](v21, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v63;
    -[UILabel leadingAnchor](v21->_lookasideLabel, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v69 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v26;
    -[UILabel widthAnchor](v21->_lookasideLabel, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel widthAnchor](v21, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v70 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v29;
    -[UILabel heightAnchor](v21->_lookasideLabel, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel heightAnchor](v21, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v33);

    v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    firstBaselineLayoutGuide = v21->_firstBaselineLayoutGuide;
    v21->_firstBaselineLayoutGuide = v34;

    -[WALegibilityLabel addLayoutGuide:](v21, "addLayoutGuide:", v21->_firstBaselineLayoutGuide);
    v36 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    lastBaselineLayoutGuide = v21->_lastBaselineLayoutGuide;
    v21->_lastBaselineLayoutGuide = v36;

    -[WALegibilityLabel addLayoutGuide:](v21, "addLayoutGuide:", v21->_lastBaselineLayoutGuide);
    v54 = (void *)MEMORY[0x24BDD1628];
    -[UILayoutGuide topAnchor](v21->_firstBaselineLayoutGuide, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v21->_lookasideLabel, "firstBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v64;
    -[UILayoutGuide heightAnchor](v21->_firstBaselineLayoutGuide, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v60;
    -[UILayoutGuide leadingAnchor](v21->_firstBaselineLayoutGuide, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v55;
    -[UILayoutGuide trailingAnchor](v21->_firstBaselineLayoutGuide, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel trailingAnchor](v21, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v51;
    -[UILayoutGuide topAnchor](v21->_lastBaselineLayoutGuide, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v21->_lookasideLabel, "lastBaselineAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v48;
    -[UILayoutGuide heightAnchor](v21->_lastBaselineLayoutGuide, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v39;
    -[UILayoutGuide leadingAnchor](v21->_lastBaselineLayoutGuide, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v73[6] = v42;
    -[UILayoutGuide trailingAnchor](v21->_lastBaselineLayoutGuide, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel trailingAnchor](v21, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73[7] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activateConstraints:", v46);

    v15 = v69;
    v14 = v70;

    v13 = v71;
    -[WALegibilityLabel _markOurselfDirty](v21, "_markOurselfDirty");
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", self->_attributedText);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  text = self->_text;
  self->_text = v4;

  -[UILabel setText:](self->_lookasideLabel, "setText:", self->_text);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (UIColor)textColor
{
  UIColor *textColorOverride;

  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
    return textColorOverride;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextColor:(id)a3
{
  UIColor **p_textColorOverride;
  id v6;

  p_textColorOverride = &self->_textColorOverride;
  objc_storeStrong((id *)&self->_textColorOverride, a3);
  v6 = a3;
  -[UILabel setTextColor:](self->_lookasideLabel, "setTextColor:", *p_textColorOverride);

  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (void)setFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[UILabel setFont:](self->_lookasideLabel, "setFont:", v5);

  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_lookasideLabel, "setNumberOfLines:", a3);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_lookasideLabel, "setAdjustsFontSizeToFitWidth:", a3);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (double)minimumScaleFactor
{
  double result;

  -[UILabel minimumScaleFactor](self->_lookasideLabel, "minimumScaleFactor");
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  -[UILabel setMinimumScaleFactor:](self->_lookasideLabel, "setMinimumScaleFactor:", a3);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
  -[_UILegibilityView setOptions:](self->_legibilityView, "setOptions:");
}

- (double)firstBaselineOffsetFromBottom
{
  double result;

  -[WALegibilityLabel layoutIfNeeded](self, "layoutIfNeeded");
  -[WALegibilityLabel _layoutGuideOffsetFromBottom:](self, "_layoutGuideOffsetFromBottom:", self->_firstBaselineLayoutGuide);
  return result;
}

- (double)lastBaselineOffsetFromBottom
{
  double result;

  -[WALegibilityLabel layoutIfNeeded](self, "layoutIfNeeded");
  -[WALegibilityLabel _layoutGuideOffsetFromBottom:](self, "_layoutGuideOffsetFromBottom:", self->_lastBaselineLayoutGuide);
  return result;
}

- (void)updateConstraints
{
  _UILegibilityView *legibilityView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *legibilityConstraints;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel updateConstraints](&v28, sel_updateConstraints);
  legibilityView = self->_legibilityView;
  if (legibilityView)
  {
    -[_UILegibilityView leadingAnchor](legibilityView, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v21;
    -[_UILegibilityView trailingAnchor](self->_legibilityView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel trailingAnchor](self, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v5;
    -[_UILegibilityView bottomAnchor](self->_legibilityView, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel lastBaselineAnchor](self, "lastBaselineAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _baselineOffsetFromBottom](self->_lookasideLabel, "_baselineOffsetFromBottom");
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v8;
    -[_UILegibilityView topAnchor](self->_legibilityView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALegibilityLabel topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          LODWORD(v15) = 1144750080;
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18++), "setPriority:", v15);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
    legibilityConstraints = self->_legibilityConstraints;
    self->_legibilityConstraints = v13;

  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WALegibilityLabel frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WALegibilityLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_isDirty)
  {
    self->_isDirty = 0;
    -[WALegibilityLabel _updateLegibilityView](self, "_updateLegibilityView");
  }
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  -[_UILegibilityView setStrength:](self->_legibilityView, "setStrength:");
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  -[WALegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
}

- (void)_markOurselfDirty
{
  self->_isDirty = 1;
  -[WALegibilityLabel setNeedsLayout](self, "setNeedsLayout");
}

- (double)_layoutGuideOffsetFromBottom:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[WALegibilityLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "layoutFrame");
  v10 = v9;

  return v6 + v8 - v10;
}

- (void)_updateLabelForLegibilitySettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[UILabel attributedText](self->_lookasideLabel, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = objc_msgSend(v7, "length");
  -[WALegibilityLabel textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF6600];
  if (v5)
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  else
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", v7);

}

- (void)_updateLegibilityView
{
  void *v3;
  void *v4;
  NSArray *legibilityConstraints;
  _UILegibilityView *legibilityView;
  _UILegibilityView *v7;
  _UILegibilityView *v8;

  -[WALegibilityLabel _updateLabelForLegibilitySettings](self, "_updateLabelForLegibilitySettings");
  -[WALegibilityLabel bounds](self, "bounds");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  _UIGraphicsDrawIntoImageContextWithOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  legibilityConstraints = self->_legibilityConstraints;
  self->_legibilityConstraints = 0;

  -[_UILegibilityView removeFromSuperview](self->_legibilityView, "removeFromSuperview");
  legibilityView = self->_legibilityView;
  self->_legibilityView = 0;

  v7 = (_UILegibilityView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7100]), "initWithSettings:strength:image:shadowImage:options:", self->_legibilitySettings, v4, 0, self->_options, self->_strength);
  v8 = self->_legibilityView;
  self->_legibilityView = v7;

  -[_UILegibilityView setTranslatesAutoresizingMaskIntoConstraints:](self->_legibilityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WALegibilityLabel addSubview:](self, "addSubview:", self->_legibilityView);
  -[WALegibilityLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

uint64_t __42__WALegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "drawRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_legibilityConstraints, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end
