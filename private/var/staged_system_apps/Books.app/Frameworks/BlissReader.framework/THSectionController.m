@implementation THSectionController

- (THSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5
{
  THSectionController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THSectionController;
  v8 = -[THSectionController init](&v10, "init");
  if (v8)
  {
    -[THSectionController setPageControllers:](v8, "setPageControllers:", +[TSUPointerKeyDictionary dictionary](TSUPointerKeyDictionary, "dictionary"));
    -[THSectionController setSectionInfos:](v8, "setSectionInfos:", +[TSUPointerKeyDictionary dictionary](TSUPointerKeyDictionary, "dictionary"));
    -[THSectionController setDelegate:](v8, "setDelegate:", a3);
    v8->_presentationType = (THPresentationType *)objc_msgSend(a5, "copy");
    -[THSectionController setPagePositionController:](v8, "setPagePositionController:", a4);
    -[THSectionController setCanvasOriginDelta:](v8, "setCanvasOriginDelta:", CGPointZero.x, CGPointZero.y);
  }
  return v8;
}

- (void)teardown
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSUPointerKeyDictionary allValues](-[THSectionController sectionInfos](self, "sectionInfos", 0), "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setPageController:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[THSectionController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", 0);
  -[TSUPointerKeyDictionary removeAllObjects](-[THSectionController pageControllers](self, "pageControllers"), "removeAllObjects");
  -[THSectionController setPageControllers:](self, "setPageControllers:", 0);
  -[TSUPointerKeyDictionary removeAllObjects](-[THSectionController sectionInfos](self, "sectionInfos"), "removeAllObjects");
  -[THSectionController setSectionInfos:](self, "setSectionInfos:", 0);
  -[THSectionController setPresentationType:](self, "setPresentationType:", 0);
  -[THSectionController setDelegate:](self, "setDelegate:", 0);
  -[THSectionController setPagePositionController:](self, "setPagePositionController:", 0);
  -[THSectionController setSearchTargetProvider:](self, "setSearchTargetProvider:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THSectionController teardown](self, "teardown");
  if (-[THSectionController pageControllers](self, "pageControllers"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 114, CFSTR("expected nil value for '%s'"), "self.pageControllers");
  if (-[THSectionController pagePositionController](self, "pagePositionController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 115, CFSTR("expected nil value for '%s'"), "self.pagePositionController");
  if (-[THSectionController presentationType](self, "presentationType"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 116, CFSTR("expected nil value for '%s'"), "self.presentationType");
  if (-[THSectionController delegate](self, "delegate"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 117, CFSTR("expected nil value for '%s'"), "self.delegate");
  if (-[THSectionController sectionInfos](self, "sectionInfos"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 118, CFSTR("expected nil value for '%s'"), "self.sectionInfos");
  if (self->_searchTargetProvider)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 119, CFSTR("expected nil value for '%s'"), "_searchTargetProvider");
  v3.receiver = self;
  v3.super_class = (Class)THSectionController;
  -[THSectionController dealloc](&v3, "dealloc");
}

- (unint64_t)pageCount
{
  NSArray *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      v6 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (void)p_enumerateRelativePageRange:(_NSRange)a3 acrossContentNodesUsingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  BOOL v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  length = a3.length;
  location = a3.location;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
      v14 = (unint64_t)objc_msgSend(v13, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
      v15 = length + location;
      if (length + location >= v14)
        v15 = v14;
      v16 = v15 - location;
      v17 = location < v14 ? location : 0x7FFFFFFFFFFFFFFFLL;
      v18 = location < v14 ? v16 : 0;
      if (location < v14)
        location = 0;
      else
        location -= v14;
      (*((void (**)(id, void *, NSUInteger, NSUInteger))a4 + 2))(a4, v13, v17, v18);
      v19 = length > v18;
      length -= v18;
      if (!v19)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)p_clearDataForUnusedContentNodes
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_50388;
  v13[3] = &unk_427A78;
  v13[4] = self;
  v3 = -[TSUPointerKeyDictionary keysOfEntriesPassingTest:](-[THSectionController pageControllers](self, "pageControllers"), "keysOfEntriesPassingTest:", v13);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        objc_msgSend(-[TSUPointerKeyDictionary objectForKey:](-[THSectionController sectionInfos](self, "sectionInfos"), "objectForKey:", v8), "setPageController:", 0);
        objc_msgSend(-[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v8), "teardown");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }
  -[TSUPointerKeyDictionary removeObjectsForKeys:](-[THSectionController pageControllers](self, "pageControllers"), "removeObjectsForKeys:", objc_msgSend(v3, "allObjects"));
  -[TSUPointerKeyDictionary removeObjectsForKeys:](-[THSectionController sectionInfos](self, "sectionInfos"), "removeObjectsForKeys:", objc_msgSend(v3, "allObjects"));
  -[THSectionController setSearchTargetProvider:](self, "setSearchTargetProvider:", 0);
}

- (void)p_ensureDataForContentNodes
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        if (!-[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v8))
        {
          v9 = -[THSectionController newPageControllerForContentNode:](self, "newPageControllerForContentNode:", v8);
          -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THSectionController pageControllers](self, "pageControllers"), "setObject:forUncopiedKey:", v9, v8);

          v10 = -[THSectionController newSectionInfoForContentNode:](self, "newSectionInfoForContentNode:", v8);
          objc_msgSend(v10, "setPageController:", v9);
          -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THSectionController sectionInfos](self, "sectionInfos"), "setObject:forUncopiedKey:", v10, v8);

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
}

