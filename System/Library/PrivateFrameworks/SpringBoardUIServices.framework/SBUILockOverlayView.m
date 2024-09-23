@implementation SBUILockOverlayView

- (SBUILockOverlayView)initWithFrame:(CGRect)a3
{
  return -[SBUILockOverlayView initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUILockOverlayView)initWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  SBUILockOverlayView *v5;
  SBUILockOverlayView *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  SBLockOverlayStylePropertiesFactory *underlayPropertiesFactory;
  uint64_t v17;
  _UILegibilitySettings *legibilitySettings;
  UIResizableView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  UIResizableView *textContainerView;
  UIResizableView *v26;
  void *v27;
  uint64_t v28;
  UILabel *titleLabel;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  uint64_t v36;
  UILabel *subtitleLabel;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  UILabel *v42;
  void *v43;
  uint64_t v44;
  UIButton *actionButton;
  UIButton *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIButton *v52;
  void *v53;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)SBUILockOverlayView;
  v5 = -[SBUILockOverlayView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    -[SBUILockOverlayView _maxLabelWidth](v5, "_maxLabelWidth");
    v8 = v7;
    -[SBUILockOverlayView _actionFont](v6, "_actionFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    v11 = v10;
    -[SBUILockOverlayView _titleFont](v6, "_titleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pointSize");
    v14 = v11 / v13;

    +[SBLockOverlayStylePropertiesFactory overlayPropertiesFactoryWithStyle:](SBLockOverlayStylePropertiesFactory, "overlayPropertiesFactoryWithStyle:", a4);
    v15 = objc_claimAutoreleasedReturnValue();
    underlayPropertiesFactory = v6->_underlayPropertiesFactory;
    v6->_underlayPropertiesFactory = (SBLockOverlayStylePropertiesFactory *)v15;

    -[SBUILockOverlayView _legibilitySettingsForStyle:](v6, "_legibilitySettingsForStyle:", a4);
    v17 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v6->_legibilitySettings;
    v6->_legibilitySettings = (_UILegibilitySettings *)v17;

    v19 = [UIResizableView alloc];
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v24 = -[UIResizableView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
    textContainerView = v6->_textContainerView;
    v6->_textContainerView = (UIResizableView *)v24;

    v26 = v6->_textContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResizableView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[SBUILockOverlayView addSubview:](v6, "addSubview:", v6->_textContainerView);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v20, v21, v22, v23);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v28;

    -[UILabel setTextAlignment:](v6->_titleLabel, "setTextAlignment:", 1);
    v30 = v6->_titleLabel;
    -[SBUILockOverlayView _titleFont](v6, "_titleFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v30, "setFont:", v31);

    v32 = v6->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v32, "setTextColor:", v33);

    v34 = v6->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v34, "setBackgroundColor:", v35);

    -[UILabel setPreferredMaxLayoutWidth:](v6->_titleLabel, "setPreferredMaxLayoutWidth:", v8);
    -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v6->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v6->_titleLabel, "setMinimumScaleFactor:", v14);
    -[UIResizableView addSubview:](v6->_textContainerView, "addSubview:", v6->_titleLabel);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v20, v21, v22, v23);
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = (UILabel *)v36;

    -[UILabel setTextAlignment:](v6->_subtitleLabel, "setTextAlignment:", 1);
    v38 = v6->_subtitleLabel;
    -[SBUILockOverlayView _subtitleFont](v6, "_subtitleFont");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v38, "setFont:", v39);

    v40 = v6->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v40, "setTextColor:", v41);

    v42 = v6->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v42, "setBackgroundColor:", v43);

    -[UILabel setNumberOfLines:](v6->_subtitleLabel, "setNumberOfLines:", 10);
    -[UIResizableView addSubview:](v6->_textContainerView, "addSubview:", v6->_subtitleLabel);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v44 = objc_claimAutoreleasedReturnValue();
    actionButton = v6->_actionButton;
    v6->_actionButton = (UIButton *)v44;

    v46 = v6->_actionButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v46, "setBackgroundColor:", v47);

    -[UIButton addTarget:action:forControlEvents:](v6->_actionButton, "addTarget:action:forControlEvents:", v6, sel__buttonPressed, 64);
    -[UIButton titleLabel](v6->_actionButton, "titleLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPreferredMaxLayoutWidth:", v8);

    -[UIButton titleLabel](v6->_actionButton, "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setNumberOfLines:", 2);

    -[UIButton titleLabel](v6->_actionButton, "titleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILockOverlayView _actionFont](v6, "_actionFont");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFont:", v51);

    v52 = v6->_actionButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.203921569, 0.666666667, 0.862745098, 1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v52, "setTitleColor:forState:", v53, 0);

    -[UIResizableView addSubview:](v6->_textContainerView, "addSubview:", v6->_actionButton);
  }
  return v6;
}

