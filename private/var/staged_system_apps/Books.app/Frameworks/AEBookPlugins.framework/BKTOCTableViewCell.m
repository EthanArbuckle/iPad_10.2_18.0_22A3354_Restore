@implementation BKTOCTableViewCell

+ (id)tocWebTemplate
{
  if (qword_20F5E0 != -1)
    dispatch_once(&qword_20F5E0, &stru_1C1010);
  return (id)qword_20F5D8;
}

- (BKTOCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BKTOCTableViewCell *v4;
  BKTOCTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKTOCTableViewCell;
  v4 = -[BKTOCTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v6, "setHighlightedTextColor:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](v5, "textLabel"));
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](v5, "textLabel"));
    objc_msgSend(v8, "setContentMode:", 5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](v5, "textLabel"));
    objc_msgSend(v9, "setOpaque:", 0);

  }
  return v5;
}

- (void)dealloc
{
  NSString *cacheKey;
  NSString *selectedCacheKey;
  objc_super v5;

  cacheKey = self->_cacheKey;
  self->_cacheKey = 0;

  selectedCacheKey = self->_selectedCacheKey;
  self->_selectedCacheKey = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKTOCTableViewCell;
  -[BKTOCTableViewCell dealloc](&v5, "dealloc");
}

+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend(a1, "pageLabelFrameForString:font:bounds:topMargin:layoutDirection:", a3, a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 16.0);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 topMargin:(double)a6 layoutDirection:(int64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __CFString *v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MinX;
  double MaxX;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = (__CFString *)a3;
  v14 = a4;
  v15 = CGRectZero.origin.y;
  if (!-[__CFString length](v13, "length"))
  {

    v13 = CFSTR(" ");
  }
  +[UILabel bkSizeForString:font:](UILabel, "bkSizeForString:font:", v13, v14);
  v32.size.width = v16;
  v18 = v17;
  v32.origin.x = CGRectZero.origin.x;
  v32.origin.y = v15;
  v32.size.height = v18;
  v19 = ceil(CGRectGetWidth(v32));
  v33.origin.x = CGRectZero.origin.x;
  v33.origin.y = v15;
  v33.size.width = v19;
  v33.size.height = v18;
  v20 = ceil(CGRectGetHeight(v33));
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  if (a7 == 1)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v21);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    v34.origin.x = CGRectZero.origin.x;
    v34.origin.y = v15;
    v34.size.width = v19;
    v34.size.height = v20;
    MinX = MaxX - CGRectGetWidth(v34);
  }

  v27 = MinX;
  v28 = a6;
  v29 = v19;
  v30 = v20;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

+ (double)cellHeightForCellWidth:(double)a3 pageLabelWidth:(double)a4 text:(id)a5 indentationLevel:(unint64_t)a6 indentationWidth:(double)a7 font:(id)a8 usesPopoverStyle:(BOOL)a9
{
  _BOOL4 v9;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  NSAttributedStringKey v23;
  id v24;

  v9 = a9;
  v11 = (double)a6 * a7;
  v12 = a4 + 20.0;
  v13 = a4 == 0.0;
  v14 = 0.0;
  if (!v13)
    v14 = v12;
  v15 = a3 - v14 - v11;
  v23 = NSFontAttributeName;
  v24 = a8;
  v16 = a8;
  v17 = a5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v15, 1.79769313e308);
  v20 = v19;

  if (v9)
    v21 = 16.0;
  else
    v21 = 28.0;

  return v21 + ceil(v20);
}

