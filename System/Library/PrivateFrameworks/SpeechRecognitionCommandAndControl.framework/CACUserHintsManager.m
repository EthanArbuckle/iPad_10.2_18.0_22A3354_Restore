@implementation CACUserHintsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_22);
  return (id)sUserHintsManager;
}

void __36__CACUserHintsManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)CACUserHintsManager), "init");
  v1 = (void *)sUserHintsManager;
  sUserHintsManager = v0;

}

- (CACUserHintsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CACUserHintsManager;
  return -[CACUserHintsManager init](&v3, sel_init);
}

- (BOOL)shouldDisplayUserHintAfterRegisteringIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (v4
    && -[CACUserHintsManager _countAfterRegisteringUserHintIdentifier:](self, "_countAfterRegisteringUserHintIdentifier:", v4) <= 0xA)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commandCounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)objc_msgSend(v7, "unsignedLongLongValue") < 0xB;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)suggestedCommandIdentifiersFromActiveCommandIdentifiers:(id)a3 maximumCount:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint32_t v27;
  double v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v62;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builtInCommandsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("HistoricalCommandFrequencies"));
  v7 = objc_claimAutoreleasedReturnValue();

  v65 = (void *)v7;
  if (v7)
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v7);
  else
    v8 = objc_opt_new();
  v9 = (void *)v8;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userHintsHistory");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandCounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = v4;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v9, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
  v66 = v12;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v83;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v83 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v19);
        if (objc_msgSend(v13, "containsObject:", v20)
          && (objc_msgSend(v12, "objectForKey:", v20),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "unsignedLongLongValue"),
              v21,
              v22 < 0xB))
        {
          objc_msgSend(v67, "objectForKey:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedLongLongValue");
          objc_msgSend(v12, "objectForKey:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedLongLongValue") + v24;

          v12 = v66;
          if (v26)
          {
            v27 = arc4random() % 0x64 + 1;
            v28 = (double)v27 / 10.0 + (float)v26;
            if (v26 >= 0x65)
              v28 = (double)v27;
            v29 = v28;
            objc_msgSend(v9, "objectForKey:", v20);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "floatValue");
            v32 = v31 / v29;

            *(float *)&v33 = v32;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v34, v20);

          }
        }
        else
        {
          objc_msgSend(v9, "removeObjectForKey:", v20);
        }
        ++v19;
      }
      while (v17 != v19);
      v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      v17 = v35;
    }
    while (v35);
  }

  LODWORD(v36) = 841731191;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v38 = v62;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v79 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
          objc_msgSend(v9, "setObject:forKey:", v37, v43);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v40);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "builtInCommandsTable");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", CFSTR("ExcludedSuggestedCommands"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v75 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j));
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    }
    while (v49);
  }

  v52 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v9, "allKeys");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v52, "initWithArray:", v53);

  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __92__CACUserHintsManager_suggestedCommandIdentifiersFromActiveCommandIdentifiers_maximumCount___block_invoke;
  v72[3] = &unk_24F2AB2A0;
  v55 = v9;
  v73 = v55;
  objc_msgSend(v54, "sortUsingComparator:", v72);
  if (objc_msgSend(v54, "count") > (unint64_t)a4)
    objc_msgSend(v54, "removeObjectsInRange:", a4, objc_msgSend(v54, "count") - a4);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v56 = v54;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(v56);
        -[CACUserHintsManager _countAfterRegisteringUserHintIdentifier:](self, "_countAfterRegisteringUserHintIdentifier:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v58);
  }

  return v56;
}

uint64_t __92__CACUserHintsManager_suggestedCommandIdentifiersFromActiveCommandIdentifiers_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v9 <= v12)
    v13 = 0;
  else
    v13 = -1;
  if (v9 < v12)
    return 1;
  else
    return v13;
}

- (unint64_t)_countAfterRegisteringUserHintIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userHintsHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    if (v7 > self->_lastPruneTime + 3481.0)
    {
      v8 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v6, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v14, "hasPrefix:", CFSTR("System.PressItem_")))
              objc_msgSend(v8, "addObject:", v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v11);
      }

      if ((unint64_t)objc_msgSend(v8, "count") >= 0x29)
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __64__CACUserHintsManager__countAfterRegisteringUserHintIdentifier___block_invoke;
        v23[3] = &unk_24F2AB2A0;
        v15 = v6;
        v24 = v15;
        objc_msgSend(v8, "sortUsingComparator:", v23);
        objc_msgSend(v8, "subarrayWithRange:", 0, 20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectsForKeys:", v16);

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      self->_lastPruneTime = v17;

    }
    objc_msgSend(v6, "objectForKey:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedLongLongValue") + 1;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v20, v4);

    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserHintsHistory:", v6);

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

uint64_t __64__CACUserHintsManager__countAfterRegisteringUserHintIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  if (v8 < v10)
    return -1;
  else
    return v8 > v10;
}

- (void)clearHistory
{
  void *v2;
  id v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserHintsHistory:", v2);

}

@end
