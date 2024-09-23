@implementation _UICalendarDateViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_UICalendarDateViewCell)initWithFrame:(CGRect)a3
{
  _UICalendarDateViewCell *v3;
  _UICalendarDateViewCell *v4;
  UIPointerInteraction *v5;
  uint64_t v6;
  UIView *labelContentView;
  void *v8;
  uint64_t v9;
  UIVisualEffectView *backgroundView;
  void *v11;
  uint64_t v12;
  UIView *decorationContentView;
  void *v14;
  uint64_t v15;
  UILabel *dayLabel;
  void *v17;
  id v18;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)_UICalendarDateViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UICollectionViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v3, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
    -[UICollectionViewCell setAutomaticallyUpdatesContentConfiguration:](v4, "setAutomaticallyUpdatesContentConfiguration:", 0);
    v5 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v4);
    -[UIView addInteraction:](v4, "addInteraction:", v5);
    objc_storeStrong((id *)&v4->_pointerInteraction, v5);
    v6 = objc_opt_new();
    labelContentView = v4->_labelContentView;
    v4->_labelContentView = (UIView *)v6;

    -[UICollectionViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_labelContentView);

    v9 = objc_opt_new();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIVisualEffectView *)v9;

    -[UIView layer](v4->_backgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);

    -[UIView addSubview:](v4->_labelContentView, "addSubview:", v4->_backgroundView);
    v12 = objc_opt_new();
    decorationContentView = v4->_decorationContentView;
    v4->_decorationContentView = (UIView *)v12;

    -[UIView setClipsToBounds:](v4->_decorationContentView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v4->_decorationContentView, "setUserInteractionEnabled:", 0);
    -[UICollectionViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_decorationContentView);

    v15 = objc_opt_new();
    dayLabel = v4->_dayLabel;
    v4->_dayLabel = (UILabel *)v15;

    -[UILabel setTextAlignment:](v4->_dayLabel, "setTextAlignment:", 1);
    -[UIView addSubview:](v4->_labelContentView, "addSubview:", v4->_dayLabel);
    -[_UICalendarDateViewCell _updateForPreferredContentSizeCategoryChange](v4, "_updateForPreferredContentSizeCategoryChange");
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v17, sel__updateForPreferredContentSizeCategoryChange);

  }
  return v4;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  BOOL v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  NSArray *decorations;
  NSArray *v13;
  _QWORD *v14;
  NSArray *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  CGFloat v24;
  double height;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t j;
  void *v34;
  CGFloat v35;
  double v36;
  UILabel *dayLabel;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  unint64_t *p_selectionRoundedEdge;
  unint64_t selectionRoundedEdge;
  double v48;
  double v49;
  double v50;
  double v51;
  UIVisualEffectView **p_backgroundView;
  uint64_t v53;
  void *v54;
  double v55;
  CGSize v56;
  CGPoint v57;
  _BOOL4 v58;
  _QWORD v59[2];
  id (*v60)(uint64_t, void *);
  void *v61;
  uint64_t *v62;
  CGPoint origin;
  CGSize size;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  CGRect slice;
  CGRect remainder;
  objc_super v71;
  CGRect v72;
  __int128 v73;
  __int128 v74;
  CGRect v75;
  uint64_t v76;
  CGRect v77;

  v76 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)_UICalendarDateViewCell;
  -[UICollectionViewCell layoutSubviews](&v71, sel_layoutSubviews);
  v3 = (*(_BYTE *)&self->_flags & 0x10) != 0 || self->_selectionRoundedEdge != 3;
  v58 = v3;
  v4 = self->_decorations == 0;
  -[UIView bounds](self, "bounds");
  remainder.origin.x = v5;
  remainder.origin.y = v6;
  remainder.size.width = v7;
  remainder.size.height = v8;
  if (!v4)
  {
    v56 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v57 = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v56;
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICalendarViewDecoration _referenceHeightForTraitCollection:](UICalendarViewDecoration, "_referenceHeightForTraitCollection:", v9);
    v11 = v10;

    CGRectDivide(remainder, &slice, &remainder, v11 + 2.0, CGRectMaxYEdge);
    v77 = CGRectInset(slice, 2.0, 0.0);
    -[UIView setFrame:](self->_decorationContentView, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    if (-[NSArray count](self->_decorations, "count"))
    {
      v67 = 0x2020000000;
      v59[1] = 3221225472;
      origin = slice.origin;
      v65 = 0;
      v66 = (double *)&v65;
      decorations = self->_decorations;
      v68 = 0;
      v59[0] = MEMORY[0x1E0C809B0];
      v60 = __41___UICalendarDateViewCell_layoutSubviews__block_invoke;
      v61 = &unk_1E16E8000;
      size = slice.size;
      v62 = &v65;
      v13 = decorations;
      v14 = v59;
      v15 = v13;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      memset(&v72, 0, sizeof(v72));
      v17 = v15;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v72, &v75, 16);
      if (v18)
      {
        v19 = **(_QWORD **)&v72.size.width;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (**(_QWORD **)&v72.size.width != v19)
              objc_enumerationMutation(v17);
            v60((uint64_t)v14, *(void **)(*(_QWORD *)&v72.origin.y + 8 * i));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v16, "addObject:", v21);

          }
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v72, &v75, 16);
        }
        while (v18);
      }

      v22 = (void *)objc_msgSend(v16, "copy");
      v23 = objc_msgSend(v22, "count");
      v24 = (double)(unint64_t)(v23 - 1) + (double)(unint64_t)(v23 - 1) + v66[3];
      v66[3] = v24;
      height = slice.size.height;
      -[UIView bounds](self->_decorationContentView, "bounds");
      v75.origin.x = v28 + (v26 - v24) * 0.5;
      v75.origin.y = v29 + (v27 - height) * 0.5;
      v75.size.width = v24;
      v75.size.height = height;
      v72.origin = v57;
      v72.size = v56;
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scale");
      v32 = v31;

      for (j = 0; j < objc_msgSend(v22, "count"); ++j)
      {
        objc_msgSend(v22, "objectAtIndex:", j);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bounds");
        CGRectDivide(v75, &v72, &v75, v35, CGRectMinXEdge);
        objc_msgSend(v34, "bounds");
        v72.size.height = v36;
        objc_msgSend(v34, "setFrame:", UIRectCenteredYInRectScale(v72.origin.x, v72.origin.y, v72.size.width, v36, v75.origin.x, v75.origin.y, v75.size.width, v75.size.height, v32));

      }
      _Block_object_dispose(&v65, 8);
    }
  }
  -[UIView setFrame:](self->_labelContentView, "setFrame:");
  dayLabel = self->_dayLabel;
  -[UIView bounds](self, "bounds");
  -[UILabel sizeThatFits:](dayLabel, "sizeThatFits:", v38, v39);
  -[UILabel setFrame:](self->_dayLabel, "setFrame:", remainder.origin.x + (remainder.size.width - v40) * 0.5, remainder.origin.y + (remainder.size.height - v41) * 0.5);
  -[UIView traitCollection](self, "traitCollection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v42, "userInterfaceIdiom"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "dateViewCellBackgroundSize");
  v45 = fmin(v44, fmin(remainder.size.width, remainder.size.height));
  p_selectionRoundedEdge = &self->_selectionRoundedEdge;
  selectionRoundedEdge = self->_selectionRoundedEdge;
  v48 = -0.0;
  if ((selectionRoundedEdge & 1) != 0)
    v49 = -0.0;
  else
    v49 = (remainder.size.width - v45) * 0.5;
  v50 = v45 + v49;
  v51 = 0.0;
  if ((selectionRoundedEdge & 1) == 0)
    v51 = (remainder.size.width - v45) * 0.5;
  if ((selectionRoundedEdge & 2) == 0)
    v48 = (remainder.size.width - v45) * 0.5;
  p_backgroundView = &self->_backgroundView;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", remainder.origin.x + (remainder.size.width - v45) * 0.5 - v51, remainder.origin.y + (remainder.size.height - v45) * 0.5, v48 + v50, v45);
  if ((*p_selectionRoundedEdge & 2) != 0)
    v53 = ((uint64_t)(*p_selectionRoundedEdge << 63) >> 63) & 5 | 0xA;
  else
    v53 = ((uint64_t)(*p_selectionRoundedEdge << 63) >> 63) & 5;
  -[UIView layer](*p_backgroundView, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setMaskedCorners:", v53);

  v55 = v45 * 0.5;
  if (v58)
    v55 = 10.0;
  -[UIVisualEffectView _setCornerRadius:](*p_backgroundView, "_setCornerRadius:", v55);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICalendarDateViewCell;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UICalendarDateViewCell _updateLabelColor](self, "_updateLabelColor");
}

