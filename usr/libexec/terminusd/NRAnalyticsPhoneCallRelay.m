@implementation NRAnalyticsPhoneCallRelay

- (void)submit
{
  unint64_t v2;
  unint64_t v3;
  double v5;
  unint64_t phoneCallRelayStart;
  unint64_t phoneCallRelayEnd;
  void *v9;
  NSMutableDictionary *eventDictionary;

  v5 = 0.0;
  if (self)
  {
    phoneCallRelayStart = self->_phoneCallRelayStart;
    phoneCallRelayEnd = self->_phoneCallRelayEnd;
    if (phoneCallRelayStart && phoneCallRelayEnd > phoneCallRelayStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v5 = (double)v2 * 0.000001 * (double)(phoneCallRelayEnd - phoneCallRelayStart) / (double)v3;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self)
    eventDictionary = self->super._eventDictionary;
  else
    eventDictionary = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("phoneCallRelayDurationInSec"));

  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.phoneCallRelay"));
}

@end
