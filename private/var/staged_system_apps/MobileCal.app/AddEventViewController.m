@implementation AddEventViewController

+ (id)editOrAddViewControllerForEventOrIntegrationWithEvent:(id)a3 model:(id)a4 creationMethod:(unint64_t)a5 eventEditViewDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  AddEventViewController *v12;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v9, "isNew"))
  {
    v12 = -[AddEventViewController initWithModel:event:]([AddEventViewController alloc], "initWithModel:event:", v10, v9);
    -[AddEventViewController setEventCreationMethod:](v12, "setEventCreationMethod:", a5);
    -[AddEventViewController setInternalEditViewDelegate:](v12, "setInternalEditViewDelegate:", v11);
  }
  else
  {
    v12 = (AddEventViewController *)objc_claimAutoreleasedReturnValue(+[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:](EKEventEditViewController, "eventOrIntegrationViewControllerWithEvent:creationMethod:eventEditViewDelegate:", v9, a5, v11));
  }

  return v12;
}

- (AddEventViewController)initWithModel:(id)a3 eventStartDate:(id)a4
{
  id v7;
  id v8;
  AddEventViewController *v9;
  AddEventViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AddEventViewController;
  v9 = -[AddEventViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeStrong((id *)&v10->_eventStartDate, a4);
    -[AddEventViewController _setClipUnderlapWhileTransitioning:](v10, "_setClipUnderlapWhileTransitioning:", 1);
    -[AddEventViewController setupManagers](v10, "setupManagers");
  }

  return v10;
}

- (AddEventViewController)initWithModel:(id)a3 event:(id)a4
{
  id v7;
  AddEventViewController *v8;
  AddEventViewController *v9;

  v7 = a4;
  v8 = -[AddEventViewController initWithModel:eventStartDate:](self, "initWithModel:eventStartDate:", a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_event, a4);
    if (objc_msgSend(v7, "isReminderIntegrationEvent"))
    {
      if (-[NSArray count](v9->_managers, "count") >= 2)
        v9->_selectedIndex = 1;
    }
  }

  return v9;
}

- (AddEventViewController)initWithModel:(id)a3 eventTitle:(id)a4 startDate:(id)a5 endDate:(id)a6 location:(id)a7
{
  id v13;
  id v14;
  id v15;
  AddEventViewController *v16;
  AddEventViewController *v17;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[AddEventViewController initWithModel:eventStartDate:](self, "initWithModel:eventStartDate:", a3, a5);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_eventTitle, a4);
    objc_storeStrong((id *)&v17->_eventEndDate, a6);
    objc_storeStrong((id *)&v17->_eventLocation, a7);
  }

  return v17;
}

- (void)setupManagers
{
  AddEventViewControllerManager *v3;
  _TtC9MobileCal32AddReminderViewControllerManager *v4;
  NSArray *v5;
  NSArray *managers;
  NSUInteger v7;
  NSMutableArray *v8;
  NSMutableArray *preservedViewControllerStacks;
  NSMutableArray *v10;
  NSMutableArray *lastFirstResponders;
  NSMutableArray *v12;
  void *v13;
  id v14;

  v14 = objc_alloc_init((Class)NSMutableArray);
  v3 = -[AddEventViewControllerManager initWithCalendarModel:]([AddEventViewControllerManager alloc], "initWithCalendarModel:", self->_model);
  -[AddEventViewControllerManager setAddItemViewControllerManagerDelegate:](v3, "setAddItemViewControllerManagerDelegate:", self);
  objc_msgSend(v14, "addObject:", v3);
  if (-[AddEventViewController hasReminderCalendar](self, "hasReminderCalendar")
    && (+[EKAppProtectionUtils isReminderAppLocked](EKAppProtectionUtils, "isReminderAppLocked") & 1) == 0)
  {
    v4 = -[AddReminderViewControllerManager initWithModel:]([_TtC9MobileCal32AddReminderViewControllerManager alloc], "initWithModel:", self->_model);
    -[AddReminderViewControllerManager setAddItemViewControllerManagerDelegate:](v4, "setAddItemViewControllerManagerDelegate:", self);
    objc_msgSend(v14, "addObject:", v4);

  }
  v5 = (NSArray *)objc_msgSend(v14, "copy");
  managers = self->_managers;
  self->_managers = v5;

  v7 = -[NSArray count](self->_managers, "count");
  v8 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7);
  preservedViewControllerStacks = self->_preservedViewControllerStacks;
  self->_preservedViewControllerStacks = v8;

  v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7);
  lastFirstResponders = self->_lastFirstResponders;
  self->_lastFirstResponders = v10;

  for (; v7; --v7)
  {
    -[NSMutableArray addObject:](self->_preservedViewControllerStacks, "addObject:", &__NSArray0__struct);
    v12 = self->_lastFirstResponders;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray addObject:](v12, "addObject:", v13);

  }
}

