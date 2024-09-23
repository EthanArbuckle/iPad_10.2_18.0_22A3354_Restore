@implementation SDActivityDeviceRecord

- (SDActivityDeviceRecord)initWithDevice:(id)a3
{
  id v5;
  SDActivityDeviceRecord *v6;
  SDActivityDeviceRecord *v7;
  SDActivityDeviceRecord *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SDActivityDeviceRecord;
    v6 = -[SDActivityDeviceRecord init](&v10, "init");
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_idsDevice, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
  v8 = CFSTR("YES");
  if (!v7)
    v8 = CFSTR("NO");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, deviceUniqueID:%@, hasKey:%@, lastReceivedAdvertisementDate:%@>"), v5, self, v6, v8, self->_lastReceivedAdvertisementDate));

  return v9;
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 newAdvertisementHandler:(id)a5
{
  -[SDActivityDeviceRecord updateWithRawAdvertisementData:receivedViaScanning:isReplay:newAdvertisementHandler:](self, "updateWithRawAdvertisementData:receivedViaScanning:isReplay:newAdvertisementHandler:", a3, a4, 0, a5);
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 isReplay:(BOOL)a5 newAdvertisementHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, void *, _QWORD);
  int v12;
  __int16 v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  NSData *v18;
  NSData *v19;
  void *v20;
  unsigned __int8 v21;
  NSDate *v22;
  NSDate *v23;
  NSData *v24;
  NSData *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  NSData *v35;
  NSData *lastRawAdvertisementData;
  NSDate *v37;
  NSDate *lastReceivedAdvertisementDate;
  NSData *v39;
  NSData *lastAdvertisementData;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSData *v51;
  NSData *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _BOOL4 v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  _BOOL4 disableDuplicateFilterOnce;
  const __CFString *v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  SDActivityDeviceRecord *v70;
  id v71;
  void (**v72)(id, void *, _QWORD);
  __int16 v73;
  BOOL v74;
  uint64_t v75;
  int v76;
  __int16 v77;
  NSErrorUserInfoKey v78;
  const __CFString *v79;
  uint8_t buf[4];
  _BYTE v81[10];
  _BYTE v82[10];
  _BYTE v83[10];
  const __CFString *v84;

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(id, void *, _QWORD))a6;
  if (!-[NSData isEqual:](self->_lastRawAdvertisementData, "isEqual:", v10)
    || self->_disableDuplicateFilterOnce
    || v7)
  {
    v75 = sub_1000C04F4(v10);
    v76 = v12;
    v77 = v13;
    if (!a4)
    {
      v35 = (NSData *)objc_msgSend(v10, "copy");
      lastRawAdvertisementData = self->_lastRawAdvertisementData;
      self->_lastRawAdvertisementData = v35;

      v37 = objc_opt_new(NSDate);
      lastReceivedAdvertisementDate = self->_lastReceivedAdvertisementDate;
      self->_lastReceivedAdvertisementDate = v37;

      v39 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v75, 14));
      lastAdvertisementData = self->_lastAdvertisementData;
      self->_lastAdvertisementData = v39;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord clientAdvertisement](self, "clientAdvertisement"));
      v11[2](v11, v16, 0);
