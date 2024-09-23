@implementation WeekViewController

- (Class)weekViewClass
{
  return (Class)objc_opt_class(WeekView);
}

- (WeekViewController)initWithModel:(id)a3 window:(id)a4
{
  WeekViewController *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WeekViewController;
  v4 = -[MainViewController initWithWindow:model:](&v12, "initWithWindow:model:", a4, a3);
  if (v4)
  {
    v4->_lastScrollPositionSecond = (int)CUIKNumberOfSecondsForCurrentTime();
    +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
    v4->_weekViewHourHeightScale = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = CUIKCalendarModelDisplayedOccurrencesChangedNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](v4, "model"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "occurrencesChanged:", v7, v8);

    v9 = CUIKCalendarModelSelectedOccurrencesChangedNotification;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](v4, "model"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "selectedOccurrencesChanged:", v9, v10);

  }
  return v4;
}

- (void)dealloc
{
  UIScrollView *weekScroller;
  void *v4;
  objc_super v5;

  -[UIScrollView setDelegate:](self->_weekScroller, "setDelegate:", 0);
  weekScroller = self->_weekScroller;
  self->_weekScroller = 0;

  -[EKEventGestureController invalidate](self->_eventGestureController, "invalidate");
  -[WeekViewController _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WeekViewController;
  -[MainViewController dealloc](&v5, "dealloc");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)_eventsForCutOrCopy
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v8 = 0;
      return v8;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  }
  v8 = (void *)v5;

  return v8;
}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3));
  if (objc_msgSend(v5, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    objc_msgSend(v4, "copyEvents:delegate:", v5, self);

    -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
  }

}

- (void)cut:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3));
  if (objc_msgSend(v5, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    objc_msgSend(v4, "cutEvents:delegate:", v5, self);

    -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
  }

}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3));
  if (objc_msgSend(v8, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    objc_msgSend(v4, "setDateForPaste:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
  objc_msgSend(v7, "pasteEventsWithDateMode:delegate:", 0, self);

  -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0)
  {
    if ("paste:" == a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardManager"));
      v7 = objc_msgSend(v9, "canPerformPaste");

    }
    else
    {
      if ("copy:" == a3)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy"));
        v10 = 1;
      }
      else
      {
        if ("cut:" != a3)
        {
          v12.receiver = self;
          v12.super_class = (Class)WeekViewController;
          v7 = -[WeekViewController canPerformAction:withSender:](&v12, "canPerformAction:withSender:", a3, v6);
          goto LABEL_12;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy"));
        v10 = 0;
      }
      v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v10, v8);
    }

    goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)loadView
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  WeekTimeView *v22;
  WeekTimeView *timeView;
  UIDropInteraction *v24;
  UIDropInteraction *timeBarDropInteraction;
  void *v26;
  UIScrollView *v27;
  UIScrollView *weekScroller;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSMutableArray *v34;
  NSMutableArray *reusableViews;
  NSMutableArray *v36;
  NSMutableArray *visibleWeeks;
  double v38;
  EKEventGestureController *v39;
  EKEventGestureController *eventGestureController;
  EKEventCreationGestureController *v41;
  EKEventCreationGestureController *eventCreationController;
  NSMutableArray *v43;
  WeekGroupView *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  int64_t v53;
  void *v54;
  WeekGroupView *v55;
  NSMutableArray *v56;
  WeekGroupView *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int64_t v66;
  void *v67;
  WeekGroupView *v68;
  uint64_t v69;
  double v70;
  UIView *v71;
  UIView *allDayDividerLineView;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  float v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  objc_super v90;

  v90.receiver = self;
  v90.super_class = (Class)WeekViewController;
  -[WeekViewController loadView](&v90, "loadView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v4, "setOpaque:", 1);

  -[WeekViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  self->_showWeekNumber = objc_msgSend(v8, "showWeekNumbers");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  self->_weekViewStartsOnToday = objc_msgSend(v9, "weekViewStartsOnToday");

  v12 = CUIKGetOverlayCalendar(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  self->_showOverlayCalendar = v13 != 0;

  v14 = -[WeekViewController headerVerticalOffset](self, "headerVerticalOffset");
  v16 = v15;
  v17 = 0.0;
  if ((CalInterfaceIsLeftToRight(v14) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    objc_msgSend(v18, "bounds");
    v17 = v19;

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v21 = EKUIInterfaceOrientationForViewHierarchy(v20);

  v22 = -[WeekTimeView initWithFrame:targetSizeClass:orientation:]([WeekTimeView alloc], "initWithFrame:targetSizeClass:orientation:", -[WeekViewController intendedSizeClass](self, "intendedSizeClass"), v21, v17, v16, 0.0, 100.0);
  timeView = self->_timeView;
  self->_timeView = v22;

  -[WeekTimeView sizeToFit](self->_timeView, "sizeToFit");
  -[WeekTimeView setUseMultiDayStyle:](self->_timeView, "setUseMultiDayStyle:", -[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"));
  -[WeekTimeView setHeaderHeight:](self->_timeView, "setHeaderHeight:", 40.0);
  -[WeekTimeView setDayTimeViewDelegate:](self->_timeView, "setDayTimeViewDelegate:", self);
  -[WeekTimeView setAutoresizingMask:](self->_timeView, "setAutoresizingMask:", 16);
  v24 = (UIDropInteraction *)objc_msgSend(objc_alloc((Class)UIDropInteraction), "initWithDelegate:", self);
  timeBarDropInteraction = self->_timeBarDropInteraction;
  self->_timeBarDropInteraction = v24;

  -[WeekTimeView addInteraction:](self->_timeView, "addInteraction:", self->_timeBarDropInteraction);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", self->_timeView);

  self->_currentlyDisplayedWeekNumber = -1;
  v27 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  weekScroller = self->_weekScroller;
  self->_weekScroller = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIScrollView setBackgroundColor:](self->_weekScroller, "setBackgroundColor:", v29);

  -[UIScrollView setOpaque:](self->_weekScroller, "setOpaque:", 1);
  -[UIScrollView setDelegate:](self->_weekScroller, "setDelegate:", self);
  -[UIScrollView setScrollsToTop:](self->_weekScroller, "setScrollsToTop:", 0);
  -[UIScrollView setDelaysContentTouches:](self->_weekScroller, "setDelaysContentTouches:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_weekScroller, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setDecelerationRate:](self->_weekScroller, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v30, "addSubview:", self->_weekScroller);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v31, "bringSubviewToFront:", self->_timeView);

  v32 = objc_msgSend(objc_alloc((Class)UIPinchGestureRecognizer), "initWithTarget:action:", self, "_weekScrollerPinched:");
  -[UIScrollView addGestureRecognizer:](self->_weekScroller, "addGestureRecognizer:", v32);
  v33 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_weekScrollerDoubleTapped:");
  objc_msgSend(v33, "setNumberOfTapsRequired:", 2);
  -[UIScrollView addGestureRecognizer:](self->_weekScroller, "addGestureRecognizer:", v33);

  v34 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  reusableViews = self->_reusableViews;
  self->_reusableViews = v34;

  v36 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  visibleWeeks = self->_visibleWeeks;
  self->_visibleWeeks = v36;

  if ((EKUIHasFallbackSizingContext() & 1) == 0)
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeekViewController.m"), 285, CFSTR("We entered weekview without a fallback sizing"));

  }
  -[WeekViewController weekWidth](self, "weekWidth");
  self->_weekWidth = v38;
  -[UIScrollView setContentSize:](self->_weekScroller, "setContentSize:", v38 * 54080.0, 0.0);
  if (!self->_eventGestureController)
  {
    v39 = (EKEventGestureController *)objc_msgSend(objc_alloc((Class)EKEventGestureController), "initWithView:", self->_weekScroller);
    eventGestureController = self->_eventGestureController;
    self->_eventGestureController = v39;

    -[EKEventGestureController setDelegate:](self->_eventGestureController, "setDelegate:", self);
    -[EKEventGestureController setUsesHorizontalDragLocking:](self->_eventGestureController, "setUsesHorizontalDragLocking:", 1);
    -[EKEventGestureController setUsesXDragOffsetInCancelRegion:](self->_eventGestureController, "setUsesXDragOffsetInCancelRegion:", 1);
  }
  if (-[WeekViewController enableEventCreationGesture](self, "enableEventCreationGesture"))
  {
    v41 = (EKEventCreationGestureController *)objc_msgSend(objc_alloc((Class)EKEventCreationGestureController), "initWithView:delegate:", self->_weekScroller, self);
    eventCreationController = self->_eventCreationController;
    self->_eventCreationController = v41;

  }
  v43 = self->_reusableViews;
  v44 = [WeekGroupView alloc];
  -[UIScrollView bounds](self->_weekScroller, "bounds");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v53 = -[WeekViewController intendedSizeClass](self, "intendedSizeClass");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v55 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v44, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v53, v54, self, -[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"), v46, v48, v50, v52);
  -[NSMutableArray addObject:](v43, "addObject:", v55);

  v56 = self->_reusableViews;
  v57 = [WeekGroupView alloc];
  -[UIScrollView bounds](self->_weekScroller, "bounds");
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = -[WeekViewController intendedSizeClass](self, "intendedSizeClass");
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v68 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v57, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v66, v67, self, -[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"), v59, v61, v63, v65);
  -[NSMutableArray addObject:](v56, "addObject:", v68);

  v70 = EKUISeparatorLineThickness(v69);
  v71 = (UIView *)objc_alloc_init((Class)UIView);
  allDayDividerLineView = self->_allDayDividerLineView;
  self->_allDayDividerLineView = v71;

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[UIView setBackgroundColor:](self->_allDayDividerLineView, "setBackgroundColor:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v74, "bounds");
  -[UIView setFrame:](self->_allDayDividerLineView, "setFrame:", 0.0, v16 - v70);

  -[UIView setHidden:](self->_allDayDividerLineView, "setHidden:", 1);
  -[UIView setAutoresizingMask:](self->_allDayDividerLineView, "setAutoresizingMask:", 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v75, "addSubview:", self->_allDayDividerLineView);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
  if (v76)
    -[WeekViewController scrollToDisplayedDateAnimated:](self, "scrollToDisplayedDateAnimated:", 0);
  self->_initialShow = 1;
  v77 = objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
  if (v77)
  {
    v78 = (void *)v77;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
    objc_msgSend(v79, "weekViewHourScale");
    v81 = v80;

    if (v81 > 0.0)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
      objc_msgSend(v82, "weekViewHourScale");
LABEL_16:
      self->_weekViewHourHeightScale = v83;
      goto LABEL_17;
    }
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "weekViewHourScale"));

  if (v82)
  {
    objc_msgSend(v82, "floatValue");
    v83 = v85;
    goto LABEL_16;
  }
LABEL_17:

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v86, "addObserver:selector:name:object:", self, "_updateContentForSizeCategoryChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v87, "addObserver:selector:name:object:", self, "_showWeekNumbersPrefDidChange", CUIKPreferencesNotification_ShowWeekNumbers, 0);

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v88, "addObserver:selector:name:object:", self, "_weekViewStartsOnTodayPrefDidChange", CUIKPreferencesNotification_WeekViewStartsOnToday, 0);

}

- (double)weekWidth
{
  double result;

  -[WeekViewController weekWidthForOrientation:](self, "weekWidthForOrientation:", -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  return result;
}

- (double)weekWidthForOrientation:(int64_t)a3
{
  objc_class *v5;
  void *v6;
  id v7;
  double v8;
  double v9;

  v5 = -[WeekViewController weekViewClass](self, "weekViewClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v7 = -[objc_class standardWidthForOrientation:withViewInViewHierarchy:](v5, "standardWidthForOrientation:withViewInViewHierarchy:", a3, v6);
  v9 = v8 + EKUISeparatorLineThickness(v7);

  return v9;
}

- (void)viewWillLayoutSubviews
{
  CGSize *p_lastBoundsSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  int IsLeftToRight;
  double v26;
  int v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;

  p_lastBoundsSize = &self->_lastBoundsSize;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  width = p_lastBoundsSize->width;
  height = p_lastBoundsSize->height;

  if (width != v6 || height != v8)
  {
    -[WeekViewController resizeWeekGroupsIfNeededForOrientation:](self, "resizeWeekGroupsIfNeededForOrientation:", -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    objc_msgSend(v12, "bounds");
    p_lastBoundsSize->width = v13;
    p_lastBoundsSize->height = v14;

  }
  -[WeekViewController headerVerticalOffset](self, "headerVerticalOffset");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;

  v22 = v21 - v16;
  -[WeekTimeView sizeToFit](self->_timeView, "sizeToFit");
  -[WeekTimeView frame](self->_timeView, "frame");
  v23 = CGRectGetWidth(v31);
  IsLeftToRight = CalInterfaceIsLeftToRight(v24);
  v26 = v19 - v23 + -1.0;
  if (IsLeftToRight)
    v26 = 0.0;
  v27 = CalInterfaceIsLeftToRight(-[WeekTimeView setFrame:](self->_timeView, "setFrame:", v26, v16, v23, v22));
  v28 = v23 + 1.0;
  if (!v27)
    v28 = 0.0;
  v29 = v19 - v28;
  if (v27)
    v30 = v23;
  else
    v30 = 0.0;
  -[UIScrollView setFrame:](self->_weekScroller, "setFrame:", v30, v16, v29, v22);
  -[WeekViewController layoutCellsAnimated:](self, "layoutCellsAnimated:", 0);
  -[WeekViewController _updateWeekViewContentHeight](self, "_updateWeekViewContentHeight");
  -[WeekViewController _updateShouldAnnotateAppEntities](self, "_updateShouldAnnotateAppEntities");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_sceneEnteredForeground:", UISceneWillEnterForegroundNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_logUserStateDiagnostics:", CUIKStateCaptureNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)WeekViewController;
  -[WeekViewController viewDidLoad](&v4, "viewDidLoad");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WeekViewController;
  -[WeekViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  self->_viewWillAppearCalled = 1;
  if (!-[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"))
    -[WeekViewController resizeWeekGroupsIfNeededForOrientation:](self, "resizeWeekGroupsIfNeededForOrientation:", -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = CUIKCalendarModelSelectedDateChangedNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_selectedDateChanged:", v5, v6);

  v7 = CUIKCalendarModelSignificantTimeChangeNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_significantTimeChanged:", v7, v8);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_localeChanged:", CUIKLocaleChangedNotification, 0);
  if (!-[WeekViewController suppressInitialScrollToCurrentTime](self, "suppressInitialScrollToCurrentTime"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedDate"));
    -[WeekViewController setDisplayedDate:](self, "setDisplayedDate:", v10);

  }
  -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
  -[WeekViewController overlayCalendarDidChange](self, "overlayCalendarDidChange");
  if (self->_needsReload)
    -[WeekViewController reloadData](self, "reloadData");
  if (self->_initialShow
    && !-[WeekViewController suppressInitialScrollToCurrentTime](self, "suppressInitialScrollToCurrentTime")
    && -[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
    objc_msgSend(v13, "firstEventSecond");
    -[WeekViewController _scrollToSecond:animated:completion:](self, "_scrollToSecond:animated:completion:", (uint64_t)v14, 0, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  double weekViewHourHeightScale;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WeekViewController;
  -[MainViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  self->_viewIsVisible = 1;
  if (self->_needsHourHeightUpdate)
  {
    +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
LABEL_5:
    -[WeekViewController _setHourHeightScale:](self, "_setHourHeightScale:", weekViewHourHeightScale);
    -[WeekViewController viewWillLayoutSubviews](self, "viewWillLayoutSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    objc_msgSend(v5, "layoutSubviews");

    -[WeekViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
    -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
    self->_needsHourHeightUpdate = 0;
    goto LABEL_6;
  }
  if (self->_initialShow)
  {
    weekViewHourHeightScale = self->_weekViewHourHeightScale;
    goto LABEL_5;
  }
LABEL_6:
  -[WeekViewController adjustVisibleAllDayOccurrenceLabelsAnimated:](self, "adjustVisibleAllDayOccurrenceLabelsAnimated:", 0);
  if (self->_initialShow
    && !-[WeekViewController suppressInitialScrollToCurrentTime](self, "suppressInitialScrollToCurrentTime")
    && -[WeekViewController isTodayVisible](self, "isTodayVisible"))
  {
    -[WeekViewController _scrollToCurrentTimeOfDayAnimated:](self, "_scrollToCurrentTimeOfDayAnimated:", 1);
  }
  self->_initialShow = 0;
  -[CUIKCalendarModel setDesiredPaddingDays:](self->super._model, "setDesiredPaddingDays:", 7);
  -[CUIKCalendarModel setComponentForExpandingPadding:](self->super._model, "setComponentForExpandingPadding:", 16);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WeekViewController;
  -[WeekViewController viewWillDisappear:](&v20, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = CUIKCalendarModelSelectedDateChangedNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  v7 = CUIKCalendarModelSignificantTimeChangeNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v7, v8);

  objc_msgSend(v4, "removeObserver:name:object:", self, CUIKLocaleChangedNotification, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](self->_eventGestureController, "occurrenceDate"));
  -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v9, v10);

  if ((-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress") & 1) == 0)-[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  self->_viewIsVisible = 0;
  self->_viewWillAppearCalled = 0;
  -[WeekViewController _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  if (-[WeekViewController isTodayVisible](self, "isTodayVisible"))
  {
    v11 = -[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView");
    if (!v11)
    {
      v13 = CUIKTodayDate(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventStore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timeZone"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v14, v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      objc_msgSend(v19, "setSelectedDate:", v18);

    }
  }

}

- (BOOL)suppressInitialScrollToCurrentTime
{
  return 0;
}

- (BOOL)usesMultiDayWeekView
{
  return 0;
}

- (BOOL)usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)orientationForSize:(CGSize)a3
{
  if (-[WeekViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height))
    return 1;
  else
    return 4;
}

- (int64_t)viewInterfaceOrientation
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v6 = -[WeekViewController orientationForSize:](self, "orientationForSize:", v4, v5);

  return v6;
}

- (id)_visibleOccurrenceViewsWithOptions:(int64_t)a3
{
  NSString *const **v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSString *const **v18;
  void *v19;
  void *v20;
  id v21;
  int64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = &EKEventStoreChangedNotification_ptr;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v23 = a3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v10), "weekView", v23));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5[233], "array"));
        if (!a3)
        {
          v15 = v8;
          v16 = v9;
          v17 = v6;
          v18 = v5;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrenceViews"));
          if (v14)
            objc_msgSend(v12, "addObjectsFromArray:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allDayView"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "occurrenceViews"));

          objc_msgSend(v12, "addObjectsFromArray:", v20);
          v5 = v18;
          v6 = v17;
          v9 = v16;
          v8 = v15;
          a3 = v23;
          goto LABEL_15;
        }
        if ((a3 & 1) == 0)
        {
          if ((a3 & 2) == 0)
            goto LABEL_16;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allDayView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "occurrenceViews"));

LABEL_14:
          objc_msgSend(v12, "addObjectsFromArray:", v14);
          goto LABEL_15;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrenceViews"));
        if (v14)
          goto LABEL_14;
LABEL_15:

LABEL_16:
        objc_msgSend(v6, "addObjectsFromArray:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v21 = objc_msgSend(v6, "copy");
  return v21;
}

- (void)_showWeekNumbersPrefDidChange
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  self->_showWeekNumber = objc_msgSend(v3, "showWeekNumbers");

  if (self->_showWeekNumber)
  {
    -[WeekViewController updateWeekNumber](self, "updateWeekNumber");
  }
  else
  {
    -[WeekTimeView setWeekNumberText:](self->_timeView, "setWeekNumberText:", 0);
    self->_currentlyDisplayedWeekNumber = -1;
  }
}

- (void)_weekViewStartsOnTodayPrefDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  self->_weekViewStartsOnToday = objc_msgSend(v3, "weekViewStartsOnToday");

}

- (void)overlayCalendarDidChange
{
  uint64_t v3;
  void *v4;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  self->_showOverlayCalendar = v4 != 0;

  -[WeekViewController _updateHeaderHeightsAnimated:](self, "_updateHeaderHeightsAnimated:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  EKEventGestureController *v8;
  EKEventGestureController *v9;
  _QWORD v10[4];
  EKEventGestureController *v11;
  WeekViewController *v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)WeekViewController;
  v7 = a4;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = self->_eventGestureController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100074348;
  v10[3] = &unk_1001B2BE8;
  v11 = v8;
  v12 = self;
  v9 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v10);

}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  unint64_t v22;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[WeekViewController scrollEventIntoView:animated:completion:](self, "scrollEventIntoView:animated:completion:", v10, v8, 0);
  v12 = objc_msgSend(v10, "isNew");
  if (a5 == 3 || v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:](AddEventViewController, "editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:", v10, self->super._model, 0, self));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v10, self, v13));
    -[WeekViewController ekui_adjustToolBarToTransparentStyle](self, "ekui_adjustToolBarToTransparentStyle");
    objc_msgSend(v14, "ekui_adjustNavBarToTransparentStyle");

  }
  *(_QWORD *)&v15 = objc_opt_class(self).n128_u64[0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v16, v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v19, "setTitle:", v18);

  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v10);
  if (a5)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100074668;
    v20[3] = &unk_1001B2838;
    v21 = v14;
    v22 = a5;
    -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v21, self, v8, v20);

  }
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v6;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v14 = objc_msgSend(objc_alloc((Class)EKExpandedReminderStackViewController), "initWithEvents:delegate:", v8, self);
  *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v10, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitle:", v12);

  -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", v8);
  -[MainViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v14, self, v6, 0);

}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v6, "setSelectedDate:", v7);

  -[WeekViewController setDisplayedDate:animated:](self, "setDisplayedDate:animated:", v7, v4);
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (BOOL)isTodayVisible
{
  WeekViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[WeekViewController dateIsVisible:](v2, "dateIsVisible:", v4);

  return (char)v2;
}

- (id)bestDateForNewEvent
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKCalendarDate *v10;

  v3 = -[WeekViewController isTodayVisible](self, "isTodayVisible");
  if (v3)
  {
    v5 = CUIKTodayDate(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v9));

  }
  else
  {
    v10 = self->_displayedDate;
  }
  return v10;
}

