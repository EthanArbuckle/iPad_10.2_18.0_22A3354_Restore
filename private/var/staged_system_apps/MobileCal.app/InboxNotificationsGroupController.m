@implementation InboxNotificationsGroupController

- (InboxNotificationsGroupController)initWithModel:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  InboxNotificationsGroupController *v9;
  InboxNotificationsGroupController *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingComments;
  NSMutableDictionary *v13;
  NSMutableDictionary *conflictInfo;
  NSMutableDictionary *v15;
  NSMutableDictionary *organizerNames;
  id v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *prefetchConflictsQueue;
  dispatch_queue_t v24;
  OS_dispatch_queue *conflictsScanningQueue;
  dispatch_queue_t v26;
  OS_dispatch_queue *conflictsQueue;
  dispatch_queue_t v28;
  OS_dispatch_queue *prefetchNamesQueue;
  dispatch_queue_t v30;
  OS_dispatch_queue *namesQueue;
  void *v32;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)InboxNotificationsGroupController;
  v9 = -[InboxNotificationsGroupController init](&v34, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_needsRefresh = 1;
    v11 = objc_opt_new(NSMutableDictionary);
    pendingComments = v10->_pendingComments;
    v10->_pendingComments = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    conflictInfo = v10->_conflictInfo;
    v10->_conflictInfo = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    organizerNames = v10->_organizerNames;
    v10->_organizerNames = v15;

    v17 = +[CUIKNotificationDescriptionGenerator sharedGenerator](CUIKNotificationDescriptionGenerator, "sharedGenerator");
    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("PrefetchConflictQueue", v19);
    prefetchConflictsQueue = v10->_prefetchConflictsQueue;
    v10->_prefetchConflictsQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_create("ConflictScanningQ", v21);
    conflictsScanningQueue = v10->_conflictsScanningQueue;
    v10->_conflictsScanningQueue = (OS_dispatch_queue *)v24;

    v26 = dispatch_queue_create("ConflictsQ", v21);
    conflictsQueue = v10->_conflictsQueue;
    v10->_conflictsQueue = (OS_dispatch_queue *)v26;

    v28 = dispatch_queue_create("PrefetchNamesQ", v19);
    prefetchNamesQueue = v10->_prefetchNamesQueue;
    v10->_prefetchNamesQueue = (OS_dispatch_queue *)v28;

    v30 = dispatch_queue_create("NamesQ", v21);
    namesQueue = v10->_namesQueue;
    v10->_namesQueue = (OS_dispatch_queue *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, "_notificationsChanged:", CUIKCalendarModelNotificationsChangedNotification, v10->_model);
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, "_notificationsChanged:", EKEventStoreChangedNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, "_notificationsChanged:", CUIKCalendarModelIdentityChangedNotification, v10->_model);
    objc_msgSend(v32, "addObserver:selector:name:object:", v10, "_notificationsChanged:", CUIKCalendarModelFocusModeConfigurationChangedNotification, v10->_model);
    -[InboxNotificationsGroupController refreshIfNeeded](v10, "refreshIfNeeded");

  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;

  -[InboxNotificationsGroupController setVisible:](self, "setVisible:", 1);
  -[InboxNotificationsGroupController refreshIfNeeded](self, "refreshIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &stru_1001B3AE0);

}

- (void)viewDidDisappear
{
  -[InboxNotificationsGroupController setVisible:](self, "setVisible:", 0);
}

- (id)conflictInfoForNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *conflictsQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *conflictsScanningQueue;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10008D80C;
  v28 = sub_10008D81C;
  v29 = 0;
  if (!objc_msgSend(v4, "type") || objc_msgSend(v4, "type") == (id)1)
  {
    v5 = v4;
    conflictsQueue = self->_conflictsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008D824;
    block[3] = &unk_1001B3838;
    v23 = &v24;
    block[4] = self;
    v7 = v5;
    v22 = v7;
    dispatch_sync(conflictsQueue, block);
    if (!v25[5])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventForObjectID:occurrenceDate:checkValid:", v10, v11, 0));

      }
      else
      {
        v12 = 0;
      }
      conflictsScanningQueue = self->_conflictsScanningQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10008D884;
      v17[3] = &unk_1001B3B08;
      v17[4] = self;
      v20 = &v24;
      v18 = v7;
      v19 = v12;
      v14 = v12;
      dispatch_sync(conflictsScanningQueue, v17);

    }
  }
  v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (void)prefetchConflictInfo
{
  void *v3;
  NSObject *prefetchConflictsQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  InboxNotificationsGroupController *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_notificationReferences));
  prefetchConflictsQueue = self->_prefetchConflictsQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008DADC;
  v6[3] = &unk_1001B26A0;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(prefetchConflictsQueue, v6);

}

- (void)inboxWillDismiss
{
  -[InboxNotificationsGroupController _savePendingComments](self, "_savePendingComments");
}

- (void)prefetchRow:(int64_t)a3
{
  NSObject *prefetchNamesQueue;
  _QWORD v4[6];

  prefetchNamesQueue = self->_prefetchNamesQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008DC64;
  v4[3] = &unk_1001B2838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(prefetchNamesQueue, v4);
}

- (void)refreshIfNeeded
{
  NSObject *v3;
  InboxNotificationsGroupController *v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *notificationReferences;
  NSObject *v9;
  NSMutableArray *v10;
  id v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  void *v16;
  NSObject *v17;
  InboxNotificationsGroupController *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  InboxNotificationsGroupController *v23;

  if (self->_needsRefresh)
  {
    v3 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[INBOX] Refreshing inbox notifications group controller: %{public}@.", buf, 0xCu);
    }
    v4 = (InboxNotificationsGroupController *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventNotificationReferencesForCurrentIdentity](self->_model, "eventNotificationReferencesForCurrentIdentity"));
    objc_storeStrong((id *)&self->_allNotificationReferences, v4);
    v5 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[INBOX] Event notification references for current identity: %{public}@.", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController filteredNotificationsFromArray:](self, "filteredNotificationsFromArray:", v4));
    v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    notificationReferences = self->_notificationReferences;
    self->_notificationReferences = v7;

    v9 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_notificationReferences;
      *(_DWORD *)buf = 138543362;
      v23 = (InboxNotificationsGroupController *)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Filtered event notification references for selected identity: %{public}@.", buf, 0xCu);
    }
    v11 = -[NSMutableArray count](self->_notificationReferences, "count");
    -[InboxNotificationsGroupController prefetchConflictInfo](self, "prefetchConflictInfo");
    if (-[NSMutableDictionary count](self->_pendingComments, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_pendingComments, "allKeys"));
      v13 = objc_msgSend(v12, "mutableCopy");

      v14 = self->_notificationReferences;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10008E080;
      v20[3] = &unk_1001B3B30;
      v21 = v13;
      v15 = v13;
      -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v20);
      -[NSMutableDictionary removeObjectsForKeys:](self->_pendingComments, "removeObjectsForKeys:", v15);

    }
    v16 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (InboxNotificationsGroupController *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Number of notifications after refresh: [%{public}@].", buf, 0xCu);

    }
    self->_needsRefresh = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
    objc_msgSend(v19, "inboxTableViewGroupController:addedRows:removedRows:updatedRows:", self, 0, 0, 0);

  }
}

