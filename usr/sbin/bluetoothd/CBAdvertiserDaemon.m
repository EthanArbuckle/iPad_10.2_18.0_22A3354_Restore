@implementation CBAdvertiserDaemon

- (NSArray)advertiserArray
{
  return self->_advertiserArray;
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (CBAdvertiserDaemon)init
{
  CBAdvertiserDaemon *v2;
  NSString *label;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  CBAdvertiserDaemon *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CBAdvertiserDaemon;
  v2 = -[CBAdvertiserDaemon init](&v15, "init");
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    label = v2->_airdropWiProxContext.label;
    v2->_airdropWiProxContext.label = (NSString *)CFSTR("AirDrop");

    v2->_airdropWiProxContext.payloadType = 5;
    v4 = v2->_airplaySourceWiProxContext.label;
    v2->_airplaySourceWiProxContext.label = (NSString *)CFSTR("AirPlaySource");

    v2->_airplaySourceWiProxContext.payloadType = 10;
    v5 = v2->_airplayTargetWiProxContext.label;
    v2->_airplayTargetWiProxContext.label = (NSString *)CFSTR("AirPlayTarget");

    v2->_airplayTargetWiProxContext.payloadType = 9;
    v2->_dsInfoWiProxContext.connectable = 1;
    v6 = v2->_dsInfoWiProxContext.label;
    v2->_dsInfoWiProxContext.label = (NSString *)CFSTR("DSInfo");

    v2->_dsInfoWiProxContext.payloadType = 24;
    v7 = v2->_heySiriWiProxContext.label;
    v2->_heySiriWiProxContext.label = (NSString *)CFSTR("HeySiri");

    v2->_heySiriWiProxContext.payloadType = 8;
    v2->_nearbyActionV1WiProxContext.connectable = 1;
    v8 = v2->_nearbyActionV1WiProxContext.label;
    v2->_nearbyActionV1WiProxContext.label = (NSString *)CFSTR("NearbyActionV1");

    v2->_nearbyActionV1WiProxContext.payloadType = 15;
    v9 = v2->_nearbyActionV2WiProxContext.label;
    v2->_nearbyActionV2WiProxContext.label = (NSString *)CFSTR("NearbyActionV2");

    v2->_nearbyActionV2WiProxContext.payloadType = 21;
    v2->_nearbyInfoWiProxContext.connectable = 1;
    v10 = v2->_nearbyInfoWiProxContext.label;
    v2->_nearbyInfoWiProxContext.label = (NSString *)CFSTR("NearbyInfo");

    v2->_nearbyInfoWiProxContext.payloadType = 16;
    v11 = v2->_nearbyInfoV2WiProxContext.label;
    v2->_nearbyInfoV2WiProxContext.label = (NSString *)CFSTR("NearbyInfoV2");

    v2->_nearbyInfoV2WiProxContext.payloadType = 22;
    v2->_nearbyActionNoWakeWiProxContext.connectable = 1;
    v12 = v2->_nearbyActionNoWakeWiProxContext.label;
    v2->_nearbyActionNoWakeWiProxContext.label = (NSString *)CFSTR("NearbyActionNoWake");

    v2->_nearbyActionNoWakeWiProxContext.payloadType = 26;
    v2->_spatialInteractionWiProxContext.advertiseEnableEPA = 0;
    v13 = v2;
  }

  return v2;
}

- (id)description
{
  return -[CBAdvertiserDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  NSData *fidoPayloadData;
  NSData *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int fidoAdvertiseRate;
  const char *v14;
  NSArray *saAdvAddresses;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  NSArray *saPayloadSegments;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int saAdvertiseRate;
  const char *v25;
  uint64_t spatialInteractionFlags;
  uint64_t v27;
  void *v28;
  NSArray *spatialInteractionIdentifiers;
  NSArray *v30;
  uint64_t v31;
  void *v32;
  NSData *spatialInteractionPayloadData;
  NSData *v34;
  NSData *spatialInteractionUWBConfigData;
  NSData *v36;
  NSUUID *spatialInteractionWiProxUUID;
  NSUUID *v38;
  NSData *watchSetupPayloadData;
  NSData *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int watchSetupAdvertiseRate;
  const char *v45;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id obj;
  id v55;
  id v56;
  id v57;
  id location;

  v4 = a3;
  v57 = 0;
  v5 = objc_msgSend((id)objc_opt_class(self), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  NSAppendPrintF_safe(&v57, "%@: CID 0x%X, clients %d", v6, self->_clientID, -[NSArray count](self->_advertiserArray, "count"));
  v7 = v57;
  location = v7;

  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    v56 = v7;
    v9 = fidoPayloadData;
    v10 = CUPrintNSDataHex(v9, 100, 1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    fidoAdvertiseRate = self->_fidoAdvertiseRate;
    if (fidoAdvertiseRate <= 39)
    {
      if (fidoAdvertiseRate > 19)
      {
        if (fidoAdvertiseRate == 20)
        {
          v14 = "350 ms";
          goto LABEL_22;
        }
      }
      else
      {
        if (fidoAdvertiseRate == 10)
        {
          v14 = "2 seconds";
          goto LABEL_22;
        }
        if (fidoAdvertiseRate == 15)
        {
          v14 = "1022.5 ms";
          goto LABEL_22;
        }
      }
    }
    else if (fidoAdvertiseRate <= 44)
    {
      if (fidoAdvertiseRate == 40)
      {
        v14 = "181.25 ms";
        goto LABEL_22;
      }
      if (fidoAdvertiseRate == 42)
      {
        v14 = "120 ms";
        goto LABEL_22;
      }
    }
    else
    {
      switch(fidoAdvertiseRate)
      {
        case '-':
          v14 = "60 ms";
          goto LABEL_22;
        case '2':
          v14 = "30 ms";
          goto LABEL_22;
        case '<':
          v14 = "20 ms";
LABEL_22:
          NSAppendPrintF_safe(&v56, ", fdPD <%@>, %s", v11, v14);
          objc_storeStrong(&location, v56);

          goto LABEL_23;
      }
    }
    v14 = "270 ms";
    goto LABEL_22;
  }
LABEL_23:
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_airdropWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_airplaySourceWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_airplayTargetWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_dsInfoWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_heySiriWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_nearbyActionV1WiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_nearbyActionV2WiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_nearbyInfoWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_nearbyInfoV2WiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_nearbyActionNoWakeWiProxContext, v4 < 0x1F);
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_spatialInteractionWiProxContext, v4 < 0x1F);
  saAdvAddresses = self->_saAdvAddresses;
  if (saAdvAddresses)
  {
    v55 = location;
    v16 = saAdvAddresses;
    v17 = CUPrintNSObjectOneLine(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    NSAppendPrintF_safe(&v55, ", saAD %@,", v18);
    objc_storeStrong(&location, v55);

  }
  saPayloadSegments = self->_saPayloadSegments;
  if (saPayloadSegments)
  {
    obj = location;
    v20 = saPayloadSegments;
    v21 = CUPrintNSObjectOneLine(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)v22;
    saAdvertiseRate = self->_saAdvertiseRate;
    if (saAdvertiseRate <= 39)
    {
      if (saAdvertiseRate > 19)
      {
        if (saAdvertiseRate == 20)
        {
          v25 = "350 ms";
          goto LABEL_46;
        }
      }
      else
      {
        if (saAdvertiseRate == 10)
        {
          v25 = "2 seconds";
          goto LABEL_46;
        }
        if (saAdvertiseRate == 15)
        {
          v25 = "1022.5 ms";
          goto LABEL_46;
        }
      }
    }
    else if (saAdvertiseRate <= 44)
    {
      if (saAdvertiseRate == 40)
      {
        v25 = "181.25 ms";
        goto LABEL_46;
      }
      if (saAdvertiseRate == 42)
      {
        v25 = "120 ms";
        goto LABEL_46;
      }
    }
    else
    {
      switch(saAdvertiseRate)
      {
        case '-':
          v25 = "60 ms";
          goto LABEL_46;
        case '2':
          v25 = "30 ms";
          goto LABEL_46;
        case '<':
          v25 = "20 ms";
LABEL_46:
          NSAppendPrintF_safe(&obj, ", saPD %@, %s", v22, v25);
          objc_storeStrong(&location, obj);

          goto LABEL_47;
      }
    }
    v25 = "270 ms";
    goto LABEL_46;
  }
LABEL_47:
  spatialInteractionFlags = self->_spatialInteractionFlags;
  if (self->_spatialInteractionFlags)
  {
    v53 = location;
    v27 = CUPrintFlags32(spatialInteractionFlags, &unk_10073825C);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    NSAppendPrintF_safe(&v53, ", siFl %@", v28);
    objc_storeStrong(&location, v53);

  }
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  if (spatialInteractionIdentifiers)
  {
    v52 = location;
    v30 = spatialInteractionIdentifiers;
    v31 = CUPrintNSObjectOneLine(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    NSAppendPrintF_safe(&v52, ", siID %@", v32);
    objc_storeStrong(&location, v52);

  }
  spatialInteractionPayloadData = self->_spatialInteractionPayloadData;
  if (spatialInteractionPayloadData)
  {
    v51 = location;
    v34 = spatialInteractionPayloadData;
    NSAppendPrintF_safe(&v51, ", siPD <%@>", v34);
    objc_storeStrong(&location, v51);

  }
  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  if (spatialInteractionUWBConfigData)
  {
    v50 = location;
    v36 = spatialInteractionUWBConfigData;
    NSAppendPrintF_safe(&v50, ", siUC <%@>", v36);
    objc_storeStrong(&location, v50);

  }
  if (v4 <= 0x1E)
  {
    spatialInteractionWiProxUUID = self->_spatialInteractionWiProxUUID;
    if (spatialInteractionWiProxUUID)
    {
      v49 = location;
      v38 = spatialInteractionWiProxUUID;
      NSAppendPrintF_safe(&v49, ", siWU <%@>", v38);
      objc_storeStrong(&location, v49);

    }
  }
  watchSetupPayloadData = self->_watchSetupPayloadData;
  if (watchSetupPayloadData)
  {
    v48 = location;
    v40 = watchSetupPayloadData;
    v41 = CUPrintNSDataHex(v40, 100, 1);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)v42;
    watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
    if (watchSetupAdvertiseRate <= 39)
    {
      if (watchSetupAdvertiseRate > 19)
      {
        if (watchSetupAdvertiseRate == 20)
        {
          v45 = "350 ms";
          goto LABEL_79;
        }
      }
      else
      {
        if (watchSetupAdvertiseRate == 10)
        {
          v45 = "2 seconds";
          goto LABEL_79;
        }
        if (watchSetupAdvertiseRate == 15)
        {
          v45 = "1022.5 ms";
          goto LABEL_79;
        }
      }
    }
    else if (watchSetupAdvertiseRate <= 44)
    {
      if (watchSetupAdvertiseRate == 40)
      {
        v45 = "181.25 ms";
        goto LABEL_79;
      }
      if (watchSetupAdvertiseRate == 42)
      {
        v45 = "120 ms";
        goto LABEL_79;
      }
    }
    else
    {
      switch(watchSetupAdvertiseRate)
      {
        case '-':
          v45 = "60 ms";
          goto LABEL_79;
        case '2':
          v45 = "30 ms";
          goto LABEL_79;
        case '<':
          v45 = "20 ms";
LABEL_79:
          NSAppendPrintF_safe(&v48, ", wsPD <%@>, %s", v42, v45);
          objc_storeStrong(&location, v48);

          goto LABEL_80;
      }
    }
    v45 = "270 ms";
    goto LABEL_79;
  }
LABEL_80:
  v46 = location;

  return v46;
}

- (void)advertisingAddressChanged
{
  if (dword_100977E08 <= 30 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon advertisingAddressChanged]", 30, "Advertising address changed");
  self->_addressChanged = 1;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", &stru_100918750);
}

- (void)setAdvertiserArray:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CBAdvertiserDaemon *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A97F0;
  v5[3] = &unk_100918778;
  v6 = objc_msgSend(a3, "copy");
  v7 = self;
  v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);

}