- (void)layoutSubviews
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double Height;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  _BOOL4 v35;
  double MinX;
  double v37;
  double v38;
  double x;
  char *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double MaxX;
  double v50;
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
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat width;
  CGFloat y;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGRect recta;
  __objc2_class *v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  *(_QWORD *)&recta.size.height = self;
  v96 = BKTOCTableViewCell;
  -[CGFloat layoutSubviews]((objc_super *)&recta.size.height, "layoutSubviews");
  v3 = -[BKTOCTableViewCell isVertical](self, "isVertical");
  v4 = self->_vertical | self->_hasHTMLTitle;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setHidden:", v4);

  -[BKVerticalLabel setHidden:](self->_verticalLabel, "setHidden:", !self->_vertical);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[BKTOCTableViewCell contentInsets](self, "contentInsets");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  objc_msgSend(v23, "sizeToFit");

  -[UILabel frame](self->_pageLabel, "frame");
  v28 = v25;
  v29 = v26;
  v30 = v27;
  recta.origin.y = v20;
  recta.size.width = v22;
  if (v3)
  {
    v94 = v26;
    Height = CGRectGetHeight(*(CGRect *)&v24);
    v97.origin.x = v16;
    v97.origin.y = v18;
    v97.size.width = v20;
    v97.size.height = v22;
    v32 = v16;
    v33 = v18;
    v34 = v20;
    recta.origin.x = Height;
    if (Height > CGRectGetHeight(v97) + -4.0)
    {
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_pageLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](self->_pageLabel, "setMinimumScaleFactor:", 0.5);
      v98.origin.x = v32;
      v98.origin.y = v33;
      v98.size.width = v20;
      v98.size.height = v22;
      v30 = CGRectGetHeight(v98) + -4.0;
      recta.origin.x = v30;
    }
    v35 = -[BKTOCTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", *(_QWORD *)&v94) == (char *)&dword_0 + 1;
    v99.origin.x = v32;
    v99.origin.y = v33;
    v99.size.width = v20;
    v99.size.height = v22;
    MinX = CGRectGetMinX(v99);
    v100.origin.x = v32;
    v100.origin.y = v33;
    v100.size.width = v34;
    v100.size.height = v22;
    v37 = CGRectGetHeight(v100);
    v101.origin.x = MinX;
    v101.origin.y = v28;
    v29 = v93;
    v101.size.width = v93;
    v101.size.height = v30;
    v38 = floor((v37 - CGRectGetHeight(v101)) * 0.5);
    v18 = v33;
    v16 = v32;
    x = recta.origin.x;
  }
  else
  {
    x = CGRectGetWidth(*(CGRect *)&v24);
    v40 = (char *)-[BKTOCTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v35 = v40 == (_BYTE *)&dword_0 + 1;
    v41 = v16;
    v42 = v18;
    v43 = v20;
    v44 = v22;
    if (v40 == (_BYTE *)&dword_0 + 1)
      MinX = CGRectGetMinX(*(CGRect *)&v41);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v41) - (x + 8.0);
    if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
      v38 = 8.0;
    else
      v38 = 15.0;
  }
  -[UILabel setFrame:](self->_pageLabel, "setFrame:", MinX, v38, v29, v30);
  v45 = MinX;
  v46 = v38;
  v47 = v29;
  v48 = v30;
  if (v3)
    MaxX = CGRectGetMaxX(*(CGRect *)&v45);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&v45);
  v50 = MaxX;
  if (self->_cachedImageView)
  {
    v51 = (double)(uint64_t)-[BKTOCTableViewCell indentationLevel](self, "indentationLevel");
    -[BKTOCTableViewCell indentationWidth](self, "indentationWidth");
    v53 = v52 * v51;
    if (v3)
    {
      v102.origin.x = v16;
      v102.origin.y = v18;
      v102.size.width = recta.origin.y;
      v102.size.height = recta.size.width;
      v54 = CGRectGetWidth(v102) - x - v53 + -10.0;
      v103.origin.x = v16;
      v103.origin.y = v18;
      v103.size.width = recta.origin.y;
      v103.size.height = recta.size.width;
      v55 = CGRectGetHeight(v103);
      v56 = v50 + 10.0;
      v57 = 0.0;
    }
    else
    {
      -[UIImageView frame](self->_cachedImageView, "frame");
      v54 = v72;
      v55 = v73;
      if (v35)
      {
        v74 = v70;
        v107.origin.x = v16;
        v93 = v71;
        v107.origin.y = v18;
        v75 = v18;
        y = recta.origin.y;
        width = recta.size.width;
        v107.size.width = recta.origin.y;
        v107.size.height = recta.size.width;
        recta.origin.x = CGRectGetMaxX(v107);
        v108.origin.x = v74;
        v108.origin.y = v93;
        v108.size.width = v54;
        v108.size.height = v55;
        v56 = recta.origin.x - CGRectGetWidth(v108) - v53;
      }
      else
      {
        v113.origin.x = v16;
        v113.origin.y = v18;
        v75 = v18;
        y = recta.origin.y;
        width = recta.size.width;
        v113.size.width = recta.origin.y;
        v113.size.height = recta.size.width;
        v56 = v53 + CGRectGetMinX(v113);
      }
      v114.origin.x = v16;
      v114.origin.y = v75;
      v114.size.width = y;
      v114.size.height = width;
      v85 = ceil((CGRectGetHeight(v114) - v55) * 0.5);
      v88 = isPad(v86, v87);
      v89 = 1.0;
      if (v88)
        v89 = 0.0;
      v57 = v89 + v85;
    }
    -[UIImageView setFrame:](self->_cachedImageView, "setFrame:", v56, v57, v54, v55, *(_QWORD *)&v93);
    -[BKTOCTableViewCell bounds](self, "bounds");
    -[BKTOCTableViewCell _setSelectedBackgroundViewFrame:](self, "_setSelectedBackgroundViewFrame:");
    goto LABEL_39;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v59 = (double)(uint64_t)-[BKTOCTableViewCell indentationLevel](self, "indentationLevel");
  -[BKTOCTableViewCell indentationWidth](self, "indentationWidth");
  v61 = v60 * v59;
  if (x == 0.0)
    v62 = 0.0;
  else
    v62 = x + 20.0;
  objc_msgSend(v58, "frame");
  recta.origin.x = v63;
  v65 = v64;
  if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
    v66 = 8.0;
  else
    v66 = 14.0;
  v104.origin.x = v16;
  v104.origin.y = v18;
  v104.size.width = recta.origin.y;
  v104.size.height = recta.size.width;
  v67 = CGRectGetWidth(v104) - v62 - v61;
  if (v35)
  {
    v105.origin.x = v16;
    v105.origin.y = v18;
    v105.size.width = recta.origin.y;
    v105.size.height = recta.size.width;
    v68 = CGRectGetMaxX(v105);
    v106.origin.x = recta.origin.x;
    v106.origin.y = v66;
    v106.size.width = v67;
    v106.size.height = v65;
    v69 = v68 - CGRectGetWidth(v106) - v61;
LABEL_35:
    objc_msgSend(v58, "sizeThatFits:", v67, v65);
    v83 = v92;
    goto LABEL_36;
  }
  v78 = v18;
  v79 = v16;
  if ((v3 & 1) == 0)
  {
    v90 = recta.origin.y;
    v91 = recta.size.width;
    v69 = v61 + CGRectGetMinX(*(CGRect *)&v79);
    goto LABEL_35;
  }
  v80 = recta.origin.y;
  v81 = recta.size.width;
  v82 = CGRectGetMaxX(*(CGRect *)&v79);
  -[UILabel frame](self->_pageLabel, "frame");
  v67 = v82 - CGRectGetMaxX(v109) + -10.0 - v61;
  v110.origin.x = v16;
  v110.origin.y = v18;
  v110.size.width = recta.origin.y;
  v110.size.height = recta.size.width;
  v83 = CGRectGetHeight(v110);
  v111.origin.x = v16;
  v111.origin.y = v18;
  v111.size.width = recta.origin.y;
  v111.size.height = recta.size.width;
  v84 = CGRectGetMaxX(v111);
  v112.origin.x = recta.origin.x;
  v112.origin.y = v66;
  v112.size.width = v67;
  v112.size.height = v83;
  v69 = v84 - CGRectGetWidth(v112) - v61;
  v66 = 0.0;
LABEL_36:
  objc_msgSend(v58, "setFrame:", v69, v66, v67, v83);
  if (v3)
    -[BKTOCTableViewCell _syncVerticalLabel](self, "_syncVerticalLabel");
  -[BKTOCTableViewCell bounds](self, "bounds");
  -[BKTOCTableViewCell _setSelectedBackgroundViewFrame:](self, "_setSelectedBackgroundViewFrame:");

LABEL_39:
  -[BKTOCTableViewCell configureFocusRing](self, "configureFocusRing");
}