- (BOOL)hasRows
{
  return -[NSMutableArray count](self->_notificationReferences, "count") != 0;
}

- (int64_t)numberOfRows
{
  return (int64_t)-[NSMutableArray count](self->_notificationReferences, "count");
}

- (id)cellForRow:(int64_t)a3 allowAsyncLoading:(BOOL)a4
{
  _BOOL8 v4;
  CalendarMessageCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *conflictsQueue;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *prefetchConflictsQueue;
  NSObject *namesQueue;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char isKindOfClass;
  void *v31;
  NSMutableDictionary *pendingComments;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  _QWORD v39[5];
  id v40;
  __int128 *v41;
  _QWORD v42[4];
  id v43;
  InboxNotificationsGroupController *v44;
  id v45;
  _QWORD block[5];
  id v47;
  __int128 *p_buf;
  id location[2];
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v4 = a4;
  v7 = objc_alloc_init(CalendarMessageCell);
  if (-[NSMutableArray count](self->_notificationReferences, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_notificationReferences, "objectAtIndex:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notification"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
      if (objc_msgSend(v10, "type") != (id)8
        || (-[NSMutableArray containsObject:](self->_sharedCalendarInvitationsReplyPending, "containsObject:", v11) & 1) == 0)
      {
        v12 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v10);
        v13 = NSStringFromClass(v12);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController tableView](self, "tableView"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dequeueReusableCellWithIdentifier:", v38));

        v7 = (CalendarMessageCell *)v15;
        if (!v15)
          v7 = (CalendarMessageCell *)objc_msgSend([v12 alloc], "initWithStyle:reuseIdentifier:", 0, v38);
        if (!objc_msgSend(v10, "type") || objc_msgSend(v10, "type") == (id)1)
        {
          v16 = v10;
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v51 = 0x3032000000;
          v52 = sub_10008D80C;
          v53 = sub_10008D81C;
          v54 = 0;
          conflictsQueue = self->_conflictsQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10008E720;
          block[3] = &unk_1001B3838;
          p_buf = &buf;
          block[4] = self;
          v18 = v16;
          v47 = v18;
          dispatch_sync(conflictsQueue, block);
          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          {
            v19 = objc_opt_new(NSMutableDictionary);
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator sharedGenerator](CUIKNotificationDescriptionGenerator, "sharedGenerator"));
            v21 = objc_msgSend(v20, "conflictStringForConflictDetails:maxTitleLength:descriptions:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 20, v19);

            -[CalendarMessageCell setConflictDict:](v7, "setConflictDict:", v19);
          }
          else
          {
            objc_initWeak(location, self);
            prefetchConflictsQueue = self->_prefetchConflictsQueue;
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_10008E780;
            v42[3] = &unk_1001B3B58;
            objc_copyWeak(&v45, location);
            v43 = v8;
            v44 = self;
            dispatch_async(prefetchConflictsQueue, v42);

            objc_destroyWeak(&v45);
            objc_destroyWeak(location);
          }

          _Block_object_dispose(&buf, 8);
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v51 = 0x3032000000;
        v52 = sub_10008D80C;
        v53 = sub_10008D81C;
        v54 = 0;
        namesQueue = self->_namesQueue;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10008E8F4;
        v39[3] = &unk_1001B3838;
        v41 = &buf;
        v39[4] = self;
        v26 = v10;
        v40 = v26;
        dispatch_sync(namesQueue, v39);
        objc_opt_class(CalendarMessageEventInvitationCell);
        if ((objc_opt_isKindOfClass(v7, v27) & 1) != 0)
          -[CalendarMessageCell setOrganizerName:](v7, "setOrganizerName:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorView](v7, "authorView"));
        objc_opt_class(EKUILabeledAvatarView);
        isKindOfClass = objc_opt_isKindOfClass(v28, v29);

        if ((isKindOfClass & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorView](v7, "authorView"));
          objc_msgSend(v31, "setLoadContactsAsynchronously:", v4);

        }
        -[CalendarMessageCell setDelegate:](v7, "setDelegate:", self);
        -[CalendarMessageCell setNotification:](v7, "setNotification:", v26);
        pendingComments = self->_pendingComments;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "URL"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pendingComments, "objectForKeyedSubscript:", v33));

        -[CalendarMessageCell setShowsCommentPrompt:animated:initialValue:](v7, "setShowsCommentPrompt:animated:initialValue:", v34 != 0, 0, v34);
        v35 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v11;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Generating cell for notification with URI: [%@]", (uint8_t *)location, 0xCu);
        }

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      v22 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = a3;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Notification reference is nil for inbox cell in row %ld.", (uint8_t *)&buf, 0xCu);
      }
      v23 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Notification Reference: %@", (uint8_t *)&buf, 0xCu);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "URL"));
    }

  }
  v36 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Loading notification cell at row: [%ld]", (uint8_t *)&buf, 0xCu);
  }
  return v7;
}

- (double)estimatedHeightForRow:(int64_t)a3
{
  double result;

  +[CalendarMessageCell defaultRowHeight](CalendarMessageCell, "defaultRowHeight", a3);
  return result;
}

- (void)rowSelected:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController cellForRow:allowAsyncLoading:](self, "cellForRow:allowAsyncLoading:", a3, 0));
  objc_opt_class(CalendarMessageAttendeeReplyCell);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0
    && (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "proposedTimeAttendee"))) != 0)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController eventForRow:](self, "eventForRow:", a3));
    objc_msgSend(v8, "inboxTableViewGroupController:viewProposedTimeForAttendee:onEvent:", self, v7, v9);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController eventForRow:](self, "eventForRow:", a3));
    objc_msgSend(v7, "inboxTableViewGroupController:inspectEvent:", self, v8);
  }

}

