@implementation CLAttributionRecord

- (CLAttributionRecord)initWithAttributionId:(id)a3 andTimer:(id)a4
{
  CLAttributionRecord *v6;
  CLAttributionRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLAttributionRecord;
  v6 = -[CLAttributionRecord init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLAttributionRecord setAttributionIdentifier:](v6, "setAttributionIdentifier:", a3);
    -[CLAttributionRecord setAttributionTimer:](v7, "setAttributionTimer:", a4);
  }
  return v7;
}

- (CLTimer)attributionTimer
{
  return self->_attributionTimer;
}

- (id)description
{
  id v3;
  double v4;
  double v5;

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[STLocationStatusDomainLocationAttribution activityAttribution](-[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"), "activityAttribution"), "attributedEntity"), "executableIdentity"), "bundleIdentifier");
  if (!v3)
  {
    v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[STLocationStatusDomainLocationAttribution activityAttribution](-[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"), "activityAttribution"), "attributedEntity"), "executableIdentity"), "bundlePath");
    if (!v3)
      v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[STLocationStatusDomainLocationAttribution activityAttribution](-[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"), "activityAttribution"), "attributedEntity"), "executableIdentity"), "executablePath");
  }
  -[CLTimer nextFireDelay](-[CLAttributionRecord attributionTimer](self, "attributionTimer"), "nextFireDelay");
  if (v4 == 1.79769313e308)
    v5 = -1.0;
  else
    v5 = v4;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ID:%@ TimeLeft:%f, TotalCount:%d"), v3, *(_QWORD *)&v5, -[CLAttributionRecord totalAttributionCount](self, "totalAttributionCount"));
}

- (STLocationStatusDomainLocationAttribution)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (int)totalAttributionCount
{
  return self->_totalAttributionCount;
}

- (void)incrementAttributionCountForServiceType:(unint64_t)a3
{
  ++self->_serviceTypeAttributionCounts[a3];
  ++self->_totalAttributionCount;
}

- (void)setAttributionTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setAttributionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)dealloc
{
  objc_super v3;

  -[CLAttributionRecord setAttributionIdentifier:](self, "setAttributionIdentifier:", 0);
  -[CLTimer invalidate](-[CLAttributionRecord attributionTimer](self, "attributionTimer"), "invalidate");
  -[CLAttributionRecord setAttributionTimer:](self, "setAttributionTimer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLAttributionRecord;
  -[CLAttributionRecord dealloc](&v3, "dealloc");
}

- (void)decrementAttributionCountForServiceType:(unint64_t)a3
{
  int v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  CLAttributionRecord *v15;

  v3 = a3;
  v5 = self->_serviceTypeAttributionCounts[a3];
  if (v5)
  {
    self->_serviceTypeAttributionCounts[a3] = v5 - 1;
    --self->_totalAttributionCount;
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10218E178);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v8 = 68289538;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      v14 = 2114;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AttributionRecord count for servicetype is already 0 before decrementing\", \"ServiceType\":%{public}d, \"Record\":%{public, location:escape_only}@}", (uint8_t *)&v8, 0x22u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10218E178);
    }
    v7 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v8 = 68289538;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1026;
      v13 = v3;
      v14 = 2114;
      v15 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AttributionRecord count for servicetype is already 0 before decrementing", "{\"msg%{public}.0s\":\"#AttributionRecord count for servicetype is already 0 before decrementing\", \"ServiceType\":%{public}d, \"Record\":%{public, location:escape_only}@}", (uint8_t *)&v8, 0x22u);
    }
  }
}

@end
