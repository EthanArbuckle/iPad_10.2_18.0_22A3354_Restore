@implementation CarplayTableViewSection

- (CarplayTableViewSection)initWithPaddingCellEnabled:(BOOL)a3 titleForSectionHeader:(id)a4 shouldCollapseMultipleAllDayEvents:(BOOL)a5 model:(id)a6
{
  id v11;
  id v12;
  CarplayTableViewSection *v13;
  CarplayTableViewSection *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CarplayTableViewSection;
  v13 = -[CarplayTableViewSection init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_paddingCellEnabled = a3;
    objc_storeStrong((id *)&v13->_sectionTitle, a4);
    v14->_shouldCollapseAllDay = a5;
    v14->_currentlyCollapsed = 1;
    objc_storeStrong((id *)&v14->_model, a6);
  }

  return v14;
}

- (void)updateWithEvents:(id)a3
{
  NSArray *v4;
  NSArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableArray *v14;
  NSArray *allDayEvents;
  NSMutableArray *v16;
  NSArray *timedEvents;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", a3));
  events = self->_events;
  self->_events = v4;

  v6 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_events;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isAllDay", (_QWORD)v18))
          v14 = v6;
        else
          v14 = v7;
        -[NSMutableArray addObject:](v14, "addObject:", v13);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  allDayEvents = self->_allDayEvents;
  self->_allDayEvents = &v6->super;
  v16 = v6;

  timedEvents = self->_timedEvents;
  self->_timedEvents = &v7->super;

}

- (int64_t)numberOfRows
{
  _BOOL8 paddingCellEnabled;

  paddingCellEnabled = self->_paddingCellEnabled;
  if (!-[NSArray count](self->_events, "count"))
    return paddingCellEnabled + 1;
  if (-[CarplayTableViewSection _shouldCollapseAllDayEventsAccordingToPolicy](self, "_shouldCollapseAllDayEventsAccordingToPolicy"))
  {
    return -[NSArray count](self->_timedEvents, "count") + paddingCellEnabled + 1;
  }
  return -[NSArray count](self->_events, "count") + paddingCellEnabled;
}

- (id)cellForRow:(int64_t)a3 underDate:(id)a4 inTableView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CarplayCollapsedAllDayTableViewCell *v11;
  __objc2_class *v12;
  NSArray *timedEvents;
  int64_t v14;

  v8 = a4;
  v9 = a5;
  if (-[CarplayTableViewSection _cellInRowIsCollapsedAllDayCell:](self, "_cellInRowIsCollapsedAllDayCell:", a3))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayCollapsedAllDayTableViewCell reuseIdentifier](CarplayCollapsedAllDayTableViewCell, "reuseIdentifier"));
    v11 = -[CarplayCollapsedAllDayTableViewCell initWithStyle:reuseIdentifier:]([CarplayCollapsedAllDayTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v10);
    -[CarplayCollapsedAllDayTableViewCell configureWithAllDayCount:birthdayCount:](v11, "configureWithAllDayCount:birthdayCount:", (_BYTE *)-[NSArray count](self->_allDayEvents, "count")- (_BYTE *)-[CarplayTableViewSection _birthdayCount](self, "_birthdayCount"), -[CarplayTableViewSection _birthdayCount](self, "_birthdayCount"));
LABEL_13:

    goto LABEL_14;
  }
  if (-[NSArray count](self->_events, "count") | a3)
  {
    if (!self->_paddingCellEnabled
      || (char *)-[CarplayTableViewSection numberOfRows](self, "numberOfRows") - 1 != (_BYTE *)a3)
    {
      if (-[CarplayTableViewSection _shouldCollapseAllDayEventsAccordingToPolicy](self, "_shouldCollapseAllDayEventsAccordingToPolicy"))
      {
        timedEvents = self->_timedEvents;
        v14 = a3 - 1;
      }
      else
      {
        timedEvents = self->_events;
        v14 = a3;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](timedEvents, "objectAtIndexedSubscript:", v14));
      v11 = (CarplayCollapsedAllDayTableViewCell *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewSection _reusableOccurrenceTableViewCellForEvent:underDate:inTableView:](self, "_reusableOccurrenceTableViewCellForEvent:underDate:inTableView:", v10, v8, v9));
      goto LABEL_13;
    }
    v12 = CarplayPaddingTableViewCell;
  }
  else
  {
    v12 = CarplayNoEventsTableViewCell;
  }
  v11 = (CarplayCollapsedAllDayTableViewCell *)objc_opt_new(v12);