- (void)setSpatialInteractionAdvertiseRate:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A98F8;
  v3[3] = &unk_1009187A0;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A997C;
  v3[3] = &unk_1009187C8;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CBAdvertiserDaemon *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A9A1C;
  v5[3] = &unk_100918778;
  v6 = objc_msgSend(a3, "copy");
  v7 = self;
  v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);

}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CBAdvertiserDaemon *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A9B4C;
  v5[3] = &unk_100918778;
  v6 = objc_msgSend(a3, "copy");
  v7 = self;
  v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A9C98;
    v7[3] = &unk_1009187F0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t clientID;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  if (self->_invalidateCalled)
  {
    v4 = CBErrorF(4294896148, "Activate after invalidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (dword_100977E08 <= 90
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    {
      clientID = self->_clientID;
      v7 = CUPrintNSError(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _activateWithCompletion:]", 90, "### Activate failed: CID 0x%X, %@", clientID, v8);

    }
    v10[2](v10, v5);

  }
  else
  {
    if (dword_100977E08 <= 30
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _activateWithCompletion:]", 30, "Activate: CID 0x%X", self->_clientID);
    }
    if (!self->_wiproxObservering)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v9, "addObserver:selector:name:object:", self, "_wiproxChanged:", CFSTR("WPDaemonServerStateChanged"), 0);
      self->_wiproxObservering = 1;

    }
    -[CBAdvertiserDaemon _update](self, "_update");
    v10[2](v10, 0);
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9E9C;
  block[3] = &unk_100917080;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  void *v3;
  CBStackBLEAdvertiser *fidoStackAdvertiser;
  CBStackBLEAdvertiser *saStackAdvertiser;
  NSUUID *v6;
  WPAdvertisingRequest *v7;
  WPAdvertisingRequest *spatialInteractionAdvertisingRequest;
  CBStackBLEAdvertiser *appleTypeStackAdvertiser;
  CBStackBLEAdvertiser *watchSetupStackAdvertiser;
  id v11;

  if (self->_wiproxObservering)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WPDaemonServerStateChanged"), 0);
    self->_wiproxObservering = 0;

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100994178, "advertisingManager"));
  -[CBStackBLEAdvertiser invalidate](self->_fidoStackAdvertiser, "invalidate");
  fidoStackAdvertiser = self->_fidoStackAdvertiser;
  self->_fidoStackAdvertiser = 0;

  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airdropWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airplaySourceWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airplayTargetWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_dsInfoWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_heySiriWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionV1WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionV2WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyInfoWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyInfoV2WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionNoWakeWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_spatialInteractionWiProxContext);
  -[CBStackBLEAdvertiser invalidate](self->_saStackAdvertiser, "invalidate");
  saStackAdvertiser = self->_saStackAdvertiser;
  self->_saStackAdvertiser = 0;

  v6 = self->_spatialInteractionWiProxUUID;
  v7 = self->_spatialInteractionAdvertisingRequest;
  if (v7)
  {
    if (v11 && v6)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _invalidate]", 30, "Spatial advertise stop for invalidate");
      }
      objc_msgSend(v11, "removeAdvertisingRequest:forDaemon:", v7, v6);
    }
    spatialInteractionAdvertisingRequest = self->_spatialInteractionAdvertisingRequest;
    self->_spatialInteractionAdvertisingRequest = 0;

  }
  -[CBStackBLEAdvertiser invalidate](self->_appleTypeStackAdvertiser, "invalidate");
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  self->_appleTypeStackAdvertiser = 0;

  -[CBStackBLEAdvertiser invalidate](self->_watchSetupStackAdvertiser, "invalidate");
  watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
  self->_watchSetupStackAdvertiser = 0;

  -[CBAdvertiserDaemon _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id invalidationHandler;
  id stateChangedHandler;
  void *v5;
  int v6;
  id v7;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    v7 = objc_retainBlock(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    stateChangedHandler = self->_stateChangedHandler;
    self->_stateChangedHandler = 0;

    v5 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      v5 = v7;
    }
    self->_invalidateDone = 1;
    if (dword_100977E08 <= 30)
    {
      if (dword_100977E08 != -1 || (v6 = _LogCategory_Initialize(&dword_100977E08, 30), v5 = v7, v6))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _invalidated]", 30, "Invalidated");
        v5 = v7;
      }
    }

  }
}

- (BOOL)needsToRun
{
  return self->_airdropWiProxContext.payloadData
      || self->_airplaySourceWiProxContext.payloadData
      || self->_airplayTargetWiProxContext.payloadData
      || self->_nearbyActionV1WiProxContext.payloadData
      || self->_nearbyActionV2WiProxContext.payloadData
      || self->_nearbyInfoWiProxContext.payloadData
      || self->_nearbyInfoV2WiProxContext.payloadData
      || self->_nearbyActionNoWakeWiProxContext.payloadData
      || -[NSArray count](self->_saPayloadSegments, "count") != 0;
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if ((*((unsigned int (**)(id, SEL))a3 + 2))(a3, a2) && self->_activateCalled && !self->_changesPending)
  {
    self->_changesPending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AA310;
    block[3] = &unk_100917080;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_update
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(void);
  void (**v6)(void);

  if (!self->_invalidateCalled)
  {
    if (self->_changesPending)
    {
      self->_changesPending = 0;
      -[CBAdvertiserDaemon _updateFIDOPayload](self, "_updateFIDOPayload");
      -[CBAdvertiserDaemon _updateAirDropPayload:](self, "_updateAirDropPayload:", &self->_airdropWiProxContext);
      -[CBAdvertiserDaemon _updateAirPlaySourcePayload:](self, "_updateAirPlaySourcePayload:", &self->_airplaySourceWiProxContext);
      -[CBAdvertiserDaemon _updateAirPlayTargetPayload:](self, "_updateAirPlayTargetPayload:", &self->_airplayTargetWiProxContext);
      -[CBAdvertiserDaemon _updateDSInfoPayload:](self, "_updateDSInfoPayload:", &self->_dsInfoWiProxContext);
      -[CBAdvertiserDaemon _updateHeySiriPayload:](self, "_updateHeySiriPayload:", &self->_heySiriWiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionV1Payload:](self, "_updateNearbyActionV1Payload:", &self->_nearbyActionV1WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionV2Payload:](self, "_updateNearbyActionV2Payload:", &self->_nearbyActionV2WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyInfoPayload:](self, "_updateNearbyInfoPayload:", &self->_nearbyInfoWiProxContext);
      -[CBAdvertiserDaemon _updateNearbyInfoV2Payload:](self, "_updateNearbyInfoV2Payload:", &self->_nearbyInfoV2WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionNoWakePayload:](self, "_updateNearbyActionNoWakePayload:", &self->_nearbyActionNoWakeWiProxContext);
      v3 = _os_feature_enabled_impl("BluetoothFeatures", "SafetyAlerts");
      if ((_DWORD)v3 && GestaltGetDeviceClass(v3) == 1)
        -[CBAdvertiserDaemon _updateSafetyAlertsPayload](self, "_updateSafetyAlertsPayload");
      -[CBAdvertiserDaemon _updateSpatialInteractionPayload:](self, "_updateSpatialInteractionPayload:", &self->_spatialInteractionWiProxContext);
      -[CBAdvertiserDaemon _updateWatchSetupPayload](self, "_updateWatchSetupPayload");
    }
    -[CBAdvertiserDaemon _updateFIDOAdvertising](self, "_updateFIDOAdvertising");
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_airdropWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_airplaySourceWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_airplayTargetWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_dsInfoWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_heySiriWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyActionV1WiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyActionV2WiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyInfoWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyInfoV2WiProxContext);
    v4 = _os_feature_enabled_impl("BluetoothFeatures", "SafetyAlerts");
    if ((_DWORD)v4 && GestaltGetDeviceClass(v4) == 1)
      -[CBAdvertiserDaemon _updateSafetyAlertsAdvertising](self, "_updateSafetyAlertsAdvertising");
    -[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:](self, "_updateSpatialInteractionAdvertising:", &self->_spatialInteractionWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyActionNoWakeWiProxContext);
    -[CBAdvertiserDaemon _updateWatchSetupAdvertising](self, "_updateWatchSetupAdvertising");
    self->_addressChanged = 0;
    if (self->_stateChanged)
    {
      self->_stateChanged = 0;
      v5 = (void (**)(void))objc_retainBlock(self->_stateChangedHandler);
      if (v5)
      {
        v6 = v5;
        v5[2]();
        v5 = v6;
      }

    }
  }
}

- (id)_encryptInvitationPayload:(const void *)a3 payloadLength:(unint64_t)a4 authTag:(id)a5 irkData:(id)a6 keyInfo:(const void *)a7 keyInfoLength:(unint64_t)a8
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  char *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v29;
  uint64_t v30;
  id v31;
  _OWORD v32[2];
  uint64_t v33;
  __int16 v34;
  _OWORD v35[2];

  v13 = a5;
  v14 = a6;
  if (!a3)
  {
LABEL_33:
    v27 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v13, "length"))
  {
    if (dword_100977E08 <= 90
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]", 90, "Not encrypting invitation because BLE AuthTag is not available");
    }
    goto LABEL_33;
  }
  if (!objc_msgSend(v14, "length"))
  {
    if (dword_100977E08 <= 90
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]", 90, "Not encrypting invitation because self IRK is not available");
    }
    goto LABEL_33;
  }
  if (a4 >= 2)
    a4 = 2;
  memset(v35, 0, sizeof(v35));
  v15 = kCryptoHashDescriptor_SHA512;
  v31 = v14;
  v16 = objc_retainAutorelease(v14);
  v17 = objc_msgSend(v16, "bytes");
  v18 = objc_msgSend(v16, "length");
  v19 = v13;
  v20 = objc_retainAutorelease(v13);
  CryptoHKDF(v15, v17, v18, objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"), a7, a8, 32, v35);
  v34 = 0;
  v21 = __memcpy_chk(&v34, a3, a4, 2);
  v22 = ccaes_ecb_encrypt_mode(v21);
  v23 = (((uint64_t (*)(void))ccecb_context_size)() + 15) & 0xFFFFFFFFFFFFFFF0;
  v24 = (char *)&v30 - v23;
  bzero((char *)&v30 - v23, v23);
  v25 = ccecb_init(v22, v24, 32, v35);
  if (v25)
  {
    if (dword_100977E08 > 90)
    {
      v27 = 0;
      v13 = v19;
      goto LABEL_10;
    }
    v29 = v25;
    v13 = v19;
    if (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90))
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]", 90, "Unable to start encrypting invitation due to %d", v29);
    goto LABEL_35;
  }
  v33 = 0;
  memset(v32, 0, sizeof(v32));
  if (cclr_aes_init(v32, v22, v24, 8 * a4, 10))
  {
    v13 = v19;
    if (dword_100977E08 <= 90)
    {
      v14 = v31;
      if (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90))
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]", 90, "Unable to init encryption process for invitation due to %d");
      goto LABEL_39;
    }
LABEL_35:
    v27 = 0;
    goto LABEL_10;
  }
  v13 = v19;
  if (cclr_encrypt_block(v32, a4, &v34, &v34))
  {
    v14 = v31;
    if (dword_100977E08 <= 90
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]", 90, "Unable to encrypt invitation due to %d");
    }
LABEL_39:
    v27 = 0;
    goto LABEL_11;
  }
  v26 = ccecb_context_size(v22);
  cc_clear(v26, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v34, a4));
LABEL_10:
  v14 = v31;
LABEL_11:

  return v27;
}