- (EKCalendarDate)displayedDate
{
  return self->_displayedDate;
}

- (BOOL)currentlyEditingEventsWithGestures
{
  return -[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress");
}

- (id)sceneTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSDateIntervalFormatter *v15;
  NSDateIntervalFormatter *titleIntervalDateFormatter;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  const __CFString *v25;

  if (-[WeekViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController displayedDate](self, "displayedDate"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v7 = (void *)v5;
    if (v5)
    {
      v8 = CUIKTodayDate(v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = -[WeekViewController isDateVisible:](self, "isDateVisible:", v9);

      if (v10)
      {
        *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("This Week"), &stru_1001B67C0, 0));
      }
      else
      {
        if (!self->_titleIntervalDateFormatter)
        {
          v15 = (NSDateIntervalFormatter *)objc_alloc_init((Class)NSDateIntervalFormatter);
          titleIntervalDateFormatter = self->_titleIntervalDateFormatter;
          self->_titleIntervalDateFormatter = v15;

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
          -[NSDateIntervalFormatter setCalendar:](self->_titleIntervalDateFormatter, "setCalendar:", v17);

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "timeZone"));
          -[NSDateIntervalFormatter setTimeZone:](self->_titleIntervalDateFormatter, "setTimeZone:", v19);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
        v20 = objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
        v21 = (void *)v20;
        v14 = 0;
        if (v13 && v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v13));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v21));
          v24 = objc_msgSend(v13, "month");
          if (v24 == objc_msgSend(v21, "month"))
            v25 = CFSTR("MMMMdy");
          else
            v25 = CFSTR("MMMdy");
          -[NSDateIntervalFormatter setDateTemplate:](self->_titleIntervalDateFormatter, "setDateTemplate:", v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateIntervalFormatter stringFromDate:toDate:](self->_titleIntervalDateFormatter, "stringFromDate:toDate:", v22, v23));

        }
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)isDateVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForEndOfDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v6));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v10, "absoluteTime");
  v15 = v14;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v17 = v16;
  v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
    v23 = 138412802;
    v24 = v4;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Week view determining if date %@ is visible. Onscreen dates: %@ - %@", (uint8_t *)&v23, 0x20u);

  }
  v21 = v17 <= v15 && v13 <= v17;

  return v21;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateForEndOfDay"));
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromComponents:", v7));
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));

}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v9));

    return v10;
  }
  else
  {
    v12 = -[WeekViewController isTodayVisible](self, "isTodayVisible");
    if (v12)
    {
      v14 = CUIKTodayDate(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeZone"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v15, v18));

      return v19;
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)WeekViewController;
      v20 = -[MainViewController preferredPreSizeClassTransitionSelectedDate](&v21, "preferredPreSizeClassTransitionSelectedDate");
      return (id)objc_claimAutoreleasedReturnValue(v20);
    }
  }
}

- (void)showReminderDetail:(id)a3
{
  -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a3, 1, 1, 0);
}

- (void)_selectedDateChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDate"));
  -[WeekViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", v4);

}

- (void)_localeChanged:(id)a3
{
  -[WeekViewController resizeWeekGroupsIfNeededForOrientation:](self, "resizeWeekGroupsIfNeededForOrientation:", -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation", a3));
  -[WeekViewController overlayCalendarDidChange](self, "overlayCalendarDidChange");
}

- (void)_significantTimeChanged:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey));

  v5 = objc_msgSend(v7, "BOOLValue");
  v6 = v7;
  if ((v5 & 1) != 0 || !v7)
  {
    -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
    v6 = v7;
  }

}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v4, "updateBackButtonToDate:") & 1) != 0)
    objc_msgSend(v4, "updateBackButtonToDate:", v5);

}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
  if (self->_viewWillAppearCalled)
  {
    +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
    -[WeekViewController _setHourHeightScale:](self, "_setHourHeightScale:");
  }
  else
  {
    self->_needsHourHeightUpdate = 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  *(float *)&v5 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  objc_msgSend(v4, "setWeekViewHourScale:", v6);

  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
  objc_msgSend(v9, "setWeekViewHourScale:", v8);

  -[WeekTimeView contentSizeCategoryChanged](self->_timeView, "contentSizeCategoryChanged");
  -[WeekTimeView sizeToFit](self->_timeView, "sizeToFit");
  -[WeekViewController resizeWeekGroupsIfNeededForOrientation:](self, "resizeWeekGroupsIfNeededForOrientation:", -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weekView"));
    self->_lastScrollPositionSecond = (int64_t)objc_msgSend(v11, "firstVisibleSecond");

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_visibleWeeks;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "removeFromSuperview");
        -[WeekViewController _reuseWeekView:](self, "_reuseWeekView:", v17);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v14);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_reusableViews;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), "removeFromSuperview", (_QWORD)v23);
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

  -[NSMutableArray removeAllObjects](self->_visibleWeeks, "removeAllObjects");
  self->_visibleRange.location = 0;
  self->_visibleRange.length = 0;
  -[NSMutableArray removeAllObjects](self->_reusableViews, "removeAllObjects");
}

- (CGRect)_boundsForWeek:(int64_t)a3
{
  double weekWidth;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[objc_class leadingVerticalLinePeak](-[WeekViewController weekViewClass](self, "weekViewClass"), "leadingVerticalLinePeak");
  weekWidth = self->_weekWidth;
  v7 = v6 + (double)a3 * weekWidth;
  -[UIScrollView bounds](self->_weekScroller, "bounds");
  v9 = 0.0;
  v10 = v7;
  v11 = weekWidth;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (id)dateForWeek:(int64_t)a3
{
  int64_t v5;

  if (CalTimeDirectionIsLeftToRight(self, a2))
    v5 = a3 - 27040;
  else
    v5 = 27040 - a3;
  return -[EKCalendarDate calendarDateByAddingWeeks:](self->_referenceWeekStart, "calendarDateByAddingWeeks:", v5);
}

- (id)_createPreparedViewForWeek:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WeekGroupView *v9;
  WeekGroupView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    EKUIPushFallbackSizingContextWithViewHierarchy(v8);

  }
  if (-[NSMutableArray count](self->_reusableViews, "count"))
  {
    v9 = (WeekGroupView *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_reusableViews, "firstObject"));
    -[WeekViewController _boundsForWeek:](self, "_boundsForWeek:", a3);
    -[WeekGroupView setFrame:](v9, "setFrame:");
    -[NSMutableArray removeObjectAtIndex:](self->_reusableViews, "removeObjectAtIndex:", 0);
  }
  else
  {
    v10 = [WeekGroupView alloc];
    -[WeekViewController _boundsForWeek:](self, "_boundsForWeek:", a3);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = -[WeekViewController intendedSizeClass](self, "intendedSizeClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v10, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v19, v20, self, -[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"), v12, v14, v16, v18);

  }
  -[WeekGroupView setDelegate:](v9, "setDelegate:", self);
  -[WeekGroupView setIsInUse:](v9, "setIsInUse:", 1);
  -[WeekGroupView setWeek:](v9, "setWeek:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateForWeek:](self, "dateForWeek:", a3));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendar"));
  -[WeekGroupView setCalendar:](v9, "setCalendar:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "eventStore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "timeZone"));
  -[WeekGroupView setTimeZone:](v9, "setTimeZone:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  objc_msgSend(v27, "setDataSource:", self);

  v28 = -[WeekViewController receiveTapsInHeader](self, "receiveTapsInHeader");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allDayView"));
  objc_msgSend(v30, "setReceiveTapsInHeader:", v28);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allComponents"));
  -[WeekGroupView setWeekStartDate:](v9, "setWeekStartDate:", v31);

  -[WeekViewController _setHeaderHeightForWeekGroupView:forceLayout:](self, "_setHeaderHeightForWeekGroupView:forceLayout:", v9, 0);
  -[WeekGroupView setHourHeightScale:](v9, "setHourHeightScale:", self->_weekViewHourHeightScale);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v32), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v34 = v33 * self->_weekViewHourHeightScale;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "scrollView"));
  objc_msgSend(v36, "contentSize");
  v38 = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "scrollView"));
  objc_msgSend(v40, "setContentSize:", v38, v34);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "content"));
  objc_msgSend(v42, "frame");
  v44 = v43;
  v46 = v45;
  v48 = v47;

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "content"));
  objc_msgSend(v50, "setFrame:", v44, v46, v48, v34);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "content"));
  objc_msgSend(v52, "setNeedsLayout");

  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", 0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "weekView"));
    v55 = objc_msgSend(v54, "firstVisibleSecond");
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[WeekGroupView weekView](v9, "weekView"));
    objc_msgSend(v56, "setFirstVisibleSecond:", v55);

  }
  -[UIScrollView addSubview:](self->_weekScroller, "addSubview:", v9);
  if (v6)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "window"));
    EKUIPopFallbackSizingContextWithViewHierarchy(v58);

  }
  return v9;
}

- (id)weekScroller
{
  return self->_weekScroller;
}

- (id)verticalScrollView
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_visibleWeeks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "frame", (_QWORD)v25);
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[UIScrollView bounds](self->_weekScroller, "bounds");
        v32.origin.x = v17;
        v32.origin.y = v18;
        v32.size.width = v19;
        v32.size.height = v20;
        v30.origin.x = v10;
        v30.origin.y = v12;
        v30.size.width = v14;
        v30.size.height = v16;
        v31 = CGRectIntersection(v30, v32);
        if (!CGRectIsEmpty(v31))
        {
          v21 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_11:

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "weekView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "scrollView"));

  return v23;
}

- (void)_reuseWeekView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIScrollView *weekScroller;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController draggingView](self->_eventGestureController, "draggingView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController draggingView](self->_eventGestureController, "draggingView"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;

    -[EKEventGestureController touchOffset](self->_eventGestureController, "touchOffset");
    v11 = v7 + v10;
    -[EKEventGestureController touchOffset](self->_eventGestureController, "touchOffset");
    v13 = v9 + v12;
    weekScroller = self->_weekScroller;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController draggingView](self->_eventGestureController, "draggingView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
    -[UIScrollView convertPoint:fromView:](weekScroller, "convertPoint:fromView:", v16, v11, v13);
    v18 = v17;
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, v18, v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "weekStartDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "timeZone"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v22, v23));

    if (objc_msgSend(v24, "compare:", v21) == (id)-1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "calendarDateByAddingDays:", -[WeekViewController daysInWeek](self, "daysInWeek")));
      if (objc_msgSend(v25, "compare:", v21) == (id)1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](self->_eventGestureController, "occurrenceDate"));
        -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v26, v27);

        -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
      }

    }
  }
  objc_msgSend(v28, "setIsInUse:", 0);
  -[NSMutableArray addObject:](self->_reusableViews, "addObject:", v28);

}

- (_NSRange)visibleRangeForOffset:(double)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t i;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  NSUInteger v32;
  NSUInteger v33;
  _NSRange result;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = 0;
  v5 = (unint64_t)(a3 / self->_weekWidth);
  v6 = v5 - 1;
  do
  {
    -[WeekViewController _boundsForWeek:](self, "_boundsForWeek:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIScrollView bounds](self->_weekScroller, "bounds");
    v37.origin.x = v15;
    v37.origin.y = v16;
    v37.size.width = v17;
    v37.size.height = v18;
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.width = v12;
    v35.size.height = v14;
    if (!CGRectIntersectsRect(v35, v37))
      break;
    ++v4;
    --v6;
  }
  while (v4 != 2);
  for (i = 0; i != 2; ++i)
  {
    -[WeekViewController _boundsForWeek:](self, "_boundsForWeek:", v5 + 1 + i);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[UIScrollView bounds](self->_weekScroller, "bounds");
    v38.origin.x = v28;
    v38.origin.y = v29;
    v38.size.width = v30;
    v38.size.height = v31;
    v36.origin.x = v21;
    v36.origin.y = v23;
    v36.size.width = v25;
    v36.size.height = v27;
    if (!CGRectIntersectsRect(v36, v38))
      break;
  }
  v32 = v5 - v4;
  v33 = v4 + i + 1;
  result.length = v33;
  result.location = v32;
  return result;
}

