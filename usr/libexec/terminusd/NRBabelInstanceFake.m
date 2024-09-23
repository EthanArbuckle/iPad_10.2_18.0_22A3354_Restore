@implementation NRBabelInstanceFake

- (NRBabelInstanceFake)initWithName:(id)a3
{
  NSString **p_name;
  __objc2_prot *v4;
  id v6;
  NRBabelInstanceFake *v7;
  NRBabelInstanceFake *v8;
  unint64_t v9;
  NSString *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  unsigned int v19;
  void *v20;
  id v22;
  int IsLevelEnabled;
  id v24;
  int *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  objc_super v29;

  v4 = (__objc2_prot *)a3;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NRBabelInstanceFake;
  v7 = -[NRBabelInstance init](&v29, "init");
  if (!v7)
  {
    v22 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v22, 16);

    if (IsLevelEnabled)
    {
      v24 = sub_1000B093C();
      _NRLogWithArgs(v24, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelInstanceFake initWithName:]", 3978);

    }
    v6 = (id)_os_log_pack_size(12);
    v8 = (NRBabelInstanceFake *)((char *)&v28 - ((__chkstk_darwin(v6) + 15) & 0xFFFFFFFFFFFFFFF0));
    v25 = __error();
    v26 = _os_log_pack_fill(v8, v6, *v25, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v26 = 136446210;
    *(_QWORD *)(v26 + 4) = "-[NRBabelInstanceFake initWithName:]";
    v27 = sub_1000B093C();
    _NRLogAbortWithPack(v27, v8);
    goto LABEL_16;
  }
  v8 = v7;
  p_name = &v7->_name;
  objc_storeStrong((id *)&v7->_name, v4);
  do
    v9 = __ldxr(&qword_1001E3BD0);
  while (__stxr(v9 + 1, &qword_1001E3BD0));
  -[NRBabelInstance setRouterID:](v8, "setRouterID:", bswap64(v9));
  -[NRBabelInstance setNodeSeqno:](v8, "setNodeSeqno:", 0);
  v4 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (qword_1001E4748 != -1)
LABEL_16:
    dispatch_once(&qword_1001E4748, &stru_1001B7158);
  if (_NRLogIsLevelEnabled(qword_1001E4740, 1))
  {
    if (*(_QWORD *)&v4[25].cb != -1)
      dispatch_once(&qword_1001E4748, &stru_1001B7158);
    v10 = *p_name;
    v11 = (id)qword_1001E4740;
    v12 = -[NRBabelInstance routerID](v8, "routerID");
    v13 = bswap64(v12);
    if (v13 > 0xFFFE)
    {
      v15 = v12;
      v16 = HIWORD(v12);
      v17 = HIDWORD(v12);
      v18 = objc_alloc((Class)NSString);
      v19 = bswap32(v15);
      v14 = objc_msgSend(v18, "initWithFormat:", CFSTR("<%x:%x:%x:%x>"), HIWORD(v19), (unsigned __int16)v19, bswap32(v17) >> 16, __rev16(v16));
    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%llx>"), v13);
    }
    v20 = v14;
    _NRLogWithArgs(v11, 1, "%s%.30s:%-4d created fake instance %@ with routerID %@", ", "-[NRBabelInstanceFake initWithName:]", 3984, v10, v14);

  }
  return v8;
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("{%@} "), self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
