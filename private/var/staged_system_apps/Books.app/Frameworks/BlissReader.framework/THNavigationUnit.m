@implementation THNavigationUnit

- (THNavigationUnit)initWithContext:(id)a3 contentNodes:(id)a4
{
  THNavigationUnit *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNavigationUnit;
  v5 = -[THNavigationUnit initWithContext:](&v7, "initWithContext:", a3);
  if (v5)
    v5->mContentNodes = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", a4);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mContentNodes = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNavigationUnit;
  -[THNavigationUnit dealloc](&v3, "dealloc");
}

+ (id)emptyNavigationUnitWithContext:(id)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithContext:contentNodes:", a3, +[NSArray array](NSArray, "array"));
}

+ (THNavigationUnit)navigationUnitWithContext:(id)a3 andModelNode:(id)a4
{
  id v6;
  THNavigationUnit *result;

  v6 = +[NSMutableArray array](NSMutableArray, "array");
  sub_5B70C(a4, v6);
  result = (THNavigationUnit *)objc_msgSend(v6, "count");
  if (result)
    return -[THNavigationUnit initWithContext:contentNodes:]([THNavigationUnit alloc], "initWithContext:contentNodes:", a3, v6);
  return result;
}

- (NSArray)contentNodes
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->mContentNodes);
}

- (BOOL)containsContentNode:(id)a3
{
  if (a3)
    return -[NSArray containsObject:](self->mContentNodes, "containsObject:");
  else
    return 0;
}

- (id)contentNodeForInfo:(id)a3
{
  NSArray *mContentNodes;
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

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit contentNodeForInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 103, CFSTR("Searching among content nodes to find nil info."));
    return 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  mContentNodes = self->mContentNodes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mContentNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mContentNodes);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "isLoaded"))
    {
      if ((objc_msgSend(v9, "containsInfo:", a3) & 1) != 0)
        return v9;
    }
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mContentNodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_4;
      return 0;
    }
  }
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  id v15;
  unint64_t result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 123, CFSTR("Translating invalid relative page index (NSUNotFound)."));
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = -[THNavigationUnit contentNodes](self, "contentNodes");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = a3;
LABEL_5:
      v11 = 0;
      v12 = v10;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v14 = (unint64_t)objc_msgSend(v13, "pageCountForPresentationType:", a4);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v10 = v12 - v14;
        if (v12 < v14)
        {
          if (!v13)
            break;
          v15 = objc_msgSend(v13, "absolutePageRangeForPresentationType:", a4);
          result = (unint64_t)v15 + v12;
          if (v15 == (id)0x7FFFFFFFFFFFFFFFLL || result == 0x7FFFFFFFFFFFFFFFLL)
            break;
          return result;
        }
        v11 = (char *)v11 + 1;
        v12 -= v14;
        if (v8 == v11)
        {
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_5;
          break;
        }
      }
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 160, CFSTR("Failed to find absolute page index for relative page index %lu"), a3);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  char *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 165, CFSTR("Translating invalid absolute page index (NSUNotFound)."));
  if (!-[NSArray count](-[THNavigationUnit contentNodes](self, "contentNodes"), "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 167, CFSTR("Warning: translating relative page from absolute page %lu when navigation unit has no content nodes."), a3);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !-[NSArray count](-[THNavigationUnit contentNodes](self, "contentNodes"), "count"))
    goto LABEL_24;
  v8 = objc_opt_class(THModelContentNode, v7);
  v9 = objc_msgSend(objc_msgSend(objc_msgSend((id)TSUDynamicCast(v8, -[NSArray objectAtIndex:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectAtIndex:", 0)), "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, a4);
  if (!v9)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 172, CFSTR("failed to find content node for absolute page index %lu"), a3);
  if (!-[THNavigationUnit containsContentNode:](self, "containsContentNode:", v9))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 173, CFSTR("current navigation unit does not contain content node for absolute page index %lu"), a3);
  if (!v9 || !-[THNavigationUnit containsContentNode:](self, "containsContentNode:", v9))
    goto LABEL_24;
  v10 = (char *)objc_msgSend(v9, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, a4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = -[THNavigationUnit contentNodes](self, "contentNodes");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
LABEL_15:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v11);
      v16 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v15);
      if (v16 == v9)
        break;
      v10 = &v10[(_QWORD)objc_msgSend(v16, "pageCountForPresentationType:", a4)];
      if (v13 == (id)++v15)
      {
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          goto LABEL_15;
        break;
      }
    }
  }
  if (v10 >= (char *)-[THNavigationUnit pageCountForPresentationType:](self, "pageCountForPresentationType:", a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 183, CFSTR("Asking for page index %lu out of bounds"), v10);
  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 186, CFSTR("Failed to find relative page index for absolute page index %lu"), a3);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return (unint64_t)v10;
}

- (unint64_t)nodeRelativePageIndexInContentNode:(id)a3 forNavigationUnitRelativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v12);
      if (v13 == a3)
        break;
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "pageCountForPresentationType:", a5);
      if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v13, "startLoading");
        objc_msgSend(v13, "waitUntilFinishedLoadingAndPaginating");
        v14 = objc_msgSend(v13, "pageCountForPresentationType:", a5);
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      a4 -= (unint64_t)v14;
      if (v10 == (id)++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        return a4;
      }
    }
  }
  return a4;
}

