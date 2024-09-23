@implementation PXCMMTranscriptTextView

- (PXCMMTranscriptTextView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptTextView.m"), 31, CFSTR("%s is not available as initializer"), "-[PXCMMTranscriptTextView initWithCoder:]");

  abort();
}

- (PXCMMTranscriptTextView)initWithFrame:(CGRect)a3
{
  PXCMMTranscriptTextView *v3;
  uint64_t v4;
  PXUpdater *updater;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMTranscriptTextView;
  v3 = -[PXCMMTranscriptTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel_setNeedsLayout);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updatePrimaryLabel, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateSecondaryLabel, 0);
  }
  return v3;
}

- (void)setPrimaryText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *primaryText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_primaryText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      primaryText = self->_primaryText;
      self->_primaryText = v6;

      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePrimaryLabel);
    }
  }

}

- (void)setSecondaryText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *secondaryText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_secondaryText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      secondaryText = self->_secondaryText;
      self->_secondaryText = v6;

      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateSecondaryLabel);
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMTranscriptTextView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 0, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMTranscriptTextView;
  -[PXCMMTranscriptTextView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXCMMTranscriptTextView bounds](self, "bounds");
  -[PXCMMTranscriptTextView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 1, 1, v3, v4);
}

- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double height;
  double width;
  UILabel *primaryLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double MaxY;
  CGSize result;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  width = a3.width;
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptTextView.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_primaryLabel"));

    primaryLabel = self->_primaryLabel;
  }
  -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", width, height);
  v13 = v12;
  v15 = v14;
  if (v6)
  {
    PXSizeClampToSize();
    v13 = v16;
    v15 = v17;
  }
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", width, height - v15 + -5.0);
  v19 = v18;
  v21 = v20;
  if (v6)
  {
    PXSizeClampToSize();
    v19 = v22;
    v21 = v23;
  }
  if (self->_secondaryLabel)
  {
    v24 = 0.0;
    v25 = v15 + 0.0 + 5.0;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v13;
  v36.size.height = v15;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = v24;
  v37.origin.y = v25;
  v37.size.width = v19;
  v37.size.height = v21;
  v27 = fmax(MaxX, CGRectGetMaxX(v37));
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v13;
  v38.size.height = v15;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = v24;
  v39.origin.y = v25;
  v39.size.width = v19;
  v39.size.height = v21;
  v28 = CGRectGetMaxY(v39);
  v29 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCMMTranscriptTextView semanticContentAttribute](self, "semanticContentAttribute"));
  if (v5)
  {
    v30 = v27 - v13;
    if (v29 == 1)
      v24 = v27 - v19;
    else
      v30 = 0.0;
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v30, 0.0, v13, v15);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v24, v25, v19, v21);
  }
  v31 = fmax(MaxY, v28);
  v32 = v27;
  result.height = v31;
  result.width = v32;
  return result;
}

- (void)_updatePrimaryLabel
{
  id v3;
  UILabel *v4;
  UILabel *primaryLabel;
  void *v6;
  id v7;

  if (!self->_primaryLabel)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v4;

    PXFontWithTextStyleSymbolicTraits();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_primaryLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 2);
    -[PXCMMTranscriptTextView addSubview:](self, "addSubview:", self->_primaryLabel);
  }
  -[PXCMMTranscriptTextView primaryText](self, "primaryText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_primaryLabel, "setText:", v7);

}

- (void)_updateSecondaryLabel
{
  void *v3;
  uint64_t v4;
  UILabel *secondaryLabel;
  id v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  uint64_t v12;

  -[PXCMMTranscriptTextView secondaryText](self, "secondaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  secondaryLabel = self->_secondaryLabel;
  if (v4)
  {
    if (!secondaryLabel)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3990]);
      v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_secondaryLabel;
      self->_secondaryLabel = v7;

      PXFontWithTextStyleSymbolicTraits();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_secondaryLabel, "setFont:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v10);

      -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 2);
      -[PXCMMTranscriptTextView addSubview:](self, "addSubview:", self->_secondaryLabel);
    }
    -[PXCMMTranscriptTextView secondaryText](self, "secondaryText");
    v12 = objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_secondaryLabel, "setText:", v12);
    v11 = (UILabel *)v12;
  }
  else
  {
    -[UILabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
    v11 = self->_secondaryLabel;
    self->_secondaryLabel = 0;
  }

}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

@end
