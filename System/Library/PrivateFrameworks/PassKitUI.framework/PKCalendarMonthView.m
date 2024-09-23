@implementation PKCalendarMonthView

- (PKCalendarMonthView)init
{
  PKCalendarMonthView *v2;
  PKCalendarMonthView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCalendarMonthView;
  v2 = -[PKCalendarMonthView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[PKCalendarMonthView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", 10.0);
    objc_msgSend(v4, "setMaskedCorners:", 15);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCalendarMonthView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[PKCalendarMonthView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCalendarMonthView;
  -[PKCalendarMonthView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCalendarMonthView bounds](self, "bounds");
  -[PKCalendarMonthView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCalendarMonthView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double y;
  double v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *headerView;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t i;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  NSUInteger v45;
  double v46;
  uint64_t v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v64;
  double v65;
  double v66;
  double x;
  double v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;
  CGSize result;

  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  v74 = *MEMORY[0x1E0C80C00];
  v7 = 0.0;
  if (-[NSArray count](self->_dayViews, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_dayViews, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "count");

  }
  v9 = -[NSArray count](self->_dayViews, "count");
  v10 = width + -16.0;
  PKFloatRoundToPixel();
  v12 = v11;
  if (-[NSArray count](self->_dayViews, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_dayViews, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[NSArray objectAtIndexedSubscript:](self->_dayViews, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "verticalMarginWithBounds:", x + 8.0, y + 0.0, v12, v12);
      v7 = v17;

    }
  }
  v18 = v7 + 0.0;
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  headerView = self->_headerView;
  v64 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v65 = *MEMORY[0x1E0C9D648];
  if (headerView)
  {
    v22 = v7;
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width + -32.0, 3.40282347e38);
    v24 = width;
    PKRectCenteredXInRect();
    v55 = v25;
    v57 = v26;
    v59 = v27;
    v61 = v28;
    v20 = v23;
    v7 = v22;
    v18 = v22 + v18 + v28;
  }
  else
  {
    v24 = width;
    v59 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v61 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v55 = *MEMORY[0x1E0C9D648];
    v57 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  }
  if (self->_headerSeparatorView)
  {
    PKUIPixelLength();
    v29 = v24;
    PKRectCenteredXInRect();
    v65 = v30;
    v66 = v31;
    v68 = v32;
    v64 = v33;
    v18 = v18 + v33;
  }
  else
  {
    v66 = v20;
    v68 = v19;
    v29 = v24;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v34 = self->_weekdayHeaders;
  v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v70;
    v38 = 0.0;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v70 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "sizeThatFits:", v10, 3.40282347e38, v55, v57, v59, *(_QWORD *)&v61);
        v38 = fmax(v38, v40);
      }
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v36);
  }
  else
  {
    v38 = 0.0;
  }
  v41 = (double)v9;

  v42 = v18 + v38;
  if (!a4)
  {
    if (-[NSArray count](self->_weekdayHeaders, "count"))
    {
      v43 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_weekdayHeaders, "objectAtIndexedSubscript:", v43, v55, v57, v59, *(_QWORD *)&v61);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setFrame:", (double)v43 * v12 + 8.0, v42, v12, v38);

        ++v43;
      }
      while (v43 < -[NSArray count](self->_weekdayHeaders, "count"));
    }
    v45 = -[NSArray count](self->_weekdayHeaders, "count", v55, v57, v59, *(_QWORD *)&v61);
    v46 = -0.0;
    if (v45)
      v46 = v7;
    v42 = v42 + v46;
    if (v9)
    {
      v47 = 0;
      v48 = 0.0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_dayViews, "objectAtIndexedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "count"))
        {
          v50 = 0;
          v51 = v7 + v42 + v48 * v12;
          do
          {
            objc_msgSend(v49, "objectAtIndexedSubscript:", v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setFrame:", (double)v50 * v12 + 8.0, v51, v12, v12);

            ++v50;
          }
          while (v50 < (unint64_t)objc_msgSend(v49, "count"));
        }

        v48 = (double)++v47;
      }
      while ((double)v47 < v41);
    }
    -[UIView setFrame:](self->_headerView, "setFrame:", v56, v58, v60, v62);
    -[UIView setFrame:](self->_headerSeparatorView, "setFrame:", v65, v68, v66, v64);
  }
  v53 = v7 + v12 * v41 + v7 + 10.0 + v42;
  v54 = v29;
  result.height = v53;
  result.width = v54;
  return result;
}

