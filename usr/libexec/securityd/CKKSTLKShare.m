@implementation CKKSTLKShare

- (id)init:(id)a3 sender:(id)a4 receiver:(id)a5 curve:(int64_t)a6 version:(unint64_t)a7 epoch:(int64_t)a8 poisoned:(int64_t)a9 zoneID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CKKSTLKShare *v20;
  CKKSTLKShare *v21;
  uint64_t v22;
  NSString *tlkUUID;
  uint64_t v24;
  NSString *receiverPeerID;
  void *v26;
  uint64_t v27;
  NSData *receiverPublicEncryptionKeySPKI;
  uint64_t v29;
  NSString *senderPeerID;
  objc_super v32;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShare;
  v20 = -[CKKSTLKShare init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_zoneID, a10);
    v21->_curve = a6;
    v21->_version = a7;
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
    tlkUUID = v21->_tlkUUID;
    v21->_tlkUUID = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peerID"));
    receiverPeerID = v21->_receiverPeerID;
    v21->_receiverPeerID = (NSString *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "publicEncryptionKey"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "keyData"));
    receiverPublicEncryptionKeySPKI = v21->_receiverPublicEncryptionKeySPKI;
    v21->_receiverPublicEncryptionKeySPKI = (NSData *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peerID"));
    senderPeerID = v21->_senderPeerID;
    v21->_senderPeerID = (NSString *)v29;

    v21->_epoch = a8;
    v21->_poisoned = a9;
  }

  return v21;
}

- (id)initForKey:(id)a3 senderPeerID:(id)a4 recieverPeerID:(id)a5 receiverEncPublicKeySPKI:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 wrappedKey:(id)a11 signature:(id)a12 zoneID:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CKKSTLKShare *v23;
  CKKSTLKShare *v24;
  id obj;
  id v27;
  id v30;
  id v31;
  objc_super v32;

  v18 = a3;
  v19 = a4;
  obj = a5;
  v20 = a5;
  v27 = a6;
  v31 = a6;
  v21 = a11;
  v22 = a12;
  v30 = a13;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShare;
  v23 = -[CKKSTLKShare init](&v32, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_zoneID, a13);
    objc_storeStrong((id *)&v24->_tlkUUID, a3);
    objc_storeStrong((id *)&v24->_senderPeerID, a4);
    objc_storeStrong((id *)&v24->_receiverPeerID, obj);
    objc_storeStrong((id *)&v24->_receiverPublicEncryptionKeySPKI, v27);
    v24->_curve = a7;
    v24->_version = a8;
    v24->_epoch = a9;
    v24->_poisoned = a10;
    objc_storeStrong((id *)&v24->_wrappedTLK, a11);
    objc_storeStrong((id *)&v24->_signature, a12);
  }

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSTLKShareCore(%@): recv:%@ send:%@>"), v3, v4, v5));

  return v6;
}

- (id)wrap:(id)a3 publicKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = objc_autoreleasePoolPush();
  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serializeAsProtobuf:", &v19));
  v12 = v19;
  objc_autoreleasePoolPop(v10);
  if (v11)
  {
    v13 = objc_msgSend(objc_alloc((Class)_SFIESOperation), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "encrypt:withKey:error:", v11, v9, a5));
    v15 = objc_autoreleasePoolPush();
    v16 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v14, "encodeWithCoder:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encodedData"));

    objc_autoreleasePoolPop(v15);
  }
  else
  {
    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v17;
}

- (id)unwrapUsing:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = objc_alloc((Class)NSKeyedUnarchiver);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  v9 = objc_msgSend(v7, "initForReadingFromData:error:", v8, 0);

  v10 = objc_msgSend(objc_alloc((Class)_SFIESCiphertext), "initWithCoder:", v9);
  objc_msgSend(v9, "finishDecoding");
  v11 = objc_msgSend(objc_alloc((Class)_SFIESOperation), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptionKey"));

  v17 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "decrypt:withKey:error:", v10, v12, &v17));
  v14 = v17;

  if (!v13 || v14)
  {
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey loadFromProtobuf:error:](CKKSKeychainBackedKey, "loadFromProtobuf:error:", v13, a4));
  }

  return v15;
}

