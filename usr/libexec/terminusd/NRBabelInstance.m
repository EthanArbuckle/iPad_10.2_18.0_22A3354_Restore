@implementation NRBabelInstance

- (void)handleIfBringupPathUpdate:(id)a3
{
  uint64_t interface_index;
  NRBabelInterfaceSocket *v5;
  nw_path_status_t status;
  NSObject *path;

  path = a3;
  if (nw_path_get_status(path) == nw_path_status_satisfied)
  {
    interface_index = nw_path_get_interface_index(path);
    v5 = -[NRBabelInterfaceSocket initWithInstance:interface:]([NRBabelInterfaceSocket alloc], "initWithInstance:interface:", self, interface_index);
    if (v5)
    {
      -[NSMutableArray addObject:](self->_interfaces, "addObject:", v5);
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d Added ifIndex %u, new list %@", ", "-[NRBabelInstance handleIfBringupPathUpdate:]", 2565, interface_index, self->_interfaces);
      }
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 17, "NRBabelInterfaceSocket init %u failed - list is %@", interface_index, self->_interfaces);
      }
    }
    -[NRBabelInstance setupInterfaces](self, "setupInterfaces");
LABEL_22:

    goto LABEL_23;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v5 = (NRBabelInterfaceSocket *)(id)qword_1001E4740;
    status = nw_path_get_status(path);
    _NRLogWithArgs(v5, 1, "%s%.30s:%-4d if bringup path not satisfied %u", ", "-[NRBabelInstance handleIfBringupPathUpdate:]", 2557, status);
    goto LABEL_22;
  }
LABEL_23:

}

- (void)setupInterfaces
{
  int i;
  NSMutableArray *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  nw_parameters_t v11;
  xpc_object_t v12;
  void *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  OS_nw_path_evaluator *ifBringupPathEvaluator;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *v24;
  void *v25;
  OS_nw_path_evaluator *v26;
  OS_dispatch_queue *queue;
  id v28;
  int IsLevelEnabled;
  id v30;
  uint64_t v31;
  char *v32;
  int *v33;
  uint64_t v34;
  id v35;
  id v36;
  int v37;
  id v38;
  id v39;
  int v40;
  id v41;
  uint64_t v42;
  char *v43;
  int *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  __int128 __str;
  _BYTE v62[128];

  for (i = 0; i != 10; ++i)
  {
    *(_DWORD *)((char *)&__str + 7) = 0;
    *(_QWORD *)&__str = 0;
    snprintf((char *)&__str, 0xBuLL, "ipsec%u", i);
    v5 = if_nametoindex((const char *)&__str);
    if ((_DWORD)v5)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v4 = self->_interfaces;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v57;
LABEL_9:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v8);
          v10 = objc_opt_class(NRBabelInterfaceSocket);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && objc_msgSend(v9, "ifIndex") == (_DWORD)v5)
            break;
          if (v6 == (id)++v8)
          {
            v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
            if (v6)
              goto LABEL_9;
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:

        v4 = -[NRBabelInterfaceSocket initWithInstance:interface:]([NRBabelInterfaceSocket alloc], "initWithInstance:interface:", self, v5);
        if (v4)
        {
          -[NSMutableArray addObject:](self->_interfaces, "addObject:", v4);
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d Added IPsec ifIndex %u, new list %@", ", "-[NRBabelInstance setupInterfaces]", 2599, v5, self->_interfaces);
          }
        }
        else
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            _NRLogWithArgs(qword_1001E4740, 17, "NRBabelInterfaceSocket IPsec init %u failed - list is %@", v5, self->_interfaces);
          }
          v4 = 0;
        }
      }

    }
  }
  v11 = nw_parameters_create();
  __str = 0uLL;
  v48 = xpc_uuid_create((const unsigned __int8 *)&__str);
  if (!v48)
  {
    v28 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16);

    if (IsLevelEnabled)
    {
      v30 = sub_1000B093C();
      _NRLogWithArgs(v30, 16, "%s%.30s:%-4d ABORTING: xpc_uuid_create(%p) failed", ", "nr_xpc_uuid_create", 105, &__str);

    }
    v31 = _os_log_pack_size(22);
    v32 = (char *)&v47 - ((__chkstk_darwin(v31) + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = __error();
    v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%{public}s xpc_uuid_create(%p) failed");
    *(_DWORD *)v34 = 136446466;
    *(_QWORD *)(v34 + 4) = "nr_xpc_uuid_create";
    *(_WORD *)(v34 + 12) = 2048;
    *(_QWORD *)(v34 + 14) = &__str;
    v35 = sub_1000B093C();
    _NRLogAbortWithPack(v35, v32);
LABEL_51:
    __break(1u);
  }
  v12 = xpc_array_create(0, 0);
  v13 = v12;
  if (!v12)
  {
    v36 = sub_1000B093C();
    v37 = _NRLogIsLevelEnabled(v36, 16);

    if (v37)
    {
      v38 = sub_1000B093C();
      _NRLogWithArgs(v38, 16, "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", ", "nr_xpc_array_create", 56, 0, 0);

    }
    goto LABEL_50;
  }
  xpc_array_append_value(v12, v48);
  nw_parameters_set_preferred_netagent_uuids(v11, v13);
  v14 = xpc_uint64_create(2uLL);
  v15 = xpc_array_create(0, 0);
  v16 = v15;
  if (!v15)
  {
    v39 = sub_1000B093C();
    v40 = _NRLogIsLevelEnabled(v39, 16);

    if (v40)
    {
      v41 = sub_1000B093C();
      _NRLogWithArgs(v41, 16, "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", ", "nr_xpc_array_create", 56, 0, 0);

    }
LABEL_50:
    v42 = _os_log_pack_size(28);
    v43 = (char *)&v47 - ((__chkstk_darwin(v42) + 15) & 0xFFFFFFFFFFFFFFF0);
    v44 = __error();
    v45 = _os_log_pack_fill(v43, v42, *v44, &_mh_execute_header, "%{public}s xpc_array_create(%p, %u) failed");
    sub_10005ADB8(v45, (uint64_t)"nr_xpc_array_create");
    v46 = sub_1000B093C();
    _NRLogAbortWithPack(v46, v43);
    goto LABEL_51;
  }
  xpc_array_append_value(v15, v14);
  nw_parameters_set_prohibited_interface_types(v11, v14);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v17 = self->_interfaces;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j), "addToProhibited:", v11);
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v18);
  }

  ifBringupPathEvaluator = self->_ifBringupPathEvaluator;
  if (ifBringupPathEvaluator)
    nw_path_evaluator_cancel(ifBringupPathEvaluator, v21);
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint(0, v11);
  v24 = self->_ifBringupPathEvaluator;
  self->_ifBringupPathEvaluator = evaluator_for_endpoint;

  v25 = (void *)nw_path_evaluator_copy_path(self->_ifBringupPathEvaluator);
  -[NRBabelInstance handleIfBringupPathUpdate:](self, "handleIfBringupPathUpdate:", v25);

  objc_initWeak(&v51, self);
  v26 = self->_ifBringupPathEvaluator;
  queue = self->_queue;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000BFC78;
  v49[3] = &unk_1001B7850;
  objc_copyWeak(&v50, &v51);
  nw_path_evaluator_set_update_handler(v26, queue, v49);
  -[NRBabelInstance updateRoutes](self, "updateRoutes");
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v51);

}

- (void)setupAddress:(in6_addr *)a3
{
  void *v5;
  unint64_t routerID;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSString *IPv6AddrString;
  NSString *addrStr;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v5 = (void *)qword_1001E4740;
    routerID = self->_routerID;
    v7 = bswap64(routerID);
    v8 = (id)qword_1001E4740;
    if (v7 > 0xFFFE)
    {
      v10 = objc_alloc((Class)NSString);
      v11 = bswap32(routerID);
      v9 = objc_msgSend(v10, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v11), (unsigned __int16)v11, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID)));
    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v7, v16, v17, v18);
    }
    v12 = v9;
    _NRLogWithArgs(v5, 1, "%s%.30s:%-4d starting instance %@", ", "-[NRBabelInstance setupAddress:]", 2649, v9);

  }
  system("netstat -rnf inet6 | grep -v Routing | grep -v Destination | grep -v Internet6 | grep -v -e '^$' | while read -r route ; do addr=\"$(echo \"$route\" | awk '{print $1}')\" ; flags=\"$(echo \"$route\" | awk '{print $3}')\" ; [[ $flags"
    " == *\"2\"* ]] && route -nv delete -inet6 \"${addr}\"; done");
  IPv6AddrString = (NSString *)createIPv6AddrString(a3, v13);
  addrStr = self->_addrStr;
  self->_addrStr = IPv6AddrString;

  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d instance address is %@", ", "-[NRBabelInstance setupAddress:]", 2657, self->_addrStr);
  }
}

- (void)dealloc
{
  NEVirtualInterface_s *nevi;
  objc_super v4;

  nevi = self->_nevi;
  if (nevi)
    NEVirtualInterfaceInvalidate(nevi, a2);
  v4.receiver = self;
  v4.super_class = (Class)NRBabelInstance;
  -[NRBabelInstance dealloc](&v4, "dealloc");
}