- (unint64_t)navUnitRelativePageIndexForContentNode:(id)a3 forContentNodeRelativePageIndex:(unint64_t)a4 presentationType:(id)a5
{
  NSArray *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v8);
      v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      if (v14 == a3)
      {
        v11 += a4;
        return v11;
      }
      v15 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "pageCountForPresentationType:", a5);
      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v14, "startLoading");
        objc_msgSend(v14, "waitUntilFinishedLoadingAndPaginating");
        v15 = objc_msgSend(v14, "pageCountForPresentationType:", a5);
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 += (unint64_t)v15;
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
      continue;
    break;
  }
  return v11;
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  unint64_t v5;
  NSArray *v6;
  id result;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 265, CFSTR("Finding page info for invalid relative page index (NSUNotFound)."));
    return 0;
  }
  if (!a4)
    return 0;
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  result = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v13 = (unint64_t)objc_msgSend(v12, "pageCountForPresentationType:", a4);
        v5 = v11 - v13;
        if (v11 < v13)
          return objc_msgSend(v12, "pageAtRelativeIndex:forPresentationType:", v11, a4);
        v10 = (char *)v10 + 1;
        v11 -= v13;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      result = 0;
      if (v8)
        continue;
      break;
    }
  }
  return result;
}

- (id)contentNodeBeforeNode:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObjectIdenticalTo:](-[THNavigationUnit contentNodes](self, "contentNodes"), "indexOfObjectIdenticalTo:", a3);
  if (v4 < 2)
    return 0;
  else
    return -[NSArray objectAtIndex:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectAtIndex:", v4 - 1);
}

- (id)contentNodeAfterNode:(id)a3
{
  char *v4;

  v4 = -[NSArray indexOfObjectIdenticalTo:](-[THNavigationUnit contentNodes](self, "contentNodes"), "indexOfObjectIdenticalTo:", a3);
  if (v4 >= (char *)-[NSArray count](-[THNavigationUnit contentNodes](self, "contentNodes"), "count") - 1)
    return 0;
  else
    return -[NSArray objectAtIndex:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectAtIndex:", v4 + 1);
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  unint64_t v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 312, CFSTR("Finding content node for invalid relative page index (NSUNotFound)."));
    return 0;
  }
  if (!a4)
    return 0;
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v17;
LABEL_6:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
    v12 = (unint64_t)objc_msgSend(v11, "pageCountForPresentationType:", a4);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "startLoading");
      objc_msgSend(v11, "waitUntilFinishedLoadingAndPaginating");
      v12 = (unint64_t)objc_msgSend(v11, "pageCountForPresentationType:", a4);
    }
    v13 = v5 >= v12;
    v5 -= v12;
    if (!v13 || v12 == 0x7FFFFFFFFFFFFFFFLL)
      return v11;
    if (v8 == (id)++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = 0;
      if (v8)
        goto LABEL_6;
      return v11;
    }
  }
}

- (id)contentNodeForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationUnit contentNodeForAbsolutePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationUnit.m"), 350, CFSTR("Finding content node for invalid absolute page index (NSUNotFound)."));
    return 0;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v17;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
    v12 = objc_msgSend(v11, "absolutePageRangeForPresentationType:", a4);
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL && a3 >= (unint64_t)v12 && a3 - (unint64_t)v12 < v13)
      return v11;
    if (v8 == (id)++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = 0;
      if (v8)
        goto LABEL_5;
      return v11;
    }
  }
}

- (id)contentNodesSurroundingRelativePageRange:(_NSRange)a3 forPresentationType:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  id v14;
  id v15;

  length = a3.length;
  location = a3.location;
  v8 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v9 = -[NSArray count](-[THNavigationUnit contentNodes](self, "contentNodes"), "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = location + length;
    do
    {
      v14 = objc_msgSend(-[NSArray objectAtIndex:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectAtIndex:", v11), "pageCountForPresentationType:", a4);
      v15 = v14;
      if (location < v12 || location - v12 >= (unint64_t)v14)
      {
        if (v12 >= v13)
        {
          objc_msgSend(v8, "addIndex:", v11);
          return -[NSArray objectsAtIndexes:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectsAtIndexes:", v8);
        }
      }
      else if (v11)
      {
        objc_msgSend(v8, "addIndex:", v11 - 1);
      }
      v12 += (NSUInteger)v15;
      ++v11;
    }
    while (v10 != v11);
  }
  return -[NSArray objectsAtIndexes:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectsAtIndexes:", v8);
}

- (_NSRange)absolutePageRangeForPresentationType:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = NSInvalidRange[0];
  v6 = NSInvalidRange[1];
  v7 = -[THNavigationUnit startPageAbsolutePageIndexForPresentationType:](self, "startPageAbsolutePageIndexForPresentationType:");
  v8 = -[THNavigationUnit pageCountForPresentationType:](self, "pageCountForPresentationType:", a3);
  v9 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  v10 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && v10)
    v11 = v8;
  else
    v11 = (NSUInteger)v6;
  if (v9 && v10)
    v12 = v7;
  else
    v12 = (NSUInteger)v5;
  result.length = v11;
  result.location = v12;
  return result;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  NSArray *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[THNavigationUnit contentNodes](self, "contentNodes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "pageCountForPresentationType:", a3);
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
        return 0x7FFFFFFFFFFFFFFFLL;
      v7 += (unint64_t)v10;
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
      continue;
    break;
  }
  return v7;
}

- (unint64_t)startPageAbsolutePageIndexForPresentationType:(id)a3
{
  return (unint64_t)objc_msgSend(-[NSArray objectAtIndex:](-[THNavigationUnit contentNodes](self, "contentNodes"), "objectAtIndex:", 0), "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, a3);
}

@end
