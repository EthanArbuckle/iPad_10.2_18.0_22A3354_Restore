@implementation TUICandidateCell

- (void)commonInit
{
  self->_alignment = 1;
  -[TUICandidateCell _setFocusStyle:](self, "_setFocusStyle:", 1);
  -[TUICandidateCell setMinimumTextLabelHeight:](self, "setMinimumTextLabelHeight:", 42.0);
}

- (TUICandidateCell)initWithFrame:(CGRect)a3
{
  TUICandidateCell *v3;
  TUICandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateCell;
  v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateCell)initWithCoder:(id)a3
{
  TUICandidateCell *v3;
  TUICandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateCell;
  v3 = -[TUICandidateCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *imageView;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[TUICandidateCell image](self, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        v7 = objc_alloc(MEMORY[0x1E0DC3890]);
        v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v9 = self->_imageView;
        self->_imageView = v8;

        -[TUICandidateCell contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", self->_imageView);

        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:", v12);
      -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v11 = self->_imageView;
      self->_imageView = 0;

    }
    v5 = v12;
  }

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setCustomView:(id)a3
{
  id v5;
  void *v6;
  UIView *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TUICandidateCell customView](self, "customView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    v7 = self->_customView;
    objc_storeStrong((id *)&self->_customView, a3);
    -[UIView removeFromSuperview](v7, "removeFromSuperview");
    if (v9)
    {
      -[TUICandidateCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
    }

    v6 = v9;
  }

}

- (TUICandidateLabel)textLabel
{
  TUICandidateLabel *textLabel;
  TUICandidateLabel *v4;
  TUICandidateLabel *v5;
  TUICandidateLabel *v6;
  void *v7;
  void *v8;
  void *v9;
  CGRect v11;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = [TUICandidateLabel alloc];
    -[TUICandidateCell bounds](self, "bounds");
    v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v11), 42.0);
    v6 = self->_textLabel;
    self->_textLabel = v5;

    -[TUICandidateLabel setAdjustsFontSizeToFitWidth:](self->_textLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", objc_msgSend(v7, "lineBreakMode"));

    -[TUICandidateBaseCell style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setLayoutOrientation:](self->_textLabel, "setLayoutOrientation:", objc_msgSend(v8, "layoutOrientation"));

    -[TUICandidateCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_textLabel);

    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (TUICandidateLabel)alternativeTextLabel
{
  TUICandidateLabel *alternativeTextLabel;
  TUICandidateLabel *v4;
  TUICandidateLabel *v5;
  TUICandidateLabel *v6;
  void *v7;
  void *v8;

  alternativeTextLabel = self->_alternativeTextLabel;
  if (!alternativeTextLabel)
  {
    v4 = [TUICandidateLabel alloc];
    v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_alternativeTextLabel;
    self->_alternativeTextLabel = v5;

    -[TUICandidateLabel setAdjustsFontSizeToFitWidth:](self->_alternativeTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[TUICandidateLabel setMinimumScaleFactor:](self->_alternativeTextLabel, "setMinimumScaleFactor:", 0.9);
    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setLayoutOrientation:](self->_alternativeTextLabel, "setLayoutOrientation:", objc_msgSend(v7, "layoutOrientation"));

    -[TUICandidateCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_alternativeTextLabel);

    alternativeTextLabel = self->_alternativeTextLabel;
  }
  return alternativeTextLabel;
}

- (UILabel)candidateNumberLabel
{
  UILabel *candidateNumberLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  candidateNumberLabel = self->_candidateNumberLabel;
  if (!candidateNumberLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_candidateNumberLabel;
    self->_candidateNumberLabel = v5;

    -[UILabel setHidden:](self->_candidateNumberLabel, "setHidden:", -[TUICandidateCell shouldShowCandidateNumber](self, "shouldShowCandidateNumber") ^ 1);
    -[UILabel setTextAlignment:](self->_candidateNumberLabel, "setTextAlignment:", 1);
    -[TUICandidateCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_candidateNumberLabel);

    candidateNumberLabel = self->_candidateNumberLabel;
  }
  return candidateNumberLabel;
}

- (TUICandidateLabel)annotationTextLabel
{
  TUICandidateLabel *annotationTextLabel;
  TUICandidateLabel *v4;
  TUICandidateLabel *v5;
  TUICandidateLabel *v6;
  void *v7;

  annotationTextLabel = self->_annotationTextLabel;
  if (!annotationTextLabel)
  {
    v4 = [TUICandidateLabel alloc];
    v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_annotationTextLabel;
    self->_annotationTextLabel = v5;

    -[TUICandidateLabel setAlpha:](self->_annotationTextLabel, "setAlpha:", 0.4);
    -[TUICandidateCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_annotationTextLabel);

    annotationTextLabel = self->_annotationTextLabel;
  }
  return annotationTextLabel;
}

- (void)prepareForReuse
{
  TIKeyboardCandidate *candidate;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICandidateCell;
  -[TUICandidateCell prepareForReuse](&v4, sel_prepareForReuse);
  candidate = self->_candidate;
  self->_candidate = 0;

  -[TUICandidateCell setCandidateNumber:](self, "setCandidateNumber:", 0);
  -[TUICandidateCell setShouldShowCandidateNumber:](self, "setShouldShowCandidateNumber:", 0);
  -[TUICandidateCell setRowSelected:](self, "setRowSelected:", 0);
  -[TUICandidateCell setImage:](self, "setImage:", 0);
}

- (void)setCandidate:(id)a3
{
  TIKeyboardCandidate *v5;
  TIKeyboardCandidate *candidate;
  char v7;
  void *v8;
  void *v9;
  TUICandidateLabel *textLabel;
  TIKeyboardCandidate *v11;
  void *v12;
  void *v13;
  void *v14;
  TUICandidateLabel *alternativeTextLabel;
  TIKeyboardCandidate *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TIKeyboardCandidate *v25;

  v5 = (TIKeyboardCandidate *)a3;
  candidate = self->_candidate;
  if (candidate == v5)
    goto LABEL_22;
  v25 = v5;
  v7 = -[TIKeyboardCandidate isEqual:](candidate, "isEqual:");
  v5 = v25;
  if ((v7 & 1) != 0)
    goto LABEL_22;
  objc_storeStrong((id *)&self->_candidate, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TIKeyboardCandidate icon](v25, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateCell setImage:](self, "setImage:", v8);

  }
  -[TIKeyboardCandidate label](v25, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {

  }
  else
  {
    textLabel = self->_textLabel;

    v11 = v25;
    if (!textLabel)
      goto LABEL_9;
  }
  -[TIKeyboardCandidate label](v25, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v11 = v25;
LABEL_9:
  -[TIKeyboardCandidate alternativeText](v11, "alternativeText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {

LABEL_12:
    -[TIKeyboardCandidate alternativeText](v25, "alternativeText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateCell alternativeTextLabel](self, "alternativeTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    v16 = v25;
    goto LABEL_13;
  }
  alternativeTextLabel = self->_alternativeTextLabel;

  v16 = v25;
  if (alternativeTextLabel)
    goto LABEL_12;
LABEL_13:
  -[TIKeyboardCandidate annotationText](v16, "annotationText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    -[TIKeyboardCandidate annotationText](v25, "annotationText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  if (objc_msgSend(v22, "length") || self->_annotationTextLabel)
  {
    -[TUICandidateCell annotationTextLabel](self, "annotationTextLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TIKeyboardCandidate customView](v25, "customView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateCell setCustomView:](self, "setCustomView:", v24);

  }
  -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");

  v5 = v25;
LABEL_22:

}

- (void)setCandidateNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;

  if (self->_candidateNumber != a3)
  {
    self->_candidateNumber = a3;
    if (a3 - 1 > 8)
    {
      if (-[TUICandidateCell shouldShowCandidateNumber](self, "shouldShowCandidateNumber"))
      {
        -[TUICandidateBaseCell style](self, "style");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "layoutOrientation");

        if (v6 == 1)
          v7 = CFSTR(" ");
        else
          v7 = 0;
        v9 = (id)v7;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringValue");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[TUICandidateCell candidateNumberLabel](self, "candidateNumberLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldShowCandidateNumber:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (self->_shouldShowCandidateNumber != a3)
  {
    self->_shouldShowCandidateNumber = a3;
    v4 = !a3;
    -[TUICandidateCell candidateNumberLabel](self, "candidateNumberLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    if (!self->_shouldShowCandidateNumber)
    {
      -[TUICandidateBaseCell style](self, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "layoutOrientation");

      if (v7 == 1)
      {
        -[TUICandidateCell candidateNumberLabel](self, "candidateNumberLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", 0);

        -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
}

- (void)setRowSelected:(BOOL)a3
{
  if (self->_rowSelected != a3)
  {
    self->_rowSelected = a3;
    -[TUICandidateCell updateColors](self, "updateColors");
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[TUICandidateBaseCell style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUICandidateCell;
    -[TUICandidateBaseCell setStyle:](&v7, sel_setStyle_, v4);
    -[TUICandidateCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)_canFocusProgrammatically
{
  return 1;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUICandidateCell;
  v4 = a3;
  -[TUICandidateCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "contentAlpha", v8.receiver, v8.super_class);
  v6 = v5;

  -[TUICandidateCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  -[TUICandidateCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_computeImageViewFrame
{
  UIImageView *imageView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView frame](imageView, "frame");
    -[TUICandidateCell image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");

    -[TUICandidateBaseCell style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TUICandidateBaseCell style](self, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maximumIconWidth");

    }
    -[TUICandidateCell bounds](self, "bounds");
    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extraCellPadding");
    UIRectCenteredYInRect();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[TUICandidateCell imageView](self, "imageView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICandidateCell;
  -[TUICandidateBaseCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TUICandidateCell updateStyle](self, "updateStyle");
  -[TUICandidateCell updateColors](self, "updateColors");
  -[TUICandidateCell _computeImageViewFrame](self, "_computeImageViewFrame");
  -[TUICandidateCell updateLabels](self, "updateLabels");
}

- (void)updateStyle
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  id v35;

  if (self->_candidateNumberLabel)
  {
    -[TUICandidateBaseCell style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateNumberFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_candidateNumberLabel, "setFont:", v6);

  }
  if (self->_annotationTextLabel)
  {
    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotationTextFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setFont:](self->_annotationTextLabel, "setFont:", v8);

  }
  if (self->_alternativeTextLabel)
  {
    -[TUICandidateBaseCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alternativeTextFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setFont:](self->_alternativeTextLabel, "setFont:", v10);

    -[TUICandidateBaseCell style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setLayoutOrientation:](self->_alternativeTextLabel, "setLayoutOrientation:", objc_msgSend(v11, "layoutOrientation"));

  }
  -[TUICandidateBaseCell style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "layoutOrientation");
  -[TUICandidateCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLayoutOrientation:", v13);

  -[TUICandidateBaseCell style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "lineBreakMode");
  -[TUICandidateCell textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLineBreakMode:", v16);

  -[TUICandidateCell candidate](self, "candidate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSupplementalItemCandidate");
  if (v19
    && (-[TUICandidateBaseCell style](self, "style"),
        v34 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v34, "supplementalLexiconCandidateFont"),
        (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = (void *)v20;
    -[TUICandidateBaseCell style](self, "style");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "supplementalLexiconCandidateFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = 1;
  }
  else
  {
    -[TUICandidateBaseCell style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "candidateFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v21 = 0;
    v23 = 1;
  }
  -[TUICandidateCell textLabel](self, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v22);

  if (v23)
  {

  }
  if (v24)
  {

  }
  if (v19)
  {

  }
  -[TUICandidateCell textLabel](self, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pointSize");
  v29 = 16.0 / v28;

  if (v29 > 0.9)
    v29 = 0.9;
  -[TUICandidateCell textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMinimumScaleFactor:", v29);

  -[TUICandidateBaseCell style](self, "style");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cellCornerRadius");
  v32 = v31;
  -[TUICandidateCell layer](self, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCornerRadius:", v32);

}

- (void)updateLabels
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat MinY;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  void *v61;
  BOOL v62;
  double v63;
  void *v64;
  uint64_t v65;
  CGFloat v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  char v79;
  void *v80;
  double v81;
  double v82;
  CGFloat v83;
  void *v84;
  uint64_t v85;
  double v86;
  CGFloat v87;
  _BOOL4 v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  int v96;
  void *v97;
  char v98;
  CGFloat v99;
  CGFloat v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  _BOOL4 v107;
  double v108;
  int64_t alignment;
  CGFloat v110;
  CGFloat v111;
  _BOOL4 v112;
  double v113;
  void *v114;
  void *v115;
  uint64_t v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  char v126;
  void *v127;
  double v128;
  void *v129;
  char v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  uint64_t v136;
  double v137;
  CGFloat v138;
  CGFloat v139;
  double v140;
  _BOOL4 v141;
  double v142;
  double v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  double v147;
  CGFloat v148;
  double v149;
  CGFloat v150;
  CGFloat v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double rect;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;

  -[TUICandidateCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[TUICandidateCell bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TUICandidateBaseCell style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extraCellPadding");
  x = v5 + v13;
  y = v7 + v15;
  width = v9 - (v13 + v17);
  v169.origin.x = x;
  v169.origin.y = y;
  height = v11 - (v15 + v19);
  v169.size.width = width;
  v169.size.height = height;

  -[TUICandidateBaseCell style](self, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "layoutOrientation");

  if (v22 == 1)
  {
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v169);
    x = v169.origin.x;
    y = v169.origin.y;
    width = v169.size.width;
    height = v169.size.height;
  }
  v170.origin.x = x;
  v170.origin.y = y;
  v170.size.width = width;
  v170.size.height = height;
  v23 = CGRectGetHeight(v170);
  v147 = CGRectGetWidth(v169);
  -[TUICandidateBaseCell style](self, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minimumCellPadding");
  v26 = v25;

  MinY = CGRectGetMinY(v169);
  v28 = (void *)objc_opt_class();
  -[TUICandidateLabel text](self->_textLabel, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateLabel font](self->_textLabel, "font");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateBaseCell style](self, "style");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthForText:font:layoutOrientation:", v29, v30, objc_msgSend(v31, "layoutOrientation"));
  v33 = v32;
  v168.origin.x = 0.0;
  v168.size.width = v32;

  -[TUICandidateCell minimumTextLabelHeight](self, "minimumTextLabelHeight");
  if (v23 >= v34)
    v35 = v23;
  else
    v35 = v34;
  v168.size.height = v35;
  v36 = CGRectGetMinY(v169);
  v171.origin.x = 0.0;
  v171.origin.y = MinY;
  v171.size.width = v33;
  v171.size.height = v35;
  v168.origin.y = v36 + ceil((v23 - CGRectGetHeight(v171)) * 0.5);
  v37 = CGRectGetMinY(v169);
  -[UILabel text](self->_candidateNumberLabel, "text");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_candidateNumberLabel, "font");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "tui_optimizedSizeWithFont:", v39);
  v164 = 0.0;
  v165 = v37;
  v166 = v40;
  rect = v23;

  v148 = CGRectGetMinY(v169);
  v41 = (void *)objc_opt_class();
  -[TUICandidateLabel text](self->_alternativeTextLabel, "text");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateLabel font](self->_alternativeTextLabel, "font");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateBaseCell style](self, "style");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "widthForText:font:layoutOrientation:", v42, v43, objc_msgSend(v44, "layoutOrientation"));
  v146 = v45;
  v160 = 0.0;
  v161 = v148;
  v162 = v45;
  v163 = v23;

  v46 = CGRectGetMinY(v169);
  -[TUICandidateLabel text](self->_annotationTextLabel, "text");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateLabel font](self->_annotationTextLabel, "font");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "tui_optimizedSizeWithFont:", v48);
  v50 = v49;
  -[TUICandidateLabel font](self->_annotationTextLabel, "font");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lineHeight");
  v156 = 0.0;
  v157 = v46;
  v158 = v50;
  v149 = v52;
  v159 = v52;

  -[TUICandidateCell imageView](self, "imageView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "frame");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v151 = v60;
  v152 = v60;
  v153 = v54;
  v154 = v56;
  v155 = v58;

  -[TUICandidateCell image](self, "image");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v168.size.width <= 0.00000011920929 || v61 == 0;
  v63 = 6.0;
  if (v62)
    v63 = 0.0;
  v142 = v63;

  -[UILabel text](self->_candidateNumberLabel, "text");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "length");

  v150 = v55;
  v66 = v23;
  if (v65)
  {
    -[TUICandidateBaseCell style](self, "style");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "layoutOrientation");

    -[TUICandidateBaseCell style](self, "style");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "candidateNumberFont");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("0"), "_legacy_sizeWithFont:", v70);
    if (v68)
    {
      v73 = v72;
      v166 = v72;

      v74 = v73;
    }
    else
    {
      v74 = v71;
      v166 = v71;

    }
  }
  else
  {
    v74 = v166;
  }
  v140 = v26;
  v172.origin.y = v150;
  v172.origin.x = v151;
  v144 = v57;
  v145 = v59;
  v172.size.width = v57;
  v172.size.height = v59;
  v62 = CGRectGetWidth(v172) == 0.0;
  v75 = -0.0;
  if (!v62)
    v75 = v142;
  v76 = v26 + v26 + v75;
  v173.origin.x = v164;
  v173.size.height = rect;
  v173.origin.y = v165;
  v173.size.width = v74;
  if (CGRectGetWidth(v173) != 0.0)
    v76 = v76 + 5.0;
  v174.origin.x = 0.0;
  v174.origin.y = v46;
  v174.size.width = v50;
  v174.size.height = v149;
  if (CGRectGetWidth(v174) == 0.0)
    v77 = v76;
  else
    v77 = v76 + 5.0;
  v175.origin.x = 0.0;
  v175.origin.y = v148;
  v175.size.width = v146;
  v175.size.height = v66;
  v143 = v74;
  if (CGRectGetWidth(v175) != 0.0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_opt_respondsToSelector();

    if ((v79 & 1) != 0)
    {
      -[TUICandidateBaseCell style](self, "style");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "alternativeTextLeftSpacing");
      v77 = v77 + v81;

    }
    else
    {
      v77 = v77 + 5.0;
    }
  }
  v82 = v26;
  v83 = v50;
  rect = v66;
  v163 = v66;
  -[TUICandidateBaseCell style](self, "style");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "layoutOrientation");

  if (v85 == 1)
    v86 = v169.origin.y + (v169.size.height - v149) * 0.5;
  else
    v86 = v169.origin.y + 4.0;
  v157 = v86;
  v176.origin.x = 0.0;
  v176.origin.y = v148;
  v87 = v146;
  v176.size.width = v146;
  v176.size.height = v66;
  v88 = CGRectGetWidth(v176) > 0.0;
  v177.origin.y = v150;
  v177.origin.x = v151;
  v177.size.width = v144;
  v177.size.height = v145;
  v89 = v77 + CGRectGetWidth(v177);
  v90 = v89 + CGRectGetWidth(v168);
  v178.origin.x = v164;
  v178.origin.y = v165;
  v178.size.width = v74;
  v178.size.height = v66;
  v91 = v90 + CGRectGetWidth(v178);
  v179.origin.x = 0.0;
  v179.origin.y = v148;
  v179.size.width = v146;
  v179.size.height = v66;
  v92 = v91 + CGRectGetWidth(v179);
  v180.origin.x = 0.0;
  v139 = v86;
  v180.origin.y = v86;
  v180.size.width = v83;
  v180.size.height = v149;
  v93 = v92 + CGRectGetWidth(v180);
  v94 = v83;
  if (v93 <= v147)
  {
    v96 = 0;
    v100 = v165;
    v99 = v74;
    v95 = v66;
  }
  else
  {
    v181.origin.x = 0.0;
    v181.origin.y = v148;
    v181.size.width = v146;
    v95 = v66;
    v181.size.height = v66;
    v96 = 1;
    if (CGRectGetWidth(v181) == 0.0 || v93 - v147 <= 1.0)
    {
      v100 = v165;
      v99 = v143;
    }
    else
    {
      -[TUICandidateBaseCell style](self, "style", v93 - v147);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_opt_respondsToSelector();

      v100 = v165;
      v99 = v143;
      if ((v98 & 1) != 0)
      {
        -[TUICandidateBaseCell style](self, "style");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "alternativeTextLeftSpacing");
        v103 = v102;
        v182.origin.x = 0.0;
        v182.origin.y = v148;
        v182.size.width = v146;
        v182.size.height = v66;
        v104 = v103 + CGRectGetWidth(v182);

      }
      else
      {
        v183.origin.x = 0.0;
        v183.origin.y = v148;
        v183.size.width = v146;
        v183.size.height = v66;
        v104 = CGRectGetWidth(v183) + 5.0;
      }
      v93 = v93 - v104;
      if (v93 <= v147)
        v96 = 0;
      v88 = 0;
      v82 = v140;
      v87 = v146;
    }
  }
  -[TUICandidateBaseCell style](self, "style", *(_QWORD *)&v168.origin.y);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v88;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "alternativeTextAlignment") == 2;

  }
  else
  {
    v107 = 0;
  }

  if ((v96 | v107) != 1)
  {
    alignment = self->_alignment;
    if (alignment == 2)
    {
      v82 = v82 + v147 - v93;
      v111 = v144;
      v110 = v145;
    }
    else
    {
      v111 = v144;
      v110 = v145;
      if (alignment == 1)
        v82 = v82 + (v147 - v93) * 0.5;
    }
    v189.origin.x = v164;
    v189.origin.y = v100;
    v189.size.width = v99;
    v189.size.height = v95;
    if (CGRectGetWidth(v189) != 0.0)
    {
      v164 = v82;
      v190.origin.x = v82;
      v190.origin.y = v100;
      v190.size.width = v99;
      v190.size.height = v95;
      v82 = v82 + CGRectGetWidth(v190) + 5.0;
    }
    v112 = v141;
    v191.origin.x = v151;
    v191.origin.y = v150;
    v191.size.width = v111;
    v191.size.height = v110;
    if (CGRectGetWidth(v191) != 0.0)
    {
      v152 = v82;
      v192.origin.x = v82;
      v192.origin.y = v150;
      v192.size.width = v111;
      v192.size.height = v110;
      v82 = v82 + v142 + CGRectGetWidth(v192);
    }
    v120 = (void *)objc_opt_class();
    -[TUICandidateLabel text](self->_textLabel, "text");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel font](self->_textLabel, "font");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "outsetsForText:font:", v121, v122);
    v168.origin.x = v82 + ceil(v123);

    v193.origin.x = v168.origin.x;
    v193.origin.y = v138;
    v193.size.width = v168.size.width;
    v193.size.height = v168.size.height;
    v124 = v82 + CGRectGetWidth(v193);
    v194.origin.x = 0.0;
    v194.origin.y = v139;
    v194.size.width = v94;
    v194.size.height = v149;
    if (CGRectGetWidth(v194) != 0.0)
    {
      v195.origin.x = v124 + 5.0;
      v156 = v124 + 5.0;
      v195.origin.y = v139;
      v195.size.width = v94;
      v195.size.height = v149;
      v124 = v124 + CGRectGetWidth(v195) + 5.0;
    }
    if (v141)
    {
      -[TUICandidateBaseCell style](self, "style");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_opt_respondsToSelector();

      if ((v126 & 1) != 0)
      {
        -[TUICandidateBaseCell style](self, "style");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "alternativeTextLeftSpacing");
        v160 = v124 + v128;

      }
      else
      {
        v160 = v124 + 5.0;
      }
    }
    goto LABEL_81;
  }
  v184.origin.x = v164;
  v184.origin.y = v100;
  v184.size.width = v99;
  v184.size.height = v95;
  if (CGRectGetWidth(v184) == 0.0)
  {
    v108 = v82;
  }
  else
  {
    v164 = v82;
    v185.origin.x = v82;
    v185.origin.y = v100;
    v185.size.width = v99;
    v185.size.height = v95;
    v108 = v82 + CGRectGetWidth(v185) + 5.0;
  }
  v186.origin.x = v151;
  v186.origin.y = v150;
  v186.size.width = v144;
  v186.size.height = v145;
  if (CGRectGetWidth(v186) != 0.0)
  {
    v152 = v108;
    v187.origin.x = v108;
    v187.origin.y = v150;
    v187.size.width = v144;
    v187.size.height = v145;
    v108 = v108 + v142 + CGRectGetWidth(v187);
  }
  v112 = v141;
  v113 = v147 - v82;
  if (!v141)
    goto LABEL_59;
  -[TUICandidateBaseCell style](self, "style");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v117 = v148;
    goto LABEL_71;
  }
  -[TUICandidateBaseCell style](self, "style");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "alternativeTextAlignment");

  v117 = v148;
  if (v116 != 2)
  {
LABEL_71:
    v196.origin.x = 0.0;
    v196.origin.y = v117;
    v196.size.width = v87;
    v196.size.height = v95;
    v160 = v113 - CGRectGetWidth(v196);
    -[TUICandidateBaseCell style](self, "style");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_opt_respondsToSelector();

    v197.origin.x = v160;
    v197.origin.y = v117;
    v197.size.width = v87;
    v197.size.height = v95;
    v131 = CGRectGetWidth(v197);
    if ((v130 & 1) != 0)
    {
      -[TUICandidateBaseCell style](self, "style");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "alternativeTextLeftSpacing");
      v113 = v113 - (v131 + v133);

    }
    else
    {
      v113 = v113 - (v131 + 5.0);
    }
    v119 = v149;
    v118 = v139;
    goto LABEL_76;
  }
  v188.origin.x = 0.0;
  v188.origin.y = v148;
  v188.size.width = v87;
  v188.size.height = v95;
  v160 = v113 - CGRectGetWidth(v188);
LABEL_59:
  v118 = v139;
  v119 = v149;
LABEL_76:
  v198.origin.x = 0.0;
  v198.origin.y = v118;
  v198.size.width = v94;
  v198.size.height = v119;
  if (CGRectGetWidth(v198) != 0.0)
  {
    v199.origin.x = 0.0;
    v199.origin.y = v118;
    v199.size.width = v94;
    v199.size.height = v119;
    v200.origin.x = v113 - CGRectGetWidth(v199);
    v156 = v200.origin.x;
    v200.origin.y = v118;
    v200.size.width = v94;
    v200.size.height = v119;
    v113 = v113 - (CGRectGetWidth(v200) + 5.0);
  }
  v134 = v113 - v108;
  if (v113 - v108 < 0.0)
    v134 = 0.0;
  v168.origin.x = v108;
  v168.size.width = v134;
LABEL_81:
  -[TUICandidateBaseCell style](self, "style");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v135, "layoutOrientation");

  if (v136 == 1)
  {
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v168);
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v164);
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v152);
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v160);
    -[TUICandidateCell rotateBy90DegreesForFrame:](self, "rotateBy90DegreesForFrame:", &v156);
  }
  if (-[TUICandidateCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[TUICandidateCell flipHorizontallyForFrame:](self, "flipHorizontallyForFrame:", &v168);
    -[TUICandidateCell flipHorizontallyForFrame:](self, "flipHorizontallyForFrame:", &v164);
    -[TUICandidateCell flipHorizontallyForFrame:](self, "flipHorizontallyForFrame:", &v152);
    -[TUICandidateCell flipHorizontallyForFrame:](self, "flipHorizontallyForFrame:", &v160);
    -[TUICandidateCell flipHorizontallyForFrame:](self, "flipHorizontallyForFrame:", &v156);
  }
  v137 = TUIScreenScaleForView(self);
  -[TUICandidateLabel setFrame:](self->_textLabel, "setFrame:", TUIRectIntegralWithScale(v168.origin.x, v168.origin.y, v168.size.width, v168.size.height, v137));
  -[UILabel setFrame:](self->_candidateNumberLabel, "setFrame:", TUIRectIntegralWithScale(v164, v165, v166, rect, v137));
  -[UIImageView setFrame:](self->_imageView, "setFrame:", TUIRectIntegralWithScale(v152, v153, v154, v155, v137));
  -[TUICandidateLabel setHidden:](self->_alternativeTextLabel, "setHidden:", !v112);
  -[TUICandidateLabel setFrame:](self->_alternativeTextLabel, "setFrame:", TUIRectIntegralWithScale(v160, v161, v162, v163, v137));
  -[TUICandidateLabel setFrame:](self->_annotationTextLabel, "setFrame:", TUIRectIntegralWithScale(v156, v157, v158, v159, v137));
}

