@implementation CIMCandidateData

- (CIMCandidateData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIMCandidateData;
  return -[CIMCandidateData init](&v3, sel_init);
}

- (CIMCandidateData)initWithInputMode:(id)a3
{
  id v5;
  CIMCandidateData *v6;
  CIMCandidateData *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CIMCandidateData;
  v6 = -[CIMCandidateData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputMode, a3);
    -[CIMCandidateData setSortingMethod:](v7, "setSortingMethod:", 1);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIMCandidateData setCandidateInfoCache:](v7, "setCandidateInfoCache:", v8);

  }
  return v7;
}

- (void)clearCache
{
  id v2;

  -[CIMCandidateData candidateInfoCache](self, "candidateInfoCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)addCharacter:(id)a3 groupLabel:(id)a4 dictionary:(id)a5 isSecondary:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v9);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, v13);
    }
    objc_msgSend(v14, "addObject:", v15);

  }
}

- (id)wordPropertyDictionaryForCandidates:(id)a3 isSimplified:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "label", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MecabraWordPropertiesCreate();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)sortCharactersByStrokeCount:(id)a3 wordPropertiesDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v25;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8), v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v18[0] = v7;
              v18[1] = 3221225472;
              v18[2] = __73__CIMCandidateData_sortCharactersByStrokeCount_wordPropertiesDictionary___block_invoke;
              v18[3] = &unk_25197FE80;
              v19 = v6;
              objc_msgSend(v14, "sortUsingComparator:", v18);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v16);
  }

}

- (id)candidateGroupsFromDictionary:(id)a3 sortedKeys:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v24, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = objc_msgSend(&unk_2519876C8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(&unk_2519876C8);
              objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "count"))
                objc_msgSend(v11, "addObjectsFromArray:", v16);

            }
            v13 = objc_msgSend(&unk_2519876C8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v13);
        }
        if (objc_msgSend(v11, "count"))
        {
          v17 = objc_alloc(MEMORY[0x24BEB4E10]);
          objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithTitle:candidates:", v9, v18);

          objc_msgSend(v22, "addObject:", v19);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  return v22;
}

- (id)candidatesSortedByFrequency:(id)a3 omittingEmoji:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "_sortedArrayByFrequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = 0;
  else
    v7 = 4;
  objc_msgSend(v5, "_arrayByFilteringEmojiCandidates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BEB4E10]);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTitle:candidates:", 0, v10);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)candidatesSortedByEmoji:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_194);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BEB4E10]);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTitle:candidates:", 0, v7);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)candidatesSortedByRadical:(id)a3 simplified:(BOOL)a4 collationLocale:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[CIMCandidateData wordPropertyDictionaryForCandidates:isSimplified:](self, "wordPropertyDictionaryForCandidates:isSimplified:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);

        MecabraWordPropertiesGetProperty();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CIMCandidateData addCharacter:groupLabel:dictionary:isSecondary:](self, "addCharacter:groupLabel:dictionary:isSecondary:", v14, v16, v9, objc_msgSend((id)MecabraWordPropertiesGetProperty(), "BOOLValue") ^ 1);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  -[CIMCandidateData sortCharactersByStrokeCount:wordPropertiesDictionary:](self, "sortCharactersByStrokeCount:wordPropertiesDictionary:", v9, v8);
  -[CIMCandidateData candidateGroupsFromDictionary:sortedKeys:](self, "candidateGroupsFromDictionary:sortedKeys:", v9, MecabraWordPropertiesGetSortedRadicalList());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)candidatesSortedByStrokes:(id)a3 simplified:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  CIMCandidateData *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = self;
  -[CIMCandidateData wordPropertyDictionaryForCandidates:isSimplified:](self, "wordPropertyDictionaryForCandidates:isSimplified:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);

        MecabraWordPropertiesGetProperty();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "integerValue") >= 1)
        {
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CIMCandidateData addCharacter:groupLabel:dictionary:isSecondary:](v22, "addCharacter:groupLabel:dictionary:isSecondary:", v14, v17, v21, 0);
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_49);
  objc_msgSend(v8, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIMCandidateData candidateGroupsFromDictionary:sortedKeys:](v22, "candidateGroupsFromDictionary:sortedKeys:", v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)candidatesSortedByPinyinOrZhuyin:(id)a3 simplified:(BOOL)a4 zhuyin:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  char **v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v35;
  id obj;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v35 = a5;
  v5 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[CIMCandidateData wordPropertyDictionaryForCandidates:isSimplified:](self, "wordPropertyDictionaryForCandidates:isSimplified:", v7, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v7;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v56 != v37)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v11, "label");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:");

        MecabraWordPropertiesGetProperty();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v52 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              if (objc_msgSend(v17, "length"))
              {
                -[CIMCandidateData addCharacter:groupLabel:dictionary:isSecondary:](self, "addCharacter:groupLabel:dictionary:isSecondary:", v11, v17, v8, 0);
                objc_msgSend(v9, "addObject:", v17);
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          }
          while (v14);
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v39);
  }

  -[CIMCandidateData inputMode](self, "inputMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SetLocaleFromInputMode(v18);

  if (v35)
    v19 = &__block_literal_global_50;
  else
    v19 = &__block_literal_global_51;
  v20 = (void *)MEMORY[0x2495977F4](v19);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = v8;
  v42 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(v21);
        objc_msgSend(v21, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v44;
          do
          {
            for (m = 0; m != v25; ++m)
            {
              if (*(_QWORD *)v44 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(v23, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "sortUsingComparator:", v20);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
          }
          while (v25);
        }

      }
      v42 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v42);
  }

  v29 = &selRef_traditionalChineseZhuyinCompare_;
  if (!v35)
    v29 = &selRef_chinesePinyinCompare_;
  v30 = *v29;
  objc_msgSend(v9, "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sortedArrayUsingSelector:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[CIMCandidateData candidateGroupsFromDictionary:sortedKeys:](self, "candidateGroupsFromDictionary:sortedKeys:", v21, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)candidatesSortedByWubi:(id)a3 omittingEmoji:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
    v5 = 0;
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a3, "_arrayByFilteringEmojiCandidates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BEB4E10]);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:candidates:", 0, v8);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)candidatesSortedByMethod:(int)a3 omittingEmoji:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CIMCandidateData *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a4;
  -[CIMCandidateData inputMode](self, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SetLocaleFromInputMode(v7);

  GetCurrentLocale();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("zh-Hans")) & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("zh-Hant")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("yue-Hant")) & 1) != 0)
    {
      v10 = 0;
      v11 = CFSTR("zh@collation=unihan");
      goto LABEL_7;
    }
    NSLog(CFSTR("Unknown locale identifier '%@'"), v9);
  }
  v10 = 1;
  v11 = CFSTR("zh@collation=stroke");
