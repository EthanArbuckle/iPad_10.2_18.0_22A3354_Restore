@implementation CKKSTLKShareRecord

- (CKKSTLKShareRecord)initWithShare:(id)a3 contextID:(id)a4 zoneID:(id)a5 encodedCKRecord:(id)a6
{
  id v11;
  CKKSTLKShareRecord *v12;
  CKKSTLKShareRecord *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSTLKShareRecord;
  v12 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v15, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("tlkshare"), a6, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_share, a3);

  return v13;
}

- (id)init:(id)a3 contextID:(id)a4 sender:(id)a5 receiver:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 zoneID:(id)a11 encodedCKRecord:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  CKKSTLKShareRecord *v22;
  CKKSTLKShare *v23;
  CKKSTLKShare *share;
  objc_super v26;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a11;
  v26.receiver = self;
  v26.super_class = (Class)CKKSTLKShareRecord;
  v22 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v26, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("tlkshare"), a12, a4, v21);
  if (v22)
  {
    v23 = -[CKKSTLKShare init:sender:receiver:curve:version:epoch:poisoned:zoneID:]([CKKSTLKShare alloc], "init:sender:receiver:curve:version:epoch:poisoned:zoneID:", v18, v19, v20, a7, a8, a9, a10, v21);
    share = v22->_share;
    v22->_share = v23;

  }
  return v22;
}

- (id)initForKey:(id)a3 contextID:(id)a4 senderPeerID:(id)a5 recieverPeerID:(id)a6 receiverEncPublicKeySPKI:(id)a7 curve:(int64_t)a8 version:(unint64_t)a9 epoch:(int64_t)a10 poisoned:(int64_t)a11 wrappedKey:(id)a12 signature:(id)a13 zoneID:(id)a14 encodedCKRecord:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CKKSTLKShareRecord *v26;
  CKKSTLKShare *v27;
  CKKSTLKShare *share;
  id v31;
  objc_super v32;

  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v31 = a12;
  v24 = a13;
  v25 = a14;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShareRecord;
  v26 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v32, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("tlkshare"), a15, a4, v25);
  if (v26)
  {
    v27 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:]([CKKSTLKShare alloc], "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:", v20, v21, v22, v23, a8, a9, a10, a11, v31, v24, v25);
    share = v26->_share;
    v26->_share = v27;

  }
  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tlkUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPeerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderPeerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modificationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSTLKShare[%@](%@): recv:%@ send:%@ mod:%@>"), v3, v5, v7, v9, v11));

  return v12;
}

- (NSString)tlkUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tlkUUID"));

  return (NSString *)v3;
}

- (NSString)senderPeerID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "senderPeerID"));

  return (NSString *)v3;
}

- (int64_t)epoch
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = objc_msgSend(v2, "epoch");

  return (int64_t)v3;
}

- (int64_t)poisoned
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = objc_msgSend(v2, "poisoned");

  return (int64_t)v3;
}

- (NSData)wrappedTLK
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "wrappedTLK"));

  return (NSData *)v3;
}

- (NSData)signature
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "signature"));

  return (NSData *)v3;
}

- (id)dataForSigning
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForSigning:", v4));

  return v5;
}

- (id)signRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signRecord:ckrecord:error:", v6, v8, a4));

  return v9;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  LOBYTE(a5) = objc_msgSend(v10, "verifySignature:verifyingPeer:ckrecord:error:", v9, v8, v11, a5);

  return (char)a5;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  LOBYTE(a4) = objc_msgSend(v7, "signatureVerifiesWithPeerSet:ckrecord:error:", v6, v8, a4);

  return (char)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v11 = objc_msgSend(v5, "initWithShare:contextID:zoneID:encodedCKRecord:", v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(CKKSTLKShareRecord);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recoverTLK:trustedPeers:ckrecord:error:", v9, v8, v11, a5));

  return v12;
}

- (id)CKRecordName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tlkUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "receiverPeerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderPeerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tlkshare-%@::%@::%@"), v4, v6, v8));

  return v9;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "recordName"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecord name (%@) was not %@"), v43, v44));
    v46 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordNameException"), v45, 0));

    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("tlkshare"));

  if ((v13 & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v42, CFSTR("tlkshare")));
    v46 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v47, 0));

