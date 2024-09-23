@implementation THNotesViewAllChapters

- (THNotesViewAllChapters)initWithNavigationUnits:(id)a3 navigationModel:(id)a4
{
  THNotesViewAllChapters *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THNotesViewAllChapters;
  v6 = -[THNotesViewAllChapters init](&v8, "init");
  if (v6)
  {
    v6->mNavigationUnits = (NSArray *)a3;
    v6->mNavigationModel = (THDocumentNavigationModel *)a4;
    v6->mCachedAnnotationsByContentNode = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mImage = (UIImage *)+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("notes-all-chapters"));
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewAllChapters;
  -[THNotesViewAllChapters dealloc](&v3, "dealloc");
}

- (BOOL)hasGlossaryTerms
{
  NSArray *mNavigationUnits;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  mNavigationUnits = self->mNavigationUnits;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mNavigationUnits, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(mNavigationUnits);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = objc_msgSend(v7, "contentNodes", 0);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j), "glossaryTermExists") & 1) != 0)
              {
                LOBYTE(v3) = 1;
                return (char)v3;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            if (v10)
              continue;
            break;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mNavigationUnits, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      LOBYTE(v3) = 0;
    }
    while (v4);
  }
  return (char)v3;
}

- (BOOL)shouldEnableStudyButton
{
  return 1;
}

- (NSArray)navigationUnits
{
  return self->mNavigationUnits;
}

- (unint64_t)annotationCount
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = -[NSMutableDictionary allValues](self->mCachedAnnotationsByContentNode, "allValues", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      v9 = objc_msgSend(v8, "numberOfHighlightAnnotations");
      v5 += (unint64_t)objc_msgSend(v8, "numberOfOrphanedAnnotations") + (_QWORD)v9;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v4);
  return v5;
}

- (unint64_t)annotationCountForStudyCards
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[NSMutableDictionary allValues](self->mCachedAnnotationsByContentNode, "allValues", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "numberOfHighlightAnnotations");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("All Chapters"), &stru_43D7D8, 0);
}

- (NSString)subtitle
{
  return 0;
}

- (UIImage)image
{
  return self->mImage;
}

- (BOOL)needsMigration
{
  return self->mNeedsMigration;
}

- (BOOL)wantsVisibility
{
  return 1;
}

- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  NSArray *obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  self->mNeedsMigration = 0;
  if (!a3)
    a3 = +[NSArray array](NSArray, "array", 0, a4, a5, a6);
  v9 = objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4, a4, a5, a6);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->mNavigationUnits;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v22 = v10;
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = objc_msgSend(v11, "contentNodes");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
              v18 = objc_msgSend(a5, "cachedAnnotationsForAnnotations:filteredWithContentNode:", v9, v17);
              if (objc_msgSend(v18, "needsMigration"))
                self->mNeedsMigration = 1;
              -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotationsByContentNode, "setObject:forKey:", v18, objc_msgSend(v17, "nodeGUID"));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v14);
        }
        v10 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
}

- (id)p_annotationCacheForContentNode:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mCachedAnnotationsByContentNode, "objectForKey:", objc_msgSend(a3, "nodeGUID"));
}

- (NSArray)sectionArray
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *i;
  void *v10;
  THNotesViewSection *v11;
  NSString *v12;
  THNotesViewSection *v13;
  NSArray *obj;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  NSArray *v22;
  id v23;
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

  v22 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->mNavigationUnits;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v3);
        v5 = -[THDocumentNavigationModel sectionIdentifierForNavigationUnit:](self->mNavigationModel, "sectionIdentifierForNavigationUnit:", v4);
        v18 = v3;
        if (v5)
          v19 = -[NSString stringByTransformingForTHNotesSectionHeader](+[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapter %@"), &stru_43D7D8, 0), v5), "stringByTransformingForTHNotesSectionHeader");
        else
          v19 = 0;
        v6 = objc_alloc_init((Class)NSMutableArray);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v20 = objc_msgSend(v4, "contentNodes");
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v23)
        {
          v7 = 0;
          v21 = *(_QWORD *)v25;
          v8 = 1;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v20);
              v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
              v11 = objc_alloc_init(THNotesViewSection);
              -[NSArray addObject:](v22, "addObject:", v11);
              if ((char *)i + v7)
                v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Section %lu - %@"), &stru_43D7D8, 0), (char *)i + v7, objc_msgSend(v10, "title"));
              else
                v12 = (NSString *)objc_msgSend(v10, "title");
              -[THNotesViewSection setTitle:](v11, "setTitle:", -[NSString stringByTransformingForTHNotesSectionHeader](v12, "stringByTransformingForTHNotesSectionHeader"));
              -[THNotesViewSection setNotes:](v11, "setNotes:", objc_msgSend(-[THNotesViewAllChapters p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v10), "highlightAnnotationsSortedByRange"));
              if (((-[NSArray count](-[THNotesViewSection notes](v11, "notes"), "count") != 0) & v8) == 1)
              {
                -[THNotesViewSection setChapterTitle:](v11, "setChapterTitle:", v19);
                v8 = 0;
              }

              objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(-[THNotesViewAllChapters p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v10), "orphanedAnnotations"));
            }
            v7 += (uint64_t)i;
            v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v23);
        }
        else
        {
          v8 = 1;
        }
        if (objc_msgSend(v6, "count"))
        {
          v13 = objc_alloc_init(THNotesViewSection);
          -[NSArray addObject:](v22, "addObject:", v13);
          -[THNotesViewSection setTitle:](v13, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Old Notes"), &stru_43D7D8, 0), "stringByTransformingForTHNotesSectionHeader"));
          if ((v8 & 1) != 0)
            -[THNotesViewSection setChapterTitle:](v13, "setChapterTitle:", v19);
          -[THNotesViewSection setNotes:](v13, "setNotes:", v6);

        }
        ++v3;
      }
      while ((id)(v18 + 1) != v17);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v17);
  }
  return v22;
}

- (BOOL)isAllNotes
{
  return 1;
}

- (BOOL)isOrphanedNotes
{
  return 0;
}

@end