- (void)rotateBy90DegreesForFrame:(CGRect *)a3
{
  CGSize v3;

  v3 = (CGSize)vextq_s8((int8x16_t)a3->size, (int8x16_t)a3->size, 8uLL);
  a3->origin = (CGPoint)vextq_s8((int8x16_t)a3->origin, (int8x16_t)a3->origin, 8uLL);
  a3->size = v3;
}

- (void)flipHorizontallyForFrame:(CGRect *)a3
{
  double v4;

  -[TUICandidateCell bounds](self, "bounds");
  a3->origin.x = v4 - CGRectGetMaxX(*a3);
}

- (void)updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TUICandidateCell;
  -[TUICandidateBaseCell updateColors](&v22, sel_updateColors);
  if ((-[TUICandidateCell isSelected](self, "isSelected") & 1) != 0
    || (-[TUICandidateCell isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highlightedTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setTextColor:](self->_textLabel, "setTextColor:", v4);

    -[TUICandidateBaseCell style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightedCandidateNumberColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_candidateNumberLabel, "setTextColor:", v6);

    -[TUICandidateBaseCell style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightedAlternativeTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setTextColor:](self->_alternativeTextLabel, "setTextColor:", v8);

    -[TUICandidateBaseCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highlightedTextColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUICandidateBaseCell style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setTextColor:](self->_textLabel, "setTextColor:", v12);

    -[TUICandidateBaseCell style](self, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "candidateNumberColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_candidateNumberLabel, "setTextColor:", v14);

    -[TUICandidateBaseCell style](self, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alternativeTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateLabel setTextColor:](self->_alternativeTextLabel, "setTextColor:", v16);

    -[TUICandidateBaseCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v10;
  -[TUICandidateLabel setTextColor:](self->_annotationTextLabel, "setTextColor:", v10);

  -[TUICandidateBaseCell style](self, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateBaseCell style](self, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "showCellBorderForSpaceConfirmationCandidate");

    if (!v20)
      return;
    -[TUICandidateCell layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderWidth:", 0.0);
    if ((-[TUICandidateCell isHighlighted](self, "isHighlighted") & 1) == 0)
    {
      if (-[TUICandidateCell isSelected](self, "isSelected"))
      {
        objc_msgSend(v18, "setBorderWidth:", 1.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v18, "setBorderColor:", objc_msgSend(v21, "CGColor"));

      }
    }
  }

}

- (id)cellBackgroundImage
{
  int v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v9;
  void *v10;
  objc_super v11;

  if ((-[TUICandidateCell isSelected](self, "isSelected") & 1) != 0)
    v3 = 1;
  else
    v3 = -[TUICandidateCell isHighlighted](self, "isHighlighted");
  -[TUICandidateCell candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && (-[TUICandidateCell candidate](self, "candidate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isTransliterationCandidate"),
        v6,
        ((v3 | v7 ^ 1) & 1) == 0))
  {
    -[TUICandidateBaseCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transliterationCandidateBackgroundImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUICandidateCell;
    -[TUICandidateBaseCell cellBackgroundImage](&v11, sel_cellBackgroundImage);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)cellBackgroundColor
{
  int v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v9;
  void *v10;
  objc_super v11;

  if ((-[TUICandidateCell isSelected](self, "isSelected") & 1) != 0)
    v3 = 1;
  else
    v3 = -[TUICandidateCell isHighlighted](self, "isHighlighted");
  -[TUICandidateCell candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && (-[TUICandidateCell candidate](self, "candidate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isTransliterationCandidate"),
        v6,
        ((v3 | v7 ^ 1) & 1) == 0))
  {
    -[TUICandidateBaseCell style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transliterationCandidateBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUICandidateCell;
    -[TUICandidateBaseCell cellBackgroundColor](&v11, sel_cellBackgroundColor);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (unint64_t)candidateNumber
{
  return self->_candidateNumber;
}

- (BOOL)shouldShowCandidateNumber
{
  return self->_shouldShowCandidateNumber;
}

- (BOOL)rowSelected
{
  return self->_rowSelected;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)minimumTextLabelHeight
{
  return self->_minimumTextLabelHeight;
}

- (void)setMinimumTextLabelHeight:(double)a3
{
  self->_minimumTextLabelHeight = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void)setAlternativeTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTextLabel, a3);
}

- (void)setCandidateNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_candidateNumberLabel, a3);
}

- (void)setAnnotationTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_annotationTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTextLabel, 0);
  objc_storeStrong((id *)&self->_candidateNumberLabel, 0);
  objc_storeStrong((id *)&self->_alternativeTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUICandidateCell");
}

+ (double)widthForCandidate:(id)a3 showCandidateNumber:(BOOL)a4 style:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  char v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  char v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isSupplementalItemCandidate")
    && (objc_msgSend(v8, "supplementalLexiconCandidateFont"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    objc_msgSend(v8, "supplementalLexiconCandidateFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "candidateFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)objc_opt_class();
  objc_msgSend(v7, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthForText:font:layoutOrientation:", v13, v11, objc_msgSend(v8, "layoutOrientation"));
  v15 = v14;

  v16 = (void *)objc_opt_class();
  objc_msgSend(v7, "alternativeText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alternativeTextFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthForText:font:layoutOrientation:", v17, v18, objc_msgSend(v8, "layoutOrientation"));
  v20 = v19;

  objc_msgSend(v7, "annotationText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    objc_msgSend(v7, "annotationText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "annotationTextFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tui_optimizedSizeWithFont:", v25);
    v27 = v26;

  }
  else
  {
    v27 = *MEMORY[0x1E0C9D820];
  }
  if (v20 > 0.0)
  {
    v28 = objc_opt_respondsToSelector();
    v29 = 5.0;
    if ((v28 & 1) != 0)
      objc_msgSend(v8, "alternativeTextLeftSpacing", 5.0);
    v15 = v15 + v20 + v29;
  }
  objc_msgSend(v8, "minimumCellPadding");
  v31 = v15 + v30 * 2.0;
  v32 = v27 + 5.0;
  if (v27 <= 0.0)
    v32 = -0.0;
  v33 = v32 + v31;
  if (v6)
  {
    v34 = objc_msgSend(v8, "layoutOrientation");
    objc_msgSend(v8, "candidateNumberFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("0"), "_legacy_sizeWithFont:", v35);
    v37 = v36;
    v39 = v38;

    if (v34)
      v33 = v33 + v39 + 5.0;
    else
      v33 = v33 + v37 + 5.0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "icon");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v7, "icon");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "size");
      v43 = v42;

      v44 = objc_opt_respondsToSelector();
      v45 = 20.0;
      if ((v44 & 1) != 0)
        objc_msgSend(v8, "maximumIconWidth", 20.0);
      if (v43 < v45)
        v45 = v43;
      v33 = v33 + v45 + 6.0;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "customView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v7, "customView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "intrinsicContentSize");
      v33 = v48;

    }
  }
  objc_msgSend(v8, "minimumCellWidth");
  if (v33 < v49)
    v33 = v49;

  return v33;
}

+ (double)widthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a5)
    +[TUICandidateLabel lineWidthForText:font:layoutOrientation:](TUICandidateLabel, "lineWidthForText:font:layoutOrientation:", a3, a4, a5);
  else
    objc_msgSend(a3, "tui_optimizedSizeWithFont:", a4);
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "outsetsForText:font:", a3, a4);
  v10 = v9;
  v12 = v11;

  return v8 + ceil(v10 + v12);
}

+ (UIEdgeInsets)outsetsForText:(id)a3 font:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  objc_msgSend(a3, "tui_languageAwareOutsetsForFont:", a4);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

@end
