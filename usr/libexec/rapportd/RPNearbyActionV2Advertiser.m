@implementation RPNearbyActionV2Advertiser

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBAdvertiser *v5;
  CBAdvertiser *actionV2Advertiser;
  CBAdvertiser *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (CBAdvertiser *)objc_alloc_init(off_100131780());
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = v5;

  -[CBAdvertiser setDispatchQueue:](self->_actionV2Advertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CBAdvertiser setNearbyActionV2Type:](self->_actionV2Advertiser, "setNearbyActionV2Type:", self->_nearbyActionType);
  if (self->_targetData)
  {
    -[CBAdvertiser setNearbyActionV2Flags:](self->_actionV2Advertiser, "setNearbyActionV2Flags:", 1);
    -[CBAdvertiser setNearbyActionV2TargetData:](self->_actionV2Advertiser, "setNearbyActionV2TargetData:", self->_targetData);
  }
  -[CBAdvertiser setAdvertiseRate:](self->_actionV2Advertiser, "setAdvertiseRate:", 60);
  -[CBAdvertiser setLabel:](self->_actionV2Advertiser, "setLabel:", CFSTR("CLink"));
  v7 = self->_actionV2Advertiser;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100083150;
  v9[3] = &unk_100112C08;
  v10 = v4;
  v8 = v4;
  -[CBAdvertiser activateWithCompletion:](v7, "activateWithCompletion:", v9);

}

- (void)invalidate
{
  CBAdvertiser *actionV2Advertiser;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131710 <= 30 && (dword_100131710 != -1 || _LogCategory_Initialize(&dword_100131710, 30)))
    LogPrintF(&dword_100131710, "-[RPNearbyActionV2Advertiser invalidate]", 30, "BLE NearbyActionV2 advertiser stopped\n");
  -[CBAdvertiser invalidate](self->_actionV2Advertiser, "invalidate");
  actionV2Advertiser = self->_actionV2Advertiser;
  self->_actionV2Advertiser = 0;

}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  uint64_t v3;
  unsigned int nearbyActionType;
  const char *v6;
  const char *v7;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  nearbyActionType = self->_nearbyActionType;
  if (nearbyActionType != (_DWORD)v3)
  {
    if (dword_100131710 <= 30)
    {
      if (dword_100131710 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131710, 30))
          goto LABEL_6;
        nearbyActionType = self->_nearbyActionType;
      }
      v6 = sub_100083390(nearbyActionType);
      v7 = sub_100083390(v3);
      LogPrintF(&dword_100131710, "-[RPNearbyActionV2Advertiser setNearbyActionType:]", 30, "BLE NearbyActionV2 advertiser action type updated %s -> %s\n", v6, v7);
    }
LABEL_6:
    self->_nearbyActionType = v3;
    -[CBAdvertiser setNearbyActionV2Type:](self->_actionV2Advertiser, "setNearbyActionV2Type:", v3);
  }
}

- (void)setTargetData:(id)a3
{
  id v5;
  NSData *v6;
  NSData *v7;
  unsigned __int8 v8;
  NSData *v9;
  NSData *v10;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self->_targetData;
  v7 = (NSData *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      v8 = -[NSData isEqual:](v6, "isEqual:", v7);

      v9 = v10;
      if ((v8 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    if (dword_100131710 <= 30
      && (dword_100131710 != -1 || _LogCategory_Initialize(&dword_100131710, 30)))
    {
      LogPrintF(&dword_100131710, "-[RPNearbyActionV2Advertiser setTargetData:]", 30, "BLE NearbyActionV2 advertiser target data updated <%.3@> -> <%.3@>\n", self->_targetData, v10);
    }
    objc_storeStrong((id *)&self->_targetData, a3);
    -[CBAdvertiser setNearbyActionV2TargetData:](self->_actionV2Advertiser, "setNearbyActionV2TargetData:", self->_targetData);
  }
  v9 = v10;
LABEL_13:

}

- (id)description
{
  id v3;
  const char *v4;
  id v5;
  NSData *targetData;
  NSData *v7;
  NSData *v8;
  id v9;
  id v11;
  id v12;
  id v13;

  v13 = 0;
  NSAppendPrintF(&v13, "RPNearbyActionV2Advertiser: %@", self->_actionV2Advertiser);
  v3 = v13;
  v12 = v3;
  v4 = sub_100083390(self->_nearbyActionType);
  NSAppendPrintF(&v12, ", AT: %s ", v4);
  v5 = v12;

  targetData = self->_targetData;
  if (targetData)
  {
    v11 = v5;
    v7 = self->_targetData;
    v8 = targetData;
    NSAppendPrintF(&v11, ", TD: <%.3@> ", v7);
    v9 = v11;

    v5 = v9;
  }
  return v5;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (NSData)targetData
{
  return self->_targetData;
}

- (CBAdvertiser)actionV2Advertiser
{
  return self->_actionV2Advertiser;
}

- (void)setActionV2Advertiser:(id)a3
{
  objc_storeStrong((id *)&self->_actionV2Advertiser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_targetData, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