- (void)_stackAppleTypeUpdateAdvertising:(id *)a3
{
  id v5;
  CBStackBLEAdvertiser *appleTypeStackAdvertiser;
  CBStackBLEAdvertiser **p_appleTypeStackAdvertiser;
  CBStackBLEAdvertiser *v8;
  CBStackBLEAdvertiser *v9;
  id var2;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int var5;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  CBStackBLEAdvertiser *v22;
  id v23;

  v5 = a3->var10;
  p_appleTypeStackAdvertiser = &self->_appleTypeStackAdvertiser;
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  v23 = v5;
  if (!v5)
  {
    if (!appleTypeStackAdvertiser)
    {
LABEL_65:
      a3->var7 = 0;
      goto LABEL_66;
    }
    if (dword_100977E08 <= 30
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]", 30, "%@ advertise SA stop", a3->var2);
    }
    -[CBStackBLEAdvertiser invalidate](*p_appleTypeStackAdvertiser, "invalidate");
    v9 = *p_appleTypeStackAdvertiser;
    *p_appleTypeStackAdvertiser = 0;
LABEL_64:

    goto LABEL_65;
  }
  v8 = appleTypeStackAdvertiser;
  if (v8)
  {
    v9 = v8;
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      goto LABEL_61;
    var2 = a3->var2;
    v11 = CUPrintNSDataHex(v23, 100, 1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    var5 = a3->var5;
    if (var5 <= 39)
    {
      if (var5 > 19)
      {
        if (var5 == 20)
        {
          v15 = "350 ms";
          goto LABEL_52;
        }
      }
      else
      {
        if (var5 == 10)
        {
          v15 = "2 seconds";
          goto LABEL_52;
        }
        if (var5 == 15)
        {
          v15 = "1022.5 ms";
          goto LABEL_52;
        }
      }
    }
    else if (var5 <= 44)
    {
      if (var5 == 40)
      {
        v15 = "181.25 ms";
        goto LABEL_52;
      }
      if (var5 == 42)
      {
        v15 = "120 ms";
        goto LABEL_52;
      }
    }
    else
    {
      switch(var5)
      {
        case '-':
          v15 = "60 ms";
          goto LABEL_52;
        case '2':
          v15 = "30 ms";
          goto LABEL_52;
        case '<':
          v15 = "20 ms";
LABEL_52:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]", 30, "%@ advertise SA update: <%@>, rate %s", var2, v12, v15);

LABEL_61:
          -[CBStackBLEAdvertiser setAdvertiseRate:](v9, "setAdvertiseRate:", a3->var5);
          -[CBStackBLEAdvertiser setAdvertiseEnableEPA:](v9, "setAdvertiseEnableEPA:", a3->var4);
          if (a3->var3 == 15)
            -[CBStackBLEAdvertiser setNearbyActionData:](v9, "setNearbyActionData:", v23);
          -[CBStackBLEAdvertiser activate](v9, "activate");
          goto LABEL_64;
      }
    }
    v15 = "270 ms";
    goto LABEL_52;
  }
  if (dword_100977E08 <= 30 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
  {
    v16 = a3->var2;
    v17 = CUPrintNSDataHex(v23, 100, 1);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)v18;
    v20 = a3->var5;
    if (v20 <= 39)
    {
      if (v20 > 19)
      {
        if (v20 == 20)
        {
          v21 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v20 == 10)
        {
          v21 = "2 seconds";
          goto LABEL_58;
        }
        if (v20 == 15)
        {
          v21 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v20 <= 44)
    {
      if (v20 == 40)
      {
        v21 = "181.25 ms";
        goto LABEL_58;
      }
      if (v20 == 42)
      {
        v21 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v20)
      {
        case '-':
          v21 = "60 ms";
          goto LABEL_58;
        case '2':
          v21 = "30 ms";
          goto LABEL_58;
        case '<':
          v21 = "20 ms";
LABEL_58:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]", 30, "%@ advertise SA start: <%@>, rate %s", v16, v18, v21);

          goto LABEL_59;
      }
    }
    v21 = "270 ms";
    goto LABEL_58;
  }
LABEL_59:
  v22 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleAdvertiserClass](self->_stackAdaptor, "bleAdvertiserClass")));
  if (v22)
  {
    v9 = v22;
    objc_storeStrong((id *)&self->_appleTypeStackAdvertiser, v22);
    -[CBStackBLEAdvertiser setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
    goto LABEL_61;
  }
  if (dword_100977E08 <= 90 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]", 90, "### %@ advertiser SA create failed", a3->var2);
LABEL_66:

}

- (void)_wiproxAppendDescription:(id *)a3 context:(id *)a4 verbose:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id var2;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int var5;
  const char *v15;
  id v16;
  id var11;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a5;
  v8 = a4->var10;
  if (!v8)
    goto LABEL_26;
  v22 = *a3;
  var2 = a4->var2;
  v10 = v22;
  v11 = CUPrintNSDataHex(v8, 100, 1);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)v12;
  var5 = a4->var5;
  if (var5 <= 39)
  {
    if (var5 > 19)
    {
      if (var5 != 20)
      {
LABEL_16:
        v15 = "270 ms";
        goto LABEL_22;
      }
      v15 = "350 ms";
    }
    else
    {
      if (var5 != 10)
      {
        if (var5 == 15)
        {
          v15 = "1022.5 ms";
          goto LABEL_22;
        }
        goto LABEL_16;
      }
      v15 = "2 seconds";
    }
  }
  else if (var5 <= 44)
  {
    if (var5 != 40)
    {
      if (var5 == 42)
      {
        v15 = "120 ms";
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    v15 = "181.25 ms";
  }
  else
  {
    switch(var5)
    {
      case '-':
        v15 = "60 ms";
        break;
      case '2':
        v15 = "30 ms";
        break;
      case '<':
        v15 = "20 ms";
        break;
      default:
        goto LABEL_16;
    }
  }
LABEL_22:
  NSAppendPrintF_safe(&v22, ", %@ <%@>, %s", var2, v12, v15);
  v16 = v22;

  if (v5)
  {
    var11 = a4->var11;
    if (var11)
    {
      v21 = v16;
      v18 = var11;
      NSAppendPrintF_safe(&v21, ", WPID <%@>", v18);
      v19 = v21;

      v16 = v19;
    }
  }
  v20 = *a3;
  *a3 = v16;

LABEL_26:
}

- (void)_wiproxChanged:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_100977E08 <= 30 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiproxChanged:]", 30, "WiProx state changed");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AAFA0;
  block[3] = &unk_100917080;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)_wiProxInvalidate:(id *)a3
{
  id var9;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id var6;
  id v11;

  if (a3->var8
    && dword_100977E08 <= 30
    && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
  {
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxInvalidate:]", 30, "%@ linger cancel for invalidate", a3->var2);
  }
  a3->var8 = 0;
  var9 = a3->var9;
  if (var9)
  {
    v5 = var9;
    dispatch_source_cancel(v5);
    v6 = a3->var9;
    a3->var9 = 0;

  }
  v11 = a3->var11;
  v7 = a3->var6;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100994178, "advertisingManager"));
    if (v8)
      v9 = v11 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxInvalidate:]", 30, "%@ advertise WP stop for invalidate", a3->var2);
      }
      objc_msgSend(v8, "removeAdvertisingRequest:forDaemon:", v7, v11);
    }
    var6 = a3->var6;
    a3->var6 = 0;

  }
}

- (void)_wiProxUpdateAdvertising:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id *p_var6;
  id v10;
  const char *v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  int var5;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id var2;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;

  if (a3->var7 || self->_addressChanged)
  {
    if (-[CBDaemonServer prefWiProxAdvertising](self->_daemonServer, "prefWiProxAdvertising")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100994178, "advertisingManager"))) != 0)
    {
      v29 = v5;
      v6 = objc_msgSend(v5, "state");
      if (v6 == (id)3)
      {
        v7 = a3->var11;
        if (!v7)
        {
          v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          objc_storeStrong(&a3->var11, v7);
        }
        v8 = a3->var10;
        p_var6 = &a3->var6;
        v10 = a3->var6;
        if (v10)
        {
          if (v8)
            v11 = "for restart";
          else
            v11 = "";
          if (dword_100977E08 < 31
            && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
          {
            if (self->_addressChanged)
              v12 = "for address change";
            else
              v12 = v11;
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]", 30, "%@ advertise WP stop %s", a3->var2, v12);
          }
          objc_msgSend(v29, "removeAdvertisingRequest:forDaemon:", v10, v7);
          v14 = *p_var6;
          *p_var6 = 0;

        }
        if (v8)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", a3->var3));
          objc_storeStrong(&a3->var6, v15);
          objc_msgSend(v15, "setAdvertisingData:", v8);
          var5 = a3->var5;
          v17 = 290;
          v18 = 48;
          v19 = 32;
          if (var5 != 60)
            v19 = 290;
          if (var5 != 50)
            v18 = v19;
          v20 = 192;
          v21 = 96;
          if (var5 != 45)
            v21 = 290;
          if (var5 != 42)
            v20 = v21;
          if (var5 <= 49)
            v18 = v20;
          v22 = 996;
          v23 = 432;
          if (var5 != 30)
            v23 = 290;
          if (var5 != 20)
            v22 = v23;
          if (var5 == 15)
            v17 = 1636;
          if (var5 == 10)
            v17 = 3200;
          if (var5 > 19)
            v17 = v22;
          if (var5 <= 41)
            v24 = v17;
          else
            v24 = v18;
          objc_msgSend(v15, "setAdvertisingRate:", v24);
          objc_msgSend(v15, "setConnectable:", a3->var0);
          objc_msgSend(v15, "setIsRanging:", a3->var1);
          objc_msgSend(v15, "setEnableEPAForAdvertising:", a3->var4);
          objc_msgSend(v15, "setStopOnAdvertisingAddressChange:", 1);
          if (dword_100977E08 <= 30
            && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
          {
            var2 = a3->var2;
            v26 = CUPrintNSDataHex(v8, 100, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]", 30, "%@ advertise WP start: <%@>, rate %.2f ms", var2, v27, (double)(uint64_t)objc_msgSend(v15, "advertisingRate") * 0.625);

          }
          objc_msgSend(v29, "addAdvertisingRequest:forDaemon:", v15, v7);

        }
        a3->var7 = 0;

      }
      else if (dword_100977E08 <= 30)
      {
        v28 = v6;
        if (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30))
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]", 30, "%@ advertise WP defer state: %d", a3->var2, v28);
      }
      v13 = v29;
    }
    else
    {
      if (a3->var3 == 15)
        -[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:](self, "_stackAppleTypeUpdateAdvertising:", a3);
      v13 = 0;
    }

  }
}

- (BOOL)_wiProxUpdateLinger:(id *)a3 active:(BOOL)a4
{
  BOOL v6;
  id var9;
  NSObject *v8;
  id v9;
  dispatch_source_t v11;
  id v12;
  NSObject *v13;
  _QWORD handler[7];

  if (a4)
  {
    if (a3->var8
      && dword_100977E08 <= 30
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]", 30, "%@ linger cancel for active", a3->var2);
    }
    a3->var8 = 0;
    var9 = a3->var9;
    if (var9)
    {
      v8 = var9;
      dispatch_source_cancel(v8);
      v9 = a3->var9;
      a3->var9 = 0;

    }
    return 0;
  }
  if (a3->var8)
  {
    if (!a3->var9)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]", 30, "%@ linger ended", a3->var2);
      }
      v6 = 0;
      a3->var8 = 0;
      self->_stateChanged = 1;
      return v6;
    }
    return 1;
  }
  if (!a3->var10)
    return 0;
  if (a3->var9)
    return 1;
  if (dword_100977E08 <= 30 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]", 30, "%@ linger start: %d seconds", a3->var2, 5);
  v6 = 1;
  a3->var8 = 1;
  v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v12 = a3->var9;
  a3->var9 = v11;
  v13 = v11;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000AB780;
  handler[3] = &unk_100918818;
  handler[5] = self;
  handler[6] = a3;
  handler[4] = v13;
  dispatch_source_set_event_handler(v13, handler);
  CUDispatchTimerSet(v13, 5.0, -1.0, 1.0);
  dispatch_activate(v13);

  return v6;
}

