@implementation CKKSExternalKey

- (id)initWithViewName:(id)a3 tlk:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CKKSExternalKey *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentKeyUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedKeyData"));

  v11 = -[CKKSExternalKey initWithView:uuid:parentTLKUUID:keyData:](self, "initWithView:uuid:parentTLKUUID:keyData:", v7, v8, v9, v10);
  return v11;
}

- (id)makeCKKSKey:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  CKKSKey *v9;
  void *v10;
  void *v11;
  void *v12;
  CKKSKey *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = [CKKSKey alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey keyData](self, "keyData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID"));
  if (v12)
  {
    v13 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:](v9, "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:", v10, v8, v11, v12, CFSTR("tlk"), CFSTR("remote"), v7, 0, 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
    v13 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:](v9, "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:", v10, v8, v11, v14, CFSTR("tlk"), CFSTR("remote"), v7, 0, 0);

  }
  return v13;
}

- (id)makeFakeCKKSClassKey:(id)a3 contextID:(id)a4 zoneiD:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  CKKSKey *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKKSKey *v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [CKKSKey alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey keyData](self, "keyData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-fake-%@"), v14, v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID"));
  v17 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:](v12, "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:", v13, v10, v15, v16, v11, CFSTR("remote"), v9, 0, 0);

  return v17;
}

@end
