@implementation THDocumentNavigationModel

- (THDocumentNavigationModel)initWithDocumentRoot:(id)a3 navigationUnitsNodes:(id)a4
{
  THDocumentNavigationModel *v6;
  THDocumentNavigationModel *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  id v11;
  _UNKNOWN **v12;
  void **p_vtable;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *v18;
  id v19;
  void **v20;
  _UNKNOWN **v21;
  id v22;
  id v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  THDocumentNavigationModel *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];

  v35.receiver = self;
  v35.super_class = (Class)THDocumentNavigationModel;
  v6 = -[THDocumentNavigationModel init](&v35, "init");
  v7 = v6;
  if (v6)
  {
    -[THDocumentNavigationModel setDocumentRoot:](v6, "setDocumentRoot:", a3);
    if (a4)
    {
      v28 = v7;
      v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a4, "count"));
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v9)
      {
        v11 = v9;
        v12 = &AEAnnotationPopoverShouldHideNotification_ptr;
        p_vtable = &OBJC_METACLASS___THTOCModel.vtable;
        v14 = *(_QWORD *)v32;
        v29 = *(_QWORD *)v32;
        do
        {
          v15 = 0;
          v30 = v11;
          do
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(a4);
            v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v15);
            v17 = objc_opt_class(v12[396], v10);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
            {
              v18 = v8;
              v19 = a3;
              v20 = p_vtable;
              v21 = v12;
              v22 = a4;
              v23 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
              v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel initWithDocumentRoot:navigationUnitsNodes:]");
              v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m");
              v26 = v23;
              a4 = v22;
              v12 = v21;
              p_vtable = v20;
              a3 = v19;
              v8 = v18;
              v14 = v29;
              v11 = v30;
              objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 62, CFSTR("Expected array of content nodes, got something not an array."));
            }
            -[NSMutableArray addObject:](v8, "addObject:", objc_msgSend(objc_alloc((Class)(p_vtable + 252)), "initWithContext:contentNodes:", objc_msgSend(a3, "context"), objc_msgSend(v16, "copyWithZone:", 0)));
            v15 = (char *)v15 + 1;
          }
          while (v11 != v15);
          v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v11);
      }
      v7 = v28;
      -[THDocumentNavigationModel setNavigationUnits:](v28, "setNavigationUnits:", v8);
    }
    else
    {
      -[THDocumentNavigationModel p_inferNavigationUnits](v7, "p_inferNavigationUnits");
    }
    -[THDocumentNavigationModel setContentNodeGUIDToContentNodeDictionary:](v7, "setContentNodeGUIDToContentNodeDictionary:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THModelNode addMappingFromGUIDToNodeToDictionary:](-[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](v7, "documentRoot"), "rootNode"), "addMappingFromGUIDToNodeToDictionary:", -[THDocumentNavigationModel contentNodeGUIDToContentNodeDictionary](v7, "contentNodeGUIDToContentNodeDictionary"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[THDocumentNavigationModel setDocumentRoot:](self, "setDocumentRoot:", 0);
  -[THDocumentNavigationModel setNavigationUnits:](self, "setNavigationUnits:", 0);
  -[THDocumentNavigationModel setContentNodeGUIDToContentNodeDictionary:](self, "setContentNodeGUIDToContentNodeDictionary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THDocumentNavigationModel;
  -[THDocumentNavigationModel dealloc](&v3, "dealloc");
}

- (id)linkForContentNode:(id)a3 fragment:(id)a4
{
  return objc_msgSend(a3, "modelLinkWithFragment:", a4);
}

- (id)linkForNavigationUnitIndex:(unint64_t)a3
{
  return -[THDocumentNavigationModel linkForContentNode:fragment:](self, "linkForContentNode:fragment:", objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "objectAtIndex:", a3), "contentNodes"), "objectAtIndex:", 0), 0);
}

- (id)navigationUnitContainingContentNode:(id)a3
{
  NSArray *v4;
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
  v4 = -[THDocumentNavigationModel navigationUnits](self, "navigationUnits", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "containsContentNode:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)minorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  void *v5;

  -[THDocumentNavigationModel p_snippetPairForAbsolutePageIndex:withDocumentRoot:forPresentationType:](self, "p_snippetPairForAbsolutePageIndex:withDocumentRoot:forPresentationType:", a3, a4, a5);
  return v5;
}

- (id)pageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4
{
  id v7;
  id v8;

  v7 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return v7;
  v8 = -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a4);
  if (!v8)
    return v7;
  else
    return objc_msgSend(v8, "pageNumberStringForAbsolutePageIndex:presentationType:", a3, a4);
}

- (id)firstNavigationUnit
{
  return -[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "objectAtIndex:", 0);
}