- (void)_wiProxUpdatePayload:(id *)a3 payloadData:(id)a4 advertiseRate:(int)a5 advertiseEnableEPA:(BOOL)a6
{
  id v10;
  id var10;
  id v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  void *v16;
  id var2;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int var5;
  const char *v24;
  const char *v25;
  id v26;

  v10 = a4;
  var10 = a3->var10;
  v26 = v10;
  v12 = var10;
  if (v12 == v26)
  {

  }
  else
  {
    if ((v26 == 0) == (v12 != 0))
    {

      goto LABEL_11;
    }
    v13 = objc_msgSend(v26, "isEqual:", v12);

    if (!v13)
      goto LABEL_11;
  }
  if (a3->var5 != a5)
  {
LABEL_11:
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      goto LABEL_66;
    var2 = a3->var2;
    v18 = CUPrintNSDataHex(a3->var10, 100, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = CUPrintNSDataHex(v26, 100, 1);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v21;
    var5 = a3->var5;
    if (var5 > 39)
    {
      if (var5 <= 44)
      {
        if (var5 == 40)
        {
          v24 = "Medium";
          goto LABEL_41;
        }
        if (var5 == 42)
        {
          v24 = "MediumMid";
          goto LABEL_41;
        }
      }
      else
      {
        switch(var5)
        {
          case '-':
            v24 = "MediumHigh";
            goto LABEL_41;
          case '2':
            v24 = "High";
            goto LABEL_41;
          case '<':
            v24 = "Max";
            goto LABEL_41;
        }
      }
    }
    else if (var5 <= 14)
    {
      if (!var5)
      {
        v24 = "Default";
        goto LABEL_41;
      }
      if (var5 == 10)
      {
        v24 = "Periodic";
        goto LABEL_41;
      }
    }
    else
    {
      switch(var5)
      {
        case 15:
          v24 = "PeriodicHigh";
          goto LABEL_41;
        case 20:
          v24 = "Background";
          goto LABEL_41;
        case 30:
          v24 = "Low";
          goto LABEL_41;
      }
    }
    v24 = "?";
LABEL_41:
    if (a5 > 39)
    {
      if (a5 <= 44)
      {
        if (a5 == 40)
        {
          v25 = "Medium";
          goto LABEL_65;
        }
        if (a5 == 42)
        {
          v25 = "MediumMid";
          goto LABEL_65;
        }
      }
      else
      {
        switch(a5)
        {
          case '-':
            v25 = "MediumHigh";
            goto LABEL_65;
          case '2':
            v25 = "High";
            goto LABEL_65;
          case '<':
            v25 = "Max";
            goto LABEL_65;
        }
      }
    }
    else if (a5 <= 14)
    {
      if (!a5)
      {
        v25 = "Default";
        goto LABEL_65;
      }
      if (a5 == 10)
      {
        v25 = "Periodic";
        goto LABEL_65;
      }
    }
    else
    {
      switch(a5)
      {
        case 15:
          v25 = "PeriodicHigh";
          goto LABEL_65;
        case 20:
          v25 = "Background";
          goto LABEL_65;
        case 30:
          v25 = "Low";
LABEL_65:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]", 30, "%@ updated: <%@> -> <%@>, rate %s -> %s", var2, v19, v21, v24, v25);

LABEL_66:
          a3->var5 = a5;
          objc_storeStrong(&a3->var10, a4);
          a3->var7 = 1;
          a3->var4 = a6;
          goto LABEL_67;
      }
    }
    v25 = "?";
    goto LABEL_65;
  }
  if (dword_100977E08 <= 10 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 10)))
  {
    v14 = a3->var2;
    v15 = CUPrintNSDataHex(v26, 100, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]", 10, "%@ unchanged: <%@>", v14, v16);

  }
LABEL_67:

}

- (void)_updateAirPlaySourcePayload:(id *)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  char v18;
  id v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "airplaySourceFlags");
        if (v11)
        {
          v17 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airplaySourceUWBConfigData"));
          v15 = objc_msgSend(v10, "advertiseRate");
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airplaySourceAuthTagData"));

          v16 = objc_alloc_init((Class)NSMutableData);
          if (objc_msgSend(v13, "length") == (id)3)
            v18 = v17 | 0x10;
          else
            v18 = v17 & 0xEF;
          v21 = v18;
          objc_msgSend(v16, "appendBytes:length:", &v21, 1);
          if ((v18 & 8) != 0 && objc_msgSend(v14, "length") == (id)1)
            objc_msgSend(v16, "appendData:", v14);
          if (objc_msgSend(v13, "length") == (id)3)
            objc_msgSend(v16, "appendData:", v13);
          v12 = 1;
          goto LABEL_19;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
LABEL_19:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12))
  {
    v20 = 0x80;
    v19 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v20, 1);

    v16 = v19;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v16, v15, 0);

}

- (void)_updateAirPlayTargetPayload:(id *)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "airplayTargetFlags", (_QWORD)v21);
        if (v11)
        {
          v15 = v11;
          v16 = objc_msgSend(v10, "airplayTargetConfigSeed");
          v17 = objc_msgSend(v10, "airplayTargetIPv4");
          v18 = objc_msgSend(v10, "airplayTargetPort");
          v13 = objc_msgSend(v10, "advertiseRate");

          v25 = v15;
          BYTE1(v25) = v16;
          BYTE2(v25) = HIBYTE(v17);
          BYTE3(v25) = BYTE2(v17);
          BYTE4(v25) = BYTE1(v17);
          BYTE5(v25) = v17;
          if ((v15 & 0x10) != 0)
          {
            HIWORD(v25) = __rev16(v18);
            v19 = 8;
          }
          else
          {
            v19 = 6;
          }
          v14 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v25, v19);
          v12 = 1;
          goto LABEL_14;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  v13 = 0;
  v14 = 0;
LABEL_14:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12, (_QWORD)v21))
  {
    LOBYTE(v25) = 0x80;
    v20 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v25, 1);

    v14 = v20;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v14, v13, 0);

}

- (void)_updateDSInfoPayload:(id *)a3
{
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "dsInfoVehicleConfidence");
        v11 = objc_msgSend(v9, "dsInfoVehicleState");
        if (v10 | v11)
        {
          v12 = v11;
          v6 = objc_msgSend(v9, "advertiseRate");
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
  v12 = 0;
LABEL_11:

  if (v10 | v12)
  {
    v14 = v12 & 3 | (4 * (v10 & 0xF));
    v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v14, 1);
  }
  else
  {
    v13 = 0;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v13, v6, 0);

}

- (void)_updateFIDOAdvertising
{
  NSData *v3;
  CBStackBLEAdvertiser *v4;
  CBStackBLEAdvertiser *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int fidoAdvertiseRate;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  CBStackBLEAdvertiser *fidoStackAdvertiser;
  CBStackBLEAdvertiser *v17;
  id v18;
  void *v19;
  id v20;

  if (self->_fidoChanged)
  {
    v3 = self->_fidoPayloadData;
    if (!v3)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOAdvertising]", 30, "FIDO advertise stop");
      }
      -[CBStackBLEAdvertiser invalidate](self->_fidoStackAdvertiser, "invalidate");
      fidoStackAdvertiser = self->_fidoStackAdvertiser;
      self->_fidoStackAdvertiser = 0;

      goto LABEL_62;
    }
    v4 = self->_fidoStackAdvertiser;
    if (v4)
    {
      v5 = v4;
      if (dword_100977E08 > 30
        || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      {
        goto LABEL_61;
      }
      v6 = CUPrintNSDataHex(v3, 100, 1);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)v7;
      fidoAdvertiseRate = self->_fidoAdvertiseRate;
      if (fidoAdvertiseRate <= 39)
      {
        if (fidoAdvertiseRate > 19)
        {
          if (fidoAdvertiseRate == 20)
          {
            v10 = "350 ms";
            goto LABEL_52;
          }
        }
        else
        {
          if (fidoAdvertiseRate == 10)
          {
            v10 = "2 seconds";
            goto LABEL_52;
          }
          if (fidoAdvertiseRate == 15)
          {
            v10 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }
      else if (fidoAdvertiseRate <= 44)
      {
        if (fidoAdvertiseRate == 40)
        {
          v10 = "181.25 ms";
          goto LABEL_52;
        }
        if (fidoAdvertiseRate == 42)
        {
          v10 = "120 ms";
          goto LABEL_52;
        }
      }
      else
      {
        switch(fidoAdvertiseRate)
        {
          case '-':
            v10 = "60 ms";
            goto LABEL_52;
          case '2':
            v10 = "30 ms";
            goto LABEL_52;
          case '<':
            v10 = "20 ms";
LABEL_52:
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOAdvertising]", 30, "FIDO advertise update: <%@>, rate %s", v7, v10);

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:](v5, "setAdvertiseRate:", self->_fidoAdvertiseRate);
            v18 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            objc_msgSend(v18, "setServiceUUID16:", 65529);
            objc_msgSend(v18, "setServiceData:", v3);
            v20 = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
            -[CBStackBLEAdvertiser setServiceDataArray:](v5, "setServiceDataArray:", v19);

            -[CBStackBLEAdvertiser activate](v5, "activate");
LABEL_62:
            self->_fidoChanged = 0;
LABEL_63:

            return;
        }
      }
      v10 = "270 ms";
      goto LABEL_52;
    }
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
    {
LABEL_59:
      v17 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleAdvertiserClass](self->_stackAdaptor, "bleAdvertiserClass")));
      if (!v17)
      {
        if (dword_100977E08 <= 90
          && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
        {
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOAdvertising]", 90, "### FIDO advertiser create failed");
        }
        goto LABEL_63;
      }
      v5 = v17;
      objc_storeStrong((id *)&self->_fidoStackAdvertiser, v17);
      -[CBStackBLEAdvertiser setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_61;
    }
    v11 = CUPrintNSDataHex(v3, 100, 1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    v14 = self->_fidoAdvertiseRate;
    if (v14 <= 39)
    {
      if (v14 > 19)
      {
        if (v14 == 20)
        {
          v15 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v14 == 10)
        {
          v15 = "2 seconds";
          goto LABEL_58;
        }
        if (v14 == 15)
        {
          v15 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v14 <= 44)
    {
      if (v14 == 40)
      {
        v15 = "181.25 ms";
        goto LABEL_58;
      }
      if (v14 == 42)
      {
        v15 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v14)
      {
        case '-':
          v15 = "60 ms";
          goto LABEL_58;
        case '2':
          v15 = "30 ms";
          goto LABEL_58;
        case '<':
          v15 = "20 ms";
LABEL_58:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOAdvertising]", 30, "FIDO advertise start: <%@>, rate %s", v12, v15);

          goto LABEL_59;
      }
    }
    v15 = "270 ms";
    goto LABEL_58;
  }
}

- (void)_updateFIDOPayload
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  NSData *fidoPayloadData;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int fidoAdvertiseRate;
  const char *v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_advertiserArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fidoPayloadData"));
        if (v8)
        {
          v9 = (void *)v8;
          LODWORD(v4) = objc_msgSend(v7, "advertiseRate");
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  fidoPayloadData = self->_fidoPayloadData;
  v11 = v9;
  v12 = fidoPayloadData;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

      goto LABEL_21;
    }
    v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14)
      goto LABEL_21;
  }
  if ((_DWORD)v4 != self->_fidoAdvertiseRate)
  {
LABEL_21:
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      goto LABEL_76;
    v17 = CUPrintNSDataHex(self->_fidoPayloadData, 100, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = CUPrintNSDataHex(v11, 100, 1);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    fidoAdvertiseRate = self->_fidoAdvertiseRate;
    if (fidoAdvertiseRate > 39)
    {
      if (fidoAdvertiseRate <= 44)
      {
        if (fidoAdvertiseRate == 40)
        {
          v23 = "Medium";
          goto LABEL_51;
        }
        if (fidoAdvertiseRate == 42)
        {
          v23 = "MediumMid";
          goto LABEL_51;
        }
      }
      else
      {
        switch(fidoAdvertiseRate)
        {
          case '-':
            v23 = "MediumHigh";
            goto LABEL_51;
          case '2':
            v23 = "High";
            goto LABEL_51;
          case '<':
            v23 = "Max";
            goto LABEL_51;
        }
      }
    }
    else if (fidoAdvertiseRate <= 14)
    {
      if (!fidoAdvertiseRate)
      {
        v23 = "Default";
        goto LABEL_51;
      }
      if (fidoAdvertiseRate == 10)
      {
        v23 = "Periodic";
        goto LABEL_51;
      }
    }
    else
    {
      switch(fidoAdvertiseRate)
      {
        case 15:
          v23 = "PeriodicHigh";
          goto LABEL_51;
        case 20:
          v23 = "Background";
          goto LABEL_51;
        case 30:
          v23 = "Low";
          goto LABEL_51;
      }
    }
    v23 = "?";
LABEL_51:
    if ((int)v4 > 39)
    {
      if ((int)v4 <= 44)
      {
        if ((_DWORD)v4 == 40)
        {
          v24 = "Medium";
          goto LABEL_75;
        }
        if ((_DWORD)v4 == 42)
        {
          v24 = "MediumMid";
          goto LABEL_75;
        }
      }
      else
      {
        switch((_DWORD)v4)
        {
          case '-':
            v24 = "MediumHigh";
            goto LABEL_75;
          case '2':
            v24 = "High";
            goto LABEL_75;
          case '<':
            v24 = "Max";
            goto LABEL_75;
        }
      }
    }
    else if ((int)v4 <= 14)
    {
      if (!(_DWORD)v4)
      {
        v24 = "Default";
        goto LABEL_75;
      }
      if ((_DWORD)v4 == 10)
      {
        v24 = "Periodic";
        goto LABEL_75;
      }
    }
    else
    {
      switch((_DWORD)v4)
      {
        case 0xF:
          v24 = "PeriodicHigh";
          goto LABEL_75;
        case 0x14:
          v24 = "Background";
          goto LABEL_75;
        case 0x1E:
          v24 = "Low";
LABEL_75:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOPayload]", 30, "FIDO updated: <%@> -> <%@>, rate %s -> %s", v18, v20, v23, v24, (_QWORD)v25);

LABEL_76:
          self->_fidoAdvertiseRate = (int)v4;
          objc_storeStrong((id *)&self->_fidoPayloadData, v9);
          self->_fidoChanged = 1;
          goto LABEL_77;
      }
    }
    v24 = "?";
    goto LABEL_75;
  }
  if (dword_100977E08 <= 10 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 10)))
  {
    v15 = CUPrintNSDataHex(v11, 100, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateFIDOPayload]", 10, "FIDO unchanged: <%@>", v16);

  }
