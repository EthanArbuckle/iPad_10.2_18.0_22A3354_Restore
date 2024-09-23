@implementation PSIGroupResult

- (PSIGroupResult)initWithQueue:(id)a3
{
  id v4;
  PSIGroupResult *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIGroupResult;
  v5 = -[PSIGroupResult init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (dispatch_queue_t)v4;
    else
      v6 = dispatch_queue_create("PSIObject-description-get-rid-of-me", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (void)dealloc
{
  __CFArray *assetIds;
  __CFArray *collectionIds;
  objc_super v5;

  assetIds = self->_assetIds;
  if (assetIds)
    CFRelease(assetIds);
  collectionIds = self->_collectionIds;
  if (collectionIds)
    CFRelease(collectionIds);
  v5.receiver = self;
  v5.super_class = (Class)PSIGroupResult;
  -[PSIGroupResult dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[12] = CFArrayCreateCopy(0, self->_assetIds);
  v4[13] = CFArrayCreateCopy(0, self->_collectionIds);
  v5 = -[NSArray copy](self->_groups, "copy");
  v6 = (void *)v4[11];
  v4[11] = v5;

  v7 = -[NSString copy](self->_owningContentString, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSMutableArray copy](self->_assetUUIDs, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSMutableArray copy](self->_collectionResults, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  *((_DWORD *)v4 + 17) = LODWORD(self->_score);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSIGroupResult;
  -[PSIGroupResult description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PSIGroupResult normalizedUnitTestDescription](self, "normalizedUnitTestDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v5);

  return v4;
}

- (id)unitTestDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  PSIGroupResult *v45;
  id obj;
  uint64_t i;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v45 = self;
  v41 = -[NSArray count](self->_groups, "count");
  if (v41 >= 1)
  {
    for (i = 0; i != v41; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v45->_groups, "objectAtIndexedSubscript:", i);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contentString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](v45->_groups, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "normalizedString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](v45->_groups, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "matchRanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_97607);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v4, "lowercaseString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v45->_groups, "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "groupRanges");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v44, "length");
        if (v11 == objc_msgSend(v4, "length") && objc_msgSend(v44, "isEqualToString:", v50))
        {
          v12 = v10;
        }
        else
        {
          if (unitTestDescription_onceToken != -1)
            dispatch_once(&unitTestDescription_onceToken, &__block_literal_global_80_97608);
          v60 = 0;
          v61 = 0;
          v13 = (void *)objc_msgSend((id)unitTestDescription_tokenizer, "newTokensFromString:withOptions:outCopyRanges:error:", v4, 0, &v61, &v60);
          v12 = v61;
          v14 = v60;

          if (v14 || (v15 = objc_msgSend(v12, "count"), v15 != objc_msgSend(v10, "count")))
          {
            v16 = v50;

            v17 = v10;
            v12 = v17;
            v4 = v16;
          }

        }
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x2020000000;
        v59[3] = 0;
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __37__PSIGroupResult_unitTestDescription__block_invoke_3;
        v55[3] = &unk_1E3676C68;
        v58 = v59;
        v42 = v10;
        v56 = v42;
        v43 = v12;
        v57 = v43;
        v18 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v55);
        objc_msgSend(v50, "length");
        v19 = objc_msgSend(v4, "length");
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        obj = v8;
        v20 = 0;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        if (v21)
        {
          v48 = *(_QWORD *)v52;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v52 != v48)
                objc_enumerationMutation(obj);
              v23 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "rangeValue");
              objc_msgSend(v50, "substringWithRange:", v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v18[2](v18, v23);
              if (v26 == 0x7FFFFFFFFFFFFFFFLL
                || (v27 = objc_msgSend(v4, "rangeOfString:options:range:", v25, 385, v26, objc_msgSend(v4, "length") - v26), (v29 = v28) == 0))
              {
                -[PSIGroupResult normalizedUnitTestDescription](v45, "normalizedUnitTestDescription");
                v39 = (id)objc_claimAutoreleasedReturnValue();

                v37 = 0;
                goto LABEL_30;
              }
              v30 = v27;
              objc_msgSend(v4, "substringWithRange:", v27, v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "substringWithRange:", v20, v30 - v20);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "appendString:", v32);

              objc_msgSend(v49, "appendFormat:", CFSTR("(%@)"), v31);
              objc_msgSend(v50, "length");
              v33 = objc_msgSend(v4, "length");

              v20 = v30 + v29;
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
            if (v21)
              continue;
            break;
          }
          v19 = v33 - v20;
        }

        if (v19)
        {
          objc_msgSend(v4, "substringFromIndex:", v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "appendString:", v34);

        }
        -[NSArray objectAtIndexedSubscript:](v45->_groups, "objectAtIndexedSubscript:", i);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "category");

        objc_msgSend(v40, "appendFormat:", CFSTR("%d = %@"), v36, v49);
        if (i < v41 - 1)
          objc_msgSend(v40, "appendString:", CFSTR(", "));
        v37 = 1;