- (NRBabelInstance)init
{
  NRBabelInstance *v2;
  NRBabelInstance *v3;
  NSObject *v4;
  const char *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSMutableArray *v8;
  NSMutableArray *interfaces;
  NSMutableArray *v10;
  NSMutableArray *neighbors;
  NSMutableArray *v12;
  NSMutableArray *sources;
  NSMutableArray *v14;
  NSMutableArray *routes;
  NSMutableArray *v16;
  NSMutableArray *posrs;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NRBabelInstance *v25;
  id v27;
  int IsLevelEnabled;
  id v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  id v33;
  id v34;
  int v35;
  id v36;
  uint64_t v37;
  char *v38;
  int *v39;
  uint64_t v40;
  id v41;
  _QWORD block[4];
  NRBabelInstance *v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)NRBabelInstance;
  v2 = -[NRBabelInstance init](&v44, "init");
  if (!v2)
  {
    v27 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v27, 16);

    if (IsLevelEnabled)
    {
      v29 = sub_1000B093C();
      _NRLogWithArgs(v29, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelInstance init]", 2699);

    }
    v30 = _os_log_pack_size(12);
    v5 = (char *)block - ((__chkstk_darwin(v30) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = __error();
    v32 = _os_log_pack_fill(v5, v30, *v31, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v32 = 136446210;
    *(_QWORD *)(v32 + 4) = "-[NRBabelInstance init]";
    v33 = sub_1000B093C();
    _NRLogAbortWithPack(v33, v5);
LABEL_13:
    v34 = sub_1000B093C();
    v35 = _NRLogIsLevelEnabled(v34, 16);

    if (v35)
    {
      v36 = sub_1000B093C();
      _NRLogWithArgs(v36, 16, "%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", ", "nr_dispatch_queue_create", 118, v5);

    }
    v37 = _os_log_pack_size(22);
    v38 = (char *)block - ((__chkstk_darwin(v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    v39 = __error();
    v40 = _os_log_pack_fill(v38, v37, *v39, &_mh_execute_header, "%{public}s dispatch_queue_create(%s) failed");
    *(_DWORD *)v40 = 136446466;
    *(_QWORD *)(v40 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v40 + 12) = 2080;
    *(_QWORD *)(v40 + 14) = v5;
    v41 = sub_1000B093C();
    _NRLogAbortWithPack(v41, v38);
  }
  v3 = v2;
  v4 = _NRCopySerialQueueAttr(v2);
  v5 = "terminusd.babel";
  v6 = dispatch_queue_create("terminusd.babel", v4);

  if (!v6)
    goto LABEL_13;
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  interfaces = v3->_interfaces;
  v3->_interfaces = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  neighbors = v3->_neighbors;
  v3->_neighbors = v10;

  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sources = v3->_sources;
  v3->_sources = v12;

  v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  routes = v3->_routes;
  v3->_routes = v14;

  v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  posrs = v3->_posrs;
  v3->_posrs = v16;

  v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfFile:", CFSTR("/tmp/terminus_babel_data.plist"));
  if (!v18)
    v18 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("routerID")));
  v20 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0 || (v21 = objc_msgSend(v19, "unsignedLongLongValue")) == 0)
  {
    do
    {
      v22 = arc4random();
      v21 = (id)(arc4random() | (unint64_t)(v22 << 32));
    }
    while ((unint64_t)v21 + 1 < 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("routerID"));

    sub_10010754C(CFSTR("/tmp/terminus_babel_data.plist"), v18, 1);
  }

  v3->_routerID = (unint64_t)v21;
  v3->_nodeSeqno = arc4random_uniform(0x10000u);
  v24 = v3->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BFBD8;
  block[3] = &unk_1001B8AE0;
  v25 = v3;
  v43 = v25;
  dispatch_async(v24, block);

  return v25;
}

- (id)copyNeighborWithAddr:(const in6_addr *)a3 babelInterface:(id)a4 isNewNeighbor:(BOOL *)a5
{
  id v8;
  NSMutableArray *v9;
  NRBabelNeighbor *v10;
  uint64_t v11;
  NRBabelNeighbor *i;
  void *v13;
  NRBabelNeighbor *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_neighbors;
  v10 = (NRBabelNeighbor *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (NRBabelNeighbor *)((char *)i + 1))
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "matchesAddress:babelInterface:", a3, v8, (_QWORD)v16))
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (NRBabelNeighbor *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  if (a5)
    *a5 = v10 == 0;
  if (!v10)
  {
    v14 = -[NRBabelNeighbor initWithAddress:babelInterface:]([NRBabelNeighbor alloc], "initWithAddress:babelInterface:", a3, v8);
    if (v14)
    {
      v10 = v14;
      -[NSMutableArray addObject:](self->_neighbors, "addObject:", v14);
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 17, "NRBabelNeighbor init failed", (_QWORD)v16);
      }
      v10 = 0;
    }
  }

  return v10;
}

- (id)copySourceWithPrefix:(id)a3 routerID:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_sources;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "matchesPrefix:routerID:", v6, a4, (_QWORD)v15))
        {
          v13 = v12;
          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isNewDistanceUnfeasibleForPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v6 = a6;
  v7 = a5;
  v8 = -[NRBabelInstance copySourceWithPrefix:routerID:](self, "copySourceWithPrefix:routerID:", a3, a4);
  LOBYTE(v6) = objc_msgSend(v8, "isNewDistanceUnfeasibleWithSeqno:metric:", v7, v6);

  return v6;
}

- (id)copyRouteWithPrefix:(id)a3 neighbor:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_routes;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "matchesPrefix:neighbor:", v6, v7, (_QWORD)v14))
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)copyPendingOutgoingSeqnoReqWithPrefix:(id)a3 routerID:(unint64_t)a4 isNewPOSR:(BOOL *)a5
{
  id v8;
  NSMutableArray *v9;
  NRPendingOutgoingSeqnoReq *v10;
  uint64_t v11;
  NRPendingOutgoingSeqnoReq *i;
  void *v13;
  NRPendingOutgoingSeqnoReq *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_posrs;
  v10 = (NRPendingOutgoingSeqnoReq *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (NRPendingOutgoingSeqnoReq *)((char *)i + 1))
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "matchesPrefix:routerID:", v8, a4, (_QWORD)v16))
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (NRPendingOutgoingSeqnoReq *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  if (a5)
    *a5 = v10 == 0;
  if (!v10)
  {
    v14 = -[NRPendingOutgoingSeqnoReq initWithInstance:prefix:routerID:]([NRPendingOutgoingSeqnoReq alloc], "initWithInstance:prefix:routerID:", self, v8, a4);
    if (v14)
    {
      v10 = v14;
      -[NSMutableArray addObject:](self->_posrs, "addObject:", v14);
    }
    else
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 17, "NRPendingOutgoingSeqnoReq init failed", (_QWORD)v16);
      }
      v10 = 0;
    }
  }

  return v10;
}

- (void)handleAckReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 nonce:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6;
  unsigned int v7;
  id v8;
  id v9;
  _WORD v10[2];

  v6 = a6;
  v7 = a5;
  v8 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, a4, 0);
  v10[0] = 515;
  v10[1] = __rev16(v7);
  v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v10, 4);
  objc_msgSend(v8, "scheduleTLV:interval:", v9, v6);

}

- (void)handleHelloFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 seqno:(unsigned __int16)a5 interval:(unsigned __int16)a6 personal:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *IPv6AddrString;
  unsigned int v17;
  const char *v18;
  char v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a4;
  v19 = 0;
  v13 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, v12, &v19);
  if (v19)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v14 = (id)qword_1001E4740;
      IPv6AddrString = (void *)createIPv6AddrString(a3, v15);
      v17 = objc_msgSend(v13, "metric");
      v18 = "public";
      if (v7)
        v18 = "personal";
      _NRLogWithArgs(v14, 1, "%s%.30s:%-4d %@Adding new neighbor [%@] %@ - seqno %u interval %u metric %u %s", ", "-[NRBabelInstance handleHelloFromAddr:babelInterface:seqno:interval:personal:]", 2839, self, v12, IPv6AddrString, v9, v8, v17, v18);

    }
    -[NRBabelInstance sendImmediateRouteUpdateToNeighbor:](self, "sendImmediateRouteUpdateToNeighbor:", v13);
  }
  objc_msgSend(v13, "handleHelloWithSeqno:interval:personal:", v9, v8, v7);

}

- (void)handleIHUFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 rxcost:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  uint64_t v11;
  void *IPv6AddrString;
  void *v13;
  id v14;
  id v15;

  v6 = a6;
  v7 = a5;
  v15 = a4;
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v10 = (id)qword_1001E4740;
    IPv6AddrString = (void *)createIPv6AddrString(a3, v11);
    _NRLogWithArgs(v10, 2, "%s%.30s:%-4d %@Got IHU from %@[%@] rxcost %u interval %u", ", "-[NRBabelInstance handleIHUFromAddr:babelInterface:rxcost:interval:]", 2857, self, IPv6AddrString, v15, v7, v6);

  }
  v13 = v15;
  if ((_DWORD)v6)
  {
    v14 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, v15, 0);
    objc_msgSend(v14, "setTxcost:", v7);
    objc_msgSend(v14, "resetIncomingIHUTimerInterval:", v6);

    v13 = v15;
  }

}

