@implementation APEncryptedID

- (NSUUID)unencryptedIAdID
{
  return self->_unencryptedIAdID;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (NSData)contentID
{
  return self->_contentID;
}

- (NSData)anonymousDemandID
{
  return self->_anonymousDemandID;
}

- (NSData)DPID
{
  return self->_DPID;
}

- (APEncryptedID)initWithIDAccountPrivate:(id)a3
{
  id v4;
  APEncryptedID *v5;
  uint64_t v6;
  NSUUID *unencryptedIAdID;
  void *v8;
  void *v9;
  CFDataRef v10;
  uint64_t v11;
  NSData *deviceNewsPlusSubscriberID;
  void *v13;
  void *v14;
  CFDataRef v15;
  uint64_t v16;
  NSData *anonymousDemandID;
  void *v18;
  void *v19;
  CFDataRef v20;
  uint64_t v21;
  NSData *contentID;
  void *v23;
  CFDataRef v24;
  uint64_t v25;
  NSData *DPID;
  void *v27;
  void *v28;
  CFDataRef v29;
  uint64_t v30;
  NSData *iAdID;
  void *v32;
  void *v33;
  CFDataRef v34;
  uint64_t v35;
  NSData *toroID;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)APEncryptedID;
  v5 = -[APEncryptedID init](&v38, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iAdID"));
    unencryptedIAdID = v5->_unencryptedIAdID;
    v5->_unencryptedIAdID = (NSUUID *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceNewsPlusSubscriberID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = encryptStringForAdServing(v9, CFSTR("deviceNewsPlusSubscriberID"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    deviceNewsPlusSubscriberID = v5->_deviceNewsPlusSubscriberID;
    v5->_deviceNewsPlusSubscriberID = (NSData *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anonymousDemandID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    v15 = encryptStringForAdServing(v14, CFSTR("anonymousDemandID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    anonymousDemandID = v5->_anonymousDemandID;
    v5->_anonymousDemandID = (NSData *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    v20 = encryptStringForAdServing(v19, CFSTR("contentID"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    contentID = v5->_contentID;
    v5->_contentID = (NSData *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "DPID"));
    v24 = encryptStringForAdServing(v23, CFSTR("DPID"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    DPID = v5->_DPID;
    v5->_DPID = (NSData *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iAdID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
    v29 = encryptStringForAdServing(v28, CFSTR("iAdID"));
    v30 = objc_claimAutoreleasedReturnValue(v29);
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSData *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toroID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUIDString"));
    v34 = encryptStringForAdServing(v33, CFSTR("toroID"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    toroID = v5->_toroID;
    v5->_toroID = (NSData *)v35;

  }
  return v5;
}

- (NSData)deviceNewsPlusSubscriberID
{
  return self->_deviceNewsPlusSubscriberID;
}

- (NSData)toroID
{
  return self->_toroID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unencryptedIAdID, 0);
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandID, 0);
  objc_storeStrong((id *)&self->_deviceNewsPlusSubscriberID, 0);
}

@end
