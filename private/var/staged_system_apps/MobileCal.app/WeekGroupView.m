@implementation WeekGroupView

- (WeekGroupView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6 isMultiDayView:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  WeekGroupView *v17;
  WeekGroupView *v18;
  __objc2_class **v19;
  WeekView *v20;
  WeekView *weekView;
  UIView *v22;
  UIView *gutterView;
  void *v24;
  objc_super v26;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)WeekGroupView;
  v17 = -[WeekGroupView initWithFrame:](&v26, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_isMultiDayView = v7;
    if (v7)
      v19 = off_1001B16A0;
    else
      v19 = off_1001B1AF8;
    v20 = (WeekView *)objc_msgSend(objc_alloc(*v19), "initWithFrame:sizeClass:targetWindow:rightClickDelegate:", a4, v15, v16, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    weekView = v18->_weekView;
    v18->_weekView = v20;

    -[WeekView setDelegate:](v18->_weekView, "setDelegate:", v18);
    -[WeekView setAutoresizingMask:](v18->_weekView, "setAutoresizingMask:", 16);
    -[WeekGroupView addSubview:](v18, "addSubview:", v18->_weekView);
    v22 = (UIView *)objc_alloc_init((Class)UIView);
    gutterView = v18->_gutterView;
    v18->_gutterView = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class weekSeparatorColor](*v19, "weekSeparatorColor"));
    -[UIView setBackgroundColor:](v18->_gutterView, "setBackgroundColor:", v24);

    -[UIView setAutoresizingMask:](v18->_gutterView, "setAutoresizingMask:", 16);
    -[WeekGroupView addSubview:](v18, "addSubview:", v18->_gutterView);
    -[WeekGroupView setAutoresizingMask:](v18, "setAutoresizingMask:", 16);
  }

  return v18;
}

- (NSString)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSRect v14;

  v3 = objc_opt_class(self);
  -[WeekGroupView frame](self, "frame");
  v4 = NSStringFromRect(v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekStartDate](self, "weekStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "month")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekStartDate](self, "weekStartDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "day")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekStartDate](self, "weekStartDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "year")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; frame = %@, weekStartDate = (%@ / %@ / %@)>"),
                    v3,
                    self,
                    v5,
                    v7,
                    v9,
                    v11));

  return (NSString *)v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[WeekGroupView frame](self, "frame");
  v4 = v3;
  -[WeekView sizeThatFits:](self->_weekView, "sizeThatFits:", v5, v3);
  v7 = EKUISeparatorLineThickness(-[WeekView setFrame:](self->_weekView, "setFrame:", 0.0, 0.0, v6, v4));
  -[WeekView frame](self->_weekView, "frame");
  -[UIView setFrame:](self->_gutterView, "setFrame:", v8, 0.0, v7, v4);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WeekGroupView frame](self, "frame");
  v9 = vabdd_f64(width, v8);
  v10.receiver = self;
  v10.super_class = (Class)WeekGroupView;
  -[WeekGroupView setFrame:](&v10, "setFrame:", x, y, width, height);
  if (v9 >= 2.22044605e-16)
    -[WeekView updateDayWidth](self->_weekView, "updateDayWidth");
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  if (self->_showsTimeMarker != a3)
  {
    self->_showsTimeMarker = a3;
    -[WeekView setShowsTimeMarker:](self->_weekView, "setShowsTimeMarker:");
  }
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGRect v7;

  v4 = a4;
  -[WeekView frame](self->_weekView, "frame");
  -[WeekView showOverlayMonthInCellAtOffset:animated:](self->_weekView, "showOverlayMonthInCellAtOffset:animated:", v4, a3 - CGRectGetMinX(v7));
}

- (double)gutterWidth
{
  double v2;

  -[UIView frame](self->_gutterView, "frame");
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  -[WeekView frame](self->_weekView, "frame", a3.width);
  v6 = v5;
  -[UIView frame](self->_gutterView, "frame");
  v8 = v6 + v7;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)adjustForVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WeekView frame](self->_weekView, "frame");
  v9 = width - v8;
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  -[WeekView adjustForVisibleRect:](self->_weekView, "adjustForVisibleRect:", x, y, v10, height);
}

- (void)weekViewDidBeginDragging:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupDidBeginDragging:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupDidBeginDragging:", self);

  }
}

- (void)weekViewDidScroll:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupDidScroll:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupDidScroll:", self);

  }
}

- (void)weekViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  v4 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekGroupDidEndDragging:willDecelerate:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "weekGroupDidEndDragging:willDecelerate:", self, v4);

  }
}

