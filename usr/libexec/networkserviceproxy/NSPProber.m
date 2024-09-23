@implementation NSPProber

- (NSString)description
{
  id v3;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    sub_1000418A4(v3, self->_name, CFSTR("Probe"), 0, 14);
    sub_1000420E0(v3, self->_probingActive, (uint64_t)CFSTR("Probing active"), 0, 14);
    sub_100042144(v3, self->_probeCount, (uint64_t)CFSTR("Probe count"), 0, 14);
    sub_100042144(v3, self->_probeSuccessCount, (uint64_t)CFSTR("Probe success count"), 0, 14);
    sub_100042144(v3, self->_probeFailedCount, (uint64_t)CFSTR("Probe failed count"), 0, 14);
    sub_100042144(v3, self->_probeRedirectedCount, (uint64_t)CFSTR("Probe redirected count"), 0, 14);
    sub_100042144(v3, self->_probeServerErrorCount, (uint64_t)CFSTR("Probe server error count"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSPProber)initWithCoder:(id)a3
{
  id v4;
  NSPProber *v5;
  id v6;
  uint64_t v7;
  NSString *name;
  id v9;
  uint64_t v10;
  NSDate *nextProbeDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSPProber;
  v5 = -[NSPProber init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("proberName"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_proxyProber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proberProxy"));
    v5->_probeCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeCount"));
    v5->_probeConnectionTimeout = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeConnectionTimeout"));
    v5->_probingActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proberProbeActiveCount"));
    v5->_probeOnNetworkChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proberProbeOnNetworkChange"));
    v5->_linkQuality = objc_msgSend(v4, "decodeIntForKey:", CFSTR("proberLinkQuality"));
    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proberNextProbeDate"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    nextProbeDate = v5->_nextProbeDate;
    v5->_nextProbeDate = (NSDate *)v10;

    v5->_probeSuccessCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeSuccessCount"));
    v5->_probeFailedCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeFailedCount"));
    v5->_probeRedirectedCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeRedirectedCount"));
    v5->_probeServerErrorCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proberProbeServerErrorCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t probeServerErrorCount;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("proberName"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_proxyProber, CFSTR("proberProxy"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_probeCount, CFSTR("proberProbeCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_probeConnectionTimeout, CFSTR("proberProbeConnectionTimeout"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_probingActive, CFSTR("proberProbeActiveCount"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_probeOnNetworkChange, CFSTR("proberProbeOnNetworkChange"));
    objc_msgSend(v5, "encodeInt:forKey:", self->_linkQuality, CFSTR("proberLinkQuality"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_nextProbeDate, CFSTR("proberNextProbeDate"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_probeSuccessCount, CFSTR("proberProbeSuccessCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_probeFailedCount, CFSTR("proberProbeFailedCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_probeRedirectedCount, CFSTR("proberProbeRedirectedCount"));
    probeServerErrorCount = self->_probeServerErrorCount;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("proberName"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proberProxy"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proberProbeCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proberProbeConnectionTimeout"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proberProbeActiveCount"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proberProbeOnNetworkChange"));
    objc_msgSend(v5, "encodeInt:forKey:", 0, CFSTR("proberLinkQuality"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("proberNextProbeDate"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proberProbeSuccessCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proberProbeFailedCount"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proberProbeRedirectedCount"));
    probeServerErrorCount = 0;
  }
  objc_msgSend(v5, "encodeInteger:forKey:", probeServerErrorCount, CFSTR("proberProbeServerErrorCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPProber *v4;
  uint64_t v5;
  BOOL proxyProber;
  unint64_t probeCount;
  unint64_t probeConnectionTimeout;
  BOOL probingActive;
  BOOL probeOnNetworkChange;
  int linkQuality;
  NWPath *path;
  BOOL probePending;
  unint64_t probeSuccessCount;
  unint64_t probeFailedCount;
  unint64_t probeRedirectedCount;
  unint64_t probeServerErrorCount;

  v4 = -[NSPProber init](+[NSPProber allocWithZone:](NSPProber, "allocWithZone:", a3), "init");
  v5 = (uint64_t)v4;
  if (self)
  {
    sub_10000D344((uint64_t)v4, self->_name);
    proxyProber = self->_proxyProber;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_10000D344((uint64_t)v4, 0);
  proxyProber = 0;
  if (v5)
LABEL_3:
    *(_BYTE *)(v5 + 11) = proxyProber;
LABEL_4:
  if (self)
  {
    sub_10001EC38(v5, self->_probeSession);
    sub_10000D354(v5, self->_dataTask);
    sub_1000062B8(v5, self->_operationQueue);
    sub_10000D364(v5, self->_probeRetryTimer);
    probeCount = self->_probeCount;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  sub_10001EC38(v5, 0);
  sub_10000D354(v5, 0);
  sub_1000062B8(v5, 0);
  sub_10000D364(v5, 0);
  probeCount = 0;
  if (v5)
LABEL_6:
    *(_QWORD *)(v5 + 64) = probeCount;
LABEL_7:
  if (self)
  {
    probeConnectionTimeout = self->_probeConnectionTimeout;
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  probeConnectionTimeout = 0;
  if (v5)
LABEL_9:
    *(_QWORD *)(v5 + 72) = probeConnectionTimeout;
LABEL_10:
  if (self)
  {
    probingActive = self->_probingActive;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  probingActive = 0;
  if (v5)
LABEL_12:
    *(_BYTE *)(v5 + 8) = probingActive;
LABEL_13:
  if (self)
  {
    probeOnNetworkChange = self->_probeOnNetworkChange;
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  probeOnNetworkChange = 0;
  if (v5)
LABEL_15:
    *(_BYTE *)(v5 + 9) = probeOnNetworkChange;
LABEL_16:
  if (self)
  {
    linkQuality = self->_linkQuality;
    if (!v5)
      goto LABEL_19;
    goto LABEL_18;
  }
  linkQuality = 0;
  if (v5)
LABEL_18:
    *(_DWORD *)(v5 + 12) = linkQuality;
LABEL_19:
  if (self)
  {
    sub_10000BB2C(v5, self->_nextProbeDate);
    path = self->_path;
    if (!v5)
      goto LABEL_22;
    goto LABEL_21;
  }
  sub_10000BB2C(v5, 0);
  path = 0;
  if (v5)
LABEL_21:
    objc_storeStrong((id *)(v5 + 88), path);
LABEL_22:
  if (self)
  {
    probePending = self->_probePending;
    if (!v5)
      goto LABEL_25;
    goto LABEL_24;
  }
  probePending = 0;
  if (v5)
LABEL_24:
    *(_BYTE *)(v5 + 10) = probePending;
LABEL_25:
  if (self)
  {
    probeSuccessCount = self->_probeSuccessCount;
    if (!v5)
      goto LABEL_28;
    goto LABEL_27;
  }
  probeSuccessCount = 0;
  if (v5)
LABEL_27:
    *(_QWORD *)(v5 + 96) = probeSuccessCount;
LABEL_28:
  if (self)
  {
    probeFailedCount = self->_probeFailedCount;
    if (!v5)
      goto LABEL_31;
    goto LABEL_30;
  }
  probeFailedCount = 0;
  if (v5)
LABEL_30:
    *(_QWORD *)(v5 + 104) = probeFailedCount;
LABEL_31:
  if (self)
  {
    probeRedirectedCount = self->_probeRedirectedCount;
    if (!v5)
      goto LABEL_34;
    goto LABEL_33;
  }
  probeRedirectedCount = 0;
  if (v5)
LABEL_33:
    *(_QWORD *)(v5 + 112) = probeRedirectedCount;
LABEL_34:
  if (!self)
  {
    probeServerErrorCount = 0;
    if (!v5)
      return (id)v5;
    goto LABEL_36;
  }
  probeServerErrorCount = self->_probeServerErrorCount;
  if (v5)
LABEL_36:
    *(_QWORD *)(v5 + 120) = probeServerErrorCount;
  return (id)v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSString *name;
  uint64_t v7;
  uint64_t v8;
  NSURLSession *probeSession;
  objc_super v10;
  uint8_t buf[4];
  NSString *v12;

  v4 = nplog_obj(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
      name = self->_name;
    else
      name = 0;
    *(_DWORD *)buf = 138412290;
    v12 = name;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc %@ prober", buf, 0xCu);
  }

  sub_10001F8B0((uint64_t)self, v7, v8);
  if (self)
  {
    probeSession = self->_probeSession;
    if (probeSession)
    {
      -[NSURLSession invalidateAndCancel](probeSession, "invalidateAndCancel");
      sub_10001EC38((uint64_t)self, 0);
    }
  }
  sub_1000062B8((uint64_t)self, 0);
  sub_10000D354((uint64_t)self, 0);
  v10.receiver = self;
  v10.super_class = (Class)NSPProber;
  -[NSPProber dealloc](&v10, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_nextProbeDate, 0);
  objc_storeStrong((id *)&self->_probeRetryTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_probeSession, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
