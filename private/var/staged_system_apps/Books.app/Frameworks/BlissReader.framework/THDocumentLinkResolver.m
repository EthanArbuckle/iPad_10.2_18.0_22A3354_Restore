@implementation THDocumentLinkResolver

- (THDocumentLinkResolver)initWithDocumentRoot:(id)a3
{
  THDocumentLinkResolver *v4;
  THDocumentLinkResolver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THDocumentLinkResolver;
  v4 = -[THDocumentLinkResolver init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->mDocumentRoot = (THDocumentRoot *)a3;
    v4->_displayPageNumberMap = objc_alloc_init(THDisplayPageNumberMap);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mPathToNodeIndex = 0;
  self->_displayPageNumberMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDocumentLinkResolver;
  -[THDocumentLinkResolver dealloc](&v3, "dealloc");
}

- (void)updatePaginationResults
{
  -[THDisplayPageNumberMap buildDisplayPageMapsWithDocumentRoot:](-[THDocumentLinkResolver displayPageNumberMap](self, "displayPageNumberMap"), "buildDisplayPageMapsWithDocumentRoot:", self->mDocumentRoot);
}

- (void)invalidatePaginationResults
{
  -[THDisplayPageNumberMap clearDisplayPageMapsWithDocumentRoot:](-[THDocumentLinkResolver displayPageNumberMap](self, "displayPageNumberMap"), "clearDisplayPageMapsWithDocumentRoot:", self->mDocumentRoot);
}

- (NSDictionary)pathToNodeIndex
{
  NSDictionary *result;

  result = self->mPathToNodeIndex;
  if (!result)
  {
    result = (NSDictionary *)-[THDocumentLinkResolver p_buildPathToNodeIndex](self, "p_buildPathToNodeIndex");
    self->mPathToNodeIndex = result;
  }
  return result;
}

- (id)nodeFromLink:(id)a3
{
  return -[NSDictionary objectForKey:](-[THDocumentLinkResolver pathToNodeIndex](self, "pathToNodeIndex"), "objectForKey:", objc_msgSend(a3, "docRelativePath"));
}

- (id)contentNodeFromLink:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[THDocumentLinkResolver nodeFromLink:](self, "nodeFromLink:", a3);
  v5 = objc_opt_class(THModelContentNode, v4);
  result = (id)TSUDynamicCast(v5, v3);
  if (!result)
  {
    v8 = objc_opt_class(THModelContainerNode, v7);
    result = (id)TSUDynamicCast(v8, v3);
    if (result)
    {
      v9 = result;
      do
      {
        if (!objc_msgSend(v9, "count"))
          break;
        v10 = objc_msgSend(v9, "nodeAtIndex:", 0);
        v12 = objc_opt_class(THModelContainerNode, v11);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
          break;
        v14 = objc_opt_class(THModelContainerNode, v13);
        v9 = (id)TSUDynamicCast(v14, objc_msgSend(v9, "nodeAtIndex:", 0));
      }
      while (v9);
      result = objc_msgSend(v9, "count");
      if (result)
      {
        v16 = objc_opt_class(THModelContentNode, v15);
        return (id)TSUDynamicCast(v16, objc_msgSend(v9, "nodeAtIndex:", 0));
      }
    }
  }
  return result;
}

- (id)absoluteLink:(id)a3 withContentNode:(id)a4
{
  id v7;

  v7 = objc_msgSend(a3, "docRelativePath");
  if (v7 && objc_msgSend(v7, "length"))
  {
    a4 = -[THDocumentLinkResolver contentNodeFromLink:](self, "contentNodeFromLink:", a3);
    if (!a4)
      return 0;
  }
  else if (!a4)
  {
    return 0;
  }
  return objc_msgSend(a4, "modelLinkWithFragment:", objc_msgSend(a3, "fragment"));
}

- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4
{
  id result;

  if (objc_msgSend(a3, "isPageLink"))
    return -[THDocumentLinkResolver p_anchorFromPageLink:presentationType:](self, "p_anchorFromPageLink:presentationType:", a3);
  if ((objc_msgSend(a3, "isChapterLink") & 1) != 0 || objc_msgSend(a3, "isChapterGuidLink"))
    return -[THDocumentLinkResolver p_anchorFromChapterLink:presentationType:](self, "p_anchorFromChapterLink:presentationType:", a3);
  result = -[THDocumentLinkResolver contentNodeFromLink:](self, "contentNodeFromLink:", a3);
  if (result)
    return -[THContentLinkResolver navigableAnchorFromLink:](+[THContentLinkResolver contentLinkResolverWithContentNode:presentationType:](THContentLinkResolver, "contentLinkResolverWithContentNode:presentationType:", result, a4), "navigableAnchorFromLink:", a3);
  return result;
}

- (id)p_anchorFromPageLink:(id)a3 presentationType:(id)a4
{
  unint64_t v6;
  unint64_t v8;
  id v9;

  v6 = -[THDisplayPageNumberMap absolutePageIndexForDisplayPageNumber:](-[THDocumentLinkResolver displayPageNumberMap](self, "displayPageNumberMap"), "absolutePageIndexForDisplayPageNumber:", objc_msgSend(a3, "pageNumberString"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8 = v6;
  v9 = -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](self->mDocumentRoot, "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", 0, a4);
  return -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v9, objc_msgSend(v9, "relativePageIndexForAbsolutePageIndex:forPresentationType:", v8, a4), a4);
}