- (id)dataForSigning:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _UNKNOWN **v24;
  _UNKNOWN **v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _UNKNOWN **v35;
  id v36;
  void *v37;
  _UNKNOWN **v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  unint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_alloc_init((Class)NSMutableData);
  v59 = -[CKKSTLKShare version](self, "version");
  objc_msgSend(v6, "appendBytes:length:", &v59, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
  objc_msgSend(v6, "appendData:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
  objc_msgSend(v6, "appendData:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  objc_msgSend(v6, "appendData:", v11);

  v58 = -[CKKSTLKShare curve](self, "curve");
  objc_msgSend(v6, "appendBytes:length:", &v58, 8);
  v57 = -[CKKSTLKShare epoch](self, "epoch");
  objc_msgSend(v6, "appendBytes:length:", &v57, 8);
  v56 = -[CKKSTLKShare poisoned](self, "poisoned");
  objc_msgSend(v6, "appendBytes:length:", &v56, 8);
  if (v4)
  {
    v42 = v5;
    v46 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v43 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("sender")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("receiver")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("receiverPublicEncryptionKey")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("curve")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("epoch")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("poisoned")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("signature")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("version")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("parentkeyref")) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("wrappedkey")) & 1) == 0
            && (objc_msgSend(v18, "hasPrefix:", CFSTR("server_")) & 1) == 0)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v18));
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v44, v18);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v15);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingSelector:", "compare:"));

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    v6 = v46;
    if (v22)
    {
      v23 = v22;
      v24 = &AAAccountClassPrimary_ptr;
      v25 = &AAAccountClassPrimary_ptr;
      v26 = *(_QWORD *)v49;
      do
      {
        v27 = 0;
        v45 = v23;
        do
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v27)));
          v29 = objc_opt_class(v24[322]);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
          {
            v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dataUsingEncoding:", 4));
            objc_msgSend(v6, "appendData:", v30);
LABEL_28:

            goto LABEL_35;
          }
          v31 = objc_opt_class(v25[290]);
          if ((objc_opt_isKindOfClass(v28, v31) & 1) != 0)
          {
            objc_msgSend(v6, "appendData:", v28);
          }
          else
          {
            v32 = objc_opt_class(NSDate);
            if ((objc_opt_isKindOfClass(v28, v32) & 1) != 0)
            {
              v30 = objc_alloc_init((Class)NSISO8601DateFormatter);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringForObjectValue:", v28));
              v34 = v26;
              v35 = v24;
              v36 = v21;
              v37 = v12;
              v38 = v25;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dataUsingEncoding:", 4));
              objc_msgSend(v46, "appendData:", v39);

              v25 = v38;
              v12 = v37;
              v21 = v36;
              v24 = v35;
              v26 = v34;
              v23 = v45;

              v6 = v46;
              goto LABEL_28;
            }
            v40 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v28, v40) & 1) != 0)
            {
              v47 = (id)0xAAAAAAAAAAAAAAAALL;
              v47 = objc_msgSend(v28, "unsignedLongLongValue");
              objc_msgSend(v6, "appendBytes:length:", &v47, 8);
            }
          }
