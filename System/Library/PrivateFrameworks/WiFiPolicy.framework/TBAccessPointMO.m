@implementation TBAccessPointMO

+ (id)entityName
{
  return CFSTR("AccessPoint");
}

- (TBScore)qualityScore
{
  return (TBScore *)+[TBQualityScore qualityScoreWithValue:](TBQualityScore, "qualityScoreWithValue:", (int)-[TBAccessPointMO qualityScoreValue](self, "qualityScoreValue"));
}

- (TBScore)popularityScore
{
  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:](TBPopularityScore, "popularityScoreWithValue:", (int)-[TBAccessPointMO popularityScoreValue](self, "popularityScoreValue"));
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TBAccessPointMO edge](self, "edge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("edge"));

  -[TBAccessPointMO BSSID](self, "BSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TBAccessPointMO BSSID](self, "BSSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bssid"));

  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TBAccessPointMO latitude](self, "latitude");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("latitude"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[TBAccessPointMO longitude](self, "longitude");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("longitude"));

  -[TBAccessPointMO popularityScore](self, "popularityScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[TBAccessPointMO popularityScore](self, "popularityScore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("popularityScoreValue"));

  }
  -[TBAccessPointMO qualityScore](self, "qualityScore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[TBAccessPointMO qualityScore](self, "qualityScore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "score"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("qualityScoreValue"));

  }
  return v3;
}

- (TBAccessPointMO)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TBAccessPointMO;
  return -[TBAccessPointMO init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO edge](self, "edge"), CFSTR("edge"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO tcpGood](self, "tcpGood"), CFSTR("tcpGood"));
  -[TBAccessPointMO bssid](self, "bssid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("bssid"));

  -[TBAccessPointMO latitude](self, "latitude");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"));
  -[TBAccessPointMO longitude](self, "longitude");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[TBAccessPointMO popularityScoreValue](self, "popularityScoreValue"), CFSTR("popularityScoreValue"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[TBAccessPointMO qualityScoreValue](self, "qualityScoreValue"), CFSTR("qualityScoreValue"));

}

+ (id)generateNewAccessPointObjectFromMOC:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke;
  v7[3] = &unk_1E881D6A8;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C97B20];
  +[TBAccessPointMO entityName](TBAccessPointMO, "entityName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)removeAllAccessPointsInMOC:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[TBAccessPointMO fetchRequest](TBAccessPointMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AccessPoint"));
}

@end
