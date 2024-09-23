@implementation PXGadgetCustomSectionHeaderUIView

- (UIImageView)iconImageView
{
  UIImageView **p_iconImageView;
  UIImageView *v4;
  void *v5;
  void *v6;
  void *v7;

  p_iconImageView = &self->_iconImageView;
  v4 = self->_iconImageView;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bubble.middle.bottom.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4, "setTintColor:", v7);

    objc_storeStrong((id *)p_iconImageView, v4);
    -[PXGadgetCustomSectionHeaderUIView addSubview:](self, "addSubview:", v4);

  }
  return v4;
}

- (UILabel)iconTitleLabel
{
  UILabel **p_iconTitleLabel;
  UILabel *v4;
  id v5;
  void *v6;

  p_iconTitleLabel = &self->_iconTitleLabel;
  v4 = self->_iconTitleLabel;
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[UILabel setText:](v4, "setText:", CFSTR(""));
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 1);
    objc_storeStrong((id *)p_iconTitleLabel, v4);
    -[PXGadgetCustomSectionHeaderUIView addSubview:](self, "addSubview:", v4);
  }
  return v4;
}

- (UILabel)appleInternalLabel
{
  UILabel **p_appleInternalLabel;
  UILabel *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_appleInternalLabel = &self->_appleInternalLabel;
  v4 = self->_appleInternalLabel;
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 4);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    objc_msgSend((id)objc_opt_class(), "_appleInternalLabelText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4, "setText:", v7);

    -[PXGadgetCustomSectionHeaderUIView tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v8);

    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 1);
    -[UILabel setHidden:](v4, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v9);

    objc_storeStrong((id *)p_appleInternalLabel, v4);
    -[PXGadgetCustomSectionHeaderUIView addSubview:](self, "addSubview:", v4);
  }
  return v4;
}

- (UIButton)infoButton
{
  UIButton **p_infoButton;
  UIButton *v4;

  p_infoButton = &self->_infoButton;
  v4 = self->_infoButton;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 3);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTag:](v4, "setTag:", 1);
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__infoButtonSelected, 64);
    objc_storeStrong((id *)p_infoButton, v4);
    -[PXGadgetCustomSectionHeaderUIView addSubview:](self, "addSubview:", v4);
  }
  return v4;
}

- (void)_infoButtonSelected
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;

  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryButtonPressed");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PXGadgetCustomSectionHeaderUIView infoButton](self, "infoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v4);

}

- (void)configureTitleLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v4, "setNumberOfLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v7);

  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v8);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  char v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)PXGadgetCustomSectionHeaderUIView;
  -[PXGadgetSectionHeaderUIView layoutSubviews](&v45, sel_layoutSubviews);
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "edgeInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[PXGadgetSectionHeaderUIView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView accessoryButton](self, "accessoryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView divider](self, "divider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetCustomSectionHeaderUIView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (v12 && (objc_msgSend(v12, "isHidden") & 1) == 0)
  {
    objc_msgSend(v12, "sizeToFit");
    v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__PXGadgetCustomSectionHeaderUIView_layoutSubviews__block_invoke;
  v27[3] = &unk_1E5146358;
  v27[4] = self;
  v28 = v3;
  v32 = v8 + v15;
  v33 = v6 + v17;
  v34 = v19 - (v8 + v10);
  v35 = v21 - (v6 + 0.0);
  v29 = v11;
  v30 = v12;
  v44 = v22;
  v36 = v15;
  v37 = v17;
  v38 = v19;
  v39 = v21;
  v40 = v6;
  v41 = v8;
  v42 = 0;
  v43 = v10;
  v31 = v13;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  v26 = v3;
  +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", self, v27);

}

- (void)setAppleInternalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleInternalLabel, a3);
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (void)setIconTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_iconTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTitleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_appleInternalLabel, 0);
}

