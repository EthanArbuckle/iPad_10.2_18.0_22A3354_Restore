@implementation NRDiscoveryClient

- (NSString)description
{
  return (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("NRDiscoveryClient[%llu, %@]"), self->_identifier, self->_candidateServiceIdentifier);
}

- (void)publisherStarted:(id)a3
{
  NRDiscoveryClient *v3;
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  NSUUID *nrUUID;
  id v8;

  v3 = self;
  if (self)
    self = (NRDiscoveryClient *)self->_nrUUID;
  v4 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0);

  if (IsLevelEnabled)
  {
    if (v3)
      nrUUID = v3->_nrUUID;
    else
      nrUUID = 0;
    v8 = (id)_NRCopyLogObjectForNRUUID(nrUUID, v6);
    _NRLogWithArgs(v8, 0, "%s%.30s:%-4d NAN: publisher started", ", "-[NRDiscoveryClient publisherStarted:]", 2099);

  }
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  NRDiscoveryClient *v11;
  int64_t v12;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001198D8;
  block[3] = &unk_1001B82A0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  NRDiscoveryClient *v11;
  int64_t v12;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100119808;
  block[3] = &unk_1001B82A0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSUUID *v12;
  void *v13;
  int v14;
  NSUUID *v15;
  NSUUID *v16;
  uint64_t v17;
  void *v18;
  NSUUID *nrUUID;
  void *v20;
  int IsLevelEnabled;
  uint64_t v22;
  NSUUID *v23;
  void *v24;
  NSObject *queue;
  _QWORD block[4];
  id v27;
  NRDiscoveryClient *v28;
  id v29;

  v8 = a3;
  v29 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a4, 0, 0, &v29));
  v11 = v29;
  if (!v11)
  {
    if (self)
      nrUUID = self->_nrUUID;
    else
      nrUUID = 0;
    v20 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v10);
    IsLevelEnabled = _NRLogIsLevelEnabled(v20, 0);

    if (IsLevelEnabled)
    {
      if (self)
        v23 = self->_nrUUID;
      else
        v23 = 0;
      v24 = (void *)_NRCopyLogObjectForNRUUID(v23, v22);
      _NRLogWithArgs(v24, 0, "%s%.30s:%-4d NAN: publisher received message %@", ", "-[NRDiscoveryClient publisher:receivedMessage:fromSubscriberID:subscriberAddress:]", 2137, v9);

    }
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100119800;
    block[3] = &unk_1001B8778;
    v27 = v8;
    v28 = self;
    dispatch_async(queue, block);
    v18 = v27;
    goto LABEL_17;
  }
  if (self)
    v12 = self->_nrUUID;
  else
    v12 = 0;
  v13 = (void *)_NRCopyLogObjectForNRUUID(v12, v10);
  v14 = _NRLogIsLevelEnabled(v13, 16);

  if (v14)
  {
    if (self)
      v15 = self->_nrUUID;
    else
      v15 = 0;
    v16 = v15;
    v18 = (void *)_NRCopyLogObjectForNRUUID(v16, v17);
    _NRLogWithArgs(v18, 16, "%s%.30s:%-4d unarchive error %@", ", "-[NRDiscoveryClient publisher:receivedMessage:fromSubscriberID:subscriberAddress:]", 2133, v11);

LABEL_17:
  }

}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NRDiscoveryClient *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100119660;
  v13[3] = &unk_1001B82C8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NRDiscoveryClient *v16;
  id v17;
  unsigned int v18;

  v9 = a3;
  v10 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100119490;
  v14[3] = &unk_1001B82F0;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = a5;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (void)subscriberStarted:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001193B8;
  v7[3] = &unk_1001B8778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001192D8;
  block[3] = &unk_1001B82A0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001191F8;
  block[3] = &unk_1001B82A0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = a5;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100118F98;
  v13[3] = &unk_1001B8318;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117880;
  block[3] = &unk_1001B87A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117784;
  block[3] = &unk_1001B82A0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001167B8;
  v9[3] = &unk_1001B8778;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011660C;
  block[3] = &unk_1001B82A0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)dataSessionRequestStarted:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001163E8;
  v7[3] = &unk_1001B8778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_wfaNANPeers, 0);
  objc_storeStrong((id *)&self->_wfaSubscriber, 0);
  objc_storeStrong((id *)&self->_wfaPublisher, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourServiceType, 0);
  objc_storeStrong((id *)&self->_candidateServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_rpSelfIdentity, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_advertisers, 0);
  objc_storeStrong((id *)&self->_initialKeyData, 0);
  objc_storeStrong((id *)&self->_pskDataForAuthTag, 0);
  objc_storeStrong((id *)&self->_advertisingNonceData, 0);
  objc_storeStrong((id *)&self->_advertisingDeviceTypeHash, 0);
  objc_storeStrong((id *)&self->_advertisingAuthTag, 0);
  objc_storeStrong((id *)&self->_advertisingServiceName, 0);
  objc_storeStrong((id *)&self->_nrldmLinkTypesForDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong(&self->_deviceChangedBlock, 0);
  objc_storeStrong(&self->_deviceLostBlock, 0);
  objc_storeStrong(&self->_deviceFoundBlock, 0);
  objc_storeStrong((id *)&self->_rapportQueryClients, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_rapportAdvertiser, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