LABEL_77:

}

- (void)_updateHeySiriPayload:(id *)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  __int16 v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[8];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "heySiriDeviceClass", (_QWORD)v20);
        if (v11)
        {
          v14 = v11;
          v12 = objc_msgSend(v10, "advertiseRate");
          v15 = objc_msgSend(v10, "heySiriConfidence");
          v16 = (unsigned __int16)objc_msgSend(v10, "heySiriPerceptualHash");
          v17 = objc_msgSend(v10, "heySiriProductType");
          v18 = objc_msgSend(v10, "heySiriRandom");
          v19 = objc_msgSend(v10, "heySiriSNR");

          v24[0] = HIBYTE(v16);
          v24[1] = v16;
          v24[2] = v19;
          v24[3] = v15;
          v24[4] = HIBYTE(v14);
          v24[5] = v14;
          v24[6] = v18;
          v24[7] = v17;
          v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v24, 8);
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  v13 = 0;
LABEL_11:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v13, v12, 0, (_QWORD)v20);

}

- (void)_updateNearbyActionV1Payload:(id *)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  unsigned __int8 *v28;
  id v29;
  uint64_t v30;
  $87ECF4FA70DA585E42BCB48B41B3C02F *v31;
  uint64_t v32;
  __int16 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char v37;
  char v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  _BYTE v45[128];

  v44 = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "nearbyActionType");
      if (v11)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v19 = v11;
    v31 = a3;
    v20 = objc_msgSend(v10, "nearbyActionFlags");
    v21 = v20;
    v22 = (v20 >> 8) & 0xF;
    v44 = v22;
    v17 = (uint64_t)objc_msgSend(v10, "advertiseRate");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyActionAuthTagData"));
    if (objc_msgSend(v23, "length") == (id)3)
      v24 = v23;
    else
      v24 = (id)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon selfAuthTag](self, "selfAuthTag"));
    v16 = v24;
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyActionTargetData"));
    v14 = v10;
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "watchSetupData"));

    v18 = objc_alloc_init((Class)NSMutableData);
    v39 = v21;
    objc_msgSend(v18, "appendBytes:length:", &v39, 1);
    v38 = v19;
    objc_msgSend(v18, "appendBytes:length:", &v38, 1);
    if ((objc_msgSend(v14, "nearbyActionFlags") & 0x80) != 0 && v16)
      objc_msgSend(v18, "appendData:", v16);
    v25 = v19 - 37;
    if (v25 <= 0x30)
    {
      if (((1 << (v19 - 37)) & 0x1000000000581) != 0)
      {
LABEL_18:
        v26 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
        v27 = 16 * v26;
        if (v26 > 0xF)
          v27 = 0;
        v37 = v27;
        v28 = (unsigned __int8 *)&v37;
        goto LABEL_21;
      }
      if (v25 == 17)
      {
        v36 = objc_msgSend(v14, "dsActionFlags");
        objc_msgSend(v18, "appendBytes:length:", &v36, 1);
        v35 = objc_msgSend(v14, "dsActionMeasuredPower");
        objc_msgSend(v18, "appendBytes:length:", &v35, 1);
        v34 = objc_msgSend(v14, "dsActionTieBreaker");
        v28 = &v34;
LABEL_21:
        objc_msgSend(v18, "appendBytes:length:", v28, 1, v30);
LABEL_22:
        v12 = 1;
        if (v22 && (objc_msgSend(v18, "appendBytes:length:", &v44, 1), v19 == 56) && (v21 & 0x200) != 0)
        {
          v15 = (void *)v30;
          if (v30)
          {
            objc_msgSend(v18, "appendData:", v30);
            v12 = 1;
          }
          a3 = v31;
        }
        else
        {
          v15 = (void *)v30;
          a3 = v31;
        }
        v13 = (void *)v32;
        goto LABEL_30;
      }
    }
    if (v19 != 2)
    {
      if (v19 == 5 && v32)
        objc_msgSend(v18, "appendData:", v32);
      goto LABEL_22;
    }
    goto LABEL_18;
  }
LABEL_9:

  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_30:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12, v30))
  {
    v33 = 13312;
    v29 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v33, 2);

    v17 = 50;
    v18 = v29;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v18, v17, 0);

}

- (void)_updateNearbyActionV2Payload:(id *)a3
{
  CBAdvertiserDaemon *v4;
  NSArray *v5;
  id v6;
  id v7;
  char v8;
  char v9;
  uint64_t v10;
  void *i;
  unsigned int v12;
  unsigned int v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  unsigned __int8 v18;
  void *j;
  void *v20;
  unsigned int v21;
  char v22;
  void *v23;
  uint64_t v24;
  id v25;
  _BOOL8 v26;
  unsigned __int8 v27;
  id v28;
  CBAdvertiserDaemon *v29;
  __int16 v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v4 = self;
  v40 = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v5);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "nearbyActionV2Type");
        v13 = v12;
        v40 = v12;
        if (v12)
        {
          if (v12 == 41)
            v8 = 1;
          else
            v9 = 1;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }
  else
  {
    v13 = 0;
    v8 = 0;
    v9 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v4->_advertiserArray;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v15)
  {
    v16 = v15;
    v29 = v4;
    v17 = *(_QWORD *)v33;
    v18 = v8 & v9;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
        v21 = objc_msgSend(v20, "nearbyActionV2Type");
        v13 = v21;
        v40 = v21;
        if (v21)
        {
          if ((v18 & (v21 == 41)) != 1)
          {
            v27 = objc_msgSend(v20, "nearbyActionV2Flags");
            v24 = (uint64_t)objc_msgSend(v20, "advertiseRate");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nearbyActionV2TargetData"));
            v22 = v27 & 0xFE;

            v26 = 1;
            v4 = v29;
            goto LABEL_31;
          }
          if (dword_100977E08 <= 90
            && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
          {
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateNearbyActionV2Payload:]", 90, "### NearbyActionV2: Not advertising remote pairing");
          }
        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v16)
        continue;
      break;
    }
    v4 = v29;
  }

  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = v13 != 0;
  if (v13)
  {
LABEL_31:
    v25 = objc_alloc_init((Class)NSMutableData);
    v31 = v22 | (objc_msgSend(v23, "length") == (id)3);
    objc_msgSend(v25, "appendBytes:length:", &v31, 1);
    objc_msgSend(v25, "appendBytes:length:", &v40, 1);
    if (objc_msgSend(v23, "length") == (id)3)
      objc_msgSend(v25, "appendData:", v23);
  }
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](v4, "_wiProxUpdateLinger:active:", a3, v26))
  {
    v30 = 13312;
    v28 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v30, 2);

    v24 = 50;
    v25 = v28;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](v4, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v25, v24, 0);

}

- (void)_updateNearbyInfoPayload:(id *)a3
{
  NSArray *v5;
  id v6;
  double v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 v13;
  unsigned int v14;
  double v15;
  id v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  id v21;
  __int16 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v7 = 0.0;
  if (v6)
  {
    v8 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "nearbyInfoFlags");
        v12 = objc_msgSend(v10, "nearbyInfoStatusType");
        if (v11 | v12)
        {
          v14 = v12;
          v6 = objc_msgSend(v10, "advertiseRate");
          objc_msgSend(v10, "nearbyInfoStatusProgress");
          v7 = v15;
          v13 = objc_msgSend(v10, "nearbyInfoStatusTime");
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
  v13 = 0;
  v14 = 0;
LABEL_11:

  if (v11 | v14)
  {
    v16 = objc_alloc_init((Class)NSMutableData);
    LOBYTE(v22) = (__rbit32(v11) >> 25) & 0x70;
    objc_msgSend(v16, "appendBytes:length:", &v22, 1);
    LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6);
    if (v14)
    {
      LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6) | 1;
      objc_msgSend(v16, "appendBytes:length:", &v22, 1);
      LOBYTE(v22) = 4;
      objc_msgSend(v16, "appendBytes:length:", &v22, 1);
      LOBYTE(v22) = v14;
      objc_msgSend(v16, "appendBytes:length:", &v22, 1);
      v17 = 1.0;
      if (v7 <= 1.0)
        v17 = v7;
      v18 = v17 * 100.0;
      v19 = v17 < 0.0;
      v20 = 0.0;
      if (!v19)
        v20 = v18;
      LOBYTE(v22) = (int)v20;
      objc_msgSend(v16, "appendBytes:length:", &v22, 1);
      LOBYTE(v22) = v13;
    }
    objc_msgSend(v16, "appendBytes:length:", &v22, 1);
  }
  else
  {
    v16 = 0;
  }
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, (v11 | v14) != 0))
  {
    v22 = 0;
    v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v22, 2);

    v16 = v21;
  }
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v16, v6, 0);

}

- (void)_updateNearbyInfoV2Payload:(id *)a3
{
  id v3;
  id v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  $87ECF4FA70DA585E42BCB48B41B3C02F *v23;
  CBAdvertiserDaemon *v24;
  id v25;
  BOOL v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  $87ECF4FA70DA585E42BCB48B41B3C02F *v34;
  unsigned int v36;
  NSArray *obj;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int16 v46;
  __int16 v47;
  _BYTE v48[128];

  v34 = a3;
  v47 = 0;
  v46 = 0;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_advertiserArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v36 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v41 = 0;
    v40 = 0;
    v38 = *(_QWORD *)v43;
    v39 = 0;
    while (1)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v6 |= objc_msgSend(v11, "nearbyInfoV2DecryptedFlags", v34);
        HIBYTE(v47) = v6;
        if ((objc_msgSend(v11, "nearbyInfoV2Flags") & 4) != 0)
        {
          v5 |= 4u;
          LOBYTE(v47) = v5;
        }
        else if (!v5 && !(_BYTE)v6)
        {
          v5 = 0;
          continue;
        }
        v12 = v9;
        if ((int)objc_msgSend(v11, "advertiseRate") > v40)
          v40 = objc_msgSend(v11, "advertiseRate");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2AuthTagData"));
        v14 = objc_msgSend(v13, "length");

        v15 = (uint64_t)v41;
        if (!v41 && v14 == (id)3)
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2AuthTagData"));
        v41 = (void *)v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2AuthIntegrityTagData"));
        v17 = objc_msgSend(v16, "length");

        v9 = v12;
        if (!v12 && v17 == (id)3)
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2AuthIntegrityTagData"));
        if (v39)
        {
          if (!v8)
            goto LABEL_27;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2RapportIRKData"));
          v19 = objc_msgSend(v18, "length");

          if (v19)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInfoV2RapportIRKData"));
            if (!v8)
              goto LABEL_27;
          }
          else
          {
            v39 = 0;
            if (!v8)
            {
LABEL_27:
              v8 = objc_msgSend(v11, "nearbyInfoV2InvitationCounter");
              HIBYTE(v46) = v8;
              if (v7)
                continue;
              goto LABEL_28;
            }
          }
        }
        if (v7)
          continue;
