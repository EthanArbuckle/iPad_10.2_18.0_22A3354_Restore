@implementation NFRemoteAdminRedirectState

- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5
{
  return -[NFRemoteAdminRedirectState initWithDictionary:sourceURL:originator:initialStep:](self, "initWithDictionary:sourceURL:originator:initialStep:", a3, a4, a5, 0);
}

- (id)_extractAidsFromStringArray:(id)a3
{
  id v4;
  NSMutableArray *v5;
  unint64_t v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v4, "count"))
    {
      v6 = 0;
      v7 = &APSEnvironmentProduction_ptr;
      do
      {
        v8 = v7[44];
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v6));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_dataWithHexString:", v9));

        if (v10)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v10);
        }
        else
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v13 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v6));
            v19 = 45;
            if (isMetaClass)
              v19 = 43;
            v13(3, "%c[%{public}s %{public}s]:%i Invalid aid: %{public}@", v19, ClassName, Name, 95, v18);

            v7 = &APSEnvironmentProduction_ptr;
          }
          v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v21 = NFSharedLogGetLogger(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = object_getClass(self);
            if (class_isMetaClass(v23))
              v24 = 43;
            else
              v24 = 45;
            v25 = object_getClassName(self);
            v26 = sel_getName(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v6));
            *(_DWORD *)buf = 67110146;
            v31 = v24;
            v32 = 2082;
            v33 = v25;
            v7 = &APSEnvironmentProduction_ptr;
            v34 = 2082;
            v35 = v26;
            v36 = 1024;
            v37 = 95;
            v38 = 2114;
            v39 = v27;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid aid: %{public}@", buf, 0x2Cu);

          }
        }

        ++v6;
      }
      while ((unint64_t)objc_msgSend(v4, "count") > v6);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5 initialStep:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NFRemoteAdminRedirectState *v14;
  uint64_t v15;
  NSString *batchId;
  uint64_t v17;
  NSString *taskId;
  uint64_t v19;
  NSString *seid;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *whitelistedInstances;
  uint64_t v25;
  NSString *redirectUrl;
  uint64_t v27;
  NSDictionary *forwardDataToSP;
  uint64_t v29;
  NSNumber *version;
  NFRemoteAdminRedirectStatePerformanceMetrics *v31;
  NFRemoteAdminRedirectStatePerformanceMetrics *performanceMetrics;
  objc_super v34;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v34.receiver = self;
  v34.super_class = (Class)NFRemoteAdminRedirectState;
  v14 = -[NFRemoteAdminState initWithIdentifier:sourceURL:retryDate:](&v34, "initWithIdentifier:sourceURL:retryDate:", v11, v12, v13);

  if (v14)
  {
    v14->_step = a6;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_stringForKey:", CFSTR("kBatchId")));
    batchId = v14->_batchId;
    v14->_batchId = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_stringForKey:", CFSTR("kTaskId")));
    taskId = v14->_taskId;
    v14->_taskId = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_stringForKey:", CFSTR("targetSEID")));
    seid = v14->_seid;
    v14->_seid = (NSString *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_dictionaryForKey:", CFSTR("redirectRequest")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "NF_arrayForKey:", CFSTR("whitelistedInstances")));
    if (!v22)
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_arrayForKey:", CFSTR("whitelistedInstances")));
    v23 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState _extractAidsFromStringArray:](v14, "_extractAidsFromStringArray:", v22));
    whitelistedInstances = v14->_whitelistedInstances;
    v14->_whitelistedInstances = (NSArray *)v23;

    if (v21)
    {
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "NF_stringForKey:", CFSTR("targetURL")));
      redirectUrl = v14->_redirectUrl;
      v14->_redirectUrl = (NSString *)v25;

      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "NF_dictionaryForKey:", CFSTR("forwardData")));
      forwardDataToSP = v14->_forwardDataToSP;
      v14->_forwardDataToSP = (NSDictionary *)v27;

      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "NF_numberForKey:", CFSTR("version")));
      version = v14->_version;
      v14->_version = (NSNumber *)v29;

    }
    v31 = objc_alloc_init(NFRemoteAdminRedirectStatePerformanceMetrics);
    performanceMetrics = v14->_performanceMetrics;
    v14->_performanceMetrics = v31;

  }
  return v14;
}

