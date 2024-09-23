@implementation _UINavigationBarLargeTitleViewLayout

- (void)setOverlaysContentView:(BOOL)a3
{
  if (self->_overlaysContentView != a3)
  {
    self->_overlaysContentView = a3;
    -[_UINavigationBarLargeTitleViewLayout updateRestingTitleHeight](self, "updateRestingTitleHeight");
  }
}

- (unint64_t)twoLineMode
{
  return self->_twoLineMode;
}

- (void)updateRestingTitleHeight
{
  double v3;
  double v4;
  double v5;

  -[UIView bounds](self->_contentView, "bounds");
  -[_UINavigationBarLargeTitleViewLayout restingTitleHeightForSize:type:](self, "restingTitleHeightForSize:type:", self->_titleType, v3, v4);
  self->_titleRestingHeight = v5;
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;

  v9 = (char *)a3;
  -[_UINavigationBarLargeTitleViewLayout restingTitleHeightForSize:type:](self, "restingTitleHeightForSize:type:", 1, a4, 10000.0);
  if (self->_overlaysContentView)
  {
    v7 = v9;
    if (v9)
    {
      v8 = 40;
LABEL_6:
      *(_QWORD *)&v7[v8] = v6;
    }
  }
  else
  {
    v7 = v9;
    if (v9)
    {
      *((_QWORD *)v9 + 5) = v6;
      v8 = 32;
      goto LABEL_6;
    }
  }

}

- (double)restingTitleHeightForSize:(CGSize)a3 type:(int64_t)a4
{
  double width;
  double result;

  width = a3.width;
  result = 0.0;
  if (width >= 0.0)
  {
    -[_UINavigationBarLargeTitleViewLayout _textHeightForSize:titleType:](self, "_textHeightForSize:titleType:", self->_titleType, width, a3.height);
    if (result <= 0.0)
      result = _largeTitleRestingHeight();
  }
  if (self->_overlaysContentView)
    return result + 10.0;
  return result;
}

- (double)_textHeightForSize:(CGSize)a3 titleType:(int64_t)a4
{
  double width;
  UIView *accessoryView;
  double v7;
  double v8;

  if (!a4)
    return 0.0;
  width = a3.width;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", a3.width, a3.height);
    if (v8 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v7 == *MEMORY[0x1E0C9D820])
      v7 = 0.0;
    width = width - v7;
  }
  -[_UINavigationBarLargeTitleViewLayout _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:](self, "_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:", width - (self->_layoutMargins.leading + self->_layoutMargins.trailing));
  return self->_cachedRestingHeight;
}

- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:(double)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  UILabel *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *titleHeightCache;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *restingHeightCache;
  void *v37;
  double v38;
  double v39;
  _QWORD v40[2];
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  CGSize result;

  v3 = a3;
  if (self->_twoLineMode == 2)
  {
    -[_UINavigationBarLargeTitleViewLayout _cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:](self, "_cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:", a3);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UILabel text](self->_titleLabel, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = self->_titleLabel;
    }
    else
    {
      -[_UINavigationBarLargeTitleView effectiveTitleAttributes](self->_contentView, "effectiveTitleAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_twoLineMode == 2;
      -[UIView window](self->_contentView, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _UINavigationBarLargeTitleViewLabelForMeasuring(v12, v13, v14);
      v11 = (UILabel *)objc_claimAutoreleasedReturnValue();

      -[UILabel setNumberOfLines:](v11, "setNumberOfLines:", -[UILabel numberOfLines](self->_titleLabel, "numberOfLines"));
    }
    v15 = v3 > 0.0 || -[UILabel numberOfLines](v11, "numberOfLines") == 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_titleHeightCache, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "CGSizeValue");
      v6 = v19;
      v8 = v20;
    }
    else if (v15)
    {
      if (v3 <= 0.0)
        v3 = 500.0;
      if (self->_twoLineMode == 1)
        v21 = 2;
      else
        v21 = 1;
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = 0;
      if (!-[UILabel lineBreakStrategy](v11, "lineBreakStrategy"))
      {
        -[UILabel _synthesizedAttributedText](v11, "_synthesizedAttributedText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __91___UINavigationBarLargeTitleViewLayout__cachedTitleHeightSizeAndUpdateRestingSizeForWidth___block_invoke;
        v41[3] = &unk_1E16B6338;
        v41[4] = &v42;
        objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("kTUIAllCapsAttributeName"), 0, v23, 0, v41);

      }
      if (*((_BYTE *)v43 + 24))
        -[UILabel setLineBreakStrategy:](v11, "setLineBreakStrategy:", 0xFFFFLL);
      -[UILabel textRectForBounds:limitedToNumberOfLines:](v11, "textRectForBounds:limitedToNumberOfLines:", v21, 0.0, 0.0, v3, 1.79769313e308);
      v6 = v24;
      v8 = v25;
      if (*((_BYTE *)v43 + 24))
        -[UILabel setLineBreakStrategy:](v11, "setLineBreakStrategy:", 0);
      if (self->_providesExtraSpaceForExcessiveLineHeights)
      {
        -[UILabel font](v11, "font");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _UINavigationBarExcessiveLineHeightOutsetsForFontInView((uint64_t)v26, v11);
        v28 = v27;

        v8 = v8 + v28;
      }
      if (!self->_titleHeightCache)
      {
        v29 = (NSMutableDictionary *)objc_opt_new();
        titleHeightCache = self->_titleHeightCache;
        self->_titleHeightCache = v29;

      }
      *(double *)v40 = v6;
      *(double *)&v40[1] = v8;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v40, "{CGSize=dd}");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleHeightCache, "setObject:forKeyedSubscript:", v31, v16);

      _Block_object_dispose(&v42, 8);
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D820];
      v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    -[NSMutableDictionary objectForKey:](self->_restingHeightCache, "objectForKey:", v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      objc_msgSend(v32, "doubleValue");
      self->_cachedRestingHeight = v34;
    }
    else
    {
      if (!self->_restingHeightCache)
      {
        v35 = (NSMutableDictionary *)objc_opt_new();
        restingHeightCache = self->_restingHeightCache;
        self->_restingHeightCache = v35;

      }
      self->_cachedRestingHeight = _UINavigationBarLargeTitleViewCalculateRestingHeight(v11, v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_restingHeightCache, "setObject:forKeyedSubscript:", v37, v16);

    }
  }
  v38 = v6;
  v39 = v8;
  result.height = v39;
  result.width = v38;
  return result;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)_invalidateTitleHeightCache
{
  NSMutableDictionary *titleHeightCache;
  NSMutableDictionary *restingHeightCache;

  titleHeightCache = self->_titleHeightCache;
  self->_titleHeightCache = 0;

  restingHeightCache = self->_restingHeightCache;
  self->_restingHeightCache = 0;

}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTwoLineMode:(unint64_t)a3
{
  uint64_t v4;
  _BOOL8 v5;
  double v6;

  if (self->_twoLineMode != a3)
  {
    self->_twoLineMode = a3;
    if (a3)
      v4 = 2;
    else
      v4 = 1;
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v4);
    v5 = self->_twoLineMode == 2;
    v6 = 0.475;
    if (self->_twoLineMode != 2)
      v6 = 1.0;
    -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", v6);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", v5);
    -[UILabel _setSupportMultiLineShrinkToFit:]((uint64_t)self->_titleLabel, v5);
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self, "_invalidateTitleHeightCache");
  }
}

- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3
{
  self->_providesExtraSpaceForExcessiveLineHeights = a3;
}

- (void)setAlignAccessoryViewToTitleBaseline:(BOOL)a3
{
  self->_alignAccessoryViewToTitleBaseline = a3;
}