LABEL_35:

          v27 = (char *)v27 + 1;
        }
        while (v23 != v27);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v23);
    }

    v5 = v42;
    v4 = v43;
  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)signRecord:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)_SFEC_X962SigningOperation);
  v11 = objc_msgSend(objc_alloc((Class)_SFECKeySpecifier), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
  v12 = objc_alloc_init((Class)_SFSHA256DigestOperation);
  v13 = objc_msgSend(v10, "initWithKeySpecifier:digestOperation:", v11, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare dataForSigning:](self, "dataForSigning:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sign:withKey:error:", v14, v9, a5));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signature"));
  return v16;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicSigningKey"));

  if (v13)
  {
    v14 = objc_alloc((Class)_SFEC_X962SigningOperation);
    v15 = objc_msgSend(objc_alloc((Class)_SFECKeySpecifier), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
    v16 = objc_alloc_init((Class)_SFSHA256DigestOperation);
    v17 = objc_msgSend(v14, "initWithKeySpecifier:digestOperation:", v15, v16);

    v18 = objc_alloc((Class)_SFSignedData);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare dataForSigning:](self, "dataForSigning:", v12));
    v20 = objc_msgSend(v18, "initWithData:signature:", v19, v10);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicSigningKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "verify:withKey:error:", v20, v21, a6));
    LOBYTE(a6) = v22 != 0;

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
    v25 = sub_10000BDF4(CFSTR("ckksshare"), v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "no signing key for peer: %@", buf, 0xCu);
    }

    if (a6)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Peer(%@) has no signing key"), v11));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 37, v27));

      LOBYTE(a6) = 0;
    }
  }

  return (char)a6;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  void *v30;
  id *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  CKKSTLKShare *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];

  v8 = a3;
  v35 = a4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v10)
  {
    v11 = v10;
    v32 = a5;
    v12 = 0;
    v13 = *(_QWORD *)v38;
    v33 = *(_QWORD *)v38;
    while (2)
    {
      v14 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
          v36 = 0;
          v20 = -[CKKSTLKShare verifySignature:verifyingPeer:ckrecord:error:](self, "verifySignature:verifyingPeer:ckrecord:error:", v19, v15, v35, &v36);
          v21 = v36;

          if (v21)
          {
            v22 = v12;
            v23 = v9;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
            v26 = sub_10000BDF4(CFSTR("ckksshare"), v25);
            v27 = objc_claimAutoreleasedReturnValue(v26);

            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v42 = self;
              v43 = 2112;
              v44 = v15;
              v45 = 2112;
              v46 = v21;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "signature didn't verify for %@ %@: %@", buf, 0x20u);
            }

            v12 = v21;
            v9 = v23;
            v13 = v33;
            v11 = v34;
          }

          if (v20)
          {

            v28 = 1;
            goto LABEL_21;
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v11)
        continue;
      break;
    }

    a5 = v32;
    if (v32)
    {
      if (!v12)
        goto LABEL_19;
      v12 = objc_retainAutorelease(v12);
      v28 = 0;
      *v32 = v12;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {

    if (a5)
    {
LABEL_19:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No TLK share from %@"), v29));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 35, v30));

    }
    v28 = 0;
    v12 = 0;
  }
LABEL_21:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCurve:", -[CKKSTLKShare curve](self, "curve"));
  objc_msgSend(v4, "setVersion:", -[CKKSTLKShare version](self, "version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTlkUUID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSenderPeerID:", v8);

  objc_msgSend(v4, "setEpoch:", -[CKKSTLKShare epoch](self, "epoch"));
  objc_msgSend(v4, "setPoisoned:", -[CKKSTLKShare poisoned](self, "poisoned"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setWrappedTLK:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setSignature:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setReceiverPeerID:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
  v16 = objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setReceiverPublicEncryptionKeySPKI:", v16);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("zoneID"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare curve](self, "curve"), CFSTR("curve"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare version](self, "version"), CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tlkUUID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("senderPeerID"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare epoch](self, "epoch"), CFSTR("epoch"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare poisoned](self, "poisoned"), CFSTR("poisoned"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("wrappedTLK"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("signature"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("receiverPeerID"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("receiverSPKI"));

}

- (CKKSTLKShare)initWithCoder:(id)a3
{
  id v4;
  CKKSTLKShare *v5;
  id v6;
  uint64_t v7;
  CKRecordZoneID *zoneID;
  id v9;
  uint64_t v10;
  NSString *tlkUUID;
  id v12;
  uint64_t v13;
  NSString *senderPeerID;
  id v15;
  uint64_t v16;
  NSData *wrappedTLK;
  id v18;
  uint64_t v19;
  NSData *signature;
  id v21;
  uint64_t v22;
  NSString *receiverPeerID;
  id v24;
  uint64_t v25;
  NSData *receiverPublicEncryptionKeySPKI;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKKSTLKShare;
  v5 = -[CKKSTLKShare init](&v28, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecordZoneID), CFSTR("zoneID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v7;

    v5->_curve = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("curve"));
    v5->_version = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("tlkUUID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("senderPeerID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSString *)v13;

    v5->_epoch = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("epoch"));
    v5->_poisoned = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("poisoned"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("wrappedTLK"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("signature"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    signature = v5->_signature;
    v5->_signature = (NSData *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("receiverPeerID"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("receiverSPKI"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    receiverPublicEncryptionKeySPKI = v5->_receiverPublicEncryptionKeySPKI;
    v5->_receiverPublicEncryptionKeySPKI = (NSData *)v25;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;

  v4 = a3;
  v5 = objc_opt_class(CKKSTLKShare);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tlkUUID"));
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      v13 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v13 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderPeerID"));
    v46 = v11;
    if (!objc_msgSend(v11, "isEqualToString:", v12))
    {
      v13 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v45 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
    if (v45 || (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPeerID"))) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPeerID"));
      if (!objc_msgSend(v44, "isEqual:"))
      {
        v13 = 0;
        goto LABEL_32;
      }
      v42 = 1;
    }
    else
    {
      v39 = 0;
      v42 = 0;
    }
    v14 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
    if (v14
      || (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPublicEncryptionKeySPKI"))) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverPublicEncryptionKeySPKI"));
      v41 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v13 = 0;
        v17 = (void *)v14;
        goto LABEL_29;
      }
      v38 = (void *)v14;
      v16 = 1;
    }
    else
    {
      v37 = 0;
      v38 = 0;
      v16 = 0;
    }
    v18 = -[CKKSTLKShare epoch](self, "epoch");
    if (v18 != objc_msgSend(v6, "epoch")
      || (v19 = -[CKKSTLKShare curve](self, "curve"), v19 != objc_msgSend(v6, "curve"))
      || (v20 = -[CKKSTLKShare poisoned](self, "poisoned"), v20 != objc_msgSend(v6, "poisoned")))
    {
      v13 = 0;
      v17 = v38;
      if (!v16)
        goto LABEL_30;
      goto LABEL_29;
    }
    v17 = v38;
    v36 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
    if (v36 || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedTLK"))) != 0)
    {
      v34 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedTLK"));
      v33 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v13 = 0;
        LOBYTE(v16) = v34;
        goto LABEL_48;
      }
      v31 = 1;
      LOBYTE(v16) = v34;
    }
    else
    {
      v29 = 0;
      v31 = 0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
    if (v35 || (v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signature"))) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature", v27, v29));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signature"));
      v13 = objc_msgSend(v30, "isEqual:", v24);

      if (v35)
      {

        v17 = v38;
        if (!v31)
          goto LABEL_49;
        goto LABEL_48;
      }
      v17 = v38;
      v26 = v28;
    }
    else
    {
      v26 = 0;
      v13 = 1;
    }

    if ((v31 & 1) == 0)
    {
LABEL_49:
      v25 = (void *)v36;
      if (!v36)
      {

        v25 = 0;
      }

      if ((v16 & 1) == 0)
      {
LABEL_30:
        if (v17)
        {

          if (v42)
            goto LABEL_32;
        }
        else
        {

          if ((v42 & 1) != 0)
          {
LABEL_32:
            v22 = (void *)v45;

            if (v45)
            {
LABEL_34:

              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        v22 = (void *)v45;
        if (v45)
          goto LABEL_34;
        goto LABEL_33;
      }
LABEL_29:

      goto LABEL_30;
    }
LABEL_48:

    goto LABEL_49;
  }
  v13 = 0;
LABEL_38:

  return v13;
}

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v33 = v11;
    v34 = v9;
    v14 = 0;
    v15 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peerID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (v20)
        {
          v21 = v17;

          v14 = v21;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
    v11 = v33;
    v9 = v34;
    if (v14)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
      v23 = -[CKKSTLKShare verifySignature:verifyingPeer:ckrecord:error:](self, "verifySignature:verifyingPeer:ckrecord:error:", v22, v14, v33, a6);

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare unwrapUsing:error:](self, "unwrapUsing:error:", v34, a6));
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuid"));
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v27 & 1) != 0)
          {
            v28 = v24;
            v29 = 0;
LABEL_24:

            goto LABEL_25;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Signed UUID doesn't match unsigned UUID for %@"), self));
          v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 20, v31));

          if (a6)
          {
            v29 = objc_retainAutorelease(v29);
            v28 = 0;
            *a6 = v29;
            goto LABEL_24;
          }
        }
        else
        {
          v29 = 0;
        }
        v28 = 0;
        goto LABEL_24;
      }
      v29 = 0;
      goto LABEL_19;
    }
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No trusted peer signed %@"), self));
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 19, v30));

  if (!a6)
  {
    v14 = 0;
LABEL_19:
    v28 = 0;
    goto LABEL_25;
  }
  v29 = objc_retainAutorelease(v29);
  v14 = 0;
  v28 = 0;
  *a6 = v29;
