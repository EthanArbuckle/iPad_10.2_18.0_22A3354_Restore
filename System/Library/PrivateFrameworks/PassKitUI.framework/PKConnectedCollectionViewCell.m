@implementation PKConnectedCollectionViewCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKConnectedCollectionViewCell;
  -[PKConnectedCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKConnectedCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKConnectedCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKConnectedCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRectEdge v12;
  PKConnectedCircleView *circleView;
  double v14;
  double v15;
  CGSize v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double minimumHeight;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect slice;
  CGRect remainder;
  CGRect v34;
  CGSize result;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.x + 16.0;
  v9 = a3.origin.y + 16.0;
  v10 = a3.size.width + -32.0;
  v11 = a3.size.height + -32.0;
  if (-[PKConnectedCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.width = width + -32.0;
  remainder.size.height = v11;
  circleView = self->_circleView;
  if (circleView)
  {
    -[PKConnectedCircleView sizeThatFits:](circleView, "sizeThatFits:", width + -32.0, v11);
    v15 = v14;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
  }
  memset(&v34, 0, sizeof(v34));
  v16 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v16;
  if (v15 > 0.0)
  {
    v36.origin.x = v8;
    v36.origin.y = v9;
    v36.size.width = width + -32.0;
    v36.size.height = v11;
    CGRectDivide(v36, &slice, &remainder, v15, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v17;
    slice.size.width = v18;
    slice.size.height = height;
    slice.origin.y = 0.0;
    CGRectDivide(remainder, &v34, &remainder, 16.0, v12);
    v10 = remainder.size.width;
    v11 = remainder.size.height;
  }
  -[PKTitleDetailValueTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, v11);
  v20 = v19;
  memset(&v31, 0, sizeof(v31));
  CGRectDivide(remainder, &v31, &remainder, v21, v12);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v31.origin.x = v22;
  v31.origin.y = v23;
  v31.size.width = v24;
  v31.size.height = v25;
  if (!a4)
  {
    -[PKConnectedCircleView setFrame:](self->_circleView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKTitleDetailValueTextView setFrame:](self->_textView, "setFrame:", *(_OWORD *)&v31.origin, *(_OWORD *)&v31.size);
  }
  minimumHeight = self->_minimumHeight;
  v27 = fmax(v20 + 0.0 + 32.0, minimumHeight);
  if (minimumHeight <= 0.0)
    v28 = v20 + 0.0 + 32.0;
  else
    v28 = v27;
  -[PKConnectedCircleView setNeedsDisplay](self->_circleView, "setNeedsDisplay", *(_OWORD *)&v31.origin, *(_OWORD *)&v31.size);
  v29 = width;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setPrimaryText:](self->_textView, "setPrimaryText:", v4);

}

- (void)setAmountText:(id)a3
{
  -[PKTitleDetailValueTextView setAmountText:](self->_textView, "setAmountText:", a3);
}

- (void)setSecondaryText:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setSecondaryText:](self->_textView, "setSecondaryText:", v4);

}

- (void)setTertiaryText:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setTertiaryText:](self->_textView, "setTertiaryText:", v4);

}

- (void)setShowChevron:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setAccessory:](self->_textView, "setAccessory:", v3);
}

- (void)setCenterPrimaryText:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setCenterPrimaryText:](self->_textView, "setCenterPrimaryText:", v3);
}

- (void)setPrimaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setPrimaryTextColor:](self->_textView, "setPrimaryTextColor:", v4);

}

- (void)setAmountTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setAmountTextColor:](self->_textView, "setAmountTextColor:", v4);

}

- (void)setSecondaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setSecondaryTextColor:](self->_textView, "setSecondaryTextColor:", v4);

}

- (void)setTertiaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setTertiaryTextColor:](self->_textView, "setTertiaryTextColor:", v4);

}

- (void)setPrimaryFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setPrimaryFont:](self->_textView, "setPrimaryFont:", v4);

}

- (void)setSecondaryFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setSecondaryFont:](self->_textView, "setSecondaryFont:", v4);

}

- (void)setAmountFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  -[PKTitleDetailValueTextView setAmountFont:](self->_textView, "setAmountFont:", v4);

}

- (void)setTopConnector:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topConnector, a3);
    -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  }

}

