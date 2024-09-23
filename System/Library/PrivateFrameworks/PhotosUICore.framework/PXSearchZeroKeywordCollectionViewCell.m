@implementation PXSearchZeroKeywordCollectionViewCell

- (PXSearchZeroKeywordCollectionViewCell)initWithFrame:(CGRect)a3
{
  PXSearchZeroKeywordCollectionViewCell *v3;
  PXSearchZeroKeywordCollectionViewCell *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *textLabel;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *imageView;
  void *v13;
  PXRoundedCornerOverlayView *v14;
  PXRoundedCornerOverlayView *imageCornerOverlayView;
  PXRoundedCornerOverlayView *v16;
  id v17;
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
  _QWORD v55[4];
  id v56;
  objc_super v57;
  _QWORD v58[13];

  v58[11] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)PXSearchZeroKeywordCollectionViewCell;
  v3 = -[PXSearchZeroKeywordCollectionViewCell initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSearchZeroKeywordCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v7;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_textLabel, "setFont:", v9);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_textLabel, "setTextAlignment:", 1);
    objc_msgSend(v5, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_textLabel, "setBackgroundColor:", v10);

    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 2);
    objc_msgSend(v5, "addSubview:", v4->_textLabel);
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_imageView, "setBackgroundColor:", v13);

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v4->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v14 = objc_alloc_init(PXRoundedCornerOverlayView);
    imageCornerOverlayView = v4->_imageCornerOverlayView;
    v4->_imageCornerOverlayView = v14;

    -[PXRoundedCornerOverlayView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageCornerOverlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = v4->_imageCornerOverlayView;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __55__PXSearchZeroKeywordCollectionViewCell_initWithFrame___block_invoke;
    v55[3] = &unk_1E51406D0;
    v56 = v5;
    v17 = v5;
    -[PXRoundedCornerOverlayView performChanges:](v16, "performChanges:", v55);
    objc_msgSend(v17, "addSubview:", v4->_imageCornerOverlayView);
    -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v52;
    -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v49;
    -[UIImageView topAnchor](v4->_imageView, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v46;
    -[UIImageView heightAnchor](v4->_imageView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v4->_imageView, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", v44, 1.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v43;
    -[PXRoundedCornerOverlayView leadingAnchor](v4->_imageCornerOverlayView, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v40;
    -[PXRoundedCornerOverlayView trailingAnchor](v4->_imageCornerOverlayView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v36;
    -[PXRoundedCornerOverlayView topAnchor](v4->_imageCornerOverlayView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v4->_imageView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v33;
    -[PXRoundedCornerOverlayView bottomAnchor](v4->_imageCornerOverlayView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v29;
    -[UILabel topAnchor](v4->_textLabel, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 6.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v20;
    -[UILabel leadingAnchor](v4->_textLabel, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v17;
    v37 = v17;
    objc_msgSend(v17, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v24;
    -[UILabel trailingAnchor](v4->_textLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[10] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSearchZeroKeywordCollectionViewCell;
  -[PXSearchZeroKeywordCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXSearchZeroKeywordCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXSearchZeroKeywordCollectionViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

- (id)focusEffect
{
  void *v3;
  void *v4;

  -[PXRoundedCornerOverlayView focusInfo](self->_imageCornerOverlayView, "focusInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeHaloEffectForSourceView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (PXRoundedCornerOverlayView)imageCornerOverlayView
{
  return self->_imageCornerOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __55__PXSearchZeroKeywordCollectionViewCell_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverlayColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v3, "setDisplayScale:");

}

+ (id)reuseIdentifier
{
  return CFSTR("PXSearchZeroKeywordCollectionViewCell");
}

+ (CGSize)cellSizeWithoutTextLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  +[PXSearchZeroKeywordCollectionViewCell thumbnailSize](PXSearchZeroKeywordCollectionViewCell, "thumbnailSize");
  v4 = v3;
  objc_msgSend(a1, "verticalSpacing");
  v6 = v4 + v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (CGSize)cellSizeWithTextLabelNumberOfLines:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  +[PXSearchZeroKeywordCollectionViewCell thumbnailSize](PXSearchZeroKeywordCollectionViewCell, "thumbnailSize");
  v6 = v5;
  objc_msgSend(a1, "verticalSpacing");
  v8 = v6 + v7;
  +[PXSearchZeroKeywordCollectionViewCell _calculateHeightNeededForTextLabelWithNumberOfLines:](PXSearchZeroKeywordCollectionViewCell, "_calculateHeightNeededForTextLabelWithNumberOfLines:", a3);
  v10 = v8 + v9;
  v11 = v6;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (CGSize)cellSizeForAccessibilityTextWithoutTextLabelUsingCollectionInset:(UIEdgeInsets)a3 collectionCellSpacing:(double)a4 screenWidth:(double)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[PXSearchZeroKeywordCollectionViewCell thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:", a3.top, a3.left, a3.bottom, a3.right, a4, a5);
  v7 = v6;
  objc_msgSend(a1, "verticalSpacing");
  v9 = v7 + v8;
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

+ (CGSize)cellSizeForAccessibilityTextWithTextLabelNumberOfLines:(unint64_t)a3 collectionInset:(UIEdgeInsets)a4 collectionCellSpacing:(double)a5 screenWidth:(double)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[PXSearchZeroKeywordCollectionViewCell cellSizeForAccessibilityTextWithoutTextLabelUsingCollectionInset:collectionCellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "cellSizeForAccessibilityTextWithoutTextLabelUsingCollectionInset:collectionCellSpacing:screenWidth:", a4.top, a4.left, a4.bottom, a4.right, a5, a6);
  v8 = v7;
  v10 = v9;
  +[PXSearchZeroKeywordCollectionViewCell _calculateHeightNeededForTextLabelWithNumberOfLines:](PXSearchZeroKeywordCollectionViewCell, "_calculateHeightNeededForTextLabelWithNumberOfLines:", a3);
  v12 = v10 + v11;
  v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

+ (CGSize)thumbnailSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "thumbnailWidthInterpolator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "valueForMetric:", v4);
  v6 = v5;

  v7 = v6;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)thumbnailSizeForAccessibilityTextUsingCollectionInset:(UIEdgeInsets)a3 cellSpacing:(double)a4 screenWidth:(double)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  +[PXSearchZeroKeywordCollectionViewCell _thumbnailSizeWithMetric:](PXSearchZeroKeywordCollectionViewCell, "_thumbnailSizeWithMetric:", a5);
  v14 = v13 - v12;
  objc_msgSend(a1, "expectedNumberOfCellsVisibleWithAccessibilityText:withInset:cellSpacing:screenWidth:", 1, top, left, bottom, right, a4, a5);
  v16 = (a5 - left) / v15 - a4;
  v17 = v14 + v16;
  v18 = round(v16);
  v19 = round(v17);
  result.height = v19;
  result.width = v18;
  return result;
}

+ (CGSize)_thumbnailSizeWithMetric:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "thumbnailWidthInterpolator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForMetric:", a3);
  v6 = v5;

  v7 = v6;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)expectedNumberOfCellsVisibleWithAccessibilityText:(BOOL)a3 withInset:(UIEdgeInsets)a4 cellSpacing:(double)a5 screenWidth:(double)a6
{
  double left;
  _BOOL4 v9;
  double v10;
  double result;

  left = a4.left;
  v9 = a3;
  +[PXSearchZeroKeywordCollectionViewCell _thumbnailSizeWithMetric:](PXSearchZeroKeywordCollectionViewCell, "_thumbnailSizeWithMetric:", a6, a4.left, a4.bottom, a4.right);
  result = (a6 - left) / (v10 + a5);
  if (v9)
    return result + -1.0;
  return result;
}

+ (double)_calculateHeightNeededForTextLabelWithNumberOfLines:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ascender");
  v6 = v5;
  objc_msgSend(v4, "descender");
  v8 = v6 - v7;
  objc_msgSend(v4, "leading");
  v10 = (v8 + v9) * (double)a3;

  return v10;
}

+ (id)attributedStringForCellLabelWithString:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = &stru_1E5149688;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setHyphenationFactor:", v8);
  objc_msgSend(v7, "setLineBreakMode:", 4);
  objc_msgSend(v7, "setAlignment:", 1);
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10 = *MEMORY[0x1E0DC1178];
  v17[0] = v7;
  v11 = *MEMORY[0x1E0DC1138];
  v16[0] = v10;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v13);

  return v14;
}

+ (BOOL)cellLabelTextNeedsMultipleLines:(id)a3 cellWidth:(double)a4
{
  void *v5;
  double v6;
  BOOL v7;

  +[PXSearchZeroKeywordCollectionViewCell attributedStringForCellLabelWithString:](PXSearchZeroKeywordCollectionViewCell, "attributedStringForCellLabelWithString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6 > a4;

  return v7;
}

+ (double)verticalSpacing
{
  return 6.0;
}

+ (PXLayoutMetricInterpolator)thumbnailWidthInterpolator
{
  PXLayoutMetricInterpolator *v2;

  v2 = objc_alloc_init(PXLayoutMetricInterpolator);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 90.0, 320.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 105.0, 375.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 105.0, 375.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 118.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 118.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 768.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 834.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 1024.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 90.0, 568.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 105.0, 667.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 105.0, 812.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 118.0, 736.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 118.0, 896.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 1024.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 1112.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v2, "setReferenceValue:forMetric:", 130.0, 1366.0);
  return v2;
}

@end
