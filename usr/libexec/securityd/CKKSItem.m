@implementation CKKSItem

- (CKKSItem)initWithCKRecord:(id)a3 contextID:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKKSItem;
  return -[CKKSCKRecordHolder initWithCKRecord:contextID:](&v5, "initWithCKRecord:contextID:", a3, a4);
}

- (id)initCopyingCKKSItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKKSItem *v9;
  uint64_t v10;
  NSString *uuid;
  uint64_t v12;
  NSString *parentKeyUUID;
  uint64_t v14;
  NSData *encitem;
  uint64_t v16;
  CKKSWrappedAESSIVKey *wrappedkey;
  uint64_t v18;
  NSNumber *plaintextPCSServiceIdentifier;
  uint64_t v20;
  NSData *plaintextPCSPublicKey;
  uint64_t v22;
  NSData *plaintextPCSPublicIdentity;
  objc_super v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckRecordType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedCKRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneID"));
  v25.receiver = self;
  v25.super_class = (Class)CKKSItem;
  v9 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v25, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", v5, v6, v7, v8);

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentKeyUUID"));
    parentKeyUUID = v9->_parentKeyUUID;
    v9->_parentKeyUUID = (NSString *)v12;

    v9->_generationCount = (unint64_t)objc_msgSend(v4, "generationCount");
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encitem"));
    encitem = v9->_encitem;
    v9->_encitem = (NSData *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wrappedkey"));
    wrappedkey = v9->_wrappedkey;
    v9->_wrappedkey = (CKKSWrappedAESSIVKey *)v16;

    v9->_encver = (unint64_t)objc_msgSend(v4, "encver");
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "plaintextPCSServiceIdentifier"));
    plaintextPCSServiceIdentifier = v9->_plaintextPCSServiceIdentifier;
    v9->_plaintextPCSServiceIdentifier = (NSNumber *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "plaintextPCSPublicKey"));
    plaintextPCSPublicKey = v9->_plaintextPCSPublicKey;
    v9->_plaintextPCSPublicKey = (NSData *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "plaintextPCSPublicIdentity"));
    plaintextPCSPublicIdentity = v9->_plaintextPCSPublicIdentity;
    v9->_plaintextPCSPublicIdentity = (NSData *)v22;

  }
  return v9;
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:](self, "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:", a3, a4, a5, a6, 0, 0, 0, 0, 0);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encItem:(id)a7 wrappedkey:(id)a8 generationCount:(unint64_t)a9 encver:(unint64_t)a10
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:](self, "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:", a3, a4, a5, a6, 0, a7, a8, a9, a10);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:](self, "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11 plaintextPCSServiceIdentifier:(id)a12 plaintextPCSPublicKey:(id)a13 plaintextPCSPublicIdentity:(id)a14
{
  id v19;
  id v20;
  id v21;
  CKKSItem *v22;
  CKKSItem *v23;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v19 = a8;
  v28 = a9;
  v27 = a12;
  v20 = a13;
  v21 = a14;
  v31.receiver = self;
  v31.super_class = (Class)CKKSItem;
  v22 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v31, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("item"), a7, a5, a6);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_uuid, a3);
    objc_storeStrong((id *)&v23->_parentKeyUUID, a4);
    v23->_generationCount = a10;
    -[CKKSItem setEncitem:](v23, "setEncitem:", v19);
    objc_storeStrong((id *)&v23->_wrappedkey, a9);
    v23->_encver = a11;
    objc_storeStrong((id *)&v23->_plaintextPCSServiceIdentifier, a12);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicKey, a13);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicIdentity, a14);
  }

  return v23;
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
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v4 = a3;
  v5 = objc_opt_class(CKKSItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v15 = 0;
LABEL_41:

      goto LABEL_42;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentKeyUUID"));
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v15 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    v34 = v11;
    if (!objc_msgSend(v11, "isEqual:", v12))
    {
      v15 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v33 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    if (v33 || (v13 = 0, (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"))) != 0))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
      v32 = v14;
      if (!objc_msgSend(v14, "isEqualToString:"))
      {
        v15 = 0;
        v16 = (void *)v31;
        v13 = (void *)v33;
LABEL_35:

        goto LABEL_36;
      }
      v29 = 1;
      v13 = (void *)v33;
    }
    else
    {
      v26 = 0;
      v29 = 0;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
    if (v30 || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encitem"))) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encitem"));
      v28 = v17;
      if (!objc_msgSend(v17, "isEqual:", v27))
      {
        v15 = 0;
        goto LABEL_28;
      }
      v25 = 1;
    }
    else
    {
      v24 = 0;
      v25 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedkey"));
    if (objc_msgSend(v18, "isEqual:", v19)
      && (v23 = -[CKKSItem generationCount](self, "generationCount"), v23 == objc_msgSend(v6, "generationCount")))
    {
      v20 = -[CKKSItem encver](self, "encver");
      v15 = v20 == objc_msgSend(v6, "encver");

      if ((v25 & 1) == 0)
        goto LABEL_24;
    }
    else
    {

      v15 = 0;
      if (!v25)
      {
LABEL_24:
        v13 = (void *)v33;
        if (v30)

        else
        if ((v29 & 1) == 0)
        {
LABEL_36:
          if (!v13)

          goto LABEL_39;
        }
        goto LABEL_34;
      }
    }
    v13 = (void *)v33;
LABEL_28:

    v21 = v30;
    if (!v30)
    {

      v21 = 0;
    }

    if (!v29)
      goto LABEL_36;
LABEL_34:
    v16 = (void *)v31;
    goto LABEL_35;
  }
  v15 = 0;
LABEL_42:

  return v15;
}

- (void)setFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSString *v8;
  NSString *uuid;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKKSWrappedAESSIVKey *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  CKKSWrappedAESSIVKey *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("item"));

  if ((v6 & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v27, CFSTR("item")));
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v28, 0));

    objc_exception_throw(v29);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  uuid = self->_uuid;
  self->_uuid = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
  -[CKKSItem setParentKeyUUID:](self, "setParentKeyUUID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data")));
  -[CKKSItem setEncitem:](self, "setEncitem:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  if (v14)
  {
    v15 = -[CKKSWrappedAESSIVKey initWithBase64:]([CKKSWrappedAESSIVKey alloc], "initWithBase64:", v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckksitem"), v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Corrupt item recieved with no wrapped key", buf, 2u);
    }

    v15 = (CKKSWrappedAESSIVKey *)objc_claimAutoreleasedReturnValue(+[CKKSWrappedAESSIVKey zeroedKey](CKKSWrappedAESSIVKey, "zeroedKey"));
  }
  v21 = v15;
  -[CKKSItem setWrappedkey:](self, "setWrappedkey:", v15);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gen")));
  -[CKKSItem setGenerationCount:](self, "setGenerationCount:", objc_msgSend(v22, "unsignedIntegerValue"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encver")));
  -[CKKSItem setEncver:](self, "setEncver:", objc_msgSend(v23, "unsignedIntegerValue"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcsservice")));
  -[CKKSItem setPlaintextPCSServiceIdentifier:](self, "setPlaintextPCSServiceIdentifier:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublickey")));
  -[CKKSItem setPlaintextPCSPublicKey:](self, "setPlaintextPCSPublicKey:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublicidentity")));
  -[CKKSItem setPlaintextPCSPublicIdentity:](self, "setPlaintextPCSPublicIdentity:", v26);

}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("item"));

  if ((v9 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v24, CFSTR("item")));
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v25, 0));

    objc_exception_throw(v26);
  }
  v10 = objc_alloc((Class)CKReference);
  v11 = objc_alloc((Class)CKRecordID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v13 = objc_msgSend(v11, "initWithRecordName:zoneID:", v12, v7);
  v14 = objc_msgSend(v10, "initWithRecordID:action:", v13, CKReferenceActionValidate);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("parentkeyref"));

  +[CKKSItem setOSVersionInRecord:](CKKSItem, "setOSVersionInRecord:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("data"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64WrappedKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("wrappedkey"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CKKSItem generationCount](self, "generationCount")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("gen"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CKKSItem encver](self, "encver")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("encver"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("pcsservice"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("pcspublickey"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("pcspublicidentity"));

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
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  BOOL v38;
  id v39;
  NSObject *v40;
  const char *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t v50[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("item"));

  if (!v6)
    goto LABEL_41;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v39 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "UUID does not match";
    goto LABEL_39;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    v42 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "wrapping key reference does not match";
    goto LABEL_39;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gen")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CKKSItem generationCount](self, "generationCount")));
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) == 0)
  {
    v43 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordGenerationCountKey does not match";
    goto LABEL_39;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64WrappedKey"));
  v22 = objc_msgSend(v19, "isEqual:", v21);

  if ((v22 & 1) == 0)
  {
    v44 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordWrappedKeyKey does not match";
    goto LABEL_39;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if ((v25 & 1) == 0)
  {
    v45 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordDataKey does not match";
    goto LABEL_39;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcsservice")));
  if (v26
    || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"))) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcsservice")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (v26)
    {

      if ((v29 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

      if ((v29 & 1) != 0)
        goto LABEL_11;
    }
    v46 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v46);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordPCSServiceIdentifier does not match";
    goto LABEL_39;
  }
LABEL_11:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublickey")));
  if (v30
    || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"))) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublickey")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (v30)
    {

      if ((v33 & 1) != 0)
        goto LABEL_15;
    }
    else
    {

      if ((v33 & 1) != 0)
        goto LABEL_15;
    }
    v47 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v47);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordPCSPublicKey does not match";
LABEL_39:
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, v41, v50, 2u);
    goto LABEL_40;
  }