- (BOOL)purgeAllRoutesFromNeighbor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_routes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "neighbor", (_QWORD)v15));
        if (objc_msgSend(v12, "isEqual:", v4))
        {
          v13 = objc_msgSend(v11, "receivedMetric");

          if (v13 != 0xFFFF)
          {
            objc_msgSend(v11, "setReceivedMetric:", 0xFFFFLL);
            v8 = 1;
          }
        }
        else
        {

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)purgeInterface:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_neighbors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "babelInterface", (_QWORD)v15));
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
          v8 |= -[NRBabelInstance purgeAllRoutesFromNeighbor:](self, "purgeAllRoutesFromNeighbor:", v11);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)handleUpdateFromAddr:(const in6_addr *)a3 ForPrefix:(const in6_addr *)a4 plen:(unsigned __int8)a5 nextHop:(const in6_addr *)a6 babelInterface:(id)a7 routerID:(unint64_t)a8 seqno:(unsigned __int16)a9 interval:(unsigned __int16)a10 metric:(unsigned __int16)a11 ae:(unsigned __int8)a12
{
  uint64_t v14;
  id v18;
  NRBabelPrefix *v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  BOOL v31;
  NRBabelRoute *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  NRBabelRoute *v36;
  void *v37;
  unint64_t v38;
  id v39;
  id v40;
  void *v41;
  unint64_t v42;
  id v43;
  id v44;
  unsigned int v45;
  _BOOL4 v46;
  NRBabelRoute *v47;
  void *v48;
  unint64_t v49;
  id v50;
  id v51;
  void *v52;
  unint64_t v53;
  id v54;
  id v55;
  NRBabelRoute *v56;
  id v57;
  unsigned int v58;
  void *v59;
  id v60;
  unsigned int v61;
  void *v62;
  NRBabelRoute *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *i;
  id v70;
  unsigned int v71;
  void *v72;
  id v73;
  unsigned int v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  NRBabelRoute *v81;
  NRBabelInstance *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];

  v14 = a5;
  v18 = a7;
  v19 = -[NRBabelPrefix initWithPrefix:plen:]([NRBabelPrefix alloc], "initWithPrefix:plen:", a4, v14);
  v82 = self;
  v20 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, v18, 0);
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v21 = (void *)qword_1001E4740;
    v22 = bswap64(a8);
    v23 = (id)qword_1001E4740;
    if (v22 > 0xFFFE)
    {
      v25 = objc_alloc((Class)NSString);
      v26 = bswap32(a8);
      v24 = objc_msgSend(v25, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v26), (unsigned __int16)v26, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8)));
    }
    else
    {
      v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v22, v76, v77, v78);
    }
    v27 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "descriptionWithNextHop:", a6));
    _NRLogWithArgs(v21, 2, "%s%.30s:%-4d %@Got Route %@ %@ seqno %u metric %u via %@ interval %u", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2915, self, v19, v27, a9, a11, v28, a10);

  }
  if (a11 != 0xFFFF || a12)
  {
    v79 = v18;
    v32 = -[NRBabelInstance copyRouteWithPrefix:neighbor:](self, "copyRouteWithPrefix:neighbor:", v19, v20);
    v33 = -[NRBabelInstance isNewDistanceUnfeasibleForPrefix:routerID:seqno:metric:](self, "isNewDistanceUnfeasibleForPrefix:routerID:seqno:metric:", v19, a8, a9, a11);
    v34 = v33;
    v80 = v20;
    if (v32)
    {
      v81 = v32;
      v35 = -[NRBabelRoute selected](v32, "selected");
      if (a11 != 0xFFFF && (v35 & v34) != 0)
      {
        v36 = v32;
        if (-[NRBabelRoute routerID](v32, "routerID") == a8)
        {
          v18 = v79;
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            v37 = (void *)qword_1001E4740;
            v38 = bswap64(a8);
            v39 = (id)qword_1001E4740;
            if (v38 > 0xFFFE)
            {
              v57 = objc_alloc((Class)NSString);
              v58 = bswap32(a8);
              v40 = objc_msgSend(v57, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v58), (unsigned __int16)v58, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8)));
            }
            else
            {
              v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v38, v76, v77, v78);
            }
            v59 = v40;
            _NRLogWithArgs(v37, 2, "%s%.30s:%-4d %@ignoring unfeasible route for %@ %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2967, v82, v19, v40);

          }
          goto LABEL_98;
        }
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v48 = (void *)qword_1001E4740;
          v49 = bswap64(a8);
          v50 = (id)qword_1001E4740;
          if (v49 > 0xFFFE)
          {
            v60 = objc_alloc((Class)NSString);
            v61 = bswap32(a8);
            v36 = v32;
            v51 = objc_msgSend(v60, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v61), (unsigned __int16)v61, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8)));
          }
          else
          {
            v51 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v49, v76, v77, v78);
          }
          v62 = v51;
          _NRLogWithArgs(v48, 2, "%s%.30s:%-4d %@ retracting due to mismatched routerID %@: %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2965, self, v51, v36);

        }
        v63 = v36;
        v52 = v79;
        -[NRBabelRoute setReceivedMetric:](v63, "setReceivedMetric:", 0xFFFFLL);
        goto LABEL_83;
      }
      v45 = -[NRBabelRoute receivedMetric](v32, "receivedMetric");
      v46 = v45 != a11;
      if (v45 == a11)
      {
        v47 = v81;
        if (a11 == 0xFFFF)
          goto LABEL_57;
      }
      else
      {
        -[NRBabelRoute setReceivedMetric:](v81, "setReceivedMetric:", a11);
        v47 = v81;
        if (a11 == 0xFFFF)
        {
LABEL_51:
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v52 = v79;
          if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d %@updated route table entry %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 3013, self, v81);
          }
LABEL_83:
          v31 = 1;
LABEL_84:
          v64 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", self->_posrs);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v65 = v64;
          v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
          if (v66)
          {
            v67 = v66;
            v68 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v67; i = (char *)i + 1)
              {
                if (*(_QWORD *)v84 != v68)
                  objc_enumerationMutation(v65);
                objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i), "cancelIfMatchesPrefix:routerID:seqno:", v19, a8, a9);
              }
              v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
            }
            while (v67);
          }

          v18 = v52;
          v36 = v81;
          goto LABEL_99;
        }
      }
      if (-[NRBabelRoute routerID](v47, "routerID") != a8)
      {
        -[NRBabelRoute setRouterID:](v47, "setRouterID:", a8);
        v46 = 1;
      }
      if (!-[NRBabelRoute isNextHopEqualTo:](v47, "isNextHopEqualTo:", a6))
      {
        -[NRBabelRoute setNextHop:](v47, "setNextHop:", a6);
        v46 = 1;
      }
      if (a10 != 0xFFFF)
        -[NRBabelRoute setInterval:](v47, "setInterval:");
      -[NRBabelRoute setNumExpiryTimerFires:](v47, "setNumExpiryTimerFires:", 0);
      -[NRBabelRoute resetExpiryTimer](v47, "resetExpiryTimer");
      if (v46)
        goto LABEL_51;
LABEL_57:
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v52 = v79;
      if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d %@not changing route table entry %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 3015, self, v81);
      }
      v31 = 0;
      goto LABEL_84;
    }
    if (a11 == 0xFFFF)
    {
      v18 = v79;
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (!_NRLogIsLevelEnabled(qword_1001E4740, 2))
        goto LABEL_97;
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v41 = (void *)qword_1001E4740;
      v53 = bswap64(a8);
      v54 = (id)qword_1001E4740;
      if (v53 > 0xFFFE)
      {
        v70 = objc_alloc((Class)NSString);
        v71 = bswap32(a8);
        v55 = objc_msgSend(v70, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v71), (unsigned __int16)v71, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8)));
      }
      else
      {
        v55 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v53, v76, v77, v78);
      }
      v72 = v55;
      _NRLogWithArgs(v41, 2, "%s%.30s:%-4d %@ignoring new retraction for %@ %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2937, v82, v19, v55);
    }
    else
    {
      v18 = v79;
      if (!v33)
      {
        v56 = -[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]([NRBabelRoute alloc], "initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:", v19, v20, a8, a9, a10, a11, a6, self);
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        v81 = v56;
        if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
        {
          v52 = v79;
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d %@created new route table entry %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2957, self, v56);
        }
        else
        {
          v52 = v79;
        }
        goto LABEL_83;
      }
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (!_NRLogIsLevelEnabled(qword_1001E4740, 2))
      {
LABEL_97:
        v36 = 0;
LABEL_98:
        v31 = 0;
LABEL_99:

        v30 = v80;
        goto LABEL_100;
      }
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v41 = (void *)qword_1001E4740;
      v42 = bswap64(a8);
      v43 = (id)qword_1001E4740;
      if (v42 > 0xFFFE)
      {
        v73 = objc_alloc((Class)NSString);
        v74 = bswap32(a8);
        v44 = objc_msgSend(v73, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v74), (unsigned __int16)v74, bswap32(HIDWORD(a8)) >> 16, __rev16(HIWORD(a8)));
      }
      else
      {
        v44 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v42, v76, v77, v78);
      }
      v72 = v44;
      _NRLogWithArgs(v41, 2, "%s%.30s:%-4d %@ignoring unfeasible retraction for %@ %@", ", "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]", 2942, v82, v19, v44);
    }

    goto LABEL_97;
  }
  v29 = -[NRBabelInstance purgeAllRoutesFromNeighbor:](self, "purgeAllRoutesFromNeighbor:", v20);
  v30 = v20;
  v31 = v29;
LABEL_100:

  return v31;
}

- (void)handleRouteReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6
{
  uint64_t v6;
  NRBabelPrefix *v9;
  void *v10;
  id v11;

  v6 = a6;
  v11 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, a4, 0);
  v9 = -[NRBabelPrefix initWithPrefix:plen:]([NRBabelPrefix alloc], "initWithPrefix:plen:", a5, v6);
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d %@got RouteReq for %@ from %@", ", "-[NRBabelInstance handleRouteReqFromAddr:babelInterface:ForPrefix:plen:]", 3097, self, v9, v11);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVsForPrefix:](self, "createUpdateTLVsForPrefix:", v9));
  objc_msgSend(v11, "sendTLVs:", v10);

}

