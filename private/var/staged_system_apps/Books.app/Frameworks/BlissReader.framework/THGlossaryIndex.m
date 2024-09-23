@implementation THGlossaryIndex

- (void)p_releaseData
{

  self->mSortedEntries = 0;
  self->mEntryToIndexMap = 0;

  self->mSections = 0;
  self->mSectionTitleToSectionMap = 0;

  self->mSectionIndexTitles = 0;
}

- (id)p_sectionForSectionTitle:(id)a3
{
  NSMutableArray *mSections;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mSections = self->mSections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mSections);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (!objc_msgSend(objc_msgSend(v9, "sectionTitle"), "localizedCaseInsensitiveCompare:", a3))
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)p_buildAlphabeticalIndexForGlossaryEntries:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSString *v11;
  id v12;
  THGlossaryIndexSection *v13;
  NSMutableArray *mSections;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *j;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSArray *mSectionIndexTitles;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSMutableArray *obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
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
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  v5 = objc_msgSend(a3, "count");
  self->mSections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mSectionTitleToSectionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v11 = sub_AFDBC(v10);
        v12 = -[NSMutableDictionary objectForKey:](self->mSectionTitleToSectionMap, "objectForKey:", v11);
        if (v12)
        {
          objc_msgSend(v12, "addEntry:", v10);
        }
        else
        {
          v13 = -[THGlossaryIndexSection initWithSectionTitle:andEntry:]([THGlossaryIndexSection alloc], "initWithSectionTitle:andEntry:", v11, v10);
          -[NSMutableDictionary setObject:forKey:](self->mSectionTitleToSectionMap, "setObject:forKey:", v13, v11);
          -[NSMutableArray addObject:](self->mSections, "addObject:", v13);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v7);
  }
  -[NSMutableArray sortUsingSelector:](self->mSections, "sortUsingSelector:", "compare:");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  mSections = self->mSections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSections, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(mSections);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j), "setSectionIndex:", (char *)j + v17);
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSections, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      v17 += (uint64_t)j;
    }
    while (v16);
  }
  self->mEntryToIndexMap = (TSUPointerKeyDictionary *)objc_msgSend(objc_alloc((Class)TSUPointerKeyDictionary), "initWithCapacity:", v5);
  self->mSortedEntries = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v5);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->mSections;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v36 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k);
        if ((uint64_t)objc_msgSend(v24, "entryCount") >= 1)
        {
          v25 = 0;
          do
          {
            v26 = objc_msgSend(v24, "entryAtIndex:", v25);
            -[NSMutableArray addObject:](self->mSortedEntries, "addObject:", v26);
            -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mEntryToIndexMap, "setObject:forUncopiedKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22 + v25++), v26);
          }
          while ((uint64_t)objc_msgSend(v24, "entryCount") > v25);
          v22 += v25;
        }
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v21);
  }
  self->mSectionIndexTitles = (NSArray *)-[NSArray copy](-[UILocalizedIndexedCollation sectionTitles](+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"), "sectionTitles"), "copy");
  if (-[NSMutableArray count](self->mSections, "count"))
  {
    v27 = -[NSMutableArray objectAtIndex:](self->mSections, "objectAtIndex:", 0);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    mSectionIndexTitles = self->mSectionIndexTitles;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](mSectionIndexTitles, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v38;
      do
      {
        v32 = 0;
        v33 = v27;
        do
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(mSectionIndexTitles);
          v34 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v32);
          v27 = -[NSMutableDictionary objectForKey:](self->mSectionTitleToSectionMap, "objectForKey:", v34);
          if (!v27)
          {
            -[NSMutableDictionary setObject:forKey:](self->mSectionTitleToSectionMap, "setObject:forKey:", v33, v34);
            v27 = v33;
          }
          v32 = (char *)v32 + 1;
          v33 = v27;
        }
        while (v30 != v32);
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](mSectionIndexTitles, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v30);
    }
  }
}

+ (id)alphabeticalIndexForEntries:(id)a3
{
  THGlossaryIndex *v4;

  v4 = objc_alloc_init(THGlossaryIndex);
  -[THGlossaryIndex p_buildAlphabeticalIndexForGlossaryEntries:](v4, "p_buildAlphabeticalIndexForGlossaryEntries:", a3);
  return v4;
}

