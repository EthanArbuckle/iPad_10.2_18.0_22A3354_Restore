@implementation _UICalendarWeekdayView

- (_UICalendarWeekdayView)initWithDataModel:(id)a3
{
  id v5;
  _UICalendarWeekdayView *v6;
  _UICalendarWeekdayView *v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICalendarWeekdayView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataModel, a3);
    -[_UICalendarWeekdayView _rebuildLabels](v7, "_rebuildLabels");
    -[UIView setPreservesSuperviewLayoutMargins:](v7, "setPreservesSuperviewLayoutMargins:", 1);
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v8, sel__updateFont);

  }
  return v7;
}

- (void)_updateFont
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)off_1E167DC78;
  -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarFontWithWeight((uint64_t)CFSTR("UICTFontTextStyleFootnote"), (uint64_t)v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerLinkedLabel setFont:](self->_sizingLabel, "setFont:", v6);
  -[UIView invalidateIntrinsicContentSize](self->_sizingLabel, "invalidateIntrinsicContentSize");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_labels;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setFont:", v6, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_rebuildLabels
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UICalendarWeekdayView *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  _UIDatePickerLinkedLabel *sizingLabel;
  void *v22;
  _UIDatePickerLinkedLabel *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSArray *labels;
  void *v42;
  void *v43;
  void *v44;
  _UICalendarWeekdayView *v45;
  _UIDatePickerLinkedLabel *v46;
  _QWORD aBlock[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v3 = self->_labels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v49 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v5);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UICalendarWeekdayView__rebuildLabels__block_invoke;
  aBlock[3] = &unk_1E16E3B18;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortStandaloneWeekdaySymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarMap(v10, v8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "veryShortStandaloneWeekdaySymbols");
  v45 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v8;
  _UICalendarMap(v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v45;
  -[UIView traitCollection](v45, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v15, "userInterfaceIdiom"));
  v16 = objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](v45, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(double *)off_1E167DC78;
  -[_UICalendarDataModel fontDesign](v45->_dataModel, "fontDesign");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarFontWithWeight((uint64_t)CFSTR("UICTFontTextStyleFootnote"), (uint64_t)v17, v19, v18);
  v20 = objc_claimAutoreleasedReturnValue();

  sizingLabel = v45->_sizingLabel;
  v42 = (void *)v16;
  v22 = (void *)v20;
  if (sizingLabel)
    v23 = sizingLabel;
  else
    v23 = (_UIDatePickerLinkedLabel *)objc_opt_new();
  v46 = v23;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v44);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabel setPossibleTitles:](v46, "setPossibleTitles:", v26);

  -[_UIDatePickerLinkedLabel setFont:](v46, "setFont:", v22);
  objc_storeStrong((id *)&v45->_sizingLabel, v46);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v44, "count"));
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v28 = v44;
  -[_UICalendarDataModel effectiveCalendar](v45->_dataModel, "effectiveCalendar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "firstWeekday");

  v31 = objc_msgSend(v44, "count");
  if (v31 >= 1)
  {
    v32 = v31;
    v33 = v30 - 1;
    v34 = v31;
    do
    {
      v35 = (void *)objc_opt_new();
      -[_UIDatePickerLinkedLabel storage](v46, "storage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setStorage:", v36);

      objc_msgSend(v35, "setFont:", v22);
      objc_msgSend(v28, "objectAtIndexedSubscript:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v37;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTitles:", v39);

      v14 = v45;
      objc_msgSend(v42, "weekdayLabelTextColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTextColor:", v40);

      v28 = v44;
      objc_msgSend(v35, "setTextAlignment:", 1);
      objc_msgSend(v35, "setBackgroundColor:", 0);
      -[NSArray addObject:](v27, "addObject:", v35);
      -[UIView addSubview:](v45, "addSubview:", v35);
      v33 = (v33 + 1) % v32;

      --v34;
    }
    while (v34);
  }
  labels = v14->_labels;
  v14->_labels = v27;

  v14->_flags.rebuildLabels = 0;
}

- (void)setPreferredLabelWidth:(double)a3
{
  self->_preferredLabelWidth = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setNeedsRebuildLabels
{
  self->_flags.rebuildLabels = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  _UIDatePickerLinkedLabel *sizingLabel;
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
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)_UICalendarWeekdayView;
  -[UIView layoutSubviews](&v44, sel_layoutSubviews);
  if (self->_flags.rebuildLabels)
    -[_UICalendarWeekdayView _rebuildLabels](self, "_rebuildLabels");
  -[UIView bounds](self, "bounds");
  if (v3 != 0.0)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UICalendarViewGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[NSArray count](self->_labels, "count");
    -[UIView bounds](self, "bounds");
    v8 = v7;
    -[UIView layoutMargins](self, "layoutMargins");
    v11 = v8 - (v9 + v10);
    v12 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v13 = (double)v6;
    UIRoundToViewScale(self);
    v15 = v14;
    sizingLabel = self->_sizingLabel;
    -[UIView bounds](self, "bounds");
    -[_UIDatePickerLinkedLabel sizeThatFits:](sizingLabel, "sizeThatFits:", v15, v17);
    v43 = v18;
    v20 = v19;
    -[_UICalendarWeekdayView preferredLabelWidth](self, "preferredLabelWidth");
    v42 = v21;
    objc_msgSend(v5, "dateViewCellSpacing");
    v22 = 0.0;
    if (v23 > 0.0)
    {
      objc_msgSend(v5, "dateViewCellSpacing");
      v22 = v24 * 0.5;
    }
    -[UIView layoutMargins](self, "layoutMargins");
    v26 = v25;
    -[UIView layoutMargins](self, "layoutMargins");
    v28 = v27;
    -[UIView bounds](self, "bounds");
    v30 = v29;
    -[UIView bounds](self, "bounds");
    v32 = v6 - 1;
    if (v6 >= 1)
    {
      v33 = 0;
      v34 = fmax(v42, fmin(v43, v15));
      v35 = (v11 - v34 * v13) / (double)(v6 - 1) * 0.5;
      v36 = v22 + fmax(v26 - v35, 0.0);
      v37 = (v30 - v36 - (v22 + fmax(v28 - v35, 0.0))) / v13;
      v38 = v31 * 0.5;
      v39 = v36 + v37 * 0.5;
      do
      {
        if (v12)
          v40 = v32;
        else
          v40 = v33;
        -[NSArray objectAtIndex:](self->_labels, "objectAtIndex:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setBounds:", 0.0, 0.0, v34, v20);
        objc_msgSend(v41, "setCenter:", v39, v38);
        v39 = v37 + v39;

        ++v33;
        --v32;
      }
      while (v32 != -1);
    }

  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (double)-[NSArray count](self->_labels, "count");
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_sizingLabel, "sizeThatFits:", width / v6, height);
  v8 = v7;
  v10 = v9 * v6;
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v11, "userInterfaceIdiom"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "weekdayViewMinimumHeight");
  v14 = fmax(v8, v13);

  v15 = fmax(v10, width);
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (_UICalendarDataModel)dataModel
{
  return self->_dataModel;
}

- (_UIDatePickerLinkedLabel)sizingLabel
{
  return self->_sizingLabel;
}

- (double)preferredLabelWidth
{
  return self->_preferredLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
