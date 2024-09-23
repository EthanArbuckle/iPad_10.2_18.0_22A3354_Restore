@implementation THNotesViewChapter

- (THNotesViewChapter)initWithNavigationUnit:(id)a3 navigationModel:(id)a4 tocModel:(id)a5 chapterIndex:(unint64_t)a6
{
  THNotesViewChapter *v10;
  THNotesViewChapter *v11;
  id v12;
  id v13;
  UIImage *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THNotesViewChapter;
  v10 = -[THNotesViewChapter init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    v10->mNavigationUnit = (THNavigationUnit *)a3;
    v10->mTitle = (NSString *)objc_msgSend(a4, "parentTitleForNavigationUnit:", a3);
    v12 = objc_msgSend(a4, "sectionIdentifierForNavigationUnit:", a3);
    if (v12)
      v11->mSubtitle = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapter %@"), &stru_43D7D8, 0), v12);
    v11->mCachedAnnotationsByContentNode = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v13 = objc_msgSend(objc_msgSend(a5, "toc:tileModelForChapterIndex:", 0, a6), "notesThumb");
    if (v13)
      v14 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider temporaryCGImageForImageData:](TSDBitmapImageProvider, "temporaryCGImageForImageData:", v13));
    else
      v14 = +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("notes-no-image"));
    v11->mImage = v14;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewChapter;
  -[THNotesViewChapter dealloc](&v3, "dealloc");
}

- (BOOL)hasGlossaryTerms
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = -[THNavigationUnit contentNodes](self->mNavigationUnit, "contentNodes");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "glossaryTermExists") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (BOOL)shouldEnableStudyButton
{
  return 1;
}

- (NSArray)navigationUnits
{
  NSArray *v3;

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  -[NSArray addObject:](v3, "addObject:", self->mNavigationUnit);
  return v3;
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
  return self->mTitle;
}

- (NSString)subtitle
{
  return self->mSubtitle;
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
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  self->mNeedsMigration = 0;
  if (!a3)
    a3 = +[NSArray array](NSArray, "array", 0, a4, a5, a6);
  v9 = objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4, a4, a5, a6);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = -[THNavigationUnit contentNodes](self->mNavigationUnit, "contentNodes", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend(a5, "cachedAnnotationsForAnnotations:filteredWithContentNode:", v9, v15);
        if (objc_msgSend(v16, "needsMigration"))
          self->mNeedsMigration = 1;
        -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotationsByContentNode, "setObject:forKey:", v16, objc_msgSend(v15, "nodeGUID"));
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
}

- (id)p_annotationCacheForContentNode:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mCachedAnnotationsByContentNode, "objectForKey:", objc_msgSend(a3, "nodeGUID"));
}

- (NSArray)sectionArray
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  THNotesViewSection *v10;
  NSString *v11;
  THNotesViewSection *v12;
  uint64_t v14;
  NSArray *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v15 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v3 = -[THNavigationUnit contentNodes](self->mNavigationUnit, "contentNodes");
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_alloc_init(THNotesViewSection);
        -[NSArray addObject:](v15, "addObject:", v10);
        if ((char *)i + v7)
          v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Section %lu - %@"), &stru_43D7D8, 0), (char *)i + v7, objc_msgSend(v9, "title"));
        else
          v11 = (NSString *)objc_msgSend(v9, "title");
        -[THNotesViewSection setTitle:](v10, "setTitle:", -[NSString stringByTransformingForTHNotesSectionHeader](v11, "stringByTransformingForTHNotesSectionHeader"));
        -[THNotesViewSection setNotes:](v10, "setNotes:", objc_msgSend(-[THNotesViewChapter p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v9), "highlightAnnotationsSortedByRange"));

        objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(-[THNotesViewChapter p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v9), "orphanedAnnotations"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v7 += (uint64_t)i;
    }
    while (v6);
  }
  if (objc_msgSend(v4, "count"))
  {
    v12 = objc_alloc_init(THNotesViewSection);
    -[NSArray addObject:](v15, "addObject:", v12);
    -[THNotesViewSection setTitle:](v12, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Old Notes"), &stru_43D7D8, 0), "stringByTransformingForTHNotesSectionHeader"));
    -[THNotesViewSection setNotes:](v12, "setNotes:", v4);

  }
  return v15;
}

- (BOOL)isAllNotes
{
  return 0;
}

- (BOOL)isOrphanedNotes
{
  return 0;
}

@end
