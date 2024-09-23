@implementation NRBluetoothPairer

- (NRBluetoothPairer)initWithNRUUID:(id)a3
{
  __objc2_prot *v3;
  id v5;
  NRBluetoothPairer *v6;
  NRBluetoothPairer *v7;
  unint64_t v8;
  NRBluetoothPairer *v9;
  id v11;
  int IsLevelEnabled;
  id v13;
  int *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  objc_super v18;

  v3 = (__objc2_prot *)a3;
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NRBluetoothPairer;
  v6 = -[NRBluetoothPairer init](&v18, "init");
  if (!v6)
  {
    v11 = sub_100018DE8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16);

    if (IsLevelEnabled)
    {
      v13 = sub_100018DE8();
      _NRLogWithArgs(v13, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBluetoothPairer initWithNRUUID:]", 45);

    }
    v5 = (id)_os_log_pack_size(12);
    v7 = (NRBluetoothPairer *)((char *)&v17 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0));
    v14 = __error();
    v15 = _os_log_pack_fill(v7, v5, *v14, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v15 = 136446210;
    *(_QWORD *)(v15 + 4) = "-[NRBluetoothPairer initWithNRUUID:]";
    v16 = sub_100018DE8();
    _NRLogAbortWithPack(v16, v7);
LABEL_15:
    dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    goto LABEL_5;
  }
  v7 = v6;
  if (!_NRIsAppleInternal(v6))
  {
    v9 = 0;
    goto LABEL_11;
  }
  do
    v8 = __ldxr(&qword_1001E38F0);
  while (__stxr(v8 + 1, &qword_1001E38F0));
  v7->_identifier = v8;
  objc_storeStrong((id *)&v7->_nrUUID, v3);
  v3 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
  if (qword_1001E4548 != -1)
    goto LABEL_15;
LABEL_5:
  if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
  {
    if (v3[18].inst_props != (__objc2_prop_list *)-1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d created: %@", ", "-[NRBluetoothPairer initWithNRUUID:]", 52, v7);
  }
  v9 = v7;
LABEL_11:

  return v9;
}

- (id)description
{
  id v3;
  unint64_t identifier;
  unsigned int v5;
  const char *v6;

  v3 = objc_alloc((Class)NSString);
  identifier = self->_identifier;
  v5 = -[NRBluetoothPairer isUnpairRequest](self, "isUnpairRequest");
  v6 = "pairing";
  if (v5)
    v6 = "unpairing";
  return objc_msgSend(v3, "initWithFormat:", CFSTR("NRBTPairer[%llu %s %@]"), identifier, v6, self->_nrUUID);
}

- (void)dealloc
{
  objc_super v3;

  if (qword_1001E4548 != -1)
    dispatch_once(&qword_1001E4548, &stru_1001B62D0);
  if (_NRLogIsLevelEnabled(qword_1001E4540, 1))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    _NRLogWithArgs(qword_1001E4540, 1, "%s%.30s:%-4d dealloc: %@", ", "-[NRBluetoothPairer dealloc]", 64, self);
  }
  v3.receiver = self;
  v3.super_class = (Class)NRBluetoothPairer;
  -[NRBluetoothPairer dealloc](&v3, "dealloc");
}

- (void)pairWithParameters:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  id v12;
  id v13;
  int IsLevelEnabled;
  id v15;
  id v16;
  int v17;
  id v18;
  int v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (!v8)
  {
    v13 = sub_100018DE8();
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17);

    if (!IsLevelEnabled)
      goto LABEL_13;
    v15 = sub_100018DE8();
    _NRLogWithArgs(v15, 17, "%s called with null completionQueue");