- (BOOL)canSelectRow:(int64_t)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController eventForRow:](self, "eventForRow:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)eventForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if ((uint64_t)-[NSMutableArray count](self->_notificationReferences, "count") > a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_notificationReferences, "objectAtIndex:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notification"));

    objc_opt_class(EKCalendarEventInvitationNotification);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      if (!v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_eventWithURI:checkValid:", v11, 1));
        goto LABEL_18;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDateForNextOccurrence"));
      v13 = v12;
      if (!v12)
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventForObjectID:occurrenceDate:checkValid:", v11, v13, 0));
      if (!v12)

    }
    else
    {
      objc_opt_class(EKCalendarResourceChangeNotification);
      if ((objc_opt_isKindOfClass(v6, v15) & 1) == 0)
      {
        v14 = 0;
LABEL_20:

        return v14;
      }
      v16 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventWithIdentifier:", v18));

      if (!v12)
      {
        v14 = 0;
        goto LABEL_19;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate CalSimulatedDateForNow](NSDate, "CalSimulatedDateForNow"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextOccurrenceOrDetachmentAfter:", v10));
      v11 = (void *)v19;
      if (v19)
        v20 = (void *)v19;
      else
        v20 = v12;
      v14 = v20;
    }

LABEL_18:
LABEL_19:

    goto LABEL_20;
  }
  v14 = 0;
  return v14;
}

- (id)titleForHeader
{
  return 0;
}

- (void)_saveStatus:(int64_t)a3 forEventInvitationNotification:(id)a4 commit:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSMutableDictionary *pendingComments;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  void *v34;
  unsigned __int8 v35;
  NSObject *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;

  v5 = a5;
  v8 = a4;
  v9 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138543618;
    v40 = v11;
    v41 = 2114;
    v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving participant status: [%{public}@] for event invitation notification: %{public}@.", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventFromEventStore:", v12));

  objc_msgSend(v13, "setInvitationStatus:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorForGroupController:", self));

  if (objc_msgSend(v8, "type") == (id)2)
  {
    objc_msgSend(v15, "deleteEvent:span:error:", v13, 2, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "source"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraints"));
    v19 = objc_msgSend(v18, "mustAcknowledgeMasterEvent");

    if (v19)
    {
      if (objc_msgSend(v13, "hasRecurrenceRules"))
        v20 = 4;
      else
        v20 = 0;
      if (a3)
        objc_msgSend(v13, "setParticipationStatus:", a3);
    }
    else if (a3)
    {
      objc_msgSend(v13, "setParticipationStatus:", a3);
      v20 = 2;
    }
    else
    {
      v20 = objc_msgSend(v13, "hasRecurrenceRules");
    }
    pendingComments = self->_pendingComments;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pendingComments, "objectForKeyedSubscript:", v22));

    if (v23)
    {
      v24 = self->_pendingComments;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
      -[NSMutableDictionary removeObjectForKey:](v24, "removeObjectForKey:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "responseComment"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:](CUIKNotificationDescriptionGenerator, "stringWithAutoCommentRemoved:", v26));

      if (!v27)
        v27 = &stru_1001B67C0;
      if ((objc_msgSend(v23, "isEqualToString:", v27) & 1) == 0)
      {
        if (!objc_msgSend(v23, "length"))
        {

          v23 = 0;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "proposedStartDate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator comment:withInsertedAutoCommentForDate:timeZone:](CUIKNotificationDescriptionGenerator, "comment:withInsertedAutoCommentForDate:timeZone:", v23, v28, v29));
        objc_msgSend(v13, "setResponseComment:", v30);

      }
    }
    if (v5)
    {
      v38 = 0;
      v31 = objc_msgSend(v15, "saveEvent:span:error:", v13, v20, &v38);
      v32 = v38;
      if ((v31 & 1) == 0)
      {
        v33 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Error saving invitation status: %@.", buf, 0xCu);
        }
      }
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventStore"));
      v37 = 0;
      v35 = objc_msgSend(v34, "saveEvent:span:commit:error:", v13, v20, 0, &v37);
      v32 = v37;

      if ((v35 & 1) == 0)
      {
        v36 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v32;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error saving invitation status: %@.", buf, 0xCu);
        }
        objc_msgSend(v13, "rollback");
      }
    }

  }
}

- (void)_savePendingComments
{
  NSMutableArray *notificationReferences;
  _QWORD v4[5];

  notificationReferences = self->_notificationReferences;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008F13C;
  v4[3] = &unk_1001B3B30;
  v4[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](notificationReferences, "enumerateObjectsUsingBlock:", v4);
  -[NSMutableDictionary removeAllObjects](self->_pendingComments, "removeAllObjects");
}

- (void)_performAction:(int64_t)a3 forSuggestionNotification:(id)a4 save:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourceChangeFromEventStore:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v34 = 0;
  v14 = objc_msgSend(v13, "removeResourceChange:error:", v11, &v34);
  v15 = v34;

  if ((v14 & 1) == 0)
  {
    v16 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error removing resource change: %@", buf, 0xCu);
    }

    v15 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventWithIdentifier:", v17));

  if (v19)
  {
    v20 = v19;

    v12 = v20;
  }
  v32 = v9;
  if (a3 == 128)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueKey"));
    +[EKSuggestionsServiceLogger logEventRejectedInboxWithUniqueKey:](EKSuggestionsServiceLogger, "logEventRejectedInboxWithUniqueKey:", v25);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
    objc_msgSend(v22, "deleteSuggestedEvent:", v12);
    goto LABEL_12;
  }
  if (a3 != 16)
  {
    if (a3 != 8)
    {
LABEL_13:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionInfo"));
      objc_msgSend(v26, "setChangedFields:", 0);

      v27 = v32;
      (*((void (**)(id, void *, _QWORD))v32 + 2))(v32, v12, 0);
      v28 = v15;
      goto LABEL_18;
    }
    -[InboxNotificationsGroupController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
    objc_msgSend(v21, "acceptSuggestedEvent:", v12);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueKey"));
    +[EKSuggestionsServiceLogger logEventConfirmedInboxWithUniqueKey:](EKSuggestionsServiceLogger, "logEventConfirmedInboxWithUniqueKey:", v23);

LABEL_12:
    goto LABEL_13;
  }
  v29 = objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29, "editorForGroupController:", self));

  v33 = v15;
  LOBYTE(v29) = objc_msgSend(v30, "deleteEvent:span:error:", v12, 0, &v33);
  v28 = v33;

  if ((v29 & 1) == 0)
  {
    v31 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error deleting suggested event: %@", buf, 0xCu);
    }
  }

  v27 = v32;
