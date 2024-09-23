@implementation APMockMAPIResponseSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageUserDefaults), "initWithDefaultValues:", v3);

  return v4;
}

- (NSArray)contentDataObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMockMAPIResponseSettings responseJson](self, "responseJson"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
    v21 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 0, &v21));
    v7 = v21;

    v8 = 0;
    if (!v7)
    {
      if (objc_msgSend(v6, "count"))
      {
        v9 = objc_alloc_init((Class)NSMutableArray);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v6;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[APMockMAPIResponseSettings _parseContentDataJson:](self, "_parseContentDataJson:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
              if (v15)
                objc_msgSend(v9, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          }
          while (v12);
        }

        v8 = objc_msgSend(v9, "copy");
      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (id)_parseContentDataJson:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v3 = a3;
  v4 = objc_alloc_init((Class)APContentData);
  v5 = objc_alloc_init((Class)APRepresentationData);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ttl")));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", (double)(uint64_t)v7));
  objc_msgSend(v4, "setExpirationDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adamId")));
  objc_msgSend(v5, "setAdamID:", v10);

  v11 = objc_alloc((Class)NSUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("impressionId")));
  v13 = objc_msgSend(v11, "initWithUUIDString:", v12);
  objc_msgSend(v5, "setImpressionID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("metadata")));
  objc_msgSend(v5, "setMetadata:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("journeyRelayAdGroupId")));
  objc_msgSend(v5, "setJourneyRelayAdGroupId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("journeyRelayCampaignId")));
  objc_msgSend(v5, "setJourneyRelayCampaignId:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("parentAppCheckEnabled")));
  objc_msgSend(v5, "setParentAppCheckEnabled:", objc_msgSend(v17, "BOOLValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rank")));
  objc_msgSend(v5, "setRank:", objc_msgSend(v18, "integerValue"));

  v19 = objc_alloc((Class)NSUUID);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iAdId")));

  v21 = objc_msgSend(v19, "initWithUUIDString:", v20);
  objc_msgSend(v5, "setIAdID:", v21);

  objc_msgSend(v5, "setInstallAttribution:", &__NSDictionary0__struct);
  objc_msgSend(v5, "setPlacementType:", 5);
  objc_msgSend(v4, "addRepresentation:", v5);

  return v4;
}

@end