- (id)_legibilitySettingsForStyle:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 4)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UILabel **p_titleLabel;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *v17;
  void *v18;
  UILabel **p_subtitleLabel;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UILabel *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  UILabel *v47;
  UILabel **v48;
  int v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  UILabel *v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  objc_super v88;

  v88.receiver = self;
  v88.super_class = (Class)SBUILockOverlayView;
  -[SBUILockOverlayView layoutSubviews](&v88, sel_layoutSubviews);
  -[SBUILockOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  p_titleLabel = &self->_titleLabel;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  titleLabel = self->_titleLabel;
  -[SBUILockOverlayView _titleFont](self, "_titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v9);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel text](self->_titleLabel, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[SBUILockOverlayView _sizeView:forFixedWith:](self, "_sizeView:forFixedWith:", self->_titleLabel, 1);
    -[UILabel attributedText](*p_titleLabel, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v14 = v13;
    -[UILabel bounds](*p_titleLabel, "bounds");
    v16 = v15;

    if (v14 > v16)
    {
      -[UILabel setNumberOfLines:](*p_titleLabel, "setNumberOfLines:", 2);
      v17 = *p_titleLabel;
      -[SBUILockOverlayView _actionFont](self, "_actionFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v17, "setFont:", v18);

      -[UILabel setAdjustsFontSizeToFitWidth:](*p_titleLabel, "setAdjustsFontSizeToFitWidth:", 0);
      -[SBUILockOverlayView _sizeView:forFixedWith:](self, "_sizeView:forFixedWith:", *p_titleLabel, 1);
    }
  }
  else
  {
    -[UILabel setFrame:](*p_titleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  p_subtitleLabel = &self->_subtitleLabel;
  -[UILabel text](self->_subtitleLabel, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
    -[SBUILockOverlayView _sizeView:forFixedWith:](self, "_sizeView:forFixedWith:", self->_subtitleLabel, 1);
  else
    -[UILabel setFrame:](*p_subtitleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIButton titleForState:](self->_actionButton, "titleForState:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v6;
  if (objc_msgSend(v22, "length"))
  {

  }
  else
  {
    -[UIButton attributedTitleForState:](self->_actionButton, "attributedTitleForState:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (!v24)
    {
      -[UIButton setFrame:](self->_actionButton, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v25 = 0;
      goto LABEL_12;
    }
  }
  -[SBUILockOverlayView _sizeView:forFixedWith:](self, "_sizeView:forFixedWith:", self->_actionButton, 0);
  v25 = 1;
LABEL_12:
  -[UILabel frame](*p_subtitleLabel, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = *p_titleLabel;
  if (v21 && v11)
  {
    -[UILabel _baselineOffsetFromBottom](v32, "_baselineOffsetFromBottom");
    v34 = v33;
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](*p_subtitleLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v36 = v34 + v35;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v37 = 49.0;
      else
        v37 = 29.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "userInterfaceIdiom") == 1)
        v37 = 49.0;
      else
        v37 = 29.0;

    }
    v43 = v37 - v36;
    -[UILabel origin](*p_titleLabel, "origin");
    v45 = v44;
    -[UILabel size](*p_titleLabel, "size");
    v41 = SBFloatFloorForScale(v43 + v45 + v46, 0.0);
  }
  else
  {
    -[UILabel origin](v32, "origin");
    v39 = v38;
    -[UILabel size](*p_titleLabel, "size");
    v41 = v39 + v40;
  }
  v47 = (UILabel *)(v21 | v11);
  -[UILabel setFrame:](*p_subtitleLabel, "setFrame:", v27, v41, v29, v31);
  -[UIButton frame](self->_actionButton, "frame");
  if (v21 | v11
    && (v21 ? (v48 = &self->_subtitleLabel) : (v48 = &self->_titleLabel),
        (v47 = *v48) != 0 ? (v49 = v25) : (v49 = 0),
        v49 == 1))
  {
    -[UIButton titleLabel](self->_actionButton, "titleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _baselineOffsetFromBottom](v47, "_baselineOffsetFromBottom");
    v52 = v51;
    objc_msgSend(v50, "_firstLineBaselineOffsetFromBoundsTop");
    v54 = v53;
    objc_msgSend(v50, "origin");
    v56 = v52 + v54 + v55;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v57 = 48.0;
      else
        v57 = 43.5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "userInterfaceIdiom") == 1)
        v57 = 48.0;
      else
        v57 = 43.5;

    }
    v59 = v57 - v56;
    -[UILabel origin](v47, "origin");
    v61 = v60;
    -[UILabel size](v47, "size");
    SBFloatFloorForScale(v59 + v61 + v62, 0.0);

  }
  else
  {
    -[UILabel origin](*p_subtitleLabel, "origin");
    -[UILabel size](*p_subtitleLabel, "size");
  }
  UIRectCenteredXInRect();
  -[UIButton setFrame:](self->_actionButton, "setFrame:");
  -[SBUILockOverlayView _sizeView:forFixedWith:](self, "_sizeView:forFixedWith:", self->_textContainerView, 1);
  -[UIResizableView frame](self->_textContainerView, "frame");
  v64 = v63;
  v66 = v65;
  v67 = SBFloatFloorForScale(v4 * 0.5 - v63 * 0.5, 0.0);
  if (v11)
  {
    -[UILabel font](*p_titleLabel, "font");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "descender");
    v70 = v69;

    if ((v25 & 1) == 0)
    {
      if (!v21)
      {
        v71 = *p_titleLabel;
LABEL_50:
        -[UILabel font](v71, "font");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
        v78 = v74;
        objc_msgSend(v74, "descender");
        v75 = v79;

        goto LABEL_55;
      }
LABEL_49:
      v71 = *p_subtitleLabel;
      goto LABEL_50;
    }
LABEL_53:
    -[SBUILockOverlayView _actionFont](self, "_actionFont");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  if (v21)
  {
    -[UILabel font](*p_subtitleLabel, "font");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "descender");
    v70 = v73;

    if ((v25 & 1) == 0)
      goto LABEL_49;
    goto LABEL_53;
  }
  v75 = 0.0;
  v70 = 0.0;
  if (v25)
  {
    -[SBUILockOverlayView _actionFont](self, "_actionFont");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "descender");
    v70 = v77;

    goto LABEL_53;
  }
LABEL_55:
  -[UIResizableView setFrame:](self->_textContainerView, "setFrame:", v67, SBFloatFloorForScale(v87 * 0.5 - (v66 + fabs(v70) - fabs(v75)) * 0.5, 0.0), v64, v66);
  -[UIButton frame](self->_actionButton, "frame");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  -[UIResizableView frame](self->_textContainerView, "frame");
  -[UIButton setFrame:](self->_actionButton, "setFrame:", SBFloatFloorForScale((v86 - v83) * 0.5, 0.0), v81, v83, v85);

}

- (id)_titleFont
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  _BOOL4 v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    v6 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  v7 = 36.0;
  if (v6)
    v7 = 48.0;
  objc_msgSend(v3, "_thinSystemFontOfSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) == 0)

  return v8;
}

- (id)_subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB578]);
}