LABEL_30:

        _Block_object_dispose(v59, 8);
        if (!v37)
          goto LABEL_33;
      }
      else
      {

      }
    }
  }
  v39 = v40;
LABEL_33:

  return v39;
}

- (id)normalizedUnitTestDescription
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  PSIGroupResult *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = -[NSArray count](self->_groups, "count");
  v22 = v3 - 1;
  v23 = v3;
  if (v3 >= 1)
  {
    v4 = 0;
    v21 = self;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "normalizedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matchRanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "count") - 1;
      if (v11 >= 0)
      {
        do
        {
          objc_msgSend(v10, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeValue");
          v15 = v14;

          objc_msgSend(v7, "substringWithRange:", v13, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "replaceCharactersInRange:withString:", v13, v15, v17);

          --v11;
        }
        while (v11 != -1);
      }
      self = v21;
      -[NSArray objectAtIndexedSubscript:](v21->_groups, "objectAtIndexedSubscript:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "category");

      objc_msgSend(v24, "appendFormat:", CFSTR("%d = %@"), v19, v7);
      if (v4 < v22)
        objc_msgSend(v24, "appendString:", CFSTR(", "));

      ++v4;
    }
    while (v4 != v23);
  }
  return v24;
}

- (NSMutableSet)sceneGroupsIds
{
  NSMutableSet *sceneGroupsIds;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sceneGroupsIds = self->_sceneGroupsIds;
  if (!sceneGroupsIds)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_sceneGroupsIds;
    self->_sceneGroupsIds = v4;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_groups;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v7)
      goto LABEL_14;
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "category", (_QWORD)v17) == 1500)
        {
          v12 = self->_sceneGroupsIds;
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = objc_msgSend(v11, "groupId");
        }
        else
        {
          if (objc_msgSend(v11, "category") != 1501)
            continue;
          v12 = self->_sceneGroupsIds;
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = objc_msgSend(v11, "owningGroupId");
        }
        objc_msgSend(v13, "numberWithUnsignedLongLong:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v12, "addObject:", v15);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v8)
      {
LABEL_14:

        sceneGroupsIds = self->_sceneGroupsIds;
        return sceneGroupsIds;
      }
    }
  }
  return sceneGroupsIds;
}

- (void)setGroups:(id)a3
{
  NSMutableSet *sceneGroupsIds;
  id v6;

  objc_storeStrong((id *)&self->_groups, a3);
  v6 = a3;
  sceneGroupsIds = self->_sceneGroupsIds;
  self->_sceneGroupsIds = 0;

}

- (unint64_t)assetMatchCount
{
  unint64_t result;

  result = (unint64_t)self->_assetIds;
  if (result)
    return CFArrayGetCount((CFArrayRef)result);
  return result;
}

- (unint64_t)collectionMatchCount
{
  unint64_t result;

  result = (unint64_t)self->_collectionIds;
  if (result)
    return CFArrayGetCount((CFArrayRef)result);
  return result;
}

