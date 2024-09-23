@implementation CKKSExternalTLKShare

- (id)initWithViewName:(id)a3 tlkShare:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKKSExternalTLKShare *v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tlkUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPeerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare datafyPeerID:](self, "datafyPeerID:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderPeerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare datafyPeerID:](self, "datafyPeerID:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedTLK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signature"));

  v15 = -[CKKSExternalTLKShare initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:](self, "initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:", v7, v8, v10, v12, v13, v14);
  return v15;
}

- (id)makeTLKShareRecord:(id)a3 contextID:(id)a4
{
  id v6;
  CKKSTLKShare *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CKKSTLKShareRecord *v16;
  id v18;

  v18 = a4;
  v6 = a3;
  v7 = [CKKSTLKShare alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare tlkUUID](self, "tlkUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare senderPeerID](self, "senderPeerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare signature](self, "signature"));
  v15 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:](v7, "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:", v8, v10, v12, 0, 4, 1, 0, 0, v13, v14, v6);

  v16 = -[CKKSTLKShareRecord initWithShare:contextID:zoneID:encodedCKRecord:]([CKKSTLKShareRecord alloc], "initWithShare:contextID:zoneID:encodedCKRecord:", v15, v18, v6, 0);
  return v16;
}

- (id)datafyPeerID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("spid-")))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("spid-"), "length")));

    v3 = (id)v4;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 0);

  return v5;
}

@end