LABEL_7:
  v12 = (void *)MEMORY[0x249597680]();
  switch(a3)
  {
    case 2:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIMCandidateData candidatesSortedByRadical:simplified:collationLocale:](self, "candidatesSortedByRadical:simplified:collationLocale:", v13, v10, v11);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIMCandidateData candidatesSortedByStrokes:simplified:](self, "candidatesSortedByStrokes:simplified:", v13, v10);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      v16 = v13;
      v17 = v10;
      v18 = 0;
      goto LABEL_13;
    case 5:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      v16 = v13;
      v17 = 0;
      v18 = 1;
LABEL_13:
      -[CIMCandidateData candidatesSortedByPinyinOrZhuyin:simplified:zhuyin:](v15, "candidatesSortedByPinyinOrZhuyin:simplified:zhuyin:", v16, v17, v18);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIMCandidateData candidatesSortedByEmoji:](self, "candidatesSortedByEmoji:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      v19 = (void *)MEMORY[0x24BEB4D28];
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "candidatesSortedByFacemarkCategoryFromCandidates:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIMCandidateData candidatesSortedByWubi:omittingEmoji:](self, "candidatesSortedByWubi:omittingEmoji:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[CIMCandidateData storedCandidates](self, "storedCandidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIMCandidateData candidatesSortedByFrequency:omittingEmoji:](self, "candidatesSortedByFrequency:omittingEmoji:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v20 = (void *)v14;

  objc_autoreleasePoolPop(v12);
  return v20;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (int)sortingMethod
{
  return self->_sortingMethod;
}

- (void)setSortingMethod:(int)a3
{
  self->_sortingMethod = a3;
}

- (NSArray)storedCandidates
{
  return self->_storedCandidates;
}

- (void)setStoredCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_storedCandidates, a3);
}

- (NSMutableDictionary)candidateInfoCache
{
  return self->_candidateInfoCache;
}

- (void)setCandidateInfoCache:(id)a3
{
  objc_storeStrong((id *)&self->_candidateInfoCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInfoCache, 0);
  objc_storeStrong((id *)&self->_storedCandidates, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

uint64_t __71__CIMCandidateData_candidatesSortedByPinyinOrZhuyin_simplified_zhuyin___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "chinesePinyinCompare:", v6);
  return v7;
}

uint64_t __71__CIMCandidateData_candidatesSortedByPinyinOrZhuyin_simplified_zhuyin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "traditionalChineseZhuyinCompare:", v6);
  return v7;
}

uint64_t __57__CIMCandidateData_candidatesSortedByStrokes_simplified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v4, "integerValue");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

uint64_t __44__CIMCandidateData_candidatesSortedByEmoji___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEmojiCandidate") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isStickerCandidate");

  return v3;
}

uint64_t __73__CIMCandidateData_sortCharactersByStrokeCount_wordPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_msgSend((id)MecabraWordPropertiesGetProperty(), "integerValue");
  v11 = objc_msgSend((id)MecabraWordPropertiesGetProperty(), "integerValue");
  if (v10 < v11)
    return -1;
  else
    return v10 > v11;
}

+ (id)sortTitleFromSortingMethod:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return off_25197FF80[a3 - 1];
}

+ (BOOL)shouldShowZhuyinSortingMethod
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TW"));

  if ((v4 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabledInputModeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        TIInputModeGetBaseLanguage();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("zh"), v17))
        {
          TIInputModeGetVariant();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Zhuyin"));

          if ((v15 & 1) != 0)
          {

            v5 = 1;
            goto LABEL_14;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_14:

  return v5;
}

@end