- (BOOL)containsFilterSearchTokens
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PSIGroupResult groupsSearchTokens](self, "groupsSearchTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "isFilterTypeToken"))
              {

                v13 = 1;
                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v13 = 0;
    }
    while (v4);
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (unint64_t)matchCount
{
  unint64_t v3;

  v3 = -[PSIGroupResult assetMatchCount](self, "assetMatchCount");
  return -[PSIGroupResult collectionMatchCount](self, "collectionMatchCount") + v3;
}

- (NSArray)groupsSearchTokens
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_groups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "tokens", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)contentStrings
{
  void *v3;
  uint64_t v4;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PSIGroupResult contentStringsOverride](self, "contentStringsOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PSIGroupResult contentStringsOverride](self, "contentStringsOverride");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_groups;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "contentString", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    return (NSArray *)v6;
  }
}

- (NSArray)lookupIdentifiers
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_groups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lookupIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)groupsMatchRanges
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_groups, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_groups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "matchRanges", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)groupCount
{
  return -[NSArray count](self->_groups, "count");
}

- (id)tokensAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)matchRangesAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)groupRangesAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentStringAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)normalizedStringAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)categoryAtIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "category");

  return v4;
}

- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;

  return v7;
}

- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;

  return v7;
}

- (id)lookupIdentifiersForSearchIndexCategories:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_groups;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", (int)objc_msgSend(v11, "category", (_QWORD)v15)))
        {
          objc_msgSend(v11, "lookupIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)fullSearchTextGroupSnapshot
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v22;
  NSArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = self->_groups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_34;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v29;
  v22 = *(_QWORD *)v29;
  v23 = v2;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v6)
      objc_enumerationMutation(v2);
    v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
    objc_msgSend(v8, "datedTokens", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
      break;
LABEL_10:
    if (objc_msgSend(v8, "category") == 1203 || objc_msgSend(v8, "category") == 1204)
    {
      objc_msgSend(v8, "contentString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12 < 3)
        goto LABEL_27;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v8, "tokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (!v14)
      goto LABEL_26;
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v19, "isFullTextToken"))
        {
          v20 = v8;
LABEL_31:
          v2 = v23;

          goto LABEL_32;
        }
        if (objc_msgSend(v19, "belongsToSearchText"))
        {
          if ((v16 & 1) == 0)
          {
            if (v5)
            {
              v20 = 0;
              goto LABEL_31;
            }
            v5 = v8;
          }
          objc_msgSend(v19, "rangeInSearchText");
          v16 = 1;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v15)
        continue;
      break;
    }
LABEL_26:

    v6 = v22;
    v2 = v23;
LABEL_27:
    if (++v7 == v4)
    {
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (!v4)
      {
LABEL_34:

        v5 = v5;
        v20 = v5;
        goto LABEL_35;
      }
      goto LABEL_3;
    }
  }
  if (!objc_msgSend(v8, "isDateFilterFromFullSearchText"))
  {
    if ((objc_msgSend(v8, "isDateFilterFromImplicitToken") & 1) != 0
      || (objc_msgSend(v8, "isDateFilterPartiallyFromFullSearchText") & 1) != 0)
    {
      v20 = 0;
      goto LABEL_32;
    }
    goto LABEL_10;
  }
  v20 = v8;
LABEL_32:

LABEL_35:
  return v20;
}

- (id)firstSearchTextGroupSnapshot
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = self->_groups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v7, "tokens", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "belongsToSearchText") & 1) != 0)
              {
                v13 = v7;

                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v13 = 0;
    }
    while (v4);
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (id)dateFilterGroupSnapshot
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_groups;
  v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "dateFilter", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDateFilterPartiallyFromFullSearchText
{
  void *v2;
  char v3;

  -[PSIGroupResult dateFilterGroupSnapshot](self, "dateFilterGroupSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateFilterPartiallyFromFullSearchText");

  return v3;
}

- (BOOL)hasDateFilterFromImplicitToken
{
  void *v2;
  char v3;

  -[PSIGroupResult dateFilterGroupSnapshot](self, "dateFilterGroupSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateFilterFromImplicitToken");

  return v3;
}

- (BOOL)exclusivelyContainsOCRGroups
{
  unint64_t v3;

  v3 = -[PSIGroupResult _calculateOCRGroupsCount](self, "_calculateOCRGroupsCount");
  if (v3)
    LOBYTE(v3) = v3 == -[NSArray count](self->_groups, "count");
  return v3;
}

