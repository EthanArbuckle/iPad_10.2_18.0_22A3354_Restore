@implementation NRAnalyticsALUAdviceAggregateStats

- (void)submit
{
  double avgIntervalForNonDefaultAdvice;
  void *v4;
  double v5;
  void *v6;
  NSMutableDictionary *eventDictionary;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  const __CFString *v13;

  if (self)
  {
    avgIntervalForNonDefaultAdvice = self->_avgIntervalForNonDefaultAdvice;
    if (avgIntervalForNonDefaultAdvice > 0.0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(avgIntervalForNonDefaultAdvice * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("avgIntervalForNonDefaultAdvice"));

    }
    v5 = self->_avgDurationForWiFiAdvice * 1000.0;
  }
  else
  {
    v5 = 0.0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self)
    eventDictionary = self->super._eventDictionary;
  else
    eventDictionary = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("avgDurationForWiFiAdvice"));

  if (self)
    v8 = self->_avgDurationForBTClassicAdvice * 1000.0;
  else
    v8 = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v13 = CFSTR("avgDurationForBTClassicAdvice");
    v12 = 0;
    goto LABEL_16;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("avgDurationForBTClassicAdvice"));

  if (self->_totalAdviceCount)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v10, CFSTR("totalAdviceCount"));

  }
  if (self->_totalAdviceCountForWiFi)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v11, CFSTR("totalAdviceCountForWiFi"));

  }
  if (self->_totalAdviceCountForBTClassic)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    v12 = self->super._eventDictionary;
    v13 = CFSTR("totalAdviceCountForBTClassic");
LABEL_16:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v13);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.aluAdviceAggregateStats"));
}

@end
