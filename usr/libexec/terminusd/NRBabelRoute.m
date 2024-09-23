@implementation NRBabelRoute

- (NRBabelRoute)initWithPrefix:(id)a3 neighbor:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 interval:(unsigned __int16)a7 receivedMetric:(unsigned __int16)a8 nextHop:(const in6_addr *)a9 instance:(id)a10
{
  uint64_t v12;
  id v17;
  id v18;
  id v19;
  NRBabelRoute *v20;
  NRBabelRoute *v21;
  void *v22;
  NSObject *v23;
  dispatch_source_t v24;
  OS_dispatch_source *expiryTimer;
  NSObject *v26;
  id v28;
  int IsLevelEnabled;
  id v30;
  uint64_t v31;
  char *v32;
  int *v33;
  uint64_t v34;
  id v35;
  _QWORD handler[4];
  id v38;
  id location;
  objc_super v40;

  v12 = a6;
  v17 = a3;
  v18 = a4;
  v19 = a10;
  v40.receiver = self;
  v40.super_class = (Class)NRBabelRoute;
  v20 = -[NRBabelRoute init](&v40, "init");
  v21 = v20;
  if (!v20)
  {
    v28 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16);

    if (IsLevelEnabled)
    {
      v30 = sub_1000B093C();
      _NRLogWithArgs(v30, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]", 2050);

    }
    v31 = _os_log_pack_size(12);
    v32 = (char *)&handler[-1] - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = __error();
    v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v34 = 136446210;
    *(_QWORD *)(v34 + 4) = "-[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]";
    v35 = sub_1000B093C();
    _NRLogAbortWithPack(v35, v32);
    __break(1u);
  }
  objc_storeStrong((id *)&v20->_bPrefix, a3);
  objc_storeStrong((id *)&v21->_neighbor, a4);
  v21->_routerID = a5;
  -[NRBabelRoute setSeqno:](v21, "setSeqno:", v12);
  v21->_interval = a7;
  v21->_receivedMetric = a8;
  v21->_nextHopInner = *a9;
  -[NRBabelRoute setInstance:](v21, "setInstance:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routes"));
  objc_msgSend(v22, "addObject:", v21);

  objc_initWeak(&location, v21);
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queue"));
  v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
  expiryTimer = v21->_expiryTimer;
  v21->_expiryTimer = (OS_dispatch_source *)v24;

  v26 = v21->_expiryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B8024;
  handler[3] = &unk_1001B7F28;
  objc_copyWeak(&v38, &location);
  dispatch_source_set_event_handler(v26, handler);
  dispatch_activate((dispatch_object_t)v21->_expiryTimer);
  -[NRBabelRoute resetExpiryTimer](v21, "resetExpiryTimer");
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  return v21;
}