- (unint64_t)_calculateOCRGroupsCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_groups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "category", (_QWORD)v10) == 1203
          || objc_msgSend(v8, "category") == 1204)
        {
          ++v5;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)owningContentString
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__97596;
  v8 = __Block_byref_object_dispose__97597;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

- (NSArray)assetUUIDs
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__97596;
  v8 = __Block_byref_object_dispose__97597;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (NSArray)collectionResults
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__97596;
  v8 = __Block_byref_object_dispose__97597;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (id)_prepareForFetchWithAssetCountLimit:(unint64_t)a3 collectionCountLimit:(unint64_t)a4 outAssetRange:(_NSRange *)a5 outCollectionRange:(_NSRange *)a6 outFetchOwningContentString:(BOOL *)a7
{
  id v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__97596;
  v13 = __Block_byref_object_dispose__97597;
  v14 = 0;
  pl_dispatch_sync();
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (void)fetchNextAssetUUIDs:(unint64_t)a3 completionHandler:(id)a4
{
  -[PSIGroupResult fetchNextAssetUUIDs:collectionResults:assetCountLimit:collectionCountLimit:completionHandler:](self, "fetchNextAssetUUIDs:collectionResults:assetCountLimit:collectionCountLimit:completionHandler:", 1, 0, a3, 0, a4);
}

- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 count:(unint64_t)a5 completionHandler:(id)a6
{
  -[PSIGroupResult fetchNextAssetUUIDs:collectionResults:assetCountLimit:collectionCountLimit:completionHandler:](self, "fetchNextAssetUUIDs:collectionResults:assetCountLimit:collectionCountLimit:completionHandler:", a3, a4, a5, a5, a6);
}

- (void)fetchNextAssetUUIDs:(BOOL)a3 collectionResults:(BOOL)a4 assetCountLimit:(unint64_t)a5 collectionCountLimit:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  void (**v12)(_QWORD);
  __int128 *v13;
  __int128 *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  __int128 v21;
  __int128 v22;
  char v23;

  v9 = a4;
  v10 = a3;
  v12 = (void (**)(_QWORD))a7;
  v23 = 0;
  v22 = 0uLL;
  if (v10)
    v13 = &v22;
  else
    v13 = 0;
  if (v9)
    v14 = &v21;
  else
    v14 = 0;
  v21 = 0uLL;
  -[PSIGroupResult _prepareForFetchWithAssetCountLimit:collectionCountLimit:outAssetRange:outCollectionRange:outFetchOwningContentString:](self, "_prepareForFetchWithAssetCountLimit:collectionCountLimit:outAssetRange:outCollectionRange:outFetchOwningContentString:", a5, a6, v13, v14, &v23);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v12 || v15)
  {
    if (v12 && v15)
    {
      dispatch_get_global_queue(0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v16;
      v20 = v12;
      v18 = v17;
      pl_dispatch_async();

    }
  }
  else
  {
    v12[2](v12);
  }

}

- (void)resolveObjectsWithAssetCache:(id)a3 collectionCache:(id)a4
{
  id v6;
  id v7;
  __CFArray *v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *assetUUIDs;
  __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFArray *v19;
  NSMutableArray *v20;
  NSMutableArray *collectionResults;
  __CFArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_assetIds;
  v9 = -[__CFArray count](v8, "count");
  v10 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  assetUUIDs = self->_assetUUIDs;
  self->_assetUUIDs = v10;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v8;
  v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          -[NSMutableArray addObject:](self->_assetUUIDs, "addObject:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }
  v29 = v12;

  v19 = self->_collectionIds;
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  collectionResults = self->_collectionResults;
  self->_collectionResults = v20;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v19;
  v23 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          -[NSMutableArray addObject:](self->_collectionResults, "addObject:", v28);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v24);
  }

}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (void)setTransientToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)contentStringsOverride
{
  return self->_contentStringsOverride;
}

