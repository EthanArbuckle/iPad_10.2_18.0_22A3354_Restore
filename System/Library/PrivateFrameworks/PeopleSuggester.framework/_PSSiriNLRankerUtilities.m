@implementation _PSSiriNLRankerUtilities

+ (id)knowledgeEventWithContactPriors:(id)a3 interactionId:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v35 = *(_QWORD *)v38;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v9, "contactIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "givenName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "contact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "familyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "priorScore");
        v17 = v16;
        v18 = objc_msgSend(v9, "rank");
        objc_msgSend(v9, "modelName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "modelVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("contactId"));
        if (v13)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("contactGivenName"));
        if (v15)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("contactFamilyName"));
        if (v17 == 0.0)
        {
          objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E442CF98, CFSTR("score"));
        }
        else
        {
          *(float *)&v21 = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("score"));

        }
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("rank"));

          if (!v19)
            goto LABEL_18;
LABEL_17:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("modelName"));
          goto LABEL_18;
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E442A9A0, CFSTR("rank"));
        if (v19)
          goto LABEL_17;
LABEL_18:
        if (v20)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("modelVersion"));
        objc_msgSend(v36, "addObject:", v10);

        ++v8;
      }
      while (v7 != v8);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v7 = v24;
    }
    while (v24);
  }

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15AF0]), "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("peopleSuggesterSiriNL"), 0, 0, 0, 0, 0);
  v26 = (void *)MEMORY[0x1E0D159F8];
  objc_msgSend(MEMORY[0x1E0D15AF8], "peopleSuggesterOutputForSiriNLStream");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AA8], "rankedSuggestions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v28;
  v42 = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v27, v25, v32, v32, v33, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
