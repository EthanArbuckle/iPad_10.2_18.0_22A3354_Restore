@implementation APLogSysEventRequester

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBLogSysEventResponse, a2);
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (id)protoBuffer
{
  APPBLogSysEventRequest *v3;
  void *v4;
  APPBClickLocation *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;

  v3 = objc_alloc_init(APPBLogSysEventRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](self, "logMetadata"));
  -[APPBLogSysEventRequest setMetaData:](v3, "setMetaData:", v4);

  -[APPBLogSysEventRequest setEventType:](v3, "setEventType:", -[APLogSysEventRequester eventType](self, "eventType"));
  v5 = objc_alloc_init(APPBClickLocation);
  -[APPBLogSysEventRequest setClickLocation:](v3, "setClickLocation:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transientContent"));
  objc_msgSend(v7, "clickLocation");
  v9 = (int)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogSysEventRequest clickLocation](v3, "clickLocation"));
  objc_msgSend(v10, "setX:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](self, "internalContent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transientContent"));
  objc_msgSend(v12, "clickLocation");
  v14 = (int)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogSysEventRequest clickLocation](v3, "clickLocation"));
  objc_msgSend(v15, "setY:", v14);

  return v3;
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;

  v8 = a4;
  v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v10 = objc_alloc((Class)NSUserDefaults);
    v11 = objc_msgSend(v10, "initWithSuiteName:", APDefaultsBundleID);
    if (objc_msgSend(v11, "BOOLForKey:", CFSTR("disableDelayForRequests")))
    {
      v12 = APLogForCategory(21);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[APLogSysEventRequester makeDelayedRequest:requestSentHandler:responseCallback:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}s Overriding delay to 0 seconds", buf, 0xCu);
      }

      a3 = 0.0;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)APLogSysEventRequester;
  -[APServerRequester makeDelayedRequest:requestSentHandler:responseCallback:](&v14, "makeDelayedRequest:requestSentHandler:responseCallback:", v8, v9, a3);

}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

@end
