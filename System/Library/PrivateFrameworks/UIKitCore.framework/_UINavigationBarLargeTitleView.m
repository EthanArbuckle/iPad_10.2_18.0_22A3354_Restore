@implementation _UINavigationBarLargeTitleView

- (_UINavigationBarLargeTitleViewLayout)layout
{
  return self->_layout;
}

- (void)_updateContentAndInvalidate:(BOOL)a3
{
  _BOOL4 v3;
  _UINavigationBarLargeTitleViewLayout *layout;
  uint64_t v6;
  void *v7;
  id v8;
  _UINavigationBarLargeTitleViewLayout *v9;
  _UINavigationBarLargeTitleViewLayout *v10;
  _UINavigationBarLargeTitleViewLayout *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  objc_class *v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  -[UIView updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
  layout = self->_layout;
  if (!layout)
  {
    -[_UINavigationBarTransitionContext toLayout](self->_transitionContext, "toLayout");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && (v8 = *(id *)(v6 + 168)) != 0)
    {
      v9 = (_UINavigationBarLargeTitleViewLayout *)v8;
      v10 = v9;
    }
    else
    {
      v9 = -[_UINavigationBarLargeTitleView _newLayout](self, "_newLayout");
      v10 = 0;
    }
    v11 = self->_layout;
    self->_layout = v9;

    -[_UINavigationBarLargeTitleViewLayout setContentView:](self->_layout, "setContentView:", self);
    layout = self->_layout;
  }
  -[_UINavigationBarLargeTitleViewLayout setTitleType:](layout, "setTitleType:", self->_titleType);
  if (self->_titleType)
  {
    -[_UINavigationBarLargeTitleView _effectiveTitle](self, "_effectiveTitle");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
    v13 = -[__CFString length](v12, "length");
    v14 = CFSTR(" ");
    if (v13)
      v14 = v12;
    v15 = (objc_class *)MEMORY[0x1E0CB3498];
    v16 = v14;
    v17 = [v15 alloc];
    -[_UINavigationBarLargeTitleView effectiveTitleAttributes](self, "effectiveTitleAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v16, v18);

    -[_UINavigationBarLargeTitleViewLayout titleLabel](self->_layout, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v19);

    -[_UINavigationBarLargeTitleViewLayout setAccessoryView:](self->_layout, "setAccessoryView:", self->_accessoryView);
    -[_UINavigationBarLargeTitleViewLayout setAlignAccessoryViewToTitleBaseline:](self->_layout, "setAlignAccessoryViewToTitleBaseline:", self->_alignAccessoryViewToTitleBaseline);
    -[_UINavigationBarLargeTitleViewLayout setAccessoryViewHorizontalAlignment:](self->_layout, "setAccessoryViewHorizontalAlignment:", self->_accessoryViewHorizontalAlignment);
    -[_UINavigationBarLargeTitleViewLayout setTwoLineMode:](self->_layout, "setTwoLineMode:", self->_twoLineMode);
    -[_UINavigationBarLargeTitleViewLayout setProvidesExtraSpaceForExcessiveLineHeights:](self->_layout, "setProvidesExtraSpaceForExcessiveLineHeights:", self->_providesExtraSpaceForExcessiveLineHeights);
    -[_UINavigationBarLargeTitleViewLayout updateRestingTitleHeight](self->_layout, "updateRestingTitleHeight");

  }
  -[_UINavigationBarLargeTitleView _setAssistants](self, "_setAssistants");
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  -[_UINavigationBarLargeTitleViewLayout setLayoutMargins:](self->_layout, "setLayoutMargins:");
  if (v3)
  {
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setAssistants
{
  void *v3;
  _UINavigationBarLargeTitleView *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  -[_UINavigationBarLargeTitleViewLayout accessoryView](self->_layout, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = self;
  else
    v4 = 0;
  objc_msgSend(WeakRetained, "setAssistedView:identifier:", v4, CFSTR("LargeTitle.accessoryView"));

}

- (void)setTitleAttributes:(id)a3
{
  NSDictionary *effectiveTitleAttributes;
  id v6;

  v6 = a3;
  if ((-[NSDictionary isEqual:](self->_titleAttributes, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleAttributes, a3);
    effectiveTitleAttributes = self->_effectiveTitleAttributes;
    self->_effectiveTitleAttributes = 0;

    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
  }

}

- (void)updateContent
{
  -[_UINavigationBarLargeTitleView _updateContentAndInvalidate:](self, "_updateContentAndInvalidate:", 1);
}

- (void)setTwoLineMode:(unint64_t)a3
{
  self->_twoLineMode = a3;
}

- (void)setTitleType:(int64_t)a3
{
  if (self->_titleType != a3)
  {
    self->_titleType = a3;
    -[_UINavigationBarLargeTitleViewLayout setTitleType:](self->_layout, "setTitleType:");
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
  }
  -[_UINavigationBarLargeTitleViewLayout updateRestingTitleHeight](self->_layout, "updateRestingTitleHeight");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setTitle:(id)a3
{
  __CFString *v4;
  NSString *effectiveTitle;
  __CFString *v6;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_1E16EDF20;
  v6 = v4;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, v4);
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
    effectiveTitle = self->__effectiveTitle;
    self->__effectiveTitle = 0;

  }
}

- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3
{
  if (self->_providesExtraSpaceForExcessiveLineHeights != a3)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = a3;
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
  }
}

- (void)setAlternateTitles:(id)a3
{
  NSArray *v5;
  NSString *effectiveTitle;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_alternateTitles != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_alternateTitles, a3);
    -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
    effectiveTitle = self->__effectiveTitle;
    self->__effectiveTitle = 0;

    v5 = v7;
  }

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
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (id)_effectiveTitle
{
  NSString *effectiveTitle;
  NSString *v4;
  NSString *v5;

  effectiveTitle = self->__effectiveTitle;
  if (!effectiveTitle)
  {
    if (self->_alternateTitles)
    {
      -[_UINavigationBarLargeTitleView _titleForCurrentWidth](self, "_titleForCurrentWidth");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = self->_title;
    }
    v5 = self->__effectiveTitle;
    self->__effectiveTitle = v4;

    effectiveTitle = self->__effectiveTitle;
  }
  return effectiveTitle;
}

- (void)setAssistant:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    -[_UINavigationBarLargeTitleView _clearAssistants](self, "_clearAssistants");
    objc_storeWeak((id *)&self->_assistant, obj);
    -[_UINavigationBarLargeTitleView _setAssistants](self, "_setAssistants");
  }

}