- (void)sendSeqnoReqIfNecessaryTo:(id)a3 forPrefix:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 hopCount:(unsigned __int8)a7 originator:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  int v20;
  id v21;
  void *v22;
  char v23;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a8;
  v23 = 0;
  v16 = -[NRBabelInstance copyPendingOutgoingSeqnoReqWithPrefix:routerID:isNewPOSR:](self, "copyPendingOutgoingSeqnoReqWithPrefix:routerID:isNewPOSR:", a4, a5, &v23);
  v17 = v16;
  if (v23)
    goto LABEL_2;
  v19 = objc_msgSend(v16, "seqno");
  if (v19 != (_DWORD)v10)
  {
    if (v19 >= v10)
    {
      if ((__int16)(v19 - v10) >= 0)
        LOBYTE(v20) = -1;
      else
        LOBYTE(v20) = 1;
      if ((unsigned __int16)(v19 - v10) == 0x8000)
        goto LABEL_13;
    }
    else
    {
      if ((unsigned __int16)(v10 - v19) == 0x8000)
        goto LABEL_13;
      v20 = ((__int16)(v10 - v19) >> 15) | 1;
    }
    if ((char)v20 > 0)
    {
LABEL_2:
      objc_msgSend(v17, "setSeqno:", v10);
      objc_msgSend(v17, "setOriginator:", v15);
      objc_msgSend(v17, "setRoute:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "neighbor"));
      objc_msgSend(v17, "setTarget:", v18);

      objc_msgSend(v17, "setHopCount:", v9);
      objc_msgSend(v17, "start");
      goto LABEL_3;
    }
  }
LABEL_13:
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v21 = (id)qword_1001E4740;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "neighbor"));
    _NRLogWithArgs(v21, 1, "%s%.30s:%-4d already have pending seqno req for %@, ignoring request for %u from %@ to %@", ", "-[NRBabelInstance sendSeqnoReqIfNecessaryTo:forPrefix:routerID:seqno:hopCount:originator:]", 3116, v17, v10, v15, v22);

  }
LABEL_3:

}

- (void)handleSeqnoReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6 routerID:(unint64_t)a7 seqno:(unsigned __int16)a8 hopCount:(unsigned __int8)a9
{
  uint64_t v9;
  uint64_t v11;
  id v15;
  NRBabelPrefix *v16;
  void *v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __objc2_prot *v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  unsigned int v33;
  int v34;
  int IsLevelEnabled;
  id v36;
  const char *v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t nodeSeqno;
  void *v48;
  NRBabelInstance *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  unsigned __int16 v55;
  void *j;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NRBabelPrefix *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  NRBabelInstance *v75;
  id v76;
  id obj;
  id obja;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];

  v9 = a8;
  v11 = a6;
  v15 = a4;
  v75 = self;
  v76 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a3, v15, 0);
  v16 = -[NRBabelPrefix initWithPrefix:plen:]([NRBabelPrefix alloc], "initWithPrefix:plen:", a5, v11);
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v17 = (void *)qword_1001E4740;
    v18 = bswap64(a7);
    v19 = (id)qword_1001E4740;
    if (v18 > 0xFFFE)
    {
      v21 = objc_alloc((Class)NSString);
      v22 = bswap32(a7);
      v20 = objc_msgSend(v21, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v22), (unsigned __int16)v22, bswap32(HIDWORD(a7)) >> 16, __rev16(HIWORD(a7)));
    }
    else
    {
      v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v18, v67, v68, v69);
    }
    v23 = v20;
    _NRLogWithArgs(v17, 1, "%s%.30s:%-4d %@got SeqnoReq for %@ %@ seqno %u hopCount %u from %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3138, self, v16, v20, v9, a9, v76);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createSelectedRoutesArrayForPrefix:](self, "createSelectedRoutesArrayForPrefix:", v16));
  if (objc_msgSend(v24, "count"))
  {
    v70 = v16;
    v72 = v15;
    v25 = objc_alloc_init((Class)NSMutableArray);
    v73 = objc_alloc_init((Class)NSMutableArray);
    v74 = objc_alloc_init((Class)NSMutableArray);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v71 = v24;
    obj = v24;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    v79 = v25;
    v27 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
    if (v26)
    {
      v28 = v26;
      v29 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v85 != v29)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v32, "routerID") != (id)a7)
            goto LABEL_31;
          v33 = objc_msgSend(v32, "seqno");
          if (v33 == (_DWORD)v9)
            goto LABEL_31;
          if (v33 >= v9)
          {
            if ((__int16)(v33 - v9) >= 0)
              LOBYTE(v34) = -1;
            else
              LOBYTE(v34) = 1;
            if ((unsigned __int16)(v33 - v9) == 0x8000)
              goto LABEL_31;
          }
          else
          {
            if ((unsigned __int16)(v9 - v33) == 0x8000)
              goto LABEL_31;
            v34 = ((__int16)(v9 - v33) >> 15) | 1;
          }
          if ((char)v34 > 0)
          {
            if (v75->_routerID == a7)
              v31 = v73;
            else
              v31 = v74;
            goto LABEL_18;
          }
LABEL_31:
          if (*(_QWORD *)&v27[25].cb != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          IsLevelEnabled = _NRLogIsLevelEnabled(qword_1001E4740, 16);
          v31 = v25;
          if (IsLevelEnabled)
          {
            if (*(_QWORD *)&v27[25].cb != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            v36 = (id)qword_1001E4740;
            if (objc_msgSend(v32, "routerID") == (id)a7)
              v37 = "";
            else
              v37 = "not ";
            v38 = objc_msgSend(v32, "seqno");
            v39 = objc_msgSend(v32, "seqno");
            if ((__int16)(v39 - v9) >= 0)
              v40 = -1;
            else
              v40 = 1;
            if ((unsigned __int16)(v39 - v9) == 0x8000)
              v40 = 0;
            v41 = ((int)(((_DWORD)v9 - v39) << 16) >> 31) | 1;
            if ((unsigned __int16)(v9 - v39) == 0x8000)
              v41 = 0;
            if (v39 < v9)
              v40 = v41;
            if (v39 == (_DWORD)v9)
              v40 = 0;
            _NRLogWithArgs(v36, 16, "%s%.30s:%-4d SEQSTUFF routerID %sequal, compare(%u,%u) = %d", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3152, v37, v38, v9, v40);

            v25 = v79;
            v31 = v79;
            v27 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
          }
LABEL_18:
          objc_msgSend(v31, "addObject:", v32);
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v25, "count"))
    {
      v42 = v73;
      if (*(_QWORD *)&v27[25].cb != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v15 = v72;
      v16 = v70;
      v24 = v71;
      if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        v43 = (id)qword_1001E4740;
        if (objc_msgSend(v25, "count") == (id)1)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
          _NRLogWithArgs(v43, 1, "%s%.30s:%-4d responding to seqno req with existing routes %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3162, v44);

        }
        else
        {
          _NRLogWithArgs(v43, 1, "%s%.30s:%-4d responding to seqno req with existing routes %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3162, v25);
        }

      }
      v49 = v75;
      v50 = v25;
    }
    else
    {
      v42 = v73;
      if (!objc_msgSend(v73, "count"))
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v51 = v74;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        if (v52)
        {
          v53 = v52;
          obja = 0;
          v54 = *(_QWORD *)v81;
          v55 = -1;
          do
          {
            for (j = 0; j != v53; j = (char *)j + 1)
            {
              if (*(_QWORD *)v81 != v54)
                objc_enumerationMutation(v51);
              v57 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "neighbor"));
              v59 = objc_msgSend(v76, "isEqual:", v58);

              if ((v59 & 1) == 0 && objc_msgSend(v57, "metric") < v55)
              {
                v55 = (unsigned __int16)objc_msgSend(v57, "metric");
                v60 = v57;

                obja = v60;
              }
              v25 = v79;
              v27 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
          }
          while (v53);

          v42 = v73;
          v61 = obja;
          if (obja)
          {
            v16 = v70;
            v24 = v71;
            v15 = v72;
            if (a9 > 1u)
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
              {
                v65 = sub_1000B093C();
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "neighbor"));
                _NRLogWithArgs(v65, 1, "%s%.30s:%-4d responding to seqno req by maybe sending to %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3201, v66);

                v61 = obja;
              }
              -[NRBabelInstance sendSeqnoReqIfNecessaryTo:forPrefix:routerID:seqno:hopCount:originator:](v75, "sendSeqnoReqIfNecessaryTo:forPrefix:routerID:seqno:hopCount:originator:", v61, v70, a7, v9, (a9 - 1), v76);
            }
            else
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
              {
                v62 = sub_1000B093C();
                _NRLogWithArgs(v62, 16, "%s%.30s:%-4d received seqno req with dead hop count %u", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3197, a9);

              }
            }
            goto LABEL_96;
          }
        }
        else
        {

        }
        v63 = *(_QWORD *)&v27[25].cb;
        v24 = v71;
        v15 = v72;
        v16 = v70;
        if (v63 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          v64 = (id)qword_1001E4740;
          _NRLogWithArgs(v64, 1, "%s%.30s:%-4d not responding to seqno req since selected routes come from originator", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3190);

        }
        v61 = 0;
        goto LABEL_96;
      }
      ++v75->_nodeSeqno;
      v45 = *(_QWORD *)&v27[25].cb;
      v15 = v72;
      if (v45 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v16 = v70;
      v24 = v71;
      if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        v46 = (id)qword_1001E4740;
        nodeSeqno = v75->_nodeSeqno;
        if (objc_msgSend(v73, "count") == (id)1)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndexedSubscript:", 0));
          _NRLogWithArgs(v46, 1, "%s%.30s:%-4d responding to seqno req for %u by increasing seqno to %u and sending %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3170, v9, nodeSeqno, v48);

        }
        else
        {
          _NRLogWithArgs(v46, 1, "%s%.30s:%-4d responding to seqno req for %u by increasing seqno to %u and sending %@", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3170, v9, nodeSeqno, v73);
        }

      }
      v49 = v75;
      v50 = v73;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVsForRoutes:](v49, "createUpdateTLVsForRoutes:", v50));
    objc_msgSend(v76, "sendTLVs:", v61);