- (void)weekViewDidEndDecelerating:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupDidEndDecelerating:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupDidEndDecelerating:", self);

  }
}

- (void)weekViewAllDaySectionDidScroll:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupAllDaySectionDidScroll:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupAllDaySectionDidScroll:", self);

  }
}

- (void)weekView:(id)a3 receivedTapInAllDayAreaOnDate:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroup:didReceiveTapForDate:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "weekGroup:didReceiveTapForDate:", self, v8);

  }
}

- (id)weekViewForWeekBefore:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupForWeekBefore:");

  if ((v6 & 1) != 0
    && (v7 = objc_loadWeakRetained((id *)p_delegate),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekGroupForWeekBefore:", self)),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "weekView"));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)weekViewForWeekAfter:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupForWeekAfter:");

  if ((v6 & 1) != 0
    && (v7 = objc_loadWeakRetained((id *)p_delegate),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekGroupForWeekAfter:", self)),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "weekView"));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentationControllerForEditMenu"));

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectedEventsForEditMenu"));

  return v3;
}

- (void)setWeekStartDate:(id)a3
{
  -[WeekView setWeekStartDate:](self->_weekView, "setWeekStartDate:", a3);
}

- (NSDateComponents)weekStartDate
{
  return -[WeekView weekStartDate](self->_weekView, "weekStartDate");
}

- (NSDate)lastSecondOfWeek
{
  return -[WeekView lastSecondOfWeek](self->_weekView, "lastSecondOfWeek");
}

- (void)setHighlightedDateComponents:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_highlightedDateComponents, a3);
  v5 = a3;
  -[WeekView setHighlightedDateComponents:](self->_weekView, "setHighlightedDateComponents:", v5);

}

- (id)highlightedCalendarDateComponents
{
  return -[WeekView highlightedDateComponents](self->_weekView, "highlightedDateComponents");
}

- (void)setCalendar:(id)a3
{
  -[WeekView setCalendar:](self->_weekView, "setCalendar:", a3);
}

- (NSCalendar)calendar
{
  return -[WeekView calendar](self->_weekView, "calendar");
}

- (void)setTimeZone:(id)a3
{
  -[WeekView setTimeZone:](self->_weekView, "setTimeZone:", a3);
}

- (NSTimeZone)timeZone
{
  return -[WeekView timeZone](self->_weekView, "timeZone");
}

- (void)reloadData
{
  -[WeekView reloadData](self->_weekView, "reloadData");
}

- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WeekView *weekView;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  weekView = self->_weekView;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006FDA8;
  v9[3] = &unk_1001B2600;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[WeekView loadDataAsyncWithCompletion:reverse:](weekView, "loadDataAsyncWithCompletion:reverse:", v9, v4);

}

- (void)weekView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekGroup:didSelectEvent:userInitiated:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "weekGroup:didSelectEvent:userInitiated:", self, v10, v5);

  }
}

- (void)weekView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekGroup:didSelectEvents:userInitiated:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "weekGroup:didSelectEvents:userInitiated:", self, v10, v5);

  }
}

- (void)shouldAnnotateAppEntitiesChanged
{
  -[WeekView shouldAnnotateAppEntitiesChanged](self->_weekView, "shouldAnnotateAppEntitiesChanged");
}

- (BOOL)weekViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  unsigned __int8 v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekGroupViewShouldAnnotateAppEntities:onDayStarting:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "weekGroupViewShouldAnnotateAppEntities:onDayStarting:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_secondAtPosition:(double)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView content](self->_weekView, "content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "grid"));
  v6 = objc_msgSend(v5, "secondAtPosition:", a3);

  if (v6 >= 86399)
    v7 = 86399;
  else
    v7 = v6;
  return v7 & ~(v7 >> 31);
}

- (id)dateForXOffset:(double)a3
{
  int IsLeftToRight;
  double MinX;
  CGRect v8;

  IsLeftToRight = CalTimeDirectionIsLeftToRight(self, a2);
  MinX = 0.0;
  if (IsLeftToRight)
  {
    -[WeekView frame](self->_weekView, "frame", 0.0);
    MinX = CGRectGetMinX(v8);
  }
  return -[WeekView dateForXOffset:](self->_weekView, "dateForXOffset:", a3 - MinX);
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  int64_t v22;
  void *v23;
  double v24;
  void *v25;

  v5 = a5;
  y = a3.y;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView dateForXOffset:](self, "dateForXOffset:", a3.x));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView calendar](self->_weekView, "calendar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v9, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView scrollView](self->_weekView, "scrollView"));
  objc_msgSend(v13, "frame");
  v15 = y - v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView allDayView](self->_weekView, "allDayView"));
  objc_msgSend(v16, "frame");
  v18 = v17 + (double)v5 * -10.0;

  if (y < v18
    || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView scrollView](self->_weekView, "scrollView")),
        objc_msgSend(v19, "frame"),
        v21 = v20,
        v19,
        v15 <= v21))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView scrollView](self->_weekView, "scrollView"));
    objc_msgSend(v23, "contentOffset");
    v22 = -[WeekGroupView _secondAtPosition:](self, "_secondAtPosition:", fmax(v15, 0.0) + v24);

  }
  else
  {
    v22 = 86399;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateByComponentwiseAddingSeconds:", v22));
  if (a4)
    *a4 = y < v18;

  return v25;
}

