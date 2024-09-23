@implementation SESTLKShare

+ (id)withView:(id)a3 tlkUUID:(id)a4 sourcePeerIdentifier:(id)a5 targetPeerIdentifier:(id)a6 shareData:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (_QWORD *)objc_opt_new();
  v17 = (void *)v16[1];
  v16[1] = v11;
  v18 = v11;

  v19 = (void *)v16[2];
  v16[2] = v12;
  v20 = v12;

  v21 = (void *)v16[3];
  v16[3] = v13;
  v22 = v13;

  v23 = (void *)v16[4];
  v16[4] = v14;
  v24 = v14;

  v25 = (void *)v16[5];
  v16[5] = v15;

  return v16;
}

+ (id)withCKKSExternalShare:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "tlkUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESTLKRecord _uuidFromStringPermissive:](SESTLKRecord, "_uuidFromStringPermissive:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ses_toData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "senderPeerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "receiverPeerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "wrappedTLK");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SESTLKShare withView:tlkUUID:sourcePeerIdentifier:targetPeerIdentifier:shareData:](SESTLKShare, "withView:tlkUUID:sourcePeerIdentifier:targetPeerIdentifier:shareData:", v7, v6, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SESDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "tlkUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "wrappedTLK");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "base64");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_20A048000, v12, OS_LOG_TYPE_ERROR, "Share without a TLK String %@ - %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)asCKKSExternalShare
{
  id v3;
  NSString *view;
  void *v5;
  void *v6;
  NSData *targetPeerIdentifier;
  NSData *sourcePeerIdentifier;
  NSData *shareData;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BDE8468]);
  view = self->_view;
  objc_msgSend(MEMORY[0x24BDD1880], "ses_withData:", self->_tlkUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sourcePeerIdentifier = self->_sourcePeerIdentifier;
  targetPeerIdentifier = self->_targetPeerIdentifier;
  shareData = self->_shareData;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:", view, v6, targetPeerIdentifier, sourcePeerIdentifier, shareData, v10);

  return v11;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)tlkUUID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)sourcePeerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)targetPeerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)shareData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_targetPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourcePeerIdentifier, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