LABEL_15:
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublicidentity")));
  if (!v34)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
    if (!v24)
      goto LABEL_19;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pcspublicidentity")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  v37 = objc_msgSend(v35, "isEqual:", v36);

  if (!v34)
  {

    if ((v37 & 1) != 0)
      goto LABEL_19;
LABEL_37:
    v48 = sub_10000BDF4(CFSTR("ckksitem"), 0);
    v40 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v50 = 0;
      v41 = "SecCKRecordPCSPublicIdentity does not match";
      goto LABEL_39;
    }
LABEL_40:

LABEL_41:
    v38 = 0;
    goto LABEL_42;
  }

  if ((v37 & 1) == 0)
    goto LABEL_37;
LABEL_19:
  v38 = 1;
LABEL_42:

  return v38;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItem:(id)a3 encryptionVersion:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;
  id v11;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CKKSItem makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:](self, "makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:", v6));
  }
  else
  {
    if (a4 != 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d is not a known encryption version"), a4));
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongEncryptionVersionException"), v10, 0));

      objc_exception_throw(v11);
    }
    v7 = objc_claimAutoreleasedReturnValue(-[CKKSItem makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1](self, "makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1"));
  }
  v8 = (void *)v7;

  return v8;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v11;
  unint64_t v12;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("UUID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("wrappedkey"));

  v12 = -[CKKSItem generationCount](self, "generationCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v12, 8));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("gen"));

  v11 = -[CKKSItem encver](self, "encver");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v11, 8));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("encver"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("pcsservice"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("pcspublickey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("pcspublicidentity"));
  return v3;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  _BYTE v46[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("UUID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("wrappedkey"));

  v45 = -[CKKSItem generationCount](self, "generationCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v45, 8));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("gen"));

  v44 = -[CKKSItem encver](self, "encver");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v44, 8));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("encver"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
    v14 = objc_msgSend(v13, "unsignedLongValue");

    v43 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v43, 8));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("pcsservice"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("pcspublickey"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("pcspublicidentity"));

  if (!v4)
    goto LABEL_36;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storedCKRecord"));
  if (!v18)
    goto LABEL_35;
  v36 = v5;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (!v20)
    goto LABEL_34;
  v21 = v20;
  v22 = *(_QWORD *)v40;
  do
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v40 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v23);
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("UUID")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("uploadver")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("data")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("wrappedkey")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("gen")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("encver")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("pcsservice")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("pcspublickey")) & 1) == 0
        && (objc_msgSend(v24, "isEqualToString:", CFSTR("pcspublicidentity")) & 1) == 0
        && (objc_msgSend(v24, "hasPrefix:", CFSTR("server_")) & 1) == 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v24));
        v25 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v38, v25) & 1) != 0)
        {
          v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dataUsingEncoding:", 4));
LABEL_24:
          v34 = v26;
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v26, v24);

        }
        else
        {
          v27 = objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v38, v27) & 1) != 0)
          {
            v26 = objc_msgSend(v38, "copy");
            goto LABEL_24;
          }
          v28 = objc_opt_class(NSDate);
          if ((objc_opt_isKindOfClass(v38, v28) & 1) != 0)
          {
            v35 = objc_alloc_init((Class)NSISO8601DateFormatter);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringForObjectValue:", v38));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dataUsingEncoding:", 4));
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v32, v24);

          }
          else
          {
            v29 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v38, v29) & 1) != 0)
            {
              v43 = (id)0xAAAAAAAAAAAAAAAALL;
              v43 = objc_msgSend(v38, "unsignedLongLongValue");
              v26 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v43, 8));
              goto LABEL_24;
            }
          }
        }

      }
      v23 = (char *)v23 + 1;
    }
    while (v21 != v23);
    v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    v21 = v30;
  }
  while (v30);
