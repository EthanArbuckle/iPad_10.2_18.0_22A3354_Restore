@implementation _PSFamilyUtilities

+ (id)featureSet
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E442CB38);
}

+ (BOOL)contactMarkedAsFamilyInFeatureDict:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(&unk_1E442CB50, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(&unk_1E442CB50);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(&unk_1E442CB50, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)featureDictionaryPassesHeuristic:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              +[_PSFamilyUtilities featureDictionaryPassesHeuristic:].cold.1(v9, (uint64_t)v10, v17);
            v16 = 0;
            goto LABEL_17;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKeyPath:", CFSTR("@sum.self"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (v14 > 0.0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactParent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "integerValue") == 1)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactFamilyRelation"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "integerValue") == 1)
        {
          v16 = 1;
        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactEmergencyFamily"));
          v17 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject integerValue](v17, "integerValue") == 1)
          {
            v16 = 1;
            v4 = v15;
LABEL_17:

            v15 = v4;
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactInHome"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "integerValue");

            if (v20 == 1)
            {
              v16 = 1;
              goto LABEL_20;
            }
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callOutgoingRatio"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "doubleValue");
            v22 = v21;
            if (v21 <= 0.0
              && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgOutgoingRatio")),
                  v10 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v10, "doubleValue"),
                  v23 <= 0.0))
            {
              v16 = 0;
            }
            else
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgSixWeeks"), (_QWORD)v28);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "doubleValue");
              if (v25 <= 0.0)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thirdPartyMsgTwoWeeks"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "doubleValue");
                v16 = v27 > 0.0;

              }
              else
              {
                v16 = 1;
              }

              if (v22 > 0.0)
                goto LABEL_19;
            }
          }
        }

      }
LABEL_19:

      goto LABEL_20;
    }
  }
  v16 = 0;
LABEL_20:

  return v16;
}

+ (void)featureDictionaryPassesHeuristic:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = (id)objc_opt_class();
  v4 = v8;
  _os_log_fault_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_FAULT, "Feature value for key: %@ contained an unsupported type of %@", (uint8_t *)&v5, 0x16u);

}

@end