- (void)updateVisibleRects
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_visibleWeeks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        -[UIScrollView bounds](self->_weekScroller, "bounds", (_QWORD)v23);
        v10 = v9;
        -[UIScrollView bounds](self->_weekScroller, "bounds");
        v12 = v10 - v11;
        -[UIScrollView bounds](self->_weekScroller, "bounds");
        v14 = v13;
        -[UIScrollView bounds](self->_weekScroller, "bounds");
        v16 = v15 * 3.0;
        -[UIScrollView bounds](self->_weekScroller, "bounds");
        v18 = v17;
        objc_msgSend(v8, "frame");
        v30.origin.x = v12;
        v30.origin.y = v14;
        v30.size.width = v16;
        v30.size.height = v18;
        v29 = CGRectIntersection(v28, v30);
        x = v29.origin.x;
        y = v29.origin.y;
        width = v29.size.width;
        height = v29.size.height;
        if (!CGRectIsEmpty(v29))
        {
          objc_msgSend(v8, "convertRect:fromView:", self->_weekScroller, x, y, width, height);
          objc_msgSend(v8, "adjustForVisibleRect:");
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

- (void)layoutCellsAnimated:(BOOL)a3
{
  char *v4;
  NSUInteger v5;
  char *v6;
  NSUInteger v7;
  _NSRange *p_visibleRange;
  unsigned __int8 v9;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  char *v16;
  NSUInteger v17;
  NSUInteger v18;
  char *v19;
  void *v20;
  void *v21;
  int64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  void *v25;
  int64_t v26;
  uint64_t i;
  void *v28;
  BOOL v29;
  _BOOL4 v30;
  _QWORD *v31;
  unint64_t v32;
  id v33;
  void *v34;
  int64_t lastScrollPositionSecond;
  void *v36;
  id v37;
  id v38;
  void *v39;
  int64_t v40;
  void *v41;
  uint64_t v42;
  int64_t v43;
  int64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger length;
  _BOOL4 v49;
  unint64_t v50;
  _QWORD v51[5];
  BOOL v52;

  v49 = a3;
  -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v4 = (char *)-[WeekViewController visibleRangeForOffset:](self, "visibleRangeForOffset:");
  v6 = v4;
  v7 = v5;
  p_visibleRange = &self->_visibleRange;
  if (self->_visibleRange.length)
  {
    v9 = -[WeekViewController rotating](self, "rotating");
    location = p_visibleRange->location;
    if ((v9 & 1) != 0)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v50 = 0;
      v7 = 0;
      v6 = 0;
      v47 = p_visibleRange->location;
      length = self->_visibleRange.length;
    }
    else
    {
      v14 = (NSUInteger)&v6[-location];
      if ((unint64_t)v6 >= location)
      {
        v15 = self->_visibleRange.length;
        if (v15 < v14)
          v14 = self->_visibleRange.length;
        if ((unint64_t)v6 > location)
          v12 = v14;
        else
          v12 = 0;
        v13 = 0;
        v50 = 0;
      }
      else
      {
        v12 = 0;
        if (v7 >= location - (unint64_t)v6)
          v13 = location - (_QWORD)v6;
        else
          v13 = v7;
        v15 = self->_visibleRange.length;
        v50 = (unint64_t)v6;
      }
      v16 = &v6[v7];
      v17 = v15 + location;
      if (v17 - (unint64_t)&v6[v7] < v15)
        v15 = v17 - (_QWORD)&v6[v7];
      v18 = (NSUInteger)&v16[-v17];
      if ((unint64_t)v16 >= v17)
        v15 = 0;
      v47 = (NSUInteger)v6;
      length = v7;
      if ((unint64_t)v6 <= v17)
        v19 = (char *)v17;
      else
        v19 = v6;
      if (v7 < v18)
        v18 = v7;
      if ((unint64_t)v16 > v17)
        v11 = 0;
      else
        v11 = v15;
      if ((unint64_t)v16 > v17)
        v7 = v18;
      else
        v7 = 0;
      if ((unint64_t)v16 > v17)
        v6 = v19;
      else
        v6 = 0;
    }
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v50 = 0;
    v47 = (NSUInteger)v4;
    length = v5;
  }
  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "weekView"));
    v22 = (int64_t)objc_msgSend(v21, "firstVisibleSecond");

    if (!v11)
      goto LABEL_43;
  }
  else
  {
    v22 = -1;
    if (!v11)
      goto LABEL_43;
  }
  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v43 = v22;
    v45 = v13;
    v23 = self->_visibleRange.length;
    if (v23 >= v11)
    {
      v24 = v23 - v11;
      do
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", v24, v43, v45));
        objc_msgSend(v25, "removeFromSuperview");
        -[WeekViewController _reuseWeekView:](self, "_reuseWeekView:", v25);

        ++v24;
      }
      while (v24 < v23);
    }
    -[NSMutableArray removeObjectsInRange:](self->_visibleWeeks, "removeObjectsInRange:", v23 - v11, v11, v43, v45);
    v22 = v44;
    v13 = v46;
  }
LABEL_43:
  if (v12 && -[NSMutableArray count](self->_visibleWeeks, "count"))
  {
    v26 = v22;
    for (i = 0; i != v12; ++i)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", i));
      objc_msgSend(v28, "removeFromSuperview");
      -[WeekViewController _reuseWeekView:](self, "_reuseWeekView:", v28);

    }
    -[NSMutableArray removeObjectsInRange:](self->_visibleWeeks, "removeObjectsInRange:", 0, v12);
    v22 = v26;
  }
  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
    v29 = 1;
  else
    v29 = v22 == -1;
  if (!v29)
    self->_lastScrollPositionSecond = v22;
  if (-[NSMutableArray count](self->_visibleWeeks, "count"))
    v30 = 0;
  else
    v30 = self->_lastScrollPositionSecond != -1;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000764E4;
  v51[3] = &unk_1001B3688;
  v51[4] = self;
  v52 = v49;
  v31 = objc_retainBlock(v51);
  if (v13)
  {
    v32 = v50 + v13 - 1;
    do
    {
      if (v32 < v50)
        break;
      v33 = -[WeekViewController _createPreparedViewForWeek:](self, "_createPreparedViewForWeek:", v32);
      v34 = v33;
      if (v30)
      {
        lastScrollPositionSecond = self->_lastScrollPositionSecond;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "weekView"));
        objc_msgSend(v36, "setFirstVisibleSecond:", lastScrollPositionSecond);

      }
      -[NSMutableArray insertObject:atIndex:](self->_visibleWeeks, "insertObject:atIndex:", v34, 0);
      v37 = -[UIScrollView isTracking](self->_weekScroller, "isTracking")
          ? (id)1
          : -[UIScrollView isScrollAnimating](self->_weekScroller, "isScrollAnimating");
      objc_msgSend(v34, "setAsyncLoading:", v37);
      if (objc_msgSend(v34, "asyncLoading"))
        objc_msgSend(v34, "loadDataAsyncWithCompletion:reverse:", v31, 1);
      else
        objc_msgSend(v34, "reloadData");

      --v32;
    }
    while (v32 != -1);
  }
  if (v7 && v6 < &v6[v7])
  {
    do
    {
      v38 = -[WeekViewController _createPreparedViewForWeek:](self, "_createPreparedViewForWeek:", v6);
      v39 = v38;
      if (v30)
      {
        v40 = self->_lastScrollPositionSecond;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "weekView"));
        objc_msgSend(v41, "setFirstVisibleSecond:", v40);

      }
      -[NSMutableArray addObject:](self->_visibleWeeks, "addObject:", v39);
      if (-[UIScrollView isTracking](self->_weekScroller, "isTracking"))
        v42 = 1;
      else
        v42 = (uint64_t)-[UIScrollView isScrollAnimating](self->_weekScroller, "isScrollAnimating");
      objc_msgSend(v39, "setAsyncLoading:", v42);
      if (objc_msgSend(v39, "asyncLoading"))
        objc_msgSend(v39, "loadDataAsyncWithCompletion:reverse:", v31, 0);
      else
        objc_msgSend(v39, "reloadData");

      ++v6;
      --v7;
    }
    while (v7);
  }
  self->_visibleRange.location = v47;
  self->_visibleRange.length = length;
  -[WeekViewController updateVisibleRects](self, "updateVisibleRects");
  -[WeekViewController _updateAllDayView](self, "_updateAllDayView");
  -[WeekViewController _updateHeaderHeightsAnimated:](self, "_updateHeaderHeightsAnimated:", v49);

}

- (void)_updateAllDayView
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_visibleWeeks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekView", (_QWORD)v12));
        v9 = objc_msgSend(v8, "hasAllDayEvents");

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekView"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allDayView"));
          objc_msgSend(v11, "setNeedsLayout");

        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)_updateTimeMarker
{
  _BOOL8 v3;
  _BOOL8 v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = -[WeekViewController isTodayVisible](self, "isTodayVisible");
  -[WeekTimeView setShowsTimeMarker:](self->_timeView, "setShowsTimeMarker:", v3);
  -[WeekTimeView updateMarkerPosition](self->_timeView, "updateMarkerPosition");
  v4 = -[WeekViewController _isLeadingEdgeToday](self, "_isLeadingEdgeToday");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_visibleWeeks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weekView"));
        objc_msgSend(v11, "hideNowDot:", v4);

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weekView"));
        objc_msgSend(v12, "updateMarkerPosition");

        if (v3 & objc_msgSend(v10, "showsTimeMarker"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weekView"));
          objc_msgSend(v13, "updateTimeMarkerForDayChange");

        }
        else
        {
          objc_msgSend(v10, "setShowsTimeMarker:", v3);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_reusableViews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "weekView", (_QWORD)v22));
        objc_msgSend(v20, "hideNowDot:", v4);

        if (v3 & objc_msgSend(v19, "showsTimeMarker"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "weekView"));
          objc_msgSend(v21, "updateTimeMarkerForDayChange");

        }
        else
        {
          objc_msgSend(v19, "setShowsTimeMarker:", v3);
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  -[WeekViewController _updateTimeMarkerExtensionColor:](self, "_updateTimeMarkerExtensionColor:", v4);
  if (v3)
    -[WeekViewController _startMarkerTimer](self, "_startMarkerTimer");
  else
    -[WeekViewController _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
}

- (BOOL)_isLeadingEdgeToday
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;

  if ((CalInterfaceIsLeftToRight(self) & 1) != 0)
    v3 = objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
  v4 = (void *)v3;
  v5 = CUIKCalendar(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v4));

  v10 = CUIKTodayDate(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v7, "isEqualToDate:", v11);

  return v12;
}

- (void)_updateTimeMarkerExtensionColor:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor cuik_todayTimelineColor](UIColor, "cuik_todayTimelineColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor cuik_nonTodayTimelineColor](UIColor, "cuik_nonTodayTimelineColor"));
  v5 = (id)v4;
  -[WeekTimeView setTimeMarkerExtensionColor:](self->_timeView, "setTimeMarkerExtensionColor:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  _BOOL8 v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  if (!self->_preventScrollUpdates)
  {
    -[WeekViewController layoutCellsAnimated:](self, "layoutCellsAnimated:", -[WeekViewController userInitiatedScroll](self, "userInitiatedScroll", a3));
    if (-[WeekViewController userInitiatedScroll](self, "userInitiatedScroll"))
      -[WeekViewController updateDisplayedDateForCurrentScrollOffset](self, "updateDisplayedDateForCurrentScrollOffset");
    v4 = -[WeekViewController _isLeadingEdgeToday](self, "_isLeadingEdgeToday");
    -[WeekViewController _updateTimeMarkerExtensionColor:](self, "_updateTimeMarkerExtensionColor:", v4);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_visibleWeeks;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "weekView"));
          objc_msgSend(v10, "hideNowDot:", v4);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_reusableViews;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), "weekView", (_QWORD)v17));
          objc_msgSend(v16, "hideNowDot:", v4);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)userInitiatedScroll
{
  if (-[WeekViewController userIsScrolling](self, "userIsScrolling"))
    return 1;
  else
    return -[WeekViewController userIsDragging](self, "userIsDragging");
}

- (BOOL)userIsDragging
{
  return self->_previousGestureDate != 0;
}

- (BOOL)userIsScrolling
{
  return self->_isUserScrolling;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isUserScrolling = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[WeekViewController snapTargetScrollOffset:withVelocity:](self, "snapTargetScrollOffset:withVelocity:", a5, a4.x, a4.y);
}

- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int IsLeftToRight;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  double y;
  WeekViewController *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  id v28;
  CGFloat v29;
  id v30;

  x = a4.x;
  v7 = -[WeekViewController displaysDatesSnappedToWeekBoundaries](self, "displaysDatesSnappedToWeekBoundaries", a4.x, a4.y);
  -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:"));
  v9 = objc_claimAutoreleasedReturnValue(-[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", a3->x, a3->y));
  v10 = (void *)v9;
  if (v7)
  {
    v11 = objc_msgSend(v8, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v9));
    v30 = (id)objc_claimAutoreleasedReturnValue(v11);

    v13 = objc_msgSend(v10, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v12));
    v14 = objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForDay"));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateForDay"));
  }
  v15 = (void *)v14;

  IsLeftToRight = CalTimeDirectionIsLeftToRight(v16, v17);
  v19 = -x;
  if (IsLeftToRight)
    v19 = x;
  if (v19 > 0.5)
  {
    if (objc_msgSend(v30, "compare:", v15) != (id)-1)
    {
      if (v7)
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendarDateByAddingWeeks:", 1));
      else
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendarDateByAddingDays:", 1));
      goto LABEL_17;
    }
    v22 = a3->x;
    y = a3->y;
    v24 = self;
    v25 = v7;
LABEL_15:
    v20 = objc_claimAutoreleasedReturnValue(-[WeekViewController _snapDateForOffset:snapToWeeks:](v24, "_snapDateForOffset:snapToWeeks:", v25, v22, y));
LABEL_17:
    v26 = (void *)v20;
    goto LABEL_23;
  }
  if (v19 >= -0.5)
  {
    v22 = a3->x;
    y = a3->y;
    v24 = self;
    v25 = 0;
    goto LABEL_15;
  }
  if (v7)
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "calendarDateByAddingWeeks:", -1));
  else
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "calendarDateByAddingDays:", -1));
  v27 = v21;
  if (objc_msgSend(v21, "compare:", v15) == (id)1)
    v28 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _snapDateForOffset:snapToWeeks:](self, "_snapDateForOffset:snapToWeeks:", v7, a3->x, a3->y));
  else
    v28 = v15;
  v26 = v28;

LABEL_23:
  -[WeekViewController _xOffsetForDate:](self, "_xOffsetForDate:", v26);
  a3->x = v29;

}

- (id)_snapDateForOffset:(CGPoint)a3 snapToWeeks:(BOOL)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:"));
  v9 = v8;
  if (a4)
  {
    v10 = objc_msgSend(v8, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v8));
    v11 = objc_claimAutoreleasedReturnValue(v10);

    -[WeekViewController weekWidth](self, "weekWidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", x + v12 * 0.5, y));
    v14 = objc_msgSend(v13, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v9 = (void *)v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", x + 0.0, y));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateForDay"));
  }

  if (objc_msgSend(v15, "isEqual:", v9))
    v16 = v9;
  else
    v16 = v15;
  v17 = v16;

  return v17;
}

- (BOOL)shouldSnapToWeeksOnFlicks
{
  return 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[WeekViewController draggingDone](self, "draggingDone", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[WeekViewController draggingDone](self, "draggingDone", a3);
  self->_isUserScrolling = 0;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[WeekViewController draggingDone](self, "draggingDone", a3);
  v5 = objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
  if (!v5)
  {
    -[WeekViewController layoutCellsAnimated:](self, "layoutCellsAnimated:", 0);
    v5 = objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
    if (!v5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeekViewController.m"), 1366, CFSTR("Found nil date components for first visible subview."));

      v5 = 0;
    }
  }
  v18 = (id)v5;
  v6 = CUIKCalendar(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v18));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateByAddingDays:", -[WeekViewController daysInWeek](self, "daysInWeek")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("WeekViewController_ScrollDidEndAnimationRangeStartKey"), v14, CFSTR("WeekViewController_ScrollDidEndAnimationRangeEndKey"), 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("WeekViewController_ScrollDidEndAnimationNotification"), self, v15);

}

- (void)draggingDone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WeekViewController updatePreferredReloadRange](self, "updatePreferredReloadRange");
  -[WeekViewController adjustVisibleAllDayOccurrenceLabelsAnimated:](self, "adjustVisibleAllDayOccurrenceLabelsAnimated:", 1);
  -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController centerDateComponents](self, "centerDateComponents"));
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v8, v5));

    CalAnalyticsSendEventLazy(CFSTR("UserNavigated"), &stru_1001B36C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    objc_msgSend(v7, "setSelectedDate:", v6);

  }
  -[WeekViewController updateDisplayedDateForCurrentScrollOffset](self, "updateDisplayedDateForCurrentScrollOffset");
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
  -[WeekViewController _updateShouldAnnotateAppEntities](self, "_updateShouldAnnotateAppEntities");

}

- (void)_updateShouldAnnotateAppEntities
{
  void *v3;
  void *v4;
  NSDate *v5;
  NSDate *cachedEarliestDate;
  void *v7;
  NSDate *v8;
  NSDate *cachedLatestDate;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v4));
  cachedEarliestDate = self->_cachedEarliestDate;
  self->_cachedEarliestDate = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v7));
  cachedLatestDate = self->_cachedLatestDate;
  self->_cachedLatestDate = v8;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_visibleWeeks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14), "shouldAnnotateAppEntitiesChanged");
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_reusableViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "shouldAnnotateAppEntitiesChanged", (_QWORD)v20);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (int64_t)firstVisibleSecond
{
  NSMutableArray *v2;
  void *v3;
  id v4;
  _OWORD v6[4];
  _BYTE v7[128];

  memset(v6, 0, sizeof(v6));
  v2 = self->_visibleWeeks;
  if (-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(**((id **)&v6[0] + 1), "weekView", *(_QWORD *)&v6[0]));
    v4 = objc_msgSend(v3, "firstVisibleSecond");

  }
  else
  {
    v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setFirstVisibleSecond:(int64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_visibleWeeks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "weekView", (_QWORD)v10));
        objc_msgSend(v9, "setFirstVisibleSecond:", a3);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)occurrencesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSDate *reloadDateRangeStart;
  void *v12;
  NSDate *reloadDateRangeEnd;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[NSMutableArray count](self->_visibleWeeks, "count");
  v5 = v15;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      reloadDateRangeStart = self->_reloadDateRangeStart;
      if (!reloadDateRangeStart
        || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate earlierDate:](reloadDateRangeStart, "earlierDate:", v7)),
            v12,
            v12 == v7))
      {
        objc_storeStrong((id *)&self->_reloadDateRangeStart, v7);
      }
      reloadDateRangeEnd = self->_reloadDateRangeEnd;
      if (!reloadDateRangeEnd
        || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](reloadDateRangeEnd, "laterDate:", v9)),
            v14,
            v14 == v9))
      {
        objc_storeStrong((id *)&self->_reloadDateRangeEnd, v9);
      }
    }
    -[WeekViewController _reloadDataIfVisible](self, "_reloadDataIfVisible");
    -[WeekViewController _updateSelectedViewsToMatchModel](self, "_updateSelectedViewsToMatchModel");

    v5 = v15;
  }

}

