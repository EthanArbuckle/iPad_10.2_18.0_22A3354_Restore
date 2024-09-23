@implementation BatchQueryInfo

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[BatchQueryInfo status](self, "status")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  if (-[BatchQueryInfo hasUriWitness](self, "hasUriWitness"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo uriWitness](self, "uriWitness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("uriWitness"));

  }
  if (-[BatchQueryInfo hasMapEntry](self, "hasMapEntry"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo mapEntry](self, "mapEntry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mapEntry"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo pendingSmtsArray](self, "pendingSmtsArray", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMutationTimestamp signedTypeWithObject:](SignedMutationTimestamp, "signedTypeWithObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14)));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diagnosticsJsonDictionary"));
        objc_msgSend(v9, "addObject:", v16);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pendingSmts"));

  return v3;
}

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A76D8;
  if (!qword_1002A76D8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchQueryInfo, CFSTR("BatchQueryInfo"), &unk_1002A3550, &off_1002A36E8, 4, 32, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002172D7);
    qword_1002A76D8 = (uint64_t)v2;
  }
  return v2;
}

@end
