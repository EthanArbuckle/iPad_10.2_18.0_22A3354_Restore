@implementation NRPendingOutgoingSeqnoReq

- (id)createTLV
{
  NRBabelPrefix *bPrefix;
  uint64_t v5;
  unint64_t routerID;
  __int128 v7;

  WORD2(v5) = __rev16(-[NRPendingOutgoingSeqnoReq seqno](self, "seqno", 10, 0, 0, 0));
  HIWORD(v5) = self->_hopCount;
  bPrefix = self->_bPrefix;
  routerID = self->_routerID;
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, (-[NRBabelPrefix writeToAE:plen:prefix:](bPrefix, "writeToAE:plen:prefix:", (char *)&v5 + 2, (char *)&v5 + 3, &v7)+ 14)+ 2);
}

- (void)sendSeqnoReq
{
  NRBabelNeighbor *target;
  void *v4;
  void *v5;
  void *v6;

  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d sending seqno req for %@", ", "-[NRPendingOutgoingSeqnoReq sendSeqnoReq]", 2418, self);
  }
  target = self->_target;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq createTLV](self, "createTLV"));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  -[NRBabelNeighbor sendTLVs:](target, "sendTLVs:", v5);

}

- (NRPendingOutgoingSeqnoReq)initWithInstance:(id)a3 prefix:(id)a4 routerID:(unint64_t)a5
{
  id v8;
  NRBabelPrefix *v9;
  NRPendingOutgoingSeqnoReq *v10;
  NRPendingOutgoingSeqnoReq *v11;
  NRBabelPrefix *bPrefix;
  NRBabelPrefix *v13;
  NSObject *v14;
  dispatch_source_t v15;
  OS_dispatch_source *retryTimer;
  NSObject *v17;
  NRPendingOutgoingSeqnoReq *v18;
  id v20;
  int IsLevelEnabled;
  id v22;
  uint64_t v23;
  char *v24;
  int *v25;
  uint64_t v26;
  id v27;
  _QWORD handler[4];
  NRPendingOutgoingSeqnoReq *v29;
  id v30;
  id location;
  objc_super v32;

  v8 = a3;
  v9 = (NRBabelPrefix *)a4;
  v32.receiver = self;
  v32.super_class = (Class)NRPendingOutgoingSeqnoReq;
  v10 = -[NRPendingOutgoingSeqnoReq init](&v32, "init");
  if (!v10)
  {
    v20 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v20, 16);

    if (IsLevelEnabled)
    {
      v22 = sub_1000B093C();
      _NRLogWithArgs(v22, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]", 2424);

    }
    v23 = _os_log_pack_size(12);
    v24 = (char *)handler - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    v25 = __error();
    v26 = _os_log_pack_fill(v24, v23, *v25, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v26 = 136446210;
    *(_QWORD *)(v26 + 4) = "-[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]";
    v27 = sub_1000B093C();
    _NRLogAbortWithPack(v27, v24);
  }
  v11 = v10;
  -[NRPendingOutgoingSeqnoReq setInstance:](v10, "setInstance:", v8);
  bPrefix = v11->_bPrefix;
  v11->_bPrefix = v9;
  v13 = v9;

  v11->_routerID = a5;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
  retryTimer = v11->_retryTimer;
  v11->_retryTimer = (OS_dispatch_source *)v15;

  objc_initWeak(&location, v11);
  v17 = v11->_retryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B8F98;
  handler[3] = &unk_1001B87F0;
  objc_copyWeak(&v30, &location);
  v18 = v11;
  v29 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_activate((dispatch_object_t)v11->_retryTimer);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v18;
}

- (BOOL)matchesPrefix:(id)a3 routerID:(unint64_t)a4
{
  if (self->_routerID == a4)
    return -[NRBabelPrefix isEqual:](self->_bPrefix, "isEqual:", a3);
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class(NRPendingOutgoingSeqnoReq);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bPrefix"));
    v8 = objc_msgSend(v6, "routerID");

    v9 = -[NRPendingOutgoingSeqnoReq matchesPrefix:routerID:](self, "matchesPrefix:routerID:", v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  v11 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ seqno %u orig %@ retries %d target %@"), bPrefix, v7, -[NRPendingOutgoingSeqnoReq seqno](self, "seqno"), self->_originator, self->_retriesLeft, self->_target);

  return v11;
}

- (void)start
{
  if (self->_retryTimer)
  {
    self->_retriesLeft = 10;
    -[NRPendingOutgoingSeqnoReq sendSeqnoReq](self, "sendSeqnoReq");
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0x8000000000000000, 0x3B9ACA00uLL, 0x989680uLL);
  }
  else
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 17, "attempted to start cancelled POSR %@", self);
    }
  }
}

