@implementation NSPProxyAgentStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.proxyAgentStats");
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyAgentStats tierType](self, "tierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("TierType"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProxyAgentStats ingressProxyTokensAdded](self, "ingressProxyTokensAdded")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IngressProxyTokensAdded"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProxyAgentStats egressProxyTokensAdded](self, "egressProxyTokensAdded")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("EgressProxyTokensAdded"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProxyAgentStats ingressProxyLowWaterMarkHitCount](self, "ingressProxyLowWaterMarkHitCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("IngressProxyLowWaterMarkEventHitCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProxyAgentStats egressProxyLowWaterMarkHitCount](self, "egressProxyLowWaterMarkHitCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("EgressProxyLowWaterMarkEventHitCount"));

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

- (unint64_t)ingressProxyTokensAdded
{
  return self->_ingressProxyTokensAdded;
}

- (void)setIngressProxyTokensAdded:(unint64_t)a3
{
  self->_ingressProxyTokensAdded = a3;
}

- (unint64_t)egressProxyTokensAdded
{
  return self->_egressProxyTokensAdded;
}

- (void)setEgressProxyTokensAdded:(unint64_t)a3
{
  self->_egressProxyTokensAdded = a3;
}

- (unint64_t)ingressProxyLowWaterMarkHitCount
{
  return self->_ingressProxyLowWaterMarkHitCount;
}

- (void)setIngressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_ingressProxyLowWaterMarkHitCount = a3;
}

- (unint64_t)egressProxyLowWaterMarkHitCount
{
  return self->_egressProxyLowWaterMarkHitCount;
}

- (void)setEgressProxyLowWaterMarkHitCount:(unint64_t)a3
{
  self->_egressProxyLowWaterMarkHitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
