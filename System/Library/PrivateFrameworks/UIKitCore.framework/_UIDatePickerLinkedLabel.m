@implementation _UIDatePickerLinkedLabel

- (_UIDatePickerLinkedLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIDatePickerLinkedLabel *v7;
  _UIDatePickerLinkedLabel *v8;
  NSArray *titles;
  UILabel *v10;
  UILabel *renderingLabel;
  uint64_t v12;
  UILayoutGuide *contentLayoutGuide;
  void *v14;
  uint64_t v15;
  NSMapTable *longestPossibleTitle;
  uint64_t v17;
  NSMapTable *longestPossibleWidth;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSLayoutConstraint *renderLabelXConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
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
  objc_super v52;
  _QWORD v53[2];
  _QWORD v54[11];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v54[9] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)_UIDatePickerLinkedLabel;
  v7 = -[UIView initWithFrame:](&v52, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    titles = v7->_titles;
    v7->_titles = (NSArray *)MEMORY[0x1E0C9AA60];

    v10 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", x, y, width, height);
    renderingLabel = v8->_renderingLabel;
    v8->_renderingLabel = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_renderingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v8, "addSubview:", v8->_renderingLabel);
    v12 = objc_opt_new();
    contentLayoutGuide = v8->_contentLayoutGuide;
    v8->_contentLayoutGuide = (UILayoutGuide *)v12;

    -[UIView addLayoutGuide:](v8, "addLayoutGuide:", v8->_contentLayoutGuide);
    v14 = (void *)objc_opt_new();
    -[_UIDatePickerLinkedLabel setStorage:](v8, "setStorage:", v14);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    longestPossibleTitle = v8->_longestPossibleTitle;
    v8->_longestPossibleTitle = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    longestPossibleWidth = v8->_longestPossibleWidth;
    v8->_longestPossibleWidth = (NSMapTable *)v17;

    v19 = -[_UIDatePickerLinkedLabel textAlignment](v8, "textAlignment") - 1;
    if (v19 > 3)
      v20 = 1;
    else
      v20 = qword_18667C720[v19];
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8->_renderingLabel, v20, 0, v8, v20, 1.0, 0.0);
    v21 = objc_claimAutoreleasedReturnValue();
    renderLabelXConstraint = v8->_renderLabelXConstraint;
    v8->_renderLabelXConstraint = (NSLayoutConstraint *)v21;

    v42 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v8->_renderingLabel, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v8, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v49;
    -[UIView bottomAnchor](v8->_renderingLabel, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v8, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v46;
    -[UIView leadingAnchor](v8->_renderingLabel, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v43;
    -[UIView trailingAnchor](v8->_renderingLabel, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v8, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v39;
    v54[4] = v8->_renderLabelXConstraint;
    -[UILayoutGuide topAnchor](v8->_contentLayoutGuide, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v8->_renderingLabel, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v36;
    -[UILayoutGuide leadingAnchor](v8->_contentLayoutGuide, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v8->_renderingLabel, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v24;
    -[UILayoutGuide bottomAnchor](v8->_contentLayoutGuide, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v8->_renderingLabel, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[7] = v27;
    -[UILayoutGuide trailingAnchor](v8->_contentLayoutGuide, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v8->_renderingLabel, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[8] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v31);

    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[UIView registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v32, sel__preferredContentSizeCategoryDidChange);

  }
  return v8;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  void *v4;
  _UIDatePickerLinkedLabelStorage *storage;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[_UIDatePickerLinkedLabel _longestPossibleTitleForPriority:width:](self, "_longestPossibleTitleForPriority:width:", -[_UIDatePickerLinkedLabel _renderPriorityForContainerWidth:initialPriority:](self, "_renderPriorityForContainerWidth:initialPriority:", 0, a3.width, a3.height), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  storage = self->_storage;
  -[UILabel font](self->_renderingLabel, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabel overrideAttributes](self, "overrideAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabelStorage _sizeForText:font:height:overrideAttributes:](storage, "_sizeForText:font:height:overrideAttributes:", v4, v6, v7, INFINITY);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UIDatePickerLinkedLabel _storageSyncIfNecessaryWithContainerSize:](self, "_storageSyncIfNecessaryWithContainerSize:", v3, v4);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (self->_lastSize.width == width && self->_lastSize.height == height)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    self->_lastSize.width = width;
    self->_lastSize.height = height;
    -[_UIDatePickerLinkedLabelStorage _resetPriority](self->_storage, "_resetPriority");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (self->_lastSize.width == width && self->_lastSize.height == height)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    self->_lastSize.width = width;
    self->_lastSize.height = height;
    -[_UIDatePickerLinkedLabelStorage _resetPriority](self->_storage, "_resetPriority");
  }
}

- (void)_preferredContentSizeCategoryDidChange
{
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[_UIDatePickerLinkedLabel _invalidatePossibleTitleCaches](self, "_invalidatePossibleTitleCaches");
  -[_UIDatePickerLinkedLabelStorage _resetPriority](self->_storage, "_resetPriority");
}

- (void)_updateAlignmentConstraint
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *renderLabelXConstraint;
  NSLayoutConstraint *v11;

  v3 = -[_UIDatePickerLinkedLabel textAlignment](self, "textAlignment");
  if ((unint64_t)(v3 - 1) > 3)
    v4 = 1;
  else
    v4 = qword_18667C720[v3 - 1];
  v5 = (void *)MEMORY[0x1E0D156E0];
  v11 = self->_renderLabelXConstraint;
  -[NSLayoutConstraint firstItem](v11, "firstItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSLayoutConstraint relation](v11, "relation");
  -[NSLayoutConstraint secondItem](v11, "secondItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, v4, v7, v8, v4, 1.0, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  renderLabelXConstraint = self->_renderLabelXConstraint;
  self->_renderLabelXConstraint = v9;

  -[NSLayoutConstraint setActive:](v11, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_renderLabelXConstraint, "setActive:", 1);

}

- (void)setStorage:(id)a3
{
  _UIDatePickerLinkedLabelStorage *v6;
  _UIDatePickerLinkedLabelStorage *storage;
  void *v8;
  _UIDatePickerLinkedLabelStorage *v9;

  v6 = (_UIDatePickerLinkedLabelStorage *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerLinkedLabel.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

    v6 = 0;
  }
  storage = self->_storage;
  if (storage != v6)
  {
    v9 = v6;
    -[_UIDatePickerLinkedLabelStorage _detachLabel:](storage, "_detachLabel:", self);
    objc_storeStrong((id *)&self->_storage, a3);
    -[_UIDatePickerLinkedLabelStorage _attachLabel:](v9, "_attachLabel:", self);
    v6 = v9;
  }

}

- (void)_setNeedsStorageSync
{
  *(_BYTE *)&self->_flags |= 1u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_storageSyncIfNecessaryWithContainerSize:(CGSize)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[_UIDatePickerLinkedLabel _storageSyncWithContainerSize:](self, "_storageSyncWithContainerSize:", a3.width, a3.height);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UIDatePickerLinkedLabel _setNeedsStorageSync](self, "_setNeedsStorageSync");
}

- (void)_storageSyncWithContainerSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  height = a3.height;
  width = a3.width;
  -[UIView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_7;
  }
  -[UIView bounds](self, "bounds");
  if (width != v8 || height != v7)
  {
LABEL_7:
    *(_BYTE *)&self->_flags &= ~1u;
    v10 = -[_UIDatePickerLinkedLabel _renderPriorityForContainerWidth:initialPriority:](self, "_renderPriorityForContainerWidth:initialPriority:", -[_UIDatePickerLinkedLabelStorage _currentPriority](self->_storage, "_currentPriority"), width);
    -[_UIDatePickerLinkedLabelStorage _setPriority:label:](self->_storage, "_setPriority:label:", v10, self);
    if (-[NSArray count](self->_titles, "count") <= v10)
    {
      v17 = 0;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", v10);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[_UIDatePickerLinkedLabel font](self, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerLinkedLabel overrideAttributes](self, "overrideAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIAttributedTitleForTitle(v17, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_renderingLabel, "setAttributedText:", v13);

    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "userInterfaceIdiom") == 6)
    {
      -[_UIDatePickerLinkedLabel overrideAttributes](self, "overrideAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *(_QWORD *)off_1E1678D98);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_14:
        -[UIView layoutIfNeeded](self->_renderingLabel, "layoutIfNeeded");
        -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

        return;
      }
      -[UILabel textColor](self->_renderingLabel, "textColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_renderingLabel, "setTextColor:", v14);
    }

    goto LABEL_14;
  }
}

- (int64_t)_renderPriorityForContainerWidth:(double)a3 initialPriority:(int64_t)a4
{
  NSUInteger v7;
  int64_t v8;
  id v9;
  double v11;

  v7 = -[NSArray count](self->_titles, "count");
  v8 = v7 - 1;
  if (v7 - 1 < a4)
    a4 = v7 - 1;
  while (v8 != a4)
  {
    v11 = 0.0;
    v9 = -[_UIDatePickerLinkedLabel _longestPossibleTitleForPriority:width:](self, "_longestPossibleTitleForPriority:width:", a4++, &v11);
    if (v11 <= a3)
      return a4 - 1;
  }
  return v8;
}

- (void)_invalidatePossibleTitleCaches
{
  -[NSMapTable removeAllObjects](self->_longestPossibleTitle, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_longestPossibleWidth, "removeAllObjects");
}

- (void)setTitles:(id)a3
{
  NSArray *v4;
  NSArray *titles;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  titles = self->_titles;
  self->_titles = v4;

  -[_UIDatePickerLinkedLabel _invalidatePossibleTitleCaches](self, "_invalidatePossibleTitleCaches");
  -[_UIDatePickerLinkedLabelStorage _resetPriority](self->_storage, "_resetPriority");
}

- (void)setPossibleTitles:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_possibleTitles, a3);
  v5 = a3;
  -[_UIDatePickerLinkedLabel _invalidatePossibleTitleCaches](self, "_invalidatePossibleTitleCaches");
  -[_UIDatePickerLinkedLabelStorage _resetPriority](self->_storage, "_resetPriority");

}

- (id)_longestPossibleTitleForPriority:(unint64_t)a3 width:(double *)a4
{
  NSMapTable *longestPossibleTitle;
  void *v8;
  void *v9;
  NSMapTable *longestPossibleWidth;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  void *v25;
  _UIDatePickerLinkedLabelStorage *storage;
  void *v27;
  double Height;
  void *v29;
  double v30;
  double v31;
  __CFString *v32;
  NSMapTable *v33;
  void *v34;
  NSMapTable *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  double *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;

  v47 = *MEMORY[0x1E0C80C00];
  longestPossibleTitle = self->_longestPossibleTitle;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](longestPossibleTitle, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (a4)
    {
      longestPossibleWidth = self->_longestPossibleWidth;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](longestPossibleWidth, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      *(_QWORD *)a4 = v13;

    }
    v14 = v9;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    if (-[NSArray count](self->_possibleTitles, "count") > a3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_possibleTitles, "objectAtIndexedSubscript:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v17);

    }
    if (-[NSArray count](self->_titles, "count") > a3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_titles, "objectAtIndexedSubscript:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v15;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v40 = a4;
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v43;
      v23 = 0.0;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          storage = self->_storage;
          -[UILabel font](self->_renderingLabel, "font");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView bounds](self, "bounds");
          Height = CGRectGetHeight(v48);
          -[_UIDatePickerLinkedLabel overrideAttributes](self, "overrideAttributes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDatePickerLinkedLabelStorage _sizeForText:font:height:overrideAttributes:](storage, "_sizeForText:font:height:overrideAttributes:", v25, v27, v29, Height);
          v31 = v30;

          if (v31 > v23)
          {
            v32 = v25;

            v21 = v32;
            v23 = v31;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
      v23 = 0.0;
    }

    v33 = self->_longestPossibleTitle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v33, "setObject:forKey:", v21, v34);

    v35 = self->_longestPossibleWidth;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v35, "setObject:forKey:", v36, v37);

    if (v40)
      *v40 = v23;
    v38 = &stru_1E16EDF20;
    if (v21)
      v38 = v21;
    v14 = v38;

    v9 = 0;
  }

  return v14;
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_renderingLabel, "setFont:", a3);
  -[_UIDatePickerLinkedLabel _invalidatePossibleTitleCaches](self, "_invalidatePossibleTitleCaches");
}