LABEL_14:

  return v11;
}

- (id)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  NSMutableArray *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  CarplayDetailViewController *v16;
  NSArray *timedEvents;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  NSMutableArray *v39;
  _QWORD block[5];
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  void *v45;

  v6 = a3;
  v7 = a4;
  if (-[CarplayTableViewSection _cellInRowIsCollapsedAllDayCell:](self, "_cellInRowIsCollapsedAllDayCell:", objc_msgSend(v7, "row")))
  {
    v8 = dispatch_time(0, 480000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010BE7C;
    block[3] = &unk_1001B26A0;
    block[4] = self;
    v9 = v6;
    v41 = v9;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    v10 = objc_opt_new(NSMutableArray);
    if (-[NSArray count](self->_allDayEvents, "count") >= 2)
    {
      v11 = 1;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, objc_msgSend(v7, "section")));
        -[NSMutableArray addObject:](v10, "addObject:", v12);

        ++v11;
      }
      while (v11 < -[NSArray count](self->_allDayEvents, "count"));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForRowAtIndexPath:", v7));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10010BE90;
    v35[3] = &unk_1001B2CB0;
    v35[4] = self;
    v36 = v7;
    v37 = v9;
    v38 = v13;
    v39 = v10;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10010BF28;
    v33[3] = &unk_1001B25D0;
    v34 = v37;
    v14 = v10;
    v15 = v13;
    objc_msgSend(v34, "performBatchUpdates:completion:", v35, v33);

    v16 = 0;
  }
  else
  {
    if (-[CarplayTableViewSection _shouldCollapseAllDayEventsAccordingToPolicy](self, "_shouldCollapseAllDayEventsAccordingToPolicy"))
    {
      timedEvents = self->_timedEvents;
      v18 = (char *)objc_msgSend(v7, "row") - 1;
    }
    else
    {
      timedEvents = self->_events;
      v18 = (char *)objc_msgSend(v7, "row");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](timedEvents, "objectAtIndexedSubscript:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "birthdayContactIdentifier"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "birthdayContactIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CNStarkCardViewController descriptorForRequiredKeys](CNStarkCardViewController, "descriptorForRequiredKeys"));
      v45 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unifiedContactWithIdentifier:keysToFetch:", v22, v24));

      v16 = (CarplayDetailViewController *)objc_claimAutoreleasedReturnValue(+[CNStarkCardViewController starkCardControllerForCalendarEventWithContact:](CNStarkCardViewController, "starkCardControllerForCalendarEventWithContact:", v25));
    }
    else if (objc_msgSend(v19, "isIntegrationEvent"))
    {
      if (objc_msgSend(v19, "CUIK_reminderShouldBeEditable"))
      {
        objc_msgSend(v19, "setCompleted:", objc_msgSend(v19, "completed") ^ 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "EKUI_editor"));
        v32 = 0;
        v27 = objc_msgSend(v26, "saveEvent:span:error:", v19, 0, &v32);
        v28 = v32;

        if ((v27 & 1) == 0)
        {
          v29 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
          }
        }
        v42 = v7;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v30, 100);

      }
      v16 = 0;
    }
    else
    {
      v16 = -[CarplayDetailViewController initWithEvent:showDayName:]([CarplayDetailViewController alloc], "initWithEvent:showDayName:", v19, 0);
    }

  }
  return v16;
}