LABEL_96:

    goto LABEL_97;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d not responding to seqno req since we have no selected routes", ", "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]", 3143);
  }
LABEL_97:

}

- (void)updateRoutes
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *j;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  unsigned __int16 v20;
  void *k;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  char v29;
  uint64_t v30;
  void *m;
  void *v32;
  unsigned int v33;
  id v34;
  int v35;
  const char *v36;
  NSMutableArray *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *n;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *ii;
  void *v49;
  id obj;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  NRBabelInstance *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v55 = self;
  v4 = self->_routes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bPrefix"));
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bPrefix"));
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    }
    while (v6);
  }

  v56 = objc_alloc_init((Class)NSMutableArray);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v3;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v74 != v51)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v16 = v55->_routes;
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
        if (v17)
        {
          v18 = v17;
          v53 = j;
          v14 = 0;
          v19 = *(_QWORD *)v70;
          v20 = -1;
          do
          {
            for (k = 0; k != v18; k = (char *)k + 1)
            {
              if (*(_QWORD *)v70 != v19)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)k);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bPrefix"));
              v24 = objc_msgSend(v15, "isContainedInPrefix:", v23);

              if (v24 && objc_msgSend(v22, "metric") < v20)
              {
                v25 = v22;

                v20 = (unsigned __int16)objc_msgSend(v25, "metric");
                v14 = v25;
              }
            }
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
          }
          while (v18);

          if (v14)
          {
            j = v53;
            if ((objc_msgSend(v56, "containsObject:", v14) & 1) == 0)
              objc_msgSend(v56, "addObject:", v14);
          }
          else
          {
            j = v53;
          }
        }
        else
        {

          v14 = 0;
        }

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    }
    while (v52);
  }

  v54 = objc_alloc_init((Class)NSMutableArray);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v26 = v55->_routes;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v66;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(_QWORD *)v66 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)m);
        v33 = objc_msgSend(v32, "selected");
        v34 = objc_msgSend(v56, "containsObject:", v32);
        if (v33 != (_DWORD)v34)
        {
          v35 = (int)v34;
          objc_msgSend(v32, "setSelected:", v34);
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            v36 = "un";
            if (v35)
              v36 = "";
            _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d %@%sselecting route %@", ", "-[NRBabelInstance updateRoutes]", 3256, v55, v36, v32);
          }
          if (v35)
            objc_msgSend(v54, "addObject:", v32);
          v29 = 1;
        }
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v37 = v55->_routes;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v62;
    do
    {
      for (n = 0; n != v39; n = (char *)n + 1)
      {
        if (*(_QWORD *)v62 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)n);
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
        {
          if (qword_1001E4748 != -1)
            dispatch_once(&qword_1001E4748, &stru_1001B7158);
          _NRLogWithArgs(qword_1001E4740, 1, "%s%.30s:%-4d adding %@", ", "-[NRBabelInstance updateRoutes]", 3278, v42);
        }
        objc_msgSend(v42, "applyUsingSystem");
      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
    }
    while (v39);
  }

  if ((v29 & 1) != 0)
  {
    v43 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v55->_posrs);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v58;
      do
      {
        for (ii = 0; ii != v46; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)ii), "cancelIfRouteUnselected");
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
      }
      while (v46);
    }

    -[NRBabelInstance sendImmediateRouteUpdateToAllNeighbors](v55, "sendImmediateRouteUpdateToAllNeighbors");
    v49 = v56;
  }
  else
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v49 = v56;
    if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d no route changed", ", "-[NRBabelInstance updateRoutes]", 3289);
    }
  }

}

- (void)addRouterID:(unint64_t)a3 toTLVs:(id)a4
{
  id v4;
  id v5;
  int v6;
  unint64_t v7;

  v6 = 2566;
  v7 = a3;
  v4 = a4;
  v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v6, 12);
  objc_msgSend(v4, "addObject:", v5);

}

- (void)addUpdateForRoute:(id)a3 interval:(unsigned __int16)a4 toTLVs:(id)a5
{
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  __int128 v18;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v18 = 0uLL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bPrefix"));
  objc_msgSend(v9, "writePrefix:", &v18);

  if ((_DWORD)v18 || *(_QWORD *)((char *)&v18 + 4) != 0xFFFF000000000000)
  {
    LODWORD(v17) = 0;
    v13 = 8;
    HIWORD(v13) = __rev16(v6);
    v14 = __rev16(objc_msgSend(v7, "seqno", v13, 0, 0, v17));
    v15 = __rev16(objc_msgSend(v7, "metric"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bPrefix"));
    v11 = objc_msgSend(v10, "writeToAE:plen:prefix:", (char *)&v13 + 2, (char *)&v13 + 4, &v16);

    BYTE1(v13) = v11 + 10;
    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v13, (v11 + 10) + 2);
    objc_msgSend(v8, "addObject:", v12);

  }
}

- (id)createSelectedRoutesArrayForPrefix:(id)a3
{
  id v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  if (!objc_msgSend(v3, "plen"))
  {

    v3 = 0;
  }
  v4 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_routes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "selected"))
        {
          if (objc_msgSend(v10, "metric") == 0xFFFF)
          {
            if (qword_1001E4748 != -1)
              dispatch_once(&qword_1001E4748, &stru_1001B7158);
            if (_NRLogIsLevelEnabled(qword_1001E4740, 17))
            {
              if (qword_1001E4748 != -1)
                dispatch_once(&qword_1001E4748, &stru_1001B7158);
              _NRLogWithArgs(qword_1001E4740, 17, "%@ found invalid selected infinite route %@", self, v10);
            }
          }
          else if (!v3
                 || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bPrefix")),
                     v12 = objc_msgSend(v3, "isEqual:", v11),
                     v11,
                     v12))
          {
            objc_msgSend(v4, "addObject:", v10);
          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateFeasabilityDistanceForRoute:(id)a3
{
  void *v4;
  NRBabelSource *v5;
  NRBabelSource *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "metric") != 0xFFFF)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bPrefix"));
    v5 = -[NRBabelInstance copySourceWithPrefix:routerID:](self, "copySourceWithPrefix:routerID:", v4, objc_msgSend(v12, "routerID"));

    if (v5)
    {
      -[NRBabelSource updateFeasabilityDistanceWithSeqno:metric:](v5, "updateFeasabilityDistanceWithSeqno:metric:", objc_msgSend(v12, "seqno"), objc_msgSend(v12, "metric"));
    }
    else
    {
      v6 = [NRBabelSource alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bPrefix"));
      v8 = objc_msgSend(v12, "routerID");
      v9 = objc_msgSend(v12, "seqno");
      v10 = objc_msgSend(v12, "receivedMetric");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instance"));
      v5 = -[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:](v6, "initWithPrefix:routerID:seqno:metric:instance:", v7, v8, v9, v10, v11);

    }
    -[NRBabelSource resetGCTimer](v5, "resetGCTimer");

  }
}

- (id)createUpdateTLVsForRoutes:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v22;
  uint64_t v23;
  id v24;
  id obj;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v4 = a4;
  v6 = a3;
  v27 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init((Class)NSMutableArray);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "routerID")));
          if ((objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v7, "addObject:", v12);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v9);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v7;
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v22);
          v26 = v13;
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v13), "unsignedLongLongValue");
          -[NRBabelInstance addRouterID:toTLVs:](self, "addRouterID:toTLVs:", v14, v27);
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v15 = obj;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v20, "routerID") == v14)
                {
                  if (qword_1001E4748 != -1)
                    dispatch_once(&qword_1001E4748, &stru_1001B7158);
                  if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
                  {
                    if (qword_1001E4748 != -1)
                      dispatch_once(&qword_1001E4748, &stru_1001B7158);
                    _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d sending update for %@", ", "-[NRBabelInstance createUpdateTLVsForRoutes:interval:]", 3441, v20);
                  }
                  -[NRBabelInstance addUpdateForRoute:interval:toTLVs:](self, "addUpdateForRoute:interval:toTLVs:", v20, v4, v27);
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            }
            while (v17);
          }

          v13 = v26 + 1;
        }
        while ((id)(v26 + 1) != v24);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v24);
    }

  }
  return v27;
}

- (id)createUpdateTLVsForRoutes:(id)a3
{
  return -[NRBabelInstance createUpdateTLVsForRoutes:interval:](self, "createUpdateTLVsForRoutes:interval:", a3, 0xFFFFLL);
}

- (id)createUpdateTLVsForPrefix:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createSelectedRoutesArrayForPrefix:](self, "createSelectedRoutesArrayForPrefix:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVsForRoutes:interval:](self, "createUpdateTLVsForRoutes:interval:", v6, v4));

  return v7;
}

- (id)createUpdateTLVsForPrefix:(id)a3
{
  return -[NRBabelInstance createUpdateTLVsForPrefix:interval:](self, "createUpdateTLVsForPrefix:interval:", a3, 0xFFFFLL);
}

- (id)createUpdateTLVsWithInterval:(unsigned __int16)a3
{
  return -[NRBabelInstance createUpdateTLVsForPrefix:interval:](self, "createUpdateTLVsForPrefix:interval:", 0, a3);
}

- (id)createUpdateTLVs
{
  return -[NRBabelInstance createUpdateTLVsWithInterval:](self, "createUpdateTLVsWithInterval:", 0xFFFFLL);
}

