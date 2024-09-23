@implementation NRDNSProxy

- (NRDNSProxy)initWithQueue:(id)a3 nrUUID:(id)a4 delegate:(id)a5
{
  OS_dispatch_queue *v8;
  NSUUID *v9;
  id v10;
  NRDNSProxy *v11;
  NRDNSProxy *v12;
  unint64_t v13;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v15;
  NSUUID *nrUUID;
  id v18;
  int IsLevelEnabled;
  id v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  objc_super v27;

  v8 = (OS_dispatch_queue *)a3;
  v9 = (NSUUID *)a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)NRDNSProxy;
  v11 = -[NRDNSProxy init](&v27, "init");
  if (!v11)
  {
    v18 = sub_10001BDA4();
    IsLevelEnabled = _NRLogIsLevelEnabled(v18, 16);

    if (IsLevelEnabled)
    {
      v20 = sub_10001BDA4();
      _NRLogWithArgs(v20, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDNSProxy initWithQueue:nrUUID:delegate:]", 69);

    }
    v21 = _os_log_pack_size(12);
    v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = __error();
    v24 = _os_log_pack_fill(v22, v21, *v23, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "-[NRDNSProxy initWithQueue:nrUUID:delegate:]";
    v25 = sub_10001BDA4();
    _NRLogAbortWithPack(v25, v22);
  }
  v12 = v11;
  do
    v13 = __ldxr(&qword_1001E3958);
  while (__stxr(v13 + 1, &qword_1001E3958));
  v11->_identifier = v13;
  queue = v11->_queue;
  v11->_queue = v8;
  v15 = v8;

  nrUUID = v12->_nrUUID;
  v12->_nrUUID = v9;

  objc_storeWeak((id *)&v12->_delegate, v10);
  v12->_state = 0;

  return v12;
}

- (void)start
{
  NRDNSProxy *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  void *v7;

  v2 = self;
  if (self)
  {
    if (self->_started)
      return;
    self = (NRDNSProxy *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v5);
    _NRLogWithArgs(v7, 0, "%s%.30s:%-4d %@: start", ", "-[NRDNSProxy start]", 84, v2);

  }
  if (v2)
    v2->_started = 1;
}

- (void)dealloc
{
  NRDNSProxy *v2;
  void *v3;
  int IsLevelEnabled;
  NSUUID *nrUUID;
  NSUUID *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v2 = self;
  if (self)
    self = (NRDNSProxy *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v6 = nrUUID;
    v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
    _NRLogWithArgs(v8, 0, "%s%.30s:%-4d %@: dealloc", ", "-[NRDNSProxy dealloc]", 90, v2);

  }
  if (!v2 || !v2->_cancelled)
    -[NRDNSProxy cancel](v2, "cancel");
  v9.receiver = v2;
  v9.super_class = (Class)NRDNSProxy;
  -[NRDNSProxy dealloc](&v9, "dealloc");
}

- (void)cancel
{
  NRDNSProxy *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  void *v7;

  v2 = self;
  if (self)
    self = (NRDNSProxy *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v5);
    _NRLogWithArgs(v7, 0, "%s%.30s:%-4d %@: cancel", ", "-[NRDNSProxy cancel]", 98, v2);

  }
  if (v2)
    v2->_cancelled = 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverCertificateData, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
}

@end