- (NSArray)currentContentNodes
{
  return -[THNavigationUnit contentNodes](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodes");
}

- (void)setCurrentNavigationUnit:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  if (self->mCurrentNavigationUnit != a3)
  {
    v5 = a3;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(a3, "contentNodes");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "retainBodies");
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = -[THNavigationUnit contentNodes](self->mCurrentNavigationUnit, "contentNodes", 0);
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "releaseBodies");
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

    self->mCurrentNavigationUnit = (THNavigationUnit *)a3;
    -[THSectionController p_clearDataForUnusedContentNodes](self, "p_clearDataForUnusedContentNodes");
    -[THSectionController p_ensureDataForContentNodes](self, "p_ensureDataForContentNodes");
  }
}

- (void)setPresentationType:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  _BYTE v34[128];

  if (a3)
  {
    if ((objc_msgSend(a3, "isEqualIncludingSize:", -[THSectionController presentationType](self, "presentationType")) & 1) == 0&& objc_msgSend(a3, "isPaginated")&& -[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))
    {

      self->_presentationType = (THPresentationType *)objc_msgSend(a3, "copyFixingSize");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v5 = -[TSUPointerKeyDictionary allValues](-[THSectionController pageControllers](self, "pageControllers"), "allValues");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "setPresentationType:", a3);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v7);
      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = -[THNavigationUnit contentNodes](self->mCurrentNavigationUnit, "contentNodes", 0);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), "waitUntilFinishedLoadingAndPaginating");
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v12);
      }
    }
  }
  else
  {

    self->_presentationType = 0;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = -[TSUPointerKeyDictionary allValues](-[THSectionController pageControllers](self, "pageControllers"), "allValues");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v17; k = (char *)k + 1)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)k), "setPresentationType:", 0);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v17);
    }
  }
}

- (id)pageControllerForContentNode:(id)a3
{
  if (a3)
    return -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", a3);
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController pageControllerForContentNode:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 292, CFSTR("invalid nil value for '%s'"), "contentNode");
  return 0;
}

- (CGSize)pageSize
{
  double v2;
  double v3;
  CGSize result;

  -[THPresentationType pageSize](-[THSectionController presentationType](self, "presentationType"), "pageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)preferredCanvasSize
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  CGSize result;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
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
        -[THSectionController sectionSizeForContentNode:](self, "sectionSizeForContentNode:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
        objc_msgSend(v3, "addObject:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[THPagePositionController sequentialSizeFromPageSizes:](-[THSectionController pagePositionController](self, "pagePositionController"), "sequentialSizeFromPageSizes:", v3);
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)shouldEnablePaging
{
  return -[THPagePositionController shouldEnablePaging](-[THSectionController pagePositionController](self, "pagePositionController"), "shouldEnablePaging");
}

- (BOOL)p_showingPagesInNodeContainingRelativePageIndex:(unint64_t)a3
{
  id v4;

  v4 = -[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", a3, -[THSectionController presentationType](self, "presentationType"));
  if (v4)
    v4 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController sectionInfos](self, "sectionInfos"), "objectForKey:", v4);
  return objc_msgSend(objc_msgSend(v4, "pages"), "count") != 0;
}

- (void)p_addPagesInRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_50C08;
  v4[3] = &unk_427AF0;
  v4[4] = self;
  v5 = a4;
  -[THSectionController p_enumerateRelativePageRange:acrossContentNodesUsingBlock:](self, "p_enumerateRelativePageRange:acrossContentNodesUsingBlock:", a3.location, a3.length, v4);
}

- (void)p_updateSectionInfosForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  _QWORD v14[5];
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v16 = 0u;
  v17 = 0u;
  if (!-[THSectionController shouldEnablePaging](self, "shouldEnablePaging"))
  {
    length += location;
    location = 0;
  }
  v18 = 0uLL;
  v19 = 0uLL;
  v8 = -[TSUPointerKeyDictionary allValues](-[THSectionController sectionInfos](self, "sectionInfos"), "allValues");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "setPages:", +[NSArray array](NSArray, "array"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  -[THSectionController p_addPagesInRange:forceLoad:](self, "p_addPagesInRange:forceLoad:", location, length, v4);
  if ((objc_opt_respondsToSelector(-[THSectionController delegate](self, "delegate"), "additionalVisibleRelativePageIndexesForSectionController:") & 1) != 0)
  {
    v13 = objc_msgSend(-[THSectionControllerDelegate additionalVisibleRelativePageIndexesForSectionController:](-[THSectionController delegate](self, "delegate"), "additionalVisibleRelativePageIndexesForSectionController:", self), "mutableCopy");
    objc_msgSend(v13, "removeIndexesInRange:", location, length);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_510F4;
    v14[3] = &unk_427B18;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v14);

  }
}