- (BOOL)hasReminderCalendar
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel reminderCalendar](self->_model, "reminderCalendar"));
  v3 = v2 != 0;

  return v3;
}

- (id)segmentedControl
{
  UISegmentedControl *segmentedControl;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  id v9;
  void *v10;
  UISegmentedControl *v11;
  UISegmentedControl *v12;
  AddEventViewController *v14;
  NSArray *obj;
  _QWORD v16[4];
  id v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  _BYTE v23[128];

  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_managers, "count"));
    v14 = self;
    objc_initWeak(&location, self);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = self->_managers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = 0;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "newItemTitle");
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000EDA64;
          v16[3] = &unk_1001B5558;
          objc_copyWeak(v17, &location);
          v17[1] = (char *)i + v6;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v16));

          objc_msgSend(v4, "addObject:", v10);
          objc_destroyWeak(v17);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v6 += (uint64_t)i;
      }
      while (v5);
    }

    v11 = (UISegmentedControl *)objc_msgSend(objc_alloc((Class)UISegmentedControl), "initWithFrame:actions:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[UISegmentedControl setSelectedSegmentIndex:](v11, "setSelectedSegmentIndex:", v14->_selectedIndex);
    v12 = v14->_segmentedControl;
    v14->_segmentedControl = v11;

    objc_destroyWeak(&location);
    segmentedControl = v14->_segmentedControl;
  }
  return segmentedControl;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AddEventViewController;
  -[AddEventViewController viewDidLoad](&v3, "viewDidLoad");
  -[AddEventViewController setDelegate:](self, "setDelegate:", self);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AddEventViewController;
  -[AddEventViewController viewDidLayoutSubviews](&v23, "viewDidLayoutSubviews");
  if (self->_segmentedControl)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController view](self, "view"));
    objc_msgSend(v3, "layoutMargins");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController navigationBar](self, "navigationBar"));
    objc_msgSend(v8, "bounds");
    v10 = v9;

    v11 = v10 - v5 - v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController traitCollection](self, "traitCollection"));
    v13 = objc_msgSend(v12, "horizontalSizeClass");

    if (v13 == (id)2)
      v14 = 366.0;
    else
      v14 = v11;
    v15 = v11;
    if (v14 < v11)
    {
      -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v11, 0.0);
      if (v11 < v16)
        v16 = v11;
      if (v16 >= v14)
        v15 = v16;
      else
        v15 = v14;
    }
    v17 = v5 + (v11 - v15) * 0.5;
    -[UISegmentedControl bounds](self->_segmentedControl, "bounds");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController traitCollection](self, "traitCollection"));
    v21 = objc_msgSend(v20, "displayScale");
    UIRectRoundToScale(v21, v17, 0.0, v15, v19, v22);
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");

  }
}

- (void)setupNavigationItemFor:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  _UINavigationBarPalette *v10;
  _UINavigationBarPalette *palette;
  id v12;
  void *v13;
  void *v14;
  _UINavigationBarPalette *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _UINavigationBarPalette *v22;
  id v23;

  v23 = a3;
  if (-[NSArray count](self->_managers, "count") >= 2)
  {
    if (!self->_palette)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController segmentedControl](self, "segmentedControl"));
      objc_msgSend(v4, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      v6 = v5;
      v8 = v7;
      objc_msgSend(v4, "setFrame:", 0.0, 0.0, v5, v7);
      v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v6, v8 + 12.0);
      objc_msgSend(v9, "addSubview:", v4);
      v10 = (_UINavigationBarPalette *)objc_msgSend(objc_alloc((Class)_UINavigationBarPalette), "initWithContentView:", v9);
      palette = self->_palette;
      self->_palette = v10;

    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentRootViewController](self, "currentRootViewController"));

    if (v12 == v23)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NewItemNavigationTitle"), CFSTR("New"), 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationItem"));
      objc_msgSend(v18, "setTitle:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
      v20 = objc_msgSend(v19, "newItemBackButtonTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationItem"));
      objc_msgSend(v21, "setBackButtonTitle:", v20);

      v22 = self->_palette;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationItem"));
      v14 = v13;
      v15 = v22;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationItem"));
      v14 = v13;
      v15 = 0;
    }
    objc_msgSend(v13, "_setBottomPalette:", v15);

  }
}