LABEL_18:

}

- (void)_performActionForAttendeeReplyNotification:(id)a3 save:(id)a4
{
  CUIKCalendarModel *model;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(id, void *, uint64_t);

  v11 = (void (**)(id, void *, uint64_t))a4;
  model = self->_model;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventFromEventStore:", v8));

  if (v9)
  {
    objc_msgSend(v9, "dismissAttendeeRepliedNotification");
    if (objc_msgSend(v9, "hasRecurrenceRules"))
      v10 = 4;
    else
      v10 = 0;
    v11[2](v11, v9, v10);
  }

}

- (void)_performActionForInviteReplayNotification:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  model = self->_model;
  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inviteReplyNotificationFromEventStore:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "removeInviteReplyNotification:error:", v7, &v11);
  v9 = v11;

  if ((v6 & 1) == 0)
  {
    v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error removing invite reply: %@", buf, 0xCu);
    }
  }

}

- (void)_performActionForResourceChangeNotification:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  model = self->_model;
  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourceChangeFromEventStore:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "removeResourceChange:error:", v7, &v11);
  v9 = v11;

  if ((v6 & 1) == 0)
  {
    v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error removing resource change: %@", buf, 0xCu);
    }
  }

}

- (void)_performAction:(int64_t)a3 forEventInvitationNotification:(id)a4 avoidUserInteraction:(BOOL)a5 cancelled:(id)a6 cell:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  InboxNotificationsGroupController *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  __CFString *v36;
  NSMutableDictionary *pendingComments;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  void *v53;
  double v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  InboxNotificationsGroupController *v67;
  double v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  NSString *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  InboxNotificationsGroupController *v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[5];
  id v106;
  uint64_t v107;
  _QWORD v108[5];
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint8_t buf[4];
  id v114;
  __int16 v115;
  void *v116;

  v9 = a5;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v114 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Event invitation notification: %{public}@.", buf, 0xCu);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventFromEventStore:", v16));

  if (v17)
  {
    v101 = v14;
    v102 = self;
    v18 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v114 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Event for event invitation notification: %@.", buf, 0xCu);
    }
    v19 = 3;
    v20 = 4;
    if (a3 != 2)
      v20 = 0;
    if (a3 != 4)
      v19 = v20;
    v21 = a3 != 1 && a3 == 4;
    if (a3 == 1)
      v22 = 2;
    else
      v22 = v19;
    v23 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      v100 = v12;
      v24 = v17;
      v25 = v13;
      v26 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22));
      *(_DWORD *)buf = 138543618;
      v114 = v27;
      v115 = 2114;
      v116 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Translated event status button action: [%{public}@] to participant status: [%{public}@].", buf, 0x16u);

      v13 = v25;
      v17 = v24;
      v12 = v100;

    }
    if (v9)
    {
      v29 = v102;
LABEL_37:
      -[InboxNotificationsGroupController _saveStatus:forEventInvitationNotification:commit:](v29, "_saveStatus:forEventInvitationNotification:commit:", v22, v12, 1);
      v14 = v101;
      goto LABEL_38;
    }
    if (v21)
    {
      if (objc_msgSend(v17, "allowsResponseCommentModifications"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
        v31 = objc_msgSend(v30, "promptForCommentWhenDeclining");

        if (v31 == (id)2
          || v31 == (id)1
          && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "calendar")),
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "source")),
              v34 = objc_msgSend(v33, "wantsCommentPromptWhenDeclining"),
              v33,
              v32,
              v34))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "responseComment"));
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:](CUIKNotificationDescriptionGenerator, "stringWithAutoCommentRemoved:", v35));

          if (!v36)
            v36 = &stru_1001B67C0;
          pendingComments = v102->_pendingComments;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](pendingComments, "setObject:forKeyedSubscript:", v36, v38);

          v14 = v101;
          objc_msgSend(v101, "setShowsCommentPrompt:animated:initialValue:", 1, 1, v36);

          goto LABEL_38;
        }
      }
    }
    if (a3 == 1 && objc_msgSend(v17, "hasRecurrenceRules"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selfAttendee"));
      if (objc_msgSend(v39, "participantType") == (id)2)
      {

LABEL_33:
        v95 = v22;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController conflictInfoForNotification:](v102, "conflictInfoForNotification:", v12));
        if (v42)
        {
          *(_QWORD *)&v43 = objc_opt_class(v102).n128_u64[0];
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v44, v43));
          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to accept this recurring event?"), &stru_1001B67C0, 0));

          *(_QWORD *)&v47 = objc_opt_class(v102).n128_u64[0];
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v48, v47));
          v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Accept All"), &stru_1001B67C0, 0));

          *(_QWORD *)&v51 = objc_opt_class(v102).n128_u64[0];
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v52, v51));
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Accept Only Available"), &stru_1001B67C0, 0));

          *(_QWORD *)&v54 = objc_opt_class(v102).n128_u64[0];
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v55, v54));
          v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1001B67C0, 0));

          v58 = objc_msgSend(v42, "totalOccurrencesInSeries");
          v98 = (void *)v46;
          v99 = v13;
          v93 = (void *)v57;
          if (v58 == objc_msgSend(v42, "totalConflictsInSeries"))
          {
            *(_QWORD *)&v59 = objc_opt_class(v102).n128_u64[0];
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v60, v59));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("All %d occurrences of the event “%@” conflict with other events on your calendar. If you accept, all occurrences will overlap with other scheduled events."), &stru_1001B67C0, 0));

            v63 = objc_msgSend(v42, "totalConflictsInSeries");
            v64 = (void *)v50;
            v65 = v17;
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v62, v63, v66));

            v67 = v102;
            *(_QWORD *)&v68 = objc_opt_class(v102).n128_u64[0];
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v69, v68));
            v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("Accept"), &stru_1001B67C0, 0));

            v92 = (void *)v71;
          }
          else
          {
            v92 = (void *)v50;
            v72 = objc_msgSend(v42, "totalConflictsInSeries");
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v74 = v73;
            if (v72 == (id)1)
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("1 of %d occurrences of the event “%@” conflicts with other events on your calendar. If you accept all occurrences, one will overlap with another scheduled event."), &stru_1001B67C0, 0));

              v75 = objc_msgSend(v42, "totalConflictsInSeries");
              v65 = v17;
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
              v76 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v62, v75, v70, v91);
            }
            else
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("%d of %d occurrences of the event “%@” conflict with other events on your calendar. If you accept all occurrences, some will overlap with other scheduled events. "), &stru_1001B67C0, 0));

              v77 = objc_msgSend(v42, "totalConflictsInSeries");
              v78 = objc_msgSend(v42, "totalOccurrencesInSeries");
              v65 = v17;
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
              v76 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v62, v77, v78, v70);
            }
            v96 = (void *)objc_claimAutoreleasedReturnValue(v76);
            v67 = v102;
          }

          v108[0] = _NSConcreteStackBlock;
          v108[1] = 3221225472;
          v108[2] = sub_1000901A8;
          v108[3] = &unk_1001B3B80;
          v108[4] = v67;
          v112 = v95;
          v79 = v12;
          v109 = v79;
          v94 = v42;
          v80 = v42;
          v110 = v80;
          v111 = v65;
          v81 = objc_retainBlock(v108);
          v105[0] = _NSConcreteStackBlock;
          v105[1] = 3221225472;
          v105[2] = sub_100090470;
          v105[3] = &unk_1001B3BA8;
          v105[4] = v67;
          v107 = v95;
          v106 = v79;
          v82 = objc_retainBlock(v105);
          v103[0] = _NSConcreteStackBlock;
          v103[1] = 3221225472;
          v103[2] = sub_100090484;
          v103[3] = &unk_1001B3BD0;
          v104 = v99;
          v83 = objc_retainBlock(v103);
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v98, v96, 1));
          v85 = objc_msgSend(v80, "totalOccurrencesInSeries");
          if (v85 != objc_msgSend(v80, "totalConflictsInSeries"))
          {
            v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v97, 0, v81));
            objc_msgSend(v84, "addAction:", v86);

          }
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v92, 0, v82));
          objc_msgSend(v84, "addAction:", v87);

          v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v93, 1, v83));
          objc_msgSend(v84, "addAction:", v88);

          v89 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](v102, "delegate"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "parentTableViewControllerForGroupController:", v102));
          objc_msgSend(v90, "presentViewController:animated:completion:", v84, 1, 0);

          v13 = v99;
          v42 = v94;
        }

        v14 = v101;
        goto LABEL_38;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selfAttendee"));
      v41 = objc_msgSend(v40, "participantType");

      if (v41 == (id)3)
        goto LABEL_33;
    }
    v29 = v102;
    goto LABEL_37;
  }