- (CGRect)p_expandCanvasRectIfFlow:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[THPagePositionController shouldEnablePaging](-[THSectionController pagePositionController](self, "pagePositionController"), "shouldEnablePaging"))
  {
    -[THPagePositionController pageSize](-[THSectionController pagePositionController](self, "pagePositionController"), "pageSize");
    v9 = -v8;
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v15 = CGRectInset(v14, 0.0, v9);
    x = v15.origin.x;
    width = v15.size.width;
    *(float *)&v15.origin.x = v15.origin.y;
    y = fmaxf(*(float *)&v15.origin.x, 0.0);
    height = v15.size.height + v15.origin.y - y;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  id v5;
  _QWORD v7[5];

  -[THSectionController p_updateSectionInfosForRelativePageRange:forceLoad:](self, "p_updateSectionInfosForRelativePageRange:forceLoad:", a3.location, a3.length, a4);
  v5 = -[TSUPointerKeyDictionary allValues](-[THSectionController sectionInfos](self, "sectionInfos"), "allValues");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_51228;
  v7[3] = &unk_427B40;
  v7[4] = -[THSectionController currentContentNodes](self, "currentContentNodes");
  return objc_msgSend(v5, "sortedArrayUsingComparator:", v7);
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v5 = -[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", a3, -[THSectionController presentationType](self, "presentationType"));
  v6 = -[THNavigationUnit nodeRelativePageIndexInContentNode:forNavigationUnitRelativePageIndex:presentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "nodeRelativePageIndexInContentNode:forNavigationUnitRelativePageIndex:presentationType:", v5, a3, -[THSectionController presentationType](self, "presentationType"));
  if (v5)
    v7 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v5);
  else
    v7 = 0;
  -[THSectionController canvasOriginForPageController:](self, "canvasOriginForPageController:", v7);
  v8 = TSDAddPoints(-[THPagePositionController pageOriginForRelativePageIndex:](-[THSectionController pagePositionController](self, "pagePositionController"), "pageOriginForRelativePageIndex:", v6));
  v10 = v9;
  if (-[THSectionControllerDelegate displaySinglePageChapterSeparately:](-[THSectionController delegate](self, "delegate"), "displaySinglePageChapterSeparately:", self)&& -[THSectionControllerDelegate isTwoUpForSectionController:](-[THSectionController delegate](self, "delegate"), "isTwoUpForSectionController:", self)&& (char *)-[THNavigationUnit pageCountForPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType")) == (char *)&dword_0 + 1)
  {
    if (v5)
      v11 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v5);
    else
      v11 = 0;
    objc_msgSend(v11, "desiredPageSizeForRelativePageIndex:", v6);
    v13 = v12;
    -[THSectionController sectionSizeForContentNode:](self, "sectionSizeForContentNode:", v5);
    v8 = v8 + (v14 - v13) * 0.5;
  }
  v15 = v8;
  v16 = v10;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGRect)canvasRectForRelativePageIndex:(unint64_t)a3
{
  CGSize size;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  const char *v18;
  CGPoint origin;
  CGSize v20;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x5012000000;
  v16 = sub_5151C;
  v17 = nullsub_19;
  v18 = "";
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v20 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5152C;
  v12[3] = &unk_427B68;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a3;
  objc_msgSend(objc_msgSend(-[THSectionControllerDelegate documentRootForSectionController:](-[THSectionController delegate](self, "delegate"), "documentRootForSectionController:", self), "accessController"), "performRead:", v12);
  v4 = v14[6];
  v5 = v14[7];
  v6 = v14[8];
  v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (unint64_t)relativePageIndexForContentNode:(id)a3
{
  NSArray *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(v5);
    v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (v11 == a3)
      return v8;
    v8 += (unint64_t)objc_msgSend(v11, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
    if (v7 == (id)++v10)
    {
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        goto LABEL_3;
      return v8;
    }
  }
}

- (CGPoint)sectionOriginForContentNode:(id)a3
{
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  CGPoint result;

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10) == a3)
        break;
      -[THSectionController sectionSizeForContentNode:](self, "sectionSizeForContentNode:");
      objc_msgSend(v5, "addObject:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
      if (v8 == (id)++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  -[THPagePositionController sectionOriginWithPrecedingSectionSizes:](-[THSectionController pagePositionController](self, "pagePositionController"), "sectionOriginWithPrecedingSectionSizes:", v5);
  result.y = v12;
  result.x = v11;
  return result;
}

- (TSKSearchTargetProvider)searchTargetProvider
{
  TSKSearchTargetProvider *result;
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  result = self->_searchTargetProvider;
  if (!result)
  {
    v4 = +[NSMutableArray array](NSMutableArray, "array");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", -[THSectionController pageControllerForContentNode:](self, "pageControllerForContentNode:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    result = (TSKSearchTargetProvider *)objc_msgSend(objc_alloc((Class)TSKAggregateSearchTargetProvider), "initWithSearchTargetProviders:", v4);
    self->_searchTargetProvider = result;
  }
  return result;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  return (unint64_t)-[TSKSearchTargetProvider rootSearchTargetCountThroughIndex:](-[THSectionController searchTargetProvider](self, "searchTargetProvider"), "rootSearchTargetCountThroughIndex:", a3);
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  -[TSKSearchTargetProvider withRootSearchTargetAtIndex:executeBlock:](-[THSectionController searchTargetProvider](self, "searchTargetProvider"), "withRootSearchTargetAtIndex:executeBlock:", a3, a4);
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  return (unint64_t)-[TSKSearchTargetProvider nextRootSearchTargetIndexFromIndex:forString:options:inDirection:](-[THSectionController searchTargetProvider](self, "searchTargetProvider"), "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, a4, a5, a6);
}

- (unint64_t)p_relativeSheetIndexFromCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  unsigned int v6;
  float v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  CGPoint v44;
  CGRect v45;

  y = a3.y;
  x = a3.x;
  if (!-[NSArray count](-[THSectionController currentContentNodes](self, "currentContentNodes"), "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_relativeSheetIndexFromCanvasPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 549, CFSTR("Asking for page of canvas point, but there aren't any content nodes"));
  if (!-[NSArray count](-[THSectionController currentContentNodes](self, "currentContentNodes"), "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = -[THPagePositionController pageHorizontally](-[THSectionController pagePositionController](self, "pagePositionController"), "pageHorizontally");
  -[THPagePositionController pageSize](-[THSectionController pagePositionController](self, "pagePositionController"), "pageSize");
  v7 = y;
  v8 = fmaxf(v7, 0.0);
  v10 = v9 * 0.5;
  v11 = x;
  v12 = fmaxf(v11, 0.0);
  v14 = v13 * 0.5;
  if (v6)
    v15 = v12;
  else
    v15 = v10;
  if (v6)
    v16 = v14;
  else
    v16 = v8;
  v17 = +[NSMutableArray array](NSMutableArray, "array");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        -[THSectionController sectionSizeForContentNode:](self, "sectionSizeForContentNode:", v24);
        v26 = v25;
        v28 = v27;
        -[THPagePositionController sectionOriginWithPrecedingSectionSizes:](-[THSectionController pagePositionController](self, "pagePositionController"), "sectionOriginWithPrecedingSectionSizes:", v17);
        v30 = v29;
        v32 = v31;
        v33 = (unint64_t)objc_msgSend(v24, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
        v45.origin.x = v30;
        v45.origin.y = v32;
        v45.size.width = v26;
        v45.size.height = v28;
        v44.x = v15;
        v44.y = v16;
        if (CGRectContainsPoint(v45, v44))
        {
          v35 = -[THPagePositionController relativePageIndexFromCanvasPoint:](-[THSectionController pagePositionController](self, "pagePositionController"), "relativePageIndexFromCanvasPoint:", v15 - v30, v16 - v32);
          v36 = (char *)(v33 - 1);
          if (v35 < v33 - 1)
            v36 = (char *)v35;
          return (unint64_t)&v36[v21];
        }
        v21 += v33;
        objc_msgSend(v17, "addObject:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v26, v28));
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v20)
        continue;
      break;
    }
    v34 = ~v33;
  }
  else
  {
    v21 = 0;
    v34 = -1;
  }
  v38 = objc_msgSend(-[NSArray lastObject](-[THSectionController currentContentNodes](self, "currentContentNodes"), "lastObject"), "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
  if (!v38)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_relativeSheetIndexFromCanvasPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 591, CFSTR("Content node with no pages"));
  return (unint64_t)v38 + v21 + v34;
}

- (_NSRange)relativePageRangeForCanvasRect:(CGRect)a3 pad:(int)a4
{
  char v4;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  CGFloat v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  NSUInteger v23;
  _NSRange result;
  CGRect v25;
  CGRect v26;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    -[THSectionController p_expandCanvasRectIfFlow:](self, "p_expandCanvasRectIfFlow:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }
  v14 = -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", x, y);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v15 = CGRectGetMaxX(v25) + -0.01;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", v15, CGRectGetMaxY(v26) + -0.01);
  v17 = -[THSectionController pageCount](self, "pageCount");
  v18 = v17;
  if (v16 <= v14)
    v19 = v14;
  else
    v19 = v16;
  if (v19 >= v17)
    v20 = v17 - 1;
  else
    v20 = v19;
  if (v14 >= v20)
    v14 = v20;
  if ((objc_opt_respondsToSelector(-[THSectionController delegate](self, "delegate"), "sectionControllerNumberOfPagesDisplayed:") & 1) != 0&& -[THSectionControllerDelegate sectionControllerNumberOfPagesDisplayed:](-[THSectionController delegate](self, "delegate"), "sectionControllerNumberOfPagesDisplayed:", self))
  {
    v21 = -[THSectionControllerDelegate sectionControllerNumberOfPagesDisplayed:](-[THSectionController delegate](self, "delegate"), "sectionControllerNumberOfPagesDisplayed:", self);
  }
  else
  {
    v21 = &dword_0 + 1;
  }
  v22 = v20 - v14 + 1;
  if ((v4 & 1) != 0)
    v14 = THRangeExtendBackward(v14, v22, (unint64_t)v21);
  v23 = v14;
  if ((v4 & 2) != 0)
    v23 = THRangeExtendForward(v14, v22, (uint64_t)v21, v18);
  result.length = v22;
  result.location = v23;
  return result;
}

- (void)p_ensureLayoutThroughRelativePageRange:(_NSRange)a3 withLayoutController:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_51F70;
  v4[3] = &unk_427B90;
  v4[4] = self;
  v4[5] = a4;
  -[THSectionController p_enumerateRelativePageRange:acrossContentNodesUsingBlock:](self, "p_enumerateRelativePageRange:acrossContentNodesUsingBlock:", a3.location, a3.length, v4);
}

- (void)p_ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4 withLayoutController:(id)a5
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  id v12;
  uint64_t v13;

  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[THSectionController currentContentNodes](self, "currentContentNodes"))
  {
    v12 = -[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", v6, x, y, width, height);
    -[THSectionController p_ensureLayoutThroughRelativePageRange:withLayoutController:](self, "p_ensureLayoutThroughRelativePageRange:withLayoutController:", v12, v13, a5);
  }
}

- (void)ensureLayoutThroughRelativePageRange:(_NSRange)a3
{
  -[THSectionController p_ensureLayoutThroughRelativePageRange:withLayoutController:](self, "p_ensureLayoutThroughRelativePageRange:withLayoutController:", a3.location, a3.length, 0);
}

- (void)ensureLayoutThroughRect:(CGRect)a3 pad:(int)a4
{
  -[THSectionController p_ensureLayoutThroughRect:pad:withLayoutController:](self, "p_ensureLayoutThroughRect:pad:withLayoutController:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)ensureSectionInfosLaidOut:(id)a3 layoutController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "lastPage");
        if (v11)
          objc_msgSend(objc_msgSend(v10, "pageController"), "layoutThroughRelativePageIndex:layoutController:", objc_msgSend(v11, "relativePageIndexInParent"), a4);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (unint64_t)mostVisibleAbsolutePageIndexForCanvasBoundsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController mostVisibleAbsolutePageIndexForCanvasBoundsRect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 686, CFSTR("Page number calculations performed in flow mode may be incorrect."));
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", MidX, CGRectGetMidY(v11));
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3
{
  return -[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, -[THSectionController presentationType](self, "presentationType"));
}

- (id)displaySectionInfoForRelativePageIndex:(unint64_t)a3
{
  id v5;
  THSectionInfo *v6;
  id v7;
  NSArray *v8;

  v5 = -[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", a3, -[THSectionController presentationType](self, "presentationType"));
  if (objc_msgSend(v5, "parent"))
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController displaySectionInfoForRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 697, CFSTR("invalid nil value for '%s'"), "pageInfo.parent");
    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController displaySectionInfoForRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 698, CFSTR("No page info found for navigation unit relative page %lu"), a3);
LABEL_3:
  v6 = objc_alloc_init(THSectionInfo);
  if (objc_msgSend(v5, "parent"))
    v7 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", objc_msgSend(v5, "parent"));
  else
    v7 = 0;
  -[THSectionInfo setPageController:](v6, "setPageController:", v7);
  if (v5)
    v8 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5);
  else
    v8 = +[NSArray array](NSArray, "array");
  -[THSectionInfo setPages:](v6, "setPages:", v8);
  -[THSectionInfo setAnchorAtOrigin:](v6, "setAnchorAtOrigin:", 1);
  -[THSectionController p_ensureLayoutThroughRelativePageRange:withLayoutController:](self, "p_ensureLayoutThroughRelativePageRange:withLayoutController:", a3, 1, 0);
  return v6;
}

- (CGRect)sectionRelativeCanvasRectForRelativePageIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __n128 v17;
  __n128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[THSectionController canvasRectForRelativePageIndex:](self, "canvasRectForRelativePageIndex:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[THSectionController sectionOriginForContentNode:](self, "sectionOriginForContentNode:", -[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", a3, -[THSectionController presentationType](self, "presentationType")));
  v14 = v13;
  v16 = v15;
  v17.n128_u64[0] = v6;
  v18.n128_u64[0] = v8;
  v19 = TSDSubtractPoints(v17, v18, v14, v16);
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (unint64_t)_navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  objc_msgSend(a3, "visibleUnscaledRect");
  return (unint64_t)-[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", 0);
}

- (unint64_t)absolutePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (unint64_t)_navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 734, CFSTR("Page number calculations performed in flow mode may be incorrect."));
  objc_msgSend(a3, "visibleUnscaledRect");
  v6 = v5;
  v8 = v7;
  v11 = TSDCenterOfRect(v5, v7, v9, v10);
  v14 = TSDRectWithOriginAndSize(v13, v6, v8, v11 - v6, v12 - v8);
  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", TSDCenterOfRect(v14, v15, v16, v17));
}

