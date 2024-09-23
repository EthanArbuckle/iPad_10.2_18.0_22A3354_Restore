@implementation NRAnalyticsCmpnLinkWiFi

- (void)submit
{
  double v2;
  double v3;
  double v4;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t symptomsNOIRegistrationStart;
  unint64_t symptomsNOIRegistrationEnd;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *eventDictionary;
  const __CFString *v16;

  sub_10011FD10((uint64_t)self, v2, v3, v4);
  v8 = 0.0;
  if (self)
  {
    symptomsNOIRegistrationStart = self->_symptomsNOIRegistrationStart;
    symptomsNOIRegistrationEnd = self->_symptomsNOIRegistrationEnd;
    if (symptomsNOIRegistrationStart && symptomsNOIRegistrationEnd > symptomsNOIRegistrationStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v8 = (double)v6 * 0.000001 * (double)(symptomsNOIRegistrationEnd - symptomsNOIRegistrationStart) / (double)v7;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v16 = CFSTR("symptomsNOIRegistrationTimeInSec");
    eventDictionary = 0;
    goto LABEL_17;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v12, CFSTR("symptomsNOIRegistrationTimeInSec"));

  if (self->_symptomsAdvisoryFalsePositivesCounter)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v13, CFSTR("symptomsAdvisoryFalsePositivesCounter"));

  }
  if (self->_virtualInterfaceRetryCounter)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v14, CFSTR("virtualInterfaceRetryCounter"));

  }
  if (self->_symptomsNOIRegistrationCounter)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super.super._eventDictionary;
    v16 = CFSTR("symptomsNOIRegistrationCounter");
LABEL_17:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v12, v16);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.cmpnLinkWiFi"));
}

@end