- (void)setAccessoryViewHorizontalAlignment:(unint64_t)a3
{
  self->_accessoryViewHorizontalAlignment = a3;
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *accessoryView;
  UIView **p_accessoryView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  v9 = v5;
  if (accessoryView != v5)
  {
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v5 = *p_accessoryView;
  }
  if (v5)
  {
    -[UIView superview](v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[_UINavigationBarLargeTitleViewLayout _enforceLayoutOrdering](self, "_enforceLayoutOrdering");
  }

}

- (_UINavigationBarLargeTitleViewLayout)initWithContentView:(id)a3
{
  _UINavigationBarLargeTitleView *v4;
  _UINavigationBarLargeTitleViewLayout *v5;
  _UINavigationBarLargeTitleViewLayout *v6;
  uint64_t v7;
  UILabel *titleLabel;
  objc_super v10;

  v4 = (_UINavigationBarLargeTitleView *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarLargeTitleViewLayout;
  v5 = -[_UINavigationBarLargeTitleViewLayout init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    _UINavigationBarLargeTitleViewNewLabel();
    v7 = objc_claimAutoreleasedReturnValue();
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v7;

    v6->_titleType = 0;
    v6->_titleRestingHeight = 0.0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_restingHeightCache, 0);
  objc_storeStrong((id *)&self->_titleHeightCache, 0);
}

- (void)layoutViews
{
  -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self, "layoutViewsWithOffset:useRestingTitleHeight:", 0, 0.0, 0.0);
}

- (void)layoutViewsWithOffset:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4
{
  _BOOL8 v4;
  double vertical;
  double horizontal;
  double x;
  double y;
  double width;
  double height;
  double v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  UIView *accessoryView;
  double *v19;
  double v20;
  double v21;
  double v22;
  unint64_t accessoryViewHorizontalAlignment;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  long double v32;
  double v33;
  double v34;
  CGFloat v35;
  BOOL v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  UILabel *titleLabel;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double MaxX;
  uint64_t v57;
  double v61;
  double v62;
  double v63;
  double MinX;
  double v65;
  double MaxY;
  double v67;
  double titleRestingHeight;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double MinY;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double rect;
  CGFloat v82;
  CGFloat v83;
  double v84;
  CGAffineTransform v85;
  CGAffineTransform v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v4 = a4;
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UINavigationBarLargeTitleViewLayout _enforceLayoutOrdering](self, "_enforceLayoutOrdering");
  if (self->_twoLineMode == 2)
  {
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffsetSupportingMultiLineShrinkToFit:useRestingTitleHeight:](self, "layoutViewsWithOffsetSupportingMultiLineShrinkToFit:useRestingTitleHeight:", v4, horizontal, vertical);
    return;
  }
  -[_UINavigationBarLargeTitleViewLayout _contentLayoutBoundsUsingRestingTitleHeight:](self, "_contentLayoutBoundsUsingRestingTitleHeight:", v4);
  x = v87.origin.x;
  y = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  if (CGRectIsNull(v87))
    return;
  v12 = horizontal + x;
  rect = vertical + y;
  v13 = *((_DWORD *)&self->_contentView->super._viewFlags + 4);
  v14 = MEMORY[0x1E0C9D648];
  v15 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  accessoryView = self->_accessoryView;
  v19 = (double *)MEMORY[0x1E0C9D820];
  v83 = *MEMORY[0x1E0C9D648];
  if (!accessoryView)
  {
    v78 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
LABEL_19:
    v25 = v15;
    goto LABEL_20;
  }
  -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
  v22 = v21;
  v78 = v20;
  if (v21 == *v19 && v20 == v19[1])
    goto LABEL_19;
  accessoryViewHorizontalAlignment = self->_accessoryViewHorizontalAlignment;
  if (accessoryViewHorizontalAlignment)
    v25 = v15;
  else
    v25 = v12;
  if (!accessoryViewHorizontalAlignment && (v13 & 0x80000) == 0)
  {
    v88.origin.x = v12;
    v88.origin.y = rect;
    v88.size.width = width;
    v88.size.height = height;
    v25 = CGRectGetMaxX(v88) - v22;
  }
  v26 = -0.0;
  if ((*(_QWORD *)&v13 & 0x80000) != 0)
    v26 = v22;
  v12 = v12 + v26;
  width = width - v22;
