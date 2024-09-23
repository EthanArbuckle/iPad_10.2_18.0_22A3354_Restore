@implementation NRAnalyticsLocalDevice

- (void)submit
{
  unint64_t v2;
  unint64_t v3;
  double v5;
  unint64_t deviceRegistrationStart;
  unint64_t deviceRegistrationEnd;
  void *v9;
  void *v10;
  NSMutableDictionary *eventDictionary;
  const __CFString *v12;

  v5 = 0.0;
  if (self)
  {
    deviceRegistrationStart = self->_deviceRegistrationStart;
    deviceRegistrationEnd = self->_deviceRegistrationEnd;
    if (deviceRegistrationStart && deviceRegistrationEnd > deviceRegistrationStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v5 = (double)v2 * 0.000001 * (double)(deviceRegistrationEnd - deviceRegistrationStart) / (double)v3;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (!self)
  {
    v12 = CFSTR("deviceRegistrationTimeInSec");
    eventDictionary = 0;
    goto LABEL_15;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("deviceRegistrationTimeInSec"));

  if (self->_deviceRegistrationSuccess)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v10, CFSTR("deviceRegistrationSuccess"));

  }
  if (self->_devicePairedWithOOBKey)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    eventDictionary = self->super._eventDictionary;
    v12 = CFSTR("devicePairedWithOOBKey");
LABEL_15:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, v12);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.localDevice"));
}

@end