- (id)navigationUnitPrecedingNavigationUnit:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "indexOfObject:", a3);
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL)
    return -[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "objectAtIndex:", v4 - 1);
  else
    return 0;
}

- (id)navigationUnitFollowingNavigationUnit:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v4 + 1;
  if (v4 + 1 >= -[NSArray count](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "count"))
    return 0;
  else
    return -[NSArray objectAtIndex:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "objectAtIndex:", v5);
}

- (id)sectionIdentifierForNavigationUnit:(id)a3
{
  NSUInteger v4;
  unint64_t v5;
  THTOCModel *v6;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel sectionIdentifierForNavigationUnit:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m"), 155, CFSTR("invalid nil value for '%s'"), "navUnit");
    return 0;
  }
  v4 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](self, "navigationUnits"), "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v4;
  v6 = -[THDocumentRoot tocModel](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "tocModel");
  if (v5 >= -[NSArray count](-[THTOCModel tiles](v6, "tiles"), "count"))
    return &stru_43D7D8;
  else
    return objc_msgSend(objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](-[THTOCModel tiles](v6, "tiles"), "objectAtIndex:", v5), "portraitEntries"), "objectAtIndex:", 0), "sectionIdentifier");
}

- (id)titleStringForNavigationUnit:(id)a3
{
  id v5;
  id v6;

  v5 = -[THDocumentNavigationModel chapterAndNumberStringForNavigationUnit:](self, "chapterAndNumberStringForNavigationUnit:");
  v6 = -[THDocumentNavigationModel parentTitleForNavigationUnit:](self, "parentTitleForNavigationUnit:", a3);
  if (objc_msgSend(v5, "length"))
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
  else
    return v6;
}

- (id)chapterAndNumberStringForNavigationUnit:(id)a3
{
  id v3;

  v3 = -[THDocumentNavigationModel sectionIdentifierForNavigationUnit:](self, "sectionIdentifierForNavigationUnit:", a3);
  if (v3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapter %@"), &stru_43D7D8, 0), v3);
  else
    return &stru_43D7D8;
}

- (id)parentTitleForNavigationUnit:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (!objc_msgSend(objc_msgSend(a3, "contentNodes"), "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel parentTitleForNavigationUnit:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m"), 211, CFSTR("can't get parent name from empty navigation unit"));
  if (!objc_msgSend(objc_msgSend(a3, "contentNodes"), "count"))
    return &stru_43D7D8;
  v5 = objc_opt_class(THModelNode, v4);
  return objc_msgSend(objc_msgSend((id)TSUDynamicCast(v5, objc_msgSend(objc_msgSend(a3, "contentNodes"), "objectAtIndex:", 0)), "parent"), "title");
}

- (id)uniqueIdentifierForNavigationUnit:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("#chapterguid(%@)"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "contentNodes"), "firstObject"), "nodeGUID"));
}

- (void)p_inferNavigationUnits
{
  uint64_t v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  THNavigationUnit *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_class(THModelContainerNode, a2);
  v4 = (void *)TSUDynamicCast(v3, -[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "rootNode"));
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(objc_msgSend(v4, "childNodes"), "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "childNodes", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = +[THNavigationUnit navigationUnitWithContext:andModelNode:](THNavigationUnit, "navigationUnitWithContext:andModelNode:", -[THDocumentRoot context](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "context"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
        if (v11)
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[THDocumentNavigationModel setNavigationUnits:](self, "setNavigationUnits:", v5);
}

- (id)p_lessonNodeForContentNode:(id)a3
{
  return a3;
}

- (id)p_chapterNodeForContentNode:(id)a3
{
  return objc_msgSend(a3, "parent");
}

- (THSnippetPair)p_snippetPairForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  id v6;
  id v7;
  id v8;
  NSString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  char *v13;
  void *v14;
  char *v15;
  __CFString *v16;
  __CFString *v17;
  NSString *v18;
  THSnippetPair result;

  v6 = objc_msgSend(objc_msgSend(a4, "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a5);
  v7 = -[THDocumentNavigationModel p_lessonNodeForContentNode:](self, "p_lessonNodeForContentNode:", v6);
  v8 = -[THDocumentNavigationModel p_chapterNodeForContentNode:](self, "p_chapterNodeForContentNode:", v6);
  v9 = (NSString *)objc_msgSend(v7, "majorSnippet");
  v10 = (__CFString *)objc_msgSend(v7, "minorSnippet");
  if (v9)
  {
    v11 = v10;
  }
  else
  {
    v12 = objc_msgSend(objc_msgSend(v7, "parent"), "indexOfNode:", v7);
    v13 = (char *)objc_msgSend(objc_msgSend(v8, "parent"), "indexOfNode:", v8);
    v14 = (void *)THBundle();
    v15 = v13 + 1;
    if (v12)
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Lesson %lu.%lu"), &stru_43D7D8, 0), v15, v12);
      v16 = (__CFString *)objc_msgSend(v7, "title");
      if (v16)
        v11 = v16;
      else
        v11 = &stru_43D7D8;
    }
    else
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Chapter %lu"), &stru_43D7D8, 0), v15);
      v17 = (__CFString *)objc_msgSend(v8, "title");
      if (v17)
        v11 = v17;
      else
        v11 = &stru_43D7D8;
    }
  }
  v18 = v9;
  result.var1 = v11;
  result.var0 = v18;
  return result;
}

