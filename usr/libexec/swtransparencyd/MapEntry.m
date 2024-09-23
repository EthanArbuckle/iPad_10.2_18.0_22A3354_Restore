@implementation MapEntry

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A668;
  if (!qword_10012A668)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MapEntry, CFSTR("MapEntry"), &unk_1001259B0, &off_100125D88, 3, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB392);
    qword_10012A668 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyMapEntryVerifier)verifier
{
  return (TransparencyMapEntryVerifier *)objc_getAssociatedObject(self, CFSTR("verifierKey"));
}

- (void)setVerifier:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("verifierKey"), a3, (void *)1);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, CFSTR("dataStoreKey"));
}

- (void)setDataStore:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("dataStoreKey"), a3, (void *)1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("metadata"), a3, (void *)1);
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[MapEntry setMetadata:](self, "setMetadata:", v8);

  }
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
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
  id v24;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;

  if (!-[MapEntry hasSmh](self, "hasSmh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry smh](self, "smh")), v5, !v5))
  {
    v26 = -15;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf"));
  if (!v6
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf")),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        !v9))
  {
    v26 = -16;
    if (!a3)
      goto LABEL_12;
LABEL_11:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v26, CFSTR("map entry data required for verification")));
    goto LABEL_12;
  }
  v10 = objc_claimAutoreleasedReturnValue(-[MapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[MapEntry hashesOfPeersInPathToRootArray_Count](self, "hashesOfPeersInPathToRootArray_Count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry smh](self, "smh"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry verifier](self, "verifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trustedKeyStore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signatureVerifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry dataStore](self, "dataStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:verifier:dataStore:](SignedMapHead, "signedTypeWithObject:verifier:dataStore:", v13, v16, v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry metadata](self, "metadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("overrideLogBeginTime")));
      objc_msgSend(v18, "setOverrideBeginTime:", objc_msgSend(v20, "longLongValue"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry verifier](self, "verifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
      v24 = objc_msgSend(v21, "verifyMapEntryWithMapLeaf:hashesToRoot:signedMapHead:error:", v22, v23, v18, a3);

      return (unint64_t)v24;
    }
  }
  v26 = -17;
  if (a3)
    goto LABEL_11;
LABEL_12:
  if (qword_10012A820 != -1)
    dispatch_once(&qword_10012A820, &stru_100106C40);
  v27 = qword_10012A828;
  if (os_log_type_enabled((os_log_t)qword_10012A828, OS_LOG_TYPE_ERROR))
  {
    v28 = 134217984;
    v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "map entry data required for verification: %ld", (uint8_t *)&v28, 0xCu);
  }
  return 0;
}

@end