LABEL_28:
        if (objc_msgSend(v11, "nearbyInfoV2InvitationRouteType"))
        {
          v7 = objc_msgSend(v11, "nearbyInfoV2InvitationRouteType");
          LOBYTE(v46) = v7;
          v36 = v7;
        }
        else
        {
          v7 = 0;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (!v4)
        goto LABEL_35;
    }
  }
  v36 = 0;
  v8 = 0;
  v6 = 0;
  v5 = 0;
  v39 = 0;
  v9 = 0;
  v41 = 0;
  v40 = 0;
LABEL_35:

  if (!v5 && !(_BYTE)v6)
  {
    v20 = (void *)v9;
    v21 = 0;
    v22 = 0;
    v23 = v34;
    v24 = self;
LABEL_55:
    -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](v24, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", v23, v22, v40, 0, v34);

    v22 = v21;
    goto LABEL_56;
  }
  v25 = objc_alloc_init((Class)NSMutableData);
  v22 = v25;
  if (v8)
    v26 = v36 == 0;
  else
    v26 = 1;
  v27 = !v26;
  v20 = (void *)v9;
  v28 = v6 & 0xFC | v27;
  if (((v41 != 0) & (v6 >> 1) & (v9 != 0)) != 0)
    v29 = 2;
  else
    v29 = 0;
  HIBYTE(v47) = v28 | v29;
  objc_msgSend(v25, "appendBytes:length:", &v47, 1, v34);
  v24 = self;
  v30 = objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:](self, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:", (char *)&v47 + 1, 1, v41, v39, "BT_CBNearbyInfoV2EncryptedFlagsV1", 33));
  if (v30)
  {
    v21 = (void *)v30;
    objc_msgSend(v22, "appendData:", v30);
    if (v41)
      objc_msgSend(v22, "appendData:", v41);
    v23 = v34;
    if (v20)
      objc_msgSend(v22, "appendData:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 2));
    v32 = v31;
    if (HIBYTE(v46))
    {
      objc_msgSend(v31, "appendBytes:length:", (char *)&v46 + 1, 1);
      objc_msgSend(v32, "appendBytes:length:", &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:](self, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:", objc_msgSend(objc_retainAutorelease(v32), "bytes"), 2, v41, v39, "BT_CBNearbyInfoV2EncryptedPayloadV1", 35));
      objc_msgSend(v22, "appendData:", v33);

    }
    goto LABEL_55;
  }
LABEL_56:

}

- (void)_updateAirDropPayload:(id *)a3
{
  CBAdvertiserDaemon *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  unsigned __int8 v16;
  unsigned int v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned int v22;
  id v23;
  char v24;
  char v25;
  char v26;
  _BYTE *v27;
  char v28;
  char v29;
  unsigned int v30;
  CBAdvertiserDaemon *v31;
  $87ECF4FA70DA585E42BCB48B41B3C02F *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[18];
  _BYTE v38[128];

  v4 = self;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "airdropVersion");
        if (v11)
        {
          v15 = v11;
          v31 = v4;
          v32 = a3;
          v16 = objc_msgSend(v10, "airdropFlags");
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airdropTempAuthTagData"));
          v17 = objc_msgSend(v10, "airdropModel");
          v18 = (unsigned __int16)objc_msgSend(v10, "airdropHash1");
          v19 = (unsigned __int16)objc_msgSend(v10, "airdropHash2");
          v20 = (unsigned __int16)objc_msgSend(v10, "airdropHash3");
          v21 = (unsigned __int16)objc_msgSend(v10, "airdropHash4");
          v30 = objc_msgSend(v10, "advertiseRate");
          v22 = objc_msgSend(v10, "airdropConfigData");

          memset(&v37[1], 0, 7);
          v23 = objc_msgSend(v12, "length");
          v24 = v16 | 0x40;
          if (v23 != (id)3)
            v24 = v16 & 0xBF;
          v25 = v24 | 0x80;
          v26 = v24 & 0x7F;
          if (v17)
            v26 = v25;
          v37[0] = v26;
          if (objc_msgSend(v12, "length") == (id)3)
          {
            v27 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
            v28 = v27[2];
            *(_WORD *)&v37[1] = *(_WORD *)v27;
            v37[3] = v28;
          }
          v37[4] = v17;
          v37[8] = v15;
          v37[9] = HIBYTE(v18);
          v37[10] = v18;
          v37[11] = HIBYTE(v19);
          v37[12] = v19;
          v37[13] = HIBYTE(v20);
          v37[14] = v20;
          v37[15] = HIBYTE(v21);
          v37[16] = v21;
          v29 = v22 | 1;
          if (!v22)
            v29 = 0;
          v37[17] = v29;
          v14 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v37, 18);
          v4 = v31;
          a3 = v32;
          v13 = v30;
          goto LABEL_19;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  v13 = 0;
  v14 = 0;
LABEL_19:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](v4, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v14, v13, 0);

}

- (void)_updateSafetyAlertsAdvertising
{
  NSArray *v3;
  NSArray *v4;
  CBStackBLEAdvertiser *v5;
  CBStackBLEAdvertiser *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int saAdvertiseRate;
  const char *v13;
  CBStackBLEAdvertiser *saStackAdvertiser;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  CBStackBLEAdvertiser *v20;
  id v21;
  NSArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  id v28;
  NSArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  if (self->_saChanged)
  {
    v3 = self->_saAdvAddresses;
    v4 = self->_saPayloadSegments;
    if ((id)-[NSArray count](v3, "count") != (id)3 || (id)-[NSArray count](v4, "count") != (id)3)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]", 30, "Safety Alerts advertise stop");
      }
      -[CBStackBLEAdvertiser invalidate](self->_saStackAdvertiser, "invalidate");
      saStackAdvertiser = self->_saStackAdvertiser;
      self->_saStackAdvertiser = 0;

      goto LABEL_49;
    }
    v5 = self->_saStackAdvertiser;
    if (!v5)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        v15 = CUPrintNSObjectOneLine(v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = CUPrintNSObjectOneLine(v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = sub_1000A9624(self->_saAdvertiseRate);
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]", 30, "Safety Alerts advertise start: saAD <%@>, saPD <%@>, rate %s", v16, v18, v19);

      }
      v20 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleAdvertiserClass](self->_stackAdaptor, "bleAdvertiserClass")));
      if (!v20)
      {
        if (dword_100977E08 <= 90
          && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
        {
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]", 90, "### Safety Alerts advertiser create failed");
        }
        goto LABEL_50;
      }
      v6 = v20;
      objc_storeStrong((id *)&self->_saStackAdvertiser, v20);
      -[CBStackBLEAdvertiser setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_41;
    }
    v6 = v5;
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
    {
LABEL_41:
      -[CBStackBLEAdvertiser setAdvertiseRate:](v6, "setAdvertiseRate:", self->_saAdvertiseRate);
      v29 = v3;
      -[CBStackBLEAdvertiser setSaAddressDataArray:](v6, "setSaAddressDataArray:", v3);
      v21 = objc_alloc_init((Class)NSMutableArray);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v22 = v4;
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v28 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            objc_msgSend(v28, "setServiceUUID16:", 64672);
            objc_msgSend(v28, "setServiceData:", v27);
            objc_msgSend(v21, "addObject:", v28);

          }
          v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v24);
      }

      -[CBStackBLEAdvertiser setSaServiceDataArray:](v6, "setSaServiceDataArray:", v21);
      -[CBStackBLEAdvertiser activate](v6, "activate");

      v3 = v29;
LABEL_49:
      self->_saChanged = 0;
LABEL_50:

      return;
    }
    v7 = CUPrintNSObjectOneLine(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = CUPrintNSObjectOneLine(v4);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)v10;
    saAdvertiseRate = self->_saAdvertiseRate;
    if (saAdvertiseRate <= 39)
    {
      if (saAdvertiseRate > 19)
      {
        if (saAdvertiseRate == 20)
        {
          v13 = "350 ms";
          goto LABEL_40;
        }
      }
      else
      {
        if (saAdvertiseRate == 10)
        {
          v13 = "2 seconds";
          goto LABEL_40;
        }
        if (saAdvertiseRate == 15)
        {
          v13 = "1022.5 ms";
          goto LABEL_40;
        }
      }
    }
    else if (saAdvertiseRate <= 44)
    {
      if (saAdvertiseRate == 40)
      {
        v13 = "181.25 ms";
        goto LABEL_40;
      }
      if (saAdvertiseRate == 42)
      {
        v13 = "120 ms";
        goto LABEL_40;
      }
    }
    else
    {
      switch(saAdvertiseRate)
      {
        case '-':
          v13 = "60 ms";
          goto LABEL_40;
        case '2':
          v13 = "30 ms";
          goto LABEL_40;
        case '<':
          v13 = "20 ms";
LABEL_40:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]", 30, "Safety Alerts advertise update: saAD <%@>, saPD <%@>, rate %s", v8, v10, v13);

          goto LABEL_41;
      }
    }
    v13 = "270 ms";
    goto LABEL_40;
  }
}

- (void)_updateSafetyAlertsPayload
{
  CBAdvertiserDaemon *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  int v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  char *v28;
  id v29;
  char *v30;
  unsigned int v31;
  void *v32;
  char *v33;
  id v34;
  _BYTE *v35;
  char v36;
  id v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  uint64_t v41;
  NSArray *saAdvAddresses;
  NSArray *v44;
  NSArray *v45;
  NSArray *v46;
  unsigned int v47;
  NSArray *saPayloadSegments;
  NSArray *v49;
  NSArray *v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int saAdvertiseRate;
  const char *v61;
  const char *v62;
  int v63;
  void *v64;
  void *v65;
  CBAdvertiserDaemon *v66;
  id v67;
  char *v68;
  void *v69;
  char *v70;
  NSArray *obj;
  id obja;
  id objb;
  char v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];

  v2 = self;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = self->_advertiserArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  v66 = v2;
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v77;
    do
    {
      v9 = 0;
      v10 = v5;
      v11 = v6;
      do
      {
        if (*(_QWORD *)v77 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safetyAlertsAlertData"));

        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safetyAlertsAlertID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safetyAlertsSignature"));

        v15 = objc_msgSend(v12, "safetyAlertsVersion");
        v16 = v15;
        if (v13)
          v17 = v6 == 0;
        else
          v17 = 1;
        if (!v17 && v14 != 0 && v15 != 0)
        {
          v20 = objc_msgSend(v12, "advertiseRate");
          v2 = v66;
          goto LABEL_21;
        }
        v9 = (char *)v9 + 1;
        v10 = v14;
        v11 = v6;
        v5 = v14;
        v7 = v13;
      }
      while (v4 != v9);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      v7 = v13;
    }
    while (v4);
    v20 = 0;
    v2 = v66;
    v14 = v5;
  }
  else
  {
    v16 = 0;
    v14 = 0;
    v6 = 0;
    v13 = 0;
    v20 = 0;
  }
