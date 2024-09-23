@implementation BKLibraryBookshelfSectionHeader

- (BKLibraryBookshelfSectionHeader)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfSectionHeader *v3;
  UILabel *v4;
  UILabel *sectionNameLabel;
  UILabel *v6;
  unint64_t v7;
  uint64_t v8;
  CAShapeLayer *separatorLine;
  void *v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfSectionHeader;
  v3 = -[BKLibraryBookshelfSectionHeader initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    sectionNameLabel = v3->_sectionNameLabel;
    v3->_sectionNameLabel = v4;

    v6 = v3->_sectionNameLabel;
    v7 = (unint64_t)-[UILabel accessibilityTraits](v6, "accessibilityTraits");
    -[UILabel setAccessibilityTraits:](v6, "setAccessibilityTraits:", UIAccessibilityTraitHeader | v7);
    v8 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (CAShapeLayer *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "scale");
    -[CAShapeLayer setLineWidth:](v3->_separatorLine, "setLineWidth:", 1.0 / v11);

    -[CAShapeLayer setHidden:](v3->_separatorLine, "setHidden:", 1);
    -[BKLibraryBookshelfSectionHeader addSubview:](v3, "addSubview:", v3->_sectionNameLabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader layer](v3, "layer"));
    objc_msgSend(v12, "addSublayer:", v3->_separatorLine);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKLibraryBookshelfSectionHeader;
  -[BKLibraryBookshelfSectionHeader dealloc](&v2, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  _BOOL8 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double MaxX;
  double v40;
  id v41;
  id v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  double MinX;
  CGFloat v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v49.receiver = self;
  v49.super_class = (Class)BKLibraryBookshelfSectionHeader;
  -[BKLibraryBookshelfSectionHeader layoutSubviews](&v49, "layoutSubviews");
  -[BKLibraryBookshelfSectionHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKLibraryBookshelfSectionHeader margins](self, "margins");
  v12 = v11;
  v50.origin.x = v4;
  v50.origin.y = v6;
  v50.size.width = v8;
  v50.size.height = v10;
  v51 = CGRectInset(v50, v12, 0.0);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  MinX = CGRectGetMinX(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v46 = CGRectGetWidth(v52);
  v17 = -[BKLibraryBookshelfSectionHeader isRTL](self, "isRTL");
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v18 = CGRectGetHeight(v53);
  v19 = IMRectFlippedForRTL(v17, MinX, 0.0, v46, v18, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v28 = IMRectFlippedForRTL(-[BKLibraryBookshelfSectionHeader isRTL](self, "isRTL"), MinX, 0.0, v46, 1.0, x, y, width, height);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader separatorLine](self, "separatorLine"));
  objc_msgSend((id)v35, "lineWidth");
  v44 = v36 * 0.5;

  LOBYTE(v35) = -[BKLibraryBookshelfSectionHeader bottomSeparator](self, "bottomSeparator");
  v45 = v28;
  v54.origin.x = v28;
  v54.origin.y = v30;
  v48 = v34;
  v54.size.width = v32;
  v54.size.height = v34;
  v37 = CGRectGetMinX(v54);
  v38 = v37;
  if ((v35 & 1) != 0)
  {
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    objc_msgSend(v27, "moveToPoint:", v38, CGRectGetMaxY(v55) - v44);
    v56.origin.x = v28;
    v56.origin.y = v30;
    v56.size.width = v32;
    v56.size.height = v48;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    v40 = CGRectGetMaxY(v57) - v44;
  }
  else
  {
    v40 = v44;
    objc_msgSend(v27, "moveToPoint:", v37, v44);
    v58.origin.x = v45;
    v58.origin.y = v30;
    v58.size.width = v32;
    v58.size.height = v48;
    MaxX = CGRectGetMaxX(v58);
  }
  objc_msgSend(v27, "addLineToPoint:", MaxX, v40);
  v41 = objc_retainAutorelease(v27);
  v42 = objc_msgSend(v41, "CGPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader separatorLine](self, "separatorLine"));
  objc_msgSend(v43, "setPath:", v42);

}

- (void)setSectionName:(id)a3
{
  NSString *v4;
  NSString *sectionName;
  NSString *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  unsigned __int8 v11;
  NSString *v12;
  NSString *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sectionName = self->_sectionName;
  self->_sectionName = v4;

  if (-[NSString isEqualToString:](self->_sectionName, "isEqualToString:", BKLibrarySortLastUnknownAuthorString))
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownAuthor](BKLibraryAsset, "unknownAuthor"));
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_sectionName, "isEqualToString:", BKLibrarySortLastMultipleAuthorString))
      goto LABEL_6;
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset multipleAuthors](BKLibraryAsset, "multipleAuthors"));
  }
  v7 = self->_sectionName;
  self->_sectionName = v6;