LABEL_34:

  v5 = v36;
  v18 = v37;
LABEL_35:

LABEL_36:
  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6));

  return v7;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ %p>"), v5, v6, self));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKKSItem;
  v4 = -[CKKSCKRecordHolder copyWithZone:](&v6, "copyWithZone:", a3);
  objc_storeStrong(v4 + 7, self->_uuid);
  objc_storeStrong(v4 + 8, self->_parentKeyUUID);
  objc_storeStrong(v4 + 9, self->_encitem);
  objc_storeStrong(v4 + 10, self->_wrappedkey);
  v4[11] = (id)self->_generationCount;
  v4[12] = (id)self->_encver;
  return v4;
}

- (NSString)base64Item
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));

  return (NSString *)v3;
}

- (void)setBase64Item:(id)a3
{
  id v4;
  NSData *v5;
  NSData *encitem;

  v4 = a3;
  v5 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v4, 0);

  encitem = self->_encitem;
  self->_encitem = v5;

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v12[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v13[0] = v6;
  v12[1] = CFSTR("UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v13[1] = v7;
  v12[2] = CFSTR("ckzone");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  return v10;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[12];
  _QWORD v41[12];

  v40[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v39 = v6;
  v41[0] = v6;
  v40[1] = CFSTR("UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v41[1] = v38;
  v40[2] = CFSTR("parentKeyUUID");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v41[2] = v37;
  v40[3] = CFSTR("ckzone");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));

  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10 = v9;

  v36 = v10;
  v41[3] = v10;
  v40[4] = CFSTR("encitem");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem base64Item](self, "base64Item"));
  v41[4] = v35;
  v40[5] = CFSTR("wrappedkey");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "base64WrappedKey"));
  v41[5] = v11;
  v40[6] = CFSTR("gencount");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CKKSItem generationCount](self, "generationCount")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
  v41[6] = v13;
  v40[7] = CFSTR("encver");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CKKSItem encver](self, "encver")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
  v41[7] = v15;
  v40[8] = CFSTR("ckrecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v41[8] = v19;
  v40[9] = CFSTR("pcss");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
  v21 = v20;
  if (v20)
    v22 = v20;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = v22;

  v41[9] = v23;
  v40[10] = CFSTR("pcsk");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "base64EncodedStringWithOptions:", 0));

  if (v25)
    v26 = v25;
  else
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27 = v26;

  v41[10] = v27;
  v40[11] = CFSTR("pcsi");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "base64EncodedStringWithOptions:", 0));

  if (v29)
    v30 = v29;
  else
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v31 = v30;

  v41[11] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 12));

  return v32;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setParentKeyUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)encitem
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncitem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWrappedkey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)encver
{
  return self->_encver;
}

