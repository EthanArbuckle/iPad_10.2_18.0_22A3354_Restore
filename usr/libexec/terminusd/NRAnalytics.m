@implementation NRAnalytics

- (NRAnalytics)init
{
  NRAnalytics *v2;
  NRAnalytics *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *eventDictionary;
  id v7;
  int IsLevelEnabled;
  id v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NRAnalytics;
  v2 = -[NRAnalytics init](&v16, "init");
  if (!v2)
  {
    v7 = sub_10011F984();
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16);

    if (IsLevelEnabled)
    {
      v9 = sub_10011F984();
      _NRLogWithArgs(v9, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRAnalytics init]", 53);

    }
    v10 = _os_log_pack_size(12);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = __error();
    v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v13 + 4) = "-[NRAnalytics init]";
    v14 = sub_10011F984();
    _NRLogAbortWithPack(v14, v11);
  }
  v3 = v2;
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  eventDictionary = v3->_eventDictionary;
  v3->_eventDictionary = v4;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);
}

@end
