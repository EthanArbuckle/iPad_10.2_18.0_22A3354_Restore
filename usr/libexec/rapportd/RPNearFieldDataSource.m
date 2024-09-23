@implementation RPNearFieldDataSource

- (RPNearFieldDataSource)initWithDispatchQueue:(id)a3
{
  id v5;
  RPNearFieldDataSource *v6;
  RPNearFieldDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPNearFieldDataSource;
  v6 = -[RPNearFieldDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    sub_10004BCF8();
  }

  return v7;
}

- (id)createAuthenticationPayloadWithPkData:(id)a3 bonjourListenerUUID:(id)a4
{
  id v6;
  id v7;
  RPNearFieldAuthenticationPayload *v8;
  void *v9;
  void *v10;
  RPNearFieldAuthenticationPayload *v11;

  v6 = a4;
  v7 = a3;
  v8 = [RPNearFieldAuthenticationPayload alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _identityForNFCDeviceDiscovery](self, "_identityForNFCDeviceDiscovery"));
  v11 = -[RPNearFieldAuthenticationPayload initWithTimeStamp:pkData:bonjourListenerUUID:selfIdentity:](v8, "initWithTimeStamp:pkData:bonjourListenerUUID:selfIdentity:", v9, v7, v6, v10);

  return v11;
}

- (id)createValidationPayloadWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  return -[RPNearFieldValidationPayload initWithKnownIdentity:supportsApplicationLabel:]([RPNearFieldValidationPayload alloc], "initWithKnownIdentity:supportsApplicationLabel:", a3, a4);
}

- (id)createRequestMessageWithApplicationLabel:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "type") == (id)1)
    v8 = objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _requestMessageMetadata](self, "_requestMessageMetadata"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPTransportServiceHandoverMessage messageWithMetadata:applicationLabel:payload:version:](RPTransportServiceHandoverMessage, "messageWithMetadata:applicationLabel:payload:version:", v8, v7, v6, CFSTR("1.1")));

  return v10;
}

- (id)createResponseWithApplicationLabel:(id)a3 payload:(id)a4 forRequestMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableArray);
  if (sub_100050908((unint64_t)objc_msgSend(v9, "type")))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transportServicesMetadata", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16), "serviceType");
          if (sub_1000693AC((uint64_t)v17))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _transportServiceMetadataWithServiceType:](self, "_transportServiceMetadataWithServiceType:", v17));
            if (v18)
              objc_msgSend(v11, "addObject:", v18);

          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPTransportServiceHandoverMessage messageWithMetadata:applicationLabel:payload:version:](RPTransportServiceHandoverMessage, "messageWithMetadata:applicationLabel:payload:version:", v11, v8, v9, CFSTR("1.1")));

  return v19;
}

- (id)createTapEventWithApplicationLabel:(id)a3 singleBandAWDLModeRequested:(BOOL)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 identity:(id)a7 isUnsupportedApplicationLabel:(BOOL)a8 flags:(unsigned int)a9
{
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  RPNearFieldTapEvent *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v30;

  v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v19 = objc_msgSend(v14, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceID"));
  if (v21)
  {
    if (a4)
    {
LABEL_3:
      v22 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));

    if (a4)
      goto LABEL_3;
  }
  v22 = sub_10004BCF8();
LABEL_6:
  HIDWORD(v28) = a9;
  BYTE2(v28) = a8;
  BYTE1(v28) = v14 != 0;
  LOBYTE(v28) = v22;
  v24 = -[RPNearFieldTapEvent initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:]([RPNearFieldTapEvent alloc], "initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:", v21, v18, v17, v16, v19 == 2, v20, v30, v28);

  if (v19 == 2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    -[RPNearFieldTapEvent setDeviceName:](v24, "setDeviceName:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    -[RPNearFieldTapEvent setDeviceModel:](v24, "setDeviceModel:", v26);

  }
  return v24;
}

- (id)_selfIdentity
{
  void *v2;
  void *v3;
  RPIdentity *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identityOfSelfAndReturnError:", 0));

  v4 = objc_opt_new(RPIdentity);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "edPKData"));
  -[RPIdentity setEdPKData:](v4, "setEdPKData:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "edSKData"));
  -[RPIdentity setEdSKData:](v4, "setEdSKData:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceIRKData"));
  -[RPIdentity setDeviceIRKData:](v4, "setDeviceIRKData:", v7);

  return v4;
}

- (id)_identityForNFCDeviceDiscovery
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _selfIdentity](self, "_selfIdentity"));
  if (!v2)
  {
    if (dword_100130858 <= 60
      && (dword_100130858 != -1 || _LogCategory_Initialize(&dword_100130858, 60)))
    {
      LogPrintF(&dword_100130858, "-[RPNearFieldDataSource _identityForNFCDeviceDiscovery]", 60, "Missing SelfIdentity, creating a temporary one");
    }
    v2 = objc_msgSend(objc_alloc((Class)RPIdentity), "initWithType:", 14);
    v3 = NSRandomData(16, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "setDeviceIRKData:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localDeviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));
  objc_msgSend(v2, "setModel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionPairingIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v2, "setIdentifier:", v10);

  return v2;
}

- (id)_transportServiceMetadataWithServiceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _AWDLBonjourTransportServiceMetadata](self, "_AWDLBonjourTransportServiceMetadata", v3, v4));
  else
    return 0;
}

- (id)_AWDLBonjourTransportServiceMetadata
{
  return -[RPAWDLBonjourTransportServiceMetadata initWithSingleBandModeRequired:]([RPAWDLBonjourTransportServiceMetadata alloc], "initWithSingleBandModeRequired:", sub_10004BCF8());
}

- (id)_requestMessageMetadata
{
  NSMutableArray *v3;
  void *v4;

  v3 = objc_opt_new(NSMutableArray);
  if (sub_1000693AC(1))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _transportServiceMetadataWithServiceType:](self, "_transportServiceMetadataWithServiceType:", 1));
    if (v4)
      -[NSMutableArray addObject:](v3, "addObject:", v4);

  }
  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
