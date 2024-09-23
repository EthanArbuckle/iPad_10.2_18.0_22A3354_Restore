@implementation RadioRecentStationsResponse

- (RadioRecentStationsResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  RadioRecentStationsResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;

  v4 = a3;
  v5 = -[RadioRecentStationsResponse init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSArray)stationDictionaries
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("stations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSArray"))
  {
    if (objc_msgSend(v2, "count"))
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSArray)stationGroups
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  RadioRecentStationsResponseStationGroup *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("station-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSArray"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "isNSDictionary", (_QWORD)v12))
          {
            v10 = -[RadioRecentStationsResponseStationGroup initWithResponseDictionary:]([RadioRecentStationsResponseStationGroup alloc], "initWithResponseDictionary:", v9);
            if (v10)
            {
              if (!v6)
                v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
              objc_msgSend(v6, "addObject:", v10);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