- (void)_reloadDataIfVisible
{
  NSMutableArray *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_visibleWeeks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "asyncLoading", (_QWORD)v15);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));

  if (v11
    && (!objc_msgSend(v11, "activationState") || objc_msgSend(v11, "activationState") == (id)1)
    && self->_viewWillAppearCalled
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window")),
        v14 = objc_msgSend(v13, "isRotating") | v6,
        v13,
        v12,
        (v14 & 1) == 0))
  {
    -[WeekViewController reloadData](self, "reloadData");
  }
  else
  {
    self->_needsReload = 1;
  }

}

- (void)loadDataAsync
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSDate *reloadDateRangeStart;
  NSDate *reloadDateRangeEnd;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_visibleWeeks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setAsyncLoading:", 1);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100077B10;
        v11[3] = &unk_1001B36F0;
        v11[4] = self;
        objc_msgSend(v8, "loadDataAsyncWithCompletion:reverse:", v11, 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  reloadDateRangeStart = self->_reloadDateRangeStart;
  self->_reloadDateRangeStart = 0;

  reloadDateRangeEnd = self->_reloadDateRangeEnd;
  self->_reloadDateRangeEnd = 0;

  self->_needsReload = 0;
}

- (void)reloadData
{
  id v3;
  int *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSComparisonResult v16;
  id v17;
  uint64_t v19;
  void *v20;
  NSDate *reloadDateRangeEnd;
  uint64_t v22;
  id v23;
  NSMutableArray *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_visibleWeeks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v4 = &OBJC_IVAR___WeekView__verticalGridExtensionImage;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v26;
    v22 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      v23 = v5;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v7);
        v9 = v4[129];
        if (*(Class *)((char *)&self->super.super.super.super.isa + v9) && self->_reloadDateRangeEnd)
        {
          v10 = v4;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendar"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "weekStartDate"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromComponents:", v13));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastSecondOfWeek"));
          v16 = -[NSDate compare:](self->_reloadDateRangeEnd, "compare:", v14);
          v17 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "compare:", v15);
          if (v16 != NSOrderedAscending && v17 != (id)1)
            objc_msgSend(v8, "reloadData");

          v4 = v10;
          v6 = v22;
          v5 = v23;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v7), "reloadData");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  -[WeekViewController _updateHeaderHeightsAnimated:](self, "_updateHeaderHeightsAnimated:", 0);
  v19 = v4[129];
  v20 = *(Class *)((char *)&self->super.super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.super.isa + v19) = 0;

  reloadDateRangeEnd = self->_reloadDateRangeEnd;
  self->_reloadDateRangeEnd = 0;

  self->_needsReload = 0;
}

- (void)updatePreferredReloadRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController centerDateComponents](self, "centerDateComponents"));
  if (v14)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v14, v5));

    v8 = CUIKOneIndexedWeekStart(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateForWeekWithWeekStart:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForEndOfWeekWithWeekStart:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
    objc_msgSend(v11, "setPreferredReloadStartDate:endDate:", v12, v13);

  }
}

- (id)weekView:(id)a3 allEventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v8, v7, 1, 1));

  return v10;
}

- (id)weekView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v8, v7, 1, 0));

  return v10;
}

- (id)presentationControllerForEditMenu
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController currentPresentationController](self, "currentPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v3)
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (id)selectedEventsForEditMenu
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedOccurrences"));

  return v3;
}

- (void)weekGroupAllDaySectionDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = v4;
  if (!self->_updatingAllDayContentOffset)
  {
    self->_updatingAllDayContentOffset = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allDayView"));
    objc_msgSend(v7, "contentOffset");
    v9 = v8;
    v11 = v10;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_visibleWeeks;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
          if (v17 != v5)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView", (_QWORD)v20));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allDayView"));
            objc_msgSend(v19, "setContentOffset:", v9, v11);

          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    self->_updatingAllDayContentOffset = 0;
  }

}

- (id)weekGroupForWeekBefore:(id)a3
{
  void *v4;

  if ((char *)-[NSMutableArray indexOfObject:](self->_visibleWeeks, "indexOfObject:", a3) - 1 > (char *)0x7FFFFFFFFFFFFFFDLL)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:"));
  return v4;
}

- (id)weekGroupForWeekAfter:(id)a3
{
  char *v4;
  char *v5;
  void *v6;

  v4 = (char *)-[NSMutableArray indexOfObject:](self->_visibleWeeks, "indexOfObject:", a3);
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (v5 = v4 + 1, v4 + 1 >= -[NSMutableArray count](self->_visibleWeeks, "count")))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", v5));
  }
  return v6;
}

- (void)weekGroup:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  unsigned __int8 v18;
  uint8_t v19[16];

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  objc_msgSend(v9, "setDateForPaste:", v10);

  if ((-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress") & 1) == 0)
  {
    -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](self->_eventGestureController, "occurrenceDate"));
      -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v12, v13);

      -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
    }
    else if (v7)
    {
      if (v5)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController presentedViewController](self, "presentedViewController"));
        v15 = objc_msgSend(v14, "isBeingDismissed");

        if ((v15 & 1) != 0)
        {
          v16 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Week view cannot present event details: presentation is currently dismissing", v19, 2u);
          }
        }
        else
        {
          -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v7, 1, 1, 0);
        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
        v18 = objc_msgSend(v17, "containsObject:", v7);

        if ((v18 & 1) == 0)
          -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v7);
      }
    }
  }

}

- (void)weekGroup:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  uint8_t v16[16];

  v5 = a5;
  v7 = a4;
  if ((-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress") & 1) == 0)
  {
    -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](self->_eventGestureController, "occurrenceDate"));
      -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v9, v10);

      -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
    }
    else if (v7)
    {
      if (v5)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController presentedViewController](self, "presentedViewController"));
        v12 = objc_msgSend(v11, "isBeingDismissed");

        if ((v12 & 1) != 0)
        {
          v13 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Week view cannot present event details: presentation is currently dismissing", v16, 2u);
          }
        }
        else
        {
          -[WeekViewController showEvents:animated:showMode:context:](self, "showEvents:animated:showMode:context:", v7, 1, 1, 0);
        }
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
        v15 = objc_msgSend(v14, "isEqualToArray:", v7);

        if ((v15 & 1) == 0)
          -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", v7);
      }
    }
  }

}

- (void)didEditEvent:(id)a3 creationMethod:(unint64_t)a4
{
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekViewController:didEditEvent:creationMethod:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "weekViewController:didEditEvent:creationMethod:", self, v9, a4);

  }
}

- (void)synchronizeWeekGroupScrollingToWeek:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_visibleWeeks, "count") >= 2)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_visibleWeeks;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9);
          if (v10 != v4)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weekView", (_QWORD)v21));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekView"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
            objc_msgSend(v13, "contentOffset");
            objc_msgSend(v11, "setScrollerContentOffset:");

          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

  }
  -[WeekViewController updateVisibleRects](self, "updateVisibleRects", (_QWORD)v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scrollView"));
  objc_msgSend(v15, "contentOffset");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView scrollView](self->_timeView, "scrollView"));
  objc_msgSend(v20, "setContentOffset:", v17, v19);

}

- (void)weekGroupViewDidLayout:(id)a3
{
  void *v4;
  void *v5;
  EKEventGestureController *eventGestureController;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
  if (v4 && -[WeekViewController _weekGroup:containsOccurrence:](self, "_weekGroup:containsOccurrence:", v8, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventIdentifier"));
    if (v5)
    {

    }
    else if ((objc_msgSend(v4, "isNew") & 1) == 0)
    {
      -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
      goto LABEL_7;
    }
    eventGestureController = self->_eventGestureController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](eventGestureController, "occurrenceDate"));
    -[EKEventGestureController forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:](eventGestureController, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v4, v7, 1, 1, 0);

  }
LABEL_7:

}

- (void)weekGroupViewOccurrenceLayoutDidChange:(id)a3
{
  -[EKEventGestureController updateDraggingOccurrenceFrame](self->_eventGestureController, "updateDraggingOccurrenceFrame", a3);
}

- (BOOL)weekGroupViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;

  v6 = a4;
  if (objc_msgSend(a3, "isInUse"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    if ((objc_msgSend(v7, "CalIsBeforeDate:", self->_cachedEarliestDate) & 1) != 0)
      LOBYTE(v8) = 0;
    else
      v8 = objc_msgSend(v7, "CalIsAfterDate:", self->_cachedLatestDate) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_weekGroup:(id)a3 containsOccurrence:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "startDate"));
  v7 = objc_msgSend(v5, "containsDate:", v6);

  return v7;
}

- (void)_setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_visibleWeeks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "weekView", (_QWORD)v11));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
        objc_msgSend(v10, "setReduceLayoutProcessingForAnimation:", v3);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_setHourHeightScale:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double weekViewHourHeightScale;
  NSMutableArray *v11;
  id v12;
  id v13;
  double v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double Width;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  CGRect v46;

  -[WeekViewController maximumHourScale](self, "maximumHourScale");
  if (v5 <= a3)
    a3 = v5;
  -[WeekViewController minimumHourScale](self, "minimumHourScale");
  if (a3 >= v6)
    v6 = a3;
  self->_weekViewHourHeightScale = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v7), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v9 = v8;
  weekViewHourHeightScale = self->_weekViewHourHeightScale;

  -[WeekTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:", self->_weekViewHourHeightScale);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = self->_visibleWeeks;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v9 * weekViewHourHeightScale;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "setHourHeightScale:", self->_weekViewHourHeightScale, (_QWORD)v41);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scrollView"));
        objc_msgSend(v19, "contentSize");
        v21 = v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "scrollView"));
        objc_msgSend(v23, "setContentSize:", v21, v14);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "content"));
        objc_msgSend(v25, "frame");
        v27 = v26;
        v29 = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "content"));
        objc_msgSend(v31, "bounds");
        Width = CGRectGetWidth(v46);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "content"));
        objc_msgSend(v34, "setFrame:", v27, v29, Width, v14);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "content"));
        objc_msgSend(v36, "setNeedsLayout");

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v13);
  }

  -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndex:", 0));
    -[WeekViewController synchronizeWeekGroupScrollingToWeek:](self, "synchronizeWeekGroupScrollingToWeek:", v40);

  }
}

- (void)_weekScrollerDoubleTapped:(id)a3
{
  NSMutableArray *visibleWeeks;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double weekViewHourHeightScale;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;

  visibleWeeks = self->_visibleWeeks;
  v5 = a3;
  v44 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](visibleWeeks, "objectAtIndex:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "weekView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "grid"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v5, "locationInView:", v9);
  v11 = v10;

  objc_msgSend(v5, "locationInView:", v8);
  v13 = v12;
  v15 = v14;

  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  v17 = v16 / self->_weekViewHourHeightScale;
  -[WeekViewController _setHourHeightScale:](self, "_setHourHeightScale:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  weekViewHourHeightScale = self->_weekViewHourHeightScale;
  *(float *)&weekViewHourHeightScale = weekViewHourHeightScale;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", weekViewHourHeightScale));
  objc_msgSend(v18, "setWeekViewHourScale:", v20);

  v21 = self->_weekViewHourHeightScale;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
  objc_msgSend(v22, "setWeekViewHourScale:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v23, "convertPoint:fromView:", v8, v13, v15 * v17);
  v25 = v24;

  v26 = v25 - v11;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "weekView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "scrollView"));
  objc_msgSend(v28, "contentOffset");
  v30 = v29;
  v32 = v31;

  v33 = v26 + v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", EKUIWidthSizeClassForViewHierarchy(v34), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"), self->_weekViewHourHeightScale);
  v36 = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "weekView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "scrollView"));
  objc_msgSend(v38, "frame");
  v40 = v36 - v39;

  v41 = 0.0;
  if (v33 >= 0.0)
    v41 = v33;
  if (v41 < v40)
    v40 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "weekView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "scrollView"));
  objc_msgSend(v43, "setContentOffset:animated:", 0, v30, v40);

}

- (double)minimumHourScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[UIScrollView frame](self->_weekScroller, "frame");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v5), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v7 = v6;

  return fmax(v4 / v7, 0.62);
}

- (double)maximumHourScale
{
  return 1.66;
}

- (void)_updateWeekViewContentHeight
{
  void *v3;
  double v4;
  double v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double Width;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  CGRect v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", EKUIWidthSizeClassForViewHierarchy(v3), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"), self->_weekViewHourHeightScale);
  v5 = v4;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_visibleWeeks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "setHourHeightScale:", self->_weekViewHourHeightScale, (_QWORD)v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
        objc_msgSend(v13, "contentSize");
        v15 = v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scrollView"));
        objc_msgSend(v17, "setContentSize:", v15, v5);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "content"));
        objc_msgSend(v19, "frame");
        v21 = v20;
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "content"));
        objc_msgSend(v25, "bounds");
        Width = CGRectGetWidth(v34);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
        objc_msgSend(v28, "setFrame:", v21, v23, Width, v5);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

}

- (void)_weekScrollerPinched:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  double weekViewHourHeightScale;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double x;
  double y;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
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
  BOOL v32;
  double v33;
  double v34;
  double v36;
  double v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  id v71;

  v71 = a3;
  v4 = (char *)objc_msgSend(v71, "state");
  if ((unint64_t)(v4 - 3) <= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController visibleWeeks](self, "visibleWeeks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    -[WeekViewController synchronizeWeekGroupScrollingToWeek:](self, "synchronizeWeekGroupScrollingToWeek:", v6);

    -[WeekViewController _setReduceLayoutProcessingForAnimation:](self, "_setReduceLayoutProcessingForAnimation:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
    weekViewHourHeightScale = self->_weekViewHourHeightScale;
    *(float *)&weekViewHourHeightScale = weekViewHourHeightScale;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", weekViewHourHeightScale));
    objc_msgSend(v7, "setWeekViewHourScale:", v9);

    v10 = self->_weekViewHourHeightScale;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel persistedSceneState](self->super._model, "persistedSceneState"));
    objc_msgSend(v11, "setWeekViewHourScale:", v10);

    -[WeekViewController reloadData](self, "reloadData");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    objc_msgSend(v12, "setNeedsLayout");

  }
  v13 = (unint64_t)objc_msgSend(v71, "numberOfTouches");
  if ((v13 | 2) == 2)
  {
    v14 = v13;
    x = self->_lastPinchPoint1.x;
    y = self->_lastPinchPoint1.y;
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
      objc_msgSend(v71, "locationOfTouch:inView:", 0, v17);
      self->_lastPinchPoint1.x = v18;
      self->_lastPinchPoint1.y = v19;

    }
    if (v4 == (char *)2)
    {
      if (v14)
      {
        v21 = pinchDistanceForGestureRecognizer(v71, self->_weekScroller);
        v23 = self->_lastPinchDistance.y;
        v24 = v22 / v23;
        v25 = v21 - self->_lastPinchDistance.x;
        if (v25 < 0.0)
          v25 = -v25;
        v26 = v22 - v23;
        if (v26 < 0.0)
          v26 = -v26;
        if (v25 <= v26)
          v27 = v24;
        else
          v27 = 1.0;
        self->_lastPinchDistance.x = v21;
        self->_lastPinchDistance.y = v22;
      }
      else
      {
        objc_msgSend(v71, "scale");
        v27 = fabs(v29 / self->_lastPinchScale);
        self->_lastPinchScale = v29;
      }
      v30 = v27 * self->_weekViewHourHeightScale;
      -[WeekViewController minimumHourScale](self, "minimumHourScale");
      v32 = v27 <= 1.0 && v30 < v31;
      if (v32 || (-[WeekViewController maximumHourScale](self, "maximumHourScale"), v30 > v33))
      {
        -[WeekViewController minimumHourScale](self, "minimumHourScale");
        if (1.0 - v27 > 0.01 && v30 < v34)
          goto LABEL_49;
        -[WeekViewController maximumHourScale](self, "maximumHourScale");
        v37 = v27 + -1.0;
        v27 = 1.0;
        if (v37 > 0.01 && v30 > v36)
          goto LABEL_49;
      }
      else
      {
        self->_weekViewHourHeightScale = v30;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", 0));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "weekView"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "content"));

      if (v14)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
        objc_msgSend(v41, "convertPoint:fromView:", v42, x, y);
        v44 = v43;
        v46 = v45;

      }
      else
      {
        objc_msgSend(v71, "locationInView:", v41);
        v44 = v47;
        v46 = v48;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
      +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", EKUIWidthSizeClassForViewHierarchy(v49), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"), self->_weekViewHourHeightScale);
      v51 = v50;

      -[WeekTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:", self->_weekViewHourHeightScale);
      -[WeekViewController _updateWeekViewContentHeight](self, "_updateWeekViewContentHeight");
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "weekView"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "scrollView"));
      objc_msgSend(v53, "contentOffset");
      v55 = v54;
      v57 = v56;

      if (v14)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
        objc_msgSend(v58, "convertPoint:fromView:", v41, v44, v27 * v46);
        v60 = v59;

        v61 = v60 - self->_lastPinchPoint1.y;
      }
      else
      {
        objc_msgSend(v71, "locationInView:", v41);
        v61 = v27 * v46 - v62;
      }
      v63 = v57 + v61;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "weekView"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "scrollView"));
      objc_msgSend(v65, "frame");
      v67 = v51 - v66;

      v68 = 0.0;
      if (v63 >= 0.0)
        v68 = v63;
      if (v68 >= v67)
        v69 = v67;
      else
        v69 = v68;
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "weekView"));
      objc_msgSend(v70, "setScrollerContentOffset:", v55, v69);

      -[WeekViewController _updateTimeMarker](self, "_updateTimeMarker");
      -[EKEventGestureController updateDraggingOccurrenceFrame](self->_eventGestureController, "updateDraggingOccurrenceFrame");

    }
    else if (v4 == (char *)1)
    {
      if (v14)
      {
        self->_lastPinchDistance.x = pinchDistanceForGestureRecognizer(v71, self->_weekScroller);
        self->_lastPinchDistance.y = v20;
      }
      else
      {
        objc_msgSend(v71, "scale");
        self->_lastPinchScale = v28;
      }
      -[WeekViewController _setReduceLayoutProcessingForAnimation:](self, "_setReduceLayoutProcessingForAnimation:", 1);
    }
  }