LABEL_38:

}

- (void)_performActionForAllNotifications:(int64_t)a3 save:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  objc_class *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  objc_class *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  id v29;
  uint64_t v30;
  void **p_vtable;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  double v35;
  objc_class *v36;
  objc_class *v37;
  objc_class *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned int v42;
  id v43;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  uint64_t v48;
  __objc2_class_ro **p_info;
  void *v50;
  void *v51;
  objc_class *v52;
  double v53;
  objc_class *v54;
  objc_class *v55;
  double v56;
  objc_class *v57;
  objc_class *v58;
  double v59;
  objc_class *v60;
  objc_class *v61;
  double v62;
  objc_class *v63;
  objc_class *v64;
  objc_class *v65;
  id v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  unsigned int v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  id v80;
  id obj;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];

  v80 = a4;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSArray CalMap:](self->_allNotificationReferences, "CalMap:", &stru_1001B3C10));
  if (a3 <= 15)
  {
    if ((unint64_t)(a3 - 1) < 2 || a3 == 4)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v96 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
            v11 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v10);
            objc_opt_class(CalendarMessageEventInvitationCell);
            if (v11 == v12)
            {
              v13 = v10;
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarMessageEventInvitationCell actionsForNotification:](CalendarMessageEventInvitationCell, "actionsForNotification:", v13));
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
              v16 = objc_msgSend(v14, "containsObject:", v15);

              if (v16)
                -[InboxNotificationsGroupController _performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:](self, "_performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:", a3, v13, 1, 0, 0);

            }
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
        }
        while (v7);
      }
      goto LABEL_71;
    }
    goto LABEL_69;
  }
  if (a3 == 16)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
    if (!v28)
      goto LABEL_71;
    v29 = v28;
    v30 = *(_QWORD *)v84;
    p_vtable = CarplayPaddingTableViewCell.vtable;
LABEL_33:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v84 != v30)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v32);
      v34 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v33);
      *(_QWORD *)&v35 = objc_opt_class(p_vtable + 157).n128_u64[0];
      if (v34 == v36)
        break;
      v37 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v33, v35);
      objc_opt_class(CalendarMessageEventInvitationCell);
      if (v37 == v38)
      {
        v39 = v33;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarMessageEventInvitationCell actionsForNotification:](CalendarMessageEventInvitationCell, "actionsForNotification:", v39));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 16));
        v42 = objc_msgSend(v40, "containsObject:", v41);

        if (v42)
          -[InboxNotificationsGroupController _performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:](self, "_performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:", 16, v39, 1, 0, 0);
LABEL_42:
        p_vtable = (void **)(CarplayPaddingTableViewCell + 24);

      }
      if (v29 == (id)++v32)
      {
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
        if (!v29)
          goto LABEL_71;
        goto LABEL_33;
      }
    }
    v43 = v33;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable + 157, "actionsForNotification:", v43));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 16));
    v45 = objc_msgSend(v40, "containsObject:", v44);

    if (v45)
      -[InboxNotificationsGroupController _performAction:forSuggestionNotification:save:](self, "_performAction:forSuggestionNotification:save:", 16, v43, v80);
    goto LABEL_42;
  }
  if (a3 == 32)
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    if (!v46)
      goto LABEL_71;
    v47 = v46;
    v48 = *(_QWORD *)v92;
    p_info = &OBJC_METACLASS___TimerOperation.info;
    while (1)
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v92 != v48)
          objc_enumerationMutation(obj);
        v51 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v50);
        v52 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v51);
        *(_QWORD *)&v53 = objc_opt_class(CalendarMessageEventInvitationCell).n128_u64[0];
        if (v52 == v54)
        {
          v66 = v51;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarMessageEventInvitationCell actionsForNotification:](CalendarMessageEventInvitationCell, "actionsForNotification:", v66));
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 32));
          v71 = objc_msgSend(v67, "containsObject:", v70);

          if (v71)
            -[InboxNotificationsGroupController _performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:](self, "_performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:", 32, v66, 1, 0, 0);
          goto LABEL_62;
        }
        v55 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v51, v53);
        *(_QWORD *)&v56 = objc_opt_class(p_info + 501).n128_u64[0];
        if (v55 == v57)
        {
          v66 = v51;
          v72 = p_info + 501;
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "actionsForNotification:proposedTimeAttendee:eventStore:", v66, 0, v73));

          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 32));
          v75 = objc_msgSend(v67, "containsObject:", v74);

          if (v75)
            -[InboxNotificationsGroupController _performActionForAttendeeReplyNotification:save:](self, "_performActionForAttendeeReplyNotification:save:", v66, v80);