- (void)setBottomConnector:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bottomConnector, a3);
    -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  }

}

- (void)setTargetType:(unint64_t)a3
{
  if (self->_targetType != a3)
  {
    self->_targetType = a3;
    -[PKConnectedCollectionViewCell _configureView](self, "_configureView");
  }
}

+ (double)textInsetWithOuterRadius:(double)a3
{
  return a3 * 2.0 + 32.0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  UIColor *v8;
  UIColor *backgroundColor;
  UIColor *v10;
  void *v11;
  UIColor *v12;
  _QWORD v13[5];
  UIColor *v14;
  objc_super v15;

  v3 = a3;
  if ((-[PKConnectedCollectionViewCell isHighlighted](self, "isHighlighted") & 1) == 0 && !self->_backgroundColor)
  {
    -[PKConnectedCollectionViewCell backgroundConfiguration](self, "backgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKConnectedCollectionViewCell backgroundColor](self, "backgroundColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;

  }
  v15.receiver = self;
  v15.super_class = (Class)PKConnectedCollectionViewCell;
  -[PKConnectedCollectionViewCell setHighlighted:](&v15, sel_setHighlighted_, v3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_backgroundColor;
  }
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__PKConnectedCollectionViewCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E3E61388;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v13, 0);

}

uint64_t __48__PKConnectedCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)prepareForReuse
{
  PKGradientVerticalConnector *topConnector;
  PKGradientVerticalConnector *bottomConnector;
  PKTitleDetailValueTextView *textView;
  PKConnectedCircleView *circleView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKConnectedCollectionViewCell;
  -[PKConnectedCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
  -[PKTitleDetailValueTextView removeFromSuperview](self->_textView, "removeFromSuperview");
  -[PKConnectedCircleView removeFromSuperview](self->_circleView, "removeFromSuperview");
  topConnector = self->_topConnector;
  self->_topConnector = 0;

  bottomConnector = self->_bottomConnector;
  self->_bottomConnector = 0;

  textView = self->_textView;
  self->_textView = 0;

  circleView = self->_circleView;
  self->_circleView = 0;

  self->_minimumHeight = 0.0;
  self->_targetType = 0;
}

- (void)_configureView
{
  PKTitleDetailValueTextView *v3;
  PKTitleDetailValueTextView *textView;
  void *v5;
  PKConnectedCircleView *circleView;
  void *v7;
  PKConnectedCircleView *v8;
  PKConnectedCircleView *v9;
  PKConnectedCircleView *v10;
  uint64_t v11;
  void *v12;

  if (!self->_textView)
  {
    v3 = objc_alloc_init(PKTitleDetailValueTextView);
    textView = self->_textView;
    self->_textView = v3;

    -[PKConnectedCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_textView);

  }
  circleView = self->_circleView;
  if (self->_targetType == 1)
  {
    -[PKConnectedCircleView removeFromSuperview](circleView, "removeFromSuperview");
    v7 = self->_circleView;
    self->_circleView = 0;
  }
  else
  {
    if (circleView)
      goto LABEL_8;
    v8 = objc_alloc_init(PKConnectedCircleView);
    v9 = self->_circleView;
    self->_circleView = v8;

    -[PKConnectedCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_circleView);
  }

  circleView = self->_circleView;
LABEL_8:
  -[PKConnectedCircleView setTopConnector:](circleView, "setTopConnector:", self->_topConnector);
  -[PKConnectedCircleView setBottomConnector:](self->_circleView, "setBottomConnector:", self->_bottomConnector);
  switch(self->_targetType)
  {
    case 0uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedClearCircleView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 2uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleEmptyView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleTargetView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 4uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleTargetDisabledView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 5uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleCheckmarkView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 6uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleCheckmarkDisabledView();
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 7uLL:
      v10 = self->_circleView;
      PKPayLaterPaymentScheduleConnectedCircleFlagView();
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v12 = (void *)v11;
      -[PKConnectedCircleView setTargetView:](v10, "setTargetView:", v11);

      break;
    default:
      break;
  }
  -[PKConnectedCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[PKConnectedCircleView setNeedsDisplay](self->_circleView, "setNeedsDisplay");
  -[PKConnectedCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F10]);
}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConnector, 0);
  objc_storeStrong((id *)&self->_topConnector, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
