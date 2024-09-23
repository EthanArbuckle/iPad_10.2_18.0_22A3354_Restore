@implementation PXActivityProgressViewController

- (void)setPrimaryText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_primaryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    -[PXActivityProgressViewController _updatePrimaryLabel](self, "_updatePrimaryLabel");
    -[PXActivityProgressViewController updateViewConstraints](self, "updateViewConstraints");
  }

}

- (void)setSecondaryText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    -[PXActivityProgressViewController _updateSecondaryLabel](self, "_updateSecondaryLabel");
    -[PXActivityProgressViewController updateViewConstraints](self, "updateViewConstraints");
  }

}

- (void)setFractionCompleted:(double)a3
{
  void *v5;
  double v6;

  self->_fractionCompleted = a3;
  -[PXActivityProgressViewController _progressView](self, "_progressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setProgress:", v6);

  -[PXActivityProgressViewController _updateViewVisibility](self, "_updateViewVisibility");
}

- (void)_updateViewVisibility
{
  double v3;
  double v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[PXActivityProgressViewController fractionCompleted](self, "fractionCompleted");
  v4 = v3;
  v5 = -[PXActivityProgressViewController showCheckmarkOnCompletion](self, "showCheckmarkOnCompletion");
  -[PXActivityProgressViewController _progressView](self, "_progressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v4 >= 1.0)
  {
    objc_msgSend(v6, "setHidden:", 1);

    -[PXActivityProgressViewController _checkmarkView](self, "_checkmarkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "setHidden:", 0);

    -[PXActivityProgressViewController _checkmarkView](self, "_checkmarkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 1;
  }
  objc_msgSend(v8, "setHidden:", v9);

}

- (id)_primaryLabel
{
  void *v3;
  UILabel *v4;
  void *v5;
  UILabel *primaryLabel;
  UILabel *v7;

  -[PXActivityProgressViewController primaryText](self, "primaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_primaryLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXActivityProgressViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v4;

    -[PXActivityProgressViewController _updatePrimaryLabel](self, "_updatePrimaryLabel");
  }
  v7 = self->_primaryLabel;

  return v7;
}

- (id)_secondaryLabel
{
  void *v3;
  UILabel *v4;
  void *v5;
  UILabel *secondaryLabel;
  UILabel *v7;

  -[PXActivityProgressViewController secondaryText](self, "secondaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_secondaryLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXActivityProgressViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    -[PXActivityProgressViewController _updateSecondaryLabel](self, "_updateSecondaryLabel");
  }
  v7 = self->_secondaryLabel;

  return v7;
}

- (void)_updatePrimaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PXActivityProgressViewController primaryText](self, "primaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v8[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v6);
    -[UILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", v7);

  }
  else
  {
    -[UILabel setAttributedText:](self->_primaryLabel, "setAttributedText:", 0);
  }

}

- (void)_updateSecondaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[PXActivityProgressViewController secondaryText](self, "secondaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v8[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v6);
    -[UILabel setAttributedText:](self->_secondaryLabel, "setAttributedText:", v7);

  }
  else
  {
    -[UILabel setAttributedText:](self->_secondaryLabel, "setAttributedText:", 0);
  }

}

- (id)_progressView
{
  PXRoundProgressView *progressView;
  PXRoundProgressView *v4;
  void *v5;
  PXRoundProgressView *v6;

  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 5, 0.0, 0.0, 40.0, 40.0);
    -[PXRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXActivityProgressViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    v6 = self->_progressView;
    self->_progressView = v4;

    progressView = self->_progressView;
  }
  return progressView;
}

- (id)_checkmarkView
{
  UIImageView *checkmarkView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;

  checkmarkView = self->_checkmarkView;
  if (!checkmarkView)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 40.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithSymbolConfiguration:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_tintedImageWithColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    v10 = self->_checkmarkView;
    self->_checkmarkView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXActivityProgressViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_checkmarkView);

    -[UIImageView setHidden:](self->_checkmarkView, "setHidden:", 1);
    checkmarkView = self->_checkmarkView;
  }
  return checkmarkView;
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *labelConstraints;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *contentConstraints;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PXActivityProgressViewController *v47;
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
  NSArray *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[15];

  v69[13] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)PXActivityProgressViewController;
  -[PXActivityProgressViewController updateViewConstraints](&v68, sel_updateViewConstraints);
  -[PXActivityProgressViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressViewController _primaryLabel](self, "_primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressViewController _secondaryLabel](self, "_secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressViewController _progressView](self, "_progressView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressViewController _checkmarkView](self, "_checkmarkView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeConstraints:", self->_labelConstraints);

  v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v7, "addObject:", v11);

    objc_msgSend(v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -18.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v7, "addObject:", v14);

    objc_msgSend(v4, "lastBaselineAnchor");
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
  v64 = v5;
  v65 = v4;
  if (v5)
  {
    objc_msgSend(v3, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v7, "addObject:", v18);

    objc_msgSend(v5, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v19, -8.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v7, "addObject:", v20);

    objc_msgSend(v5, "lastBaselineAnchor");
    v21 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v21;
  }
  v45 = v8;
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  labelConstraints = self->_labelConstraints;
  self->_labelConstraints = v7;
  v63 = v7;

  -[PXActivityProgressViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeConstraints:", self->_contentConstraints);

  v24 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v3, "addLayoutGuide:", v24);
  objc_msgSend(v3, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v60;
  objc_msgSend(v3, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v57;
  objc_msgSend(v24, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v56, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v55;
  objc_msgSend(v3, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v51;
  objc_msgSend(v24, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v48;
  objc_msgSend(v24, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v43;
  objc_msgSend(v24, "centerXAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69[6] = v40;
  objc_msgSend(v24, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v69[7] = v36;
  objc_msgSend(v24, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 120.0);
  v52 = v3;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[8] = v25;
  objc_msgSend(v66, "widthAnchor");
  v47 = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 40.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v27;
  objc_msgSend(v66, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 40.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v69[10] = v29;
  objc_msgSend(v67, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 44.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v69[11] = v31;
  objc_msgSend(v67, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 44.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[12] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 13);
  v39 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
  contentConstraints = v47->_contentConstraints;
  v47->_contentConstraints = (NSArray *)v39;

}

- (void)reset
{
  void *v3;
  id v4;

  -[PXActivityProgressViewController _progressView](self, "_progressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");
  objc_msgSend(v4, "setHidden:", 0);
  -[PXActivityProgressViewController _checkmarkView](self, "_checkmarkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (BOOL)showCheckmarkOnCompletion
{
  return self->_showCheckmarkOnCompletion;
}

- (void)setShowCheckmarkOnCompletion:(BOOL)a3
{
  self->_showCheckmarkOnCompletion = a3;
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