LABEL_20:
  v82 = v12;
  v79 = v25;
  v80 = v22;
  -[UIView traitCollection](self->_contentView, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayScale");
  v29 = v28;

  v84 = v29;
  if (self->_titleType)
  {
    -[_UINavigationBarLargeTitleViewLayout _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:](self, "_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:", width);
    v17 = v30;
    v16 = v31;
    v32 = 1.0 / v29;
    v33 = fmod(v30 * 0.5, v32);
    v34 = fmod(v16 * 0.5, v32);
  }
  else
  {
    v34 = 0.0;
    v33 = 0.0;
  }
  v35 = *(double *)(v14 + 8);
  v36 = v16 == v19[1] && v17 == *v19;
  v37 = 1.0;
  if (!v36)
  {
    v77 = v35;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v40 = v84 * (v39 * 0.66);

    v41 = fmin((height - self->_titleRestingHeight) / v40 + 1.0, 1.1);
    if (v41 < 1.0)
      v41 = 1.0;
    if (v17 * v41 <= width || v17 <= 0.0)
      v37 = v41;
    else
      v37 = width / v17;
    v43 = v17 * 0.5 * v37;
    if ((v13 & 0x80000) != 0)
    {
      v89.origin.y = rect;
      v89.origin.x = v82;
      v89.size.width = width;
      v89.size.height = height;
      v44 = CGRectGetMaxX(v89) - v43;
    }
    else
    {
      v44 = v82 + v43;
    }
    UIRoundToScale(v33 + v44, v84);
    v46 = v45 - v33;
    v35 = v77;
    -[UILabel setBounds:](self->_titleLabel, "setBounds:", v83, v77, v17, v16);
    -[UILabel _lastLineBaseline](self->_titleLabel, "_lastLineBaseline");
    v48 = v16 * 0.5;
    if (self->_twoLineMode == 2)
    {
      while (v47 > v16)
        v47 = v47 - v48;
    }
    UIRoundToScale(v34 + height + -16.0 - v37 * (v47 - v48), v84);
    -[UIView setCenter:](self->_titleLabel, "setCenter:", v46, v49 - v34);
    -[UILabel setBounds:](self->_titleLabel, "setBounds:", v83, v77, v17, v16);
    CGAffineTransformMakeScale(&v86, v37, v37);
    titleLabel = self->_titleLabel;
    v85 = v86;
    -[UIView setTransform:](titleLabel, "setTransform:", &v85);
  }
  if (self->_accessoryView)
  {
    v51 = v79;
    if (self->_accessoryViewHorizontalAlignment != 1)
      goto LABEL_53;
    if (v36)
    {
      v52 = v82;
      if ((v13 & 0x80000) != 0)
      {
        v53 = rect;
        v54 = width;
        v55 = height;
        MaxX = CGRectGetMaxX(*(CGRect *)&v52);
LABEL_49:
        v51 = MaxX - v80;
        goto LABEL_53;
      }
      v61 = rect;
      v62 = width;
      v63 = height;
      MinX = CGRectGetMinX(*(CGRect *)&v52);
    }
    else
    {
      -[UIView frame](self->_titleLabel, "frame");
      if ((v13 & 0x80000) != 0)
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v57);
        goto LABEL_49;
      }
      MinX = CGRectGetMaxX(*(CGRect *)&v57);
    }
    v51 = MinX;
LABEL_53:
    if (self->_alignAccessoryViewToTitleBaseline)
    {
      if (!v36)
      {
        -[UIView frame](self->_titleLabel, "frame");
        v65 = v78;
        v70 = CGRectGetMaxY(v92) - v78;
        v93.origin.x = v83;
        v93.origin.y = v35;
        v93.size.width = v17;
        v93.size.height = v16;
        v71 = CGRectGetHeight(v93);
        -[UILabel _firstLineBaseline](self->_titleLabel, "_firstLineBaseline");
        v69 = v70 - v37 * (v71 - v72);
        goto LABEL_63;
      }
      v90.origin.y = rect;
      v90.origin.x = v82;
      v90.size.width = width;
      v90.size.height = height;
      v65 = v78;
      MaxY = CGRectGetMaxY(v90) - v78;
      v67 = -16.0;
    }
    else
    {
      if (!v36)
      {
        -[UIView frame](self->_titleLabel, "frame");
        MinY = CGRectGetMinY(v94);
        -[UILabel font](self->_titleLabel, "font");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "lineHeight");
        v65 = v78;
        v69 = MinY + v37 * (v75 * 0.5) - v78 * 0.5;

        goto LABEL_63;
      }
      titleRestingHeight = height;
      if (v4)
        titleRestingHeight = self->_titleRestingHeight;
      v91.origin.y = rect;
      v91.origin.x = v82;
      v91.size.width = width;
      v91.size.height = height;
      MaxY = CGRectGetMaxY(v91);
      v65 = v78;
      v67 = (v78 + titleRestingHeight) * -0.5;
    }
    v69 = MaxY + v67;
LABEL_63:
    UIRoundToScale(v69, v84);
    -[UIView setFrame:](self->_accessoryView, "setFrame:", v51, v76, v80, v65);
  }
}

- (void)_enforceLayoutOrdering
{
  UIView *accessoryView;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  accessoryView = self->_accessoryView;
  v3[0] = self->_titleLabel;
  v3[1] = accessoryView;
  -[UIView _ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:](self->_contentView, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v3, 2, 0);
}

