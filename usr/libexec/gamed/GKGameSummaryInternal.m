@implementation GKGameSummaryInternal

- (id)initWithGameSummary:(id)a3
{
  id v4;
  GKGameSummaryInternal *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKGameSummaryInternal;
  v5 = -[GKGameSummaryInternal init](&v25, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamID"));
    -[GKGameSummaryInternal setAdamID:](v5, "setAdamID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
    -[GKGameSummaryInternal setBundleID:](v5, "setBundleID:", v7);

    v8 = objc_alloc_init((Class)NSMutableSet);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compatiblePlatforms", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playedAt"));
    -[GKGameSummaryInternal setPlayedAt:](v5, "setPlayedAt:", v18);

    -[GKGameSummaryInternal setCompatiblePlatforms:](v5, "setCompatiblePlatforms:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isArcade"));
    -[GKGameSummaryInternal setIsArcade:](v5, "setIsArcade:", objc_msgSend(v19, "BOOLValue"));

  }
  return v5;
}

@end