LABEL_6:
    objc_exception_throw(v46);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "senderPeerID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("sender"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "receiverPeerID"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("receiver"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "receiverPublicEncryptionKeySPKI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("receiverPublicEncryptionKey"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "curve")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("curve"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "version")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("version"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v25, "epoch")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("epoch"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v27, "poisoned")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("poisoned"));

  v29 = objc_alloc((Class)CKReference);
  v30 = objc_alloc((Class)CKRecordID);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "tlkUUID"));
  v33 = objc_msgSend(v30, "initWithRecordName:zoneID:", v32, v7);
  v34 = objc_msgSend(v29, "initWithRecordID:action:", v33, CKReferenceActionValidate);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("parentkeyref"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "wrappedTLK"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("wrappedkey"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "signature"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("signature"));

  return v6;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  CKKSTLKShareRecord *v11;
  void *v12;
  CKKSTLKShareRecord *v13;
  BOOL v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("tlkshare"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v7,
        v10))
  {
    v11 = [CKKSTLKShareRecord alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    v13 = -[CKKSCKRecordHolder initWithCKRecord:contextID:](v11, "initWithCKRecord:contextID:", v4, v12);

    v14 = -[CKKSTLKShareRecord isEqual:](self, "isEqual:", v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setFromCKRecord:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  CKKSTLKShare *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CKKSTLKShareRecord *v39;
  id v40;

  v40 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "recordType"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("tlkshare"));

  if ((v5 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "recordType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v25, CFSTR("devicestate")));
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v26, 0));

    objc_exception_throw(v27);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v40);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("receiverPublicEncryptionKey")));
  v39 = self;
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    v10 = objc_alloc((Class)NSData);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("receiverPublicEncryptionKey")));
    v28 = objc_msgSend(v10, "initWithBase64EncodedString:options:", v11, 0);

  }
  else
  {
    v28 = 0;
  }
  v12 = [CKKSTLKShare alloc];
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "recordName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("sender")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("receiver")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("curve")));
  v31 = objc_msgSend(v36, "longValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("version")));
  v30 = objc_msgSend(v35, "longValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("epoch")));
  v15 = objc_msgSend(v34, "longValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("poisoned")));
  v16 = objc_msgSend(v32, "longValue");
  v17 = objc_alloc((Class)NSData);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v18 = objc_msgSend(v17, "initWithBase64EncodedString:options:", v29, 0);
  v19 = objc_alloc((Class)NSData);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("signature")));
  v21 = objc_msgSend(v19, "initWithBase64EncodedString:options:", v20, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "recordID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneID"));
  v24 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:](v12, "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:", v13, v14, v33, v28, v31, v30, v15, v16, v18, v21, v23);
  -[CKKSTLKShareRecord setShare:](v39, "setShare:", v24);

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  v14[0] = CFSTR("uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tlkUUID"));
  v15[0] = v4;
  v14[1] = CFSTR("contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v15[1] = v5;
  v14[2] = CFSTR("senderpeerid");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderPeerID"));
  v15[2] = v7;
  v14[3] = CFSTR("recvpeerid");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receiverPeerID"));
  v15[3] = v9;
  v14[4] = CFSTR("ckzone");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v15[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));

  return v12;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[13];
  _QWORD v45[13];

  v44[0] = CFSTR("uuid");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "tlkUUID"));
  v45[0] = v42;
  v44[1] = CFSTR("contextID");
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v45[1] = v41;
  v44[2] = CFSTR("senderpeerid");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "senderPeerID"));
  v45[2] = v39;
  v44[3] = CFSTR("recvpeerid");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "receiverPeerID"));
  v45[3] = v37;
  v44[4] = CFSTR("recvpubenckey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receiverPublicEncryptionKeySPKI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));

  if (v5)
    v6 = v5;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = v6;

  v36 = v7;
  v45[4] = v7;
  v44[5] = CFSTR("poisoned");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v35, "poisoned")));
  v45[5] = v34;
  v44[6] = CFSTR("epoch");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v33, "epoch")));
  v45[6] = v32;
  v44[7] = CFSTR("curve");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "curve")));
  v45[7] = v9;
  v44[8] = CFSTR("version");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "version")));
  v45[8] = v11;
  v44[9] = CFSTR("wrappedkey");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "wrappedTLK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));

  if (v14)
    v15 = v14;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v45[9] = v16;
  v44[10] = CFSTR("signature");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "signature"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "base64EncodedStringWithOptions:", 0));

  if (v19)
    v20 = v19;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v45[10] = v21;
  v44[11] = CFSTR("ckzone");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));

  if (v23)
    v24 = v23;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  v45[11] = v25;
  v44[12] = CFSTR("ckrecord");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "base64EncodedStringWithOptions:", 0));

  if (v27)
    v28 = v27;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29 = v28;

  v45[12] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 13));

  return v30;
}

- (CKKSTLKShare)share
{
  return (CKKSTLKShare *)objc_getProperty(self, a2, 56, 1);
}

- (void)setShare:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_share, 0);
}