- (void)selectSegmentIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (self->_selectedIndex != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstResponder"));
    v9 = (void *)v8;
    if (v8
      && (objc_opt_respondsToSelector(v8, "isDescendantOfView:") & 1) != 0
      && objc_msgSend(v9, "isDescendantOfView:", v7))
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_lastFirstResponders, "setObject:atIndexedSubscript:", v9, self->_selectedIndex);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_lastFirstResponders, "setObject:atIndexedSubscript:", v10, self->_selectedIndex);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController view](self, "view"));
    objc_msgSend(v11, "endEditing:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController configuration](self, "configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addItemState"));
    objc_msgSend(v12, "updateStateFromUI:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController viewControllers](self, "viewControllers"));
    -[NSMutableArray setObject:atIndexedSubscript:](self->_preservedViewControllerStacks, "setObject:atIndexedSubscript:", v15, self->_selectedIndex);

    self->_selectedIndex = a3;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_preservedViewControllerStacks, "objectAtIndexedSubscript:", a3));
    if (objc_msgSend(v16, "count"))
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_preservedViewControllerStacks, "setObject:atIndexedSubscript:", &__NSArray0__struct, a3);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentRootViewController](self, "currentRootViewController"));
      v25 = v17;
      v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));

      v16 = (void *)v18;
    }
    -[AddEventViewController setViewControllers:animated:](self, "setViewControllers:animated:", v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController configuration](self, "configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addItemState"));
    objc_msgSend(v19, "updateUIFromState:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lastFirstResponders, "objectAtIndexedSubscript:", self->_selectedIndex));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if (v22 != v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lastFirstResponders, "objectAtIndexedSubscript:", self->_selectedIndex));
      objc_msgSend(v24, "becomeFirstResponder");

    }
  }
}

