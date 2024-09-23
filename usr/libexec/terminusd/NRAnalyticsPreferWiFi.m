@implementation NRAnalyticsPreferWiFi

- (void)submit
{
  unint64_t v2;
  unint64_t v3;
  double v5;
  unint64_t preferWiFiRequestStart;
  unint64_t preferWiFiRequestEnd;
  void *v9;
  NSMutableDictionary *eventDictionary;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;

  v5 = 0.0;
  if (self)
  {
    preferWiFiRequestStart = self->_preferWiFiRequestStart;
    preferWiFiRequestEnd = self->_preferWiFiRequestEnd;
    if (preferWiFiRequestStart && preferWiFiRequestEnd > preferWiFiRequestStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v5 = (double)v2 * 0.000001 * (double)(preferWiFiRequestEnd - preferWiFiRequestStart) / (double)v3;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self)
    eventDictionary = self->super._eventDictionary;
  else
    eventDictionary = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("requestDurationInSec"));

  if (self)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_preferWiFiRequestTimedOut));
    v12 = self->super._eventDictionary;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
    v12 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, CFSTR("requestTimedOut"));

  if (self)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_preferWiFiRequestSuccessful));
    v14 = self->super._eventDictionary;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
    v14 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, CFSTR("requestSuccessful"));

  if (self)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_linkTransitionsWhileRequestActive));
    v16 = self->super._eventDictionary;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
    v16 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, CFSTR("linkTransitionsWhileRequestActive"));

  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.preferWiFi"));
}

@end
