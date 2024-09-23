@implementation NSPProxyAgentNetworkStatistics

- (id)description
{
  id v3;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    sub_1000418A4(v3, self->_networkCharacteristics, CFSTR("Network Characteristics"), 0, 14);
    sub_100042144(v3, self->_proxyConnectionSuccess, (uint64_t)CFSTR("Proxy success"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionTimeout, (uint64_t)CFSTR("Ingress proxy connection timeout"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionRefused, (uint64_t)CFSTR("Ingress proxy connection refused"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionHostDown, (uint64_t)CFSTR("Ingress proxy connection host down"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionHostUnreachable, (uint64_t)CFSTR("Ingress proxy connection host unreachable"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionError, (uint64_t)CFSTR("Ingress proxy connection error"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionDNSBlocked, (uint64_t)CFSTR("Ingress proxy server DNS error"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionDNSTimeout, (uint64_t)CFSTR("Ingress proxy server DNS timeout"), 0, 14);
    sub_100042144(v3, self->_ingressProxyConnectionCertError, (uint64_t)CFSTR("Ingress proxy cert error"), 0, 14);
    sub_100042144(v3, self->_egressProxyConnectionError, (uint64_t)CFSTR("Egress proxy connection error"), 0, 14);
    sub_100042144(v3, self->_originProxyConnectionError, (uint64_t)CFSTR("Origin proxy connection error"), 0, 14);
    sub_100042144(v3, self->_egressProxyUnavailableError, (uint64_t)CFSTR("Egress proxy unavailable error"), 0, 14);
    sub_100042144(v3, self->_incompleteHandshakeStall, (uint64_t)CFSTR("Incomplete handshake stall"), 0, 14);
    sub_100042144(v3, self->_postHandshakeStall, (uint64_t)CFSTR("Post handshake stall"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxyAgentNetworkStatistics)initWithCoder:(id)a3
{
  id v4;
  NSPProxyAgentNetworkStatistics *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *networkCharacteristics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NSPProxyAgentNetworkStatistics;
  v5 = -[NSPProxyAgentNetworkStatistics init](&v14, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSDictionary);
    v7 = objc_opt_class(NSNumber);
    v8 = objc_opt_class(NSString);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(NSData), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("ProxyAgentNetworkStatisticsNetworkCharacteristics")));
    networkCharacteristics = v5->_networkCharacteristics;
    v5->_networkCharacteristics = (NSDictionary *)v11;

    v5->_proxyConnectionSuccess = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsSuccess"));
    v5->_ingressProxyConnectionTimeout = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressConnectionTimeout"));
    v5->_ingressProxyConnectionRefused = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressConnectionRefused"));
    v5->_ingressProxyConnectionHostDown = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressHostDown"));
    v5->_ingressProxyConnectionHostUnreachable = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressHostUnreachable"));
    v5->_ingressProxyConnectionError = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressConnectionError"));
    v5->_ingressProxyConnectionDNSBlocked = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressDNSBlocked"));
    v5->_ingressProxyConnectionDNSTimeout = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressDNSTimeoutError"));
    v5->_ingressProxyConnectionCertError = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIngressConnectionCertError"));
    v5->_egressProxyConnectionError = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsEgressConnectionError"));
    v5->_originProxyConnectionError = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsOriginConnectionError"));
    v5->_egressProxyUnavailableError = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsEgressProxyUnavailableError"));
    v5->_incompleteHandshakeStall = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsIncompleteHandshakeStall"));
    v5->_postHandshakeStall = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProxyAgentNetworkStatisticsPostHandshakeStall"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *networkCharacteristics;
  id v5;
  unint64_t postHandshakeStall;
  id v7;

  if (self)
  {
    networkCharacteristics = self->_networkCharacteristics;
    v5 = a3;
    objc_msgSend(v5, "encodeObject:forKey:", networkCharacteristics, CFSTR("ProxyAgentNetworkStatisticsNetworkCharacteristics"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_proxyConnectionSuccess, CFSTR("ProxyAgentNetworkStatisticsSuccess"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionTimeout, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionTimeout"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionRefused, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionRefused"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionHostDown, CFSTR("ProxyAgentNetworkStatisticsIngressHostDown"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionHostUnreachable, CFSTR("ProxyAgentNetworkStatisticsIngressHostUnreachable"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionError, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionDNSBlocked, CFSTR("ProxyAgentNetworkStatisticsIngressDNSBlocked"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionDNSTimeout, CFSTR("ProxyAgentNetworkStatisticsIngressDNSTimeoutError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_ingressProxyConnectionCertError, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionCertError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_egressProxyConnectionError, CFSTR("ProxyAgentNetworkStatisticsEgressConnectionError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_originProxyConnectionError, CFSTR("ProxyAgentNetworkStatisticsOriginConnectionError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_egressProxyUnavailableError, CFSTR("ProxyAgentNetworkStatisticsEgressProxyUnavailableError"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_incompleteHandshakeStall, CFSTR("ProxyAgentNetworkStatisticsIncompleteHandshakeStall"));
    postHandshakeStall = self->_postHandshakeStall;
  }
  else
  {
    v7 = a3;
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsNetworkCharacteristics"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsSuccess"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionTimeout"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionRefused"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressHostDown"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressHostUnreachable"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressDNSBlocked"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressDNSTimeoutError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIngressConnectionCertError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsEgressConnectionError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsOriginConnectionError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsEgressProxyUnavailableError"));
    objc_msgSend(v7, "encodeInteger:forKey:", 0, CFSTR("ProxyAgentNetworkStatisticsIncompleteHandshakeStall"));
    postHandshakeStall = 0;
  }
  objc_msgSend(a3, "encodeInteger:forKey:", postHandshakeStall, CFSTR("ProxyAgentNetworkStatisticsPostHandshakeStall"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPProxyAgentNetworkStatistics *v4;
  NSPProxyAgentNetworkStatistics *v5;
  unint64_t proxyConnectionSuccess;
  unint64_t ingressProxyConnectionTimeout;
  unint64_t ingressProxyConnectionRefused;
  unint64_t ingressProxyConnectionHostDown;
  unint64_t ingressProxyConnectionHostUnreachable;
  unint64_t ingressProxyConnectionError;
  unint64_t ingressProxyConnectionDNSBlocked;
  unint64_t ingressProxyConnectionDNSTimeout;
  unint64_t ingressProxyConnectionCertError;
  unint64_t egressProxyConnectionError;
  unint64_t originProxyConnectionError;
  unint64_t egressProxyUnavailableError;
  unint64_t incompleteHandshakeStall;
  unint64_t postHandshakeStall;

  v4 = -[NSPProxyAgentNetworkStatistics init](+[NSPProxyAgentNetworkStatistics allocWithZone:](NSPProxyAgentNetworkStatistics, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    sub_100010990((uint64_t)v4, self->_networkCharacteristics);
    proxyConnectionSuccess = self->_proxyConnectionSuccess;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_100010990((uint64_t)v4, 0);
  proxyConnectionSuccess = 0;
  if (v5)
LABEL_3:
    v5->_proxyConnectionSuccess = proxyConnectionSuccess;
LABEL_4:
  if (self)
  {
    ingressProxyConnectionTimeout = self->_ingressProxyConnectionTimeout;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  ingressProxyConnectionTimeout = 0;
  if (v5)
LABEL_6:
    v5->_ingressProxyConnectionTimeout = ingressProxyConnectionTimeout;
LABEL_7:
  if (self)
  {
    ingressProxyConnectionRefused = self->_ingressProxyConnectionRefused;
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  ingressProxyConnectionRefused = 0;
  if (v5)
LABEL_9:
    v5->_ingressProxyConnectionRefused = ingressProxyConnectionRefused;
LABEL_10:
  if (self)
  {
    ingressProxyConnectionHostDown = self->_ingressProxyConnectionHostDown;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  ingressProxyConnectionHostDown = 0;
  if (v5)
LABEL_12:
    v5->_ingressProxyConnectionHostDown = ingressProxyConnectionHostDown;
LABEL_13:
  if (self)
  {
    ingressProxyConnectionHostUnreachable = self->_ingressProxyConnectionHostUnreachable;
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  ingressProxyConnectionHostUnreachable = 0;
  if (v5)
LABEL_15:
    v5->_ingressProxyConnectionHostUnreachable = ingressProxyConnectionHostUnreachable;
LABEL_16:
  if (self)
  {
    ingressProxyConnectionError = self->_ingressProxyConnectionError;
    if (!v5)
      goto LABEL_19;
    goto LABEL_18;
  }
  ingressProxyConnectionError = 0;
  if (v5)
LABEL_18:
    v5->_ingressProxyConnectionError = ingressProxyConnectionError;
LABEL_19:
  if (self)
  {
    ingressProxyConnectionDNSBlocked = self->_ingressProxyConnectionDNSBlocked;
    if (!v5)
      goto LABEL_22;
    goto LABEL_21;
  }
  ingressProxyConnectionDNSBlocked = 0;
  if (v5)
LABEL_21:
    v5->_ingressProxyConnectionDNSBlocked = ingressProxyConnectionDNSBlocked;
LABEL_22:
  if (self)
  {
    ingressProxyConnectionDNSTimeout = self->_ingressProxyConnectionDNSTimeout;
    if (!v5)
      goto LABEL_25;
    goto LABEL_24;
  }
  ingressProxyConnectionDNSTimeout = 0;
  if (v5)
LABEL_24:
    v5->_ingressProxyConnectionDNSTimeout = ingressProxyConnectionDNSTimeout;
LABEL_25:
  if (self)
  {
    ingressProxyConnectionCertError = self->_ingressProxyConnectionCertError;
    if (!v5)
      goto LABEL_28;
    goto LABEL_27;
  }
  ingressProxyConnectionCertError = 0;
  if (v5)
LABEL_27:
    v5->_ingressProxyConnectionCertError = ingressProxyConnectionCertError;
LABEL_28:
  if (self)
  {
    egressProxyConnectionError = self->_egressProxyConnectionError;
    if (!v5)
      goto LABEL_31;
    goto LABEL_30;
  }
  egressProxyConnectionError = 0;
  if (v5)
LABEL_30:
    v5->_egressProxyConnectionError = egressProxyConnectionError;
LABEL_31:
  if (self)
  {
    originProxyConnectionError = self->_originProxyConnectionError;
    if (!v5)
      goto LABEL_34;
    goto LABEL_33;
  }
  originProxyConnectionError = 0;
  if (v5)
LABEL_33:
    v5->_originProxyConnectionError = originProxyConnectionError;
LABEL_34:
  if (self)
  {
    egressProxyUnavailableError = self->_egressProxyUnavailableError;
    if (!v5)
      goto LABEL_37;
    goto LABEL_36;
  }
  egressProxyUnavailableError = 0;
  if (v5)
LABEL_36:
    v5->_egressProxyUnavailableError = egressProxyUnavailableError;
LABEL_37:
  if (self)
  {
    incompleteHandshakeStall = self->_incompleteHandshakeStall;
    if (!v5)
      goto LABEL_40;
    goto LABEL_39;
  }
  incompleteHandshakeStall = 0;
  if (v5)
LABEL_39:
    v5->_incompleteHandshakeStall = incompleteHandshakeStall;
LABEL_40:
  if (!self)
  {
    postHandshakeStall = 0;
    if (!v5)
      return v5;
    goto LABEL_42;
  }
  postHandshakeStall = self->_postHandshakeStall;
  if (v5)
LABEL_42:
    v5->_postHandshakeStall = postHandshakeStall;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
}

@end