- (void)configureWithDay:(id)a3 formatter:(id)a4 fontDesign:(id)a5 decorations:(id)a6 outOfRange:(BOOL)a7 renderOverhangDays:(BOOL)a8 highlightsToday:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  char flags;
  char v22;
  NSArray **p_decorations;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  _UICalendarDateViewCell *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  UIView *decorationContentView;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  id obj;
  id v49;
  _BOOL4 v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v9 = a8;
  v10 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v52 = a4;
  v51 = a5;
  v16 = a6;
  if (v10)
    v17 = 2;
  else
    v17 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v17;
  if (objc_msgSend(v15, "isToday"))
    v18 = 4;
  else
    v18 = 0;
  v19 = *(_BYTE *)&self->_flags & 0xFB | v18;
  *(_BYTE *)&self->_flags = v19;
  v50 = v9;
  if (v9)
  {
    objc_msgSend(v15, "assignedMonth");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | (v20 != 0);

    flags = (char)self->_flags;
  }
  else
  {
    flags = v19 & 0xFE;
  }
  if (a9)
    v22 = 8;
  else
    v22 = 0;
  *(_BYTE *)&self->_flags = flags & 0xF7 | v22;
  objc_storeStrong((id *)&self->_fontDesign, a5);
  p_decorations = &self->_decorations;
  if ((-[NSArray isEqual:](self->_decorations, "isEqual:", v16) & 1) == 0)
  {
    obj = a6;
    v49 = v15;
    -[_UICalendarDateViewCell calendarView](self, "calendarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "decorationSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = *p_decorations;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v58 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v31, "_parent");
          v32 = (_UICalendarDateViewCell *)objc_claimAutoreleasedReturnValue();

          if (v32 == self)
          {
            objc_msgSend(v25, "invalidateDecoration:", v31);
            objc_msgSend(v31, "_setParent:", 0);
          }
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v28);
    }

    objc_storeStrong((id *)p_decorations, obj);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v33 = *p_decorations;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    v15 = v49;
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v54 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(v25, "configureDecoration:", v38);
          objc_msgSend(v38, "_setParent:", self);
          decorationContentView = self->_decorationContentView;
          objc_msgSend(v38, "_decorationView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView addSubview:](decorationContentView, "addSubview:", v40);

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v35);
    }

  }
  objc_msgSend(v15, "assignedMonth");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    v42 = v50;
  else
    v42 = 1;

  if ((v42 & 1) != 0)
  {
    objc_msgSend(v15, "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v52;
    objc_msgSend(v52, "stringFromDate:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_dayLabel, "setText:", v45);

  }
  else
  {
    -[UILabel setText:](self->_dayLabel, "setText:", 0);
    v44 = v52;
  }
  -[UIView setHidden:](self->_decorationContentView, "setHidden:", v42 ^ 1);
  if (v50)
  {
    objc_msgSend(v15, "assignedMonth");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0.25;
    if (!v46)
      v47 = 1.0;
    -[UIView setAlpha:](self->_decorationContentView, "setAlpha:", v47);

  }
  else
  {
    -[UIView setAlpha:](self->_decorationContentView, "setAlpha:", 1.0);
  }
  -[UIPointerInteraction setEnabled:](self->_pointerInteraction, "setEnabled:", v42);
  -[_UICalendarDateViewCell _updateFontDesign](self, "_updateFontDesign");
  -[_UICalendarDateViewCell _updateLabelColor](self, "_updateLabelColor");
  -[_UICalendarDateViewCell _updateBackgroundView](self, "_updateBackgroundView");
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICalendarDateViewCell;
  -[UICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[_UICalendarDateViewCell _updateFontDesign](self, "_updateFontDesign");
  -[_UICalendarDateViewCell _updateLabelColor](self, "_updateLabelColor");
  -[_UICalendarDateViewCell _updateBackgroundView](self, "_updateBackgroundView");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  void *v11;
  _QWORD v12[5];
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UICalendarDateViewCell;
  -[UICollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  -[_UICalendarDateViewCell _updateFontDesign](self, "_updateFontDesign");
  -[_UICalendarDateViewCell _updateLabelColor](self, "_updateLabelColor");
  -[_UICalendarDateViewCell _updateBackgroundView](self, "_updateBackgroundView");
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42___UICalendarDateViewCell_setHighlighted___block_invoke;
    v12[3] = &unk_1E16B1B50;
    v7 = &v13;
    v12[4] = self;
    v13 = v6;
    v8 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v12, 0, 0.1, 0.0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42___UICalendarDateViewCell_setHighlighted___block_invoke_2;
    v10[3] = &unk_1E16B1B50;
    v7 = &v11;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, 0, 0.7, 0.0, 0.7, 0.0);
  }

}

- (void)_updateLabelColor
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDateViewCell _currentCellState](self, "_currentCellState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateCellForegroundColorProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_dayLabel, "setTextColor:", v6);

}