- (id)_redirectResult
{
  NSMutableDictionary *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSNumber *httpStatus;
  NSNumber *spStatusCode;
  NSString *incompleteReason;
  NSDictionary *forwardDataToSMP;
  NSDictionary *notification;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NFRemoteAdminRedirectStatePerformanceMetrics totalAPDUTime](self->_performanceMetrics, "totalAPDUTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v4 * 1000.0)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("totalRedirectAPDUResponseTimeInMS"));

  -[NFRemoteAdminRedirectStatePerformanceMetrics totalSessionTime](self->_performanceMetrics, "totalSessionTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v6 * 1000.0)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalSessionTimeInMS"));

  v8 = objc_opt_new(NSMutableDictionary);
  v9 = v8;
  httpStatus = self->_httpStatus;
  if (httpStatus)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", httpStatus, CFSTR("HTTPStatusCode"));
  spStatusCode = self->_spStatusCode;
  if (spStatusCode)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", spStatusCode, CFSTR("SPStatusCode"));
  incompleteReason = self->_incompleteReason;
  if (incompleteReason)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", incompleteReason, CFSTR("clientIncompleteReason"));
  forwardDataToSMP = self->_forwardDataToSMP;
  if (forwardDataToSMP)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", forwardDataToSMP, CFSTR("forwardData"));
  notification = self->_notification;
  if (notification)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", notification, CFSTR("kNotification"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState unsentScriptResponse](self, "unsentScriptResponse"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState unsentScriptResponse](self, "unsentScriptResponse"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, CFSTR("pendingSPResponse"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectStatePerformanceMetrics asDictionary](self->_performanceMetrics, "asDictionary"));
  -[NSMutableDictionary addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v17);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("redirectResponse"));
  return v3;
}

- (id)redirectResponse
{
  NSMutableDictionary *v3;
  NSString *taskId;
  NSString *batchId;
  void *v6;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_100057298, CFSTR("kVersion"));
  taskId = self->_taskId;
  if (taskId)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", taskId, CFSTR("kTaskId"));
  batchId = self->_batchId;
  if (batchId)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", batchId, CFSTR("kBatchId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState _redirectResult](self, "_redirectResult"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v6);

  return v3;
}

- (void)incrementStep
{
  unint64_t step;

  step = self->_step;
  if (step <= 2)
    self->_step = step + 1;
}

- (BOOL)isComplete
{
  return (unint64_t)(self->_step - 3) < 2;
}

- (void)incrementLongRetry
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  const char *v8;
  void *v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v4 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState retryInterval](self, "retryInterval"));
  v6 = (void *)v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_4;
  }
  v7 = *(_QWORD *)(v4 + 8);
  if (v7 <= 0x18)
  {
    *(_QWORD *)(v4 + 8) = v7 + 1;
LABEL_4:
    LODWORD(v5) = dword_100041140[v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)v5));
    if (v6)
      objc_setProperty_nonatomic_copy(v6, v8, v9, 16);

    -[NFRemoteAdminState updateNextRetryInterval:](self, "updateNextRetryInterval:", v6);
    goto LABEL_17;
  }
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", v16, ClassName, Name, 199);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67109890;
    v24 = v21;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 199;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", buf, 0x22u);
  }

  self->_step = 3;
LABEL_17:

}

- (void)save
{
  id v2;
  id v3;

  v2 = sub_100033D5C();
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  sub_100036604(v3);

}

- (id)description
{
  uint64_t v3;
  id *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  objc_super v20;

  v3 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState retryInterval](self, "retryInterval"));
  v4 = (id *)v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_5;
  }
  v5 = *(id *)(v3 + 16);
  if (!v5)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v6 = v4[2];
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