- (void)setEncver:(unint64_t)a3
{
  self->_encver = a3;
}

- (NSNumber)plaintextPCSServiceIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPlaintextPCSServiceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)plaintextPCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPlaintextPCSPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSData)plaintextPCSPublicIdentity
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPlaintextPCSPublicIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plaintextPCSPublicIdentity, 0);
  objc_storeStrong((id *)&self->_plaintextPCSPublicKey, 0);
  objc_storeStrong((id *)&self->_plaintextPCSServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_wrappedkey, 0);
  objc_storeStrong((id *)&self->_encitem, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)setOSVersionInRecord:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = -[OTDeviceInformationActualAdapter osVersion]_0();
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uploadver"));

}

+ (id)sqlColumns
{
  return &off_10030B4C8;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  CKKSWrappedAESSIVKey *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKKSItem *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKKSItem *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CKKSWrappedAESSIVKey *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;

  v3 = a3;
  v24 = [CKKSItem alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UUID")));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "asString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("parentKeyUUID")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "asString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "asString"));
  v5 = objc_alloc((Class)CKRecordZoneID);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "asString"));
  v35 = objc_msgSend(v5, "initWithZoneName:ownerName:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asBase64DecodedData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("encitem")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "asBase64DecodedData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asString"));
  v30 = (void *)v4;
  if (v21)
  {
    v6 = [CKKSWrappedAESSIVKey alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asString"));
    v32 = -[CKKSWrappedAESSIVKey initWithBase64:](v6, "initWithBase64:");
  }
  else
  {
    v32 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gencount")));
  v7 = objc_msgSend(v20, "asNSInteger");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("encver")));
  v9 = objc_msgSend(v8, "asNSInteger");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pcss")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asNSNumberInteger"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pcsk")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asBase64DecodedData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pcsi")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "asBase64DecodedData"));
  v16 = -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:](v24, "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:", v30, v37, v36, v35, v34, v33, v32, v7, v9, v11, v13, v15);

  if (v21)
  {

  }
  return v16;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  CKKSMirrorEntry *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CKKSMirrorEntry *v14;
  CKKSMirrorEntry *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  BOOL v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  CKKSMirrorEntry *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  CKKSMirrorEntry *v49;
  void *v50;
  CKKSMirrorEntry *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  CKKSMirrorEntry *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  CKKSMirrorEntry *v73;
  CKKSMirrorEntry *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  CKKSMirrorEntry *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  CKKSIncomingQueueEntry *v91;
  void *v92;
  CKKSIncomingQueueEntry *v93;
  CKKSMirrorEntry *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v99;
  CKKSMirrorEntry *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  NSObject *v110;
  CKKSMirrorEntry *v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  void *i;
  CKKSMirrorEntry *v117;
  id v118;
  CKKSMirrorEntry *v119;
  CKKSMirrorEntry *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  CKKSMirrorEntry *v126;
  NSObject *oslog;
  CKKSIncomingQueueEntry *v129;
  CKKSMirrorEntry *v130;
  CKKSMirrorEntry *v131;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  _BYTE v144[128];
  _QWORD v145[3];
  uint8_t buf[4];
  CKKSMirrorEntry *v147;
  __int16 v148;
  CKKSMirrorEntry *v149;
  __int16 v150;
  void *v151;

  v6 = a5;
  v8 = (CKKSMirrorEntry *)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
  v143 = 0;
  v14 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(+[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:](CKKSMirrorEntry, "tryFromDatabase:contextID:zoneID:error:", v11, v9, v13, &v143));
  v15 = (CKKSMirrorEntry *)v143;

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckks"), v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    *(_DWORD *)buf = 138412290;
    v147 = v15;
    v21 = "error loading a CKKSMirrorEntry from database: %@";
    v22 = v20;
    v23 = 12;
    goto LABEL_4;
  }
  if (v6)
  {
    if (v14)
    {
      v25 = -[CKKSMirrorEntry matchesCKRecord:](v14, "matchesCKRecord:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "zoneID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "zoneName"));
      v29 = sub_10000BDF4(CFSTR("ckksresync"), v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);

      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
          *(_DWORD *)buf = 138412290;
          v147 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Already know about this item record, updating anyway: %@", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v147 = v14;
        v148 = 2112;
        v149 = v8;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "BUG: Local item doesn't match resynced CloudKit record: %@ %@", buf, 0x16u);
      }

      goto LABEL_21;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneName"));
    v35 = sub_10000BDF4(CFSTR("ckksresync"), v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v8;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "BUG: No local item matching resynced CloudKit record: %@", buf, 0xCu);
    }