+ (id)share:(id)a3 contextID:(id)a4 as:(id)a5 to:(id)a6 epoch:(int64_t)a7 poisoned:(int64_t)a8 error:(id *)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  CKKSTLKShareRecord *v26;
  void *v27;
  CKKSTLKShareRecord *v28;
  void *v29;
  void *v30;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peerID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
  v35 = 0;
  v20 = v13;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord tryFromDatabase:contextID:receiverPeerID:senderPeerID:zoneID:error:](CKKSTLKShareRecord, "tryFromDatabase:contextID:receiverPeerID:senderPeerID:zoneID:error:", v16, v13, v17, v18, v19, &v35));
  v21 = v35;

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));
    v24 = sub_10000BDF4(CFSTR("ckksshare"), v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v12;
      v38 = 2112;
      v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "couldn't load old share for %@: %@", buf, 0x16u);
    }

    v26 = 0;
    if (a9)
      *a9 = objc_retainAutorelease(v21);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSTLKShare share:as:to:epoch:poisoned:error:](CKKSTLKShare, "share:as:to:epoch:poisoned:error:", v12, v14, v15, a7, a8, a9));
    if (v27)
    {
      v28 = [CKKSTLKShareRecord alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "encodedCKRecord"));
      v26 = -[CKKSTLKShareRecord initWithShare:contextID:zoneID:encodedCKRecord:](v28, "initWithShare:contextID:zoneID:encodedCKRecord:", v27, v20, v29, v30);

    }
    else
    {
      v26 = 0;
    }

  }
  return v26;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  _QWORD v45[5];
  _QWORD v46[5];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v45[0] = CFSTR("uuid");
  v17 = v12;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v46[0] = v20;
  v45[1] = CFSTR("contextID");
  v21 = v13;
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v46[1] = v24;
  v45[2] = CFSTR("recvpeerid");
  v25 = v14;
  v26 = v25;
  if (v25)
    v27 = v25;
  else
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = v27;
  v41 = v24;

  v46[2] = v28;
  v45[3] = CFSTR("senderpeerid");
  v29 = v15;
  v30 = v29;
  v42 = v20;
  if (v29)
    v31 = v29;
  else
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v32 = v31;

  v46[3] = v32;
  v45[4] = CFSTR("ckzone");
  v33 = v16;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
  v35 = v34;
  if (v34)
    v36 = v34;
  else
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v37 = v36;

  v46[4] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v38, a8));

  return v39;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  _QWORD v45[5];
  _QWORD v46[5];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v45[0] = CFSTR("uuid");
  v17 = v12;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v46[0] = v20;
  v45[1] = CFSTR("contextID");
  v21 = v13;
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v46[1] = v24;
  v45[2] = CFSTR("recvpeerid");
  v25 = v14;
  v26 = v25;
  if (v25)
    v27 = v25;
  else
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = v27;
  v41 = v24;

  v46[2] = v28;
  v45[3] = CFSTR("senderpeerid");
  v29 = v15;
  v30 = v29;
  v42 = v20;
  if (v29)
    v31 = v29;
  else
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v32 = v31;

  v46[3] = v32;
  v45[4] = CFSTR("ckzone");
  v33 = v16;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
  v35 = v34;
  if (v34)
    v36 = v34;
  else
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v37 = v36;

  v46[4] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v38, a8));

  return v39;
}

+ (id)allFor:(id)a3 contextID:(id)a4 keyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  _QWORD v32[4];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v31[0] = CFSTR("recvpeerid");
  v16 = v12;
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v32[0] = v19;
  v31[1] = CFSTR("contextID");
  v20 = v13;
  v21 = v20;
  if (v20)
    v22 = v20;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = v22;

  v32[1] = v23;
  v32[2] = v14;
  v31[2] = CFSTR("uuid");
  v31[3] = CFSTR("ckzone");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
  v25 = v24;
  if (v24)
    v26 = v24;
  else
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27 = v26;

  v32[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 4));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v28, a7));

  return v29;
}