LABEL_23:

      goto LABEL_24;
    }
    v14 = handoff_log();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v60 = SFHexStringForData(v10);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v62 = objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
      v63 = (void *)v62;
      v64 = CFSTR("NO");
      disableDuplicateFilterOnce = self->_disableDuplicateFilterOnce;
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v81 = v61;
      if (v7)
        v66 = CFSTR("YES");
      else
        v66 = CFSTR("NO");
      *(_WORD *)&v81[8] = 2112;
      if (disableDuplicateFilterOnce)
        v64 = CFSTR("YES");
      *(_QWORD *)v82 = v62;
      *(_WORD *)&v82[8] = 2112;
      *(_QWORD *)v83 = v66;
      *(_WORD *)&v83[8] = 2112;
      v84 = v64;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Received a new rawAdvertisementData %@ from %@ (isReplay:%@, disabledDuplicateFilter:%@)", buf, 0x2Au);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
    v17 = sub_1000C0590(v75);
    if (v16)
    {
      if (self->_disableDuplicateFilterOnce && v17 == -[SDActivityDeviceRecord lastCounter](self, "lastCounter")
        || v17 > -[SDActivityDeviceRecord lastCounter](self, "lastCounter"))
      {
        self->_disableDuplicateFilterOnce = 0;
        v18 = (NSData *)objc_msgSend(v10, "copy");
        v19 = self->_lastRawAdvertisementData;
        self->_lastRawAdvertisementData = v18;

        v67 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)&v75 + 4, 10));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
        v21 = objc_msgSend(v20, "getResultWhileDecryptingBytesInPlace:andCounter:withTag:version:", (char *)&v75 + 4, (char *)&v75 + 1, BYTE3(v75), v75);

        if ((v21 & 1) != 0)
        {
          v22 = objc_opt_new(NSDate);
          v23 = self->_lastReceivedAdvertisementDate;
          self->_lastReceivedAdvertisementDate = v22;

          v24 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v75, 14));
          v25 = self->_lastAdvertisementData;
          self->_lastAdvertisementData = v24;

          v26 = handoff_log();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)v67;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v29 = SFHexStringForData(v67);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            v31 = SFHexStringForData(self->_lastAdvertisementData);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            v33 = -[SDActivityDeviceRecord lastCounter](self, "lastCounter");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v81 = v30;
            *(_WORD *)&v81[8] = 2112;
            *(_QWORD *)v82 = v32;
            *(_WORD *)&v82[8] = 1024;
            *(_DWORD *)v83 = v33;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Successfully decrypted advertisement (sharing flags + advertisementPayload): %@ => %@, counter: %u", buf, 0x1Cu);

          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord clientAdvertisement](self, "clientAdvertisement"));
          v11[2](v11, v34, 0);
          goto LABEL_22;
        }
        v57 = handoff_log();
        v52 = (NSData *)objc_claimAutoreleasedReturnValue(v57);
        v58 = os_log_type_enabled(&v52->super, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v58)
            sub_100031228((uint64_t)self, (uint64_t)v10);

          v78 = NSLocalizedDescriptionKey;
          v79 = CFSTR("Failed to decrypt advertisement");
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v34));
          ((void (**)(id, void *, void *))v11)[2](v11, 0, v59);

          goto LABEL_21;
        }
        if (v58)
          sub_1000312C0((uint64_t)self, (uint64_t)v10);
LABEL_20:

        v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityPayloadManager sharedPayloadManager](SDActivityPayloadManager, "sharedPayloadManager"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "keyIdentifier"));
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_100030B9C;
        v68[3] = &unk_100714940;
        v69 = v16;
        v70 = self;
        v71 = v10;
        v74 = a4;
        v72 = v11;
        v73 = v17;
        objc_msgSend(v53, "sendEncryptionKeyRequestToDeviceIdentifier:previousKeyIdentifier:completionHandler:", v54, v56, v68);

        v34 = v69;
LABEL_21:
        v28 = (void *)v67;
LABEL_22:

        goto LABEL_23;
      }
      v46 = handoff_log();
      v42 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v47 = -[SDActivityDeviceRecord lastCounter](self, "lastCounter");
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
        v49 = SFHexStringForData(v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v81 = v17;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v47;
        *(_WORD *)v82 = 2112;
        *(_QWORD *)&v82[2] = v48;
        *(_WORD *)v83 = 2112;
        *(_QWORD *)&v83[2] = v50;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "New counter %d is not greater than previous %d from %@ with rawAdvertisementData %@. Requesting new key", buf, 0x22u);

      }
    }
    else
    {
      v41 = handoff_log();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueID](self->_idsDevice, "uniqueID"));
        v44 = SFHexStringForData(v10);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v81 = v43;
        *(_WORD *)&v81[8] = 2112;
        *(_QWORD *)v82 = v45;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No current key to decrypt advertisement from %@ with rawAdvertisementData %@. Requesting key", buf, 0x16u);

      }
    }

    self->_disableDuplicateFilterOnce = 0;
    v51 = (NSData *)objc_msgSend(v10, "copy");
    v67 = 0;
    v52 = self->_lastRawAdvertisementData;
    self->_lastRawAdvertisementData = v51;
    goto LABEL_20;
  }
LABEL_24:

}