- (unint64_t)absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (unint64_t)_navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 756, CFSTR("Page number calculations performed in flow mode may be incorrect."));
  objc_msgSend(a3, "visibleUnscaledRect");
  v6 = v5;
  v8 = v7;
  v11 = TSDCenterOfRect(v5, v7, v9, v10);
  v14 = TSDRectWithOriginAndSize(v13, v11, v8, v11 - v6, v12 - v8);
  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", TSDCenterOfRect(v14, v15, v16, v17));
}

- (unint64_t)absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (unint64_t)_navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](self, "presentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 780, CFSTR("Page number calculations performed in flow mode may be incorrect."));
  objc_msgSend(a3, "visibleUnscaledRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[THSectionControllerDelegate isTwoUpForSectionController:](-[THSectionController delegate](self, "delegate"), "isTwoUpForSectionController:", self))v13 = v10 * 0.5;
  else
    v13 = v10;
  return -[THSectionController p_relativeSheetIndexFromCanvasPoint:](self, "p_relativeSheetIndexFromCanvasPoint:", TSDCenterOfRect(v6, v8, v13, v12));
}

- (unint64_t)absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (id)pageInfoForBeginningOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForBeginningOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (id)pageInfoForCenterOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForCenterOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (id)pageInfoForFirstQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (id)pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:(id)a3
{
  return -[THNavigationUnit pageInfoForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageInfoForRelativePageIndex:forPresentationType:", -[THSectionController _navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:](self, "_navigationUnitRelativePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (id)bodyAnchorForCanvasRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[THSectionController relativePageRangeForCanvasRect:pad:](self, "relativePageRangeForCanvasRect:pad:", 0);
  v9 = -[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", v8, -[THSectionController presentationType](self, "presentationType"));
  v10 = -[THNavigationUnit nodeRelativePageIndexInContentNode:forNavigationUnitRelativePageIndex:presentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "nodeRelativePageIndexInContentNode:forNavigationUnitRelativePageIndex:presentationType:", v9, v8, -[THSectionController presentationType](self, "presentationType"));
  if (v9)
    v11 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v9);
  else
    v11 = 0;
  -[THSectionController canvasRectForRelativePageIndex:](self, "canvasRectForRelativePageIndex:", v8);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "desiredPageSizeForRelativePageIndex:", v10);
  v19.size.width = v16;
  v19.size.height = v17;
  v19.origin.x = v13;
  v19.origin.y = v15;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v20 = CGRectIntersection(v19, v21);
  return -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", v9, objc_msgSend(v9, "nodeUniqueIDForInfo:forPresentationType:", objc_msgSend(v9, "bodyStorageForPresentationType:", -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType")), objc_msgSend(v11, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:", v10, TSDSubtractPoints((__n128)v20.origin, *(__n128 *)&v20.origin.y, v13, v15)), 1);
}