LABEL_17:
    v14 = -[CKKSMirrorEntry initWithCKRecord:contextID:]([CKKSMirrorEntry alloc], "initWithCKRecord:contextID:", v8, v9);
    v37 = CFSTR("add");
    goto LABEL_35;
  }
  if (!v14)
    goto LABEL_17;
LABEL_21:
  v38 = objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
  if (v38)
  {
    v39 = (void *)v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
    v41 = objc_msgSend(v40, "generationCount");
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("gen")));
    v43 = objc_msgSend(v42, "unsignedLongLongValue");

    if (v41 > v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "zoneID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "zoneName"));
      v47 = sub_10000BDF4(CFSTR("ckks"), v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
        v51 = (CKKSMirrorEntry *)objc_msgSend(v50, "generationCount");
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("gen")));
        *(_DWORD *)buf = 138412802;
        v147 = v49;
        v148 = 2048;
        v149 = v51;
        v150 = 2112;
        v151 = v52;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "received a record from CloudKit with a bad generation count: %@ (%ld > %@)", buf, 0x20u);

      }
      if (a6)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
        v55 = objc_msgSend(v54, "generationCount");
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("gen")));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received a record(%@) with a bad generation count (%ld > %@)"), v53, v55, v56));
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 58, v57));

      }
      v15 = 0;
      goto LABEL_28;
    }
  }
  if (-[CKKSMirrorEntry matchesCKRecord:](v14, "matchesCKRecord:", v8) && !v6)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "zoneID"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "zoneName"));
    v61 = sub_10000BDF4(CFSTR("ckks"), v60);
    v62 = objc_claimAutoreleasedReturnValue(v61);

    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
      *(_DWORD *)buf = 138412290;
      v147 = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "CloudKit has told us of record we already know about for %@; skipping update",
        buf,
        0xCu);

    }
    v15 = 0;
    v24 = 1;
    goto LABEL_85;
  }
  -[CKKSMirrorEntry setFromCKRecord:](v14, "setFromCKRecord:", v8);
  v37 = CFSTR("modify");