- (id)configuration
{
  AddItemViewControllerConfiguration *configuration;
  EKEvent *event;
  CUIKCalendarModel *v5;
  void *v6;
  EKEvent *v7;
  void *v8;
  EKCalendarDate *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  EKCalendarDate *exactEventStartDate;
  uint64_t v19;
  EKCalendarDate *eventEndDate;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  EKEvent *v26;
  EKEvent *v27;
  _BOOL8 v28;
  AddItemState *v29;
  AddItemViewControllerConfiguration *v30;
  AddItemViewControllerConfiguration *v31;
  CUIKCalendarModel *v33;
  void *v34;
  id v35;
  id v36;

  configuration = self->_configuration;
  if (!configuration)
  {
    event = self->_event;
    if (!event)
    {
      v5 = self->_model;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](v5, "eventStore"));
      v7 = (EKEvent *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel defaultCalendarForNewEvents](v5, "defaultCalendarForNewEvents"));
      -[EKEvent setCalendar:](v7, "setCalendar:", v8);

      if (self->_eventTitle)
        -[EKEvent setTitle:](v7, "setTitle:");
      if (self->_eventLocation)
        -[EKEvent setStructuredLocation:](v7, "setStructuredLocation:");
      v9 = self->_eventStartDate;
      if (!v9)
      {
        v10 = objc_alloc((Class)EKCalendarDate);
        v11 = CUIKNowComponents(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](v5, "eventStore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
        v9 = (EKCalendarDate *)objc_msgSend(v10, "initWithDateComponents:timeZone:", v12, v14);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](v9, "date"));
      v35 = 0;
      v36 = 0;
      CUIKGetDefaultStartAndEndTimeForDate(v15, &v36, &v35);
      v16 = v36;
      v17 = v35;

      exactEventStartDate = self->_exactEventStartDate;
      if (exactEventStartDate)
      {
        v19 = objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](exactEventStartDate, "date"));

        v16 = (id)v19;
      }
      eventEndDate = self->_eventEndDate;
      v33 = v5;
      if (eventEndDate)
      {
        v21 = objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](eventEndDate, "date", v5));

        v17 = (id)v21;
      }
      -[EKEvent setStartDate:](v7, "setStartDate:", v16, v33);
      -[EKEvent setEndDate:](v7, "setEndDate:", v17);
      -[EKEvent setAllDay:](v7, "setAllDay:", self->_allDay);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](v7, "calendar"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "source"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "defaultAlarmOffset"));

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:", (double)(int)objc_msgSend(v24, "intValue")));
        -[EKEvent addAlarm:](v7, "addAlarm:", v25);

      }
      v26 = self->_event;
      self->_event = v7;
      v27 = v7;

      event = 0;
    }
    v28 = event != 0;
    v29 = -[AddItemState initWithEvent:]([AddItemState alloc], "initWithEvent:", self->_event);
    -[AddItemState setExplicitTime:](v29, "setExplicitTime:", v28);
    v30 = -[AddItemViewControllerConfiguration initWithAddItemState:]([AddItemViewControllerConfiguration alloc], "initWithAddItemState:", v29);
    -[AddItemViewControllerConfiguration setSuggestionKey:](v30, "setSuggestionKey:", self->_suggestionKey);
    -[AddItemViewControllerConfiguration setCreationMethod:](v30, "setCreationMethod:", self->_eventCreationMethod);
    v31 = self->_configuration;
    self->_configuration = v30;

    configuration = self->_configuration;
  }
  return configuration;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  int IsRegularInViewHierarchy;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController view](self, "view"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2, v3);

  if (IsRegularInViewHierarchy)
    return 26;
  else
    return 30;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  Class v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController presentedViewController](self, "presentedViewController", a3, a4));
  v5 = NSClassFromString(CFSTR("_UIDatePickerNumericKeyboardViewController"));
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController presentedViewController](self, "presentedViewController"));
    v7 = objc_msgSend(v6, "isBeingDismissed");

    if ((v7 & 1) == 0)
      -[AddEventViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  else
  {

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController backgroundColor](self, "backgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  objc_msgSend(v4, "setEditorBackgroundColor:", v5);

}

- (id)_eventEditorForTestingOnly
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_managers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v6, "_eventEditorForTestingOnly") & 1) != 0)
        {
          v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_eventEditorForTestingOnly", (_QWORD)v8));
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isModalInPresentation
{
  return !-[AddEventViewController canDismiss](self, "canDismiss");
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)backgroundColor
{
  void *v2;

  if (-[AddEventViewController isPresentedInsidePopover](self, "isPresentedInsidePopover"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableViewBackgroundColorOpaque](UIColor, "tableViewBackgroundColorOpaque"));
  return v2;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentRootViewController](self, "currentRootViewController"));
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AddEventViewController;
  -[AddEventViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController viewControllers](self, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentRootViewController](self, "currentRootViewController"));
    -[AddEventViewController pushViewController:animated:](self, "pushViewController:animated:", v6, 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController presentationController](self, "presentationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController presentationController](self, "presentationController"));
    objc_msgSend(v9, "setDelegate:", self);

  }
}

- (id)currentManager
{
  unint64_t selectedIndex;
  NSUInteger v4;
  NSArray *managers;
  void *v6;

  selectedIndex = self->_selectedIndex;
  v4 = -[NSArray count](self->_managers, "count");
  managers = self->_managers;
  if (selectedIndex <= v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](managers, "objectAtIndexedSubscript:", self->_selectedIndex));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](managers, "lastObject"));
  return v6;
}

- (void)loadViewController
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v5, "createViewController:", v3);

}

- (id)currentRootViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewController"));

  if (!v4)
  {
    -[AddEventViewController loadViewController](self, "loadViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));

  }
  return v4;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager", a3));
  objc_msgSend(v3, "presentationControllerDidDismiss");

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager", a3));
  objc_msgSend(v3, "presentationControllerDidAttemptToDismiss");

}

