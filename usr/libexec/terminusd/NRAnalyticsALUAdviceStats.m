@implementation NRAnalyticsALUAdviceStats

- (void)submit
{
  double v3;
  void *v4;
  double timeSinceLastNonDefaultAdvice;
  void *v6;
  NSMutableDictionary *eventDictionary;
  const __CFString *v8;

  if (self)
    v3 = self->_timeSinceLastAdvice * 1000.0;
  else
    v3 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v3) * 0.001));
  if (!self)
  {
    v8 = CFSTR("timeSinceLastAdvice");
    eventDictionary = 0;
    goto LABEL_8;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("timeSinceLastAdvice"));

  timeSinceLastNonDefaultAdvice = self->_timeSinceLastNonDefaultAdvice;
  if (timeSinceLastNonDefaultAdvice > 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(timeSinceLastNonDefaultAdvice * 1000.0) * 0.001));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("timeSinceLastNonDefaultAdvice"));

  }
  if (self->_receivedSameAdvice)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super._eventDictionary;
    v8 = CFSTR("receivedSameAdvice");
LABEL_8:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v4, v8);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.aluAdviceStats"));
}

@end
