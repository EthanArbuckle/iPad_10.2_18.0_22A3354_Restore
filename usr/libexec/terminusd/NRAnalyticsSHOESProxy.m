@implementation NRAnalyticsSHOESProxy

- (void)submit
{
  void *v3;
  NSMutableDictionary *eventDictionary;
  void *v5;
  NSMutableDictionary *v6;

  if (self)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_totalConnectionCounter));
    eventDictionary = self->super._eventDictionary;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
    eventDictionary = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v3, CFSTR("shoesProxyTotalConnections"));

  if (self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_maxSimultanousConnectionCounter));
    v6 = self->super._eventDictionary;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
    v6 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, CFSTR("socksProxyMaxSimutaneousConnections"));

  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.shoesProxy"));
}

@end