- (SDActivityDecryptionKey)decryptionKey
{
  void *v3;
  void *v4;
  void *v5;
  NSUUID *lastUsedKeyIdentifier;
  void *v7;
  NSUUID *v8;
  NSUUID *v9;
  NSData *lastAdvertisementData;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decryptionKeyForDeviceIdentifier:", v4));

  lastUsedKeyIdentifier = self->_lastUsedKeyIdentifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyIdentifier"));
  LOBYTE(lastUsedKeyIdentifier) = -[NSUUID isEqual:](lastUsedKeyIdentifier, "isEqual:", v7);

  if ((lastUsedKeyIdentifier & 1) == 0)
  {
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyIdentifier"));
    v9 = self->_lastUsedKeyIdentifier;
    self->_lastUsedKeyIdentifier = v8;

    lastAdvertisementData = self->_lastAdvertisementData;
    self->_lastAdvertisementData = 0;

  }
  return (SDActivityDecryptionKey *)v5;
}

- ($126081439F6B1623D1821CF14B226F9E)lastActivityAdvertisement
{
  NSData *lastAdvertisementData;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $126081439F6B1623D1821CF14B226F9E result;

  lastAdvertisementData = self->_lastAdvertisementData;
  if (!lastAdvertisementData)
    lastAdvertisementData = self->_lastRawAdvertisementData;
  v4 = sub_1000C04F4(lastAdvertisementData);
  v6 = v5 & 0xFFFFFFFFFFFFLL;
  result.var8 = v6;
  result.var9 = BYTE1(v6);
  result.var10 = BYTE2(v6);
  result.var11 = BYTE3(v6);
  result.var12 = BYTE4(v6);
  result.var13 = BYTE5(v6);
  result.var0 = v4;
  result.var1 = BYTE1(v4);
  result.var2 = BYTE2(v4);
  result.var3 = BYTE3(v4);
  result.var4 = BYTE4(v4);
  result.var5 = BYTE5(v4);
  result.var6 = BYTE6(v4);
  result.var7 = HIBYTE(v4);
  return result;
}

- (unsigned)lastCounter
{
  void *v4;
  void *v5;

  if (self->_lastAdvertisementData)
    return sub_1000C0590(-[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
    LOWORD(v4) = (unsigned __int16)objc_msgSend(v5, "lastUsedCounter") - 1;

  }
  return (unsigned __int16)v4;
}

- (NSData)lastAdvertisementPayload
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;

  if (self->_lastAdvertisementData)
  {
    v2 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
    v4 = sub_1000C0598((uint64_t)v2, v3 & 0xFFFFFFFFFFFFLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSData *)v5;
}

- (NSDictionary)lastAdvertisementOptions
{
  id v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;

  if (self->_lastAdvertisementData)
  {
    v3 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
    v5 = sub_1000C05FC((unint64_t)v3, v4 & 0xFFFFFFFFFFFFLL, (int)-[IDSDevice isDefaultPairedDevice](self->_idsDevice, "isDefaultPairedDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (SFActivityAdvertisement)clientAdvertisement
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = sub_1000C0734(self->_idsDevice);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc((Class)SFActivityAdvertisement);
  v6 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord lastAdvertisementPayload](self, "lastAdvertisementPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord lastAdvertisementOptions](self, "lastAdvertisementOptions"));
  v9 = objc_msgSend(v5, "initWithAdvertisementVersion:advertisementPayload:options:device:", v6, v7, v8, v4);

  return (SFActivityAdvertisement *)v9;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_idsDevice, a3);
}

- (BOOL)deviceTracked
{
  return self->_deviceTracked;
}

- (void)setDeviceTracked:(BOOL)a3
{
  self->_deviceTracked = a3;
}

- (BOOL)disableDuplicateFilterOnce
{
  return self->_disableDuplicateFilterOnce;
}

- (void)setDisableDuplicateFilterOnce:(BOOL)a3
{
  self->_disableDuplicateFilterOnce = a3;
}

- (NSData)lastRawAdvertisementData
{
  return self->_lastRawAdvertisementData;
}

- (NSUUID)lastUsedKeyIdentifier
{
  return self->_lastUsedKeyIdentifier;
}

- (void)setLastUsedKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedKeyIdentifier, a3);
}

- (NSData)lastAdvertisementData
{
  return self->_lastAdvertisementData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdvertisementData, 0);
  objc_storeStrong((id *)&self->_lastUsedKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRawAdvertisementData, 0);
  objc_storeStrong((id *)&self->_idsDevice, 0);
  objc_storeStrong((id *)&self->_lastReceivedAdvertisementDate, 0);
}

@end