LABEL_49:

}

- (void)tappedOnDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pasteboardManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

  objc_msgSend(v5, "setDateForPaste:", v6);
}

- (void)adjustVisibleAllDayOccurrenceLabelsAnimated:(BOOL)a3
{
  objc_class *v4;
  int64_t v5;
  void *v6;
  double v7;
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *i;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  void *v74;
  void *v75;
  id v76;
  unsigned int v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  NSMutableArray *obj;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  double width;
  double v89;
  _BOOL4 v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double v95;
  _QWORD rect1[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v90 = a3;
  v4 = -[WeekViewController weekViewClass](self, "weekViewClass");
  v5 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](v4, "dayWidthForOrientation:withViewInViewHierarchy:", v5, v6);
  v95 = v7;

  v8 = -[WeekTimeView bounds](self->_timeView, "bounds");
  v89 = CalRoundToScreenScale(v8, v10, v9 + -0.5);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = self->_visibleWeeks;
  v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
  if (v84)
  {
    v11 = 0;
    v83 = *(_QWORD *)v100;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v100 != v83)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "weekView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allDayView"));

        -[UIScrollView bounds](self->_weekScroller, "bounds");
        objc_msgSend(v15, "convertRect:fromView:", self->_weekScroller);
        v93 = v17;
        v94 = v16;
        v91 = v19;
        v92 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "calendar"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "weekStartDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateFromComponents:", v22));

        v86 = v12;
        v87 = v11;
        if (v11 < 1)
        {
          width = -1.0;
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", v11 - 1));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
          objc_msgSend(v24, "frame");
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));
          objc_msgSend(v25, "convertRect:fromView:", v34, v27, v29, v31, v33);
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
          -[UIScrollView bounds](self->_weekScroller, "bounds");
          objc_msgSend(v43, "convertRect:fromView:", self->_weekScroller);
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;

          v105.origin.x = v36;
          v105.origin.y = v38;
          v105.size.width = v40;
          v105.size.height = v42;
          v109.origin.x = v45;
          v109.origin.y = v47;
          v109.size.width = v49;
          v109.size.height = v51;
          v106 = CGRectIntersection(v105, v109);
          width = v106.size.width;

        }
        v97 = 0u;
        v98 = 0u;
        memset(&rect1[1], 0, 32);
        v85 = v15;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "occurrenceViews"));
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &rect1[1], v103, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)rect1[3];
          do
          {
            for (i = 0; i != v54; i = (char *)i + 1)
            {
              if (*(_QWORD *)rect1[3] != v55)
                objc_enumerationMutation(v52);
              v57 = *(void **)(rect1[2] + 8 * (_QWORD)i);
              objc_msgSend(v57, "frame");
              v59 = v58;
              v61 = v60;
              v63 = v62;
              v65 = v64;
              objc_msgSend(v57, "frame");
              v67 = v66;
              v69 = v68;
              v71 = v70;
              v73 = v72;
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "occurrence"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "startDate"));
              v76 = objc_msgSend(v75, "compare:", v23);

              if (v76 != (id)-1)
                goto LABEL_18;
              if (width >= v95)
              {
                objc_msgSend(v57, "setHideText:", 1, v95, width);
LABEL_18:
                v77 = 0;
                goto LABEL_19;
              }
              v77 = objc_msgSend(v57, "hideText", v95, width);
LABEL_19:
              v107.origin.x = v67;
              v107.origin.y = v69;
              v107.size.width = v71;
              v107.size.height = v73;
              v110.origin.x = v94;
              v110.origin.y = v93;
              v110.size.width = v92;
              v110.size.height = v91;
              v108 = CGRectIntersection(v107, v110);
              v78 = v108.size.width;
              v108.origin.x = v59;
              v108.origin.y = v61;
              v108.size.width = v63;
              v108.size.height = v65;
              v111.origin.x = v94;
              v111.origin.y = v93;
              v111.size.width = v92;
              v111.size.height = v91;
              if (!CGRectIntersectsRect(v108, v111) && v78 >= v95)
              {
                v79 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
                objc_msgSend(v57, "convertPoint:fromView:", v79, v89, 0.0);
                v81 = v80;

                objc_msgSend(v57, "fadeInContentViewAt:minWidth:animated:", v90, v81, v95);
              }
              if (v77)
                objc_msgSend(v57, "setHideText:animate:", 0, 0);
            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &rect1[1], v103, 16);
          }
          while (v54);
        }
        v11 = v87 + 1;

        v12 = v86 + 1;
      }
      while ((id)(v86 + 1) != v84);
      v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
    }
    while (v84);
  }

}

- (unint64_t)daysInWeek
{
  return 7;
}

- (double)_xOffsetForDate:(id)a3
{
  id v4;
  double weekWidth;
  objc_class *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  objc_class *v23;
  int64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  objc_class *v29;
  int64_t v30;
  void *v31;

  v4 = a3;
  -[WeekViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  weekWidth = self->_weekWidth;
  v6 = -[WeekViewController weekViewClass](self, "weekViewClass");
  v7 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](v6, "dayWidthForOrientation:withViewInViewHierarchy:", v7, v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForDay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateForDay](self->_referenceWeekStart, "calendarDateForDay"));
  v13 = (uint64_t)objc_msgSend(v11, "differenceInDays:", v12);
  v14 = v13;
  if (v13 >= 0)
    v15 = v13;
  else
    v15 = -v13;
  v16 = self->_weekWidth;
  if (v15 % -[WeekViewController daysInWeek](self, "daysInWeek"))
  {
    v17 = -[WeekViewController daysInWeek](self, "daysInWeek");
    v18 = 0.0;
    while (v15 > v17)
    {
      v18 = v16 + v18;
      v15 -= -[WeekViewController daysInWeek](self, "daysInWeek");
      v17 = -[WeekViewController daysInWeek](self, "daysInWeek");
    }
    v21 = v18 + (double)v15 * v10 + EKUISeparatorLineThickness(v17);
  }
  else
  {
    v19 = -[WeekViewController daysInWeek](self, "daysInWeek");
    v21 = v16 * ((double)v15 / (double)v19) + 0.0;
  }
  if (v14 <= 0)
    v22 = -v21;
  else
    v22 = v21;
  if ((CalTimeDirectionIsLeftToRight(v19, v20) & 1) == 0)
  {
    v22 = -v22;
    v23 = -[WeekViewController weekViewClass](self, "weekViewClass");
    v24 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    v26 = -[objc_class displayedDaysForOrientation:withViewInViewHierarchy:](v23, "displayedDaysForOrientation:withViewInViewHierarchy:", v24, v25);
    v27 = -[WeekViewController daysInWeek](self, "daysInWeek");

    if (v26 != (id)v27)
    {
      v28 = -[WeekViewController daysInWeek](self, "daysInWeek");
      v29 = -[WeekViewController weekViewClass](self, "weekViewClass");
      v30 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
      v22 = v22
          + (double)(v28
                   + ~(unint64_t)-[objc_class displayedDaysForOrientation:withViewInViewHierarchy:](v29, "displayedDaysForOrientation:withViewInViewHierarchy:", v30, v31))* v10;

    }
  }

  return weekWidth * 27040.0 + v22;
}

- (double)currentScrollViewXOffset
{
  double result;

  -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  return result;
}

- (double)scrollToDisplayedDateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  EKCalendarDate *v6;
  EKCalendarDate *v7;
  EKCalendarDate *v8;
  id v9;
  id v10;
  double v11;
  double v12;

  v3 = a3;
  v5 = -[WeekViewController displaysDatesSnappedToWeekBoundaries](self, "displaysDatesSnappedToWeekBoundaries");
  v6 = self->_displayedDate;
  v7 = v6;
  if (self->_weekViewStartsOnToday)
    goto LABEL_2;
  if (!v5)
  {
    v8 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateByAddingDays:](v6, "calendarDateByAddingDays:", -(uint64_t)-[WeekViewController daysFromFirstToMiddleDay](self, "daysFromFirstToMiddleDay")));

    goto LABEL_8;
  }
  v9 = -[EKCalendarDate dayOfWeek](v6, "dayOfWeek");
  if (v9 == (id)CUIKOneIndexedWeekStart(v9))
  {
LABEL_2:
    v8 = v7;
  }
  else
  {
    do
    {
      v8 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateByAddingDays:](v7, "calendarDateByAddingDays:", -1));

      v10 = -[EKCalendarDate dayOfWeek](v8, "dayOfWeek");
      v7 = v8;
    }
    while (v10 != (id)CUIKOneIndexedWeekStart(v10));
  }
LABEL_8:
  -[WeekViewController _xOffsetForDate:](self, "_xOffsetForDate:", v8);
  v12 = v11;
  -[UIScrollView setContentOffset:animated:](self->_weekScroller, "setContentOffset:animated:", v3);
  if (!v3 && self->_viewIsVisible)
    -[WeekViewController scrollViewDidEndScrollingAnimation:](self, "scrollViewDidEndScrollingAnimation:", self->_weekScroller);

  return v12;
}

- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[WeekViewController _scrollEventIntoView:animated:durationOverride:completion:](self, "_scrollEventIntoView:animated:durationOverride:completion:", a3, a4, a5, 0.0);
}

- (void)scrollEventIntoView:(id)a3 animateWithDuration:(double)a4 completion:(id)a5
{
  -[WeekViewController _scrollEventIntoView:animated:durationOverride:completion:](self, "_scrollEventIntoView:animated:durationOverride:completion:", a3, 1, a5, a4);
}

- (void)_scrollEventIntoView:(id)a3 animated:(BOOL)a4 durationOverride:(double)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  _QWORD *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v10 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007A3BC;
  v23[3] = &unk_1001B27E8;
  v11 = a6;
  v24 = v11;
  v12 = objc_retainBlock(v23);
  v13 = (void (**)(_QWORD, _QWORD))v12;
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", v10, 0));
    if (!v14)
    {
      v22 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeZone"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v15, v18));

      v8 = v22;
      -[WeekViewController setDisplayedDate:animated:](self, "setDisplayedDate:animated:", v19, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", v10, 0));

    }
    if ((objc_msgSend(v10, "isAllDay") & 1) != 0 || !v14)
    {
      v13[2](v13, 0);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "weekView"));
      v21 = v20;
      if (a5 > 0.0 && (_DWORD)v8)
        objc_msgSend(v20, "scrollToEvent:animateWithDuration:completion:", v10, v11, a5);
      else
        objc_msgSend(v20, "scrollToEvent:animated:completion:", v10, v8, v11);

    }
  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v12[2])(v12, 0);
  }

}

- (void)_scrollToCurrentTimeOfDayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  v5 = CUIKNowComponents(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[WeekViewController _scrollToSecond:animated:completion:](self, "_scrollToSecond:animated:completion:", (char *)objc_msgSend(v6, "second")+ 3600 * (_QWORD)objc_msgSend(v6, "hour")+ 60 * (_QWORD)objc_msgSend(v6, "minute"), v3, 0);

}

- (void)_scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_visibleWeeks;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "weekView", (_QWORD)v15));
        objc_msgSend(v14, "scrollToSecond:animated:completion:", a3, v5, v8);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (unint64_t)daysFromFirstToMiddleDay
{
  objc_class *v3;
  int64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[WeekViewController weekViewClass](self, "weekViewClass");
  v4 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  v6 = vcvtmd_u64_f64((double)(unint64_t)-[objc_class displayedDaysForOrientation:withViewInViewHierarchy:](v3, "displayedDaysForOrientation:withViewInViewHierarchy:", v4, v5)/ 2.001);

  return v6;
}

- (id)firstDisplayedDate
{
  return -[EKCalendarDate calendarDateByAddingDays:](self->_displayedDate, "calendarDateByAddingDays:", -(uint64_t)-[WeekViewController daysFromFirstToMiddleDay](self, "daysFromFirstToMiddleDay"));
}

- (void)updateWeekNumber
{
  uint64_t v3;
  void *v4;
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_showWeekNumber)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_displayedDate, "date"));
    v3 = CUIKCalendar(v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "component:fromDate:", 0x2000, v13);

    if (v5 != (id)self->_currentlyDisplayedWeekNumber)
    {
      *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("W%@"), &stru_1001B67C0, 0));
      v10 = CUIKLocalizedStringForInteger(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11));

      -[WeekTimeView setWeekNumberText:](self->_timeView, "setWeekNumberText:", v12);
      self->_currentlyDisplayedWeekNumber = (int64_t)v5;

    }
  }
}

- (void)setDisplayedDate:(id)a3 animated:(BOOL)a4
{
  -[WeekViewController setDisplayedDate:forceScroll:animated:](self, "setDisplayedDate:forceScroll:animated:", a3, 0, a4);
}

- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  unint64_t v9;
  EKCalendarDate *v10;
  id v11;
  EKCalendarDate *referenceWeekStart;
  EKCalendarDate *v13;
  EKCalendarDate *displayedDate;
  void *v15;
  id v16;

  v5 = a5;
  v8 = a3;
  v16 = v8;
  if (!self->_referenceWeekStart)
  {
    v9 = -[WeekViewController daysInWeek](self, "daysInWeek");
    if (v9 == 2)
    {
      v10 = (EKCalendarDate *)v16;
    }
    else
    {
      v11 = objc_msgSend(v16, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v9));
      v10 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(v11);
    }
    referenceWeekStart = self->_referenceWeekStart;
    self->_referenceWeekStart = v10;

    v8 = v16;
  }
  v13 = (EKCalendarDate *)objc_msgSend(v8, "copy");
  displayedDate = self->_displayedDate;
  self->_displayedDate = v13;

  -[WeekViewController updateWeekNumber](self, "updateWeekNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
  if (-[WeekViewController dateIsVisible:](self, "dateIsVisible:", v15) && !self->_weekViewStartsOnToday)
  {

    if (!a4)
      goto LABEL_10;
  }
  else
  {

  }
  -[WeekViewController scrollToDisplayedDateAnimated:](self, "scrollToDisplayedDateAnimated:", v5);
LABEL_10:
  -[WeekViewController updateBannerDateStrings](self, "updateBannerDateStrings");
  -[WeekViewController updatePreferredReloadRange](self, "updatePreferredReloadRange");

}

- (void)updateBackButtonTitle
{
  -[WeekViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", self->_displayedDate);
}

- (void)setDisplayedDate:(id)a3
{
  -[WeekViewController setDisplayedDate:animated:](self, "setDisplayedDate:animated:", a3, 0);
}

- (void)updateDisplayedDateForCurrentScrollOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EKCalendarDate **p_displayedDate;
  BOOL v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController centerDateComponents](self, "centerDateComponents"));
  if (v3)
  {
    v10 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v10, v6));

    p_displayedDate = &self->_displayedDate;
    if (!-[EKCalendarDate isEqual:](self->_displayedDate, "isEqual:", v7)
      || (!*p_displayedDate ? (v9 = v7 == 0) : (v9 = 1), !v9))
    {
      objc_storeStrong((id *)&self->_displayedDate, v7);
      -[WeekViewController displayedDateChanged:userInitiated:](self, "displayedDateChanged:userInitiated:", *p_displayedDate, -[WeekViewController userInitiatedScroll](self, "userInitiatedScroll"));
    }

    v3 = v10;
  }

}

- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4
{
  -[WeekViewController updateWeekNumber](self, "updateWeekNumber", a3, a4);
  -[WeekViewController updateBannerDateStrings](self, "updateBannerDateStrings");
  -[WeekViewController updateBackButtonTitle](self, "updateBackButtonTitle");
}

- (id)_earliestWeekGroup
{
  id v3;
  uint64_t v4;
  char IsLeftToRight;
  NSMutableArray *visibleWeeks;

  v3 = -[NSMutableArray count](self->_visibleWeeks, "count");
  if (v3)
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v3, v4);
    visibleWeeks = self->_visibleWeeks;
    if ((IsLeftToRight & 1) != 0)
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](visibleWeeks, "firstObject"));
    else
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](visibleWeeks, "lastObject"));
  }
  return v3;
}

- (id)_latestWeekGroup
{
  id v3;
  uint64_t v4;
  char IsLeftToRight;
  NSMutableArray *visibleWeeks;

  v3 = -[NSMutableArray count](self->_visibleWeeks, "count");
  if (v3)
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v3, v4);
    visibleWeeks = self->_visibleWeeks;
    if ((IsLeftToRight & 1) != 0)
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](visibleWeeks, "lastObject"));
    else
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](visibleWeeks, "firstObject"));
  }
  return v3;
}