- (void)sendImmediateRouteUpdateToNeighbor:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  id v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23 = v4;
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  }
  else
  {
    v6 = self->_neighbors;
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVs](self, "createUpdateTLVs"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = objc_alloc_init((Class)NSMutableArray);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createIHUTLV", (_QWORD)v18));
        objc_msgSend(v15, "addObject:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createPersonalHelloTLV"));
        objc_msgSend(v15, "addObject:", v17);

        objc_msgSend(v15, "addObjectsFromArray:", v8);
        objc_msgSend(v14, "sendTLVs:", v15);
        objc_msgSend(v14, "enqueueNextUpdate");
        objc_msgSend(v14, "enqueueNextIHU");

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)sendImmediateRouteUpdateToAllNeighbors
{
  -[NRBabelInstance sendImmediateRouteUpdateToNeighbor:](self, "sendImmediateRouteUpdateToNeighbor:", 0);
}

- (void)handlePacket:(const char *)a3 length:(unsigned int)a4 remoteAddr:(const in6_addr *)a5 localAddr:(const in6_addr *)a6 babelInterface:(id)a7 dtls:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v11;
  id v14;
  void *v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *IPv6AddrString;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NRBabelInstance *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __CFString *v36;
  unsigned int v37;
  id v38;
  __CFString *v39;
  id v40;
  int IsLevelEnabled;
  id v42;
  id v43;
  int v44;
  id v45;
  unsigned int v46;
  id v47;
  int v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  int v55;
  int v56;
  id v57;
  int v58;
  id v59;
  uint64_t v60;
  void *v61;
  int v62;
  void ***p_completion;
  unsigned int v64;
  int v65;
  char *v66;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  int v71;
  id v72;
  int v73;
  int v74;
  int v75;
  int v76;
  id v77;
  int v78;
  id v79;
  int v80;
  id v81;
  int v82;
  id v83;
  int v84;
  id v85;
  void ***v86;
  unsigned __int8 v87;
  id v88;
  int v89;
  id v90;
  id v91;
  int v92;
  id v93;
  int v94;
  id v95;
  int v96;
  id v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  int v103;
  id v104;
  int v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v117;
  uint64_t v118;
  id v119;
  id v120;
  NSObject *v121;
  NSObject *v122;
  id v123;
  id v124;
  __CFString *v125;
  id v126;
  int v127;
  id v128;
  int v129;
  id v130;
  int v131;
  id v132;
  int v133;
  id v134;
  int v135;
  id v136;
  int v137;
  id v138;
  int v139;
  id v140;
  int v141;
  id v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  const in6_addr *v149;
  unsigned int v150;
  uint64_t v151;
  char v152;
  NRBabelInstance *v153;
  id v154;
  uint64_t v155;
  char v156;
  in6_addr v157;
  _QWORD v158[2];
  _QWORD v159[2];
  in6_addr v160;
  void **completion;
  uint64_t v162;
  void (*v163)(uint64_t, void *);
  void *v164;
  uint64_t v165;

  v8 = a8;
  v11 = *(_QWORD *)&a4;
  v14 = a7;
  v15 = v14;
  if (v11 <= 3)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d %@packet too short len %u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3511, self, v11);
    }
    goto LABEL_212;
  }
  v16 = !v8;
  v17 = objc_msgSend(v14, "dtlsEnabled") & !v8;
  v18 = *((unsigned __int16 *)a3 + 1);
  v19 = __rev16(v18);
  if ((int)v19 + 2 > v11)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d %@Packet too short: bodyLen(%u) + 2 > packetLen(%u)", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3520, self, v19, v11);
      }
      goto LABEL_212;
    }
    goto LABEL_150;
  }
  v20 = *(unsigned __int8 *)a3;
  if ((_DWORD)v20 != 42)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
      {
        if (qword_1001E4748 != -1)
          dispatch_once(&qword_1001E4748, &stru_1001B7158);
        _NRLogWithArgs(qword_1001E4740, 16, "%s%.30s:%-4d %@Invalid magic number %u != %u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3527, self, v20, 42);
      }
      goto LABEL_212;
    }