LABEL_62:

          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___TimerOperation + 32);
          goto LABEL_63;
        }
        v58 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v51, v56);
        *(_QWORD *)&v59 = objc_opt_class(CalendarMessageInviteReplyCell).n128_u64[0];
        if (v58 == v60)
        {
          -[InboxNotificationsGroupController _performActionForInviteReplayNotification:](self, "_performActionForInviteReplayNotification:", v51, v59);
        }
        else
        {
          v61 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v51, v59);
          *(_QWORD *)&v62 = objc_opt_class(CalendarMessageResourceChangeCell).n128_u64[0];
          if (v61 != v63)
          {
            v64 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v51, v62);
            objc_opt_class(CalendarMessageSuggestionCell);
            if (v64 != v65)
              goto LABEL_63;
            v66 = v51;
            v67 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarMessageSuggestionCell actionsForNotification:](CalendarMessageSuggestionCell, "actionsForNotification:", v66));
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 32));
            v69 = objc_msgSend(v67, "containsObject:", v68);

            if (v69)
              -[InboxNotificationsGroupController _performAction:forSuggestionNotification:save:](self, "_performAction:forSuggestionNotification:save:", 32, v66, v80);
            goto LABEL_62;
          }
          -[InboxNotificationsGroupController _performActionForResourceChangeNotification:](self, "_performActionForResourceChangeNotification:", v51, v62);
        }
LABEL_63:
        v50 = (char *)v50 + 1;
      }
      while (v47 != v50);
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
      v47 = v76;
      if (!v76)
        goto LABEL_71;
    }
  }
  if (a3 != 128)
  {
LABEL_69:
    v77 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      v78 = v77;
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412290;
      v100 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Asked to perform action [%@] for all notifications, but this action is not intended to apply to multiple notifications", buf, 0xCu);

    }
    goto LABEL_71;
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v88 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)j);
        v22 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21);
        objc_opt_class(CalendarMessageSuggestionCell);
        if (v22 == v23)
        {
          v24 = v21;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarMessageSuggestionCell actionsForNotification:](CalendarMessageSuggestionCell, "actionsForNotification:", v24));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 128));
          v27 = objc_msgSend(v25, "containsObject:", v26);

          if (v27)
            -[InboxNotificationsGroupController _performAction:forSuggestionNotification:save:](self, "_performAction:forSuggestionNotification:save:", 128, v24, v80);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    }
    while (v18);
  }
LABEL_71:

}

- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  _BOOL8 v7;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  double v23;
  objc_class *v24;
  objc_class *v25;
  double v26;
  objc_class *v27;
  objc_class *v28;
  double v29;
  objc_class *v30;
  objc_class *v31;
  double v32;
  objc_class *v33;
  objc_class *v34;
  double v35;
  objc_class *v36;
  objc_class *v37;
  double v38;
  objc_class *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *k;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  EKUIRecurrenceAlertController *v71;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSMutableArray *v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *j;
  void *v86;
  uint64_t v87;
  id v88;
  double v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  void *i;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  unsigned int v111;
  void *v112;
  void *v113;
  void *v114;
  _BOOL4 v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  NSObject *v126;
  _QWORD *v127;
  id v128;
  id v129;
  _QWORD *v130;
  id v131;
  id v132;
  _QWORD v133[5];
  id v134;
  _QWORD v135[4];
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  id v146;
  _QWORD *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[4];
  id v153;
  id v154;
  _QWORD *v155;
  _QWORD v156[5];
  _QWORD v157[4];
  id v158;
  _BYTE v159[128];
  _BYTE v160[128];
  uint8_t v161[128];
  uint8_t buf[4];
  id v163;
  __int16 v164;
  id v165;
  __int16 v166;
  void *v167;

  v7 = a5;
  v131 = a4;
  v129 = a6;
  v10 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    *(_DWORD *)buf = 138543874;
    v163 = v12;
    v164 = 2114;
    v165 = v131;
    v166 = 2114;
    v167 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Perform action [%{public}@] for cell: %{public}@, appliesToAll: %{public}@.", buf, 0x20u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorForGroupController:", self));

  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472;
  v157[2] = sub_100091BDC;
  v157[3] = &unk_1001B3C38;
  v128 = v15;
  v158 = v128;
  v130 = objc_retainBlock(v157);
  if (v7)
  {
    -[InboxNotificationsGroupController _performActionForAllNotifications:save:](self, "_performActionForAllNotifications:save:", a3, v130);
    goto LABEL_76;
  }
  if ((a3 & 0x700) == 0)
  {
    v156[0] = _NSConcreteStackBlock;
    v156[1] = 3221225472;
    v156[2] = sub_100091CA8;
    v156[3] = &unk_1001B3C88;
    v156[4] = self;
    v127 = objc_retainBlock(v156);
    if ((a3 & 0x10000) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "notification"));
      v41 = objc_msgSend(v40, "type") == (id)8;

      v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "notification"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      if (v41)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "calendarFromEventStore:", v42));

        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "parentTableViewControllerForGroupController:", self));
          v152[0] = _NSConcreteStackBlock;
          v152[1] = 3221225472;
          v152[2] = sub_100091E28;
          v152[3] = &unk_1001B3CB0;
          v153 = v43;
          v155 = v127;
          v154 = v132;
          PresentJunkAlertControllerWithHandler(v45, 0, v152);

        }
        else
        {
          v79 = kCalUILogInboxHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v163 = v132;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: could not get a calendar for shared calendar notification: %@", buf, 0xCu);
          }
        }

        goto LABEL_74;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "eventFromEventStore:", v42));

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "parentTableViewControllerForGroupController:", self));
      PresentJunkAlertControllerForEvent(v21, v74);

      goto LABEL_41;
    }
    if ((a3 & 0x1000) == 0)
    {
      if ((a3 & 0x2000) != 0)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "notification"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
        v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "eventFromEventStore:", v76));

        objc_opt_class(CalendarMessageAttendeeReplyCell);
        if ((objc_opt_isKindOfClass(v131, v77) & 1) != 0)
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "proposedTimeAttendee"));
        else
          v78 = 0;
        v143 = 0u;
        v144 = 0u;
        v141 = 0u;
        v142 = 0u;
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "attendees"));
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
        if (v103)
        {
          v104 = *(_QWORD *)v142;
          do
          {
            for (i = 0; i != v103; i = (char *)i + 1)
            {
              if (*(_QWORD *)v142 != v104)
                objc_enumerationMutation(v102);
              v106 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)i);
              objc_opt_class(EKAttendee);
              if ((objc_opt_isKindOfClass(v106, v107) & 1) != 0)
              {
                v108 = v106;
                v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "URL"));
                v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "URL"));
                v111 = objc_msgSend(v109, "isEqual:", v110);

                if (v111)
                {
                  objc_msgSend(v108, "setCommentChanged:", 0);
                  objc_msgSend(v108, "setStatusChanged:", 0);
                  objc_msgSend(v108, "setProposedStartDateChanged:", 0);
                  objc_msgSend(v108, "setProposedStartDateStatus:", 3);
                }

              }
            }
            v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
          }
          while (v103);
        }

        ((void (*)(_QWORD *, id, _QWORD))v130[2])(v130, v132, 0);
        goto LABEL_74;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "notification"));
      if ((a3 & 0x4000) != 0)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
        v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventFromEventStore:", v80));

        v81 = objc_opt_new(NSMutableArray);
        v140 = 0u;
        v138 = 0u;
        v139 = 0u;
        v137 = 0u;
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "attendees"));
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
        if (v83)
        {
          v84 = *(_QWORD *)v138;
          do
          {
            for (j = 0; j != v83; j = (char *)j + 1)
            {
              if (*(_QWORD *)v138 != v84)
                objc_enumerationMutation(v82);
              v86 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)j);
              objc_opt_class(EKAttendee);
              if ((objc_opt_isKindOfClass(v86, v87) & 1) != 0)
              {
                v88 = v86;
                if (objc_msgSend(v88, "proposedStartDateChanged"))
                  -[NSMutableArray addObject:](v81, "addObject:", v88);

              }
            }
            v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
          }
          while (v83);
        }

        *(_QWORD *)&v89 = objc_opt_class(self).n128_u64[0];
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v90, v89));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("RE:"), &stru_1001B67C0, 0));

        v93 = objc_msgSend(objc_alloc((Class)EKUIEmailCompositionManager), "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v132, v81, v92, 0);
        -[InboxNotificationsGroupController setMessageSendingManager:](self, "setMessageSendingManager:", v93);

        v94 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController messageSendingManager](self, "messageSendingManager"));
        objc_initWeak((id *)buf, v94);

        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_100091EA8;
        v135[3] = &unk_1001B3D00;
        objc_copyWeak(&v136, (id *)buf);
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController messageSendingManager](self, "messageSendingManager"));
        objc_msgSend(v95, "setMessageSendingComplete:", v135);

        v96 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController messageSendingManager](self, "messageSendingManager"));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "viewController"));
        objc_msgSend(v97, "setModalPresentationStyle:", 2);

        v98 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "parentTableViewControllerForGroupController:", self));
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController messageSendingManager](self, "messageSendingManager"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "viewController"));
        objc_msgSend(v99, "presentViewController:animated:completion:", v101, 1, 0);

        objc_destroyWeak(&v136);
        objc_destroyWeak((id *)buf);

        goto LABEL_74;
      }
      v22 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21);
      *(_QWORD *)&v23 = objc_opt_class(CalendarMessageEventInvitationCell).n128_u64[0];
      if (v22 == v24)
      {
        -[InboxNotificationsGroupController _performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:](self, "_performAction:forEventInvitationNotification:avoidUserInteraction:cancelled:cell:", a3, v21, 0, v129, v131, v23);
      }
      else
      {
        v25 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21, v23);
        *(_QWORD *)&v26 = objc_opt_class(CalendarMessageAttendeeReplyCell).n128_u64[0];
        if (v25 != v27)
        {
          v28 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21, v26);
          *(_QWORD *)&v29 = objc_opt_class(CalendarMessageSharedCalendarCell).n128_u64[0];
          if (v28 != v30)
          {
            v31 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21, v29);
            *(_QWORD *)&v32 = objc_opt_class(CalendarMessageInviteReplyCell).n128_u64[0];
            if (v31 == v33)
            {
              -[InboxNotificationsGroupController _performActionForInviteReplayNotification:](self, "_performActionForInviteReplayNotification:", v21, v32);
            }
            else
            {
              v34 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21, v32);
              *(_QWORD *)&v35 = objc_opt_class(CalendarMessageResourceChangeCell).n128_u64[0];
              if (v34 == v36)
              {
                -[InboxNotificationsGroupController _performActionForResourceChangeNotification:](self, "_performActionForResourceChangeNotification:", v21, v35);
              }
              else
              {
                v37 = +[CalendarMessageCell cellClassForNotification:](CalendarMessageCell, "cellClassForNotification:", v21, v35);
                *(_QWORD *)&v38 = objc_opt_class(CalendarMessageSuggestionCell).n128_u64[0];
                if (v37 == v39)
                  -[InboxNotificationsGroupController _performAction:forSuggestionNotification:save:](self, "_performAction:forSuggestionNotification:save:", a3, v21, v130, v38);
              }
            }
            goto LABEL_41;
          }
          v132 = v21;
          v112 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "calendarFromEventStore:", v112));

          if (v113)
          {
            if (a3 == 0x20000 || a3 == 64)
            {
              objc_msgSend(v113, "setInvitationStatus:", 0);
              v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "calendarIdentifier"));
              if (v114)
              {
                v115 = a3 == 64;
                v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "URL"));
                ((void (*)(_QWORD *, id))v127[2])(v127, v132);
                v117 = (void *)objc_claimAutoreleasedReturnValue(+[DADConnection sharedConnection](DADConnection, "sharedConnection"));
                if (v115)
                  v118 = 1;
                else
                  v118 = 2;
                v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "source"));
                v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "externalID"));
                v133[0] = _NSConcreteStackBlock;
                v133[1] = 3221225472;
                v133[2] = sub_100091F08;
                v133[3] = &unk_1001B3D28;
                v133[4] = self;
                v121 = v116;
                v134 = v121;
                objc_msgSend(v117, "respondToSharedCalendarInvite:forCalendarWithID:accountID:queue:completionBlock:", v118, v114, v120, &_dispatch_main_q, v133);

                if (v115)
                {
                  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "sharedOwnerName"));
                  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "sharedOwnerEmail"));
                  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "sharedOwnerPhoneNumber"));
                  +[EKRecents recordRecentForContactWithName:emailAddress:phoneNumber:](EKRecents, "recordRecentForContactWithName:emailAddress:phoneNumber:", v122, v123, v124);

                }
              }
              else
              {
                v126 = kCalUILogInboxHandle;
                if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v163 = v113;
                  _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: calendar %@ had no calendar identifier", buf, 0xCu);
                }
              }

            }
          }
          else
          {
            v125 = kCalUILogInboxHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v163 = v132;
              _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: could not get a calendar for shared calendar notification: %@", buf, 0xCu);
            }
          }