- (void)configureFocusRing
{
  id v3;
  CGRect v4;
  CGRect v5;

  -[BKTOCTableViewCell bounds](self, "bounds");
  v5 = CGRectInset(v4, 7.0, 1.0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", kCACornerCurveContinuous, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 4.0));
  -[BKTOCTableViewCell setFocusEffect:](self, "setFocusEffect:", v3);

}

- (void)_setSelectedBackgroundViewFrame:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  CGRect v9;

  v9 = CGRectInset(a3, 7.0, 1.0);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v8, "setFrame:", x, y, width, height);

}

- (void)prepareForReuse
{
  UIImageView *cachedImageView;
  UIImageView *v4;
  NSString *cacheKey;
  NSString *selectedCacheKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTOCTableViewCell;
  -[BKTOCTableViewCell prepareForReuse](&v7, "prepareForReuse");
  -[UILabel setAlpha:](self->_pageLabel, "setAlpha:", 1.0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_pageLabel, "setAdjustsFontSizeToFitWidth:", 0);
  cachedImageView = self->_cachedImageView;
  if (cachedImageView)
  {
    -[UIImageView removeFromSuperview](cachedImageView, "removeFromSuperview");
    v4 = self->_cachedImageView;
  }
  else
  {
    v4 = 0;
  }
  self->_cachedImageView = 0;

  cacheKey = self->_cacheKey;
  self->_cacheKey = 0;

  selectedCacheKey = self->_selectedCacheKey;
  self->_selectedCacheKey = 0;

  self->_hasHTMLTitle = 0;
  -[BKTOCTableViewCell setBkaxIsExcludedFromSample:](self, "setBkaxIsExcludedFromSample:", 0);
}