LABEL_35:
  v142 = 0;
  v64 = -[CKKSSQLDatabaseObject saveToDatabase:](v14, "saveToDatabase:", &v142);
  v15 = (CKKSMirrorEntry *)v142;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "zoneID"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "zoneName"));
  v68 = sub_10000BDF4(CFSTR("ckks"), v67);
  v20 = objc_claimAutoreleasedReturnValue(v68);

  if (!v64 || v15)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      if (a6)
      {
        v15 = objc_retainAutorelease(v15);
        v24 = 0;
        *a6 = v15;
        goto LABEL_85;
      }
LABEL_28:
      v24 = 0;
      goto LABEL_85;
    }
    *(_DWORD *)buf = 138412546;
    v147 = v8;
    v148 = 2112;
    v149 = v15;
    v21 = "couldn't save new CKRecord to database: %@ %@";
    v22 = v20;
    v23 = 22;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v147 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CKKSMirrorEntry was created: %@", buf, 0xCu);
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "uuid"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "zoneID"));
  v141 = 0;
  v73 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(+[CKKSIncomingQueueEntry tryFromDatabase:contextID:zoneID:error:](CKKSIncomingQueueEntry, "tryFromDatabase:contextID:zoneID:error:", v70, v9, v72, &v141));
  v74 = (CKKSMirrorEntry *)v141;

  v131 = v74;
  if (v74)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "zoneID"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "zoneName"));
    v78 = sub_10000BDF4(CFSTR("ckks"), v77);
    v79 = objc_claimAutoreleasedReturnValue(v78);

    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v131;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Couldn't load possible existing incoming queue entry: %@", buf, 0xCu);
    }

  }
  if (v73)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "zoneID"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "zoneName"));
    v83 = sub_10000BDF4(CFSTR("ckks"), v82);
    v84 = objc_claimAutoreleasedReturnValue(v83);

    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v73;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Deleting existing CKKSIncomingQueueEntry: %@", buf, 0xCu);
    }

    v140 = 0;
    -[CKKSSQLDatabaseObject deleteFromDatabase:](v73, "deleteFromDatabase:", &v140);
    v85 = (CKKSMirrorEntry *)v140;
    if (v85)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "zoneID"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "zoneName"));
      v89 = sub_10000BDF4(CFSTR("ckks"), v88);
      v90 = objc_claimAutoreleasedReturnValue(v89);

      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v147 = v85;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "Couldn't delete existing incoming queue entry: %@", buf, 0xCu);
      }

    }
  }
  v130 = v73;
  v91 = [CKKSIncomingQueueEntry alloc];
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
  v93 = -[CKKSIncomingQueueEntry initWithCKKSItem:action:state:](v91, "initWithCKKSItem:action:state:", v92, v37, CFSTR("new"));

  v139 = 0;
  LODWORD(v91) = -[CKKSSQLDatabaseObject saveToDatabase:](v93, "saveToDatabase:", &v139);
  v94 = (CKKSMirrorEntry *)v139;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "zoneID"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "zoneName"));
  v98 = sub_10000BDF4(CFSTR("ckks"), v97);
  v99 = objc_claimAutoreleasedReturnValue(v98);

  v100 = v94;
  if (!(_DWORD)v91 || v94)
  {
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v94;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Couldn't save modified incoming queue entry: %@", buf, 0xCu);
    }

    v119 = v130;
    if (a6)
    {
      v120 = objc_retainAutorelease(v94);
      v15 = 0;
      v24 = 0;
      *a6 = v120;
    }
    else
    {
      v15 = 0;
      v24 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v147 = (CKKSMirrorEntry *)v93;
      _os_log_debug_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "CKKSIncomingQueueEntry was created: %@", buf, 0xCu);
    }

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v93, "uuid"));
    v145[0] = CFSTR("new");
    v145[1] = CFSTR("reencrypt");
    v145[2] = CFSTR("error");
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v145, 3));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "zoneID"));
    v138 = 0;
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry allWithUUID:states:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "allWithUUID:states:contextID:zoneID:error:", v101, v102, v9, v104, &v138));
    v15 = (CKKSMirrorEntry *)v138;

    if (!v105 || v15)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "zoneID"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "zoneName"));
      v109 = sub_10000BDF4(CFSTR("ckks"), v108);
      v110 = objc_claimAutoreleasedReturnValue(v109);

      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        v111 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v93, "uuid"));
        *(_DWORD *)buf = 138412546;
        v147 = v111;
        v148 = 2112;
        v149 = v15;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "Couldn't load OQE sibling for %@: %@", buf, 0x16u);

      }
    }
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v112 = v105;
    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
    if (v113)
    {
      v114 = v113;
      v129 = v93;
      v115 = *(_QWORD *)v135;
      while (2)
      {
        for (i = 0; i != v114; i = (char *)i + 1)
        {
          if (*(_QWORD *)v135 != v115)
            objc_enumerationMutation(v112);
          v117 = *(CKKSMirrorEntry **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)i);
          v133 = 0;
          -[CKKSSQLDatabaseObject deleteFromDatabase:](v117, "deleteFromDatabase:", &v133);
          v118 = v133;
          if (v118)
          {
            v121 = v118;
            v122 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "zoneID"));
            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "zoneName"));
            v125 = sub_10000BDF4(CFSTR("ckks"), v124);
            oslog = objc_claimAutoreleasedReturnValue(v125);

            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v126 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v129, "uuid"));
              *(_DWORD *)buf = 138412802;
              v147 = v117;
              v148 = 2112;
              v149 = v126;
              v150 = 2112;
              v151 = v121;
              _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Couldn't delete OQE sibling(%@) for %@: %@", buf, 0x20u);

            }
            v100 = 0;
            if (a6)
              *a6 = objc_retainAutorelease(v121);

            v24 = 0;
            v93 = v129;
            goto LABEL_83;
          }
        }
        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
        if (v114)
          continue;
        break;
      }
      v24 = 1;
      v93 = v129;
    }
    else
    {
      v24 = 1;
    }
    v100 = 0;