LABEL_25:

  return v28;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTlkUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)receiverPeerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReceiverPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)receiverPublicEncryptionKeySPKI
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReceiverPublicEncryptionKeySPKI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)senderPeerID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSenderPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int64_t)poisoned
{
  return self->_poisoned;
}

- (void)setPoisoned:(int64_t)a3
{
  self->_poisoned = a3;
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWrappedTLK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_wrappedTLK, 0);
  objc_storeStrong((id *)&self->_senderPeerID, 0);
  objc_storeStrong((id *)&self->_receiverPublicEncryptionKeySPKI, 0);
  objc_storeStrong((id *)&self->_receiverPeerID, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)share:(id)a3 as:(id)a4 to:(id)a5 epoch:(int64_t)a6 poisoned:(int64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  CKKSTLKShare *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = [CKKSTLKShare alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
  v18 = -[CKKSTLKShare init:sender:receiver:curve:version:epoch:poisoned:zoneID:](v16, "init:sender:receiver:curve:version:epoch:poisoned:zoneID:", v13, v14, v15, 4, 0, a6, a7, v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publicEncryptionKey"));
  v35 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "wrap:publicKey:error:", v13, v19, &v35));
  v21 = v35;
  objc_msgSend(v18, "setWrappedTLK:", v20);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));
    v24 = sub_10000BDF4(CFSTR("ckksshare"), v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 138412546;
    v37 = v13;
    v38 = 2112;
    v39 = v21;
    v26 = "couldn't share %@ (wrap failed): %@";
    goto LABEL_7;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "signingKey"));
  v34 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "signRecord:ckrecord:error:", v27, 0, &v34));
  v21 = v34;
  objc_msgSend(v18, "setSignature:", v28);

  if (!v21)
  {
    v32 = v18;
    goto LABEL_12;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "zoneName"));
  v31 = sub_10000BDF4(CFSTR("ckksshare"), v30);
  v25 = objc_claimAutoreleasedReturnValue(v31);

  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v13;
    v38 = 2112;
    v39 = v21;
    v26 = "couldn't share %@ (signing failed): %@";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
  }
LABEL_8:

  if (a8)
  {
    v21 = objc_retainAutorelease(v21);
    v32 = 0;
    *a8 = v21;
  }
  else
  {
    v32 = 0;
  }
LABEL_12:

  return v32;
}

@end
