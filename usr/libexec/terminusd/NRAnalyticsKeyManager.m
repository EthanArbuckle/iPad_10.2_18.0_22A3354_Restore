@implementation NRAnalyticsKeyManager

- (void)submit
{
  unint64_t v2;
  unint64_t v3;
  double v5;
  unint64_t queryKeysStart;
  unint64_t queryKeysEnd;
  void *v9;
  NSMutableDictionary *eventDictionary;
  const __CFString *v11;

  v5 = 0.0;
  if (self)
  {
    queryKeysStart = self->_queryKeysStart;
    queryKeysEnd = self->_queryKeysEnd;
    if (queryKeysStart && queryKeysEnd > queryKeysStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v5 = (double)v2 * 0.000001 * (double)(queryKeysEnd - queryKeysStart) / (double)v3;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (!self)
  {
    v11 = CFSTR("queryKeysDurationInSec");
    eventDictionary = 0;
    goto LABEL_13;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("queryKeysDurationInSec"));

  if (self->_queryKeysSuccess)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    eventDictionary = self->super._eventDictionary;
    v11 = CFSTR("queryKeysSuccess");
LABEL_13:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v9, v11);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.keyManager"));
}

@end