- (id)p_anchorFromChapterLink:(id)a3 presentationType:(id)a4
{
  id v6;
  id result;

  v6 = -[THDocumentLinkResolver p_modelLinkFromChapterLink:](self, "p_modelLinkFromChapterLink:", a3);
  result = -[THDocumentLinkResolver contentNodeFromLink:](self, "contentNodeFromLink:", v6);
  if (result)
    return -[THContentLinkResolver navigableAnchorFromLink:](+[THContentLinkResolver contentLinkResolverWithContentNode:presentationType:](THContentLinkResolver, "contentLinkResolverWithContentNode:presentationType:", result, a4), "navigableAnchorFromLink:", v6);
  return result;
}

- (id)anchorFromCustomLink:(id)a3 presentationType:(id)a4
{
  id v7;

  if (!objc_msgSend(a3, "targetIsiBooks"))
    return 0;
  if (objc_msgSend(a3, "isPageLink"))
    return -[THDocumentLinkResolver p_anchorFromPageLink:presentationType:](self, "p_anchorFromPageLink:presentationType:", a3, a4);
  if ((objc_msgSend(a3, "isChapterLink") & 1) != 0 || objc_msgSend(a3, "isChapterGuidLink"))
    return -[THDocumentLinkResolver p_anchorFromChapterLink:presentationType:](self, "p_anchorFromChapterLink:presentationType:", a3, a4);
  v7 = objc_msgSend(objc_msgSend(a3, "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  if (objc_msgSend(v7, "length")
    && -[NSDictionary objectForKey:](-[THTOCModel figureReference](-[THDocumentRoot tocModel](self->mDocumentRoot, "tocModel"), "figureReference"), "objectForKey:", v7))
  {
    return -[THDocumentLinkResolver anchorFromAbsoluteLink:presentationType:](self, "anchorFromAbsoluteLink:presentationType:", objc_autorelease(-[THModelLink initWithTarget:context:]([THModelLink alloc], "initWithTarget:context:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("apub:///0/0/0%@"), objc_msgSend(CFSTR("/OPS/"), "stringByAppendingString:", -[NSDictionary objectForKey:](-[THTOCModel figureReference](-[THDocumentRoot tocModel](self->mDocumentRoot, "tocModel"), "figureReference"), "objectForKey:", v7))),
                 -[THDocumentRoot context](self->mDocumentRoot, "context"))),
             a4);
  }
  else
  {
    return 0;
  }
}

- (id)p_modelLinkFromChapterLink:(id)a3
{
  unsigned int v5;
  char v6;
  id v7;
  id v8;
  id result;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v5 = objc_msgSend(a3, "isChapterGuidLink");
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(a3, "chapterGuidString");
  else
    v7 = objc_msgSend(a3, "chapterString");
  v8 = v7;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = -[THTOCModel tiles](-[THDocumentRoot tocModel](self->mDocumentRoot, "tocModel"), "tiles");
  result = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (result)
  {
    v10 = result;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v12);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v14 = objc_msgSend(v13, "portraitEntries");
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
LABEL_11:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
            v20 = (v6 & 1) != 0 ? objc_msgSend(v19, "nodeGUID") : objc_msgSend(v19, "sectionIdentifier");
            if ((objc_msgSend(v20, "isEqualToString:", v8) & 1) != 0)
              break;
            if (v16 == (id)++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v16)
                goto LABEL_11;
              goto LABEL_22;
            }
          }
          result = objc_msgSend(v19, "modelLink");
          if (result)
            return result;
        }
LABEL_22:
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      result = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v10 = result;
    }
    while (result);
  }
  return result;
}

- (unint64_t)absolutePageNumberFromCustomLink:(id)a3 presentationType:(id)a4
{
  id v8;

  if (objc_msgSend(a3, "isPageLink"))
    return -[THDisplayPageNumberMap absolutePageIndexForDisplayPageNumber:](-[THDocumentLinkResolver displayPageNumberMap](self, "displayPageNumberMap"), "absolutePageIndexForDisplayPageNumber:", objc_msgSend(a3, "pageNumberString"));
  if ((objc_msgSend(a3, "isChapterLink") & 1) != 0 || objc_msgSend(a3, "isChapterGuidLink"))
  {
    v8 = -[THDocumentLinkResolver p_modelLinkFromChapterLink:](self, "p_modelLinkFromChapterLink:", a3);
    if (v8)
      return -[THDocumentNavigationModel absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:](-[THDocumentRoot navigationModel](self->mDocumentRoot, "navigationModel"), "absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", 0, -[THDocumentLinkResolver contentNodeFromLink:](self, "contentNodeFromLink:", v8), a4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_buildPathToNodeIndex
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_56E14;
  v13 = sub_56E24;
  v14 = 0;
  v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = objc_opt_class(THModelContainerNode, v3);
  v5 = (void *)TSUDynamicCast(v4, -[THDocumentRoot rootNode](self->mDocumentRoot, "rootNode"));
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_56E30;
    v8[3] = &unk_427C78;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateSubtreeUsingBlock:", v8);
  }
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (THDisplayPageNumberMap)displayPageNumberMap
{
  return self->_displayPageNumberMap;
}

- (void)setDisplayPageNumberMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