- (void)addItemViewControllerManager:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void ***v11;
  CUIKCalendarModel *model;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController doneBlock](self, "doneBlock"));

  if (v7)
  {
    if ((objc_opt_respondsToSelector(v6, "requestReminderSheet:") & 1) != 0)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000EEBF0;
      v23[3] = &unk_1001B5580;
      v24 = v6;
      v8 = objc_retainBlock(v23);

    }
    else
    {
      v8 = 0;
    }
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AddEventViewController doneBlock](self, "doneBlock"));
    ((void (**)(_QWORD, AddEventViewController *, _QWORD *))v9)[2](v9, self, v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector(v6, "requestReminderSheet:") & 1) != 0)
    {
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_1000EEBFC;
      v21 = &unk_1001B5580;
      v22 = v6;
      v11 = objc_retainBlock(&v18);

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(WeakRetained, "eventEditViewController:didCompleteWithAction:completionHandler:", self, a4, v11, v18, v19, v20, v21);

  }
  else if (a4 == 1)
  {
    model = self->_model;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](self->_event, "calendar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
    -[CUIKCalendarModel ensureCalendarVisibleWithId:](model, "ensureCalendarVisibleWithId:", v14);

    if (-[AddEventViewController showEventWhenAdded](self, "showEventWhenAdded"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController addEventDelegate](self, "addEventDelegate"));
      objc_msgSend(v15, "showNewEvent:", self->_event);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent calendar](self->_event, "calendar"));
    v17 = objc_msgSend(v16, "sharingStatus");

    if (v17)
      -[AddEventViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt");
  }

}

- (id)pasteboardManager
{
  return -[CUIKCalendarModel pasteboardManager](self->_model, "pasteboardManager");
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:calendarModel:](EKUIAppReviewUtils, "displayReviewPromptIfNeededInScene:calendarModel:", v4, self->_model);

}

- (BOOL)canDismiss
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v3 = objc_msgSend(v2, "canDismiss");

  return v3;
}

- (BOOL)displayingRootView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController visibleViewController](self, "visibleViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController viewControllers](self, "viewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = v3 == v5;

  return v6;
}

- (void)didAttemptToDismiss
{
  void *v3;
  void *v4;
  id v5;

  if (-[AddEventViewController displayingRootView](self, "displayingRootView"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "confirmDismissAlertController"));

    v4 = v5;
    if (v5)
    {
      -[AddEventViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
      v4 = v5;
    }

  }
}

- (void)configureAppearanceForSplitDayView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v4, "configureWithOpaqueBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController navigationBar](self, "navigationBar"));
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (BOOL)hasUnsavedChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v3 = objc_msgSend(v2, "hasUnsavedChanges");

  return v3;
}

- (BOOL)willPresentDialogOnSave
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v3 = objc_msgSend(v2, "willPresentDialogOnSave");

  return v3;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  objc_msgSend(v5, "completeAndSaveWithContinueBlock:", v4);

}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  objc_msgSend(v4, "setIgnoreUnsavedChanges:", v3);

}

- (BOOL)ignoreUnsavedChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  v3 = objc_msgSend(v2, "ignoreUnsavedChanges");

  return v3;
}

- (void)cancelEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AddEventViewController currentManager](self, "currentManager"));
  objc_msgSend(v2, "cancelEditing");

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  -[AddEventViewController setupNavigationItemFor:](self, "setupNavigationItemFor:", a4);
}

- (BOOL)wantsManagement
{
  return !-[AddEventViewController presentedOverWholeApp](self, "presentedOverWholeApp");
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  return (EKEventOrIntegrationEditViewDelegate *)objc_loadWeakRetained((id *)&self->_editViewDelegate);
}

- (void)setInternalEditViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editViewDelegate, a3);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (BOOL)showEventWhenAdded
{
  return self->_showEventWhenAdded;
}

- (void)setShowEventWhenAdded:(BOOL)a3
{
  self->_showEventWhenAdded = a3;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (EKCalendarDate)exactEventStartDate
{
  return self->_exactEventStartDate;
}

- (void)setExactEventStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_exactEventStartDate, a3);
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionKey, a3);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (AddEventDelegate)addEventDelegate
{
  return (AddEventDelegate *)objc_loadWeakRetained((id *)&self->_addEventDelegate);
}

- (void)setAddEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addEventDelegate, a3);
}

- (unint64_t)eventCreationMethod
{
  return self->_eventCreationMethod;
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  self->_eventCreationMethod = a3;
}

- (BOOL)presentedOverWholeApp
{
  return self->_presentedOverWholeApp;
}

- (void)setPresentedOverWholeApp:(BOOL)a3
{
  self->_presentedOverWholeApp = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addEventDelegate);
  objc_storeStrong((id *)&self->_suggestionKey, 0);
  objc_storeStrong((id *)&self->_exactEventStartDate, 0);
  objc_storeStrong(&self->_doneBlock, 0);
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->_lastFirstResponders, 0);
  objc_storeStrong((id *)&self->_preservedViewControllerStacks, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_eventLocation, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