- (BOOL)matchesPrefix:(id)a3 neighbor:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[NRBabelNeighbor isEqual:](self->_neighbor, "isEqual:", a4))
    v7 = -[NRBabelPrefix isEqual:](self->_bPrefix, "isEqual:", v6);
  else
    v7 = 0;

  return v7;
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
  unsigned int v11;
  uint64_t receivedMetric;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

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
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v6, v19, v20, v21);
  }
  v10 = v7;
  v11 = -[NRBabelRoute seqno](self, "seqno");
  receivedMetric = self->_receivedMetric;
  v13 = -[NRBabelRoute metric](self, "metric");
  v14 = objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor descriptionWithNextHop:](self->_neighbor, "descriptionWithNextHop:", &self->_nextHopInner));
  v15 = (void *)v14;
  if (self->_selected)
    v16 = "";
  else
    v16 = "not ";
  v17 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ seqno %u recvMetric %u metric %u via %@ %sselected"), bPrefix, v10, v11, receivedMetric, v13, v14, v16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class(NRBabelRoute);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bPrefix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "neighbor"));

    v9 = -[NRBabelRoute matchesPrefix:neighbor:](self, "matchesPrefix:neighbor:", v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setNextHop:(const in6_addr *)a3
{
  self->_nextHopInner = *a3;
}

- (BOOL)isNextHopEqualTo:(const in6_addr *)a3
{
  return *(_QWORD *)self->_nextHopInner.__u6_addr8 == *(_QWORD *)a3->__u6_addr8
      && *(_QWORD *)&self->_nextHopInner.__u6_addr32[2] == *(_QWORD *)&a3->__u6_addr32[2];
}

- (unsigned)metric
{
  unsigned int v2;
  int receivedMetric;

  if (self->_numExpiryTimerFires)
  {
    LOWORD(v2) = -1;
  }
  else
  {
    receivedMetric = self->_receivedMetric;
    v2 = -[NRBabelNeighbor metric](self->_neighbor, "metric") + receivedMetric;
    if (v2 > 0xFFFE)
      LOWORD(v2) = -1;
  }
  return v2;
}

- (void)resetExpiryTimer
{
  NSObject *expiryTimer;
  dispatch_time_t v3;

  expiryTimer = self->_expiryTimer;
  v3 = dispatch_time(0x8000000000000000, 35000000 * self->_interval);
  dispatch_source_set_timer(expiryTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)applyUsingSystem
{
  NRBabelRoute *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  _BOOL4 selected;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *IPv6AddrString;
  void *v13;
  void *v14;
  id v15;
  id v16;
  __objc2_prot *v17;
  NRBabelNeighbor *neighbor;
  __objc2_prop_list *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  id v22;
  NSObject *v23;
  id v24;
  int IsLevelEnabled;
  id v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD block[4];
  dispatch_queue_t v33;
  id v34;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self->_neighbor, "babelInterface"));
  v4 = objc_opt_class(NRBabelInterfaceSocket);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelPrefix descriptionWithoutPlen](v2->_bPrefix, "descriptionWithoutPlen"));
    if (!v6)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d skipping apply of v4 %@", ", "-[NRBabelRoute applyUsingSystem]", 2154, v2);
      }
      goto LABEL_19;
    }
    selected = v2->_selected;
    v8 = objc_alloc((Class)NSString);
    v9 = v8;
    if (selected)
    {
      v10 = -[NRBabelPrefix plen](v2->_bPrefix, "plen");
      IPv6AddrString = (void *)createIPv6AddrString(&v2->_nextHopInner, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](v2->_neighbor, "babelInterface"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ifName"));
      v15 = objc_msgSend(v9, "initWithFormat:", CFSTR("route -nv delete -inet6 %@ ; route -nv add -inet6 -proto2 -prefixlen %u %@ %@%%%@"),
              v6,
              v10,
              v6,
              IPv6AddrString,
              v14);

    }
    else
    {
      v16 = objc_msgSend(v8, "initWithFormat:", CFSTR("route -nv delete -inet6 %@"), v6);
      v15 = v16;
    }
    v20 = _NRCopySerialQueueAttr(v16);
    v2 = (NRBabelRoute *)"terminusd.babel.commands";
    v21 = dispatch_queue_create("terminusd.babel.commands", v20);

    if (v21)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B7ED0;
      block[3] = &unk_1001B8778;
      v33 = v21;
      v34 = v15;
      v22 = v15;
      v23 = v21;
      dispatch_async(v23, block);

LABEL_19:
      return;
    }
    v24 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v24, 16);

    if (IsLevelEnabled)
    {
      v26 = sub_1000B093C();
      _NRLogWithArgs(v26, 16, "%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", ", "nr_dispatch_queue_create", 118, "terminusd.babel.commands");

    }
    v27 = _os_log_pack_size(22);
    v17 = (__objc2_prot *)((char *)&block[-1] - ((__chkstk_darwin(v27) + 15) & 0xFFFFFFFFFFFFFFF0));
    v28 = __error();
    v29 = _os_log_pack_fill(v17, v27, *v28, &_mh_execute_header, "%{public}s dispatch_queue_create(%s) failed");
    *(_DWORD *)v29 = 136446466;
    *(_QWORD *)(v29 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v29 + 12) = 2080;
    *(_QWORD *)(v29 + 14) = "terminusd.babel.commands";
    v30 = sub_1000B093C();
    _NRLogAbortWithPack(v30, v17);
    goto LABEL_24;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  v17 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 == -1)
    {
LABEL_9:
      neighbor = v2->_neighbor;
      v19 = v17[25].inst_props;
      v31 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](neighbor, "babelInterface"));
      _NRLogWithArgs(v19, 1, "%s%.30s:%-4d skipping apply of non-socket %@, neighbor %@, if %@", ", "-[NRBabelRoute applyUsingSystem]", 2148, v2, neighbor, v31);

      return;
    }
LABEL_24:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
    goto LABEL_9;
  }
}

- (NRBabelPrefix)bPrefix
{
  return self->_bPrefix;
}

- (void)setBPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_bPrefix, a3);
}

- (NRBabelNeighbor)neighbor
{
  return self->_neighbor;
}

- (void)setNeighbor:(id)a3
{
  objc_storeStrong((id *)&self->_neighbor, a3);
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

- (unsigned)receivedMetric
{
  return self->_receivedMetric;
}

- (void)setReceivedMetric:(unsigned __int16)a3
{
  self->_receivedMetric = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (in6_addr)nextHopInner
{
  uint64_t v2;
  uint64_t v3;
  in6_addr result;

  v2 = *(_QWORD *)&self->_nextHopInner.__u6_addr32[2];
  v3 = *(_QWORD *)self->_nextHopInner.__u6_addr8;
  *(_QWORD *)&result.__u6_addr32[2] = v2;
  *(_QWORD *)result.__u6_addr8 = v3;
  return result;
}

- (void)setNextHopInner:(in6_addr)a3
{
  self->_nextHopInner = a3;
}

- (OS_dispatch_source)expiryTimer
{
  return self->_expiryTimer;
}

- (void)setExpiryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expiryTimer, a3);
}

- (unsigned)numExpiryTimerFires
{
  return self->_numExpiryTimerFires;
}

- (void)setNumExpiryTimerFires:(unsigned __int16)a3
{
  self->_numExpiryTimerFires = a3;
}

- (unsigned)interval
{
  return self->_interval;
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
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
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_neighbor, 0);
  objc_storeStrong((id *)&self->_bPrefix, 0);
}

@end