- (id)_weekGroupForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  NSMutableArray *visibleWeeks;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  y = a3.y;
  x = a3.x;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10007ABE8;
  v22 = sub_10007ABF8;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (CalTimeDirectionIsLeftToRight(self, a2))
    v6 = 0;
  else
    v6 = 2;
  visibleWeeks = self->_visibleWeeks;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007AC00;
  v13[3] = &unk_1001B3718;
  *(CGFloat *)&v13[6] = x;
  *(CGFloat *)&v13[7] = y;
  v13[4] = &v14;
  v13[5] = &v18;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](visibleWeeks, "enumerateObjectsWithOptions:usingBlock:", v6, v13);
  v8 = (void *)v19[5];
  if (!v8)
  {
    v9 = -[WeekViewController _createPreparedViewForWeek:](self, "_createPreparedViewForWeek:", v15[3]);
    v10 = (void *)v19[5];
    v19[5] = (uint64_t)v9;

    -[NSMutableArray addObject:](self->_reusableViews, "addObject:", v19[5]);
    v8 = (void *)v19[5];
  }
  v11 = v8;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  void *v11;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:"));
  -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v10, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", a4, v5));

  return v11;
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4
{
  return -[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", a4, 1, a3.x, a3.y);
}

- (id)dayDateAtPoint:(CGPoint)a3
{
  CGFloat v4;
  double v5;
  CGFloat v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t IsLeftToRight;
  uint64_t v11;
  objc_class *v12;
  int64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  objc_class *v18;
  int64_t v19;
  void *v20;

  v4 = a3.x + self->_weekWidth * -27040.0;
  -[WeekViewController weekWidth](self, "weekWidth");
  v6 = v4 / v5;
  v7 = -[WeekViewController daysInWeek](self, "daysInWeek");
  v8 = llround(v6 * (double)v7);
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v7, v9);
  if (!(_DWORD)IsLeftToRight)
    v8 = -(uint64_t)v8;
  if ((CalTimeDirectionIsLeftToRight(IsLeftToRight, v11) & 1) == 0)
  {
    v12 = -[WeekViewController weekViewClass](self, "weekViewClass");
    v13 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
    v15 = -[objc_class displayedDaysForOrientation:withViewInViewHierarchy:](v12, "displayedDaysForOrientation:withViewInViewHierarchy:", v13, v14);
    v16 = -[WeekViewController daysInWeek](self, "daysInWeek");

    if (v15 != (id)v16)
    {
      v17 = -[WeekViewController daysInWeek](self, "daysInWeek");
      v18 = -[WeekViewController weekViewClass](self, "weekViewClass");
      v19 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
      v8 += v17
          + ~(unint64_t)-[objc_class displayedDaysForOrientation:withViewInViewHierarchy:](v18, "displayedDaysForOrientation:withViewInViewHierarchy:", v19, v20);

    }
  }
  return -[EKCalendarDate calendarDateByAddingDays:](self->_referenceWeekStart, "calendarDateByAddingDays:", v8);
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  CGFloat x;
  CGFloat y;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGPoint result;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_visibleWeeks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "containsDate:", v6, (_QWORD)v19) & 1) != 0)
        {
          objc_msgSend(v12, "pointAtDate:isAllDay:", v6, v4);
          objc_msgSend(v12, "convertPoint:toView:", self->_weekScroller);
          x = v15;
          y = v16;

          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  x = CGPointZero.x;
  y = CGPointZero.y;
LABEL_11:

  v17 = x;
  v18 = y;
  result.y = v18;
  result.x = v17;
  return result;
}

- (id)_weekGroupForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_visibleWeeks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "occurrenceViewForEvent:occurrenceDate:", v6, v7, (_QWORD)v15));

          if (v13)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:"));
  -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v8, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "occurrenceViewAtPoint:ignoreSelectedCopyView:", v4));

  return v9;
}

- (void)editorDidDeleteEvent:(id)a3
{
  EKEventGestureController *eventGestureController;
  id v5;
  void *v6;

  eventGestureController = self->_eventGestureController;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](eventGestureController, "occurrenceDate"));
  -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v5, v6);

  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
}

- (void)editorDidCancelEditingEvent:(id)a3
{
  EKEventGestureController *eventGestureController;
  id v5;
  void *v6;

  eventGestureController = self->_eventGestureController;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](eventGestureController, "occurrenceDate"));
  -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v5, v6);

  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
}

- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  UIScrollView *weekScroller;
  void *v9;
  double MidX;
  void *v11;
  UIScrollView *v12;
  CGRect v13;
  CGRect v14;

  v5 = a5;
  v12 = (UIScrollView *)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](v12, "superview"));
  weekScroller = v12;
  if (!v7)
    weekScroller = self->_weekScroller;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](weekScroller, "superview"));

  -[UIScrollView frame](v12, "frame");
  MidX = CGRectGetMidX(v13);
  -[UIScrollView frame](v12, "frame");
  objc_msgSend(v9, "convertPoint:toView:", self->_weekScroller, MidX, CGRectGetMidY(v14));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:"));
  objc_msgSend(v11, "addViewToScroller:isAllDay:", v12, v5);

}

- (BOOL)hasCorrectParentForDraggingView:(id)a3 isAllDay:(BOOL)a4
{
  uint64_t v4;
  UIScrollView *weekScroller;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v4 = a4;
  weekScroller = self->_weekScroller;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](weekScroller, "superview"));
  objc_msgSend(v7, "frame");
  objc_msgSend(v8, "convertPoint:toView:", self->_weekScroller);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:", v10, v12));
  LOBYTE(v4) = objc_msgSend(v13, "scrollerIsParentOfView:isAllDay:", v7, v4);

  return v4;
}

- (void)highlightDayViewCalendarDate:(id)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView timeView](self->_timeView, "timeView"));
    objc_msgSend(v8, "setHighlightedHour:", -1.0);

    -[WeekTimeView setAllDayHighlighted:](self->_timeView, "setAllDayHighlighted:", 1);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = self->_visibleWeeks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "setHighlightedDateComponents:", 0);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }
  }
  else
  {
    v14 = objc_msgSend(v6, "hour");
    v15 = (double)((uint64_t)objc_msgSend(v7, "minute") + 60 * (_QWORD)v14) / 60.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView timeView](self->_timeView, "timeView"));
    objc_msgSend(v16, "setHighlightedHour:", v15);

    -[WeekTimeView setAllDayHighlighted:](self->_timeView, "setAllDayHighlighted:", 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = self->_visibleWeeks;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v9);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date", (_QWORD)v25));
          v23 = objc_msgSend(v21, "containsDate:", v22);

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allComponents"));
            objc_msgSend(v21, "setHighlightedDateComponents:", v24);

          }
          else
          {
            objc_msgSend(v21, "setHighlightedDateComponents:", 0);
          }
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }
  }

}

- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  id v13;

  v5 = a5;
  v8 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  v10 = objc_msgSend(v9, "currentDragSnappingType");

  v11 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v13, v11));
  -[WeekViewController highlightDayViewCalendarDate:isAllDay:](self, "highlightDayViewCalendarDate:isAllDay:", v12, v5);

}

- (void)_removeDateHighlight
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", 0, 0.0));
  -[WeekViewController highlightDayViewCalendarDate:isAllDay:](self, "highlightDayViewCalendarDate:isAllDay:", v3, 0);

}

- (void)dimOccurrence:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", v6, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "weekView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  objc_msgSend(v8, "setDimmedOccurrence:", v6);

}

- (void)undimOccurrence:(id)a3 occurrenceDate:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForEvent:occurrenceDate:](self, "_weekGroupForEvent:occurrenceDate:", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "weekView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  objc_msgSend(v5, "setDimmedOccurrence:", 0);

}

- (id)touchTrackingViewForEventGestureController:(id)a3
{
  return self->_weekScroller;
}

- (id)occurrenceViewSuperviewForEventGestureController:(id)a3
{
  return -[UIScrollView superview](self->_weekScroller, "superview", a3);
}

- (double)eventGestureController:(id)a3 convertXForMargin:(double)a4
{
  UIScrollView *weekScroller;
  void *v6;
  double v7;
  double v8;

  weekScroller = self->_weekScroller;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](weekScroller, "superview", a3));
  -[UIScrollView convertPoint:toView:](weekScroller, "convertPoint:toView:", v6, a4, 0.0);
  v8 = v7;

  return v8;
}

- (CGRect)marginFrameForEventGestureController:(id)a3
{
  void *v3;
  double v4;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](self->_weekScroller, "superview", a3));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)timedRegionOriginForEventGestureController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGRect v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController touchTrackingViewForEventGestureController:](self, "touchTrackingViewForEventGestureController:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _earliestWeekGroup](self, "_earliestWeekGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "weekView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allDayView"));

  objc_msgSend(v7, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v7);
  v8 = CGRectGetMaxY(v10) + 1.0;

  return v8;
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  id v5;
  void *v6;
  UnadaptableNavigationController *v7;

  v5 = a4;
  v7 = -[UnadaptableNavigationController initWithRootViewController:]([UnadaptableNavigationController alloc], "initWithRootViewController:", v5);

  -[UnadaptableNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController currentPresentationController](self, "currentPresentationController"));
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
  -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a4, 1, 1, 0);
}

- (BOOL)moreThanOneDayVisibleForEventGestureController:(id)a3
{
  return 1;
}

- (UIEdgeInsets)pageChangeMarginsForEventGestureController:(id)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v4 = kLongPressPageChangeDelayMargin;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView", a3));

  v6 = v4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController timeView](self, "timeView"));
    objc_msgSend(v7, "frame");
    v6 = v4 + v8;

  }
  v9 = v4;
  v10 = v6;
  v11 = v4;
  v12 = v4;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  return -[objc_class usesSmallTextForIsCompact:](-[WeekViewController weekViewClass](self, "weekViewClass"), "usesSmallTextForIsCompact:", a3);
}

- (id)createOccurrenceViewForEventGestureController:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)EKDayOccurrenceView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setUsesSmallText:", -[WeekViewController usesSmallTextForIsCompact:](self, "usesSmallTextForIsCompact:", 1));
  return v4;
}

- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5
{
  objc_msgSend(a4, "setAllDayDrawingStyle:", a5);
}

- (id)createEventForEventGestureController:(id)a3
{
  CalAnalyticsSendEvent(CFSTR("userTappedAndHeldToCreateEvent"), &off_1001BC938);
  return -[WeekViewController _newEvent](self, "_newEvent");
}

- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController touchTrackingViewForEventGestureController:](self, "touchTrackingViewForEventGestureController:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _earliestWeekGroup](self, "_earliestWeekGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weekView"));

  objc_msgSend(v12, "convertPoint:fromView:", v10, x, y);
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestWeekGroup](self, "_latestWeekGroup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "weekView"));

  v19 = objc_msgSend(v18, "convertPoint:fromView:", v10, x, y);
  v21 = v20;
  v23 = v22;
  if (CalTimeDirectionIsLeftToRight(v19, v24))
    v25 = v21;
  else
    v25 = v14;
  v26 = v25 < 0.0;
  if (v25 >= 0.0)
    v27 = v21;
  else
    v27 = v14;
  if (v26)
    v28 = v16;
  else
    v28 = v23;
  if (v26)
    v29 = v12;
  else
    v29 = v18;
  objc_msgSend(v29, "yPositionPerhapsMatchingAllDayOccurrence:atPoint:", v9, v27, v28);
  v31 = v30;

  objc_msgSend(v10, "convertPoint:fromView:", v29, 0.0, v31);
  v33 = v32;

  return v33;
}

- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5
{
  return -[WeekViewController occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", a5, a4.x, a4.y);
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *visibleWeeks;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10007ABE8;
  v24 = sub_10007ABF8;
  visibleWeeks = self->_visibleWeeks;
  v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007BEC0;
  v16[3] = &unk_1001B3740;
  v19 = &v20;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](visibleWeeks, "enumerateObjectsUsingBlock:", v16);
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5
{
  id v5;
  BOOL v7;

  v7 = 0;
  v5 = -[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", &v7, a5, a4.x, a4.y);
  return v7;
}

- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, a4.x, a4.y));
  objc_msgSend(v4, "absoluteTime");
  v6 = v5;

  return v6;
}

- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[WeekViewController pointAtDate:isAllDay:](self, "pointAtDate:isAllDay:", a5, a4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _earliestWeekGroup](self, "_earliestWeekGroup", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "weekView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  objc_msgSend(v7, "fixedDayWidth");
  v9 = v8 * (double)a4;

  return v9;
}

- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view", a3));
  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v6), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v8 = v7 * a4 / 3600.0;

  v9 = v8 * self->_weekViewHourHeightScale;
  v10 = +[EKDayOccurrenceView bottomShadowMargin](EKDayOccurrenceView, "bottomShadowMargin");
  v13 = CalRoundToScreenScale(v10, v12, v9 + v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v14), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"));
  v16 = v15;

  if (v13 >= v16)
    return v13;
  else
    return v16;
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unsigned int v10;
  void *v11;
  double v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:usesSmallText:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:usesSmallText:", EKUIWidthSizeClassForViewHierarchy(v6), -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation"), 1, -[WeekViewController usesSmallTextForIsCompact:](self, "usesSmallTextForIsCompact:", 1));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentImageState"));
  v10 = objc_msgSend(v9, "requiresLanguageAwarePadding");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentImageState"));
    objc_msgSend(v11, "totalLanguageAwareHeightPadding");
    v8 = v8 + v12;

  }
  return v8;
}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultCalendarForNewEvents"));

  if (v5)
    return -[EKEventCreationGestureController currentlyCreatingEvent](self->_eventCreationController, "currentlyCreatingEvent") ^ 1;
  else
    return 0;
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSDateComponents *previousGestureDate;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
  -[WeekViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", v9, v5, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "draggingView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView superview](self->_weekScroller, "superview"));
  CalSwitchViewToSuperview(v10, v11);

  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

}

- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  NSDateComponents *v10;
  NSDateComponents *previousGestureDate;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSDateComponents *v16;
  id v17;

  v5 = a5;
  v17 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v8, a4));
  v10 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allComponents"));
  previousGestureDate = self->_previousGestureDate;
  if (!previousGestureDate
    || (v12 = -[NSDateComponents era](previousGestureDate, "era"), v12 != (id)-[NSDateComponents era](v10, "era"))
    || (v13 = -[NSDateComponents month](self->_previousGestureDate, "month"),
        v13 != (void *)-[NSDateComponents month](v10, "month"))
    || (v14 = -[NSDateComponents day](self->_previousGestureDate, "day"),
        v14 != (void *)-[NSDateComponents day](v10, "day")))
  {
    objc_msgSend(v17, "didCrossDragBoundary:", 2);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "event"));
  -[WeekViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", v15, v5, a4);

  v16 = self->_previousGestureDate;
  self->_previousGestureDate = v10;

}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  NSDateComponents *previousGestureDate;
  id v27;
  uint8_t buf[4];
  id v29;

  v9 = a4;
  -[WeekViewController updatePreferredReloadRange](self, "updatePreferredReloadRange");
  if (!objc_msgSend(v9, "isNew"))
  {
    CalAnalyticsSendEvent(CFSTR("userDraggedEvent"), &off_1001BC960);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    if (objc_msgSend(v11, "optionKeyIsDown"))
    {
      v14 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "duplicating event(s) in week view because option key is down", buf, 2u);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pasteboardManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
      objc_msgSend(v16, "setDateForPaste:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pasteboardManager"));
      objc_msgSend(v19, "setCalendarForPaste:", 0);

      v20 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController pasteboardManager](self, "pasteboardManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
      objc_msgSend(v20, "duplicateEvents:withDateMode:delegate:", v21, 1, self);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController EKUI_editor](self, "EKUI_editor"));
      v27 = 0;
      v23 = objc_msgSend(v22, "saveEvent:span:error:", v9, a7, &v27);
      v20 = v27;

      if ((v23 & 1) == 0)
      {
        v24 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Error moving event: %@", buf, 0xCu);
        }
      }
    }

    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController presentedViewController](self, "presentedViewController"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
      objc_msgSend(v9, "setTitle:", &stru_1001B67C0);
    -[WeekViewController didEditEvent:creationMethod:](self, "didEditEvent:creationMethod:", v9, 1);
LABEL_14:

  }
  -[WeekViewController scrollToDisplayedDateAnimated:](self, "scrollToDisplayedDateAnimated:", 1);
  -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  return 1;
}

- (void)eventGestureControllerDidEndDragSession:(id)a3
{
  NSDateComponents *previousGestureDate;

  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  id v8;
  NSDateComponents *previousGestureDate;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  objc_msgSend(v10, "alpha");
  v12 = v11;

  if (v12 > 0.0)
  {
    if (a5)
    {
      if ((objc_msgSend(v8, "isNew") & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "occurrenceDate"));
        -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v8, v13);

        objc_msgSend(v17, "endForcedStart");
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "occurrenceDate"));
      objc_msgSend(v17, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v8, v14, 0, 1, 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "event"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "occurrenceDate"));
      -[WeekViewController dimOccurrence:occurrenceDate:](self, "dimOccurrence:occurrenceDate:", v15, v16);

    }
  }

}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a3;
  -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
  if (a5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "occurrenceDate"));
    -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v9, v10);

    objc_msgSend(v8, "endForcedStart");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", v17, 0));
    if (-[NSMutableArray containsObject:](self->_selectedOccurrenceViews, "containsObject:", v8))
      -[WeekViewController _deselectOccurrenceView:](self, "_deselectOccurrenceView:", v8);
    else
      -[WeekViewController _selectOccurrenceView:](self, "_selectOccurrenceView:", v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector(WeakRetained, "weekViewController:didSelectEvent:");

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
      objc_msgSend(v13, "performSelector:withObject:withObject:", "weekViewController:didSelectEvent:", self, v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "occurrenceDate"));
    -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v15, v16);

    objc_msgSend(v8, "endForcedStart");
  }

}

- (double)_widthForDayAtPoint:(CGPoint)a3 isMovingRight:(BOOL)a4
{
  objc_class *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;

  v5 = -[WeekViewController weekViewClass](self, "weekViewClass", a4, a3.x, a3.y);
  v6 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](v5, "dayWidthForOrientation:withViewInViewHierarchy:", v6, v7);
  v9 = v8;

  return v9;
}

- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7
{
  double y;
  double x;
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  unsigned __int8 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UIScrollView *weekScroller;

  y = a7.y;
  x = a7.x;
  v9 = a6;
  v10 = a5;
  v13 = a3;
  if (a4 || v10)
  {
    -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
    v27 = v26;
    v29 = v28;
    if (v10)
    {
      -[WeekViewController _widthForDayAtPoint:isMovingRight:](self, "_widthForDayAtPoint:isMovingRight:", 1, x, y);
      v31 = v27 + v30;
    }
    else
    {
      -[WeekViewController _widthForDayAtPoint:isMovingRight:](self, "_widthForDayAtPoint:isMovingRight:", 0, x, y);
      v31 = v27 - v32;
    }
    weekScroller = self->_weekScroller;
    v25 = 1;
    -[UIScrollView setContentOffset:animated:](weekScroller, "setContentOffset:animated:", 1, v31, v29);
  }
  else if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:", x, y));
    -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v14, x, y);
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "weekView"));
    objc_msgSend(v14, "convertPoint:toView:", v19, v16, v18);
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "weekView"));
    v25 = objc_msgSend(v24, "scrollTowardPoint:", v21, v23);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress") & 1) == 0)
  {
    -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
    -[WeekViewController tappedOnDate:](self, "tappedOnDate:", v4);
    -[WeekViewController cleanupSelectionState](self, "cleanupSelectionState");
  }

}

- (void)setReceiveTapsInHeader:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_receiveTapsInHeader != a3)
  {
    v3 = a3;
    self->_receiveTapsInHeader = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_visibleWeeks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "weekView", (_QWORD)v11));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allDayView"));
          objc_msgSend(v10, "setReceiveTapsInHeader:", v3);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  y = a4.y;
  x = a4.x;
  if ((-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress", a3) & 1) != 0)return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController draggingView](self->_eventGestureController, "draggingView"));

  if (v7)
    return 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventViewController](self, "shownEventViewController"));
  if (v10)
  {
    v8 = 0;
LABEL_7:

    return v8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _parentViewForCreationGesturePreview](self, "_parentViewForCreationGesturePreview"));
    objc_msgSend(v12, "convertPoint:toView:", self->_weekScroller, x, y);
    v14 = v13;
    v16 = v15;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", 0, v14, v16));
    v8 = v10 == 0;
    goto LABEL_7;
  }
  return 0;
}

- (id)_parentViewForCreationGesturePreview
{
  return -[UIScrollView superview](self->_weekScroller, "superview");
}

- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)EKDayOccurrenceView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v6, "setOccurrence:", v5);

  objc_msgSend(v6, "setUsesSmallText:", -[WeekViewController usesSmallTextForIsCompact:](self, "usesSmallTextForIsCompact:", 1));
  objc_msgSend(v6, "setSelected:", 1);
  return v6;
}

- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5
{
  objc_class *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;

  v6 = -[WeekViewController weekViewClass](self, "weekViewClass", a3, a4, a5.x, a5.y);
  v7 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
  -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](v6, "dayWidthForOrientation:withViewInViewHierarchy:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _parentViewForCreationGesturePreview](self, "_parentViewForCreationGesturePreview", a3));
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", 0, 0));
  -[WeekViewController _xOffsetForDate:](self, "_xOffsetForDate:", v8);
  objc_msgSend(v7, "convertPoint:fromView:", self->_weekScroller);
  v10 = v9;

  return v10;
}

- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  objc_msgSend(a4, "timeIntervalSinceReferenceDate", a3);
  -[WeekViewController pointAtDate:isAllDay:](self, "pointAtDate:isAllDay:", 0);
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _parentViewForCreationGesturePreview](self, "_parentViewForCreationGesturePreview"));
  objc_msgSend(v9, "convertPoint:fromView:", self->_weekScroller, v6, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4
{
  objc_msgSend(a4, "timeIntervalSinceReferenceDate", a3);
  -[WeekViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", 0, 0);
}

- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4
{
  double y;
  double x;
  UIScrollView *weekScroller;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  weekScroller = self->_weekScroller;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _parentViewForCreationGesturePreview](self, "_parentViewForCreationGesturePreview", a3));
  -[UIScrollView convertPoint:fromView:](weekScroller, "convertPoint:fromView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, v10, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date"));

  return v14;
}

- (id)_newEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem"));
  objc_msgSend(v5, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultCalendarForNewEvents"));
  objc_msgSend(v5, "setCalendar:", v8);

  return v5;
}

- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4
{
  id v5;

  v5 = a4;
  -[WeekViewController _removeDateHighlight](self, "_removeDateHighlight");
  -[WeekViewController createdNewEventUsingCreationGesture:](self, "createdNewEventUsingCreationGesture:", v5);

}

- (BOOL)enableEventCreationGesture
{
  return 0;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "setDelegate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentingViewController"));
  objc_opt_class(EKExpandedReminderStackViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentingViewController"));
    v9 = v8;
    if (self->_editorDismissedFromDelete)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "event"));
      objc_msgSend(v9, "reminderDetailDismissedWithDeletedEvent:", v10);

    }
    else
    {
      objc_msgSend(v8, "reminderDetailDismissedWithDeletedEvent:", 0);
    }
LABEL_12:

    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationController](self, "navigationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
  objc_opt_class(EKExpandedReminderStackViewController);
  v14 = objc_opt_isKindOfClass(v12, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationController](self, "navigationController"));
  v9 = v15;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
    v17 = v16;
    if (self->_editorDismissedFromDelete)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "event"));
      objc_msgSend(v17, "reminderDetailDismissedWithDeletedEvent:", v18);

    }
    else
    {
      objc_msgSend(v16, "reminderDetailDismissedWithDeletedEvent:", 0);
    }

    goto LABEL_12;
  }

  if (!v9)
  {
LABEL_13:
    objc_msgSend(v21, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_14;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationController](self, "navigationController"));
  objc_msgSend(v19, "popViewControllersAfterAndIncluding:animated:", v21, !self->_editorDismissedFromDelete);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v20, "setSelectedOccurrence:", 0);

LABEL_14:
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (CGRect)currentTimeRectInView:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unsigned int v13;
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
  double v29;
  CGRect result;

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView timeView](self->_timeView, "timeView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeMarker"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
  if (!v11)
    goto LABEL_5;
  objc_msgSend(v10, "alpha");
  if (v12 != 1.0)
    goto LABEL_5;
  v13 = objc_msgSend(v10, "showsThumb");

  if (v13)
  {
    objc_msgSend(v10, "currentTimeFrame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
    objc_msgSend(v4, "convertRect:fromView:", v11, v15, v17, v19, v21);
    x = v22;
    y = v23;
    width = v24;
    height = v25;
LABEL_5:

  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_updateHeaderHeightsAnimated:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *i;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  void *v86;
  unsigned int v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  BOOL v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  uint64_t v100;
  int IsRegularInViewHierarchy;
  double v102;
  double v103;
  _QWORD *v104;
  _QWORD *v105;
  _BOOL4 v106;
  uint64_t v107;
  NSMutableArray *v108;
  id v109;
  uint64_t v110;
  char v111;
  CGFloat v112;
  CGFloat v113;
  _QWORD v114[5];
  char v115;
  _QWORD v116[6];
  BOOL v117;
  char v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;

  v106 = a3;
  -[UIScrollView frame](self->_weekScroller, "frame");
  v112 = v5;
  v113 = v4;
  v7 = v6;
  v9 = v8;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v10 = self->_visibleWeeks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
  if (v11)
  {
    v12 = v11;
    v111 = 0;
    v13 = *(_QWORD *)v124;
    v14 = 0.0;
    v107 = *(_QWORD *)v124;
    v108 = v10;
    while (1)
    {
      v15 = 0;
      v109 = v12;
      do
      {
        if (*(_QWORD *)v124 != v13)
          objc_enumerationMutation(v10);
        v110 = v15;
        v16 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
        objc_msgSend(v18, "frame");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "superview"));
        objc_msgSend(v17, "convertRect:fromView:", v28, v20, v22, v24, v26);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;

        v129.origin.y = v112;
        v129.origin.x = v113;
        v129.size.width = v7;
        v129.size.height = v9;
        v131.origin.x = v30;
        v131.origin.y = v32;
        v131.size.width = v34;
        v131.size.height = v36;
        if (CGRectIntersectsRect(v129, v131))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allDayView"));
          objc_msgSend(v38, "heightWithoutNoAllDayOccurrences");
          v40 = v39;

          if (v40 > v14)
            v14 = v40;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
          v42 = objc_msgSend(v41, "hasAllDayEvents");

          if (v42)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allDayView"));
            objc_msgSend(v44, "layoutIfNeeded");

            if (-[WeekViewController usesMultiDayWeekView](self, "usesMultiDayWeekView"))
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController earliestDateComponents](self, "earliestDateComponents"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "timeZone"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v45, v47));

              v49 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestDateComponents](self, "_latestDateComponents"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "timeZone"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v49, v51));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "calendarDateForEndOfDay"));

              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allDayView"));
              objc_msgSend(v55, "multiDayViewVisibleHeightWithUserVisibleEarliestDate:latestDate:", v48, v53);
              v57 = v56;

            }
            else
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allDayView"));
              objc_msgSend(v53, "naturalHeight");
              v57 = v58;
            }

            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "allDayView"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "occurrenceViews"));

            v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
            if (v62)
            {
              v63 = v62;
              v64 = *(_QWORD *)v120;
              do
              {
                for (i = 0; i != v63; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v120 != v64)
                    objc_enumerationMutation(v61);
                  v66 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
                  v67 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
                  objc_msgSend(v66, "frame");
                  v69 = v68;
                  v71 = v70;
                  v73 = v72;
                  v75 = v74;
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "allDayView"));
                  objc_msgSend(v67, "convertRect:fromView:", v77, v69, v71, v73, v75);
                  v79 = v78;
                  v81 = v80;
                  v83 = v82;
                  v85 = v84;

                  v130.origin.y = v112;
                  v130.origin.x = v113;
                  v130.size.width = v7;
                  v130.size.height = v9;
                  v132.origin.x = v79;
                  v132.origin.y = v81;
                  v132.size.width = v83;
                  v132.size.height = v85;
                  if (CGRectIntersectsRect(v130, v132))
                  {
                    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "currentImageState"));
                    v87 = objc_msgSend(v86, "requiresLanguageAwarePadding");

                    if (v87)
                    {
                      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "currentImageState"));
                      objc_msgSend(v88, "totalLanguageAwareHeightPadding");
                      v90 = v89;
                      goto LABEL_25;
                    }
                    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "weekView"));
                    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "allDayView"));
                    objc_msgSend(v92, "occurrenceHeight");
                    v94 = v93;

                    v95 = v85 <= v94;
                    v96 = v57;
                    if (!v95)
                    {
                      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "currentImageState"));
                      objc_msgSend(v88, "totalLanguageAwareHeightPadding");
                      v98 = v97;
                      v99 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController view](self, "view"));
                      IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v99, v100);
                      v102 = 2.5;
                      if (IsRegularInViewHierarchy)
                        v102 = 3.5;
                      v90 = v98 + v102;

LABEL_25:
                      v96 = v57 + v90;

                    }
                    if (v96 > v14)
                      v14 = v96;
                    v111 = 1;
                    continue;
                  }
                }
                v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
              }
              while (v63);
            }

            v13 = v107;
            v10 = v108;
            v12 = v109;
          }
        }
        v15 = v110 + 1;
      }
      while ((id)(v110 + 1) != v12);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
      if (!v12)
        goto LABEL_36;
    }
  }
  v111 = 0;
  v14 = 0.0;
LABEL_36:

  v103 = self->_cachedHeaderHeight - v14;
  if (v103 < 0.0)
    v103 = -v103;
  if (v103 > 0.0001)
  {
    self->_cachedHeaderHeight = v14;
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10007DC74;
    v116[3] = &unk_1001B3768;
    v116[4] = self;
    v117 = v106;
    *(double *)&v116[5] = v14;
    v118 = v111 & 1;
    v104 = objc_retainBlock(v116);
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_10007DE3C;
    v114[3] = &unk_1001B3790;
    v114[4] = self;
    v115 = v111 & 1;
    v105 = objc_retainBlock(v114);
    if (v106)
    {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 7, v104, v105, 0.3, 0.0);
    }
    else
    {
      ((void (*)(_QWORD *))v104[2])(v104);
      ((void (*)(_QWORD *, uint64_t))v105[2])(v105, 1);
    }

  }
}

- (void)_setHeaderHeightForWeekGroupView:(id)a3 forceLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double cachedHeaderHeight;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v4 = a4;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "weekView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allDayView"));
  objc_msgSend(v6, "setFixedDayHeight:", self->_cachedHeaderHeight);
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  cachedHeaderHeight = self->_cachedHeaderHeight;
  objc_msgSend(v6, "setFrame:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allDayView"));
  objc_msgSend(v14, "setFrame:", v8, v10, v12, cachedHeaderHeight);

  objc_msgSend(v18, "setNeedsLayout");
  if (v4)
    objc_msgSend(v18, "layoutIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  recursiveAnimationRemove(v16, v17);

}

- (id)_earliestVisibleWeekGroupView
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *visibleWeeks;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10007ABE8;
  v16 = sub_10007ABF8;
  v17 = 0;
  if (CalTimeDirectionIsLeftToRight(v3, v6))
    v7 = 0;
  else
    v7 = 2;
  visibleWeeks = self->_visibleWeeks;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007E08C;
  v11[3] = &unk_1001B37B8;
  v11[5] = v5;
  v11[4] = &v12;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](visibleWeeks, "enumerateObjectsWithOptions:usingBlock:", v7, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_latestVisibleWeekGroupView
{
  id v3;
  double v4;
  double v5;
  double weekWidth;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *visibleWeeks;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v5 = v4;
  weekWidth = self->_weekWidth;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10007ABE8;
  v17 = sub_10007ABF8;
  v18 = 0;
  if (CalTimeDirectionIsLeftToRight(v3, v7))
    v8 = 2;
  else
    v8 = 0;
  visibleWeeks = self->_visibleWeeks;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007E23C;
  v12[3] = &unk_1001B37B8;
  *(double *)&v12[5] = v5 + weekWidth;
  v12[4] = &v13;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](visibleWeeks, "enumerateObjectsWithOptions:usingBlock:", v8, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)earliestDateComponents
{
  void *v3;
  uint64_t v4;
  char IsLeftToRight;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _earliestVisibleWeekGroupView](self, "_earliestVisibleWeekGroupView"));
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v3, v4);
  -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v7 = v6;
  if ((IsLeftToRight & 1) != 0)
  {
    v8 = v6 + 1.0;
  }
  else
  {
    -[UIScrollView bounds](self->_weekScroller, "bounds");
    v8 = v7 + CGRectGetWidth(v12) + -1.0;
  }
  objc_msgSend(v3, "frame");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateForXOffset:", v8 - v9));

  return v10;
}

- (id)_latestDateComponents
{
  id v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  CGRect v12;

  v3 = -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v5 = v4;
  v6 = 1.0;
  if (CalTimeDirectionIsLeftToRight(v3, v7))
  {
    -[UIScrollView bounds](self->_weekScroller, "bounds");
    v6 = CGRectGetWidth(v12) + -1.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController _latestVisibleWeekGroupView](self, "_latestVisibleWeekGroupView"));
  objc_msgSend(v8, "frame");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateForXOffset:", v5 + v6 - v9));

  return v10;
}

- (id)centerDateComponents
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CGRect v23;

  v3 = -[WeekViewController daysInWeek](self, "daysInWeek");
  -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
  v5 = v4;
  -[UIScrollView bounds](self->_weekScroller, "bounds");
  v7 = 2.001;
  if (v3 == 2)
    v7 = 2.5;
  v8 = v5 + v6 / v7;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_visibleWeeks;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "frame", (_QWORD)v18);
        if (v14 <= v8)
        {
          objc_msgSend(v13, "frame");
          if (CGRectGetMaxX(v23) > v8)
          {
            v10 = v13;
            goto LABEL_14;
          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

  objc_msgSend(v10, "frame");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateForXOffset:", v8 - v15));

  return v16;
}

- (void)_startMarkerTimer
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSTimer *v11;
  NSTimer *timeMarkerTimer;
  void *v13;
  id v14;

  if (!self->_timeMarkerTimer)
  {
    v3 = CUIKCalendar(self);
    v14 = (id)objc_claimAutoreleasedReturnValue(v3);
    v4 = CUIKCalendar(v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 126, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromComponents:", v7));
    v9 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v9, "setMinute:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v9, v8, 0));
    v11 = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v10, self, "_updateTimeMarker", 0, 1, 60.0);
    timeMarkerTimer = self->_timeMarkerTimer;
    self->_timeMarkerTimer = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v13, "addTimer:forMode:", self->_timeMarkerTimer, NSDefaultRunLoopMode);

  }
}

- (void)_invalidateMarkerTimer
{
  NSTimer *timeMarkerTimer;

  -[NSTimer invalidate](self->_timeMarkerTimer, "invalidate");
  timeMarkerTimer = self->_timeMarkerTimer;
  self->_timeMarkerTimer = 0;

}

- (id)model
{
  return self->super._model;
}