void __51__PXGadgetCustomSectionHeaderUIView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  CGFloat v34;
  double MaxX;
  double v36;
  double v37;
  double v38;
  double MinY;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double Width;
  _BOOL4 v50;
  _BOOL4 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "traitCollection");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "shouldShowDivider");
  objc_msgSend(*(id *)(a1 + 48), "sizeThatFits:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  v52 = v6;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 56), "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appleInternalLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  v53 = v13;
  v54 = v12;
  v14 = v13;

  v56 = v8 + v14 + -8.0;
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "infoButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstBaselineOfView:", *(_QWORD *)(a1 + 48));
  v18 = v17;

  objc_msgSend(*(id *)(a1 + 48), "frame");
  v20 = v18 - v19;
  MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "titleBottomSpacing");
  v23 = MaxY - v22 - v20;
  objc_msgSend(v16, "sizeThatFits:", 1.79769313e308, v8);
  v25 = v24;
  v27 = v26;
  v55 = round(v56 * 1.1);
  v28 = v55 + MinX + 8.0;
  objc_msgSend(*(id *)(a1 + 56), "frame");
  v30 = v29;
  objc_msgSend(v16, "frame");
  v32 = v30 - v31 + -16.0 - v28;
  if (v32 < 0.0)
    v32 = 0.0;
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", v28, v23, fmin(v32, v52), v8);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  objc_msgSend(v16, "setFrame:", CGRectGetMaxX(v58) + 8.0, v23, v25, v27);
  objc_msgSend(*(id *)(a1 + 32), "appleInternalLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "frame");
  v34 = CGRectGetMinY(v59) - v53;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(v33, "setFrame:", v28, v34, fmin(CGRectGetMaxX(v60) - v28, v54), v53);
  if (*(_BYTE *)(a1 + 168))
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 56), "bounds");
    v36 = MaxX - CGRectGetWidth(v61);
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    CGRectGetHeight(v62);
    objc_msgSend(*(id *)(a1 + 56), "bounds");
    CGRectGetHeight(v63);
    objc_msgSend(*(id *)(a1 + 56), "frame");
    v38 = v37;
    objc_msgSend(*(id *)(a1 + 56), "frame");
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", v36, v38);
  }
  objc_msgSend(v33, "frame");
  MinY = CGRectGetMinY(v64);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  v40 = CGRectGetMaxY(v65);
  objc_msgSend(v33, "frame");
  v41 = MinY + round((v40 - CGRectGetMinY(v66) - v56) * 0.5);
  objc_msgSend(*(id *)(a1 + 56), "frame");
  v43 = fmin(v55, v42 - MinX);
  objc_msgSend(v10, "setFrame:", MinX, v41, v43, v56);
  objc_msgSend(*(id *)(a1 + 32), "iconTitleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", MinX, v41, v43, v56 + -5.0);
  v45 = CGRectGetMinX(*(CGRect *)(a1 + 72));
  objc_msgSend(v57, "displayScale");
  v47 = v46;
  objc_msgSend(v33, "frame");
  v48 = CGRectGetMinY(v67);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
  v50 = objc_msgSend(v57, "verticalSizeClass") == 1 && objc_msgSend(v57, "horizontalSizeClass") == 2;
  if (objc_msgSend(v57, "userInterfaceIdiom"))
    v50 = 0;
  v51 = objc_msgSend(v57, "userInterfaceIdiom") == 1 && objc_msgSend(v57, "horizontalSizeClass") == 1;
  if (v50 || v51)
    Width = CGRectGetWidth(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 144);
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", v45, v48 - 1.0 / v47 + -12.0, Width);
  objc_msgSend(*(id *)(a1 + 64), "setHidden:", v5 ^ 1u);

}

+ (double)preferredHeightForText:(id)a3 buttonType:(unint64_t)a4 fittingWidth:(double)a5 style:(unint64_t)a6 dividerHidden:(BOOL)a7 isAccessibilitySize:(BOOL)a8
{
  _BOOL8 v8;
  double v12;
  double v13;
  double v14;
  void *v17;

  v8 = a7;
  if (a6 != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a6, a7, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGadgetCustomSectionHeaderUIView.m"), 41, CFSTR("+[PXGadgetCustomSectionHeaderUIView preferredHeightForText:buttonType:fittingWidth:style:dividerHidden:] can only be called with header style PXGadgetHeaderStyleCustomSurvey"));

  }
  +[PXGadgetSpec sectionHeaderHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderHeightForStyle:dividerHidden:", a6, v8);
  v13 = v12;
  objc_msgSend(a1, "_preferredHeightOfAppleInternalTextWithWidth:", a5);
  return v13 + v14;
}

+ (id)_appleInternalLabelText
{
  void *v2;
  int v3;
  __CFString *v4;

  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSurveyQuestionsWithProfile");

  if (v3)
    v4 = CFSTR("PXInternalPhotosChallengeVolunteerOnly");
  else
    v4 = CFSTR("PXInternalPhotosChallengeAppleInternal");
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)_preferredHeightOfAppleInternalTextWithWidth:(double)a3
{
  double v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PXGadgetCustomSectionHeaderUIView__preferredHeightOfAppleInternalTextWithWidth___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_preferredHeightOfAppleInternalTextWithWidth__onceToken != -1)
    dispatch_once(&_preferredHeightOfAppleInternalTextWithWidth__onceToken, block);
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "sizeThatFits:", a3, 0.0);
  return v4;
}

void __82__PXGadgetCustomSectionHeaderUIView__preferredHeightOfAppleInternalTextWithWidth___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v3 = (void *)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel;
  _preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel = (uint64_t)v2;

  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setTextAlignment:", 4);
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setTextColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_appleInternalLabelText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setText:", v5);

  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setNumberOfLines:", 1);
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 2, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_preferredHeightOfAppleInternalTextWithWidth__appleInternalLabel, "setFont:", v6);

}

@end