- (CGRect)rectForBodyAnchor:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = objc_msgSend(a3, "contentNode");
  objc_msgSend(v9, "waitUntilFinishedLoadingAndPaginating");
  if (v9)
    v10 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v9);
  else
    v10 = 0;
  v11 = objc_msgSend(v10, "relativePageIndexForCharIndex:forceLayout:", objc_msgSend(a3, "range"), 1);
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    if (-[THPagePositionController shouldEnablePaging](-[THSectionController pagePositionController](self, "pagePositionController"), "shouldEnablePaging"))
    {
      v13 = -[THNavigationUnit navUnitRelativePageIndexForContentNode:forContentNodeRelativePageIndex:presentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "navUnitRelativePageIndexForContentNode:forContentNodeRelativePageIndex:presentationType:", v9, v12, -[THSectionController presentationType](self, "presentationType"));
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[THSectionController canvasRectForRelativePageIndex:](self, "canvasRectForRelativePageIndex:", v13);
        x = v14;
        y = v15;
        width = v16;
        height = v17;
      }
    }
    else
    {
      objc_msgSend(v10, "originOfCharacterIndex:forRelativePageIndex:", objc_msgSend(a3, "range"), v12);
      x = TSDAddPoints(-[THSectionController canvasOriginForPageController:](self, "canvasOriginForPageController:", v10));
      y = v18;
      -[THPagePositionController pageSize](-[THSectionController pagePositionController](self, "pagePositionController"), "pageSize");
      width = v19;
      height = v20;
    }
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)rectForContentNode:(id)a3 layout:(id)a4
{
  CGFloat x;
  CGFloat y;
  _BOOL8 IsNull;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[THSectionController canvasOriginForPageController:](self, "canvasOriginForPageController:", -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", a3));
  objc_msgSend(objc_msgSend(a4, "geometry"), "frame");
  x = CGPointZero.x;
  y = CGPointZero.y;
  IsNull = CGRectIsNull(v16);
  if (!IsNull)
  {
    x = TSDAddPoints(IsNull);
    y = v9;
  }
  -[THPagePositionController pageSize](-[THSectionController pagePositionController](self, "pagePositionController"), "pageSize");
  v11 = v10;
  v13 = v12;
  v14 = x;
  v15 = y;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)absolutePageIndexForBodyStorageAnchor:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "contentNode");
  if (v5)
    v6 = -[TSUPointerKeyDictionary objectForKey:](-[THSectionController pageControllers](self, "pageControllers"), "objectForKey:", v5);
  else
    v6 = 0;
  return (unint64_t)objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(v6, "relativePageIndexForCharIndex:forceLayout:", objc_msgSend(a3, "range"), 1), -[THSectionController presentationType](self, "presentationType"));
}