- (_UINavigationBarLargeTitleView)initWithFrame:(CGRect)a3
{
  _UINavigationBarLargeTitleView *v3;
  _UINavigationBarLargeTitleView *v4;
  uint64_t v5;
  _UINavigationBarLargeTitleViewLayout *layout;
  NSString *title;
  NSDictionary *titleAttributes;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarLargeTitleView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[_UINavigationBarLargeTitleView _newLayout](v3, "_newLayout");
    layout = v4->_layout;
    v4->_layout = (_UINavigationBarLargeTitleViewLayout *)v5;

    title = v4->_title;
    v4->_title = (NSString *)&stru_1E16EDF20;

    titleAttributes = v4->_titleAttributes;
    v4->_titleAttributes = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v9, sel__contentSizeCategoryDidChange);

  }
  return v4;
}

- (id)_newLayout
{
  return -[_UINavigationBarLargeTitleViewLayout initWithContentView:]([_UINavigationBarLargeTitleViewLayout alloc], "initWithContentView:", self);
}

- (void)_clearAssistants
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  objc_msgSend(WeakRetained, "setAssistedView:identifier:", 0, CFSTR("LargeTitle.accessoryView"));

}

- (NSDictionary)effectiveTitleAttributes
{
  NSDictionary *effectiveTitleAttributes;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *titleAttributes;
  NSDictionary *v9;
  NSDictionary *v10;

  effectiveTitleAttributes = self->_effectiveTitleAttributes;
  if (!effectiveTitleAttributes)
  {
    v4 = *(_QWORD *)off_1E1678D90;
    -[NSDictionary objectForKeyedSubscript:](self->_titleAttributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    titleAttributes = self->_titleAttributes;
    if (v5 == v7)
    {
      v9 = titleAttributes;
    }
    else
    {
      v9 = (NSDictionary *)-[NSDictionary mutableCopy](titleAttributes, "mutableCopy");
      -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, v4);
    }
    v10 = self->_effectiveTitleAttributes;
    self->_effectiveTitleAttributes = v9;

    effectiveTitleAttributes = self->_effectiveTitleAttributes;
  }
  return effectiveTitleAttributes;
}