- (BOOL)containsDate:(id)a3
{
  return -[WeekView containsDate:](self->_weekView, "containsDate:", a3);
}

- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4
{
  double v5;
  double v6;
  CGPoint result;

  -[WeekView pointAtDate:isAllDay:](self->_weekView, "pointAtDate:isAllDay:", a3, a4);
  -[WeekView convertPoint:toView:](self->_weekView, "convertPoint:toView:", self);
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
  -[WeekView addViewToScroller:isAllDay:](self->_weekView, "addViewToScroller:isAllDay:", a3, a4);
}

- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4
{
  return -[WeekView scrollerIsParentOfView:isAllDay:](self->_weekView, "scrollerIsParentOfView:isAllDay:", a3, a4);
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  return -[WeekView occurrenceViewForEvent:occurrenceDate:](self->_weekView, "occurrenceViewForEvent:occurrenceDate:", a3, a4);
}

- (id)occurrenceViewAtPoint:(CGPoint)a3
{
  return -[WeekGroupView occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", 0, a3.x, a3.y);
}

- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView hitTest:withEvent:](self, "hitTest:withEvent:", 0));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000703C4;
  v19 = sub_1000703D4;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[WeekGroupView _castedDayOccurrenceViewFromGenericView:](self, "_castedDayOccurrenceViewFromGenericView:", v8));
  if (v4 && objc_msgSend((id)v16[5], "isSelectedCopyView"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "superview"));
    v10 = (void *)v16[5];
    v16[5] = 0;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000703DC;
    v14[3] = &unk_1001B3628;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[4] = self;
    v14[5] = &v15;
    objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v14);

    v12 = (id)v16[5];
  }
  else
  {
    v12 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)_castedDayOccurrenceViewFromGenericView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_class(EKDayOccurrenceView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_opt_class(EKDayOccurrenceResizeHandleView);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "occurrenceView"));
  }
  v7 = v5;
LABEL_7:

  return v7;
}

- (void)setHourHeightScale:(double)a3
{
  -[WeekView setHourHeightScale:](self->_weekView, "setHourHeightScale:", a3);
}

- (void)emptySpaceClick
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "emptySpaceClick");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "emptySpaceClick");

  }
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "emptySpaceClickedOnDate:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "emptySpaceClickedOnDate:", v8);

  }
}

- (void)weekViewDidLayout:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupViewDidLayout:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupViewDidLayout:", self);

  }
}

- (void)weekViewOccurrenceLayoutDidChange:(id)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupViewOccurrenceLayoutDidChange:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupViewOccurrenceLayoutDidChange:", self);

  }
}

- (void)weekViewFirstVisibleSecondChanged:(int64_t)a3
{
  WeekGroupViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekGroupViewFirstVisibleSecondChanged:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekGroupViewFirstVisibleSecondChanged:", a3);

  }
}

- (BOOL)isMultiDayView
{
  return self->_isMultiDayView;
}

- (void)setIsMultiDayView:(BOOL)a3
{
  self->_isMultiDayView = a3;
}

- (WeekGroupViewDelegate)delegate
{
  return (WeekGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WeekView)weekView
{
  return self->_weekView;
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (int64_t)week
{
  return self->_week;
}

- (void)setWeek:(int64_t)a3
{
  self->_week = a3;
}

- (NSDateComponents)highlightedDateComponents
{
  return self->_highlightedDateComponents;
}

- (BOOL)asyncLoading
{
  return self->_asyncLoading;
}

- (void)setAsyncLoading:(BOOL)a3
{
  self->_asyncLoading = a3;
}

- (BOOL)isInUse
{
  return self->_isInUse;
}

- (void)setIsInUse:(BOOL)a3
{
  self->_isInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedDateComponents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gutterView, 0);
  objc_storeStrong((id *)&self->_weekView, 0);
}

@end