- (unint64_t)relativePageIndexForBodyStorageAnchor:(id)a3
{
  return -[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", -[THSectionController absolutePageIndexForBodyStorageAnchor:](self, "absolutePageIndexForBodyStorageAnchor:", a3), -[THSectionController presentationType](self, "presentationType"));
}

- (unint64_t)relativePageIndexForStorageAnchor:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  v5 = objc_msgSend(a3, "contentNode");
  v7 = objc_opt_class(TSWPStorage, v6);
  v8 = (id)TSUDynamicCast(v7, objc_msgSend(v5, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](self, "presentationType")));
  if (!v8)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController relativePageIndexForStorageAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 937, CFSTR("failed to find storage with anchor's ID"));
  if (v8 == objc_msgSend(v5, "bodyStorageForPresentationType:", -[THSectionController presentationType](self, "presentationType")))v9 = -[THSectionController relativePageIndexForBodyStorageAnchor:](self, "relativePageIndexForBodyStorageAnchor:", a3);
  else
    v9 = -[THNavigationUnit relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(v5, "relativePageIndexForInfo:forPresentationType:", v8, -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType")), -[THSectionController presentationType](self, "presentationType"));
  v10 = v9;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController relativePageIndexForStorageAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 946, CFSTR("failed to find page number for storage anchor"));
  return v10;
}