- (void)layoutSubviews
{
  void *v3;
  char v4;
  NSString *effectiveTitle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarLargeTitleView;
  -[UIView layoutSubviews](&v6, sel_layoutSubviews);
  if (self->_alternateTitles)
  {
    if (self->__effectiveTitle)
    {
      -[_UINavigationBarLargeTitleView _titleForCurrentWidth](self, "_titleForCurrentWidth");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqualToString:", self->__effectiveTitle);

      if ((v4 & 1) == 0)
      {
        effectiveTitle = self->__effectiveTitle;
        self->__effectiveTitle = 0;

        -[_UINavigationBarLargeTitleViewLayout _invalidateTitleHeightCache](self->_layout, "_invalidateTitleHeightCache");
        -[_UINavigationBarLargeTitleView _updateContentAndInvalidate:](self, "_updateContentAndInvalidate:", 0);
      }
    }
  }
  -[_UINavigationBarLargeTitleViewLayout layoutViews](self->_layout, "layoutViews");
}

- (double)restingHeightOfTitleView
{
  void *v2;
  double v3;
  double v4;

  -[_UINavigationBarLargeTitleView _layoutForMeasurement](self, "_layoutForMeasurement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleRestingHeight");
  v4 = v3;

  return v4;
}

- (id)_layoutForMeasurement
{
  _UINavigationBarLargeTitleViewLayout *layout;
  _UINavigationBarLargeTitleViewLayout *v3;
  _UINavigationBarTransitionContext *transitionContext;
  uint64_t v5;
  void *v6;
  void *v7;

  layout = self->_layout;
  if (layout)
  {
    v3 = layout;
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (transitionContext)
    {
      -[_UINavigationBarTransitionContext toLayout](transitionContext, "toLayout");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = *(void **)(v5 + 168);
      else
        v7 = 0;
      v3 = v7;

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_alternateTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_effectiveTitleAttributes, 0);
  objc_storeStrong((id *)&self->__effectiveTitle, 0);
  objc_storeStrong((id *)&self->_titleCandidates, 0);
}

- (void)safeAreaInsetsDidChange
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
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
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_UINavigationBarLargeTitleView;
  -[UIView safeAreaInsetsDidChange](&v20, sel_safeAreaInsetsDidChange);
  -[UIView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[_UINavigationBarLargeTitleViewLayout layoutMargins](self->_layout, "layoutMargins");
    if (v8 == v16 && v6 == v13 && v12 == v15)
    {
      v19 = v14;

      if (v10 == v19)
        return;
    }
    else
    {

    }
    -[_UINavigationBarLargeTitleView _updateContentAndInvalidate:](self, "_updateContentAndInvalidate:", 0);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)accessibilityTitleView
{
  return (UIView *)-[_UINavigationBarLargeTitleViewLayout titleLabel](self->_layout, "titleLabel");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self, "bounds");
  -[_UINavigationBarLargeTitleView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  v6 = -1.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 titleType:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UINavigationBarLargeTitleView _layoutForMeasurement](self, "_layoutForMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeFittingSize:titleType:", a4, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UINavigationBarLargeTitleView sizeThatFits:titleType:](self, "sizeThatFits:titleType:", self->_titleType, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_titleForCurrentWidth
{
  _UINavigationBarLargeTitleView *v2;
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *titleCandidates;
  UILabel *v10;
  UILabel *v11;
  unint64_t twoLineMode;
  double v13;
  void *v14;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  NSArray *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  NSArray *v39;
  double v40;
  void *v41;
  double v43;
  double v44;
  _UINavigationBarLargeTitleView *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v2 = self;
  v57 = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v58);
  -[UIView layoutMargins](v2, "layoutMargins");
  v5 = v4;
  -[UIView layoutMargins](v2, "layoutMargins");
  v7 = v6;
  -[UIView bounds](v2->_accessoryView, "bounds");
  v8 = CGRectGetWidth(v59);
  titleCandidates = v2->_titleCandidates;
  if (!titleCandidates)
  {
    v43 = v5;
    v44 = Width;
    v10 = objc_alloc_init(UILabel);
    v11 = v10;
    twoLineMode = v2->_twoLineMode;
    v13 = 0.0;
    if (twoLineMode <= 2)
    {
      v13 = dbl_1866793C8[twoLineMode];
      -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", qword_1866793B0[twoLineMode]);
    }
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "addObject:", v2->_title);
    objc_msgSend(v14, "addObjectsFromArray:", v2->_alternateTitles);
    v15 = (NSArray *)objc_opt_new();
    v45 = v2;
    -[_UINavigationBarLargeTitleView effectiveTitleAttributes](v2, "effectiveTitleAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v14;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v52 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v16);
          -[UILabel setAttributedText:](v11, "setAttributedText:", v22);

          -[UILabel textRectForBounds:limitedToNumberOfLines:](v11, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](v11, "numberOfLines"), 0.0, 0.0, 1.79769313e308, v13);
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v31 = (void *)objc_opt_new();
          objc_msgSend(v31, "setTitle:", v21);
          v60.origin.x = v24;
          v60.origin.y = v26;
          v60.size.width = v28;
          v60.size.height = v30;
          objc_msgSend(v31, "setWidth:", CGRectGetWidth(v60));
          -[NSArray addObject:](v15, "addObject:", v31);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v18);
    }

    v2 = v45;
    v32 = v45->_titleCandidates;
    v45->_titleCandidates = v15;

    titleCandidates = v45->_titleCandidates;
    v5 = v43;
    Width = v44;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = titleCandidates;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = Width - v5 - v7 - v8;
    v37 = *(_QWORD *)v48;