- (id)_actionFont
{
  void *v2;
  int v3;
  char v4;
  uint64_t v5;
  void *v6;

  v3 = __sb__runningInSpringBoard();
  v4 = v3;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CEA5E8], "_lightSystemFontOfSize:", 24.0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 24.0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;
  if ((v4 & 1) == 0)

  return v6;
}

- (void)_buttonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "handleTapGestureFromView:", self);

}

- (unint64_t)_numberOfLinesForText:(id)a3 font:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  height = a5.height;
  width = a5.width;
  v8 = (objc_class *)MEMORY[0x1E0CEA248];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "setWantsNumberOfLineFragments:", 1);
  v15 = *MEMORY[0x1E0CEA098];
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 33, v12, v11, width, height);
  v13 = objc_msgSend(v11, "numberOfLineFragments");

  return v13;
}

- (void)_sizeView:(id)a3 forFixedWith:(BOOL)a4
{
  id v5;

  v5 = a3;
  -[SBUILockOverlayView _maxLabelWidth](self, "_maxLabelWidth");
  objc_msgSend(v5, "sizeThatFits:");
  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:");

}

- (double)_maxLabelWidth
{
  CGRect v3;

  -[SBUILockOverlayView bounds](self, "bounds");
  return CGRectGetWidth(v3) + -40.0;
}

- (SBUILockOverlayViewDelegate)delegate
{
  return (SBUILockOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (SBLockOverlayStylePropertiesFactory)underlayPropertiesFactory
{
  return self->_underlayPropertiesFactory;
}

- (unint64_t)style
{
  return self->_style;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_underlayPropertiesFactory, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