+ (id)alphabeticalIndexForGlossary:(id)a3 withPrefix:(id)a4
{
  THGlossaryIndex *v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *i;
  id v12;
  char *j;
  id v14;

  v6 = objc_alloc_init(THGlossaryIndex);
  v7 = (char *)objc_msgSend(a3, "entryCount");
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7);
  if (objc_msgSend(a4, "length"))
  {
    v9 = objc_msgSend(a4, "normalizedStringForSearch");
    if ((uint64_t)v7 >= 1)
    {
      v10 = v9;
      for (i = 0; i != v7; ++i)
      {
        v12 = objc_msgSend(a3, "entryAtIndex:", i);
        if (objc_msgSend(v12, "containsPrefix:", v10))
          objc_msgSend(v8, "addObject:", v12);
      }
    }
  }
  else if ((uint64_t)v7 >= 1)
  {
    for (j = 0; j != v7; ++j)
    {
      v14 = objc_msgSend(a3, "entryAtIndex:", j);
      if (objc_msgSend(objc_msgSend(v14, "term"), "length"))
      {
        objc_msgSend(v8, "addObject:", v14);
      }
      else if (!objc_msgSend(objc_msgSend(v14, "term"), "length"))
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THGlossaryIndex alphabeticalIndexForGlossary:withPrefix:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryIndex.m"), 264, CFSTR("Zero length glossary term"));
      }
    }
  }
  -[THGlossaryIndex p_buildAlphabeticalIndexForGlossaryEntries:](v6, "p_buildAlphabeticalIndexForGlossaryEntries:", v8);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryIndex p_releaseData](self, "p_releaseData");
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryIndex;
  -[THGlossaryIndex dealloc](&v3, "dealloc");
}

- (int64_t)numberOfEntries
{
  return (int64_t)-[NSMutableArray count](self->mSortedEntries, "count");
}

- (int64_t)numberOfSections
{
  return (int64_t)-[NSMutableArray count](self->mSections, "count");
}

- (id)p_sectionAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mSections, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mSections, "objectAtIndex:", a3);
}

- (id)entryForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3
    && (v4 = -[THGlossaryIndex p_sectionAtIndex:](self, "p_sectionAtIndex:", objc_msgSend(a3, "section"))) != 0
    && (v5 = v4, v6 = objc_msgSend(a3, "row"), (uint64_t)v6 < (uint64_t)objc_msgSend(v5, "entryCount"))
    && ((unint64_t)objc_msgSend(a3, "row") & 0x8000000000000000) == 0)
  {
    return objc_msgSend(v5, "entryAtIndex:", objc_msgSend(a3, "row"));
  }
  else
  {
    return 0;
  }
}

- (id)indexPathForEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = -[NSMutableDictionary objectForKey:](self->mSectionTitleToSectionMap, "objectForKey:", sub_AFDBC(a3));
  if (v4 && (v5 = v4, v6 = objc_msgSend(v4, "indexForEntry:", a3), v6 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = v6;
    v8 = objc_msgSend(v5, "sectionIndex");
    v7 = v9;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryIndex indexPathForEntry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryIndex.m"), 329, CFSTR("Entry %@ out of bounds."), objc_msgSend(a3, "term"));
    v7 = 0;
    v8 = 0;
  }
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, v8);
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return (int64_t)objc_msgSend(-[THGlossaryIndex p_sectionAtIndex:](self, "p_sectionAtIndex:", a3), "entryCount");
}

- (int64_t)sectionForSectionIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return (int64_t)objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSectionTitleToSectionMap, "objectForKey:", a3, a4), "sectionIndex");
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return objc_msgSend(-[THGlossaryIndex p_sectionAtIndex:](self, "p_sectionAtIndex:", a3), "sectionTitle");
}

- (id)entryAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mSortedEntries, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mSortedEntries, "objectAtIndex:", a3);
}

- (int64_t)indexForEntry:(id)a3
{
  id v3;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[TSUPointerKeyDictionary objectForKey:](self->mEntryToIndexMap, "objectForKey:");
  if (v3)
    return (int)objc_msgSend(v3, "intValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isLastInSection:(id)a3
{
  char *v5;

  v5 = (char *)objc_msgSend(a3, "row");
  return v5 == (char *)objc_msgSend(-[THGlossaryIndex p_sectionAtIndex:](self, "p_sectionAtIndex:", objc_msgSend(a3, "section")), "entryCount")- 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_opt_class(THGlossaryIndex, a2);
  v6 = TSUDynamicCast(v5, a3);
  if (v6)
    LOBYTE(v6) = -[NSMutableArray isEqual:](self->mSortedEntries, "isEqual:", *(_QWORD *)(v6 + 8));
  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->mSortedEntries, "hash");
}

- (NSArray)sectionIndexTitles
{
  return self->mSectionIndexTitles;
}

@end