- (void)_setHighlightedPopoverAppearance:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell highlightedBackgroundView](self, "highlightedBackgroundView"));
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell selectedBackgroundView](self, "selectedBackgroundView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell traitCollection](self, "traitCollection"));
      v9 = dbl_172BF0[objc_msgSend(v8, "userInterfaceStyle") == (char *)&dword_0 + 2];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", v9));
      objc_msgSend(v7, "setBackgroundColor:", v11);

      -[BKTOCTableViewCell setHighlightedBackgroundView:](self, "setHighlightedBackgroundView:", v7);
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell highlightedBackgroundView](self, "highlightedBackgroundView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v14, "insertSubview:belowSubview:", v12, v13);

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[BKTOCTableViewCell setHighlightedBackgroundView:](self, "setHighlightedBackgroundView:", 0);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKTOCTableViewCell;
  -[BKTOCTableViewCell setSelected:animated:](&v6, "setSelected:animated:", a3, a4);
  -[BKTOCTableViewCell _setSelectedAppearance:](self, "_setSelectedAppearance:", v4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKTOCTableViewCell;
  -[BKTOCTableViewCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
    -[BKTOCTableViewCell _setHighlightedPopoverAppearance:](self, "_setHighlightedPopoverAppearance:", v4);
  -[BKTOCTableViewCell _setSelectedAppearance:](self, "_setSelectedAppearance:", v4);
}

- (UILabel)pageLabel
{
  UILabel *pageLabel;
  UILabel *v4;
  UILabel *v5;
  uint64_t v6;
  void *v7;

  pageLabel = self->_pageLabel;
  if (!pageLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_pageLabel;
    self->_pageLabel = v4;

    if (self->_vertical)
      v6 = 1;
    else
      v6 = 2
         * (-[BKTOCTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != (char *)&dword_0 + 1);
    -[UILabel setTextAlignment:](self->_pageLabel, "setTextAlignment:", v6);
    -[UILabel setLineBreakMode:](self->_pageLabel, "setLineBreakMode:", 2);
    -[UILabel setOpaque:](self->_pageLabel, "setOpaque:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_pageLabel);

    pageLabel = self->_pageLabel;
  }
  return pageLabel;
}

- (void)setupSelectedBackgroundNil
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
  -[BKTOCTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v3);

}

- (void)configureSelectedBackgroundView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell makeSelectedBackgroundView](self, "makeSelectedBackgroundView"));
  -[BKTOCTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v3);

}

- (id)makeSelectedBackgroundView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  CGRect v11;
  CGRect v12;

  -[BKTOCTableViewCell bounds](self, "bounds");
  v12 = CGRectInset(v11, 7.0, 1.0);
  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 4.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v5, "setCornerCurve:", kCACornerCurveContinuous);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell traitCollection](self, "traitCollection"));
  v7 = dbl_172BF0[objc_msgSend(v6, "userInterfaceStyle") == (char *)&dword_0 + 2];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", v7));
  objc_msgSend(v3, "setBackgroundColor:", v9);

  return v3;
}

