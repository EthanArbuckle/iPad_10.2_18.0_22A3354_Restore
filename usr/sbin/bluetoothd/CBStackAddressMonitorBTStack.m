@implementation CBStackAddressMonitorBTStack

- (NSData)nonConnectableAddressData
{
  return self->_nonConnectableAddressData;
}

- (id)description
{
  return -[CBStackAddressMonitorBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v11;
  id v12;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    v12 = 0;
    NSAppendPrintF_safe(&v12, "CBStackAddressMonitor: ");
    v4 = v12;
  }
  v11 = v4;
  v5 = CUPrintNSDataAddress(self->_connectableAddressData);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = CUPrintNSDataAddress(self->_nonConnectableAddressData);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF_safe(&v11, "CA %@, NC %@", v6, v8);
  v9 = v11;

  return v9;
}

- (void)activate
{
  NSObject *dispatchQueue;
  uint64_t v4;
  void *v5;

  if (!self->_addressChangedHandler)
  {
    FatalErrorF("CBStackAddressMonitor: No addressChangedHandler", a2);
    goto LABEL_9;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_9:
    v4 = FatalErrorF("CBStackAddressMonitor: No dispatchQueue", a2);
    sub_1000DCAB8(v4, v5);
    return;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB78);
    if (!qword_10097BB80)
      operator new();
    sub_1000DCAB8(qword_10097BB80, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB78);
    self->_addedMonitor = 1;
  }
  -[CBStackAddressMonitorBTStack addressChanged:](self, "addressChanged:", 1);
}

- (void)invalidate
{
  id addressChangedHandler;
  id invalidationHandler;
  void (**v5)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10097BB78);
    if (qword_10097BB80)
      sub_1000DCC30(qword_10097BB80, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10097BB78);
    self->_addedMonitor = 0;
  }
  addressChangedHandler = self->_addressChangedHandler;
  self->_addressChangedHandler = 0;

  v5 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  if (v5)
    v5[2]();

}

- (void)addressChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSData *connectableAddressData;
  NSData *v7;
  NSData *v8;
  _BOOL4 v9;
  NSData *v10;
  unsigned __int8 v11;
  NSData *v12;
  NSData *v13;
  void *v14;
  NSData *nonConnectableAddressData;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  unsigned __int8 v19;
  NSData *v20;
  NSData *fakeNonConnectableAddressData;
  id v22;
  void *v23;
  uint64_t v24;

  if (self->_addedMonitor)
  {
    v3 = a3;
    if (qword_1009778A8 != -1)
      dispatch_once(&qword_1009778A8, &stru_100919F58);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:", *((_QWORD *)off_1009778A0 + 36)));
    connectableAddressData = self->_connectableAddressData;
    v7 = v5;
    v8 = connectableAddressData;
    v9 = v7 != v8;
    if (v7 == v8)
    {

      v12 = v7;
    }
    else
    {
      v10 = v8;
      if ((v7 == 0) != (v8 != 0))
      {
        v11 = -[NSData isEqual:](v7, "isEqual:", v8);

        if ((v11 & 1) != 0)
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      else
      {

      }
      v13 = v7;
      v12 = self->_connectableAddressData;
      self->_connectableAddressData = v13;
    }

LABEL_12:
    if (qword_1009778A8 != -1)
      dispatch_once(&qword_1009778A8, &stru_100919F58);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:", *((_QWORD *)off_1009778A0 + 37)));
    nonConnectableAddressData = self->_nonConnectableAddressData;
    v16 = v14;
    v17 = nonConnectableAddressData;
    if (v16 == v17)
    {

      if (!v3)
      {
LABEL_20:
        if (!v9)
          goto LABEL_28;
LABEL_25:
        v22 = objc_retainBlock(self->_addressChangedHandler);
        v23 = v22;
        if (v22)
          (*((void (**)(id))v22 + 2))(v22);

        goto LABEL_28;
      }
    }
    else
    {
      v18 = v17;
      if ((v16 == 0) != (v17 != 0))
      {
        v19 = -[NSData isEqual:](v16, "isEqual:", v17);

        if ((v19 & 1) != 0)
        {
          if (v3)
            goto LABEL_24;
          goto LABEL_20;
        }
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_nonConnectableAddressData, v14);
      if (!v3)
        goto LABEL_25;
    }
LABEL_24:
    v24 = 0;
    RandomBytes(&v24, 8);
    v24 &= 0xFFFFFFFFFFFFuLL;
    v20 = (NSData *)objc_claimAutoreleasedReturnValue(-[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:"));
    fakeNonConnectableAddressData = self->_fakeNonConnectableAddressData;
    self->_fakeNonConnectableAddressData = v20;

LABEL_28:
  }
}

- (void)forceNonConnectableAddressReadAndUpdate
{
  id v3;
  void *v4;
  NSData *nonConnectableAddressData;
  NSData *v6;
  NSData *v7;
  unsigned __int8 v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_addedMonitor)
  {
    v3 = -[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:", sub_1000DD094());
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    nonConnectableAddressData = self->_nonConnectableAddressData;
    v11 = v4;
    v6 = nonConnectableAddressData;
    if (v11 == v6)
    {

      v9 = v11;
    }
    else
    {
      v7 = v6;
      if ((v11 == 0) != (v6 != 0))
      {
        v8 = -[NSData isEqual:](v11, "isEqual:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_nonConnectableAddressData, v4);
      v10 = (NSData *)objc_retainBlock(self->_addressChangedHandler);
      v9 = v10;
      if (v10)
        ((void (*)(NSData *))v10[2].super.isa)(v10);
    }

LABEL_12:
  }
}

- (id)_dataWithBTAddress:(unint64_t)a3
{
  _BYTE v4[6];

  if (!a3)
    return 0;
  v4[0] = BYTE5(a3);
  v4[1] = BYTE4(a3);
  v4[2] = BYTE3(a3);
  v4[3] = BYTE2(a3);
  v4[4] = BYTE1(a3);
  v4[5] = a3;
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v4, 6);
}

- (NSData)connectableAddressData
{
  return self->_connectableAddressData;
}

- (NSData)fakeNonConnectableAddressData
{
  return self->_fakeNonConnectableAddressData;
}

- (id)addressChangedHandler
{
  return self->_addressChangedHandler;
}

- (void)setAddressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_addressChangedHandler, 0);
  objc_storeStrong((id *)&self->_fakeNonConnectableAddressData, 0);
  objc_storeStrong((id *)&self->_nonConnectableAddressData, 0);
  objc_storeStrong((id *)&self->_connectableAddressData, 0);
}

@end