LABEL_14:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v37)
        objc_enumerationMutation(v33);
      v39 = *(NSArray **)(*((_QWORD *)&v47 + 1) + 8 * v38);
      -[NSArray width](v39, "width");
      if (v40 <= v36)
        break;
      if (v35 == ++v38)
      {
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v35)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:

    -[NSArray firstObject](v2->_titleCandidates, "firstObject");
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = v39;
  }
  -[NSArray title](v39, "title");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (void)_contentSizeCategoryDidChange
{
  NSDictionary *effectiveTitleAttributes;

  effectiveTitleAttributes = self->_effectiveTitleAttributes;
  self->_effectiveTitleAttributes = 0;

  -[_UINavigationBarLargeTitleView _updateContentAndInvalidate:](self, "_updateContentAndInvalidate:", 1);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UINavigationBarLargeTitleViewLayout accessoryView](self->_layout, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request:locationInView:", v8, v9);
    v11 = v10;
    v13 = v12;
    v14 = 0;
    if (!objc_msgSend(v9, "pointInside:withEvent:", 0))
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v9;
      if (!v15)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v9, "hitTest:withEvent:", 0, v11, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v16;

      if (!v15)
        goto LABEL_12;
    }
    if (objc_msgSend(v15, "isEnabled"))
    {
      objc_msgSend(v15, "bounds");
      objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v15, CFSTR("com.apple.UIKit.UINavigationBar.LargeTitleView.UIButton"), objc_msgSend(v15, "isSelected"), v17, v18, v19, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "createStyleForButton:shapeProvider:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillEnter:", v6);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerWillExit:", v6);

}

- (void)recordFromStateForTransition:(id)a3
{
  _UINavigationBarLargeTitleViewLayout *layout;
  _UINavigationBarTransitionContext *v5;
  id *v6;
  _UINavigationBarLargeTitleViewLayout *v7;

  layout = self->_layout;
  v5 = (_UINavigationBarTransitionContext *)a3;
  -[_UINavigationBarTransitionContext fromLayout](v5, "fromLayout");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarLayout setLargeTitleViewLayout:](v6, layout);

  self->_transitionContext = v5;
  v7 = self->_layout;
  self->_layout = 0;

  -[_UINavigationBarLargeTitleView _clearAssistants](self, "_clearAssistants");
}

