@implementation NSPServiceStatusStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.serviceStatusStats");
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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusStats tierType](self, "tierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("TierType"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusDisabledCount](self, "serviceStatusDisabledCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ServiceStatusDisabledCount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusActiveCount](self, "serviceStatusActiveCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ServiceStatusActiveCount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusOutageCount](self, "serviceStatusOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ServiceStatusOutageCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusFraudAlertCount](self, "serviceStatusFraudAlertCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ServiceStatusFraudAlertCount"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusUnsupportedRegionCount](self, "serviceStatusUnsupportedRegionCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ServiceStatusUnsupportedRegionCount"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusSystemIncompatibleCount](self, "serviceStatusSystemIncompatibleCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ServiceStatusSystemIncompatibleCount"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusSubscriberUnsupportedRegionCount](self, "serviceStatusSubscriberUnsupportedRegionCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ServiceStatusSubscriberUnsupportedRegionCount"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPServiceStatusStats serviceStatusNetworkOutageCount](self, "serviceStatusNetworkOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ServiceStatusNetworkOutageCount"));

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

- (unint64_t)serviceStatusDisabledCount
{
  return self->_serviceStatusDisabledCount;
}

- (void)setServiceStatusDisabledCount:(unint64_t)a3
{
  self->_serviceStatusDisabledCount = a3;
}

- (unint64_t)serviceStatusActiveCount
{
  return self->_serviceStatusActiveCount;
}

- (void)setServiceStatusActiveCount:(unint64_t)a3
{
  self->_serviceStatusActiveCount = a3;
}

- (unint64_t)serviceStatusOutageCount
{
  return self->_serviceStatusOutageCount;
}

- (void)setServiceStatusOutageCount:(unint64_t)a3
{
  self->_serviceStatusOutageCount = a3;
}

- (unint64_t)serviceStatusFraudAlertCount
{
  return self->_serviceStatusFraudAlertCount;
}

- (void)setServiceStatusFraudAlertCount:(unint64_t)a3
{
  self->_serviceStatusFraudAlertCount = a3;
}

- (unint64_t)serviceStatusUnsupportedRegionCount
{
  return self->_serviceStatusUnsupportedRegionCount;
}

- (void)setServiceStatusUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusSystemIncompatibleCount
{
  return self->_serviceStatusSystemIncompatibleCount;
}

- (void)setServiceStatusSystemIncompatibleCount:(unint64_t)a3
{
  self->_serviceStatusSystemIncompatibleCount = a3;
}

- (unint64_t)serviceStatusSubscriberUnsupportedRegionCount
{
  return self->_serviceStatusSubscriberUnsupportedRegionCount;
}

- (void)setServiceStatusSubscriberUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusSubscriberUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusNetworkOutageCount
{
  return self->_serviceStatusNetworkOutageCount;
}

- (void)setServiceStatusNetworkOutageCount:(unint64_t)a3
{
  self->_serviceStatusNetworkOutageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