- (BOOL)dateIsVisible:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  NSMutableArray *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_visibleWeeks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "weekView"));
        if (objc_msgSend(v9, "containsDate:", v4))
        {
          objc_msgSend(v9, "pointAtDate:isAllDay:", v4, 0);
          -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", v9);
          v11 = v10;
          -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
          v13 = v11 - v12;
          *(_QWORD *)&v14 = objc_opt_class(v9).n128_u64[0];
          v16 = v15;
          v17 = -[WeekViewController viewInterfaceOrientation](self, "viewInterfaceOrientation", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
          objc_msgSend(v16, "dayWidthForOrientation:withViewInViewHierarchy:", v17, v18);
          v20 = v13 + v19 * 0.5;

          if (v20 >= 0.0)
          {
            -[UIScrollView bounds](self->_weekScroller, "bounds");
            if (v20 < v21)
            {

              v22 = 1;
              goto LABEL_13;
            }
          }
        }

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)occurrenceViewForEvent:(id)a3
{
  return -[WeekViewController occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", a3, 0);
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController currentlySelectedOccurrenceViewSource](self->_eventGestureController, "currentlySelectedOccurrenceViewSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "occurrence"));
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (v10)
  {
    v11 = v8;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_visibleWeeks;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "occurrenceViewForEvent:occurrenceDate:", v6, v7, (_QWORD)v19));
          if (v17)
          {
            v11 = (id)v17;

            goto LABEL_13;
          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
          continue;
        break;
      }
    }

    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)resizeWeekGroupsIfNeededForOrientation:(int64_t)a3
{
  double weekWidth;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSUInteger location;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  double v19;
  id v20;
  NSUInteger v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  weekWidth = self->_weekWidth;
  -[WeekViewController weekWidthForOrientation:](self, "weekWidthForOrientation:");
  v7 = weekWidth - v6;
  if (v7 < 0.0)
    v7 = -v7;
  if (v7 >= 0.00100000005)
  {
    -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
    v9 = v8 / self->_weekWidth;
    -[WeekViewController weekWidthForOrientation:](self, "weekWidthForOrientation:", a3);
    self->_weekWidth = v10;
    self->_preventScrollUpdates = 1;
    v11 = v10 * 54080.0;
    -[UIScrollView contentSize](self->_weekScroller, "contentSize");
    -[UIScrollView setContentSize:](self->_weekScroller, "setContentSize:", v11);
    self->_preventScrollUpdates = 0;
    location = self->_visibleRange.location;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = self->_visibleWeeks;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          -[WeekViewController _boundsForWeek:](self, "_boundsForWeek:", (char *)i + location);
          objc_msgSend(v18, "setFrame:");
          objc_msgSend(v18, "setNeedsLayout");
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        location += (NSUInteger)i;
      }
      while (v15);
    }

    v19 = v9 * self->_weekWidth;
    v20 = -[WeekViewController visibleRangeForOffset:](self, "visibleRangeForOffset:", v19);
    if (v21 == self->_visibleRange.length)
    {
      self->_visibleRange.location = (NSUInteger)v20;
      self->_visibleRange.length = v21;
    }
    -[UIScrollView contentOffset](self->_weekScroller, "contentOffset");
    -[UIScrollView setContentOffset:](self->_weekScroller, "setContentOffset:", v19);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = self->_visibleWeeks;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "weekView"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
          objc_msgSend(v28, "setNeedsLayout");

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }

  }
}

- (id)_daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((id)-[WeekViewController daysInWeek](self, "daysInWeek") == (id)7)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingDays:", 1 - (_QWORD)objc_msgSend(v4, "dayOfWeek")));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (void)viewSwitcherSwitchedToViewWithDate:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController _daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:](self, "_daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  objc_msgSend(v4, "setSelectedDate:", v5);

}

- (void)_sceneEnteredForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_sceneIdentifier"));
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = -[WeekViewController savedFirstVisibleSecond](self, "savedFirstVisibleSecond");

    if (v7 < 0)
      goto LABEL_6;
    -[WeekViewController setFirstVisibleSecond:](self, "setFirstVisibleSecond:", -[WeekViewController savedFirstVisibleSecond](self, "savedFirstVisibleSecond"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_visibleWeeks, "firstObject"));
    -[WeekViewController synchronizeWeekGroupScrollingToWeek:](self, "synchronizeWeekGroupScrollingToWeek:", v4);
  }
  else
  {

  }
LABEL_6:
  if (self->_needsReload)
    -[WeekViewController reloadData](self, "reloadData");

}

- (int64_t)savedFirstVisibleSecond
{
  void *v4;
  void *v5;
  id v6;

  if ((EKUIShouldSaveStateInPreferences(self) & 1) != 0)
    return -1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistedSceneState"));
  v6 = objc_msgSend(v5, "weekViewFirstVisibleSecond");

  return (int64_t)v6;
}

- (void)weekGroupViewFirstVisibleSecondChanged:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "activationState");

  if (!v7)
    -[WeekViewController saveFirstVisibleSecond:](self, "saveFirstVisibleSecond:", a3);
}

- (void)saveFirstVisibleSecond:(int64_t)a3
{
  void *v5;
  id v6;

  if ((EKUIShouldSaveStateInPreferences(self) & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistedSceneState"));
    objc_msgSend(v5, "setWeekViewFirstVisibleSecond:", a3);

  }
}

- (id)_selectedOccurrenceViews
{
  return self->_selectedOccurrenceViews;
}

- (void)_updateSelectedViewsToMatchModel
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  -[WeekViewController _clearSelectedOccurrenceViewsUpdatingModel:](self, "_clearSelectedOccurrenceViewsUpdatingModel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedOccurrences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
    -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedOccurrences"));
  -[WeekViewController _selectEvents:updatingModel:](self, "_selectEvents:updatingModel:", v7, 0);

}

- (void)cleanupSelectionState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController event](self->_eventGestureController, "event"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventGestureController occurrenceDate](self->_eventGestureController, "occurrenceDate"));
  -[WeekViewController undimOccurrence:occurrenceDate:](self, "undimOccurrence:occurrenceDate:", v3, v4);

  -[WeekViewController _clearSelectedOccurrenceViews](self, "_clearSelectedOccurrenceViews");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController eventGestureController](self, "eventGestureController"));
  objc_msgSend(v5, "endForcedStart");

}

- (void)_clearSelectedOccurrenceViews
{
  -[WeekViewController _clearSelectedOccurrenceViewsUpdatingModel:](self, "_clearSelectedOccurrenceViewsUpdatingModel:", 1);
}

- (void)_clearSelectedOccurrenceViewsUpdatingModel:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSMutableArray copy](self->_selectedOccurrenceViews, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[WeekViewController _deselectOccurrenceView:updatingModel:](self, "_deselectOccurrenceView:updatingModel:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), v3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_selectEvents:(id)a3 updatingModel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), 0, (_QWORD)v15));
        v14 = v13;
        if (v13 && (objc_msgSend(v13, "isSelectedCopyView") & 1) == 0)
        {
          if ((-[NSMutableSet containsObject:](v7, "containsObject:", v14) & 1) == 0)
            -[WeekViewController _selectOccurrenceView:updatingModel:](self, "_selectOccurrenceView:updatingModel:", v14, v4);
          -[NSMutableSet addObject:](v7, "addObject:", v14);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_selectOccurrenceView:(id)a3
{
  -[WeekViewController _selectOccurrenceView:updatingModel:](self, "_selectOccurrenceView:updatingModel:", a3, 1);
}

- (void)_selectOccurrenceView:(id)a3 updatingModel:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *selectedOccurrenceViews;
  NSMutableArray *v10;
  NSMutableArray *selectedOccurrencesFrontmostClonedViews;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v7 = a3;
  v21 = v7;
  if (!self->_selectedOccurrenceViews)
  {
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    selectedOccurrenceViews = self->_selectedOccurrenceViews;
    self->_selectedOccurrenceViews = v8;

    v7 = v21;
  }
  if (!self->_selectedOccurrencesFrontmostClonedViews)
  {
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    selectedOccurrencesFrontmostClonedViews = self->_selectedOccurrencesFrontmostClonedViews;
    self->_selectedOccurrencesFrontmostClonedViews = v10;

    v7 = v21;
  }
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedCopy"));

    v7 = v21;
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectedCopy"));

      if (v13)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeekViewController.m"), 3362, CFSTR("View to select already has a selected copy view"));

      }
      if (objc_msgSend(v21, "isSelectedCopyView"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeekViewController.m"), 3363, CFSTR("View to select was a selected copy view"));

      }
      v14 = objc_msgSend(v21, "copy");
      objc_msgSend(v14, "setSelected:", 1);
      objc_msgSend(v14, "requestContentIfNeeded:completion:", 16, 0);
      objc_msgSend(v14, "setIsSelectedCopyView:", 1);
      -[NSMutableArray addObject:](self->_selectedOccurrencesFrontmostClonedViews, "addObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
      objc_msgSend(v15, "addSubview:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
      objc_msgSend(v16, "bringSubviewToFront:", v14);

      objc_msgSend(v21, "setSelectedCopy:", v14);
      objc_msgSend(v21, "setSelected:", 1);
      objc_msgSend(v21, "setHidden:", 1);
      -[NSMutableArray addObject:](self->_selectedOccurrenceViews, "addObject:", v21);
      if (v4)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "occurrences"));
        objc_msgSend(v17, "selectOccurrences:", v18);

      }
      v7 = v21;
    }
  }

}

- (void)_deselectOccurrenceView:(id)a3
{
  -[WeekViewController _deselectOccurrenceView:updatingModel:](self, "_deselectOccurrenceView:updatingModel:", a3, 1);
}

- (void)_deselectOccurrenceView:(id)a3 updatingModel:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedCopy"));
  -[NSMutableArray removeObject:](self->_selectedOccurrencesFrontmostClonedViews, "removeObject:", v6);
  objc_msgSend(v6, "removeFromSuperview");
  -[NSMutableArray removeObject:](self->_selectedOccurrenceViews, "removeObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "occurrence"));

  if (v7)
  {
    objc_msgSend(v10, "setSelectedCopy:", 0);
    objc_msgSend(v10, "setSelected:", 0);
    objc_msgSend(v10, "requestContentIfNeeded:completion:", 16, 0);
    objc_msgSend(v10, "setHidden:", 0);
  }
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "occurrences"));
    objc_msgSend(v8, "deselectOccurrences:", v9);

  }
}

- (id)pasteboardManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pasteboardManager"));

  return v3;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  BOOL v8;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextOccurrence"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "previousOccurrence"));
  v5 = v4;
  v6 = objc_msgSend(v4, "reminderOccurrenceType");
  if (v5)
    v7 = v6 == (id)1;
  else
    v7 = 1;
  v8 = !v7;

  return v8;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextOccurrence"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousOccurrence"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    -[WeekViewController selectDate:animated:](self, "selectDate:animated:", v9, 1);

    -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v8, 1, 0, 0);
  }

}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextOccurrence"));

  if (v5)
  {
    -[WeekViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousOccurrence"));

  if (v5)
  {
    -[WeekViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WeekViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

  -[WeekViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v6, 1, 1, v8);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[WeekViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void ***v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  WeekViewController *v14;
  id v15;

  v6 = a5;
  v7 = v6;
  if (v6)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10007FB24;
    v13 = &unk_1001B2600;
    v14 = self;
    v15 = v6;
    v8 = objc_retainBlock(&v10);

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController navigationController](self, "navigationController", v10, v11, v12, v13));
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (id)calendarModel
{
  return self->super._model;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[WeekViewController currentPresentationController](self, "currentPresentationController"));
  objc_msgSend(v5, "presentFromSource:", v6);

}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[WeekViewController didEditEvent:creationMethod:](self, "didEditEvent:creationMethod:", a4, 3);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[MainViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (void)_logUserStateDiagnostics:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FC10;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)_dateModeForAllDay:(BOOL)a3
{
  return !a3;
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardManager"));
  v7 = objc_msgSend(v6, "canPerformPaste");

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultCalendarForNewEvents"));
  v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reminderCalendar"));
  v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[WeekViewController createEvent:atPoint:inView:](self, "createEvent:atPoint:inView:", 1, a5, a4.x, a4.y);
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[WeekViewController createEvent:atPoint:inView:](self, "createEvent:atPoint:inView:", 0, a5, a4.x, a4.y);
}

- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  EKEventGestureController *eventGestureController;
  void *v19;
  unsigned __int8 v20;

  v5 = a3;
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v20));
  if (v5)
  {
    v8 = -[WeekViewController _newEvent](self, "_newEvent");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reminderCalendar"));
    objc_msgSend(v8, "setCalendar:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v14 = CalSnapDateTo15MinuteInterval(0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v14));
  objc_msgSend(v8, "setStartDate:", v15);
  if (v5)
  {
    v16 = 3600.0;
    if (v20)
      v16 = 1.0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", v16));
    objc_msgSend(v8, "setEndDateUnadjustedForLegacyClients:", v17);

  }
  else
  {
    objc_msgSend(v8, "setEndDateUnadjustedForLegacyClients:", v15);
  }
  if (v20)
    objc_msgSend(v8, "setAllDay:", 1);
  -[EKEventGestureController forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:](self->_eventGestureController, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v8, v7, 1, 1, 0);
  eventGestureController = self->_eventGestureController;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  -[WeekViewController eventGestureController:didCommitOccurrence:toDate:isAllDay:span:](self, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", eventGestureController, v8, v20, 0);

}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  v10 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  objc_msgSend(v7, "setDateForPaste:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
  objc_msgSend(v9, "pasteEventsWithDateMode:delegate:", -[WeekViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v10), self);

}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v11;

  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  v11 = 0;
  v6 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pasteboardManager"));
  v9 = objc_msgSend(v8, "numberOfEventsToPaste");

  return (id)objc_claimAutoreleasedReturnValue(+[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:includeHere:](EKUIRightClickEmptySpaceInteraction, "localizedPasteStringForEventCount:includeHere:", v9, v11 == 0));
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  unsigned __int8 v17;

  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v17));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));

  v9 = CUIKCalendar(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPasteboardUtilities roundedDateForDate:dateMode:calendar:](CUIKPasteboardUtilities, "roundedDateForDate:dateMode:calendar:", v7, -[WeekViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v17), v10));

  v12 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v12, "setCalendar:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
  objc_msgSend(v12, "setTimeZone:", v13);

  objc_msgSend(v12, "setDoesRelativeDateFormatting:", 1);
  v14 = v17 == 0;
  objc_msgSend(v12, "setDateStyle:", 1);
  objc_msgSend(v12, "setTimeStyle:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v11));

  return v15;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;

  v6 = a3;
  if (a4 == 1)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    v6 = v11;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
      -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v10);

      v6 = v11;
    }
  }

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  NSTimer *v5;
  NSTimer *timeBarDropScrollTimer;
  id v7;

  if (!self->_timeBarDropScrollTimer)
  {
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_timeBarDropScrollTimerFired:", 0, 1, 0.003));
    timeBarDropScrollTimer = self->_timeBarDropScrollTimer;
    self->_timeBarDropScrollTimer = v5;

    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v7, "addTimer:forMode:", self->_timeBarDropScrollTimer, NSDefaultRunLoopMode);

  }
}

- (void)_timeBarDropScrollTimerFired:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int IsLeftToRight;
  double v10;

  v4 = -[UIScrollView contentOffset](self->_weekScroller, "contentOffset", a3);
  v6 = v5;
  v8 = v7;
  IsLeftToRight = CalInterfaceIsLeftToRight(v4);
  v10 = 1.0;
  if (IsLeftToRight)
    v10 = -1.0;
  -[UIScrollView setContentOffset:animated:](self->_weekScroller, "setContentOffset:animated:", 0, v6 + v10, v8);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  NSTimer *timeBarDropScrollTimer;

  -[NSTimer invalidate](self->_timeBarDropScrollTimer, "invalidate", a3, a4);
  timeBarDropScrollTimer = self->_timeBarDropScrollTimer;
  self->_timeBarDropScrollTimer = 0;

}

- (WeekViewControllerDelegate)delegate
{
  return (WeekViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)receiveTapsInHeader
{
  return self->_receiveTapsInHeader;
}

- (double)weekViewHourHeightScale
{
  return self->_weekViewHourHeightScale;
}

- (void)setWeekViewHourHeightScale:(double)a3
{
  self->_weekViewHourHeightScale = a3;
}

- (BOOL)rotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (EKEventGestureController)eventGestureController
{
  return self->_eventGestureController;
}

- (BOOL)showOverlayCalendar
{
  return self->_showOverlayCalendar;
}

- (NSMutableArray)visibleWeeks
{
  return self->_visibleWeeks;
}

- (void)setVisibleWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_visibleWeeks, a3);
}

- (NSMutableArray)reusableViews
{
  return self->_reusableViews;
}

- (void)setReusableViews:(id)a3
{
  objc_storeStrong((id *)&self->_reusableViews, a3);
}

- (WeekTimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (BOOL)displaysDatesSnappedToWeekBoundaries
{
  return self->_displaysDatesSnappedToWeekBoundaries;
}

- (void)setDisplaysDatesSnappedToWeekBoundaries:(BOOL)a3
{
  self->_displaysDatesSnappedToWeekBoundaries = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (EKCalendarDate)referenceWeekStart
{
  return self->_referenceWeekStart;
}

- (void)setReferenceWeekStart:(id)a3
{
  objc_storeStrong((id *)&self->_referenceWeekStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_visibleWeeks, 0);
  objc_storeStrong((id *)&self->_eventGestureController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeBarDropScrollTimer, 0);
  objc_storeStrong((id *)&self->_timeBarDropInteraction, 0);
  objc_storeStrong((id *)&self->_eventCreationController, 0);
  objc_storeStrong((id *)&self->_selectedOccurrencesFrontmostClonedViews, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceViews, 0);
  objc_storeStrong((id *)&self->_titleIntervalDateFormatter, 0);
  objc_storeStrong((id *)&self->_previousGestureDate, 0);
  objc_storeStrong((id *)&self->_timeMarkerTimer, 0);
  objc_storeStrong((id *)&self->_allDayDividerLineView, 0);
  objc_storeStrong((id *)&self->_weekScroller, 0);
  objc_storeStrong((id *)&self->_cachedLatestDate, 0);
  objc_storeStrong((id *)&self->_cachedEarliestDate, 0);
  objc_storeStrong((id *)&self->_reloadDateRangeEnd, 0);
  objc_storeStrong((id *)&self->_reloadDateRangeStart, 0);
  objc_storeStrong((id *)&self->_proposedTimeView, 0);
  objc_storeStrong((id *)&self->_referenceWeekStart, 0);
  objc_storeStrong((id *)&self->_displayedDate, 0);
}

- (int64_t)intendedSizeClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

- (double)headerVerticalOffset
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0.0;
}

@end
