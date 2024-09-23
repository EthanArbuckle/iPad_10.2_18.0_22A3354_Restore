@implementation NRBabelInterface

- (in6_addr)localAddress
{
  return &self->_localAddressInner;
}

- (void)setLocalAddress:(in6_addr *)a3
{
  self->_localAddressInner = *a3;
}

- (NRBabelInterface)initWithInstance:(id)a3
{
  id v4;
  NRBabelInterface *v5;
  NRBabelInterface *v6;
  NSObject *v7;
  dispatch_source_t v8;
  OS_dispatch_source *outgoingPublicHelloTimer;
  NSObject *v10;
  id v12;
  int IsLevelEnabled;
  id v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  id v19;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NRBabelInterface;
  v5 = -[NRBabelInterface init](&v24, "init");
  if (!v5)
  {
    v12 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v12, 16);

    if (IsLevelEnabled)
    {
      v14 = sub_1000B093C();
      _NRLogWithArgs(v14, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelInterface initWithInstance:]", 693);

    }
    v15 = _os_log_pack_size(12);
    v16 = (char *)&handler[-1] - ((__chkstk_darwin(v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = __error();
    v18 = _os_log_pack_fill(v16, v15, *v17, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v18 = 136446210;
    *(_QWORD *)(v18 + 4) = "-[NRBabelInterface initWithInstance:]";
    v19 = sub_1000B093C();
    _NRLogAbortWithPack(v19, v16);
  }
  v6 = v5;
  -[NRBabelInterface setInstance:](v5, "setInstance:", v4);
  v6->_outgoingPublicHelloSeqno = arc4random_uniform(0x10000u);
  v6->_mtu = 1452;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
  outgoingPublicHelloTimer = v6->_outgoingPublicHelloTimer;
  v6->_outgoingPublicHelloTimer = (OS_dispatch_source *)v8;

  dispatch_source_set_timer((dispatch_source_t)v6->_outgoingPublicHelloTimer, 0x8000000000000000, 0xEE6B2800uLL, 0x989680uLL);
  objc_initWeak(&location, v6);
  v10 = v6->_outgoingPublicHelloTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B0E2C;
  handler[3] = &unk_1001B7F28;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate((dispatch_object_t)v6->_outgoingPublicHelloTimer);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v6;
}

- (void)dealloc
{
  NSObject *outgoingPublicHelloTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  outgoingPublicHelloTimer = self->_outgoingPublicHelloTimer;
  if (outgoingPublicHelloTimer)
  {
    dispatch_source_cancel(outgoingPublicHelloTimer);
    v4 = self->_outgoingPublicHelloTimer;
    self->_outgoingPublicHelloTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)NRBabelInterface;
  -[NRBabelInterface dealloc](&v5, "dealloc");
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  return 1;
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  __objc2_prot *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v5 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (qword_1001E4748 != -1)
    goto LABEL_7;
  while (1)
  {
    if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
    {
      if (*(_QWORD *)&v5[25].cb != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d ABORTING: NOT IMPLEMENTED - USE SUBCLASS!", ", "-[NRBabelInterface sendPacket:iovLen:toAddr:]", 764);
    }
    v5 = (__objc2_prot *)_os_log_pack_size(12);
    v6 = (char *)&v10 - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    v7 = __error();
    v8 = _os_log_pack_fill(v6, v5, *v7, &_mh_execute_header, "%{public}s NOT IMPLEMENTED - USE SUBCLASS!");
    *(_DWORD *)v8 = 136446210;
    *(_QWORD *)(v8 + 4) = "-[NRBabelInterface sendPacket:iovLen:toAddr:]";
    v9 = sub_1000B093C();
    _NRLogAbortWithPack(v9, v6);
LABEL_7:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  }
}

- (BOOL)isLocalAddressEqualTo:(const in6_addr *)a3
{
  return *(_QWORD *)self->_localAddressInner.__u6_addr8 == *(_QWORD *)a3->__u6_addr8
      && *(_QWORD *)&self->_localAddressInner.__u6_addr32[2] == *(_QWORD *)&a3->__u6_addr32[2];
}

- (unsigned)outgoingPublicHelloSeqno
{
  return self->_outgoingPublicHelloSeqno;
}

- (void)setOutgoingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPublicHelloSeqno = a3;
}

- (OS_dispatch_source)outgoingPublicHelloTimer
{
  return self->_outgoingPublicHelloTimer;
}

- (void)setOutgoingPublicHelloTimer:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingPublicHelloTimer, a3);
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
  objc_storeWeak((id *)&self->_instance, a3);
}

- (in6_addr)localAddressInner
{
  uint64_t v2;
  uint64_t v3;
  in6_addr result;

  v2 = *(_QWORD *)&self->_localAddressInner.__u6_addr32[2];
  v3 = *(_QWORD *)self->_localAddressInner.__u6_addr8;
  *(_QWORD *)&result.__u6_addr32[2] = v2;
  *(_QWORD *)result.__u6_addr8 = v3;
  return result;
}

- (void)setLocalAddressInner:(in6_addr)a3
{
  self->_localAddressInner = a3;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (void)setMtu:(unsigned __int16)a3
{
  self->_mtu = a3;
}

- (BOOL)viable
{
  return self->_viable;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_outgoingPublicHelloTimer, 0);
}

@end
