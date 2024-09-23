@implementation TBNetworkMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Network"));
}

+ (id)entityName
{
  return CFSTR("Network");
}

- (NSString)authDescription
{
  void *v3;
  void *v4;
  NSString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[TBNetworkMO authMask](self, "authMask") & 1) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("OPEN "));
  if ((-[TBNetworkMO authMask](self, "authMask") & 2) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("WEP "));
  if ((-[TBNetworkMO authMask](self, "authMask") & 4) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("WPA "));
  if ((-[TBNetworkMO authMask](self, "authMask") & 8) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("EAP "));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)attributesDescription
{
  void *v3;
  void *v4;
  NSString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TBNetworkMO isPublic](self, "isPublic"))
    objc_msgSend(v3, "appendString:", CFSTR("isPublic "));
  if (-[TBNetworkMO isMoving](self, "isMoving"))
    objc_msgSend(v3, "appendString:", CFSTR("isMoving "));
  if (-[TBNetworkMO isSuspicious](self, "isSuspicious"))
    objc_msgSend(v3, "appendString:", CFSTR("isSuspicious "));
  if (-[TBNetworkMO isCaptive](self, "isCaptive"))
    objc_msgSend(v3, "appendString:", CFSTR("isCaptive "));
  if (-[TBNetworkMO isLowQuality](self, "isLowQuality"))
    objc_msgSend(v3, "appendString:", CFSTR("isLowQuality "));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (TBScore)qualityScore
{
  return (TBScore *)+[TBQualityScore qualityScoreWithValue:](TBQualityScore, "qualityScoreWithValue:", (int)-[TBNetworkMO qualityScoreValue](self, "qualityScoreValue"));
}

- (TBScore)popularityScore
{
  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:](TBPopularityScore, "popularityScoreWithValue:", (int)-[TBNetworkMO popularityScoreValue](self, "popularityScoreValue"));
}

- (id)dictionaryRepresentation
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
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBNetworkMO moving](self, "moving"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("moving"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBNetworkMO suspicious](self, "suspicious"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("suspicious"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBNetworkMO captive](self, "captive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("captive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBNetworkMO public](self, "public"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("public"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBNetworkMO lowQuality](self, "lowQuality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lowQuality"));

  -[TBNetworkMO name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TBNetworkMO name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("name"));

  }
  -[TBNetworkMO identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TBNetworkMO identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("identifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[TBNetworkMO authMask](self, "authMask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("authMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[TBNetworkMO tileKey](self, "tileKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("tileKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[TBNetworkMO timestamp](self, "timestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

  -[TBNetworkMO popularityScore](self, "popularityScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[TBNetworkMO popularityScore](self, "popularityScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "score"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("popularityScoreValue"));

  }
  -[TBNetworkMO qualityScore](self, "qualityScore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[TBNetworkMO qualityScore](self, "qualityScore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "score"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("qualityScoreValue"));

  }
  -[TBNetworkMO accessPoints](self, "accessPoints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[TBNetworkMO accessPoints](self, "accessPoints", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v30), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("accessPoints"));
  }
  -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("ownerIdentifiers"));

  }
  return v3;
}

- (TBNetworkMO)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TBNetworkMO;
  return -[TBNetworkMO init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO moving](self, "moving"), CFSTR("moving"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO captive](self, "captive"), CFSTR("captive"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO suspicious](self, "suspicious"), CFSTR("suspicious"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO public](self, "public"), CFSTR("public"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO lowQuality](self, "lowQuality"), CFSTR("lowQuality"));
  -[TBNetworkMO name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("name"));

  -[TBNetworkMO identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO authMask](self, "authMask"), CFSTR("authMask"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO tileKey](self, "tileKey"), CFSTR("tileKey"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO timestamp](self, "timestamp"), CFSTR("timestamp"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[TBNetworkMO popularityScoreValue](self, "popularityScoreValue"), CFSTR("popularityScoreValue"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[TBNetworkMO qualityScoreValue](self, "qualityScoreValue"), CFSTR("qualityScoreValue"));
  -[TBNetworkMO accessPoints](self, "accessPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("accessPoints"));

  -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("ownerIdentifiers"));

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO type](self, "type"), CFSTR("type"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO venueGroup](self, "venueGroup"), CFSTR("venueGroup"));
  objc_msgSend(v8, "encodeInt64:forKey:", (int)-[TBNetworkMO venueType](self, "venueType"), CFSTR("venueType"));

}

+ (id)generateNewNetworkObjectFromMOC:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17AC818]();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke;
  v8[3] = &unk_1E881D6A8;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v4);

  return v6;
}

void __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C97B20];
  +[TBNetworkMO entityName](TBNetworkMO, "entityName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)removeNetworksUsingPredicate:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17AC818]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Network"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke;
  v13[3] = &unk_1E881CF98;
  v10 = v6;
  v14 = v10;
  v15 = v9;
  v12 = v5;
  v16 = v12;
  v11 = v9;
  objc_msgSend(v10, "performBlockAndWait:", v13);

  objc_autoreleasePoolPop(v7);
}

void __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v8 = 0;
  v5 = (id)objc_msgSend(v3, "executeRequest:error:", v4, &v8);
  v6 = v8;
  v7 = v6;
  if (v6)
    NSLog(CFSTR("%s: error %@"), "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke", v6);
  else
    NSLog(CFSTR("%s: Removed networks that match supplied predicate <%@>"), "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke", a1[6]);

  objc_autoreleasePoolPop(v2);
}

+ (void)removeAllNetworksInMOC:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17AC818]();
  v5 = objc_alloc(MEMORY[0x1E0C97A90]);
  +[TBNetworkMO fetchRequest](TBNetworkMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFetchRequest:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke;
  v10[3] = &unk_1E881C8C0;
  v9 = v3;
  v11 = v9;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v10);

  objc_autoreleasePoolPop(v4);
}

void __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v5 = (id)objc_msgSend(v3, "executeRequest:error:", v4, &v8);
  v6 = v8;
  v7 = v6;
  if (v6)
    NSLog(CFSTR("%s: error %@"), "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke", v6);
  else
    NSLog(CFSTR("%s: Removed all networks"), "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke");

  objc_autoreleasePoolPop(v2);
}

@end
