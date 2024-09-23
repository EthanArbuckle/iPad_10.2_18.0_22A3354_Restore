@implementation VCRecordZoneParser

+ (BOOL)shouldIgnoreZoneID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCRecordZoneParser.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

  }
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("_defaultZone"), CFSTR("metadata_zone"), 0);
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

+ (BOOL)parseZoneID:(id)a3 intoIndex:(int64_t *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && (objc_msgSend(a1, "shouldIgnoreZoneID:", v6) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("VoiceShortcuts")))
    {
      *a4 = 0;
      v8 = 1;
    }
    else
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(v10, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length")
          && (objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v12, "invertedSet"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v13),
              v13,
              v12,
              v14 == 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v10, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = objc_msgSend(v15, "integerValue");

          v8 = 1;
        }
        else
        {
          v8 = 0;
        }

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

  return v8;
}

+ (id)sortedVoiceShortcutZoneIDsFromZoneIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v18 = 0;
    goto LABEL_18;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v9 = *(_QWORD *)v24;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
      v22 = 0;
      if ((objc_msgSend(a1, "parseZoneID:intoIndex:", v11, &v22) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);
LABEL_9:

        goto LABEL_11;
      }
      if ((objc_msgSend(a1, "shouldIgnoreZoneID:", v11) & 1) == 0)
      {
        getWFPeaceMigrationLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "zoneName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v28 = "+[VCRecordZoneParser sortedVoiceShortcutZoneIDsFromZoneIDs:]";
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Ignoring zone with unexpected name: (%@)", buf, 0x16u);

        }
        goto LABEL_9;
      }
LABEL_11:
      ++v10;
    }
    while (v8 != v10);
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    v8 = v14;
  }
  while (v14);
LABEL_16:

  objc_msgSend(v5, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__VCRecordZoneParser_sortedVoiceShortcutZoneIDsFromZoneIDs___block_invoke;
  v20[3] = &unk_1E7AF88C8;
  v21 = v5;
  v17 = v5;
  objc_msgSend(v16, "if_compactMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v18;
}

+ (id)activeRecordZone:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCRecordZoneParser.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VCRecordZoneParser_activeRecordZone___block_invoke;
  aBlock[3] = &unk_1E7AF88F0;
  v11 = v5;
  v12 = a1;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

void __39__VCRecordZoneParser_activeRecordZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
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
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedVoiceShortcutZoneIDsFromZoneIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 40);
  objc_msgSend(v12, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedVoiceShortcutZoneIDsFromZoneIDs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = v18;
    else
      v19 = v20;
    v17 = v19;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __60__VCRecordZoneParser_sortedVoiceShortcutZoneIDsFromZoneIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

@end