- (void)_updateBackgroundView
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDateViewCell _currentCellState](self, "_currentCellState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_backgroundView, "setHidden:", objc_msgSend(v4, "isOutOfRange"));
  objc_msgSend(v8, "dateCellBackgroundColorProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_backgroundView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_updateFontDesign
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSString *fontDesign;
  void *v7;
  void *v8;
  id v9;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDateViewCell _currentCellState](self, "_currentCellState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateCellFontProvider");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  fontDesign = self->_fontDesign;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, NSString *, void *))v5)[2](v5, v4, fontDesign, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_dayLabel, "setFont:", v8);

}

- (void)_updateForPreferredContentSizeCategoryChange
{
  void *v3;
  char v4;
  NSString *category;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
    v4 = 16;
  else
    v4 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v4;
  -[_UICalendarDateViewCell _updateFontDesign](self, "_updateFontDesign");
  -[_UICalendarDateViewCell _updateBackgroundView](self, "_updateBackgroundView");

}

- (id)_currentCellState
{
  _UICalendarDateViewCellState *v3;
  void *v4;
  _UICalendarDateViewCellState *v5;

  v3 = [_UICalendarDateViewCellState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UICalendarDateViewCellState initWithTraits:](v3, "initWithTraits:", v4);

  -[_UICalendarDateViewCellState setOutOfRange:](v5, "setOutOfRange:", (*(_BYTE *)&self->_flags >> 1) & 1);
  -[_UICalendarDateViewCellState setOverhangMonth:](v5, "setOverhangMonth:", *(_BYTE *)&self->_flags & 1);
  -[_UICalendarDateViewCellState setHighlightsToday:](v5, "setHighlightsToday:", (*(_BYTE *)&self->_flags >> 3) & 1);
  -[_UICalendarDateViewCellState setToday:](v5, "setToday:", (*(_BYTE *)&self->_flags >> 2) & 1);
  -[_UICalendarDateViewCellState setSelected:](v5, "setSelected:", -[UICollectionViewCell isSelected](self, "isSelected"));
  -[_UICalendarDateViewCellState setHighlighted:](v5, "setHighlighted:", -[UICollectionViewCell isHighlighted](self, "isHighlighted"));
  -[_UICalendarDateViewCellState setForceEmphasizedFont:](v5, "setForceEmphasizedFont:", 0);
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  UITargetedPreview *v18;
  _BOOL4 v19;
  __objc2_class **v20;
  void *v21;
  UIView *labelContentView;
  void *v23;
  void *v24;
  void *v25;

  -[UIView bounds](self->_backgroundView, "bounds", a3, a4);
  v6 = v5;
  -[UIView bounds](self->_labelContentView, "bounds");
  v9 = v8 + (v7 - v6) * 0.5;
  v12 = v11 + (v10 - v6) * 0.5;
  -[UIVisualEffectView _cornerRadius](self->_backgroundView, "_cornerRadius");
  v14 = v13;
  v15 = (void *)objc_opt_new();
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v9, v12, v6, v6, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowPath:", v16);

  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v17);

  v18 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self->_labelContentView, v15);
  v19 = -[UICollectionViewCell isSelected](self, "isSelected");
  v20 = off_1E167B260;
  if (!v19)
    v20 = off_1E167B248;
  -[__objc2_class effectWithPreview:](*v20, "effectWithPreview:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  labelContentView = self->_labelContentView;
  -[UICollectionViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](labelContentView, "convertRect:toView:", v23, v9, v12, v6, v6);
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (unint64_t)selectionRoundedEdge
{
  return self->_selectionRoundedEdge;
}

- (void)setSelectionRoundedEdge:(unint64_t)a3
{
  self->_selectionRoundedEdge = a3;
}

- (UICalendarView)calendarView
{
  return (UICalendarView *)objc_loadWeakRetained((id *)&self->_calendarView);
}

- (void)setCalendarView:(id)a3
{
  objc_storeWeak((id *)&self->_calendarView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_calendarView);
  objc_storeStrong((id *)&self->_labelContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_decorationContentView, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
}

@end