LABEL_6:
  v19 = objc_alloc((Class)NSString);
  v20.receiver = self;
  v20.super_class = (Class)NFRemoteAdminRedirectState;
  v9 = -[NFRemoteAdminState description](&v20, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState batchId](self, "batchId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState taskId](self, "taskId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState redirectUrl](self, "redirectUrl"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState version](self, "version"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState httpStatus](self, "httpStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminRedirectState spStatusCode](self, "spStatusCode"));
  v17 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@ { batchId=%@ taskid=%@ redirectUrl=%@ version=%@ httpStatus=%@ spStatus=%@ step=%d retryAfter=%f pendingImmediateRetry=%d}"), v10, v11, v12, v13, v14, v15, v16, -[NFRemoteAdminRedirectState step](self, "step"), v8, -[NFRemoteAdminState pendingImmediateRetry](self, "pendingImmediateRetry"));

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminRedirectState)initWithCoder:(id)a3
{
  id v4;
  NFRemoteAdminRedirectState *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  NSString *batchId;
  id v15;
  uint64_t v16;
  NSString *taskId;
  id v18;
  uint64_t v19;
  NSString *redirectUrl;
  id v21;
  uint64_t v22;
  NSNumber *version;
  uint64_t v24;
  NSDictionary *forwardDataToSMP;
  uint64_t v26;
  NSDictionary *forwardDataToSP;
  uint64_t v28;
  NSDictionary *notification;
  id v30;
  uint64_t v31;
  NSArray *whitelistedInstances;
  id v33;
  uint64_t v34;
  NSString *incompleteReason;
  id v36;
  uint64_t v37;
  NSNumber *httpStatus;
  id v39;
  uint64_t v40;
  NSNumber *spStatusCode;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  NFRemoteAdminRedirectStatePerformanceMetrics *performanceMetrics;
  id v47;
  uint64_t v48;
  NSString *seid;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)NFRemoteAdminRedirectState;
  v5 = -[NFRemoteAdminState initWithCoder:](&v51, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_alloc((Class)NSSet);
    v7 = objc_opt_class(NSDictionary);
    v8 = objc_opt_class(NSArray);
    v9 = objc_opt_class(NSData);
    v10 = objc_opt_class(NSNumber);
    v11 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, objc_opt_class(NSString), 0);
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("batchId"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    batchId = v5->_batchId;
    v5->_batchId = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("taskId"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    taskId = v5->_taskId;
    v5->_taskId = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("redirectUrl"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    redirectUrl = v5->_redirectUrl;
    v5->_redirectUrl = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("version"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    version = v5->_version;
    v5->_version = (NSNumber *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("forwardDataToSMP")));
    forwardDataToSMP = v5->_forwardDataToSMP;
    v5->_forwardDataToSMP = (NSDictionary *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("forwardDataToSP")));
    forwardDataToSP = v5->_forwardDataToSP;
    v5->_forwardDataToSP = (NSDictionary *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("notification")));
    notification = v5->_notification;
    v5->_notification = (NSDictionary *)v28;

    v30 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSData), CFSTR("whitelistedInstances"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    whitelistedInstances = v5->_whitelistedInstances;
    v5->_whitelistedInstances = (NSArray *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("incompleteReason"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    incompleteReason = v5->_incompleteReason;
    v5->_incompleteReason = (NSString *)v34;

    v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("httpStatus"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    httpStatus = v5->_httpStatus;
    v5->_httpStatus = (NSNumber *)v37;

    v39 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("spStatusCode"));
    v40 = objc_claimAutoreleasedReturnValue(v39);
    spStatusCode = v5->_spStatusCode;
    v5->_spStatusCode = (NSNumber *)v40;

    v42 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("step"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v5->_step = (int64_t)objc_msgSend(v43, "integerValue");
    v44 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFRemoteAdminRedirectStatePerformanceMetrics), CFSTR("performanceMetrics"));
    v45 = objc_claimAutoreleasedReturnValue(v44);
    performanceMetrics = v5->_performanceMetrics;
    v5->_performanceMetrics = (NFRemoteAdminRedirectStatePerformanceMetrics *)v45;

    v47 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("seid"));
    v48 = objc_claimAutoreleasedReturnValue(v47);
    seid = v5->_seid;
    v5->_seid = (NSString *)v48;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminRedirectState;
  v4 = a3;
  -[NFRemoteAdminState encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_batchId, CFSTR("batchId"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_taskId, CFSTR("taskId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_redirectUrl, CFSTR("redirectUrl"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_forwardDataToSMP, CFSTR("forwardDataToSMP"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_forwardDataToSP, CFSTR("forwardDataToSP"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_incompleteReason, CFSTR("incompleteReason"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_notification, CFSTR("notification"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_httpStatus, CFSTR("httpStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_spStatusCode, CFSTR("spStatusCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_step));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("step"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_performanceMetrics, CFSTR("performanceMetrics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_whitelistedInstances, CFSTR("whitelistedInstances"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_seid, CFSTR("seid"));

}

- (NSString)batchId
{
  return self->_batchId;
}

- (void)setBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_batchId, a3);
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (NSString)redirectUrl
{
  return self->_redirectUrl;
}

- (void)setRedirectUrl:(id)a3
{
  objc_storeStrong((id *)&self->_redirectUrl, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSDictionary)forwardDataToSMP
{
  return self->_forwardDataToSMP;
}

- (void)setForwardDataToSMP:(id)a3
{
  objc_storeStrong((id *)&self->_forwardDataToSMP, a3);
}

- (NSDictionary)forwardDataToSP
{
  return self->_forwardDataToSP;
}

- (void)setForwardDataToSP:(id)a3
{
  objc_storeStrong((id *)&self->_forwardDataToSP, a3);
}

- (NSString)incompleteReason
{
  return self->_incompleteReason;
}

- (void)setIncompleteReason:(id)a3
{
  objc_storeStrong((id *)&self->_incompleteReason, a3);
}

- (NSDictionary)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSArray)whitelistedInstances
{
  return self->_whitelistedInstances;
}

- (void)setWhitelistedInstances:(id)a3
{
  objc_storeStrong((id *)&self->_whitelistedInstances, a3);
}

- (NSNumber)httpStatus
{
  return self->_httpStatus;
}

- (void)setHttpStatus:(id)a3
{
  objc_storeStrong((id *)&self->_httpStatus, a3);
}

- (NSNumber)spStatusCode
{
  return self->_spStatusCode;
}

- (void)setSpStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_spStatusCode, a3);
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (NFRemoteAdminRedirectStatePerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (int64_t)step
{
  return self->_step;
}

- (void)setStep:(int64_t)a3
{
  self->_step = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_spStatusCode, 0);
  objc_storeStrong((id *)&self->_httpStatus, 0);
  objc_storeStrong((id *)&self->_whitelistedInstances, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_incompleteReason, 0);
  objc_storeStrong((id *)&self->_forwardDataToSP, 0);
  objc_storeStrong((id *)&self->_forwardDataToSMP, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_redirectUrl, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_batchId, 0);
}

@end