LABEL_21:

  v67 = v13;
  v21 = objc_msgSend(v13, "length");
  v22 = objc_msgSend(v6, "length");
  v23 = objc_msgSend(v14, "length");
  v24 = 0;
  v65 = v14;
  if ((unint64_t)v21 <= 0x1C && v22 == (id)3 && v23 == (id)56)
  {
    v25 = 0;
    if (v16 - 32 >= 0xFFFFFFE1)
    {
      v63 = v20;
      obja = objc_alloc_init((Class)NSMutableArray);
      v26 = objc_alloc_init((Class)NSMutableArray);
      v27 = objc_retainAutorelease(v67);
      v28 = (char *)objc_msgSend(v27, "bytes");
      v70 = (char *)objc_msgSend(v27, "length") + (_QWORD)v28;
      v29 = objc_retainAutorelease(v14);
      v30 = (char *)objc_msgSend(v29, "bytes");
      v68 = (char *)objc_msgSend(v29, "length") + (_QWORD)v30;
      v31 = 1;
      do
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v30, 6));
        v33 = v30 + 6;
        v34 = objc_retainAutorelease(v32);
        v35 = objc_msgSend(v34, "mutableBytes");
        v36 = *v35 & 0xC0;
        *v35 |= 0xC0u;
        objc_msgSend(obja, "addObject:", v34);
        v37 = objc_alloc_init((Class)NSMutableData);
        v75 = v36 | v16;
        objc_msgSend(v37, "appendBytes:length:", &v75, 1);
        v74 = (16 * v31) | 3;
        objc_msgSend(v37, "appendBytes:length:", &v74, 1);
        objc_msgSend(v37, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v6), "bytes"), 3);
        if (((_BYTE)v68 - (_BYTE)v33) >= 0xDu)
          v38 = 13;
        else
          v38 = ((_BYTE)v68 - (_BYTE)v33);
        objc_msgSend(v37, "appendBytes:length:", v33, v38);
        v39 = objc_msgSend(v37, "length");
        v40 = (_BYTE)v70 - (_BYTE)v28;
        if (27 - v39 < ((_BYTE)v70 - (_BYTE)v28))
          v40 = 27 - objc_msgSend(v37, "length");
        v30 = &v33[v38];
        v41 = v40;
        objc_msgSend(v37, "appendBytes:length:", v28, v41);
        v28 += v41;
        objc_msgSend(v26, "addObject:", v37);

      }
      while (v31++ < 3);
      v2 = v66;
      v20 = v63;
      v25 = v26;
      v24 = obja;
    }
  }
  else
  {
    v25 = 0;
  }
  saAdvAddresses = v2->_saAdvAddresses;
  v44 = v24;
  v45 = saAdvAddresses;
  if (v44 == v45)
  {

  }
  else
  {
    v46 = v45;
    if ((v44 == 0) == (v45 != 0))
    {
      v49 = v44;
      goto LABEL_45;
    }
    v47 = -[NSArray isEqual:](v44, "isEqual:", v45);

    if (!v47)
      goto LABEL_51;
  }
  saPayloadSegments = v2->_saPayloadSegments;
  v49 = v25;
  v50 = saPayloadSegments;
  if (v49 == v50)
  {

    goto LABEL_47;
  }
  v46 = v50;
  if ((v49 == 0) == (v50 != 0))
  {
LABEL_45:

LABEL_51:
    objb = v24;
    v52 = v65;
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      goto LABEL_106;
    v53 = CUPrintNSObjectOneLine(v2->_saAdvAddresses);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v54 = CUPrintNSObjectOneLine(v44);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v55 = CUPrintNSObjectOneLine(v2->_saPayloadSegments);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = CUPrintNSObjectOneLine(v25);
    v58 = objc_claimAutoreleasedReturnValue(v57);
    v59 = (void *)v58;
    saAdvertiseRate = v2->_saAdvertiseRate;
    if (saAdvertiseRate > 39)
    {
      if (saAdvertiseRate <= 44)
      {
        if (saAdvertiseRate == 40)
        {
          v61 = "Medium";
          goto LABEL_81;
        }
        if (saAdvertiseRate == 42)
        {
          v61 = "MediumMid";
          goto LABEL_81;
        }
      }
      else
      {
        switch(saAdvertiseRate)
        {
          case '-':
            v61 = "MediumHigh";
            goto LABEL_81;
          case '2':
            v61 = "High";
            goto LABEL_81;
          case '<':
            v61 = "Max";
            goto LABEL_81;
        }
      }
    }
    else if (saAdvertiseRate <= 14)
    {
      if (!saAdvertiseRate)
      {
        v61 = "Default";
        goto LABEL_81;
      }
      if (saAdvertiseRate == 10)
      {
        v61 = "Periodic";
        goto LABEL_81;
      }
    }
    else
    {
      switch(saAdvertiseRate)
      {
        case 15:
          v61 = "PeriodicHigh";
          goto LABEL_81;
        case 20:
          v61 = "Background";
          goto LABEL_81;
        case 30:
          v61 = "Low";
          goto LABEL_81;
      }
    }
    v61 = "?";
LABEL_81:
    if (v20 > 39)
    {
      if (v20 <= 44)
      {
        if (v20 == 40)
        {
          v62 = "Medium";
          goto LABEL_105;
        }
        if (v20 == 42)
        {
          v62 = "MediumMid";
          goto LABEL_105;
        }
      }
      else
      {
        switch(v20)
        {
          case '-':
            v62 = "MediumHigh";
            goto LABEL_105;
          case '2':
            v62 = "High";
            goto LABEL_105;
          case '<':
            v62 = "Max";
            goto LABEL_105;
        }
      }
    }
    else if (v20 <= 14)
    {
      if (!v20)
      {
        v62 = "Default";
        goto LABEL_105;
      }
      if (v20 == 10)
      {
        v62 = "Periodic";
        goto LABEL_105;
      }
    }
    else
    {
      switch(v20)
      {
        case 15:
          v62 = "PeriodicHigh";
          goto LABEL_105;
        case 20:
          v62 = "Background";
          goto LABEL_105;
        case 30:
          v62 = "Low";
LABEL_105:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsPayload]", 30, "Safety Alerts updated: saAD <%@> -> <%@>, saPD <%@> -> <%@>, rate %s -> %s", v64, v69, v56, v58, v61, v62);

LABEL_106:
          v2->_saAdvertiseRate = v20;
          objc_storeStrong((id *)&v2->_saAdvAddresses, objb);
          objc_storeStrong((id *)&v2->_saPayloadSegments, v25);
          v2->_saChanged = 1;
          goto LABEL_107;
      }
    }
    v62 = "?";
    goto LABEL_105;
  }
  v51 = -[NSArray isEqual:](v49, "isEqual:", v50);

  if (!v51)
    goto LABEL_51;
LABEL_47:
  if (v20 != v2->_saAdvertiseRate)
    goto LABEL_51;
  v52 = v65;
  if (dword_100977E08 <= 10 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 10)))
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSafetyAlertsPayload]", 10, "Safety Alerts unchanged");
LABEL_107:

}

- (void)_updateSpatialInteractionAdvertising:(id *)a3
{
  void *v5;
  NSUUID *v6;
  NSData *v7;
  WPAdvertisingRequest **p_spatialInteractionAdvertisingRequest;
  WPAdvertisingRequest *v9;
  const char *v10;
  WPAdvertisingRequest *v11;
  void *v12;
  int spatialInteractionAdvertiseRate;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  if (self->_spatialInteractionChanged)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100994178, "advertisingManager"));
    v22 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "state") == (id)3)
      {
        v6 = self->_spatialInteractionWiProxUUID;
        if (!v6)
        {
          v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          objc_storeStrong((id *)&self->_spatialInteractionWiProxUUID, v6);
        }
        v7 = self->_spatialInteractionPayloadData;
        p_spatialInteractionAdvertisingRequest = &self->_spatialInteractionAdvertisingRequest;
        v9 = self->_spatialInteractionAdvertisingRequest;
        if (v9)
        {
          if (v7)
            v10 = "for restart";
          else
            v10 = "";
          if (dword_100977E08 < 31
            && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
          {
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]", 30, "Spatial advertise stop %s", v10);
          }
          objc_msgSend(v22, "removeAdvertisingRequest:forDaemon:", v9, v6);
          v11 = *p_spatialInteractionAdvertisingRequest;
          *p_spatialInteractionAdvertisingRequest = 0;

        }
        if (v7)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 19));
          objc_storeStrong((id *)&self->_spatialInteractionAdvertisingRequest, v12);
          objc_msgSend(v12, "setAdvertisingData:", v7);
          spatialInteractionAdvertiseRate = self->_spatialInteractionAdvertiseRate;
          v14 = 290;
          v15 = 48;
          v16 = 32;
          if (spatialInteractionAdvertiseRate != 60)
            v16 = 290;
          if (spatialInteractionAdvertiseRate != 50)
            v15 = v16;
          v17 = 192;
          v18 = 96;
          if (spatialInteractionAdvertiseRate != 45)
            v18 = 290;
          if (spatialInteractionAdvertiseRate != 42)
            v17 = v18;
          if (spatialInteractionAdvertiseRate <= 49)
            v15 = v17;
          v19 = 996;
          v20 = 432;
          if (spatialInteractionAdvertiseRate != 30)
            v20 = 290;
          if (spatialInteractionAdvertiseRate != 20)
            v19 = v20;
          if (spatialInteractionAdvertiseRate == 15)
            v14 = 1636;
          if (spatialInteractionAdvertiseRate == 10)
            v14 = 3200;
          if (spatialInteractionAdvertiseRate > 19)
            v14 = v19;
          if (spatialInteractionAdvertiseRate <= 41)
            v21 = v14;
          else
            v21 = v15;
          objc_msgSend(v12, "setAdvertisingRate:", v21);
          objc_msgSend(v12, "setConnectable:", 0);
          objc_msgSend(v12, "setIsRanging:", 1);
          objc_msgSend(v12, "setStopOnAdvertisingAddressChange:", 1);
          objc_msgSend(v12, "setEnableEPAForAdvertising:", a3->var4);
          if (dword_100977E08 <= 30
            && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
          {
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]", 30, "Spatial advertise start: <%@>, rate %.2f ms", v7, (double)(uint64_t)objc_msgSend(v12, "advertisingRate") * 0.625);
          }
          objc_msgSend(v22, "addAdvertisingRequest:forDaemon:", v12, v6);

        }
        self->_spatialInteractionChanged = 0;

      }
      else if (dword_100977E08 <= 30
             && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]", 30, "Spatial: Defer due to WiProx state: %d");
      }
    }
    else if (dword_100977E08 <= 90
           && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]", 90, "### Spatial: No WiProx advertising manager");
    }

  }
}

- (void)_updateSpatialInteractionPayload:(id *)a3
{
  _BOOL4 advertiserEnableEPA;
  NSArray *v6;
  id v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSData *v13;
  NSData *spatialInteractionPayloadData;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  unsigned int v18;
  NSData *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  advertiserEnableEPA = self->_advertiserEnableEPA;
  v6 = self->_spatialInteractionIdentifiers;
  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableData);
    objc_msgSend(v7, "appendBytes:length:", &self->_spatialInteractionFlags, 1);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_spatialInteractionIdentifiers;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "appendData:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v13 = self->_spatialInteractionUWBConfigData;
    if (v13)
      objc_msgSend(v7, "appendData:", v13);
    spatialInteractionPayloadData = self->_spatialInteractionPayloadData;
    v15 = (NSData *)v7;
    v16 = spatialInteractionPayloadData;
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      if ((v15 == 0) == (v16 != 0))
      {

        goto LABEL_24;
      }
      v18 = -[NSData isEqual:](v15, "isEqual:", v16);

      if (!v18)
      {
LABEL_24:
        if (dword_100977E08 <= 30
          && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
        {
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]", 30, "Spatial updated: <%@> -> <%@>", self->_spatialInteractionPayloadData, v15, (_QWORD)v20);
        }
        objc_storeStrong((id *)&self->_spatialInteractionPayloadData, v7);
        self->_spatialInteractionChanged = 1;
        -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v15, 0, advertiserEnableEPA);
LABEL_31:

        goto LABEL_34;
      }
    }
    if (dword_100977E08 <= 10
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 10)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]", 10, "Spatial unchanged: <%@>", v15);
    }
    goto LABEL_31;
  }
  if (self->_spatialInteractionPayloadData)
  {
    if (dword_100977E08 <= 30
      && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
    {
      LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]", 30, "Spatial cleared");
    }
    v19 = self->_spatialInteractionPayloadData;
    self->_spatialInteractionPayloadData = 0;

    self->_spatialInteractionChanged = 1;
  }
LABEL_34:

}

