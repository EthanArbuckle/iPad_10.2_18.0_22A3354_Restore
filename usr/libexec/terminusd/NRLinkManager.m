@implementation NRLinkManager

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  NSObject *v7;
  id v8;
  NRLinkManager *v9;
  id *p_isa;
  NRLinkManager *v11;
  id v13;
  int IsLevelEnabled;
  id v15;
  id v16;
  int v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v13 = sub_1000CA734();
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17);

    if (IsLevelEnabled)
    {
      v15 = sub_1000CA734();
      _NRLogWithArgs(v15, 17, "%s called with null queue");
LABEL_10:

      v11 = 0;
      goto LABEL_5;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_5;
  }
  dispatch_assert_queue_V2(v7);
  if (!v8)
  {
    v16 = sub_1000CA734();
    v17 = _NRLogIsLevelEnabled(v16, 17);

    if (v17)
    {
      v15 = sub_1000CA734();
      _NRLogWithArgs(v15, 17, "%s called with null managerDelegate");
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)NRLinkManager;
  v9 = -[NRLinkManager init](&v27, "init");
  if (!v9)
  {
    v18 = sub_1000CA734();
    v19 = _NRLogIsLevelEnabled(v18, 16);

    if (v19)
    {
      v20 = sub_1000CA734();
      _NRLogWithArgs(v20, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRLinkManager initManagerWithQueue:managerDelegate:]", 19);

    }
    v21 = _os_log_pack_size(12);
    v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = __error();
    v24 = _os_log_pack_fill(v22, v21, *v23, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v24 = 136446210;
    *(_QWORD *)(v24 + 4) = "-[NRLinkManager initManagerWithQueue:managerDelegate:]";
    v25 = sub_1000CA734();
    _NRLogAbortWithPack(v25, v22);
  }
  p_isa = (id *)&v9->super.isa;
  v9->_type = 0;
  v9->_state = 1001;
  objc_storeWeak((id *)&v9->_managerDelegate, v8);
  objc_storeStrong(p_isa + 3, a3);
  self = p_isa;
  v11 = self;
LABEL_5:

  return v11;
}

- (id)copyStatusString
{
  return CFSTR("No status");
}

- (id)copyName
{
  return 0;
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[NRLinkManager copyName](self, "copyName");
  sub_100121E18(0, a3, v7, v6);

}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
  -[NRLinkManager reportEvent:details:](self, "reportEvent:details:", *(_QWORD *)&a3, 0);
}

- (void)invalidateManager
{
  objc_storeWeak((id *)&self->_managerDelegate, 0);
}

- (BOOL)shouldCreateLinkForNRUUID:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (self)
  {
    if (self->_type)
    {
      v5 = sub_10012FFF4((uint64_t)NRDLocalDevice, v4);
      v6 = v5;
      if (v5)
        v7 = (void *)*((_QWORD *)v5 + 16);
      else
        v7 = 0;
      v8 = v7;

      if (v8)
      {
        if (v6)
          v9 = (void *)*((_QWORD *)v6 + 16);
        else
          v9 = 0;
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allowedLinkTypes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_type));
        LOBYTE(self) = objc_msgSend(v11, "containsObject:", v12);

      }
      else
      {
        LOBYTE(self) = 1;
      }

    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)endpointsAreCompatible:(id)a3 remoteEndpoint:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  _BYTE *v13;
  _BYTE *v14;
  _BOOL4 v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "addressFamily");
  if (v7 != objc_msgSend(v6, "addressFamily"))
    goto LABEL_3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostname"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostname"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
    goto LABEL_3;
  v13 = objc_msgSend(v5, "address");
  v14 = objc_msgSend(v6, "address");
  if (objc_msgSend(v5, "addressFamily") != (id)2)
  {
    if (objc_msgSend(v5, "addressFamily") == (id)30)
    {
      v15 = v13[8] == 254 && (v13[9] & 0xC0) == 128;
      if (v14[8] == 254)
      {
        if (v15 == ((v14[9] & 0xC0) == 128))
          goto LABEL_16;
        goto LABEL_3;
      }
      if (v15)
        goto LABEL_3;
    }
LABEL_16:
    v11 = 1;
    goto LABEL_4;
  }
  if ((*((__int16 *)v13 + 2) != -343) != (*((__int16 *)v14 + 2) == -343))
    goto LABEL_16;
LABEL_3:
  v11 = 0;
LABEL_4:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_managerDelegate);
}

@end