LABEL_20:

    goto LABEL_13;
  }
  if (!v9)
  {
    v16 = sub_100018DE8();
    v17 = _NRLogIsLevelEnabled(v16, 17);

    if (!v17)
      goto LABEL_13;
    v15 = sub_100018DE8();
    _NRLogWithArgs(v15, 17, "%s called with null completionBlock");
    goto LABEL_20;
  }
  if (!v20)
  {
    v18 = sub_100018DE8();
    v19 = _NRLogIsLevelEnabled(v18, 17);

    if (!v19)
      goto LABEL_13;
    v15 = sub_100018DE8();
    _NRLogWithArgs(v15, 17, "%s called with null parameters");
    goto LABEL_20;
  }
  if (objc_msgSend(v20, "pairingType"))
  {
    if (qword_1001E4548 != -1)
      dispatch_once(&qword_1001E4548, &stru_1001B62D0);
    if (_NRLogIsLevelEnabled(qword_1001E4540, 16))
    {
      if (qword_1001E4548 != -1)
        dispatch_once(&qword_1001E4548, &stru_1001B62D0);
      v11 = (id)qword_1001E4540;
      _NRLogWithArgs(v11, 16, "%s%.30s:%-4d pairing type %zd not yet supported", ", "-[NRBluetoothPairer pairWithParameters:completionQueue:completionBlock:]", 76, (size_t)objc_msgSend(v20, "pairingType"));

    }
    v10[2](v10, 0, 0);
  }
  else
  {
    -[NRBluetoothPairer setPairingType:](self, "setPairingType:", objc_msgSend(v20, "pairingType"));
    -[NRBluetoothPairer setParameters:](self, "setParameters:", v20);
    -[NRBluetoothPairer setCompletionQueue:](self, "setCompletionQueue:", v8);
    -[NRBluetoothPairer setCompletionBlock:](self, "setCompletionBlock:", v10);
    v12 = +[NRBluetoothPairingManager copySharedManager](NRBluetoothPairingManager, "copySharedManager");
    objc_msgSend(v12, "enqueuePairer:", self);

  }
LABEL_13:

}

- (void)unpairWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  int IsLevelEnabled;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v16)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairer nrUUID](self, "nrUUID"));
      v8 = sub_10012FFF4((uint64_t)NRDLocalDevice, v7);

      if (v8)
        v9 = (void *)v8[5];
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        -[NRBluetoothPairer setIsUnpairRequest:](self, "setIsUnpairRequest:", 1);
        -[NRBluetoothPairer setCompletionQueue:](self, "setCompletionQueue:", v16);
        -[NRBluetoothPairer setCompletionBlock:](self, "setCompletionBlock:", v6);
        v11 = +[NRBluetoothPairingManager copySharedManager](NRBluetoothPairingManager, "copySharedManager");
        objc_msgSend(v11, "enqueuePairer:", self);

      }
      else
      {
        if (qword_1001E4548 != -1)
          dispatch_once(&qword_1001E4548, &stru_1001B62D0);
        if (_NRLogIsLevelEnabled(qword_1001E4540, 16))
        {
          if (qword_1001E4548 != -1)
            dispatch_once(&qword_1001E4548, &stru_1001B62D0);
          _NRLogWithArgs(qword_1001E4540, 16, "%s%.30s:%-4d invalid device to unpair %@", ", "-[NRBluetoothPairer unpairWithCompletionQueue:completionBlock:]", 96, v8);
        }
        (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
      }
    }
    else
    {
      v14 = sub_100018DE8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

      if (!IsLevelEnabled)
        goto LABEL_15;
      v8 = sub_100018DE8();
      _NRLogWithArgs(v8, 17, "%s called with null completionBlock");
    }
  }
  else
  {
    v12 = sub_100018DE8();
    v13 = _NRLogIsLevelEnabled(v12, 17);

    if (!v13)
      goto LABEL_15;
    v8 = sub_100018DE8();
    _NRLogWithArgs(v8, 17, "%s called with null completionQueue");
  }

LABEL_15:
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (void)setNrUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nrUUID, a3);
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NRBluetoothPairerParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)isUnpairRequest
{
  return self->_isUnpairRequest;
}

- (void)setIsUnpairRequest:(BOOL)a3
{
  self->_isUnpairRequest = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

+ (BOOL)hasPairerForNRUUID:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = +[NRBluetoothPairingManager copySharedManager](NRBluetoothPairingManager, "copySharedManager");
  v5 = objc_msgSend(v4, "hasPairerForNRUUID:", v3);

  return v5;
}

+ (void)removePairerForNRUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = +[NRBluetoothPairingManager copySharedManager](NRBluetoothPairingManager, "copySharedManager");
  objc_msgSend(v4, "removePairerForNRUUID:", v3);

}

@end
