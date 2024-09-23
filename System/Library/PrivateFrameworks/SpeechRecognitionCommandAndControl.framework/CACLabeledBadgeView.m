@implementation CACLabeledBadgeView

+ (double)badgeFontSize
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_badgeFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

+ (double)_heightForBadgeWithTextWithOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  UIRoundToScale();
  v6 = v5;

  return v6;
}

+ (id)_badgeFontTextStyle
{
  return (id)*MEMORY[0x24BEBE220];
}

+ (id)_badgeFont
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  v6 = (void *)MEMORY[0x24BEBD5F0];
  objc_msgSend(a1, "_badgeFontTextStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsForTextStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBE260]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsAccessibilityCategory)
  {
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE090]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledFontForFont:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "scaledFontForFont:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6
{
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a1, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:", a3, a4, a5, a6, 0);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6 contrasted:(BOOL)a7
{
  _BOOL4 v7;
  CACLabeledBadgeView *v12;
  unint64_t v13;
  __CFString *v14;
  CACLabeledBadgeView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v7 = a7;
  v12 = [CACLabeledBadgeView alloc];
  v13 = a3 - 1;
  if (v13 > 3)
  {
    v14 = CFSTR("88");
  }
  else
  {
    objc_msgSend(&unk_24F2CF5F0, "objectAtIndexedSubscript:", v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v12, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v14, a4, a5, a6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v13 <= 3)

  -[CACLabeledBadgeView systemLayoutSizeFittingSize:](v15, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  if (v7)
    v18 = v17 * 1.08;
  else
    v18 = v17;
  if (v7)
    v19 = v16 * 1.08;
  else
    v19 = v16;

  v20 = v19;
  v21 = v18;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (id)_badgeImageWithNoArrow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_badgeImageWithNoArrow_sBadgeFont
    || (objc_msgSend((id)_badgeImageWithNoArrow_sBadgeFont, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithNoArrow_sBadgeFont, v3);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("badge-platter-tail-none"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_badgeImageWithNoArrow_sBadgeImage;
    _badgeImageWithNoArrow_sBadgeImage = v7;

    objc_msgSend((id)_badgeImageWithNoArrow_sBadgeImage, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_badgeImageWithNoArrow_sBadgeImage;
    _badgeImageWithNoArrow_sBadgeImage = v9;

  }
  v11 = (id)_badgeImageWithNoArrow_sBadgeImage;

  return v11;
}

+ (id)_badgeImageWithNoArrowAndBorder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_badgeImageWithNoArrowAndBorder_sBadgeFont
    || (objc_msgSend((id)_badgeImageWithNoArrowAndBorder_sBadgeFont, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithNoArrowAndBorder_sBadgeFont, v3);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("badge-platter-bordered"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resizableImageWithCapInsets:", 6.5, 6.5, 6.5, 6.5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_badgeImageWithNoArrowAndBorder_sBadgeImage;
    _badgeImageWithNoArrowAndBorder_sBadgeImage = v7;

    objc_msgSend((id)_badgeImageWithNoArrowAndBorder_sBadgeImage, "resizableImageWithCapInsets:", 6.5, 6.5, 6.5, 6.5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_badgeImageWithNoArrowAndBorder_sBadgeImage;
    _badgeImageWithNoArrowAndBorder_sBadgeImage = v9;

  }
  v11 = (id)_badgeImageWithNoArrowAndBorder_sBadgeImage;

  return v11;
}

+ (id)_badgeImageWithRightArrow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_badgeImageWithRightArrow_sBadgeFont
    || (objc_msgSend((id)_badgeImageWithRightArrow_sBadgeFont, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithRightArrow_sBadgeFont, v3);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("badge-platter-single-tail-right"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stretchableImageWithCapInsets:", 0.0, 4.0, 0.0, 12.4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_badgeImageWithRightArrow_sBadgeImage;
    _badgeImageWithRightArrow_sBadgeImage = v7;

  }
  v9 = (id)_badgeImageWithRightArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithDownArrow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_badgeImageWithDownArrow_sBadgeFont
    || (objc_msgSend((id)_badgeImageWithDownArrow_sBadgeFont, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithDownArrow_sBadgeFont, v3);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("badge-platter-single-tail-down"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stretchableImageWithCapInsets:", 4.0, 4.0, 12.4, 4.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_badgeImageWithDownArrow_sBadgeImage;
    _badgeImageWithDownArrow_sBadgeImage = v7;

  }
  v9 = (id)_badgeImageWithDownArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithDoubleRightArrow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_badgeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_badgeImageWithDoubleRightArrow_sBadgeFont
    || (objc_msgSend((id)_badgeImageWithDoubleRightArrow_sBadgeFont, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithDoubleRightArrow_sBadgeFont, v3);
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(a1, "imageBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("badge-platter-double-tail-right"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stretchableImageWithCapInsets:", 0.0, 4.0, 0.0, 14.4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_badgeImageWithDoubleRightArrow_sBadgeImage;
    _badgeImageWithDoubleRightArrow_sBadgeImage = v7;

  }
  v9 = (id)_badgeImageWithDoubleRightArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithTinyRightArrow
{
  if (_badgeImageWithTinyRightArrow_onceToken != -1)
    dispatch_once(&_badgeImageWithTinyRightArrow_onceToken, &__block_literal_global_38);
  return (id)_badgeImageWithTinyRightArrow_sBadgeImage;
}

void __52__CACLabeledBadgeView__badgeImageWithTinyRightArrow__block_invoke()
{
  void *v0;
  double v1;
  CGFloat v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  CGSize v8;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;
  v8.width = 10.0;
  v8.height = 6.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, v2);

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveToPoint:", 0.25, 2.25);
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 2.25, 2.25, 2.0, 3.14159265, 4.71238898);
  objc_msgSend(v7, "addLineToPoint:", 4.0, 0.25);
  objc_msgSend(v7, "addLineToPoint:", 9.75, 3.0);
  objc_msgSend(v7, "addLineToPoint:", 4.0, 5.75);
  objc_msgSend(v7, "addLineToPoint:", 2.25, 5.75);
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 2.25, 3.75, 2.0, 1.57079633, 3.14159265);
  objc_msgSend(v7, "closePath");
  objc_msgSend(v7, "setLineWidth:", 0.5);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");

  objc_msgSend(v7, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  objc_msgSend(v7, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_badgeImageWithTinyRightArrow_sBadgeImage;
  _badgeImageWithTinyRightArrow_sBadgeImage = v5;

  UIGraphicsEndImageContext();
}

+ (id)_maskImageForArrowOrientation:(int64_t)a3 badgePresentation:(int64_t)a4 badgeIndicator:(int64_t)a5
{
  void *v5;
  char v7;
  void *v8;

  if (a4)
  {
    if (a4 == 2)
    {
      objc_msgSend((id)objc_opt_class(), "_badgeImageWithTinyRightArrow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (a4 == 1)
    {
      objc_msgSend((id)objc_opt_class(), "_badgeImageWithNoArrowAndBorder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
LABEL_9:
    v5 = 0;
    return v5;
  }
  if (a3 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "_badgeImageWithDownArrow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      objc_msgSend((id)objc_opt_class(), "_badgeImageWithNoArrow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_9;
  }
  v7 = a5;
  v8 = (void *)objc_opt_class();
  if ((v7 & 2) != 0)
    objc_msgSend(v8, "_badgeImageWithDoubleRightArrow");
  else
    objc_msgSend(v8, "_badgeImageWithRightArrow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)imageBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CACLabeledBadgeView_imageBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (imageBundle_onceToken_0 != -1)
    dispatch_once(&imageBundle_onceToken_0, block);
  return (id)imageBundle_sImageBundle_0;
}

void __34__CACLabeledBadgeView_imageBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageBundle_sImageBundle_0;
  imageBundle_sImageBundle_0 = v0;

}

- (id)_initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7 isContrasted:(BOOL)a8
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  CACLabeledBadgeView *v19;
  CACLabeledBadgeView *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CACLabeledBadgeView;
  v19 = -[CACLabeledBadgeView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_label, a4);
    v20->_arrowOrientation = a5;
    v20->_badgePresentation = a6;
    v20->_badgeIndicatorMask = a7;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[CACLabeledBadgeView setAlpha:](v20, "setAlpha:", 1.0);
    v20->_isContrastBackdrop = a8;
    -[CACLabeledBadgeView _setUpSubviews](v20, "_setUpSubviews");
  }

  return v20;
}

- (CACLabeledBadgeView)initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7
{
  return (CACLabeledBadgeView *)-[CACLabeledBadgeView _initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:](self, "_initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:", a4, a5, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CACLabeledBadgeView)initWithFrame:(CGRect)a3
{
  return -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](self, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", &stru_24F2ADCC8, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)contrastedCopy
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CACLabeledBadgeView *v14;
  void *v15;
  id v16;

  -[CACLabeledBadgeView frame](self, "frame");
  v7 = CACCGRectIncreasedByPercentage(v3, v4, v5, v6, 0.08);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = [CACLabeledBadgeView alloc];
  -[CACLabeledBadgeView label](self, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CACLabeledBadgeView _initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:](v14, "_initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:", v15, -[CACLabeledBadgeView arrowOrientation](self, "arrowOrientation"), -[CACLabeledBadgeView badgePresentation](self, "badgePresentation"), -[CACLabeledBadgeView badgeIndicatorMask](self, "badgeIndicatorMask"), 1, v7, v9, v11, v13);

  return v16;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACLabeledBadgeView;
  -[CACLabeledBadgeView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)_setUpSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
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
  CACLabeledBadgeView *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  double v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _BOOL4 v60;
  double v61;
  double v62;
  uint64_t v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CACLabeledBadgeView *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  CACLabeledBadgeView *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _QWORD v136[12];
  _QWORD v137[2];
  _QWORD v138[6];
  _QWORD v139[7];

  v139[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CACLabeledBadgeView addSubview:](self, "addSubview:", v8);
  v9 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend((id)objc_opt_class(), "_maskImageForArrowOrientation:badgePresentation:badgeIndicator:", -[CACLabeledBadgeView arrowOrientation](self, "arrowOrientation"), -[CACLabeledBadgeView badgePresentation](self, "badgePresentation"), -[CACLabeledBadgeView badgeIndicatorMask](self, "badgeIndicatorMask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithImage:", v10);

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v134 = v8;
  v135 = v11;
  objc_msgSend(v8, "addSubview:", v11);
  if (-[CACLabeledBadgeView isContrastBackdrop](self, "isContrastBackdrop"))
  {
    +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", v4, v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)objc_opt_new();
  }
  v13 = v12;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCaptureOnly:", 0);

  v15 = *MEMORY[0x24BDE5BF8];
  objc_msgSend(v13, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompositingFilter:", v15);

  objc_msgSend(v8, "addSubview:", v13);
  -[CACLabeledBadgeView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsGroupBlending:", 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v13;
  v133 = v18;
  if (-[CACLabeledBadgeView badgePresentation](self, "badgePresentation") == 2)
  {
    objc_msgSend((id)objc_opt_class(), "_badgeImageWithTinyRightArrow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "widthAnchor");
    v20 = (CACLabeledBadgeView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    -[CACLabeledBadgeView constraintEqualToConstant:](v20, "constraintEqualToConstant:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = v21;
    objc_msgSend(v135, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v24 = v23;
    v25 = -[CACLabeledBadgeView isContrastBackdrop](self, "isContrastBackdrop");
    v26 = 1.08;
    if (!v25)
      v26 = 1.0;
    objc_msgSend(v22, "constraintEqualToConstant:", v24 * v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v28);
    goto LABEL_34;
  }
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v29);

  objc_msgSend((id)objc_opt_class(), "_badgeFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v30);

  -[CACLabeledBadgeView label](self, "label");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v31);

  objc_msgSend(v19, "setHidden:", -[CACLabeledBadgeView isContrastBackdrop](self, "isContrastBackdrop"));
  v20 = self;
  -[CACLabeledBadgeView addSubview:](v20, "addSubview:", v19);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "preferredContentSizeCategory");
  v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v33);

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE090]);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BEBD5F0];
  objc_msgSend((id)objc_opt_class(), "_badgeFontTextStyle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "metricsForTextStyle:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = v38;
  if (-[CACLabeledBadgeView badgePresentation](v20, "badgePresentation") != 1
    || (objc_msgSend(v19, "text"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v39, "length"),
        v39,
        v38 = v130,
        v41 = 1.25,
        v40 <= 1))
  {
    v42 = -[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation");
    v41 = 3.0;
    if (v42 == 2)
    {
      objc_msgSend(v19, "text", 3.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "length");

      v38 = v130;
      v41 = 3.0;
      if (v44 > 1)
        v41 = 1.25;
    }
  }
  if (IsAccessibilityCategory)
    objc_msgSend(v38, "scaledValueForValue:compatibleWithTraitCollection:", v35, v41);
  else
    objc_msgSend(v38, "scaledValueForValue:", v41);
  v46 = v45;
  v47 = dbl_229AD4390[(-[CACLabeledBadgeView badgeIndicatorMask](v20, "badgeIndicatorMask") & 2) == 0];
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v38, "scaledValueForValue:compatibleWithTraitCollection:", v35, v47);
    v49 = v48 + v46 * -0.5;
    if (-[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation") == 1)
      v50 = v49;
    else
      v50 = v46;
    v51 = 0.0;
    objc_msgSend(v38, "scaledValueForValue:compatibleWithTraitCollection:", v35, 0.0);
    v53 = v52;
    if (-[CACLabeledBadgeView badgePresentation](v20, "badgePresentation") != 1)
      goto LABEL_28;
    objc_msgSend(v38, "scaledValueForValue:compatibleWithTraitCollection:", v35, 2.5);
  }
  else
  {
    objc_msgSend(v38, "scaledValueForValue:", v47);
    v56 = v55 + v46 * -0.25;
    if (-[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation") == 1)
      v50 = v56;
    else
      v50 = v46;
    v51 = 0.0;
    objc_msgSend(v38, "scaledValueForValue:", 0.0);
    v53 = v57;
    if (-[CACLabeledBadgeView badgePresentation](v20, "badgePresentation") != 1)
      goto LABEL_28;
    objc_msgSend(v38, "scaledValueForValue:", 2.5);
  }
  v51 = v54;
LABEL_28:
  v128 = (void *)v35;
  objc_msgSend((id)objc_opt_class(), "_heightForBadgeWithTextWithOrientation:", -[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation"));
  v59 = v58 + v51 * 2.0;
  v60 = -[CACLabeledBadgeView isContrastBackdrop](v20, "isContrastBackdrop");
  v61 = 1.08;
  if (!v60)
    v61 = 1.0;
  v62 = v59 * v61;
  v63 = -[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation");
  objc_msgSend(v19, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView topAnchor](v20, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v53 + v51;
  v126 = v64;
  if (v63 == 2)
  {
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v28, v65 + 2.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = v66;
    objc_msgSend(v19, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView bottomAnchor](v20, "bottomAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", -(v65 + 8.4 + -2.0));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v139[1] = v122;
    objc_msgSend(v19, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView leadingAnchor](v20, "leadingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v68;
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v46 + v51);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v139[2] = v116;
    objc_msgSend(v19, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView trailingAnchor](v20, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v69;
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", -(v50 + v51));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v139[3] = v110;
    objc_msgSend(v135, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToConstant:", v62);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v139[4] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 5);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObjectsFromArray:", v72);
  }
  else
  {
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v28, v65);
    v108 = objc_claimAutoreleasedReturnValue();
    v138[0] = v108;
    objc_msgSend(v19, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView bottomAnchor](v20, "bottomAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", -v65);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v138[1] = v122;
    objc_msgSend(v19, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView leadingAnchor](v20, "leadingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v73;
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v46 + v51);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v138[2] = v116;
    objc_msgSend(v19, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledBadgeView trailingAnchor](v20, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v74;
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", -(v50 + v51));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v138[3] = v110;
    objc_msgSend(v135, "widthAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v138[4] = v72;
    objc_msgSend(v135, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", v62);
    v76 = v28;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v138[5] = v77;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 6);
    v78 = self;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObjectsFromArray:", v79);

    self = v78;
    v28 = v76;
    v67 = v106;

    v66 = (void *)v108;
  }
  v13 = v132;

  v21 = v128;
  v22 = v130;
  v27 = v126;
LABEL_34:
  v98 = self;

  objc_msgSend(v135, "topAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView topAnchor](self, "topAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v129);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v127;
  objc_msgSend(v135, "bottomAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView bottomAnchor](self, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v123);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v121;
  objc_msgSend(v135, "leadingAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView leadingAnchor](self, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v136[2] = v115;
  objc_msgSend(v135, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView trailingAnchor](self, "trailingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v111);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v136[3] = v109;
  objc_msgSend(v134, "topAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v105);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v136[4] = v104;
  objc_msgSend(v134, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v136[5] = v101;
  objc_msgSend(v134, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "leadingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v99);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v136[6] = v97;
  objc_msgSend(v134, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v136[7] = v94;
  objc_msgSend(v13, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView topAnchor](self, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v136[8] = v91;
  objc_msgSend(v13, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView bottomAnchor](self, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = v13;
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v136[9] = v83;
  objc_msgSend(v82, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView leadingAnchor](self, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v136[10] = v86;
  objc_msgSend(v82, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLabeledBadgeView trailingAnchor](self, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v136[11] = v89;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 12);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "addObjectsFromArray:", v90);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v133);
  -[CACLabeledBadgeView setBadgeMaskImageView:](v98, "setBadgeMaskImageView:", v135);

}

- (id)copy
{
  CACLabeledBadgeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CACLabeledBadgeView *v13;

  v3 = [CACLabeledBadgeView alloc];
  -[CACLabeledBadgeView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CACLabeledBadgeView label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v3, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v12, -[CACLabeledBadgeView arrowOrientation](self, "arrowOrientation"), -[CACLabeledBadgeView badgePresentation](self, "badgePresentation"), -[CACLabeledBadgeView badgeIndicatorMask](self, "badgeIndicatorMask"), v5, v7, v9, v11);

  return v13;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (int64_t)arrowOrientation
{
  return self->_arrowOrientation;
}

- (int64_t)badgePresentation
{
  return self->_badgePresentation;
}

- (int64_t)badgeIndicatorMask
{
  return self->_badgeIndicatorMask;
}

- (UIImageView)badgeMaskImageView
{
  return self->_badgeMaskImageView;
}

- (void)setBadgeMaskImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeMaskImageView, a3);
}

- (CACAdaptiveBackdropView)_backdropView
{
  return self->__backdropView;
}

- (void)set_backdropView:(id)a3
{
  objc_storeStrong((id *)&self->__backdropView, a3);
}

- (UILabel)_labelView
{
  return self->__labelView;
}

- (void)set_labelView:(id)a3
{
  objc_storeStrong((id *)&self->__labelView, a3);
}

- (BOOL)isContrastBackdrop
{
  return self->_isContrastBackdrop;
}

- (void)setIsContrastBackdrop:(BOOL)a3
{
  self->_isContrastBackdrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__labelView, 0);
  objc_storeStrong((id *)&self->__backdropView, 0);
  objc_storeStrong((id *)&self->_badgeMaskImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