+ (id)allForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("uuid");
  v13 = v10;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("contextID");
  v17 = v11;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v25, a6));

  return v26;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v8 = a3;
  v20[0] = CFSTR("contextID");
  v9 = a4;
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = v11;

  v20[1] = CFSTR("ckzone");
  v21[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v17, a5));

  return v18;
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  _QWORD v60[5];
  _QWORD v61[5];

  v8 = a3;
  v9 = a4;
  v59 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^tlkshare-(?<uuid>[0-9A-Fa-f-]*)::(?<receiver>.*)::(?<sender>.*)$"), 1, &v59));
  v11 = v59;
  v12 = v11;
  if (!v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v15, "length")));

    if (v16)
    {
      v56 = a1;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v18 = objc_msgSend(v16, "rangeWithName:", CFSTR("uuid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringWithRange:", v18, v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v22 = objc_msgSend(v16, "rangeWithName:", CFSTR("receiver"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringWithRange:", v22, v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v57 = v16;
      v26 = objc_msgSend(v16, "rangeWithName:", CFSTR("sender"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", v26, v27));

      v60[0] = CFSTR("uuid");
      v29 = v20;
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v34 = v31;

      v54 = v34;
      v61[0] = v34;
      v60[1] = CFSTR("contextID");
      v35 = v9;
      v36 = v35;
      v58 = v9;
      if (v35)
        v37 = v35;
      else
        v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v38 = v37;

      v61[1] = v38;
      v60[2] = CFSTR("recvpeerid");
      v39 = v24;
      v33 = v39;
      if (v39)
        v40 = v39;
      else
        v40 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v41 = v40;
      v53 = v38;
      v55 = v30;

      v61[2] = v41;
      v60[3] = CFSTR("senderpeerid");
      v42 = v28;
      v43 = v42;
      v52 = v41;
      if (v42)
        v44 = v42;
      else
        v44 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v45 = v44;

      v61[3] = v45;
      v60[4] = CFSTR("ckzone");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "zoneName"));

      if (v47)
        v48 = v47;
      else
        v48 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v49 = v48;

      v61[4] = v49;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "tryFromDatabaseWhere:error:", v50, a5));

      v16 = v57;
      v32 = v55;
    }
    else
    {
      if (!a5)
      {
        v13 = 0;
        goto LABEL_25;
      }
      v58 = v9;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't parse '%@' as a TLKShare ID"), v32));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 22, v33));
    }

    v9 = v58;
LABEL_25:

    goto LABEL_26;
  }
  v13 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v11);
LABEL_26:

  return v13;
}

+ (id)ckrecordPrefix
{
  return CFSTR("tlkshare");
}

+ (id)sqlTable
{
  return CFSTR("tlkshare");
}

+ (id)sqlColumns
{
  return &off_10030B7C8;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CKKSTLKShareRecord *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v3 = a3;
  v4 = objc_alloc((Class)CKRecordZoneID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asString"));
  v34 = objc_msgSend(v4, "initWithZoneName:ownerName:", v6, CKCurrentUserDefaultName);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("curve")));
  v29 = objc_msgSend(v7, "asNSInteger");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version")));
  v9 = objc_msgSend(v8, "asNSInteger");

  v10 = [CKKSTLKShareRecord alloc];
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "asString"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "asString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("senderpeerid")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "asString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recvpeerid")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "asString"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recvpubenckey")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asBase64DecodedData"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("epoch")));
  v11 = objc_msgSend(v24, "asNSInteger");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("poisoned")));
  v12 = objc_msgSend(v21, "asNSInteger");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asBase64DecodedData"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("signature")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asBase64DecodedData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asBase64DecodedData"));
  v30 = -[CKKSTLKShareRecord initForKey:contextID:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:encodedCKRecord:](v10, "initForKey:contextID:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:encodedCKRecord:", v33, v25, v23, v22, v20, v29, v9, v11, v12, v14, v16, v34, v18);

  return v30;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8;
  id v9;
  CKKSTLKShareRecord *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  CKKSTLKShareRecord *v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]([CKKSTLKShareRecord alloc], "initWithCKRecord:contextID:", v8, v9);

  v19 = 0;
  v11 = -[CKKSSQLDatabaseObject saveToDatabase:](v10, "saveToDatabase:", &v19);
  v12 = v19;
  if (v12)
    v11 = 0;
  if ((v11 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
    v16 = sub_10000BDF4(CFSTR("ckksshare"), v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Couldn't save new TLK share to database: %@ %@", buf, 0x16u);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v12);
  }

  return v11;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  __CFString *v27;

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckksshare"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v25 = CFSTR("tlkshare");
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted tlk share record(%@): %@", buf, 0x16u);
  }

  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord tryFromDatabaseFromCKRecordID:contextID:error:](CKKSTLKShareRecord, "tryFromDatabaseFromCKRecordID:contextID:error:", v8, v9, &v23));

  v15 = v23;
  v22 = v15;
  objc_msgSend(v14, "deleteFromDatabase:", &v22);
  v16 = (__CFString *)v22;

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckksshare"), v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CK notification: Couldn't delete deleted TLKShare: %@ %@", buf, 0x16u);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }

  return v16 == 0;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100187054;
  v24 = sub_100187064;
  v25 = 0;
  v10 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v27[0] = v8;
  v26[0] = CFSTR("contextID");
  v26[1] = CFSTR("ckzone");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15 = v14;

  v27[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v19[1] = 3221225472;
  v19[2] = sub_10018706C;
  v19[3] = &unk_1002E9DF8;
  v19[4] = &v20;
  v19[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v11, v16, &off_10030B7E0, 0, 0, -1, v19, a5);

  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

@end
