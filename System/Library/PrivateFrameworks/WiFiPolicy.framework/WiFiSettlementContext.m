@implementation WiFiSettlementContext

uint64_t __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BSSID");
}

- (BOOL)compareWithScanResults:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (+[WiFiSettlementContext networkQualifiesForSettlement:](WiFiSettlementContext, "networkQualifiesForSettlement:", v10, (_QWORD)v16))
          {
            -[WiFiSettlementContext strongestBSSIDs](self, "strongestBSSIDs");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "BSSID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "containsObject:", v12);

            if ((v13 & 1) != 0)
            {
              v14 = 1;
              goto LABEL_13;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_13:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)networkQualifiesForSettlement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "scanProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CARPLAY_NETWORK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (objc_msgSend(v3, "scanProperties"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", CFSTR("APPLE_DEVICE_IE")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "BSSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  return v9;
}

- (NSSet)strongestBSSIDs
{
  return self->_strongestBSSIDs;
}

BOOL __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:](WiFiSettlementContext, "networkQualifiesForSettlement:", a2);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)_updateStrongestNetworks:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *strongestNetworks;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *strongestBSSIDs;
  id v12;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "networksSortedBySignalStrengthWithMaxCount:", -[WiFiSettlementContext maxCount](self, "maxCount"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  strongestNetworks = self->_strongestNetworks;
  self->_strongestNetworks = v6;

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[NSArray mapObjectsUsingBlock:](self->_strongestNetworks, "mapObjectsUsingBlock:", &__block_literal_global_5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
  strongestBSSIDs = self->_strongestBSSIDs;
  self->_strongestBSSIDs = v10;

}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (WiFiSettlementContext)initWithNetworks:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  WiFiSettlementContext *v7;
  uint64_t v8;
  NSDate *creationDate;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiSettlementContext;
  v7 = -[WiFiSettlementContext init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

    v7->_maxCount = a4;
    -[WiFiSettlementContext _updateStrongestNetworks:](v7, "_updateStrongestNetworks:", v6);
  }

  return v7;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSArray)strongestNetworks
{
  return self->_strongestNetworks;
}

- (void)setStrongestNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_strongestNetworks, a3);
}

- (void)setStrongestBSSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_strongestBSSIDs, a3);
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongestBSSIDs, 0);
  objc_storeStrong((id *)&self->_strongestNetworks, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
