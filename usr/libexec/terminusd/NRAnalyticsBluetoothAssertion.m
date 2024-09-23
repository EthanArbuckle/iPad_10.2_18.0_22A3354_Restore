@implementation NRAnalyticsBluetoothAssertion

- (void)submit
{
  double v3;
  void *v4;
  NSMutableDictionary *eventDictionary;
  const __CFString *v6;

  if (self)
    v3 = self->_durationInSec * 1000.0;
  else
    v3 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v3) * 0.001));
  if (!self)
  {
    v6 = CFSTR("durationInSec");
    eventDictionary = 0;
    goto LABEL_6;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("durationInSec"));

  if (self->_multipleAssertions)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    eventDictionary = self->super._eventDictionary;
    v6 = CFSTR("multipleAssertions");
LABEL_6:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v4, v6);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.bluetoothAssertion"));
}

@end
