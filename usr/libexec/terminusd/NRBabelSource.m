@implementation NRBabelSource

- (NRBabelSource)initWithPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6 instance:(id)a7
{
  uint64_t v9;
  NRBabelPrefix *v12;
  id v13;
  NRBabelSource *v14;
  NRBabelSource *v15;
  NRBabelPrefix *bPrefix;
  void *v17;
  id v19;
  int IsLevelEnabled;
  id v21;
  uint64_t v22;
  char *v23;
  int *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  objc_super v28;

  v9 = a5;
  v12 = (NRBabelPrefix *)a3;
  v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)NRBabelSource;
  v14 = -[NRBabelSource init](&v28, "init");
  if (!v14)
  {
    v19 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v19, 16);

    if (IsLevelEnabled)
    {
      v21 = sub_1000B093C();
      _NRLogWithArgs(v21, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]", 1886);

    }
    v22 = _os_log_pack_size(12);
    v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    v24 = __error();
    v25 = _os_log_pack_fill(v23, v22, *v24, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v25 = 136446210;
    *(_QWORD *)(v25 + 4) = "-[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]";
    v26 = sub_1000B093C();
    _NRLogAbortWithPack(v26, v23);
  }
  v15 = v14;
  bPrefix = v14->_bPrefix;
  v14->_bPrefix = v12;

  v15->_routerID = a4;
  -[NRBabelSource setSeqno:](v15, "setSeqno:", v9);
  v15->_metric = a6;
  -[NRBabelSource setInstance:](v15, "setInstance:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sources"));
  objc_msgSend(v17, "addObject:", v15);

  -[NRBabelSource setupGCTimer](v15, "setupGCTimer");
  return v15;
}

- (void)dealloc
{
  NSObject *gcTimer;
  objc_super v4;

  gcTimer = self->_gcTimer;
  if (gcTimer)
    dispatch_source_cancel(gcTimer);
  v4.receiver = self;
  v4.super_class = (Class)NRBabelSource;
  -[NRBabelSource dealloc](&v4, "dealloc");
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4)
    return objc_msgSend(a3, "isEqual:", self->_bPrefix);
  else
    return 0;
}

- (id)description
{
  id v3;
  NRBabelPrefix *bPrefix;
  unint64_t routerID;
  unint64_t v6;
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = objc_alloc((Class)NSString);
  bPrefix = self->_bPrefix;
  routerID = self->_routerID;
  v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    v8 = objc_alloc((Class)NSString);
    v9 = bswap32(routerID);
    v7 = objc_msgSend(v8, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v9), (unsigned __int16)v9, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID)));
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v6, v13, v14, v15);
  }
  v10 = v7;
  v11 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ seqno %u metric %u"), bPrefix, v7, -[NRBabelSource seqno](self, "seqno"), self->_metric);

  return v11;
}

