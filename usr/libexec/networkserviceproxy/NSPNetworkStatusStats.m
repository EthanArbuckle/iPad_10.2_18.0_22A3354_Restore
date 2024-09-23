@implementation NSPNetworkStatusStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.networkStatusStats");
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPNetworkStatusStats tierType](self, "tierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("TierType"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wifiStatusBlockedCount](self, "wifiStatusBlockedCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("NetworkStatusStatsWiFiBlockedCount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wifiStatusDisabledCount](self, "wifiStatusDisabledCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NetworkStatusStatsWiFiDisabledCount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wifiStatusActiveCount](self, "wifiStatusActiveCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("NetworkStatusStatsWiFiActiveCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats cellStatusBlockedCount](self, "cellStatusBlockedCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("NetworkStatusStatsCellBlockedCount"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats cellStatusDisabledCount](self, "cellStatusDisabledCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("NetworkStatusStatsCellDisabledCount"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats cellStatusActiveCount](self, "cellStatusActiveCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("NetworkStatusStatsCellActiveCount"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wiredStatusBlockedCount](self, "wiredStatusBlockedCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("NetworkStatusStatsWiredBlockedCount"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wiredStatusDisabledCount](self, "wiredStatusDisabledCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("NetworkStatusStatsWiredDisabledCount"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPNetworkStatusStats wiredStatusActiveCount](self, "wiredStatusActiveCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("NetworkStatusStatsWiredActiveCount"));

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (unint64_t)wifiStatusBlockedCount
{
  return self->_wifiStatusBlockedCount;
}

- (void)setWifiStatusBlockedCount:(unint64_t)a3
{
  self->_wifiStatusBlockedCount = a3;
}

- (unint64_t)wifiStatusDisabledCount
{
  return self->_wifiStatusDisabledCount;
}

- (void)setWifiStatusDisabledCount:(unint64_t)a3
{
  self->_wifiStatusDisabledCount = a3;
}

- (unint64_t)wifiStatusActiveCount
{
  return self->_wifiStatusActiveCount;
}

- (void)setWifiStatusActiveCount:(unint64_t)a3
{
  self->_wifiStatusActiveCount = a3;
}

- (unint64_t)cellStatusBlockedCount
{
  return self->_cellStatusBlockedCount;
}

- (void)setCellStatusBlockedCount:(unint64_t)a3
{
  self->_cellStatusBlockedCount = a3;
}

- (unint64_t)cellStatusDisabledCount
{
  return self->_cellStatusDisabledCount;
}

- (void)setCellStatusDisabledCount:(unint64_t)a3
{
  self->_cellStatusDisabledCount = a3;
}

- (unint64_t)cellStatusActiveCount
{
  return self->_cellStatusActiveCount;
}

- (void)setCellStatusActiveCount:(unint64_t)a3
{
  self->_cellStatusActiveCount = a3;
}

- (unint64_t)wiredStatusBlockedCount
{
  return self->_wiredStatusBlockedCount;
}

- (void)setWiredStatusBlockedCount:(unint64_t)a3
{
  self->_wiredStatusBlockedCount = a3;
}

- (unint64_t)wiredStatusDisabledCount
{
  return self->_wiredStatusDisabledCount;
}

- (void)setWiredStatusDisabledCount:(unint64_t)a3
{
  self->_wiredStatusDisabledCount = a3;
}

- (unint64_t)wiredStatusActiveCount
{
  return self->_wiredStatusActiveCount;
}

- (void)setWiredStatusActiveCount:(unint64_t)a3
{
  self->_wiredStatusActiveCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