LABEL_150:
    v116 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:](self, "copyNeighborWithAddr:babelInterface:isNewNeighbor:", a5, v15, 0);
    v117 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", a3, v11);
    v118 = objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "dtlsStack"));
    v119 = v117;
    if (v118)
    {
      *(_BYTE *)(v118 + 11) = 1;
      if (qword_1001E4A08 != -1)
        dispatch_once(&qword_1001E4A08, &stru_1001B8570);
      if (_NRLogIsLevelEnabled(qword_1001E4A00, 1))
      {
        if (qword_1001E4A08 != -1)
          dispatch_once(&qword_1001E4A08, &stru_1001B8570);
        v120 = (id)qword_1001E4A00;
        _NRLogWithArgs(v120, 1, "%s%.30s:%-4d %@ writing %llu inbound encrypted bytes into UDP", ", "-[NRDDTLSStack processInboundEncryptedData:]", 122, v118, objc_msgSend(v119, "length"));

      }
      v121 = *(id *)(v118 + 40);
      v122 = objc_msgSend(v119, "_createDispatchData");
      completion = _NSConcreteStackBlock;
      v162 = 3221225472;
      v163 = sub_100124FE0;
      v164 = &unk_1001B8410;
      v165 = v118;
      nw_connection_send(v121, v122, _nw_content_context_default_message, 0, &completion);

    }
    goto LABEL_212;
  }
  v21 = *((unsigned __int8 *)a3 + 1);
  if ((_DWORD)v21 != 2)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
      {
        v123 = sub_1000B093C();
        _NRLogWithArgs(v123, 16, "%s%.30s:%-4d %@Invalid Babel version number %u != %u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3534, self, v21, 2);

      }
      goto LABEL_212;
    }
    goto LABEL_150;
  }
  v153 = self;
  v150 = objc_msgSend(v15, "dtlsEnabled");
  v22 = objc_alloc((Class)NSMutableString);
  IPv6AddrString = (void *)createIPv6AddrString(a5, v23);
  v149 = a6;
  v26 = (void *)createIPv6AddrString(a6, v25);
  v154 = objc_msgSend(v22, "initWithFormat:", CFSTR("[%@] %@ > %@ Babel len(%u,%u)"), v15, IPv6AddrString, v26, v19, v11);

  completion = 0;
  v162 = 0;
  v160 = *a5;
  v159[0] = 0;
  v159[1] = 0;
  v158[0] = 0;
  v158[1] = 0;
  if (!v18)
  {
    v152 = 0;
    v30 = v153;
    goto LABEL_203;
  }
  v152 = 0;
  v27 = 0;
  v28 = (v19 + 4);
  v29 = 4;
  v30 = v153;
  v151 = v28;
  while (1)
  {
    v31 = &a3[v29];
    v32 = *(unsigned __int8 *)v31;
    if (*v31)
      break;
    objc_msgSend(v154, "appendString:", CFSTR("Pad1, "));
    v29 = (v29 + 1);
LABEL_21:
    if (v29 >= v28)
      goto LABEL_203;
  }
  v33 = v29 + 1;
  if (v33 >= v28)
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v124 = (id)qword_1001E4740;
      if (v32 >= 0x10)
        v125 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%u]"), v32);
      else
        v125 = off_1001B7178[(v32 - 1)];
      _NRLogWithArgs(v124, 16, "%s%.30s:%-4d %@TLV type %@ hanging off edge %u %u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3582, v30, v125, v29, v28);
LABEL_182:

    }
    goto LABEL_203;
  }
  v155 = v27;
  v34 = a3[v33];
  v35 = v32 - 1;
  if (v32 >= 0x10)
    v36 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%u]"), v32);
  else
    v36 = off_1001B7178[v35];
  objc_msgSend(v154, "appendFormat:", CFSTR("%@-%u "), v36, v34);

  v29 = (v29 + v34 + 2);
  v28 = v151;
  if (v29 <= v151)
  {
    if ((v32 - 9) > 1 || (v152 & 1) == 0)
    {
      v27 = v155;
      if ((_DWORD)v32 == 1)
        goto LABEL_78;
    }
    else
    {
      -[NRBabelInstance updateRoutes](v153, "updateRoutes");
      v152 = 0;
      v27 = v155;
    }
    v37 = v150;
    if ((v32 - 6) >= 0xFEu)
      v37 = 0;
    if ((v37 & v16) == 1)
    {
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      if (!_NRLogIsLevelEnabled(qword_1001E4740, 1))
      {
LABEL_78:
        v30 = v153;
        goto LABEL_21;
      }
      if (qword_1001E4748 != -1)
        dispatch_once(&qword_1001E4748, &stru_1001B7158);
      v38 = (id)qword_1001E4740;
      if ((v32 - 2) < 0xE && ((0x3FF3u >> (v32 - 2)) & 1) != 0)
        v39 = off_1001B71F0[(v32 - 2)];
      else
        v39 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%u]"), v32);
      v146 = v34;
      v30 = v153;
      _NRLogWithArgs(v38, 1, "%s%.30s:%-4d %@Ignoring unencrypted TLV %@-%u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3657, v153, v39, v146);

      goto LABEL_50;
    }
    switch((int)v32)
    {
      case 2:
        if (v34 > 5)
        {
          if ((sub_1000BF404((unsigned __int8 *)v31 + 8, (int)v34 - 6) & 1) != 0)
            goto LABEL_78;
          v40 = sub_1000B093C();
          IsLevelEnabled = _NRLogIsLevelEnabled(v40, 1);

          v30 = v153;
          if (IsLevelEnabled)
          {
            v42 = sub_1000B093C();
            _NRLogWithArgs(v42, 1, "%s%.30s:%-4d %@got AckReq for nonce %#x", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3661, v153, bswap32(*((unsigned __int16 *)v31 + 2)) >> 16);

          }
          -[NRBabelInstance handleAckReqFromAddr:babelInterface:nonce:interval:](v153, "handleAckReqFromAddr:babelInterface:nonce:interval:", a5, v15, bswap32(*((unsigned __int16 *)v31 + 2)) >> 16, bswap32(*((unsigned __int16 *)v31 + 3)) >> 16);
          goto LABEL_50;
        }
        v126 = sub_1000B093C();
        v127 = _NRLogIsLevelEnabled(v126, 16);

        if (!v127)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("AckReq");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3666, v34, 6, CFSTR("AckReq"));
        break;
      case 3:
        if (v34 > 1)
        {
          if ((sub_1000BF404((unsigned __int8 *)v31 + 4, (int)v34 - 2) & 1) != 0)
            goto LABEL_78;
          v43 = sub_1000B093C();
          v44 = _NRLogIsLevelEnabled(v43, 16);

          v30 = v153;
          if (!v44)
            goto LABEL_50;
          v45 = sub_1000B093C();
          _NRLogWithArgs(v45, 16, "%s%.30s:%-4d %@got Ack for nonce %#x", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3668, v153, bswap32(*((unsigned __int16 *)v31 + 1)) >> 16);
          goto LABEL_132;
        }
        v128 = sub_1000B093C();
        v129 = _NRLogIsLevelEnabled(v128, 16);

        if (!v129)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("Ack");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3670, v34, 2, CFSTR("Ack"));
        break;
      case 4:
        if (v34 > 5)
        {
          if ((sub_1000BF404((unsigned __int8 *)v31 + 8, (int)v34 - 6) & 1) != 0)
            goto LABEL_78;
          v46 = v31[2];
          v30 = v153;
          if ((v46 & 0x80000000) == 0 || (objc_msgSend(v15, "isLocalAddressEqualTo:", v149) & 1) != 0)
            goto LABEL_63;
          v47 = sub_1000B093C();
          v48 = _NRLogIsLevelEnabled(v47, 1);

          if (v48)
          {
            v49 = sub_1000B093C();
            v51 = (void *)createIPv6AddrString(a5, v50);
            v53 = (void *)createIPv6AddrString(v149, v52);
            _NRLogWithArgs(v49, 1, "%s%.30s:%-4d %@rechecking local address due to invalid personal Hello on %@ from %@ to %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3676, v153, v15, v51, v53);

            v30 = v153;
          }
          v28 = v151;
          v27 = v155;
          if ((objc_msgSend(v15, "setupLocalAddressCheckAgainst:", v149) & 1) != 0)
          {
LABEL_63:
            -[NRBabelInstance handleHelloFromAddr:babelInterface:seqno:interval:personal:](v30, "handleHelloFromAddr:babelInterface:seqno:interval:personal:", a5, v15, bswap32(*((unsigned __int16 *)v31 + 2)) >> 16, bswap32(*((unsigned __int16 *)v31 + 3)) >> 16, (v46 >> 7) & 1);
            goto LABEL_21;
          }
          v111 = sub_1000B093C();
          v112 = _NRLogIsLevelEnabled(v111, 16);

          if (!v112)
            goto LABEL_50;
          v106 = sub_1000B093C();
          v108 = (void *)createIPv6AddrString(a5, v113);
          v115 = (void *)createIPv6AddrString(v149, v114);
          _NRLogWithArgs(v106, 16, "%s%.30s:%-4d %@ignoring invalid personal Hello on %@ from %@ to %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3679, v153, v15, v108, v115);

          v30 = v153;
          goto LABEL_141;
        }
        v130 = sub_1000B093C();
        v131 = _NRLogIsLevelEnabled(v130, 16);

        if (!v131)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("Hello");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3689, v34, 6, CFSTR("Hello"));
        break;
      case 5:
        if (v34 > 5)
        {
          v54 = *((unsigned __int8 *)v31 + 2);
          if (v31[2])
          {
            v157 = *v149;
            v55 = sub_1000BF6E4(&v157, v54, (void *)(v31 + 8), (int)v34 - 6, 0, 0, 0);
            if (v55 < 0)
            {
              v88 = sub_1000B093C();
              v89 = _NRLogIsLevelEnabled(v88, 16);

              v30 = v153;
              v28 = v151;
              if (v89)
              {
                v90 = sub_1000B093C();
                _NRLogWithArgs(v90, 16, "%s%.30s:%-4d %@failed to decompress IHU", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3707, v153);

              }
            }
            else
            {
              v56 = v55;
              if ((objc_msgSend(v15, "isLocalAddressEqualTo:", &v157) & 1) != 0)
                goto LABEL_126;
              v57 = sub_1000B093C();
              v58 = _NRLogIsLevelEnabled(v57, 2);

              v30 = v153;
              v28 = v151;
              if (v58)
              {
                v59 = sub_1000B093C();
                v61 = (void *)createIPv6AddrString(&v157, v60);
                _NRLogWithArgs(v59, 2, "%s%.30s:%-4d %@ignoring IHU for other destination %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3711, v153, v61);

                v28 = v151;
              }
            }
            goto LABEL_51;
          }
          if ((objc_msgSend(v15, "isLocalAddressEqualTo:", v149) & 1) != 0)
          {
            v56 = 0;
LABEL_126:
            if ((sub_1000BF404((unsigned __int8 *)&v31[v56 + 8], (int)v34 - v56 - 6) & 1) != 0)
            {
              v30 = v153;
            }
            else
            {
              v30 = v153;
              -[NRBabelInstance handleIHUFromAddr:babelInterface:rxcost:interval:](v153, "handleIHUFromAddr:babelInterface:rxcost:interval:", a5, v15, bswap32(*((unsigned __int16 *)v31 + 2)) >> 16, bswap32(*((unsigned __int16 *)v31 + 3)) >> 16);
            }
            v28 = v151;
            goto LABEL_21;
          }
          v95 = sub_1000B093C();
          v96 = _NRLogIsLevelEnabled(v95, 1);

          if (v96)
          {
            v97 = sub_1000B093C();
            v99 = (void *)createIPv6AddrString(a5, v98);
            v101 = (void *)createIPv6AddrString(v149, v100);
            _NRLogWithArgs(v97, 1, "%s%.30s:%-4d %@rechecking local address due to invalid IHU with AE 0 on %@ from %@ to %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3694, v153, v15, v99, v101);

          }
          if ((objc_msgSend(v15, "setupLocalAddressCheckAgainst:", v149) & 1) != 0)
          {
            v56 = 0;
            v27 = v155;
            goto LABEL_126;
          }
          v104 = sub_1000B093C();
          v105 = _NRLogIsLevelEnabled(v104, 16);

          if (v105)
          {
            v106 = sub_1000B093C();
            v108 = (void *)createIPv6AddrString(a5, v107);
            v110 = (void *)createIPv6AddrString(v149, v109);
            _NRLogWithArgs(v106, 16, "%s%.30s:%-4d %@ignoring invalid IHU with AE 0 on %@ from %@ to %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3697, v153, v15, v108, v110);

            v30 = v153;
LABEL_141:

            goto LABEL_50;
          }
LABEL_138:
          v30 = v153;
          goto LABEL_50;
        }
        v132 = sub_1000B093C();
        v133 = _NRLogIsLevelEnabled(v132, 16);

        if (!v133)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("IHU");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3720, v34, 6, CFSTR("IHU"));
        break;
      case 6:
        if (v34 > 9)
        {
          v27 = *(_QWORD *)(v31 + 4);
          v30 = v153;
          goto LABEL_21;
        }
        v134 = sub_1000B093C();
        v135 = _NRLogIsLevelEnabled(v134, 16);

        if (!v135)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("RouterID");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3722, v34, 10, CFSTR("RouterID"));
        break;
      case 7:
        if (v34 > 1)
        {
          v62 = *((unsigned __int8 *)v31 + 2);
          if (v31[2])
          {
            if (v62 == 1)
              p_completion = &completion;
            else
              p_completion = (void ***)&v160;
            if ((sub_1000BF6E4(p_completion, v62, (void *)(v31 + 4), (int)v34 - 2, 0, 0, 0) & 0x80000000) == 0)
              goto LABEL_78;
            v91 = sub_1000B093C();
            v92 = _NRLogIsLevelEnabled(v91, 16);

            v30 = v153;
            if (!v92)
              goto LABEL_50;
            v45 = sub_1000B093C();
            _NRLogWithArgs(v45, 16, "%s%.30s:%-4d %@failed to decompress NextHop", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3735, v153, v145);
            goto LABEL_132;
          }
          v77 = sub_1000B093C();
          v78 = _NRLogIsLevelEnabled(v77, 16);

          v30 = v153;
          if (v78)
          {
            v45 = sub_1000B093C();
            _NRLogWithArgs(v45, 16, "%s%.30s:%-4d Received invalid NextHop with AE=0");
            goto LABEL_132;
          }
          goto LABEL_50;
        }
        v136 = sub_1000B093C();
        v137 = _NRLogIsLevelEnabled(v136, 16);

        if (!v137)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("NextHop");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3739, v34, 2, CFSTR("NextHop"));
        break;
      case 8:
        if (v34 > 9)
        {
          v64 = v34 - 10;
          v156 = v31[4];
          v157 = (in6_addr)0;
          v65 = *((unsigned __int8 *)v31 + 2);
          if (v65 == 1)
            v66 = (char *)v159;
          else
            v66 = (char *)v158;
          v67 = sub_1000BF6E4(&v157, v65, (void *)(v31 + 12), v64, *((unsigned __int8 *)v31 + 5), v66, (unsigned __int8 *)&v156);
          if ((v67 & 0x80000000) == 0)
          {
            v148 = *((unsigned __int8 *)v31 + 2);
            v68 = v155;
            if ((v31[3] & 0x40) != 0)
              v68 = *(_QWORD *)&v157.__u6_addr32[2];
            if ((sub_1000BF404((unsigned __int8 *)&v31[v67 + 12], v64 - v67) & 1) != 0)
            {
              v30 = v153;
              v28 = v151;
              v27 = v68;
              goto LABEL_21;
            }
            if (v148 == 1)
              v86 = &completion;
            else
              v86 = (void ***)&v160;
            BYTE6(v144) = v31[2];
            WORD2(v144) = bswap32(*((unsigned __int16 *)v31 + 5)) >> 16;
            WORD1(v144) = bswap32(*((unsigned __int16 *)v31 + 3)) >> 16;
            LOWORD(v144) = bswap32(*((unsigned __int16 *)v31 + 4)) >> 16;
            v30 = v153;
            v155 = v68;
            v87 = -[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:](v153, "handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:", a5, &v157, v156, v86, v15, v68, v144);
            v28 = v151;
            if (v31[3] < 0)
              *(in6_addr *)v66 = v157;
            v152 |= v87;
            goto LABEL_51;
          }
          v79 = sub_1000B093C();
          v80 = _NRLogIsLevelEnabled(v79, 16);

          v30 = v153;
          if (!v80)
            goto LABEL_50;
          v45 = sub_1000B093C();
          _NRLogWithArgs(v45, 16, "%s%.30s:%-4d %@failed to decompress Update", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3750, v153, v145);
          goto LABEL_132;
        }
        v138 = sub_1000B093C();
        v139 = _NRLogIsLevelEnabled(v138, 16);

        if (!v139)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("Update");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3793, v34, 10, CFSTR("Update"));
        break;
      case 9:
        if (v34 > 1)
        {
          v69 = v34 - 2;
          v70 = *((unsigned __int8 *)v31 + 2);
          if (v31[2])
          {
            v156 = v31[3];
            v157 = (in6_addr)0;
            v71 = sub_1000BF6E4(&v157, v70, (void *)(v31 + 4), (int)v34 - 2, 0, 0, (unsigned __int8 *)&v156);
            v30 = v153;
            if (v71 < 0)
            {
              v72 = sub_1000B093C();
              v73 = _NRLogIsLevelEnabled(v72, 16);

              if (v73)
              {
                v45 = sub_1000B093C();
                _NRLogWithArgs(v45, 16, "%s%.30s:%-4d %@failed to decompress RouteReq", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3804, v153, v145);
LABEL_132:

              }
LABEL_50:
              v28 = v151;
LABEL_51:
              v27 = v155;
              goto LABEL_21;
            }
          }
          else
          {
            v30 = v153;
            if (v31[3])
            {
              v81 = sub_1000B093C();
              v82 = _NRLogIsLevelEnabled(v81, 16);

              if (v82)
              {
                v45 = sub_1000B093C();
                _NRLogWithArgs(v45, 16, "%s%.30s:%-4d Received invalid RouteReq with AE=0 and plen=%u");
                goto LABEL_132;
              }
              goto LABEL_50;
            }
            v71 = 0;
            v156 = 0;
            v157 = (in6_addr)0;
          }
          if ((sub_1000BF404((unsigned __int8 *)&v31[v71 + 4], v69 - v71) & 1) == 0)
            -[NRBabelInstance handleRouteReqFromAddr:babelInterface:ForPrefix:plen:](v30, "handleRouteReqFromAddr:babelInterface:ForPrefix:plen:", a5, v15, &v157, v156);
          goto LABEL_51;
        }
        v140 = sub_1000B093C();
        v141 = _NRLogIsLevelEnabled(v140, 16);

        if (!v141)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("RouteReq");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3809, v34, 2, CFSTR("RouteReq"));
        break;
      case 10:
        if (v34 > 0xD)
        {
          v74 = *((unsigned __int8 *)v31 + 2);
          if (v31[2])
          {
            if (v31[6])
            {
              v75 = v34 - 14;
              v156 = v31[3];
              v157 = (in6_addr)0;
              v76 = sub_1000BF6E4(&v157, v74, (void *)(v31 + 16), (int)v34 - 14, 0, 0, (unsigned __int8 *)&v156);
              if ((v76 & 0x80000000) == 0)
              {
                v30 = v153;
                if ((sub_1000BF404((unsigned __int8 *)&v31[v76 + 16], v75 - v76) & 1) == 0)
                {
                  LOBYTE(v144) = v31[6];
                  -[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:](v153, "handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:", a5, v15, &v157, v156, *((_QWORD *)v31 + 1), bswap32(*((unsigned __int16 *)v31 + 2)) >> 16, v144);
                }
                goto LABEL_50;
              }
              v102 = sub_1000B093C();
              v103 = _NRLogIsLevelEnabled(v102, 16);

              v30 = v153;
              if (v103)
              {
                v45 = sub_1000B093C();
                _NRLogWithArgs(v45, 16, "%s%.30s:%-4d %@failed to decompress SeqnoReq", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3824, v153, v145);
                goto LABEL_132;
              }
            }
            else
            {
              v93 = sub_1000B093C();
              v94 = _NRLogIsLevelEnabled(v93, 16);

              v30 = v153;
              if (v94)
              {
                v45 = sub_1000B093C();
                _NRLogWithArgs(v45, 16, "%s%.30s:%-4d Received invalid SeqnoReq with HopCount=0");
                goto LABEL_132;
              }
            }
          }
          else
          {
            v83 = sub_1000B093C();
            v84 = _NRLogIsLevelEnabled(v83, 16);

            if (!v84)
              goto LABEL_138;
            v85 = sub_1000B093C();
            _NRLogWithArgs(v85, 16, "%s%.30s:%-4d Received invalid SeqnoReq with AE=0", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3812);

            v30 = v153;
          }
          goto LABEL_50;
        }
        v142 = sub_1000B093C();
        v143 = _NRLogIsLevelEnabled(v142, 16);

        if (!v143)
          goto LABEL_202;
        v124 = sub_1000B093C();
        v125 = CFSTR("SeqnoReq");
        _NRLogWithArgs(v124, 16, "%s%.30s:%-4d insufficient TLV length %u < %u for type %@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3837, v34, 14, CFSTR("SeqnoReq"));
        break;
      default:
        goto LABEL_78;
    }
    v30 = v153;
    goto LABEL_182;
  }
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 16))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v124 = (id)qword_1001E4740;
    if (v32 >= 0x10)
      v125 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown[%u]"), v32);
    else
      v125 = off_1001B7178[v35];
    v147 = v34;
    v30 = v153;
    _NRLogWithArgs(v124, 16, "%s%.30s:%-4d %@TLV type %@ + len %u hanging off edge %u > %u", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3594, v153, v125, v147, v29, v151);
    goto LABEL_182;
  }