- (CGRect)_contentLayoutBoundsUsingRestingTitleHeight:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  -[UIView bounds](self->_contentView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v3)
  {
    -[_UINavigationBarLargeTitleViewLayout titleRestingHeight](self, "titleRestingHeight");
    v5 = v12;
  }
  if (v11 <= 0.0 || v5 <= 0.0)
  {
    v14 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v13 = 120;
    if ((*((_DWORD *)&self->_contentView->super._viewFlags + 4) & 0x80000) == 0)
      v13 = 104;
    v14 = v7 + *(double *)((char *)&self->super.isa + v13);
    v15 = v11 - (self->_layoutMargins.leading + self->_layoutMargins.trailing);
  }
  v16 = v9;
  result.size.height = v5;
  result.size.width = v15;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (double)titleRestingHeight
{
  return self->_titleRestingHeight;
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_layoutMargins.top;
  leading = self->_layoutMargins.leading;
  bottom = self->_layoutMargins.bottom;
  trailing = self->_layoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  UILabel *titleLabel;
  int64_t titleType;
  unint64_t twoLineMode;
  double titleRestingHeight;
  const __CFString *v9;
  void *v10;
  UIView *accessoryView;
  const __CFString *v12;
  const __CFString *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarLargeTitleViewLayout;
  -[_UINavigationBarLargeTitleViewLayout description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_contentView)
  {
    titleType = self->_titleType;
    titleLabel = self->_titleLabel;
    twoLineMode = self->_twoLineMode;
    titleRestingHeight = self->_titleRestingHeight;
    if (self->_providesExtraSpaceForExcessiveLineHeights)
      v9 = CFSTR(" usingExtendedLineHeight");
    else
      v9 = &stru_1E16EDF20;
    NSStringFromDirectionalEdgeInsets(self->_layoutMargins);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" label=%p type=%li twoLineMode=%li restingHeight=%.1f%@ layoutMargins=%@"), titleLabel, titleType, twoLineMode, *(_QWORD *)&titleRestingHeight, v9, v10);

    accessoryView = self->_accessoryView;
    if (accessoryView)
    {
      v12 = CFSTR("baseline");
      if (!self->_alignAccessoryViewToTitleBaseline)
        v12 = CFSTR("center");
      if (self->_accessoryViewHorizontalAlignment)
        v13 = CFSTR("title");
      else
        v13 = CFSTR("bar");
      objc_msgSend(v4, "appendFormat:", CFSTR(" accessoryView=%p verticalAlignment=%@ horizontalAlignment=%@"), accessoryView, v12, v13);
    }
    objc_msgSend(v4, "appendFormat:", CFSTR(" cachedRestingHeight=%.1f titleHeightCache=%p restingHeightCache=%p"), *(_QWORD *)&self->_cachedRestingHeight, self->_titleHeightCache, self->_restingHeightCache);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" invalid"));
  }
  return v4;
}

- (void)setContentView:(id)a3
{
  _UINavigationBarLargeTitleView *v4;

  if (self->_contentView != a3)
  {
    v4 = (_UINavigationBarLargeTitleView *)a3;
    -[_UINavigationBarLargeTitleViewLayout removeContent](self, "removeContent");
    self->_contentView = v4;
    -[UIView setNeedsLayout](v4, "setNeedsLayout");

  }
}