- (void)cancelTimer
{
  NSObject *retryTimer;
  OS_dispatch_source *v4;

  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;

  }
}

- (void)cancelWithDelay:(BOOL)a3
{
  NSObject *retryTimer;
  dispatch_time_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d cancelling POSR soon %@", ", "-[NRPendingOutgoingSeqnoReq cancelWithDelay:]", 2501, self);
    }
    self->_retriesLeft = 0x8000;
    retryTimer = self->_retryTimer;
    v5 = dispatch_time(0x8000000000000000, 20000000000);
    dispatch_source_set_timer(retryTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
  else
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d removing POSR %@", ", "-[NRPendingOutgoingSeqnoReq cancelWithDelay:]", 2508, self);
    }
    -[NRPendingOutgoingSeqnoReq cancelTimer](self, "cancelTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq instance](self, "instance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "posrs"));
    objc_msgSend(v6, "removeObject:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d dealloc POSR %@", ", "-[NRPendingOutgoingSeqnoReq dealloc]", 2516, self);
  }
  -[NRPendingOutgoingSeqnoReq cancelTimer](self, "cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)NRPendingOutgoingSeqnoReq;
  -[NRPendingOutgoingSeqnoReq dealloc](&v3, "dealloc");
}

- (BOOL)cancelIfRouteUnselected
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRPendingOutgoingSeqnoReq route](self, "route"));
  v4 = v3;
  if (!v3)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d cancelling POSR %@ because route vanished", ", "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]", 2524, self);
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "selected") & 1) == 0)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d cancelling POSR %@ because route %@ was unselected", ", "-[NRPendingOutgoingSeqnoReq cancelIfRouteUnselected]", 2529, self, v4);
    }
LABEL_16:
    -[NRPendingOutgoingSeqnoReq cancelWithDelay:](self, "cancelWithDelay:", 0);
    v5 = 1;
    goto LABEL_17;
  }
  v5 = 0;
LABEL_17:

  return v5;
}

- (BOOL)cancelIfMatchesPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5
{
  unsigned int v5;
  _BOOL4 v7;
  unsigned int v8;
  int v9;

  v5 = a5;
  v7 = -[NRPendingOutgoingSeqnoReq matchesPrefix:routerID:](self, "matchesPrefix:routerID:", a3, a4);
  if (!v7)
    return v7;
  v8 = -[NRPendingOutgoingSeqnoReq seqno](self, "seqno");
  if (v8 == v5)
    goto LABEL_11;
  if (v8 >= v5)
  {
    if ((__int16)(v8 - v5) >= 0)
      LOBYTE(v9) = -1;
    else
      LOBYTE(v9) = 1;
    if ((unsigned __int16)(v8 - v5) == 0x8000)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((unsigned __int16)(v5 - v8) == 0x8000)
  {
LABEL_11:
    -[NRPendingOutgoingSeqnoReq cancelWithDelay:](self, "cancelWithDelay:", 0);
    LOBYTE(v7) = 1;
    return v7;
  }
  v9 = ((__int16)(v5 - v8) >> 15) | 1;
LABEL_10:
  if ((v9 & 0x80) == 0)
    goto LABEL_11;
  LOBYTE(v7) = 0;
  return v7;
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

- (NRBabelNeighbor)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (NRBabelNeighbor)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (NRBabelRoute)route
{
  return (NRBabelRoute *)objc_loadWeakRetained((id *)&self->_route);
}

- (void)setRoute:(id)a3
{
  objc_storeWeak((id *)&self->_route, a3);
}

- (signed)retriesLeft
{
  return self->_retriesLeft;
}

- (void)setRetriesLeft:(signed __int16)a3
{
  self->_retriesLeft = a3;
}

- (OS_dispatch_source)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (unsigned)hopCount
{
  return self->_hopCount;
}

- (void)setHopCount:(unsigned __int8)a3
{
  self->_hopCount = a3;
}

- (NRBabelInstance)instance
{
  return (NRBabelInstance *)objc_loadWeakRetained((id *)&self->_instance);
}

- (void)setInstance:(id)a3
{
  objc_storeWeak((id *)&self->_instance, a3);
}

- (BOOL)removedFromInstance
{
  return self->_removedFromInstance;
}

- (void)setRemovedFromInstance:(BOOL)a3
{
  self->_removedFromInstance = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_destroyWeak((id *)&self->_route);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_bPrefix, 0);
}

@end