- (unint64_t)pageCount
{
  return -[THModelNode pageCountForPresentationType:](-[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "rootNode"), "pageCountForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "context")));
}

- (NSArray)contentNodes
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[THDocumentNavigationModel navigationUnits](self, "navigationUnits", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "contentNodes"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "context")));
}

- (id)contentNodeForGUID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[THDocumentNavigationModel contentNodeGUIDToContentNodeDictionary](self, "contentNodeGUIDToContentNodeDictionary"), "objectForKey:", a3);
}

- (id)contentNodeForInfoID:(id)a3
{
  NSArray *v4;
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
  v4 = -[THDocumentNavigationModel contentNodes](self, "contentNodes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "infoForNodeUniqueID:", a3))
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)contentNodeForBodyStorageID:(id)a3
{
  id v5;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = -[THDocumentNavigationModel contentNodeForGUID:](self, "contentNodeForGUID:");
  if (!v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = -[THDocumentNavigationModel contentNodes](self, "contentNodes", 0);
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v5 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v11);
        if ((objc_msgSend(v5, "hasBodyStorageUID:", a3) & 1) != 0)
          break;
        if (v9 == (id)++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v5 = 0;
          if (v9)
            goto LABEL_5;
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)contentNodeForPageLocation:(id)a3
{
  id result;

  if (objc_msgSend(a3, "storageUID"))
  {
    result = -[THDocumentNavigationModel contentNodeForInfoID:](self, "contentNodeForInfoID:", objc_msgSend(a3, "storageUID"));
    if (result)
      return result;
    goto LABEL_6;
  }
  if (objc_msgSend(a3, "absolutePhysicalPageIndex") == (id)0x7FFFFFFFFFFFFFFFLL
    || (result = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](self, "contentNodeForAbsolutePageIndex:", objc_msgSend(a3, "absolutePhysicalPageIndex"))) == 0)
  {
LABEL_6:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigationModel contentNodeForPageLocation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigationModel.m"), 391, CFSTR("Failed to find node for %@"), a3);
    return 0;
  }
  return result;
}

- (unint64_t)absolutePageIndexForNavigationUnitRelativePageIndex:(unint64_t)a3 inNavigationUnit:(id)a4 forPresentationType:(id)a5
{
  return (unint64_t)objc_msgSend(a4, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, a5);
}

- (unint64_t)absolutePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5
{
  return (unint64_t)objc_msgSend(a4, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, a5);
}

- (unint64_t)navigationUnitRelativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;

  v7 = -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](-[THDocumentNavigationModel documentRoot](self, "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a4);
  v9 = objc_opt_class(THModelContentNode, v8);
  v10 = TSUDynamicCast(v9, v7);
  if (!v10)
    return 0x7FFFFFFFFFFFFFFFLL;
  v11 = -[THDocumentNavigationModel navigationUnitContainingContentNode:](self, "navigationUnitContainingContentNode:", v10);
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
  {
    v13 = objc_msgSend(v11, "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, a4);
    if (a3 >= (unint64_t)v13)
      return a3 - (_QWORD)v13;
  }
  return v12;
}

- (unint64_t)navigationUnitRelativePageIndexForContentNodeRelativePageIndex:(unint64_t)a3 inContentNode:(id)a4 forPresentationType:(id)a5
{
  _BYTE *v8;
  id v9;
  unint64_t result;
  _BYTE *v11;

  if (!a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = objc_msgSend(a4, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, a5);
  v9 = -[THDocumentNavigationModel navigationUnitContainingContentNode:](self, "navigationUnitContainingContentNode:", a4);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_msgSend(v9, "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, a5);
    if (v8 >= v11)
      return v8 - v11;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->mDocumentRoot = (THDocumentRoot *)a3;
}

- (NSArray)navigationUnits
{
  return self->mNavigationUnits;
}

- (void)setNavigationUnits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableDictionary)contentNodeGUIDToContentNodeDictionary
{
  return self->mContentNodeGUIDToContentNodeDictionary;
}

- (void)setContentNodeGUIDToContentNodeDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