- (UIFont)font
{
  return -[UILabel font](self->_renderingLabel, "font");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_renderingLabel, "setAdjustsFontSizeToFitWidth:", a3);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_renderingLabel, "adjustsFontSizeToFitWidth");
}

- (void)setMinimumScaleFactor:(double)a3
{
  -[UILabel setMinimumScaleFactor:](self->_renderingLabel, "setMinimumScaleFactor:", a3);
}

- (double)minimumScaleFactor
{
  double result;

  -[UILabel minimumScaleFactor](self->_renderingLabel, "minimumScaleFactor");
  return result;
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_renderingLabel, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_renderingLabel, "textColor");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_renderingLabel, "setTextAlignment:", a3);
  -[_UIDatePickerLinkedLabel _updateAlignmentConstraint](self, "_updateAlignmentConstraint");
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_renderingLabel, "textAlignment");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_renderingLabel, "setAdjustsFontForContentSizeCategory:", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_renderingLabel, "adjustsFontForContentSizeCategory");
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  -[UILabel _setTextColorFollowsTintColor:](self->_renderingLabel, "_setTextColorFollowsTintColor:", a3);
}

- (BOOL)textColorFollowsTintColor
{
  return -[UILabel _textColorFollowsTintColor](self->_renderingLabel, "_textColorFollowsTintColor");
}

- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4
{
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView setContentCompressionResistancePriority:forAxis:](&v8, sel_setContentCompressionResistancePriority_forAxis_);
  *(float *)&v7 = a3;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_renderingLabel, "setContentCompressionResistancePriority:forAxis:", a4, v7);
}

- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4
{
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerLinkedLabel;
  -[UIView setContentHuggingPriority:forAxis:](&v8, sel_setContentHuggingPriority_forAxis_);
  *(float *)&v7 = a3;
  -[UIView setContentHuggingPriority:forAxis:](self->_renderingLabel, "setContentHuggingPriority:forAxis:", a4, v7);
}

- (void)setOverrideAttributes:(id)a3
{
  double v4;
  double v5;

  objc_storeStrong((id *)&self->_overrideAttributes, a3);
  -[UIView bounds](self, "bounds");
  -[_UIDatePickerLinkedLabel _storageSyncWithContainerSize:](self, "_storageSyncWithContainerSize:", v4, v5);
}

- (_UIDatePickerLinkedLabelStorage)storage
{
  return self->_storage;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSArray)titles
{
  return self->_titles;
}

- (NSArray)possibleTitles
{
  return self->_possibleTitles;
}

- (NSDictionary)overrideAttributes
{
  return self->_overrideAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAttributes, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_renderLabelXConstraint, 0);
  objc_storeStrong((id *)&self->_longestPossibleWidth, 0);
  objc_storeStrong((id *)&self->_longestPossibleTitle, 0);
  objc_storeStrong((id *)&self->_renderingLabel, 0);
}

@end