- (void)calendarDayViewTapped:(id)a3 withDate:(id)a4
{
  PKCalendarDayView *v5;
  PKCalendarDayView *selectedDayView;
  PKCalendarDayView *v7;

  v5 = (PKCalendarDayView *)a3;
  -[PKCalendarDayView setSelected:](self->_selectedDayView, "setSelected:", 0);
  selectedDayView = self->_selectedDayView;
  self->_selectedDayView = v5;
  v7 = v5;

  -[PKCalendarDayView setSelected:](self->_selectedDayView, "setSelected:", 1);
}

- (void)_formViewsWithDataSource:(id)a3 appearance:(id)a4 headerView:(id)a5
{
  PKCalendarDayView *selectedDayView;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  PKCalendarDayView *v34;
  void *v35;
  PKCalendarMonthView *v36;
  void *v37;
  PKCalendarWeekdayHeaderView *v38;
  UIView *v39;
  UIView *headerSeparatorView;
  UIView *v41;
  void *v42;
  NSArray *v43;
  NSArray *dayViews;
  NSArray *v45;
  NSArray *weekdayHeaders;
  UIView **p_headerView;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v55 = a4;
  v48 = a5;
  v49 = a5;
  selectedDayView = self->_selectedDayView;
  self->_selectedDayView = 0;

  p_headerView = &self->_headerView;
  -[UIView removeFromSuperview](self->_headerView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_headerSeparatorView, "removeFromSuperview");
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v9 = self->_weekdayHeaders;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "removeFromSuperview");
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v11);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v14 = self->_dayViews;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v66 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v62 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "removeFromSuperview");
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          }
          while (v22);
        }

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v16);
  }

  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v60, "calendarMonthStartDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "calendar");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v60, "numberOfWeeks");
  v26 = objc_msgSend(v60, "numberOfDaysInWeek");
  v51 = v25;
  v27 = v55;
  if (v25 >= 1)
  {
    v28 = v26;
    v29 = 0;
    v59 = 0;
    v50 = v26;
    do
    {
      v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = v29;
      v30 = v28;
      if (v28 >= 1)
      {
        do
        {
          v31 = objc_alloc_init(MEMORY[0x1E0C99D78]);
          objc_msgSend(v31, "setDay:", v29);
          objc_msgSend(v56, "dateByAddingComponents:toDate:options:", v31, v57, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringForDay:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[PKCalendarDayView initWithDate:dayString:delegate:]([PKCalendarDayView alloc], "initWithDate:dayString:delegate:", v32, v33, self);
          objc_msgSend(v27, "decorationViewForDayView:date:", v34, v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCalendarDayView setHideDayLabel:](v34, "setHideDayLabel:", objc_msgSend(v60, "shouldShowDate:", v32) ^ 1);
          -[PKCalendarDayView setSelectable:](v34, "setSelectable:", objc_msgSend(v60, "canSelectDate:", v32));
          -[PKCalendarDayView setSelected:](v34, "setSelected:", objc_msgSend(v60, "isDateSelected:", v32));
          -[PKCalendarDayView setDecorationView:](v34, "setDecorationView:", v35);
          objc_msgSend(v58, "addObject:", v34);
          -[PKCalendarMonthView addSubview:](self, "addSubview:", v34);
          if (!v59)
          {
            v36 = self;
            objc_msgSend(v60, "stringForWeekday:", v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v38 = -[PKCalendarWeekdayHeaderView initWithWeekdayString:]([PKCalendarWeekdayHeaderView alloc], "initWithWeekdayString:", v37);
              objc_msgSend(v54, "addObject:", v38);
              -[PKCalendarMonthView addSubview:](v36, "addSubview:", v38);

              v27 = v55;
            }

            self = v36;
          }

          ++v29;
          --v30;
        }
        while (v30);
      }
      objc_msgSend(v52, "addObject:", v58);

      v28 = v50;
      v29 = v53 + v50;
      ++v59;
    }
    while (v59 != v51);
  }
  objc_storeStrong((id *)p_headerView, v48);
  -[PKCalendarMonthView addSubview:](self, "addSubview:", *p_headerView);
  if (*p_headerView)
  {
    v39 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    headerSeparatorView = self->_headerSeparatorView;
    self->_headerSeparatorView = v39;

    v41 = self->_headerSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

    -[PKCalendarMonthView addSubview:](self, "addSubview:", self->_headerSeparatorView);
  }
  v43 = (NSArray *)objc_msgSend(v52, "copy");
  dayViews = self->_dayViews;
  self->_dayViews = v43;

  v45 = (NSArray *)objc_msgSend(v54, "count");
  if (v45)
    v45 = (NSArray *)objc_msgSend(v54, "copy");
  weekdayHeaders = self->_weekdayHeaders;
  self->_weekdayHeaders = v45;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSeparatorView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_selectedDayView, 0);
  objc_storeStrong((id *)&self->_weekdayHeaders, 0);
  objc_storeStrong((id *)&self->_dayViews, 0);
}

@end