- (void)_updateNearbyActionNoWakePayload:(id *)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int16 v22;
  _BYTE v23[128];

  v22 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_advertiserArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "nearbyActionNoWakeType", (_QWORD)v18);
        LOBYTE(v22) = v11;
        if (v11)
        {
          v17 = objc_msgSend(v10, "nearbyActionNWPrecisionFindingStatus");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyActionNoWakeAuthTagData"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyActionNoWakeConfigData"));
          v13 = objc_msgSend(v10, "advertiseRate");
          v12 = objc_msgSend(v10, "enableEPAForLEAdvertisement");

          v16 = objc_alloc_init((Class)NSMutableData);
          HIBYTE(v22) = v17 & 0xFE | (objc_msgSend(v14, "length") == (id)1);
          objc_msgSend(v16, "appendBytes:length:", &v22, 1);
          objc_msgSend(v16, "appendBytes:length:", (char *)&v22 + 1, 1);
          if (objc_msgSend(v15, "length") == (id)3)
            objc_msgSend(v16, "appendData:", v15);
          if (objc_msgSend(v14, "length") == (id)1)
            objc_msgSend(v16, "appendData:", v14);
          goto LABEL_14;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
LABEL_14:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v16, v13, v12, (_QWORD)v18);

}

- (void)_updateWatchSetupAdvertising
{
  NSData *v3;
  CBStackBLEAdvertiser *v4;
  CBStackBLEAdvertiser *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int watchSetupAdvertiseRate;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  CBStackBLEAdvertiser *watchSetupStackAdvertiser;
  CBStackBLEAdvertiser *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  id v22;

  if (self->_watchSetupChanged)
  {
    v3 = self->_watchSetupPayloadData;
    if (!v3)
    {
      if (dword_100977E08 <= 30
        && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 30)))
      {
        LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]", 30, "WatchSetup advertise stop");
      }
      -[CBStackBLEAdvertiser invalidate](self->_watchSetupStackAdvertiser, "invalidate");
      watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
      self->_watchSetupStackAdvertiser = 0;

      goto LABEL_62;
    }
    v4 = self->_watchSetupStackAdvertiser;
    if (v4)
    {
      v5 = v4;
      if (dword_100977E08 > 30
        || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      {
        goto LABEL_61;
      }
      v6 = CUPrintNSDataHex(v3, 100, 1);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)v7;
      watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
      if (watchSetupAdvertiseRate <= 39)
      {
        if (watchSetupAdvertiseRate > 19)
        {
          if (watchSetupAdvertiseRate == 20)
          {
            v10 = "350 ms";
            goto LABEL_52;
          }
        }
        else
        {
          if (watchSetupAdvertiseRate == 10)
          {
            v10 = "2 seconds";
            goto LABEL_52;
          }
          if (watchSetupAdvertiseRate == 15)
          {
            v10 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }
      else if (watchSetupAdvertiseRate <= 44)
      {
        if (watchSetupAdvertiseRate == 40)
        {
          v10 = "181.25 ms";
          goto LABEL_52;
        }
        if (watchSetupAdvertiseRate == 42)
        {
          v10 = "120 ms";
          goto LABEL_52;
        }
      }
      else
      {
        switch(watchSetupAdvertiseRate)
        {
          case '-':
            v10 = "60 ms";
            goto LABEL_52;
          case '2':
            v10 = "30 ms";
            goto LABEL_52;
          case '<':
            v10 = "20 ms";
LABEL_52:
            LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]", 30, "WatchSetup advertise update: <%@>, rate %s", v7, v10);

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:](v5, "setAdvertiseRate:", self->_watchSetupAdvertiseRate);
            v18 = objc_alloc_init((Class)NSMutableData);
            v21 = 6;
            objc_msgSend(v18, "appendBytes:length:", &v21, 1);
            objc_msgSend(v18, "appendData:", v3);
            v19 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            objc_msgSend(v19, "setServiceUUID16:", 65061);
            objc_msgSend(v19, "setServiceData:", v18);
            objc_msgSend(v19, "setConnectable:", 1);
            v22 = v19;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
            -[CBStackBLEAdvertiser setServiceDataArray:](v5, "setServiceDataArray:", v20);

            -[CBStackBLEAdvertiser activate](v5, "activate");
LABEL_62:
            self->_watchSetupChanged = 0;
LABEL_63:

            return;
        }
      }
      v10 = "270 ms";
      goto LABEL_52;
    }
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
    {
LABEL_59:
      v17 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleAdvertiserClass](self->_stackAdaptor, "bleAdvertiserClass")));
      if (!v17)
      {
        if (dword_100977E08 <= 90
          && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 90)))
        {
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]", 90, "### WatchSetup advertiser create failed");
        }
        goto LABEL_63;
      }
      v5 = v17;
      objc_storeStrong((id *)&self->_watchSetupStackAdvertiser, v17);
      -[CBStackBLEAdvertiser setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_61;
    }
    v11 = CUPrintNSDataHex(v3, 100, 1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    v14 = self->_watchSetupAdvertiseRate;
    if (v14 <= 39)
    {
      if (v14 > 19)
      {
        if (v14 == 20)
        {
          v15 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v14 == 10)
        {
          v15 = "2 seconds";
          goto LABEL_58;
        }
        if (v14 == 15)
        {
          v15 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v14 <= 44)
    {
      if (v14 == 40)
      {
        v15 = "181.25 ms";
        goto LABEL_58;
      }
      if (v14 == 42)
      {
        v15 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v14)
      {
        case '-':
          v15 = "60 ms";
          goto LABEL_58;
        case '2':
          v15 = "30 ms";
          goto LABEL_58;
        case '<':
          v15 = "20 ms";
LABEL_58:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]", 30, "WatchSetup advertise start: <%@>, rate %s", v12, v15);

          goto LABEL_59;
      }
    }
    v15 = "270 ms";
    goto LABEL_58;
  }
}

- (void)_updateWatchSetupPayload
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  NSData *watchSetupPayloadData;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int watchSetupAdvertiseRate;
  const char *v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_advertiserArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "nearbyActionType") != 5)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "watchSetupData"));
          if (v8)
          {
            v9 = (void *)v8;
            LODWORD(v4) = objc_msgSend(v7, "advertiseRate");
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  watchSetupPayloadData = self->_watchSetupPayloadData;
  v11 = v9;
  v12 = watchSetupPayloadData;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

      goto LABEL_22;
    }
    v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14)
      goto LABEL_22;
  }
  if ((_DWORD)v4 != self->_watchSetupAdvertiseRate)
  {
LABEL_22:
    if (dword_100977E08 > 30 || dword_100977E08 == -1 && !_LogCategory_Initialize(&dword_100977E08, 30))
      goto LABEL_77;
    v17 = CUPrintNSDataHex(self->_watchSetupPayloadData, 100, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = CUPrintNSDataHex(v11, 100, 1);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
    if (watchSetupAdvertiseRate > 39)
    {
      if (watchSetupAdvertiseRate <= 44)
      {
        if (watchSetupAdvertiseRate == 40)
        {
          v23 = "Medium";
          goto LABEL_52;
        }
        if (watchSetupAdvertiseRate == 42)
        {
          v23 = "MediumMid";
          goto LABEL_52;
        }
      }
      else
      {
        switch(watchSetupAdvertiseRate)
        {
          case '-':
            v23 = "MediumHigh";
            goto LABEL_52;
          case '2':
            v23 = "High";
            goto LABEL_52;
          case '<':
            v23 = "Max";
            goto LABEL_52;
        }
      }
    }
    else if (watchSetupAdvertiseRate <= 14)
    {
      if (!watchSetupAdvertiseRate)
      {
        v23 = "Default";
        goto LABEL_52;
      }
      if (watchSetupAdvertiseRate == 10)
      {
        v23 = "Periodic";
        goto LABEL_52;
      }
    }
    else
    {
      switch(watchSetupAdvertiseRate)
      {
        case 15:
          v23 = "PeriodicHigh";
          goto LABEL_52;
        case 20:
          v23 = "Background";
          goto LABEL_52;
        case 30:
          v23 = "Low";
          goto LABEL_52;
      }
    }
    v23 = "?";
LABEL_52:
    if ((int)v4 > 39)
    {
      if ((int)v4 <= 44)
      {
        if ((_DWORD)v4 == 40)
        {
          v24 = "Medium";
          goto LABEL_76;
        }
        if ((_DWORD)v4 == 42)
        {
          v24 = "MediumMid";
          goto LABEL_76;
        }
      }
      else
      {
        switch((_DWORD)v4)
        {
          case '-':
            v24 = "MediumHigh";
            goto LABEL_76;
          case '2':
            v24 = "High";
            goto LABEL_76;
          case '<':
            v24 = "Max";
            goto LABEL_76;
        }
      }
    }
    else if ((int)v4 <= 14)
    {
      if (!(_DWORD)v4)
      {
        v24 = "Default";
        goto LABEL_76;
      }
      if ((_DWORD)v4 == 10)
      {
        v24 = "Periodic";
        goto LABEL_76;
      }
    }
    else
    {
      switch((_DWORD)v4)
      {
        case 0xF:
          v24 = "PeriodicHigh";
          goto LABEL_76;
        case 0x14:
          v24 = "Background";
          goto LABEL_76;
        case 0x1E:
          v24 = "Low";
LABEL_76:
          LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupPayload]", 30, "WatchSetup updated: <%@> -> <%@>, rate %s -> %s", v18, v20, v23, v24, (_QWORD)v25);

LABEL_77:
          self->_watchSetupAdvertiseRate = (int)v4;
          objc_storeStrong((id *)&self->_watchSetupPayloadData, v9);
          self->_watchSetupChanged = 1;
          goto LABEL_78;
      }
    }
    v24 = "?";
    goto LABEL_76;
  }
  if (dword_100977E08 <= 10 && (dword_100977E08 != -1 || _LogCategory_Initialize(&dword_100977E08, 10)))
  {
    v15 = CUPrintNSDataHex(v11, 100, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe(&dword_100977E08, "-[CBAdvertiserDaemon _updateWatchSetupPayload]", 10, "WatchSetup unchanged: <%@>", v16);

  }
LABEL_78:

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 872);
}

- (BOOL)advertiserEnableEPA
{
  return self->_advertiserEnableEPA;
}

- (void)setAdvertiserEnableEPA:(BOOL)a3
{
  self->_advertiserEnableEPA = a3;
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_daemonServer, a3);
}

- (void)setSelfAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 896);
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (void)setStackAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_stackAdaptor, a3);
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 912);
}

- (int)spatialInteractionAdvertiseRate
{
  return self->_spatialInteractionAdvertiseRate;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionUWBConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionIdentifiers, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong((id *)&self->_stackAdaptor, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_advertiserArray, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_watchSetupStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_watchSetupPayloadData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionWiProxUUID, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPayloadData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionAdvertisingRequest, 0);
  sub_1000AFCC4((id *)&self->_spatialInteractionWiProxContext);
  sub_1000AFCC4((id *)&self->_nearbyActionNoWakeWiProxContext);
  sub_1000AFCC4((id *)&self->_nearbyInfoV2WiProxContext);
  sub_1000AFCC4((id *)&self->_nearbyInfoWiProxContext);
  sub_1000AFCC4((id *)&self->_nearbyActionV2WiProxContext);
  sub_1000AFCC4((id *)&self->_nearbyActionV1WiProxContext);
  sub_1000AFCC4((id *)&self->_heySiriWiProxContext);
  sub_1000AFCC4((id *)&self->_dsInfoWiProxContext);
  sub_1000AFCC4((id *)&self->_airplayTargetWiProxContext);
  sub_1000AFCC4((id *)&self->_airplaySourceWiProxContext);
  sub_1000AFCC4((id *)&self->_airdropWiProxContext);
  objc_storeStrong((id *)&self->_saStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_saPayloadSegments, 0);
  objc_storeStrong((id *)&self->_saAdvAddresses, 0);
  objc_storeStrong((id *)&self->_fidoStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_fidoPayloadData, 0);
  objc_storeStrong((id *)&self->_appleTypeStackAdvertiser, 0);
}

@end