- (CGRect)_contentLayoutBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_UINavigationBarLargeTitleViewLayout _contentLayoutBoundsUsingRestingTitleHeight:](self, "_contentLayoutBoundsUsingRestingTitleHeight:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)layoutViewsWithOffsetSupportingMultiLineShrinkToFit:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4
{
  _BOOL4 v4;
  double vertical;
  double horizontal;
  double x;
  double y;
  double width;
  double height;
  int v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  UIView *accessoryView;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t accessoryViewHorizontalAlignment;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  unint64_t v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  UILabel *titleLabel;
  double MaxX;
  uint64_t v53;
  double MinX;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  _BOOL4 alignAccessoryViewToTitleBaseline;
  int has_internal_diagnostics;
  unint64_t v65;
  NSObject *v66;
  double MaxY;
  double v68;
  unint64_t v69;
  NSObject *v70;
  double titleRestingHeight;
  NSObject *v72;
  NSObject *v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  NSObject *v79;
  double MinY;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double rect;
  double v90;
  CGFloat v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  uint8_t buf[16];
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v4 = a4;
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UINavigationBarLargeTitleViewLayout _contentLayoutBoundsUsingRestingTitleHeight:](self, "_contentLayoutBoundsUsingRestingTitleHeight:");
  x = v95.origin.x;
  y = v95.origin.y;
  width = v95.size.width;
  height = v95.size.height;
  if (CGRectIsNull(v95))
    return;
  v91 = horizontal + x;
  rect = vertical + y;
  v12 = *((_DWORD *)&self->_contentView->super._viewFlags + 4);
  v13 = MEMORY[0x1E0C9D648];
  v14 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  accessoryView = self->_accessoryView;
  v18 = (double *)MEMORY[0x1E0C9D820];
  v88 = *MEMORY[0x1E0C9D648];
  if (!accessoryView)
  {
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
LABEL_17:
    v25 = v14;
    goto LABEL_18;
  }
  -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
  v21 = v20;
  v22 = v19;
  if (v20 == *v18 && v19 == v18[1])
    goto LABEL_17;
  accessoryViewHorizontalAlignment = self->_accessoryViewHorizontalAlignment;
  if (accessoryViewHorizontalAlignment)
    v25 = v14;
  else
    v25 = v91;
  if (!accessoryViewHorizontalAlignment && (v12 & 0x80000) == 0)
  {
    v96.origin.x = v91;
    v96.origin.y = rect;
    v96.size.width = width;
    v96.size.height = height;
    v25 = CGRectGetMaxX(v96) - v21;
  }
  v26 = -0.0;
  if ((*(_QWORD *)&v12 & 0x80000) != 0)
    v26 = v21;
  v91 = v91 + v26;
  width = width - v21;
LABEL_18:
  -[UIView traitCollection](self->_contentView, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayScale");
  v29 = v28;

  if (self->_titleType)
  {
    -[_UINavigationBarLargeTitleViewLayout _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:](self, "_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:", width);
    v15 = v31;
    if (self->_twoLineMode == 1)
      v16 = width;
    else
      v16 = v30;
  }
  v87 = *(double *)(v13 + 8);
  v32 = v15 == v18[1] && v16 == *v18;
  v90 = 1.0;
  if (!v32)
  {
    v85 = v21;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v35 = v29 * (v34 * 0.66);

    v36 = fmin((height - self->_titleRestingHeight) / v35 + 1.0, 1.1);
    if (v36 < 1.0)
      v36 = 1.0;
    v37 = v16 * v36 <= width || v16 <= 0.0;
    v38 = width / v16;
    if (v37)
      v38 = v36;
    v39 = v16 * 0.5 * v38;
    v86 = v22;
    v90 = v38;
    if ((v12 & 0x80000) != 0)
    {
      v97.origin.x = v91;
      v97.origin.y = rect;
      v97.size.width = width;
      v97.size.height = height;
      v40 = CGRectGetMaxX(v97) - v39;
    }
    else
    {
      v40 = v91 + v39;
    }
    UIRoundToScale(v40, v29);
    v42 = v41;
    if (self->_twoLineMode == 2)
    {
      UIRoundToScale(v15 * 0.5 + height - self->_cachedRestingHeight, v29);
      v44 = v43;
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v88, v87, v16, v15);
      -[UIView setCenter:](self->_titleLabel, "setCenter:", v42, v44);
      v21 = v85;
      v45 = v90;
    }
    else
    {
      v84 = v41;
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v72, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
        }

        v48 = v29;
      }
      else
      {
        v46 = _MergedGlobals_965;
        if (!_MergedGlobals_965)
        {
          v46 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v46, (unint64_t *)&_MergedGlobals_965);
        }
        v47 = *(NSObject **)(v46 + 8);
        v48 = v29;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
        }
      }
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v88, v87, v16, v15);
      -[UILabel _lastLineBaseline](self->_titleLabel, "_lastLineBaseline");
      v45 = v90;
      UIRoundToScale(height + -16.0 - v90 * (v49 + v15 * -0.5), v48);
      -[UIView setCenter:](self->_titleLabel, "setCenter:", v84, v50);
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v88, v87, v16, v15);
      v29 = v48;
      v21 = v85;
    }
    CGAffineTransformMakeScale(&v93, v45, v45);
    titleLabel = self->_titleLabel;
    v92 = v93;
    -[UIView setTransform:](titleLabel, "setTransform:", &v92);
    v22 = v86;
  }
  if (self->_accessoryView)
  {
    if (self->_accessoryViewHorizontalAlignment != 1)
      goto LABEL_57;
    if (v32)
    {
      if ((v12 & 0x80000) != 0)
      {
        v98.origin.x = v91;
        v98.origin.y = rect;
        v98.size.width = width;
        v98.size.height = height;
        MaxX = CGRectGetMaxX(v98);
LABEL_53:
        v25 = MaxX - v21;
        goto LABEL_57;
      }
      v99.origin.x = v91;
      v99.origin.y = rect;
      v99.size.width = width;
      v99.size.height = height;
      MinX = CGRectGetMinX(v99);
    }
    else
    {
      -[UIView frame](self->_titleLabel, "frame");
      if ((v12 & 0x80000) != 0)
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v53);
        goto LABEL_53;
      }
      MinX = CGRectGetMaxX(*(CGRect *)&v53);
    }
    v25 = MinX;
