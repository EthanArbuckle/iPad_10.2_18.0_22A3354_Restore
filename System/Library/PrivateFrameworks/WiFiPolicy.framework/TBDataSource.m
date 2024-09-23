@implementation TBDataSource

- (void)submitAnalyticsEventForFetchRequest:(id)a3 duration:(double)a4 error:(id)a5 resultCount:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v10 = a5;
  objc_msgSend(v29, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  v13 = -[TBDataSource type](self, "type");
  objc_msgSend(v29, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "type") == 1)
  {
    objc_msgSend(v29, "descriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = 0;
      goto LABEL_7;
    }
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bssids");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v29, "userInfo"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("trigger")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        v21))
  {
    objc_msgSend(v29, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("trigger"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

  }
  else
  {
    v24 = 0;
  }
  if ((unint64_t)(v12 - 1) >= 3)
    v12 = 0;
  if (v13)
    v25 = 2 * (v13 == 1);
  else
    v25 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[TBFetchAnalyticsEvent fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:](TBFetchAnalyticsEvent, "fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:", v25, v12, v24, v26, v19, v27, v10, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v28);
}

- (void)executeFetchRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  NSLog(CFSTR("Unsupported fetch request %@"), v3);
  +[TBError fetchUnsupportedErrorWithUserInfo:](TBError, "fetchUnsupportedErrorWithUserInfo:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:", v4);

}

- (unint64_t)type
{
  return self->_type;
}

@end