- (void)setVertical:(BOOL)a3
{
  if (-[BKTOCTableViewCell isVertical](self, "isVertical") != a3)
  {
    self->_vertical = a3;
    -[BKTOCTableViewCell _adjustLabelTextAlignment](self, "_adjustLabelTextAlignment");
  }
}

- (void)displayHTMLWithContents:(id)a3 fontFamily:(id)a4 fontSize:(double)a5 maxSpan:(double)a6 baseURL:(id)a7
{
  id v10;
  id v11;
  void *v12;
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
  double v26;
  double v27;
  double v28;
  _BOOL4 vertical;
  void *v30;
  uint64_t v31;
  double Height;
  double v36;
  double v37;
  double Width;
  id v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  NSString *v44;
  NSString *cacheKey;
  NSString *v46;
  NSString *selectedCacheKey;
  double v48;
  UIImageView *v49;
  UIImageView *cachedImageView;
  id v51;
  void *v52;
  CGRect v53;
  CGRect v54;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[BKTOCTableViewCell contentInsets](self, "contentInsets");
  v22 = v14 + v21;
  v24 = v16 + v23;
  v26 = v18 - (v21 + v25);
  v28 = v20 - (v23 + v27);

  vertical = self->_vertical;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  objc_msgSend(v30, "frame");
  if (vertical)
    Height = CGRectGetHeight(*(CGRect *)&v31);
  else
    Height = CGRectGetWidth(*(CGRect *)&v31);
  v36 = Height;

  v53.origin.x = v22;
  v53.origin.y = v24;
  v53.size.width = v26;
  v53.size.height = v28;
  v37 = CGRectGetHeight(v53);
  v54.origin.x = v22;
  v54.origin.y = v24;
  v54.size.width = v26;
  v54.size.height = v28;
  Width = CGRectGetWidth(v54);
  v39 = -[BKTOCTableViewCell indentationLevel](self, "indentationLevel");
  -[BKTOCTableViewCell indentationWidth](self, "indentationWidth");
  v41 = v40;
  self->_hasHTMLTitle = 1;
  v42 = objc_alloc((Class)NSString);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_vertical));
  v44 = (NSString *)objc_msgSend(v42, "initWithFormat:", CFSTR("%@-%f.0-%@-%@"), v10, *(_QWORD *)&a5, v43, v11);

  cacheKey = self->_cacheKey;
  self->_cacheKey = v44;

  v46 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-selected"), self->_cacheKey);
  selectedCacheKey = self->_selectedCacheKey;
  self->_selectedCacheKey = v46;

  if (!self->_cachedImageView)
  {
    v48 = v36 + 10.0;
    if (v36 == 0.0)
      v48 = 0.0;
    v49 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, Width - v48 - (double)(uint64_t)v39 * v41, v37);
    cachedImageView = self->_cachedImageView;
    self->_cachedImageView = v49;

    -[UIImageView setAutoresizingMask:](self->_cachedImageView, "setAutoresizingMask:", 2);
    -[UIImageView setUserInteractionEnabled:](self->_cachedImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](self->_cachedImageView, "setContentMode:", 8);
    v51 = &dword_0 + 1;
    -[UIImageView setClipsToBounds:](self->_cachedImageView, "setClipsToBounds:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
    objc_msgSend(v52, "addSubview:", self->_cachedImageView);

    if ((-[BKTOCTableViewCell isSelected](self, "isSelected") & 1) == 0)
      v51 = -[BKTOCTableViewCell isHighlighted](self, "isHighlighted");
    -[BKTOCTableViewCell _setSelectedAppearance:](self, "_setSelectedAppearance:", v51);
  }
}