LABEL_57:
    if (self->_twoLineMode == 2)
    {
      -[UIView center](self->_titleLabel, "center");
      v59 = v58 + v22 * -0.5;
      -[UIView contentScaleFactor](self->_accessoryView, "contentScaleFactor");
      UIRoundToScale(v59, v60);
      v62 = v61;
LABEL_88:
      UIRoundToScale(v62, v29);
      -[UIView setFrame:](self->_accessoryView, "setFrame:", v25, v83, v21, v22);
      return;
    }
    alignAccessoryViewToTitleBaseline = self->_alignAccessoryViewToTitleBaseline;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (alignAccessoryViewToTitleBaseline)
    {
      if (has_internal_diagnostics)
      {
        __UIFaultDebugAssertLog();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v73, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
        }

        if (v32)
          goto LABEL_66;
      }
      else
      {
        v65 = qword_1ECD7CD90;
        if (!qword_1ECD7CD90)
        {
          v65 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v65, (unint64_t *)&qword_1ECD7CD90);
        }
        v66 = *(NSObject **)(v65 + 8);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v66, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
        }
        if (v32)
        {
LABEL_66:
          v100.origin.x = v91;
          v100.origin.y = rect;
          v100.size.width = width;
          v100.size.height = height;
          MaxY = CGRectGetMaxY(v100) - v22;
          v68 = -16.0;
LABEL_76:
          v62 = MaxY + v68;
          goto LABEL_88;
        }
      }
      -[UIView frame](self->_titleLabel, "frame");
      v74 = v29;
      v75 = v21;
      v76 = CGRectGetMaxY(v102) - v22;
      v103.origin.y = v87;
      v103.origin.x = v88;
      v103.size.width = v16;
      v103.size.height = v15;
      v77 = CGRectGetHeight(v103);
      -[UILabel _firstLineBaseline](self->_titleLabel, "_firstLineBaseline");
      v62 = v76 - v90 * (v77 - v78);
      v21 = v75;
      v29 = v74;
      goto LABEL_88;
    }
    if (has_internal_diagnostics)
    {
      __UIFaultDebugAssertLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v79, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
      }

      if (v32)
        goto LABEL_73;
    }
    else
    {
      v69 = qword_1ECD7CD98;
      if (!qword_1ECD7CD98)
      {
        v69 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v69, (unint64_t *)&qword_1ECD7CD98);
      }
      v70 = *(NSObject **)(v69 + 8);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
      }
      if (v32)
      {
LABEL_73:
        titleRestingHeight = height;
        if (v4)
          titleRestingHeight = self->_titleRestingHeight;
        v101.origin.x = v91;
        v101.origin.y = rect;
        v101.size.width = width;
        v101.size.height = height;
        MaxY = CGRectGetMaxY(v101);
        v68 = (v22 + titleRestingHeight) * -0.5;
        goto LABEL_76;
      }
    }
    -[UIView frame](self->_titleLabel, "frame");
    MinY = CGRectGetMinY(v104);
    -[UILabel font](self->_titleLabel, "font");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "lineHeight");
    v62 = MinY + v90 * (v82 * 0.5) - v22 * 0.5;

    goto LABEL_88;
  }
}

- (void)setContentAlpha:(double)a3
{
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  -[UIView setAlpha:](self->_accessoryView, "setAlpha:", a3);
}

- (void)setContentHidden:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[_UINavigationBarLargeTitleViewLayout setContentAlpha:](self, "setContentAlpha:", v3);
}

- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:(double)a3
{
  void *v5;
  uint64_t v6;
  UILabel *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t twoLineMode;
  unint64_t v20;
  NSObject *v21;
  UILabel *v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *titleHeightCache;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *restingHeightCache;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  _QWORD v45[2];
  uint8_t buf[16];
  CGSize result;

  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = self->_titleLabel;
  }
  else
  {
    -[_UINavigationBarLargeTitleView effectiveTitleAttributes](self->_contentView, "effectiveTitleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_twoLineMode == 2;
    -[UIView window](self->_contentView, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UINavigationBarLargeTitleViewLabelForMeasuring(v8, v9, v10);
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();

    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", -[UILabel numberOfLines](self->_titleLabel, "numberOfLines"));
  }
  v11 = a3 > 0.0 || -[UILabel numberOfLines](v7, "numberOfLines") == 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_titleHeightCache, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "CGSizeValue");
    v16 = v15;
    v18 = v17;
    goto LABEL_34;
  }
  v16 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v11)
  {
    if (a3 <= 0.0)
      a3 = 500.0;
    twoLineMode = self->_twoLineMode;
    switch(twoLineMode)
    {
      case 2uLL:
        v18 = 50.0;
        v16 = a3;
        break;
      case 1uLL:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v44, OS_LOG_TYPE_FAULT, "Shouldn’t get here", buf, 2u);
          }

        }
        else
        {
          v25 = qword_1ECD7CDA8;
          if (!qword_1ECD7CDA8)
          {
            v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v25, (unint64_t *)&qword_1ECD7CDA8);
          }
          v26 = *(NSObject **)(v25 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Shouldn’t get here", buf, 2u);
          }
        }
        v22 = v7;
        v23 = a3;
        v24 = 2;
        goto LABEL_28;
      case 0uLL:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v43, OS_LOG_TYPE_FAULT, "Shouldn’t get here", buf, 2u);
          }

        }
        else
        {
          v20 = qword_1ECD7CDA0;
          if (!qword_1ECD7CDA0)
          {
            v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v20, (unint64_t *)&qword_1ECD7CDA0);
          }
          v21 = *(NSObject **)(v20 + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Shouldn’t get here", buf, 2u);
          }
        }
        v22 = v7;
        v23 = a3;
        v24 = 1;
LABEL_28:
        -[UILabel textRectForBounds:limitedToNumberOfLines:](v22, "textRectForBounds:limitedToNumberOfLines:", v24, 0.0, 0.0, v23, 1.79769313e308);
        v16 = v27;
        v18 = v28;
        break;
    }
    if (self->_providesExtraSpaceForExcessiveLineHeights)
    {
      -[UILabel font](v7, "font");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _UINavigationBarExcessiveLineHeightOutsetsForFontInView((uint64_t)v29, v7);
      v31 = v30;

      v18 = v18 + v31;
    }
    if (!self->_titleHeightCache)
    {
      v32 = (NSMutableDictionary *)objc_opt_new();
      titleHeightCache = self->_titleHeightCache;
      self->_titleHeightCache = v32;

    }
    *(double *)v45 = v16;
    *(double *)&v45[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v45, "{CGSize=dd}");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleHeightCache, "setObject:forKeyedSubscript:", v34, v12);

  }
LABEL_34:
  -[NSMutableDictionary objectForKey:](self->_restingHeightCache, "objectForKey:", v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "doubleValue");
    self->_cachedRestingHeight = v37;
  }
  else
  {
    if (!self->_restingHeightCache)
    {
      v38 = (NSMutableDictionary *)objc_opt_new();
      restingHeightCache = self->_restingHeightCache;
      self->_restingHeightCache = v38;

    }
    self->_cachedRestingHeight = _UINavigationBarLargeTitleViewCalculateRestingHeight(v7, v18);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_restingHeightCache, "setObject:forKeyedSubscript:", v40, v12);

  }
  v41 = v16;
  v42 = v18;
  result.height = v42;
  result.width = v41;
  return result;
}

- (CGSize)sizeFittingSize:(CGSize)a3 titleType:(int64_t)a4
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[_UINavigationBarLargeTitleViewLayout _textHeightForSize:titleType:](self, "_textHeightForSize:titleType:", a4, a3.width, a3.height);
  v6 = v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)removeContent
{
  -[UIView removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self, "_invalidateTitleHeightCache");
}

- (_UINavigationBarLargeTitleView)contentView
{
  return self->_contentView;
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (BOOL)alignAccessoryViewToTitleBaseline
{
  return self->_alignAccessoryViewToTitleBaseline;
}

- (BOOL)providesExtraSpaceForExcessiveLineHeights
{
  return self->_providesExtraSpaceForExcessiveLineHeights;
}

- (unint64_t)accessoryViewHorizontalAlignment
{
  return self->_accessoryViewHorizontalAlignment;
}

- (BOOL)overlaysContentView
{
  return self->_overlaysContentView;
}

@end