- (id)headerForSectionInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_sectionTitle)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayTableViewHeaderView reuseIdentifier](CarplayTableViewHeaderView, "reuseIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v5));

    objc_msgSend(v6, "setHeaderText:", self->_sectionTitle);
    objc_msgSend(v6, "setAnyCalendarsHiddenByFocus:", -[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode") == (id)1);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (double)heightForHeaderInSection
{
  double result;

  +[CarplayTableViewHeaderView height](CarplayTableViewHeaderView, "height");
  return result;
}

+ (void)registerClassesOnTableView:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(CarplayTableViewHeaderView).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarplayTableViewHeaderView reuseIdentifier](CarplayTableViewHeaderView, "reuseIdentifier", v4));
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v6, v7);

  objc_opt_class(EKUIListViewAllDayEventCell);
  v9 = v8;
  objc_opt_class(EKUIListViewAllDayEventCell);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v9, v12);

  objc_opt_class(EKUIListViewTimedEventCell);
  v14 = v13;
  objc_opt_class(EKUIListViewTimedEventCell);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v14, v17);

  objc_opt_class(EKUIListViewReminderCell);
  v19 = v18;
  objc_opt_class(EKUIListViewReminderCell);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v19, v22);

  *(_QWORD *)&v23 = objc_opt_class(CarplayCollapsedAllDayTableViewCell).n128_u64[0];
  v25 = v24;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[CarplayCollapsedAllDayTableViewCell reuseIdentifier](CarplayCollapsedAllDayTableViewCell, "reuseIdentifier", v23));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v25, v26);

}

- (BOOL)_shouldCollapseAllDayEventsAccordingToPolicy
{
  return -[NSArray count](self->_allDayEvents, "count") >= 2
      && -[NSArray count](self->_events, "count") >= 5
      && self->_shouldCollapseAllDay
      && self->_currentlyCollapsed;
}

- (id)_reusableOccurrenceTableViewCellForEvent:(id)a3 underDate:(id)a4 inTableView:(id)a5
{
  id v6;
  id v7;
  Class v8;
  NSString *v9;
  void *v10;
  objc_class *v11;
  Class v12;
  NSString *v13;
  id v14;
  Class v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isReminderIntegrationEvent"))
  {
    objc_opt_class(EKUIListViewReminderCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (objc_class *)EKUIListViewReminderCell;
  }
  else
  {
    if (!objc_msgSend(v6, "isAllDay"))
    {
      objc_opt_class(EKUIListViewTimedEventCell);
      v16 = NSStringFromClass(v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v14 = objc_msgSend(objc_alloc((Class)EKUIListViewTimedEventCell), "initForCarplayWithReuseIdentifier:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDateUnadjustedForLegacyClients"));
      v20 = objc_msgSend(v17, "cal_isMultidayEventForUIWithStartDate:endDate:", v18, v19);

      objc_msgSend(v14, "updateWithEvent:isMultiday:occurrenceStartDate:dimmed:", v6, v20, v7, 0);
      goto LABEL_7;
    }
    objc_opt_class(EKUIListViewAllDayEventCell);
    v13 = NSStringFromClass(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (objc_class *)EKUIListViewAllDayEventCell;
  }
  v14 = objc_msgSend([v11 alloc], "initForCarplayWithReuseIdentifier:", v10);
  objc_msgSend(v14, "updateWithEvent:dimmed:", v6, 0);
LABEL_7:

  return v14;
}

- (int64_t)_birthdayCount
{
  NSArray *allDayEvents;
  void *v3;
  void *v4;
  id v5;

  allDayEvents = self->_allDayEvents;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1001B5BD0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](allDayEvents, "filteredArrayUsingPredicate:", v3));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (BOOL)_cellInRowIsCollapsedAllDayCell:(int64_t)a3
{
  BOOL result;

  result = -[CarplayTableViewSection _shouldCollapseAllDayEventsAccordingToPolicy](self, "_shouldCollapseAllDayEventsAccordingToPolicy");
  if (a3)
    return 0;
  return result;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)paddingCellEnabled
{
  return self->_paddingCellEnabled;
}

- (void)setPaddingCellEnabled:(BOOL)a3
{
  self->_paddingCellEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_timedEvents, 0);
  objc_storeStrong((id *)&self->_allDayEvents, 0);
}

@end
