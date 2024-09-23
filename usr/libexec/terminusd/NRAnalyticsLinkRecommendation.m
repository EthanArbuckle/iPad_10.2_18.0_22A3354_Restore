@implementation NRAnalyticsLinkRecommendation

- (void)submit
{
  double v2;
  double v3;
  unint64_t btNotRecommendedStart;
  unint64_t btNotRecommendedEnd;
  double v7;
  BOOL v8;
  double v9;
  unint64_t cmpWiFiNotRecommendedStart;
  unint64_t cmpWiFiNotRecommendedEnd;
  BOOL v12;
  void *v13;
  void *v14;

  if (self)
  {
    btNotRecommendedStart = self->_btNotRecommendedStart;
    btNotRecommendedEnd = self->_btNotRecommendedEnd;
    v7 = 0.0;
    if (btNotRecommendedStart)
      v8 = btNotRecommendedEnd > btNotRecommendedStart;
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
      v9 = (double)(btNotRecommendedEnd - btNotRecommendedStart) * v2 / v3;
    }
    cmpWiFiNotRecommendedStart = self->_cmpWiFiNotRecommendedStart;
    cmpWiFiNotRecommendedEnd = self->_cmpWiFiNotRecommendedEnd;
    if (cmpWiFiNotRecommendedStart)
      v12 = cmpWiFiNotRecommendedEnd > cmpWiFiNotRecommendedStart;
    else
      v12 = 0;
    if (v12)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v2) = dword_1001E48B0;
      LODWORD(v3) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)(cmpWiFiNotRecommendedEnd - cmpWiFiNotRecommendedStart)
         * (0.000000001
          * (double)*(unint64_t *)&v2)
         / (double)*(unint64_t *)&v3;
    }
    if (v9 > 0.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v9 * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v13, CFSTR("btNotRecommendedDurationInSec"));

    }
    if (v7 > 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v7 * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v14, CFSTR("cmpWiFiNotRecommendedDurationInSec"));

    }
  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.linkRecommendation"));
}

@end