LABEL_74:
          goto LABEL_75;
        }
        -[InboxNotificationsGroupController _performActionForAttendeeReplyNotification:save:](self, "_performActionForAttendeeReplyNotification:save:", v21, v130, v26);
      }
LABEL_41:

LABEL_75:
      goto LABEL_76;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "notification"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
    v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "eventFromEventStore:", v47));

    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "attendees"));
    v49 = 0;
    v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v149;
      do
      {
        for (k = 0; k != v50; k = (char *)k + 1)
        {
          if (*(_QWORD *)v149 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)k);
          objc_opt_class(EKAttendee);
          if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
          {
            v55 = v53;
            objc_msgSend(v55, "setCommentChanged:", 0);
            objc_msgSend(v55, "setStatusChanged:", 0);
            if (objc_msgSend(v55, "proposedStartDateChanged"))
            {
              v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "proposedStartDateForEvent:", v132));

              objc_msgSend(v55, "setProposedStartDateChanged:", 0);
              v49 = (void *)v56;
            }

          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
      }
      while (v50);

      if (!v49)
        goto LABEL_38;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "endDate"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "startDate"));
      objc_msgSend(v57, "timeIntervalSinceDate:", v58);
      v60 = v59;

      objc_msgSend(v132, "setStartDate:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "dateByAddingTimeInterval:", v60));
      objc_msgSend(v132, "setEndDate:", v48);
    }

LABEL_38:
    objc_msgSend(v132, "dismissAcceptedProposeNewTimeNotification");
    if (objc_msgSend(v132, "hasRecurrenceRules"))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "parentTableViewControllerForGroupController:", self));
      objc_msgSend(v131, "bounds");
      v64 = v63;
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = sub_100091E58;
      v145[3] = &unk_1001B3CD8;
      v145[4] = self;
      v147 = v130;
      v146 = v132;
      v71 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue(+[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v62, v131, v146, v145, v64, v66, v68, v70));
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v71;

    }
    else
    {
      ((void (*)(_QWORD *, id, _QWORD))v130[2])(v130, v132, 0);
    }

    goto LABEL_74;
  }
  v16 = a3 == 1024;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController tableView](self, "tableView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "indexPathForCell:", v131));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController eventForRow:](self, "eventForRow:", objc_msgSend(v19, "row")));
  if (v16)
    objc_msgSend(v17, "inboxTableViewGroupController:inspectEvent:", self, v20);
  else
    objc_msgSend(v17, "inboxTableViewGroupController:viewCommentsForEvent:", self, v20);

LABEL_76:
}

- (id)eventStoreForCell:(id)a3
{
  return -[CUIKCalendarModel eventStore](self->_model, "eventStore", a3);
}

- (void)messageCell:(id)a3 committedComment:(id)a4
{
  NSMutableDictionary *pendingComments;
  id v6;
  void *v7;
  id v8;

  pendingComments = self->_pendingComments;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingComments, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)attemptDisplayReviewPrompt
{
  InboxTableViewGroupControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "attemptDisplayReviewPrompt");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (id)noContentStringForInboxTableView:(id)a3
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No Invitations"), &stru_1001B67C0, 0));

  return v6;
}

- (void)_localeChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  InboxNotificationsGroupController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092214;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_notificationsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;

  v4 = a3;
  v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Received notifications changed notification: %{public}@.", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009234C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)tableView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InboxNotificationsGroupController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentTableViewControllerForGroupController:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));

  return v5;
}

- (id)filteredNotificationsFromArray:(id)a3
{
  return a3;
}

- (id)_eventForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CUIKCalendarModel *model;
  id v16;

  v4 = objc_msgSend(a3, "row");
  if ((uint64_t)v4 < (uint64_t)-[NSMutableArray count](self->_notificationReferences, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_notificationReferences, "objectAtIndex:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notification"));

    objc_opt_class(EKCalendarEventInvitationNotification);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventForObjectID:occurrenceDate:checkValid:", v11, v12, 0));

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_eventWithURI:checkValid:", v11, 1));
      }

    }
    else
    {
      objc_opt_class(EKCalendarResourceChangeNotification);
      if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0)
      {
        v13 = 0;
LABEL_12:

        return v13;
      }
      model = self->_model;
      v16 = v6;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](model, "eventStore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventID"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventWithIdentifier:", v10));
    }

    goto LABEL_12;
  }
  v13 = 0;
  return v13;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (InboxTableViewGroupControllerDelegate)delegate
{
  return (InboxTableViewGroupControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_namesQueue, 0);
  objc_storeStrong((id *)&self->_prefetchNamesQueue, 0);
  objc_storeStrong((id *)&self->_conflictsScanningQueue, 0);
  objc_storeStrong((id *)&self->_conflictsQueue, 0);
  objc_storeStrong((id *)&self->_prefetchConflictsQueue, 0);
  objc_storeStrong((id *)&self->_organizerNames, 0);
  objc_storeStrong((id *)&self->_conflictInfo, 0);
  objc_storeStrong((id *)&self->_pendingComments, 0);
  objc_storeStrong((id *)&self->_sharedCalendarInvitationsReplyPending, 0);
  objc_storeStrong((id *)&self->_notificationReferences, 0);
  objc_storeStrong((id *)&self->_allNotificationReferences, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
