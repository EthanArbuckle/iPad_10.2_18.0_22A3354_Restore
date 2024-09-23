@implementation NRAnalyticsLinkManagerBluetooth

- (void)submit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self)
  {
    if (self->_peerRemovedPairingInformation)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v3, CFSTR("peerRemovedPairingInformation"));

    }
    if (self->_noBTPipeCallbacks)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("noBTPipeCallbacks"));

    }
    if (self->_pipeConnectedDuration)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("pipeConnectedDuration"));

    }
    if (self->_pipeDisconnectedDuration)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("pipeDisconnectedDuration"));

    }
  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.lnkMgrbluetooth"));
}

@end
