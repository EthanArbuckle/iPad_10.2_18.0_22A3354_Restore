@implementation NRDevicePairingDirector

- (NRDevicePairingDirector)init
{
  NRDevicePairingDirector *v2;
  NRDevicePairingDirector *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *devicePairingConnections;
  id v9;
  int IsLevelEnabled;
  id v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NRDevicePairingDirector;
  v2 = -[NRDevicePairingDirector init](&v18, "init");
  if (!v2)
  {
    v9 = sub_1000FBA50();
    IsLevelEnabled = _NRLogIsLevelEnabled(v9, 16);

    if (IsLevelEnabled)
    {
      v11 = sub_1000FBA50();
      _NRLogWithArgs(v11, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDevicePairingDirector init]", 2016);

    }
    v12 = _os_log_pack_size(12);
    v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = __error();
    v15 = _os_log_pack_fill(v13, v12, *v14, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "-[NRDevicePairingDirector init]";
    v16 = sub_1000FBA50();
    _NRLogAbortWithPack(v16, v13);
  }
  v3 = v2;
  v4 = (OS_dispatch_queue *)sub_10014CFBC();
  queue = v3->_queue;
  v3->_queue = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  devicePairingConnections = v3->_devicePairingConnections;
  v3->_devicePairingConnections = v6;

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managerOwningBTConnections);
  objc_storeStrong((id *)&self->_devicePairingConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
