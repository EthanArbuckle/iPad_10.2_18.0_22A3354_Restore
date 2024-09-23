@implementation STUBrowseForCourseInvitationsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUBrowseForCourseInvitationsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKBrowseForCourseInvitationsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3EC0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUBrowseForCourseInvitationsOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUBrowseForCourseInvitationsOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  uint64_t v3;
  id v4;

  if (-[STUBrowseForCourseInvitationsOperation isExecuting](self, "isExecuting"))
  {
    -[STUBrowseForCourseInvitationsOperation stopForwardingNotifications](self, "stopForwardingNotifications");
    -[STUBrowseForCourseInvitationsOperation stopObserving](self, "stopObserving");
    -[STUBrowseForCourseInvitationsOperation stopBrowsing](self, "stopBrowsing");
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    -[STUBrowseForCourseInvitationsOperation endOperationWithError:](self, "endOperationWithError:", v4);

  }
}

- (void)runWithRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  STUBrowseForCourseInvitationsOperation *v11;
  __int16 v12;
  __CFString *v13;

  v4 = a3;
  v5 = sub_10006627C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v4, "ignoresDeviceIdleState");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    v9 = v8;
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: ignoresDeviceIdleState: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[STUBrowseForCourseInvitationsOperation startForwardingNotifications](self, "startForwardingNotifications");
  -[STUBrowseForCourseInvitationsOperation postNotificationForInitialInvitations](self, "postNotificationForInitialInvitations");
  -[STUBrowseForCourseInvitationsOperation startObserving](self, "startObserving");

}

- (BOOL)ignoresDeviceIdleState
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUBrowseForCourseInvitationsOperation request](self, "request"));
  v3 = objc_opt_class(CRKBrowseForCourseInvitationsRequest);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "ignoresDeviceIdleState");
  return v6;
}

- (void)startObserving
{
  void *v3;
  void *v4;

  if (!-[STUBrowseForCourseInvitationsOperation isObserving](self, "isObserving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idleStateProvider"));
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("idle"), 0, CFSTR("STUBrowseForCourseInvitationsOperationObservationContext"));

    -[STUBrowseForCourseInvitationsOperation setObserving:](self, "setObserving:", 1);
    -[STUBrowseForCourseInvitationsOperation startOrStopBrowsing](self, "startOrStopBrowsing");
  }
}

- (void)stopObserving
{
  void *v3;
  void *v4;

  if (-[STUBrowseForCourseInvitationsOperation isObserving](self, "isObserving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idleStateProvider"));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("idle"), CFSTR("STUBrowseForCourseInvitationsOperationObservationContext"));

    -[STUBrowseForCourseInvitationsOperation setObserving:](self, "setObserving:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  objc_super v14;
  uint8_t buf[4];
  STUBrowseForCourseInvitationsOperation *v16;
  __int16 v17;
  __CFString *v18;

  if (a6 == CFSTR("STUBrowseForCourseInvitationsOperationObservationContext"))
  {
    v7 = sub_10006627C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idleStateProvider"));
      v11 = objc_msgSend(v10, "isIdle");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v13 = v12;
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: isIdle: %{public}@", buf, 0x16u);

    }
    -[STUBrowseForCourseInvitationsOperation startOrStopBrowsing](self, "startOrStopBrowsing");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STUBrowseForCourseInvitationsOperation;
    -[STUBrowseForCourseInvitationsOperation observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)startOrStopBrowsing
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (-[STUBrowseForCourseInvitationsOperation ignoresDeviceIdleState](self, "ignoresDeviceIdleState")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idleStateProvider")),
        v5 = objc_msgSend(v4, "isIdle"),
        v4,
        v3,
        !v5))
  {
    -[STUBrowseForCourseInvitationsOperation startBrowsing](self, "startBrowsing");
  }
  else
  {
    -[STUBrowseForCourseInvitationsOperation stopBrowsing](self, "stopBrowsing");
  }
}

- (void)startBrowsing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  STUBrowseForCourseInvitationsOperation *v8;

  if (!-[STUBrowseForCourseInvitationsOperation isBrowsing](self, "isBrowsing"))
  {
    v3 = sub_10006627C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Start browsing for course invitations", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemon"));
    objc_msgSend(v6, "startBrowsingForCourseInvitations");

    -[STUBrowseForCourseInvitationsOperation setBrowsing:](self, "setBrowsing:", 1);
  }
}

- (void)stopBrowsing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  STUBrowseForCourseInvitationsOperation *v8;

  if (-[STUBrowseForCourseInvitationsOperation isBrowsing](self, "isBrowsing"))
  {
    v3 = sub_10006627C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Student stopped browsing for course invitations", (uint8_t *)&v7, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemon"));
    objc_msgSend(v6, "stopBrowsingForCourseInvitations");

    -[STUBrowseForCourseInvitationsOperation setBrowsing:](self, "setBrowsing:", 0);
  }
}

- (void)startForwardingNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "forwardNotification:", CRKCourseInvitationsUpdatedNotificationName, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "forwardNotification:", CRKCourseInvitationDidSucceedNotificationName, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "forwardNotification:", CRKCourseInvitationDidFailNotificationName, 0);

}

- (void)stopForwardingNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CRKCourseInvitationsUpdatedNotificationName, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CRKCourseInvitationDidSucceedNotificationName, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CRKCourseInvitationDidFailNotificationName, 0);

}

- (void)forwardNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[STUBrowseForCourseInvitationsOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", v6, v5);
}

- (void)postNotificationForInitialInvitations
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "daemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseInvitations"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000669D4;
  v6[3] = &unk_1000CBAC0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

@end