LABEL_202:
  v30 = v153;
LABEL_203:
  if (qword_1001E4748 != -1)
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 2))
  {
    if (qword_1001E4748 != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    _NRLogWithArgs(qword_1001E4740, 2, "%s%.30s:%-4d %@%@", ", "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]", 3840, v30, v154);
  }
  if ((v152 & 1) != 0)
    -[NRBabelInstance updateRoutes](v30, "updateRoutes");

LABEL_212:
}

- (id)description
{
  id v3;
  unint64_t routerID;
  unint64_t v5;
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = objc_alloc((Class)NSString);
  routerID = self->_routerID;
  v5 = bswap64(routerID);
  if (v5 > 0xFFFE)
  {
    v7 = objc_alloc((Class)NSString);
    v8 = bswap32(routerID);
    v6 = objc_msgSend(v7, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v8), (unsigned __int16)v8, bswap32(HIDWORD(routerID)) >> 16, __rev16(HIWORD(routerID)));
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v5, v12, v13, v14);
  }
  v9 = v6;
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRBabelInstance %@"), v6);

  return v10;
}

- (id)copyRouteString
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];

  -[NRBabelInstance setupInterfaces](self, "setupInterfaces");
  -[NRBabelInstance updateRoutes](self, "updateRoutes");
  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("%@\nInterfaces\n"), self);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance interfaces](self, "interfaces"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("Neighbors\n"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance neighbors](self, "neighbors"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("Routes\n"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance routes](self, "routes"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v18));
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unsigned)nodeSeqno
{
  return self->_nodeSeqno;
}

- (void)setNodeSeqno:(unsigned __int16)a3
{
  self->_nodeSeqno = a3;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_routerID = a3;
}

- (NSMutableArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_interfaces, a3);
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_neighbors, a3);
}

- (NSMutableArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_routes, a3);
}

- (NSMutableArray)posrs
{
  return self->_posrs;
}

- (void)setPosrs:(id)a3
{
  objc_storeStrong((id *)&self->_posrs, a3);
}

- (OS_nw_path_evaluator)ifBringupPathEvaluator
{
  return self->_ifBringupPathEvaluator;
}

- (void)setIfBringupPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_ifBringupPathEvaluator, a3);
}

- (NEVirtualInterface_s)nevi
{
  return self->_nevi;
}

- (void)setNevi:(NEVirtualInterface_s *)a3
{
  self->_nevi = a3;
}

- (NSString)addrStr
{
  return self->_addrStr;
}

- (void)setAddrStr:(id)a3
{
  objc_storeStrong((id *)&self->_addrStr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addrStr, 0);
  objc_storeStrong((id *)&self->_ifBringupPathEvaluator, 0);
  objc_storeStrong((id *)&self->_posrs, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
