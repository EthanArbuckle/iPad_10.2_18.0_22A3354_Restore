@implementation DMDEventSubscriptionRegistrationController

- (DMDEventSubscriptionRegistrationController)initWithSubscriptionRegistration:(id)a3 streamEventsHandler:(id)a4
{
  id v6;
  id v7;
  DMDEventSubscriptionRegistrationController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *organizationIdentifier;
  uint64_t v13;
  NSString *payloadIdentifier;
  uint64_t v15;
  NSString *identifier;
  id v17;
  id streamEventsHandler;
  NSMutableDictionary *v19;
  NSMutableDictionary *eventStreamByEventType;
  NSDate *v21;
  NSDate *lastDateScheduleElapsed;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DMDEventSubscriptionRegistrationController;
  v8 = -[DMDEventSubscriptionRegistrationController init](&v24, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payloadMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "organization"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    organizationIdentifier = v8->_organizationIdentifier;
    v8->_organizationIdentifier = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    payloadIdentifier = v8->_payloadIdentifier;
    v8->_payloadIdentifier = (NSString *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v15;

    v17 = objc_retainBlock(v7);
    streamEventsHandler = v8->_streamEventsHandler;
    v8->_streamEventsHandler = v17;

    v19 = objc_opt_new(NSMutableDictionary);
    eventStreamByEventType = v8->_eventStreamByEventType;
    v8->_eventStreamByEventType = v19;

    v21 = objc_opt_new(NSDate);
    lastDateScheduleElapsed = v8->_lastDateScheduleElapsed;
    v8->_lastDateScheduleElapsed = v21;

    -[DMDEventSubscriptionRegistrationController updateWithSubscriptionRegistration:](v8, "updateWithSubscriptionRegistration:", v6);
  }

  return v8;
}

- (void)updateWithSubscriptionRegistration:(id)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  DMDEventReportingSchedule *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEventSubscriptionRegistrationController.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscriptionRegistration"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEventSubscriptionRegistrationController.m"), 51, CFSTR("Cannot update subscription controller with a subscription registration with a different identifier"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "events"));
  -[DMDEventSubscriptionRegistrationController _updateEventStreams:](self, "_updateEventStreams:", v8);

  v9 = -[DMDEventReportingSchedule initWithScheduleRegistration:]([DMDEventReportingSchedule alloc], "initWithScheduleRegistration:", v12);
  -[DMDEventSubscriptionRegistrationController setSchedule:](self, "setSchedule:", v9);

}

- (void)_updateEventStreams:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  DMDTestEventStream *v18;
  NSObject *p_super;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController eventStreamByEventType](self, "eventStreamByEventType"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138543362;
    v21 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "payloadType", v21, (_QWORD)v22));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14));
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "updateEvent:", v12);
          goto LABEL_14;
        }
        v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.event.management.test"));
        if ((v17 & 1) != 0)
        {
          v18 = objc_opt_new(DMDTestEventStream);
          if (!v18)
            goto LABEL_14;
          p_super = &v18->super;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v14);
        }
        else
        {
          v20 = DMFConfigurationEngineLog(v17);
          p_super = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v27 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Unknown event stream type %{public}@, skipping", buf, 0xCu);
          }
        }

LABEL_14:
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

}

- (void)setSchedule:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD v10[5];

  v5 = a3;
  if (!-[DMDEventReportingSchedule isEqual:](self->_schedule, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_schedule, a3);
    if (objc_msgSend(v5, "frequency"))
    {
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100043F44;
      v7[3] = &unk_1000BA7C8;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v5, "startWithScheduleElapsedHandler:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController eventStreamByEventType](self, "eventStreamByEventType"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100043EF4;
      v10[3] = &unk_1000BB088;
      v10[4] = self;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
  }

}

- (id)eventStatusesSinceStartDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  _QWORD v12[4];
  id v13;
  NSMutableArray *v14;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController eventStreamByEventType](self, "eventStreamByEventType"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000440AC;
  v12[3] = &unk_1000BB0B0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (DMDEventReportingSchedule)schedule
{
  return self->_schedule;
}

- (NSMutableDictionary)eventStreamByEventType
{
  return self->_eventStreamByEventType;
}

- (void)setEventStreamByEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventStreamByEventType, a3);
}

- (id)streamEventsHandler
{
  return self->_streamEventsHandler;
}

- (NSDate)lastDateScheduleElapsed
{
  return self->_lastDateScheduleElapsed;
}

- (void)setLastDateScheduleElapsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastDateScheduleElapsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDateScheduleElapsed, 0);
  objc_storeStrong(&self->_streamEventsHandler, 0);
  objc_storeStrong((id *)&self->_eventStreamByEventType, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