LABEL_83:

    v119 = v130;
  }

LABEL_85:
  return v24;
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
  void *v15;
  __CFString *v16;
  unsigned __int8 v17;
  NSObject *v18;
  NSObject *v19;
  CKKSIncomingQueueEntry *v20;
  void *v21;
  CKKSIncomingQueueEntry *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  int v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  __CFString *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  CKKSIncomingQueueEntry *v59;
  id obj;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  __CFString *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _QWORD v76[3];

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = sub_10000BDF4(CFSTR("ckks"), v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v70 = CFSTR("item");
    v71 = 2112;
    v72 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CloudKit notification: deleted record(%@): %@", buf, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:](CKKSMirrorEntry, "tryFromDatabase:contextID:zoneID:error:", v14, v9, v15, a6));

  if (!v16)
    goto LABEL_38;
  v68 = 0;
  v17 = -[__CFString deleteFromDatabase:](v16, "deleteFromDatabase:", &v68);
  v18 = v68;
  v19 = v18;
  if ((v17 & 1) == 0)
  {
    if (a6)
    {
      v19 = objc_retainAutorelease(v18);
      v29 = 0;
      v24 = 0;
      *a6 = v19;
    }
    else
    {
      v29 = 0;
      v24 = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
  v20 = [CKKSIncomingQueueEntry alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString item](v16, "item"));
  v22 = -[CKKSIncomingQueueEntry initWithCKKSItem:action:state:](v20, "initWithCKKSItem:action:state:", v21, CFSTR("delete"), CFSTR("new"));

  v67 = 0;
  -[CKKSSQLDatabaseObject saveToDatabase:](v22, "saveToDatabase:", &v67);
  v23 = (__CFString *)v67;
  if (v23)
  {
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
    v27 = sub_10000BDF4(CFSTR("ckks"), v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't save incoming queue entry: %@", buf, 0xCu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v24);

    v29 = 0;
    goto LABEL_41;
  }
  v59 = v22;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v22, "uuid"));
  v76[0] = CFSTR("new");
  v76[1] = CFSTR("reencrypt");
  v76[2] = CFSTR("error");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 3));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v66 = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry allWithUUID:states:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "allWithUUID:states:contextID:zoneID:error:", v30, v31, v9, v32, &v66));
  v34 = (__CFString *)v66;

  if (v34)
  {
    v35 = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "zoneName"));
    v38 = sub_10000BDF4(CFSTR("ckks"), v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v59, "uuid"));
      *(_DWORD *)buf = 138412546;
      v70 = v40;
      v71 = 2112;
      v72 = v34;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't load OQE sibling for %@: %@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(v34);
    v41 = 1;
    v33 = v35;
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v33;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v42)
    {
      v43 = v42;
      v58 = v33;
      v44 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(obj);
          v46 = *(__CFString **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v61 = 0;
          -[__CFString deleteFromDatabase:](v46, "deleteFromDatabase:", &v61);
          v47 = v61;
          if (v47)
          {
            v48 = v47;
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "zoneName"));
            v51 = sub_10000BDF4(CFSTR("ckks"), v50);
            v52 = objc_claimAutoreleasedReturnValue(v51);

            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](v59, "uuid"));
              *(_DWORD *)buf = 138412802;
              v70 = v46;
              v71 = 2112;
              v72 = v53;
              v73 = 2112;
              v74 = v48;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Couldn't delete OQE sibling(%@) for %@: %@", buf, 0x20u);

            }
            v33 = v58;
            if (a6)
              *a6 = objc_retainAutorelease(v48);

            v41 = 1;
            goto LABEL_35;
          }
        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (v43)
          continue;
        break;
      }
      v41 = 0;
      v33 = v58;
    }
    else
    {
      v41 = 0;
    }
LABEL_35:

    v34 = 0;
  }

  if (!v41)
  {
LABEL_38:
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "zoneName"));
    v56 = sub_10000BDF4(CFSTR("ckks"), v55);
    v19 = objc_claimAutoreleasedReturnValue(v56);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v70 = v8;
      v71 = 2112;
      v72 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CKKSMirrorEntry was deleted: %@ %@", buf, 0x16u);
    }
    v24 = 0;
    v29 = 1;
    goto LABEL_41;
  }
  v29 = 0;
  v24 = 0;
LABEL_42:

  return v29;
}

@end