- (void)setContentStringsOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (NSArray)groups
{
  return self->_groups;
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (__CFArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (signed)dedupingSkippedCategory
{
  return self->_dedupingSkippedCategory;
}

- (void)setDedupingSkippedCategory:(signed __int16)a3
{
  self->_dedupingSkippedCategory = a3;
}

- (PSIGroupResultDelegate)delegate
{
  return (PSIGroupResultDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMergedOCRResult
{
  return self->_isMergedOCRResult;
}

- (void)setIsMergedOCRResult:(BOOL)a3
{
  self->_isMergedOCRResult = a3;
}

- (BOOL)selectedForOCRCompletion
{
  return self->_selectedForOCRCompletion;
}

- (void)setSelectedForOCRCompletion:(BOOL)a3
{
  self->_selectedForOCRCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_contentStringsOverride, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_sceneGroupsIds, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_owningContentString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 96);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_2;
  v5[3] = &unk_1E3676D28;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "group:fetchOwningContentString:assetIdRange:collectionIdRange:completionHandler:", v3, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v5);

}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v11 = a3;
  v12 = a4;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v8 = v12;
  v9 = v11;
  v10 = v7;
  pl_dispatch_async();

}

void __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v7;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  if (v12)
  {
    v13 = v12;
    v14 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v13;
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
  v17 = *(id *)(a1 + 72);
  pl_dispatch_async();

}

uint64_t __111__PSIGroupResult_fetchNextAssetUUIDs_collectionResults_assetCountLimit_collectionCountLimit_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __136__PSIGroupResult__prepareForFetchWithAssetCountLimit_collectionCountLimit_outAssetRange_outCollectionRange_outFetchOwningContentString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  _QWORD *v13;
  _QWORD *v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "assetMatchCount");
  v3 = v2 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionMatchCount");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  if (v3 >= v6)
    v8 = *(_QWORD *)(a1 + 48);
  else
    v8 = v3;
  if (v6)
    v3 = v8;
  if (v4 - v5 >= v7)
    v9 = *(_QWORD *)(a1 + 56);
  else
    v9 = v4 - v5;
  if (v7)
    v10 = v9;
  else
    v10 = v4 - v5;
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 48))
  {
    if (!(v10 | v3))
      return;
    v12 = v10 != 0;
    if (!v3)
      goto LABEL_20;
  }
  else
  {
    v12 = 1;
    *(_BYTE *)(v11 + 48) = 1;
    **(_BYTE **)(a1 + 64) = 1;
  }
  v13 = *(_QWORD **)(a1 + 72);
  if (v13)
  {
    *v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    v13[1] = v3;
    if (v12)
      goto LABEL_21;
    goto LABEL_23;
  }
LABEL_20:
  if (v12)
  {
LABEL_21:
    v14 = *(_QWORD **)(a1 + 80);
    if (v14)
    {
      *v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
      v14[1] = v10;
    }
  }
LABEL_23:
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = WeakRetained;

}

void __35__PSIGroupResult_collectionResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__PSIGroupResult_assetUUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__PSIGroupResult_owningContentString__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __47__PSIGroupResult_normalizedUnitTestDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v7 = v5 + v6;
  v8 = objc_msgSend(v4, "rangeValue");
  v10 = v9;

  if (v7 < v8 + v10)
    return -1;
  else
    return v7 != v8 + v10;
}

uint64_t __37__PSIGroupResult_unitTestDescription__block_invoke_3(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  void *i;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  for (i = *(void **)(a1 + 32); v4 < objc_msgSend(i, "count"); i = *(void **)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeValue");
    v9 = v8;

    if (a2 >= v7 && a2 - v7 < v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");

      return v12;
    }
    v4 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

void __37__PSIGroupResult_unitTestDescription__block_invoke_2()
{
  PSITokenizer *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PSITokenizer alloc];
  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PSITokenizer initWithLocale:useCache:](v0, "initWithLocale:useCache:", v3, 0);
  v2 = (void *)unitTestDescription_tokenizer;
  unitTestDescription_tokenizer = v1;

}

uint64_t __37__PSIGroupResult_unitTestDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v7 = v5 + v6;
  v8 = objc_msgSend(v4, "rangeValue");
  v10 = v9;

  if (v7 < v8 + v10)
    return -1;
  else
    return v7 != v8 + v10;
}

@end