- (void)_syncVerticalLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "frame");
  -[BKVerticalLabel setFrame:](self->_verticalLabel, "setFrame:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  -[BKVerticalLabel setBackgroundColor:](self->_verticalLabel, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  -[BKVerticalLabel setAutoresizingMask:](self->_verticalLabel, "setAutoresizingMask:", objc_msgSend(v6, "autoresizingMask"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
  -[BKVerticalLabel setText:](self->_verticalLabel, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
  -[BKVerticalLabel setFont:](self->_verticalLabel, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textColor"));
  -[BKVerticalLabel setTextColor:](self->_verticalLabel, "setTextColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shadowColor"));
  -[BKVerticalLabel setShadowColor:](self->_verticalLabel, "setShadowColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self->_verticalLabel, "text"));
  objc_msgSend(v15, "rangeOfString:", CFSTR("“"));
  v17 = v16;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self->_verticalLabel, "text"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("“"), CFSTR("〝")));
    -[BKVerticalLabel setText:](self->_verticalLabel, "setText:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self->_verticalLabel, "text"));
  objc_msgSend(v20, "rangeOfString:", CFSTR("”"));
  v22 = v21;

  if (v22)
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(-[BKVerticalLabel text](self->_verticalLabel, "text"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("”"), CFSTR("〟")));
    -[BKVerticalLabel setText:](self->_verticalLabel, "setText:", v23);

  }
}

- (void)_adjustLabelTextAlignment
{
  BKVerticalLabel *verticalLabel;
  BKVerticalLabel *v4;
  void *v5;
  BKVerticalLabel *v6;
  BKVerticalLabel *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  BKVerticalLabel *v12;
  void *v13;
  id v14;

  if (self->_vertical)
  {
    verticalLabel = self->_verticalLabel;
    if (!verticalLabel)
    {
      v4 = [BKVerticalLabel alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
      objc_msgSend(v5, "frame");
      v6 = -[BKVerticalLabel initWithFrame:](v4, "initWithFrame:");
      v7 = self->_verticalLabel;
      self->_verticalLabel = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", self->_verticalLabel);

      -[BKTOCTableViewCell _syncVerticalLabel](self, "_syncVerticalLabel");
      verticalLabel = self->_verticalLabel;
    }
    -[BKVerticalLabel setHidden:](verticalLabel, "setHidden:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    v14 = v9;
    v10 = 1;
  }
  else
  {
    v11 = (char *)-[BKTOCTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v12 = self->_verticalLabel;
    if (v12)
      -[BKVerticalLabel setHidden:](v12, "setHidden:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v13, "setTextAlignment:", 2 * (v11 == (_BYTE *)&dword_0 + 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    v14 = v9;
    v10 = 2 * (v11 != (_BYTE *)&dword_0 + 1);
  }
  objc_msgSend(v9, "setTextAlignment:", v10);

}

+ (CGSize)titleSizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSAttributedStringKey v29;
  id v30;
  NSAttributedStringKey v31;
  id v32;
  CGSize result;

  v31 = NSFontAttributeName;
  v32 = a5;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  objc_msgSend(CFSTR("8888"), "sizeWithAttributes:", v11);
  v13 = v12;
  v15 = v14;

  v18 = isPad(v16, v17);
  v19 = 0.0;
  v20 = 26.0;
  if (!v18)
    v20 = 0.0;
  if (v13 > 0.0)
    v19 = v13 + 10.0;
  v21 = a6 - v19 - v20 - (double)(10 * a4);
  v29 = NSFontAttributeName;
  v30 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 3, v22, 0, v21, 1000.0);
  v24 = v23;
  v26 = v25;

  if (v15 * 5.0 < v26)
    v26 = v15 * 5.0;

  v27 = v24;
  v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

+ (CGSize)sizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6
{
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "titleSizeForText:indentation:font:width:", a3, a4, a5);
  v8 = v7 + 24.0;
  v9 = a6;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (double)maxSpanForTextWithIndentation:(int64_t)a3 font:(id)a4 width:(double)a5
{
  int v7;
  double v8;

  v7 = isPad(a1, a2);
  v8 = 0.0;
  if (v7)
    v8 = 26.0;
  return a5 - v8 - (double)(10 * a3);
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)usesPopoverStyle
{
  return self->_usesPopoverStyle;
}

- (void)setUsesPopoverStyle:(BOOL)a3
{
  self->_usesPopoverStyle = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)selectedCacheKey
{
  return self->_selectedCacheKey;
}

- (void)setSelectedCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)bkaxIsExcludedFromSample
{
  return self->_bkaxIsExcludedFromSample;
}

- (void)setBkaxIsExcludedFromSample:(BOOL)a3
{
  self->_bkaxIsExcludedFromSample = a3;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedCacheKey, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cachedImageView, 0);
  objc_storeStrong((id *)&self->_verticalLabel, 0);
  objc_storeStrong((id *)&self->_highlightImage, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
}

@end