- (void)prepareToRecordToState:(id)a3
{
  _UINavigationBarLargeTitleViewLayout *v4;
  _UINavigationBarLargeTitleViewLayout *layout;
  _UINavigationBarTransitionContext *v6;

  v6 = (_UINavigationBarTransitionContext *)a3;
  v4 = -[_UINavigationBarLargeTitleView _newLayout](self, "_newLayout");
  if (!self->_transitionContext)
    -[_UINavigationBarLargeTitleViewLayout removeContent](self->_layout, "removeContent");
  self->_transitionContext = v6;
  layout = self->_layout;
  self->_layout = v4;

}

- (void)recordToStateForTransition:(id)a3
{
  id v4;
  _UINavigationBarLargeTitleViewLayout *layout;
  id *v6;
  _UINavigationBarLargeTitleViewLayout *v7;

  v4 = a3;
  -[_UINavigationBarLargeTitleView updateContent](self, "updateContent");
  layout = self->_layout;
  objc_msgSend(v4, "toLayout");
  v6 = (id *)objc_claimAutoreleasedReturnValue();

  -[_UINavigationBarLayout setLargeTitleViewLayout:](v6, layout);
  v7 = self->_layout;
  self->_layout = 0;

}

- (void)clearTransitionContext
{
  _UINavigationBarLargeTitleViewLayout *v3;
  _UINavigationBarLargeTitleViewLayout *layout;

  if (self->_transitionContext)
  {
    if (!self->_layout)
    {
      v3 = -[_UINavigationBarLargeTitleViewLayout initWithContentView:]([_UINavigationBarLargeTitleViewLayout alloc], "initWithContentView:", self);
      layout = self->_layout;
      self->_layout = v3;

    }
    self->_transitionContext = 0;
  }
}

- (void)adoptLayout:(id)a3
{
  _UINavigationBarLargeTitleViewLayout *v6;
  _UINavigationBarLargeTitleViewLayout *layout;
  void *v8;
  _UINavigationBarLargeTitleViewLayout *v9;

  v6 = (_UINavigationBarLargeTitleViewLayout *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarLargeTitleView.m"), 445, CFSTR("Cannot adopt a nil layout!"));

    v6 = 0;
  }
  layout = self->_layout;
  if (layout != v6)
  {
    v9 = v6;
    -[_UINavigationBarLargeTitleViewLayout removeContent](layout, "removeContent");
    objc_storeStrong((id *)&self->_layout, a3);
    -[_UINavigationBarLargeTitleViewLayout setContentView:](self->_layout, "setContentView:", self);
    -[_UINavigationBarLargeTitleView _setAssistants](self, "_setAssistants");
    v6 = v9;
  }
  self->_transitionContext = 0;

}

- (void)adoptNewLayout
{
  _UINavigationBarLargeTitleViewLayout *v3;
  _UINavigationBarLargeTitleViewLayout *layout;

  if (!self->_layout)
  {
    v3 = -[_UINavigationBarLargeTitleView _newLayout](self, "_newLayout");
    layout = self->_layout;
    self->_layout = v3;

    -[_UINavigationBarLargeTitleView updateContent](self, "updateContent");
  }
}

- (_UIPointerInteractionAssistant)assistant
{
  return (_UIPointerInteractionAssistant *)objc_loadWeakRetained((id *)&self->_assistant);
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)alternateTitles
{
  return self->_alternateTitles;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (unint64_t)twoLineMode
{
  return self->_twoLineMode;
}

- (BOOL)providesExtraSpaceForExcessiveLineHeights
{
  return self->_providesExtraSpaceForExcessiveLineHeights;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)alignAccessoryViewToTitleBaseline
{
  return self->_alignAccessoryViewToTitleBaseline;
}

- (unint64_t)accessoryViewHorizontalAlignment
{
  return self->_accessoryViewHorizontalAlignment;
}

@end