- (id)p_contentNodeForBodyStorage:(id)a3 forceLoad:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  THPresentationType *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    v13 = -[THSectionController presentationType](self, "presentationType");
    v14 = v4
        ? objc_msgSend(v12, "bodyStorageForPresentationType:", v13)
        : objc_msgSend(objc_msgSend(v12, "nodeBodyForPresentationType:", v13), "bodyStorage");
    if (v14 == a3)
      return v12;
    if (v9 == (id)++v11)
    {
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4
{
  return -[THSectionController relativePageIndexForBodyStorage:charIndex:forceLoad:](self, "relativePageIndexForBodyStorage:charIndex:forceLoad:", a3, a4, 1);
}

- (unint64_t)relativePageIndexForBodyStorage:(id)a3 charIndex:(unint64_t)a4 forceLoad:(BOOL)a5
{
  id v7;

  v7 = -[THSectionController p_contentNodeForBodyStorage:forceLoad:](self, "p_contentNodeForBodyStorage:forceLoad:", a3, a5);
  if (v7)
    return -[THNavigationUnit navUnitRelativePageIndexForContentNode:forContentNodeRelativePageIndex:presentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "navUnitRelativePageIndexForContentNode:forContentNodeRelativePageIndex:presentationType:", v7, objc_msgSend(-[THSectionController pageControllerForContentNode:](self, "pageControllerForContentNode:", v7), "relativePageIndexForCharIndex:forceLayout:", a4, 1), -[THSectionController presentationType](self, "presentationType"));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)bodyInfoForStorage:(id)a3 charIndex:(unint64_t)a4
{
  id result;

  result = -[THSectionController p_contentNodeForBodyStorage:forceLoad:](self, "p_contentNodeForBodyStorage:forceLoad:", a3, 1);
  if (result)
    return objc_msgSend(-[THSectionController pageControllerForContentNode:](self, "pageControllerForContentNode:", result), "bodyInfoForCharIndex:forceLayout:", a4, 1);
  return result;
}

- (id)bodyInfoForStorage:(id)a3 anchoredCharIndex:(unint64_t)a4
{
  id result;

  result = -[THSectionController p_contentNodeForBodyStorage:forceLoad:](self, "p_contentNodeForBodyStorage:forceLoad:", a3, 1);
  if (result)
    return objc_msgSend(-[THSectionController pageControllerForContentNode:](self, "pageControllerForContentNode:", result), "bodyInfoForAnchoredCharIndex:forceLayout:", a4, 1);
  return result;
}

- (id)newPageControllerForContentNode:(id)a3
{
  return -[THPaginatedPageController initWithDelegate:contentNode:paginationController:presentationType:]([THPaginatedPageController alloc], "initWithDelegate:contentNode:paginationController:presentationType:", self, a3, -[THSectionController reflowablePaginationController](self, "reflowablePaginationController"), -[THSectionController presentationType](self, "presentationType"));
}

- (id)newSectionInfoForContentNode:(id)a3
{
  return objc_alloc_init(THSectionInfo);
}

- (CGSize)sectionSizeForContentNode:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = objc_msgSend(a3, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "startLoading");
    objc_msgSend(a3, "waitUntilFinishedLoadingAndPaginating");
    v5 = objc_msgSend(a3, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
  }
  -[THPagePositionController canvasSizeForPageCount:](-[THSectionController pagePositionController](self, "pagePositionController"), "canvasSizeForPageCount:", v5);
  v7 = v6;
  v9 = v8;
  if (-[THSectionControllerDelegate displaySinglePageChapterSeparately:](-[THSectionController delegate](self, "delegate"), "displaySinglePageChapterSeparately:", self)&& -[THSectionControllerDelegate isTwoUpForSectionController:](-[THSectionController delegate](self, "delegate"), "isTwoUpForSectionController:", self)&& (char *)-[THNavigationUnit pageCountForPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit"), "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType")) == (char *)&dword_0 + 1)
  {
    v7 = v7 + v7;
  }
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)p_contentNodeForRelativePageIndex:(unint64_t)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[THSectionController currentContentNodes](self, "currentContentNodes", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      v11 = (unint64_t)objc_msgSend(v10, "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
      v12 = a3 >= v11;
      a3 -= v11;
      if (!v12)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController p_contentNodeForRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 1071, CFSTR("Requested content node for out of bounds page index"));
    return 0;
  }
  return v10;
}

- (id)accessControllerForPageController:(id)a3
{
  return objc_msgSend(-[THSectionControllerDelegate documentRootForSectionController:](-[THSectionController delegate](self, "delegate", a3), "documentRootForSectionController:", self), "accessController");
}

- (void)pageControllerNeedsLayout:(id)a3
{
  -[THSectionControllerDelegate sectionControllerNeedsLayout:](-[THSectionController delegate](self, "delegate", a3), "sectionControllerNeedsLayout:", self);
}

- (CGPoint)canvasOriginForPageController:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[THSectionController sectionOriginForContentNode:](self, "sectionOriginForContentNode:", objc_msgSend(a3, "contentNode"));
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isCompactFlowPresentationForPageController:(id)a3
{
  return -[THSectionControllerDelegate isCompactFlowPresentationForSectionController:](-[THSectionController delegate](self, "delegate", a3), "isCompactFlowPresentationForSectionController:", self);
}

- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3
{
  return -[THNavigationUnit pageCountForPresentationType:](-[THSectionController currentNavigationUnit](self, "currentNavigationUnit", a3), "pageCountForPresentationType:", -[THSectionController presentationType](self, "presentationType"));
}

- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3
{
  return -[THSectionControllerDelegate displaySinglePageChapterSeparately:](-[THSectionController delegate](self, "delegate", a3), "displaySinglePageChapterSeparately:", self);
}

- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3
{
  return -[THSectionControllerDelegate isTwoUpForSectionController:](-[THSectionController delegate](self, "delegate", a3), "isTwoUpForSectionController:", self);
}

- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4
{
  return (unint64_t)objc_msgSend(objc_msgSend(a3, "contentNode"), "pageCountForPresentationType:", a4);
}

- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4
{
  return objc_msgSend(objc_msgSend(a3, "contentNode"), "bodyStorageForPresentationType:", a4);
}

- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5
{
  return objc_msgSend(objc_msgSend(a3, "contentNode"), "pageAtRelativeIndex:forPresentationType:", a4, a5);
}

- (id)layoutControllerForPageController:(id)a3
{
  return -[THSectionControllerDelegate layoutControllerForSectionController:](-[THSectionController delegate](self, "delegate", a3), "layoutControllerForSectionController:", self);
}

- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4
{
  return 1;
}

- (BOOL)allowsDescendersToClipForPageController:(id)a3
{
  return -[THSectionControllerDelegate allowsDescendersToClipForSectionController:](-[THSectionController delegate](self, "delegate", a3), "allowsDescendersToClipForSectionController:", self);
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3
{
  return -[THSectionControllerDelegate shouldAllowFinishingPartionedAttachmentLayoutForSectionController:](-[THSectionController delegate](self, "delegate", a3), "shouldAllowFinishingPartionedAttachmentLayoutForSectionController:", self);
}

- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3
{
  return -[THSectionControllerDelegate shouldScaleFlowLayoutsForSectionController:](-[THSectionController delegate](self, "delegate", a3), "shouldScaleFlowLayoutsForSectionController:", self);
}

- (CGPoint)canvasOriginDeltaForPageController:(id)a3
{
  double x;
  double y;
  CGPoint result;

  x = self->_canvasOriginDelta.x;
  y = self->_canvasOriginDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)layoutAnchorForContentOffset:(CGPoint)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.x, a3.y), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController layoutAnchorForContentOffset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 1158, CFSTR("layout anchors aren't supported by paginated section controller"));
  return 0;
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a6, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 1163, CFSTR("layout anchors aren't supported by paginated section controller"));
}

- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a4, a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController layoutContentFromBottom:layoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 1167, CFSTR("layout from bottom isn't supported by paginated section controller"));
}

- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionController firstLineInRect:forBodyAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionController.mm"), 1171, CFSTR("not for use by paginated section controller"));
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (void)clearCTCaches
{
  -[TSUPointerKeyDictionary enumerateKeysAndObjectsUsingBlock:](-[THSectionController pageControllers](self, "pageControllers"), "enumerateKeysAndObjectsUsingBlock:", &stru_427BD0);
}

- (THNavigationUnit)currentNavigationUnit
{
  return self->mCurrentNavigationUnit;
}

- (TSUPointerKeyDictionary)pageControllers
{
  return self->mPageControllers;
}

- (void)setPageControllers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSUPointerKeyDictionary)sectionInfos
{
  return self->mSectionInfos;
}

- (void)setSectionInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (THSectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THSectionControllerDelegate *)a3;
}

- (CGPoint)canvasOriginDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->_canvasOriginDelta.x;
  y = self->_canvasOriginDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCanvasOriginDelta:(CGPoint)a3
{
  self->_canvasOriginDelta = a3;
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (THPagePositionController)pagePositionController
{
  return self->_pagePositionController;
}

- (void)setPagePositionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setSearchTargetProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