LABEL_6:
  if (!self->_sectionName)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_10091C438, 0));
    v10 = self->_sectionName;
    self->_sectionName = v9;

  }
  v11 = -[BKLibraryBookshelfSectionHeader useAllCaps](self, "useAllCaps");
  v12 = self->_sectionName;
  if ((v11 & 1) != 0)
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString localizedUppercaseString](v12, "localizedUppercaseString"));
  else
    v13 = v12;
  v18 = v13;
  v14 = objc_alloc((Class)NSAttributedString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader fontAttrs](self, "fontAttrs"));
  v16 = objc_msgSend(v14, "initWithString:attributes:", v18, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
  objc_msgSend(v17, "setAttributedText:", v16);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  NSString *sectionName;
  NSString *v27;
  NSString *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)BKLibraryBookshelfSectionHeader;
  v4 = a3;
  -[BKLibraryBookshelfSectionHeader applyLayoutAttributes:](&v40, "applyLayoutAttributes:", v4);
  -[BKLibraryBookshelfSectionHeader setIsRTL:](self, "setIsRTL:", -[BKLibraryBookshelfSectionHeader effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", v40.receiver, v40.super_class) == (id)1);
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (objc_msgSend(v7, "layoutDebugMode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.2)));
    v10 = objc_msgSend(v9, "CGColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader layer](self, "layer"));
    objc_msgSend(v11, "setBorderColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader layer](self, "layer"));
    objc_msgSend(v12, "setBorderWidth:", 0.5);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorWithAlphaComponent:", 0.2)));
    v15 = objc_msgSend(v14, "CGColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    objc_msgSend(v17, "setBorderColor:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    v20 = v19;
    v21 = 0.5;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader layer](self, "layer"));
    objc_msgSend(v22, "setBorderWidth:", 0.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    v20 = v19;
    v21 = 0.0;
  }
  objc_msgSend(v19, "setBorderWidth:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontAttrs"));
  -[BKLibraryBookshelfSectionHeader setFontAttrs:](self, "setFontAttrs:", v23);

  -[BKLibraryBookshelfSectionHeader setUseAllCaps:](self, "setUseAllCaps:", objc_msgSend(v7, "useAllCaps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
  objc_msgSend(v24, "margins");
  -[BKLibraryBookshelfSectionHeader setMargins:](self, "setMargins:");

  v25 = -[BKLibraryBookshelfSectionHeader useAllCaps](self, "useAllCaps");
  sectionName = self->_sectionName;
  if ((v25 & 1) != 0)
    v27 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString localizedUppercaseString](sectionName, "localizedUppercaseString"));
  else
    v27 = sectionName;
  v28 = v27;
  if (v27)
  {
    v29 = objc_alloc((Class)NSAttributedString);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader fontAttrs](self, "fontAttrs"));
    v31 = objc_msgSend(v29, "initWithString:attributes:", v28, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader sectionNameLabel](self, "sectionNameLabel"));
    objc_msgSend(v32, "setAttributedText:", v31);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainHeaderMetrics"));
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "separatorLineColor")));
  v35 = objc_msgSend(v34, "CGColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader separatorLine](self, "separatorLine"));
  objc_msgSend(v36, "setStrokeColor:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainHeaderMetrics"));
  if (v37)
    v38 = (uint64_t)objc_msgSend(v7, "firstItem");
  else
    v38 = 1;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSectionHeader separatorLine](self, "separatorLine"));
  objc_msgSend(v39, "setHidden:", v38);

}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (BOOL)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(BOOL)a3
{
  self->_bottomSeparator = a3;
}

- (UILabel)sectionNameLabel
{
  return self->_sectionNameLabel;
}

- (void)setSectionNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sectionNameLabel, a3);
}

- (CAShapeLayer)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLine, a3);
}

- (NSDictionary)fontAttrs
{
  return self->_fontAttrs;
}

- (void)setFontAttrs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)useAllCaps
{
  return self->_useAllCaps;
}

- (void)setUseAllCaps:(BOOL)a3
{
  self->_useAllCaps = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttrs, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_sectionNameLabel, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