- (id)descriptionWithoutMetric
{
  id v3;
  NRBabelPrefix *bPrefix;
  unint64_t routerID;
  unint64_t v6;
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = objc_alloc((Class)NSString);
  bPrefix = self->_bPrefix;
  routerID = self->_routerID;
  v6 = bswap64(routerID);
  if (v6 > 0xFFFE)
  {
    v8 = objc_alloc((Class)NSString);
    v9 = bswap32(routerID);
    v7 = objc_msgSend(v8, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v9), (unsigned __int16)v9, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID)));
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v6, v13, v14, v15);
  }
  v10 = v7;
  v11 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ seqno %u"), bPrefix, v7, -[NRBabelSource seqno](self, "seqno"));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id routerID;
  NRBabelPrefix *bPrefix;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = objc_opt_class(NRBabelSource);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    routerID = (id)self->_routerID;
    if (routerID == objc_msgSend(v6, "routerID"))
    {
      bPrefix = self->_bPrefix;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bPrefix"));
      v10 = -[NRBabelPrefix isEqual:](bPrefix, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isDeepEqual:(id)a3
{
  id v4;
  unsigned int v5;
  int metric;
  BOOL v7;

  v4 = a3;
  if (-[NRBabelSource isEqual:](self, "isEqual:", v4)
    && (v5 = -[NRBabelSource seqno](self, "seqno"), v5 == objc_msgSend(v4, "seqno")))
  {
    metric = self->_metric;
    v7 = metric == objc_msgSend(v4, "metric");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isNewDistanceUnfeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int metric;
  __int16 v9;
  int v10;
  int v11;
  unsigned __int16 v12;
  int v13;
  int v15;
  char v16;

  v4 = a4;
  v5 = a3;
  v7 = -[NRBabelSource seqno](self, "seqno");
  if (v7 == v5)
    goto LABEL_2;
  if (v7 >= v5)
  {
    if ((__int16)(v7 - v5) >= 0)
      LOBYTE(v11) = -1;
    else
      LOBYTE(v11) = 1;
    if ((unsigned __int16)(v7 - v5) != 0x8000)
      return (v11 & 0x80u) != 0;
  }
  else if ((unsigned __int16)(v5 - v7) != 0x8000)
  {
    v11 = ((__int16)(v5 - v7) >> 15) | 1;
    return (v11 & 0x80u) != 0;
  }
LABEL_2:
  metric = self->_metric;
  v9 = metric - v4;
  if (metric == v4)
  {
    LOBYTE(v10) = 0;
  }
  else if (metric >= v4)
  {
    v15 = (unsigned __int16)(metric - v4);
    if (v9 >= 0)
      v16 = -1;
    else
      v16 = 1;
    if (v15 == 0x8000)
      LOBYTE(v10) = 0;
    else
      LOBYTE(v10) = v16;
  }
  else
  {
    v12 = v4 - metric;
    v13 = v12;
    v10 = ((__int16)v12 >> 15) | 1;
    if (v13 == 0x8000)
      LOBYTE(v10) = 0;
  }
  return (v10 & 0x80u) == 0;
}

- (void)updateFeasabilityDistanceWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  unsigned int v4;
  uint64_t v5;
  unsigned __int16 *p_metric;
  unsigned int metric;

  v4 = a4;
  v5 = a3;
  if (-[NRBabelSource seqno](self, "seqno") < a3)
  {
    -[NRBabelSource setSeqno:](self, "setSeqno:", v5);
    p_metric = &self->_metric;
LABEL_5:
    *p_metric = v4;
    return;
  }
  if (-[NRBabelSource seqno](self, "seqno") == (_DWORD)v5)
  {
    metric = self->_metric;
    p_metric = &self->_metric;
    if (metric > v4)
      goto LABEL_5;
  }
}

- (void)setupGCTimer
{
  void *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *gcTimer;
  NSObject *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource instance](self, "instance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queue"));
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  gcTimer = self->_gcTimer;
  self->_gcTimer = v5;

  v7 = self->_gcTimer;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000B715C;
  v11 = &unk_1001B7F28;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v7, &v8);
  dispatch_activate((dispatch_object_t)self->_gcTimer);
  -[NRBabelSource resetGCTimer](self, "resetGCTimer", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)resetGCTimer
{
  NSObject *gcTimer;
  dispatch_time_t v3;

  gcTimer = self->_gcTimer;
  v3 = dispatch_time(0x8000000000000000, 180000000000);
  dispatch_source_set_timer(gcTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (void)setBPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_bPrefix, a3);
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_routerID = a3;
}

- (unsigned)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unsigned __int16)a3
{
  self->_seqno = a3;
}

- (unsigned)metric
{
  return self->_metric;
}

- (void)setMetric:(unsigned __int16)a3
{
  self->_metric = a3;
}

- (OS_dispatch_source)gcTimer
{
  return self->_gcTimer;
}

- (void)setGcTimer:(id)a3
{
  objc_storeStrong((id *)&self->_gcTimer, a3);
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
  objc_storeWeak((id *)&self->_instance, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_gcTimer, 0);
  objc_storeStrong((id *)&self->_bPrefix, 0);
}

@end
