@implementation BatchedMapEntry

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A76E0;
  if (!qword_1002A76E0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchedMapEntry, CFSTR("BatchedMapEntry"), &unk_1002A3550, &off_1002A3768, 3, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002172ED);
    qword_1002A76E0 = (uint64_t)v2;
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

- (SignedMapHead)smh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, CFSTR("smh"));
}

- (void)setSmh:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("smh"), a3, (void *)1);
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[BatchedMapEntry setMetadata:](self, "setMetadata:", v8);

  }
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry index](self, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("index"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mapLeaf"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "kt_hexString"));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hashesOfPeersInPathToRoot"));
  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;

  v5 = objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf")),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        !v8))
  {
    v22 = -16;
    if (!a3)
    {
LABEL_9:
      if (qword_1002A77E8 != -1)
        dispatch_once(&qword_1002A77E8, &stru_100248230);
      v23 = qword_1002A77F0;
      if (!os_log_type_enabled((os_log_t)qword_1002A77F0, OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 134217984;
      v31 = v22;
      v24 = "map entry data required for verification: %ld";
      v25 = v23;
      v26 = 12;
      goto LABEL_13;
    }
LABEL_8:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v22, CFSTR("map entry data required for verification")));
    goto LABEL_9;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[BatchedMapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  if (!v9
    || (v10 = (void *)v9,
        v11 = -[BatchedMapEntry hashesOfPeersInPathToRootArray_Count](self, "hashesOfPeersInPathToRootArray_Count"),
        v10,
        !v11))
  {
    v22 = -17;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry verifier](self, "verifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry verifier](self, "verifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "entryPosition"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry smh](self, "smh"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "parsedMapHead"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapHeadHash"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry smh](self, "smh"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parsedMapHead"));
  v19 = objc_msgSend(v18, "treeId");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  LOBYTE(v19) = objc_msgSend(v12, "verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:", v13, v14, v16, v19, v20, a3);

  if ((v19 & 1) != 0)
    return 1;
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -43, *a3, CFSTR("failed to verify inclusion proof for map leaf in mapHeadHash")));
  if (qword_1002A77E8 != -1)
    dispatch_once(&qword_1002A77E8, &stru_100248250);
  v27 = qword_1002A77F0;
  if (os_log_type_enabled((os_log_t)qword_1002A77F0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v24 = "failed to verify inclusion proof for map leaf in mapHeadHash";
    v25 = v27;
    v26 = 2;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
  }
  return 0;
}

@end
