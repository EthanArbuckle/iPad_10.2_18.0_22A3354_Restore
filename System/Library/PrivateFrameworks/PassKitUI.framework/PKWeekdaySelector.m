@implementation PKWeekdaySelector

- (PKWeekdaySelector)init
{
  PKWeekdaySelector *v2;
  NSMutableSet *v3;
  NSMutableSet *selectedWeekdays;
  UIStackView *v5;
  UIStackView *stackView;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  PKCalendarDayLabelView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKWeekdaySelector;
  v2 = -[PKWeekdaySelector init](&v26, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    selectedWeekdays = v2->_selectedWeekdays;
    v2->_selectedWeekdays = v3;

    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v2->_stackView;
    v2->_stackView = v5;

    -[UIStackView setLayoutMarginsRelativeArrangement:](v2->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setDirectionalLayoutMargins:](v2->_stackView, "setDirectionalLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
    -[UIStackView setDistribution:](v2->_stackView, "setDistribution:", 1);
    -[UIStackView setAlignment:](v2->_stackView, "setAlignment:", 0);
    -[UIStackView setAxis:](v2->_stackView, "setAxis:", 0);
    -[PKWeekdaySelector addSubview:](v2, "addSubview:", v2->_stackView);
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "veryShortWeekdaySymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v21 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v21)
            objc_enumerationMutation(obj);
          v12 = -[PKCalendarDayLabelView initWithDayString:]([PKCalendarDayLabelView alloc], "initWithDayString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          -[UIStackView arrangedSubviews](v2->_stackView, "arrangedSubviews");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCalendarDayLabelView setTag:](v12, "setTag:", objc_msgSend(v13, "count") + 1);

          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v2, sel__weekdayTapped_);
          -[PKCalendarDayLabelView addGestureRecognizer:](v12, "addGestureRecognizer:", v14);
          objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "colorWithAlphaComponent:", 0.2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKCalendarDayLabelView setHighlightBackgroundColor:](v12, "setHighlightBackgroundColor:", v16);
          objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCalendarDayLabelView setHighlightTextColor:](v12, "setHighlightTextColor:", v17);

          -[PKCalendarDayLabelView setHighlightPadding:](v12, "setHighlightPadding:", 20.0);
          objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCalendarDayLabelView setDisabledTextColor:](v12, "setDisabledTextColor:", v18);

          -[UIStackView addArrangedSubview:](v2->_stackView, "addArrangedSubview:", v12);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

  }
  return v2;
}

- (void)_weekdayTapped:(id)a3
{
  int v4;
  void *v5;
  NSMutableSet *selectedWeekdays;
  id WeakRetained;
  void *v8;
  id v9;

  objc_msgSend(a3, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "isSelected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  selectedWeekdays = self->_selectedWeekdays;
  if (v4)
    -[NSMutableSet removeObject:](selectedWeekdays, "removeObject:", v5);
  else
    -[NSMutableSet addObject:](selectedWeekdays, "addObject:", v5);
  objc_msgSend(v9, "setSelected:", v4 ^ 1u);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableSet allObjects](self->_selectedWeekdays, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "weekdaySelector:didUpdateSelectedWeekdays:", self, v8);

}

- (void)setSelectedDays:(id)a3 possibleDays:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *selectedWeekdays;
  void *v10;
  NSMutableSet **p_possibleWeekdays;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = v6;
  v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
  selectedWeekdays = self->_selectedWeekdays;
  self->_selectedWeekdays = v8;

  if (v7)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
  else
    v10 = 0;
  p_possibleWeekdays = &self->_possibleWeekdays;
  objc_storeStrong((id *)&self->_possibleWeekdays, v10);
  if (v7)

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "tag"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSelected:", -[NSMutableSet containsObject:](self->_selectedWeekdays, "containsObject:", v18));
        if (*p_possibleWeekdays)
          v19 = -[NSMutableSet containsObject:](*p_possibleWeekdays, "containsObject:", v18);
        else
          v19 = 1;
        objc_msgSend(v17, "setUserInteractionEnabled:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableSet *possibleWeekdays;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector setUserInteractionEnabled:](&v18, sel_setUserInteractionEnabled_);
  -[UIStackView setUserInteractionEnabled:](self->_stackView, "setUserInteractionEnabled:", v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "tag"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        possibleWeekdays = self->_possibleWeekdays;
        if (possibleWeekdays)
          v13 = -[NSMutableSet containsObject:](possibleWeekdays, "containsObject:", v11);
        else
          v13 = 1;
        objc_msgSend(v10, "setUserInteractionEnabled:", v3 & v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  objc_super v8;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector setDirectionalLayoutMargins:](&v8, sel_setDirectionalLayoutMargins_);
  -[UIStackView setDirectionalLayoutMargins:](self->_stackView, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKWeekdaySelector setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector layoutSubviews](&v3, sel_layoutSubviews);
  -[PKWeekdaySelector bounds](self, "bounds");
  -[PKWeekdaySelector _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKWeekdaySelector _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.size.width;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeThatFits:", width, 1.79769313e308);
  v10 = v9;
  if (!a4)
  {
    -[UIStackView setFrame:](self->_stackView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, v9);
    -[UIStackView layoutSubviews](self->_stackView, "layoutSubviews");
  }

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (PKWeekdaySelectorDelegate)delegate
{
  return (PKWeekdaySelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_possibleWeekdays, 0);
  objc_storeStrong((id *)&self->_selectedWeekdays, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
