@implementation NRAnalyticsDirectToCloud

- (void)submit
{
  double v2;
  double v3;
  unint64_t directToCloudRequestStart;
  unint64_t directToCloudRequestEnd;
  double v7;
  BOOL v8;
  double v9;
  unint64_t iRATManagerQueryStart;
  unint64_t iRATManagerQueryEnd;
  BOOL v12;
  void *v13;
  NSMutableDictionary *eventDictionary;
  void *v15;
  NSMutableDictionary *v16;
  double v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  const __CFString *v21;

  if (self)
  {
    directToCloudRequestStart = self->_directToCloudRequestStart;
    directToCloudRequestEnd = self->_directToCloudRequestEnd;
    v7 = 0.0;
    if (directToCloudRequestStart)
      v8 = directToCloudRequestEnd > directToCloudRequestStart;
    else
      v8 = 0;
    v9 = 0.0;
    if (v8)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v3 = (double)*(unint64_t *)&v3;
      v2 = 0.000000001 * (double)*(unint64_t *)&v2;
      v9 = (double)(directToCloudRequestEnd - directToCloudRequestStart) * v2 / v3;
    }
    iRATManagerQueryStart = self->_iRATManagerQueryStart;
    iRATManagerQueryEnd = self->_iRATManagerQueryEnd;
    if (iRATManagerQueryStart)
      v12 = iRATManagerQueryEnd > iRATManagerQueryStart;
    else
      v12 = 0;
    if (v12)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)*(unint64_t *)&v2
         * 0.000001
         * (double)(iRATManagerQueryEnd - iRATManagerQueryStart)
         / (double)*(unint64_t *)&v3;
    }
  }
  else
  {
    v9 = 0.0;
    v7 = 0.0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v9 * 1000.0) * 0.001));
  if (self)
    eventDictionary = self->super._eventDictionary;
  else
    eventDictionary = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v13, CFSTR("requestDurationInSec"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v7) * 0.001));
  if (self)
    v16 = self->super._eventDictionary;
  else
    v16 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, CFSTR("iRATQueryDurationInSec"));

  if (self)
    v17 = self->_timeSinceLastDirectToCloudRequest * 1000.0;
  else
    v17 = 0.0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v17) * 0.001));
  if (!self)
  {
    v21 = CFSTR("timeSinceLastRequestInSec");
    v20 = 0;
    goto LABEL_29;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v18, CFSTR("timeSinceLastRequestInSec"));

  if (self->_iRATManagerQueryIncomplete)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v19, CFSTR("iRATManagerQueryIncomplete"));

  }
  if (self->_fallbackAdvisoryIssued)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v20 = self->super._eventDictionary;
    v21 = CFSTR("fallbackAdvisoryIssued");
LABEL_29:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v18, v21);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.directToCloud"));
}

@end
