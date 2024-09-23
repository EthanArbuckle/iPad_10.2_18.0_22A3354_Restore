@implementation THPaginatedPageController

- (THPageHintController)pageHints
{
  THPageHintController *v3;

  objc_sync_enter(self);
  v3 = self->mPageHints;
  objc_sync_exit(self);
  return v3;
}

- (THPaginatedPageController)initWithDelegate:(id)a3 contentNode:(id)a4 paginationController:(id)a5 presentationType:(id)a6
{
  THPaginatedPageController *v10;
  THPaginatedPageController *v11;
  THSectionInfo *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THPaginatedPageController;
  v10 = -[THPaginatedPageController init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    -[THPaginatedPageController setDelegate:](v10, "setDelegate:", a3);
    -[THPaginatedPageController setContentNode:](v11, "setContentNode:", a4);
    -[THPaginatedPageController setPaginationController:](v11, "setPaginationController:", a5);
    v11->mPresentationType = (THPresentationType *)objc_msgSend(a6, "copyFixingSize");
    -[THPaginatedPageController setWrapController:](v11, "setWrapController:", objc_alloc_init(THBodyTextWrapController));
    v11->_drawablesLayoutController = -[THOffscreenLayoutController initWithCanvas:]([THOffscreenLayoutController alloc], "initWithCanvas:", 0);
    -[THOffscreenLayoutController setLayoutIsCompactWidth:](v11->_drawablesLayoutController, "setLayoutIsCompactWidth:", -[THPresentationType isCompactWidth](-[THPaginatedPageController presentationType](v11, "presentationType"), "isCompactWidth"));
    -[THOffscreenLayoutController setLayoutIsCompactHeight:](v11->_drawablesLayoutController, "setLayoutIsCompactHeight:", -[THPresentationType isCompactHeight](-[THPaginatedPageController presentationType](v11, "presentationType"), "isCompactHeight"));
    v12 = objc_alloc_init(THSectionInfo);
    v11->mOffscreenSectionInfo = v12;
    -[THSectionInfo setPageController:](v12, "setPageController:", v11);
    v11->mPageHints = objc_alloc_init(THPageHintController);
  }
  return v11;
}

- (void)teardown
{
  id v3;
  THPaginatedPageController *begin_node;
  THPageControllerDelegate *mDelegate;
  THPaginatedPageController *mContentNode;
  BOOL v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  objc_sync_enter(self);
  v3 = objc_alloc_init((Class)NSMutableArray);
  begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
  if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
  {
    do
    {
      objc_msgSend(v3, "addObject:", begin_node->mWrapController);
      mDelegate = begin_node->mDelegate;
      if (mDelegate)
      {
        do
        {
          mContentNode = (THPaginatedPageController *)mDelegate;
          mDelegate = *(THPageControllerDelegate **)mDelegate;
        }
        while (mDelegate);
      }
      else
      {
        do
        {
          mContentNode = (THPaginatedPageController *)begin_node->mContentNode;
          v7 = mContentNode->super.isa == (Class)begin_node;
          begin_node = mContentNode;
        }
        while (!v7);
      }
      begin_node = mContentNode;
    }
    while (mContentNode != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "removeFromParent");
      }
      v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");
  self->mWrapController = 0;

  self->_bodyLayoutManager = 0;
  self->_drawablesLayoutController = 0;

  self->mOffscreenSectionInfo = 0;
  self->mPageHints = 0;
  -[THPaginatedPageController setPresentationType:](self, "setPresentationType:", 0);
  -[THPaginatedPageController setContentNode:](self, "setContentNode:", 0);
  -[THPaginatedPageController setDelegate:](self, "setDelegate:", 0);
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_bodyLayoutManager || self->_drawablesLayoutController || self->mPageHints)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 186, CFSTR("someone forgot to call teardown"));

  self->mWrapController = 0;
  -[THPaginatedPageController setPresentationType:](self, "setPresentationType:", 0);
  -[THPaginatedPageController setContentNode:](self, "setContentNode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THPaginatedPageController;
  -[THPaginatedPageController dealloc](&v3, "dealloc");
}

- (void)p_updateWithPaginationResults
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  id v10;

  if (-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount"))
  {
    -[THPaginatedPageController p_validatePageHints](self, "p_validatePageHints");
  }
  else
  {
    v3 = -[THReflowablePaginationController paginationResultForContentNode:](-[THPaginatedPageController paginationController](self, "paginationController"), "paginationResultForContentNode:", -[THPaginatedPageController contentNode](self, "contentNode"));
    if (v3)
    {
      v4 = v3;
      v10 = objc_msgSend(objc_msgSend(v3, "pageHints"), "mutableCopy");
      self->_firstPageIndexNeedingLayout = (unint64_t)objc_msgSend(v10, "count");
      if (objc_msgSend(v4, "pageCount"))
      {
        v5 = 0;
        do
        {
          if (v5 >= (unint64_t)objc_msgSend(v10, "count"))
            break;
          v6 = -[THPaginatedPageController pageInfoForRelativePageIndex:](self, "pageInfoForRelativePageIndex:", v5);
          v7 = objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
          objc_msgSend(v6, "setPageStartCharIndex:", objc_msgSend(v7, "range"));
          v8 = (char *)objc_msgSend(v7, "range");
          objc_msgSend(v6, "setPageEndCharIndex:", &v8[v9]);
          objc_msgSend(v7, "range");
          ++v5;
        }
        while (v5 < (unint64_t)objc_msgSend(v4, "pageCount"));
      }
      -[THPageHintController setPageHints:](-[THPaginatedPageController pageHints](self, "pageHints"), "setPageHints:", v10);

    }
  }
}

- (void)clearLayout
{
  -[THPageHintController removeAllHints](-[THPaginatedPageController pageHints](self, "pageHints"), "removeAllHints");
  self->_firstPageIndexNeedingLayout = 0;
  -[THPaginatedPageController p_clearOffscreenLayouts](self, "p_clearOffscreenLayouts");
  -[TSWPLayoutManager clearTypesetterCache](self->_bodyLayoutManager, "clearTypesetterCache");
  -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");

  self->_bodyLayoutManager = 0;
}

- (void)clearCTCache
{
  -[TSWPLayoutManager clearTypesetterCache](self->_bodyLayoutManager, "clearTypesetterCache");
}

- (void)setPresentationType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualIncludingSize:", -[THPaginatedPageController presentationType](self, "presentationType")) & 1) == 0)
  {
    objc_sync_enter(self);

    self->mPresentationType = (THPresentationType *)objc_msgSend(a3, "copyFixingSize");
    -[THPaginatedPageController clearLayout](self, "clearLayout");
    objc_sync_exit(self);
  }
}

- (THPagePositionController)pagePositionController
{
  return (THPagePositionController *)-[THPageControllerDelegate pagePositionControllerForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "pagePositionControllerForPageController:", self);
}

- (void)layoutThroughRelativePageIndex:(unint64_t)a3 layoutController:(id)a4
{
  objc_sync_enter(self);
  -[THPaginatedPageController p_updateWithPaginationResults](self, "p_updateWithPaginationResults");
  -[THPaginatedPageController p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:](self, "p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:", a3, a4, 1);
  objc_sync_exit(self);
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanBackwardsFromPageIndex:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  unint64_t v16;
  _BOOL4 v18;

  if (!a3)
    return 0;
  v7 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
  if (v7 - 1 < a4)
    a4 = v7 - 1;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 < v7)
  {
    v9 = v7;
    while (1)
    {
      v10 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", a4);
      v12 = objc_opt_class(THPageHint, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v13 = objc_msgSend(v10, "range");
        if (!a4)
          break;
      }
      else
      {
        v13 = NSInvalidRange[0];
        v14 = NSInvalidRange[1];
        if (!a4)
          break;
      }
      if (v13 == NSInvalidRange[0] && v14 == NSInvalidRange[1])
        break;
      v16 = a3 - (_QWORD)v13;
      if ((id)a3 == v13)
      {
        v8 = a4;
      }
      else
      {
        v18 = a3 < (unint64_t)v13 || v16 >= (unint64_t)v14;
        LODWORD(v16) = v8 != 0x7FFFFFFFFFFFFFFFLL && v18;
        if (!v18)
          v8 = a4;
      }
      if (--a4 >= v9 || (_DWORD)v16)
        return v8;
    }
    if ((id)a3 == v13)
      return a4;
    if (a3 >= (unint64_t)v13 && a3 - (unint64_t)v13 < (unint64_t)v14)
      return a4;
  }
  return v8;
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 scanForwardsFromPageIndex:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  if (!(a4 | a3))
    return 0;
  v4 = a4;
  v7 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
  if (v7 <= v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  while (1)
  {
    v9 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v4);
    v11 = objc_opt_class(THPageHint, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      v12 = objc_msgSend(v9, "range");
    }
    else
    {
      v12 = NSInvalidRange[0];
      v13 = NSInvalidRange[1];
    }
    if ((id)a3 == v12)
      break;
    if (a3 >= (unint64_t)v12 && a3 - (unint64_t)v12 < (unint64_t)v13)
      break;
    if (++v4 >= v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;

  v4 = a4;
  objc_sync_enter(self);
  v7 = -[THPaginatedPageController p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:](self, "p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:", a3, v4, 0);
  objc_sync_exit(self);
  return v7;
}

- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;

  v4 = a4;
  objc_sync_enter(self);
  v7 = -[THPaginatedPageController p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:](self, "p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:", a3, 0, v4, 1);
  objc_sync_exit(self);
  return v7;
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", a3);
  objc_sync_exit(self);
  return v5;
}

- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  char *v14;
  id v15;
  unint64_t v16;

  v4 = a4;
  v7 = -[THPaginatedPageController relativePageIndexForCharIndex:forceLayout:](self, "relativePageIndexForCharIndex:forceLayout:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = v7;
  objc_sync_enter(self);
  v10 = -[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v9, v4, 0);
  if (v10
    && (v11 = objc_msgSend(-[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", v9), "modelBodyInfos"), (v12 = (char *)objc_msgSend(v10, "bodyCount")) != 0))
  {
    v13 = 0;
    v14 = v12 - 1;
    do
    {
      v8 = objc_msgSend(v11, "objectAtIndex:", v13);
      v15 = objc_msgSend(v10, "rangeForBodyIndex:", v13);
    }
    while ((a3 - (unint64_t)v15 >= v16 || a3 < (unint64_t)v15) && v14 != v13++);
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  char *v14;
  id v15;
  unint64_t v16;

  v4 = a4;
  v7 = -[THPaginatedPageController relativePageIndexForAnchoredCharIndex:forceLayout:](self, "relativePageIndexForAnchoredCharIndex:forceLayout:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = v7;
  objc_sync_enter(self);
  v10 = -[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v9, v4, 0);
  if (v10
    && (v11 = objc_msgSend(-[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", v9), "modelBodyInfos"), (v12 = (char *)objc_msgSend(v10, "bodyCount")) != 0))
  {
    v13 = 0;
    v14 = v12 - 1;
    do
    {
      v8 = objc_msgSend(v11, "objectAtIndex:", v13);
      v15 = objc_msgSend(v10, "anchoredRangeForBodyIndex:", v13);
    }
    while ((a3 - (unint64_t)v15 >= v16 || a3 < (unint64_t)v15) && v14 != v13++);
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  -[THPaginatedPageController p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:](self, "p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:", a4, -[THPageControllerDelegate layoutControllerForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "layoutControllerForPageController:", self), 0);
  -[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:](self, "p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:", a3, a4, 0);
  objc_sync_exit(self);
}

- (unint64_t)pageCount
{
  return (unint64_t)-[THPageControllerDelegate pageCountForPageController:presentationType:](-[THPaginatedPageController delegate](self, "delegate"), "pageCountForPageController:presentationType:", self, -[THPaginatedPageController presentationType](self, "presentationType"));
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD v10[5];
  CGRect v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_388E0;
  v10[3] = &unk_427900;
  v10[4] = &v12;
  v11 = a3;
  -[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:](self, "p_performBlock:withPageLayoutAtRelativeIndex:", v10, a4);
  v6 = v13[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_sync_enter(self);
    v7 = *((_QWORD *)objc_msgSend(-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", a4, 1, 1), "firstHint")+ 4);
    v8 = v13;
    v13[3] = v7;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 523, CFSTR("Found no hint for page that was not first"));
        v8 = v13;
      }
      v8[3] = 0;
    }
    objc_sync_exit(self);
    v6 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  uint64_t (*v13)();
  const char *v14;
  CGPoint v15;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x4012000000;
  v12 = sub_389F0;
  v13 = nullsub_18;
  v14 = "";
  v15 = CGPointZero;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_38A00;
  v8[3] = &unk_427928;
  v8[4] = &v9;
  v8[5] = a3;
  -[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:](self, "p_performBlock:withPageLayoutAtRelativeIndex:", v8, a4);
  v4 = v10[6];
  v5 = v10[7];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(objc_msgSend(-[THPaginatedPageController pageInfoForRelativePageIndex:](self, "pageInfoForRelativePageIndex:", a3), "geometry"), "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4
{
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  width = a4.size.width;
  -[THPagePositionController pageOriginForRelativePageIndex:](-[THPaginatedPageController pagePositionController](self, "pagePositionController", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "pageOriginForRelativePageIndex:", a3);
  v7 = v6;
  v9 = v8;
  if (-[THPageControllerDelegate displaySinglePageChapterSeparatelyForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "displaySinglePageChapterSeparatelyForPageController:", self)&& -[THPageControllerDelegate isTwoUpForNavigationUnitForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "isTwoUpForNavigationUnitForPageController:", self)&& -[THPageControllerDelegate pageCountForNavigationUnitForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "pageCountForNavigationUnitForPageController:", self) == (char *)&dword_0 + 1)
  {
    -[THPaginatedPageController i_rectForSectionLayout](self, "i_rectForSectionLayout");
    v7 = v7 + (v10 - width) * 0.5;
  }
  v11 = v7;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (void)layoutManagerNeedsLayout:(id)a3
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  void *firstPageIndexNeedingLayout;

  objc_sync_enter(self);
  -[THPaginatedPageController p_updateWithPaginationResults](self, "p_updateWithPaginationResults");
  v5 = (char *)objc_msgSend(a3, "dirtyRange");
  v6 = v5;
  v8 = v7;
  if (v5)
    v9 = v5 - 1;
  else
    v9 = 0;
  v10 = -[THPaginatedPageController p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:](self, "p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:", v9, 0, 0, 0);
  v11 = -[THPaginatedPageController p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:](self, "p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:", v6, 0, 0);
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  if (self->_firstPageIndexNeedingLayout)
  {
    v13 = -[THPaginatedPageController p_layoutEndCharIndex](self, "p_layoutEndCharIndex");
    v14 = (char *)objc_msgSend(objc_msgSend(a3, "storage"), "length");
    if (v6 == (char *)v13 && v8 == &v14[-v13])
    {
      firstPageIndexNeedingLayout = (void *)self->_firstPageIndexNeedingLayout;
      if (firstPageIndexNeedingLayout != (void *)-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController layoutManagerNeedsLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 600, CFSTR("_firstPageIndexNeedingLayout and self.pageHints.count should be equal"));
      if (self->_firstPageIndexNeedingLayout != 0x8000000000000000)
LABEL_14:
        -[THPaginatedPageController p_setNeedsLayoutOnPageIndex:](self, "p_setNeedsLayoutOnPageIndex:");
    }
  }
  -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");
  if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController layoutManagerNeedsLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 614, CFSTR("layout should not be complete after the layout manager claims to need layout"));
  objc_sync_exit(self);
}

- (id)textWrapper
{
  return -[THPaginatedPageController wrapController](self, "wrapController");
}

- (id)lineHintsForTarget:(id)a3
{
  uint64_t v4;
  id result;

  v4 = objc_opt_class(THBodyLayout, a2);
  result = (id)TSUDynamicCast(v4, a3);
  if (result)
    return objc_msgSend(objc_msgSend(result, "info"), "lineHints");
  return result;
}

- (void)layoutManager:(id)a3 didClearDirtyRangeWithDelta:(int64_t)a4 afterCharIndex:(unint64_t)a5
{
  unint64_t firstPageIndexNeedingLayout;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSNull *v11;

  if (!self->_doingLayout)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 643, CFSTR("should only clear dirty range during layout"));
  if (a4)
  {
    firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    v8 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints", a3, a4, a5), "pageCount");
    v9 = firstPageIndexNeedingLayout + 1;
    if (v9 < v8)
    {
      v10 = v8;
      do
      {
        v11 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v9);
        if (v11 != +[NSNull null](NSNull, "null"))
          -[NSNull offsetStartCharIndicesBy:](v11, "offsetStartCharIndicesBy:", a4);
        ++v9;
      }
      while (v10 != v9);
    }
  }
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayout
{
  return -[THPageControllerDelegate shouldAllowFinishingPartionedAttachmentLayoutForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "shouldAllowFinishingPartionedAttachmentLayoutForPageController:", self);
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  -[THPaginatedPageController layoutThroughRelativePageIndex:layoutController:](self, "layoutThroughRelativePageIndex:layoutController:", a3, -[THPageControllerDelegate layoutControllerForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "layoutControllerForPageController:", self));
  return -[THPaginatedPageController pageCount](self, "pageCount");
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  -[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:](self, "p_performBlock:withPageLayoutAtRelativeIndex:", a4, a3);
}

- (unint64_t)p_nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  THWPStorage *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  id v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v26;

  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v10 = a3 + 1;
    v11 = (char *)-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:");
    v9 = (unint64_t)&v11[v12];
    if (&v11[v12] == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_nextRootSearchTargetIndexFromIndex:forString:options:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 693, CFSTR("this page should have been laid out already"));
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v13 = -[THPaginatedPageController bodyStorage](self, "bodyStorage");
  v14 = -[THWPStorage length](v13, "length");
  if (v9 <= (unint64_t)v14)
    v15 = v14;
  else
    v15 = (_BYTE *)v9;
  if (v9 >= (unint64_t)v14)
    v16 = v14;
  else
    v16 = (_BYTE *)v9;
  v17 = objc_msgSend(-[THWPStorage string](v13, "string", v16, v15 - v16), "rangeOfString:searchOptions:updatingSearchRange:", a4, a5, &v26);
  if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = -[THPaginatedPageController relativePageIndexForCharIndex:forceLayout:](self, "relativePageIndexForCharIndex:forceLayout:", v17, 1);
  v18 = -[THWPStorage length](v13, "length");
  if (v9 <= (unint64_t)v18)
    v19 = v18;
  else
    v19 = (_BYTE *)v9;
  if (v9 >= (unint64_t)v18)
    v20 = v18;
  else
    v20 = (_BYTE *)v9;
  -[THWPStorage attachmentIndexRangeForTextRange:](v13, "attachmentIndexRangeForTextRange:", v20, v19 - v20);
  if (v21 && v10 < THMinIndex(-[THPaginatedPageController pageCount](self, "pageCount"), v8))
  {
    v22 = v10;
    do
    {
      v23 = -[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v22, 1, 0);
      if ((THSearchModelsForString(-[THWPStorage childEnumeratorForRange:](v13, "childEnumeratorForRange:", v23, v24), (uint64_t)a4, a5) & 1) != 0)
      {
        v8 = v22;
        break;
      }
      ++v22;
    }
    while (v22 < THMinIndex(-[THPaginatedPageController pageCount](self, "pageCount"), v8));
  }
  while (v10 < THMinIndex(-[THPaginatedPageController pageCount](self, "pageCount"), v8))
  {
    if ((THSearchModelChildrenForString((uint64_t)-[THPaginatedPageController pageInfoForRelativePageIndex:](self, "pageInfoForRelativePageIndex:", v10), (uint64_t)a4, a5) & 1) != 0)return v10;
    ++v10;
  }
  return v8;
}

- (unint64_t)p_previousRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5
{
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  THWPStorage *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;

  v9 = -[THPaginatedPageController pageCount](self, "pageCount");
  v10 = -[THWPStorage length](-[THPaginatedPageController bodyStorage](self, "bodyStorage"), "length");
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (uint64_t)v10;
    a3 = v9;
  }
  else
  {
    v13 = -[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", a3, 0, 0);
    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_previousRootSearchTargetIndexFromIndex:forString:options:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 748, CFSTR("this page should have been laid out already"));
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v12 = (uint64_t)v13;
    }
  }
  v14 = -[THPaginatedPageController bodyStorage](self, "bodyStorage");
  v15 = objc_msgSend(-[THWPStorage string](v14, "string", 0, v12), "rangeOfString:searchOptions:updatingSearchRange:", a4, a5 & 0xFFFFFFFFFFFFFFE3 | 4, &v23);
  if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    v11 = -[THPaginatedPageController relativePageIndexForCharIndex:forceLayout:](self, "relativePageIndexForCharIndex:forceLayout:", v15, 1);
  -[THWPStorage attachmentIndexRangeForTextRange:](v14, "attachmentIndexRangeForTextRange:", 0, v12);
  if (v16)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = 0;
    else
      v17 = v11 + 1;
    v18 = a3;
    while (v18 > v17)
    {
      v19 = -[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", --v18, 1, 0);
      if (THSearchModelsForString(-[THWPStorage childEnumeratorForRange:](v14, "childEnumeratorForRange:", v19, v20), (uint64_t)a4, a5))goto LABEL_17;
    }
  }
  v18 = v11;
LABEL_17:
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v21 = 0;
  else
    v21 = v18 + 1;
  while (a3 > v21)
  {
    if (THSearchModelChildrenForString((uint64_t)-[THPaginatedPageController pageInfoForRelativePageIndex:](self, "pageInfoForRelativePageIndex:", --a3), (uint64_t)a4, a5))return a3;
  }
  return v18;
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  unint64_t v11;
  unint64_t v12;

  objc_sync_enter(self);
  if (a6 == 1)
  {
    v11 = -[THPaginatedPageController p_previousRootSearchTargetIndexFromIndex:forString:options:](self, "p_previousRootSearchTargetIndexFromIndex:forString:options:", a3, a4, a5);
  }
  else
  {
    if (a6)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    v11 = -[THPaginatedPageController p_nextRootSearchTargetIndexFromIndex:forString:options:](self, "p_nextRootSearchTargetIndexFromIndex:forString:options:", a3, a4, a5);
  }
  v12 = v11;
LABEL_7:
  objc_sync_exit(self);
  return v12;
}

- (BOOL)p_isLayoutComplete
{
  unint64_t firstPageIndexNeedingLayout;

  firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  return firstPageIndexNeedingLayout == -[THPaginatedPageController pageCount](self, "pageCount");
}

- (THWPStorage)bodyStorage
{
  return (THWPStorage *)-[THPageControllerDelegate bodyStorageForPageController:presentationType:](-[THPaginatedPageController delegate](self, "delegate"), "bodyStorageForPageController:presentationType:", self, -[THPaginatedPageController presentationType](self, "presentationType"));
}

- (void)p_clearOffscreenLayouts
{
  -[THOffscreenLayoutController setInfos:](self->_drawablesLayoutController, "setInfos:", 0);
  -[THSectionInfo setPages:](self->mOffscreenSectionInfo, "setPages:", +[NSArray array](NSArray, "array"));
}

- (id)p_layoutManager
{
  id result;

  result = self->_bodyLayoutManager;
  if (!result)
  {
    result = objc_msgSend(objc_alloc((Class)TSWPLayoutManager), "initWithStorage:owner:", -[THPaginatedPageController bodyStorage](self, "bodyStorage"), self);
    self->_bodyLayoutManager = (TSWPLayoutManager *)result;
  }
  return result;
}

- (void)p_setNeedsLayoutOnPageIndex:(unint64_t)a3
{
  -[THPaginatedPageController p_invalidateBodyLayoutOnPageIndex:](self, "p_invalidateBodyLayoutOnPageIndex:", a3);
  -[THPageControllerDelegate pageControllerNeedsLayout:](-[THPaginatedPageController delegate](self, "delegate"), "pageControllerNeedsLayout:", self);
}

- (void)p_invalidateBodyLayoutOnPageIndex:(unint64_t)a3
{
  if (self->_firstPageIndexNeedingLayout > a3)
  {
    self->_firstPageIndexNeedingLayout = a3;
    -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");
  }
  -[THPageHintController clearHintsOnRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "clearHintsOnRelativePageIndex:", a3);
}

- (void)p_destroyBodyLayoutState
{
  if (self->_bodyLayoutState)
  {
    -[TSWPLayoutManager destroyLayoutState:](self->_bodyLayoutManager, "destroyLayoutState:");
    self->_bodyLayoutState = 0;
  }
}

- (id)p_lastValidPageHint
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  if (!self->_firstPageIndexNeedingLayout)
    return 0;
  v2 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", self->_firstPageIndexNeedingLayout - 1);
  v4 = objc_opt_class(THPageHint, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_lastValidPageHint]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 888, CFSTR("page hint before _firstPageIndexNeedingLayout isn't a page hint"));
  return v2;
}

- (unint64_t)p_layoutEndCharIndex
{
  id v2;
  uint64_t v3;

  v2 = -[THPaginatedPageController p_layoutEndRange](self, "p_layoutEndRange");
  return (unint64_t)v2 + v3;
}

- (_NSRange)p_layoutEndRange
{
  _QWORD *v2;
  _QWORD *v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  if (!self->_firstPageIndexNeedingLayout)
    goto LABEL_5;
  v2 = objc_msgSend(-[THPaginatedPageController p_lastValidPageHint](self, "p_lastValidPageHint"), "lastHint");
  if (!v2)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutEndRange]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 910, CFSTR("should have found a last hint"));
LABEL_5:
    v5 = 0;
    v4 = 0;
    goto LABEL_6;
  }
  v3 = v2;
  v4 = v2[4];
  v5 = v3[5];
LABEL_6:
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)p_layoutEndAnchoredRange
{
  _QWORD *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (self->_firstPageIndexNeedingLayout)
  {
    v2 = objc_msgSend(-[THPaginatedPageController p_lastValidPageHint](self, "p_lastValidPageHint"), "lastHint");
    if (!v2)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutEndAnchoredRange]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 930, CFSTR("should have found a last hint"));
    v3 = v2[7];
    v4 = v2[8];
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)p_stubHintAtRelativePageIndex:(SEL)a3
{
  $76C9DF09DF30CB4FBD89D11B5573AD82 *v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _NSRange var3;
  CGSize size;

  v4 = self;
  v6 = a4 - 1;
  v7 = a4 + 1;
  while (--v7)
  {
    self = ($76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(objc_msgSend(-[$76C9DF09DF30CB4FBD89D11B5573AD82 pageHints](v4, "pageHints"), "hintForRelativePageIndex:", v6), "lastHint");
    if (self)
    {
      v8 = self->var1.length + self->var1.location;
      retstr->var2 = v8;
      retstr->var3.location = v8;
      retstr->var3.length = 0;
      var3 = retstr->var3;
      goto LABEL_6;
    }
  }
  retstr->var3.length = 0;
  var3 = (_NSRange)0;
  *(_OWORD *)&retstr->var2 = 0u;
LABEL_6:
  retstr->var1 = var3;
  size = CGRectNull.size;
  retstr->var0.origin = CGRectNull.origin;
  retstr->var0.size = size;
  retstr->var4 = 0;
  return self;
}

- (id)p_updateHintAtIndex:(unint64_t)a3 withBodyTargets:(id)a4
{
  unint64_t v6;
  THPageHintController *v7;
  unint64_t v8;
  THPageHint *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _OWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  void *__p;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];

  if (self->_firstPageIndexNeedingLayout != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 974, CFSTR("updating a surprising page index"));
  v6 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
  v7 = -[THPaginatedPageController pageHints](self, "pageHints");
  v8 = a3;
  if (v6 <= a3)
  {
    if (-[THPageHintController pageCount](v7, "pageCount") != a3)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 983, CFSTR("updating hints out of order"));
    v9 = 0;
    v8 = a3;
  }
  else
  {
    v9 = -[THPageHintController hintForRelativePageIndex:](v7, "hintForRelativePageIndex:", a3);
  }
  v23 = -[THPageControllerDelegate pageInfoForPageController:pageIndex:presentationType:](-[THPaginatedPageController delegate](self, "delegate"), "pageInfoForPageController:pageIndex:presentationType:", self, v8, -[THPaginatedPageController presentationType](self, "presentationType"));
  if (!v9 || v9 == (THPageHint *)+[NSNull null](NSNull, "null"))
  {
    v9 = -[THPageHint initWithPageInfo:]([THPageHint alloc], "initWithPageInfo:", v23);
    -[THPageHintController setHint:forRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "setHint:forRelativePageIndex:", v9, v8);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v10)
  {
    -[THPageHint setNonEmptyBodyCount:](v9, "setNonEmptyBodyCount:", 0);
    goto LABEL_29;
  }
  v11 = 0;
  v12 = *(_QWORD *)v36;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v36 != v12)
        objc_enumerationMutation(a4);
      v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
      if (!objc_msgSend(objc_msgSend(v14, "columns"), "count"))
      {
        v11 += (uint64_t)i;
        goto LABEL_25;
      }
      __p = 0;
      v33 = 0;
      v34 = 0;
      v39 = 0;
      v40 = 0;
      v31 = 0;
      v31 = +[TSURetainedPointerKeyDictionary dictionary](TSURetainedPointerKeyDictionary, "dictionary");
      objc_msgSend(-[THPaginatedPageController p_layoutManager](self, "p_layoutManager"), "deflateTarget:intoHints:childHints:anchoredAttachmentPositions:topicNumbers:layoutState:", v14, &__p, &v39, &v31, -[THPageHint topicNumbers](v9, "topicNumbers"), self->_bodyLayoutState);
      if (v33 == __p)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1005, CFSTR("Failed to deflate into hints"));
      -[THPageHint setAnchoredAttachmentPositions:forBodyIndex:](v9, "setAnchoredAttachmentPositions:forBodyIndex:", v31, (char *)i + v11);
      -[THPageHint setHints:forBodyIndex:](v9, "setHints:forBodyIndex:", &__p, (char *)i + v11);
      -[THPageHint setFirstChildHint:forBodyIndex:](v9, "setFirstChildHint:forBodyIndex:", v39, (char *)i + v11);
      -[THPageHint setLastChildHint:forBodyIndex:](v9, "setLastChildHint:forBodyIndex:", v40, (char *)i + v11);
      if (__p)
      {
        v33 = __p;
        operator delete(__p);
      }
    }
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    v11 += (uint64_t)i;
    if (v10)
      continue;
    break;
  }
LABEL_25:
  -[THPageHint setNonEmptyBodyCount:](v9, "setNonEmptyBodyCount:", v11);
  if (!v11)
  {
    if (!self)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
LABEL_30:
      v25[2] = v28;
      v25[3] = v29;
      v25[4] = v30;
      v25[0] = v26;
      v25[1] = v27;
      -[THPageHint setBodylessStubHint:](v9, "setBodylessStubHint:", v25);
      goto LABEL_31;
    }
LABEL_29:
    -[THPaginatedPageController p_stubHintAtRelativePageIndex:](self, "p_stubHintAtRelativePageIndex:", a3);
    goto LABEL_30;
  }
LABEL_31:
  if ((objc_opt_respondsToSelector(self->mDelegate, "wantsPageCharIndicesFilledForPageController:") & 1) != 0
    && -[THPageControllerDelegate wantsPageCharIndicesFilledForPageController:](self->mDelegate, "wantsPageCharIndicesFilledForPageController:", self))
  {
    v17 = NSInvalidRange[0];
    v16 = NSInvalidRange[1];
    if (v17 == -[THPageHint range](v9, "range") && v16 == v18)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1026, CFSTR("Failed to get page character range."));
    if (!v23)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1027, CFSTR("invalid nil value for '%s'"), "pageInfo");
    objc_msgSend(v23, "setPageStartCharIndex:", -[THPageHint range](v9, "range"));
    v19 = (char *)-[THPageHint range](v9, "range");
    objc_msgSend(v23, "setPageEndCharIndex:", &v19[v20]);
  }
  if (!v9)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1033, CFSTR("failed to create a page hint"));
  v21 = objc_opt_class(THPageHint, v15);
  if ((objc_opt_isKindOfClass(v9, v21) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1034, CFSTR("page hint is the wrong class"));
  if (-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount") <= a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1035, CFSTR("we don't have a page hint for this page"));
  return v9;
}

- (BOOL)p_generateHintForPageIndex:(unint64_t)a3
{
  THPaginatedPageController *v4;
  id v5;
  __objc2_class **p_superclass;
  THPageHint *v7;
  id v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  double *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  double v29;
  char *begin_node;
  char *left;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double *v39;
  _BOOL4 v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unint64_t v47;
  THPaginatedPageController *v48;
  TSWPTopicNumberHints __p;
  _OWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v4 = self;
  v5 = -[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:");
  p_superclass = &OBJC_METACLASS___KPFGingerEffect.superclass;
  v7 = -[THPageHint initWithPageInfo:]([THPageHint alloc], "initWithPageInfo:", v5);
  v8 = objc_msgSend(v5, "modelBodyInfos");
  v9 = (char *)objc_msgSend(v8, "count");
  if (!v9)
    goto LABEL_25;
  v10 = v9;
  v47 = a3;
  v48 = v4;
  v11 = 0;
  while (1)
  {
    v12 = objc_msgSend(v8, "objectAtIndex:", v11);
    v13 = objc_msgSend(v12, "lineHints");
    if (!v13)
      break;
    v14 = v13;
    if ((objc_msgSend(v13, "valid") & 1) == 0)
      break;
    if (objc_msgSend(v14, "hintsCount"))
    {
      v15 = objc_msgSend(v14, "hints");
      v16 = (char *)objc_msgSend(v14, "hints");
      v17 = &v16[56 * (_QWORD)objc_msgSend(v14, "hintsCount")];
      objc_msgSend(objc_msgSend(v12, "geometry"), "boundsBeforeRotation");
      v18 = v15[4];
      v19 = *((_QWORD *)v17 - 3);
      v20 = *((_QWORD *)v17 - 2);
      v21 = objc_msgSend(objc_msgSend(v12, "columnStyle"), "columnCount");
      memset(&__p, 0, 24);
      v22 = (double *)sub_3C97C((uint64_t)&__p._numbersForListStyle.__tree_.__pair3_, 1uLL);
      v23 = v22;
      v25 = v24;
      v26 = v20 + v19;
      v27 = v18 >= v20 + v19;
      if (v18 <= v20 + v19)
        v28 = v20 + v19;
      else
        v28 = v18;
      if (v27)
        v18 = v26;
      v29 = TSDRectWithSize(v22);
      begin_node = (char *)__p._numbersForListStyle.__tree_.__begin_node_;
      left = (char *)__p._numbersForListStyle.__tree_.__pair1_.__value_.__left_;
      *v23 = v29;
      *((_QWORD *)v23 + 1) = v32;
      *((_QWORD *)v23 + 2) = v33;
      *((_QWORD *)v23 + 3) = v34;
      *((_QWORD *)v23 + 4) = v18;
      *((_QWORD *)v23 + 5) = v28 - v18;
      *((_QWORD *)v23 + 6) = v28;
      *((_QWORD *)v23 + 7) = v18;
      *((_QWORD *)v23 + 8) = v28 - v18;
      *((_QWORD *)v23 + 9) = v21;
      if (left == begin_node)
      {
        v39 = v23;
      }
      else
      {
        v35 = v23;
        do
        {
          *((_OWORD *)v35 - 5) = *((_OWORD *)left - 5);
          v36 = *((_OWORD *)left - 4);
          v37 = *((_OWORD *)left - 3);
          v38 = *((_OWORD *)left - 1);
          v39 = v35 - 10;
          *((_OWORD *)v35 - 2) = *((_OWORD *)left - 2);
          *((_OWORD *)v35 - 1) = v38;
          *((_OWORD *)v35 - 4) = v36;
          *((_OWORD *)v35 - 3) = v37;
          left -= 80;
          v35 -= 10;
        }
        while (left != begin_node);
      }
      __p._numbersForListStyle.__tree_.__begin_node_ = v39;
      __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = v23 + 10;
      __p._numbersForListStyle.__tree_.__pair3_.__value_ = (unint64_t)&v23[10 * v25];
      if (begin_node)
        operator delete(begin_node);
      __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = v23 + 10;
      -[THPageHint setHints:forBodyIndex:](v7, "setHints:forBodyIndex:", &__p, v11++);
      -[THPageHint setNonEmptyBodyCount:](v7, "setNonEmptyBodyCount:", v11);
      if (__p._numbersForListStyle.__tree_.__begin_node_)
      {
        __p._numbersForListStyle.__tree_.__pair1_.__value_.__left_ = __p._numbersForListStyle.__tree_.__begin_node_;
        operator delete(__p._numbersForListStyle.__tree_.__begin_node_);
      }
      if (v11 != v10)
        continue;
    }
    v40 = 1;
    a3 = v47;
    v4 = v48;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS___KPFGingerEffect + 8);
    goto LABEL_26;
  }
  v4 = v48;
  v41 = -[THReflowablePaginationController paginationResultForContentNode:](-[THPaginatedPageController paginationController](v48, "paginationController"), "paginationResultForContentNode:", -[THPaginatedPageController contentNode](v48, "contentNode"));
  p_superclass = &OBJC_METACLASS___KPFGingerEffect.superclass;
  if (v41)
  {
    v42 = objc_msgSend(v41, "pageHints");

    a3 = v47;
    v7 = (THPageHint *)objc_msgSend(v42, "objectAtIndexedSubscript:", v47);
LABEL_25:
    v40 = 1;
    goto LABEL_26;
  }
  v40 = 0;
  a3 = v47;
LABEL_26:
  if (objc_msgSend(v8, "count"))
  {
    if (!v40)
      goto LABEL_37;
  }
  else
  {
    if (v4)
    {
      -[THPaginatedPageController p_stubHintAtRelativePageIndex:](v4, "p_stubHintAtRelativePageIndex:", a3);
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v51 = 0u;
    }
    v50[2] = v53;
    v50[3] = v54;
    v50[4] = v55;
    v50[0] = v51;
    v50[1] = v52;
    -[THPageHint setBodylessStubHint:](v7, "setBodylessStubHint:", v50);
    if (!v40)
      goto LABEL_37;
  }
  TSWPTopicNumberHints::TSWPTopicNumberHints(&__p, 0);
  if (a3)
  {
    v44 = objc_opt_class(p_superclass + 254, v43);
    v45 = (void *)TSUDynamicCast(v44, -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](v4, "pageHints"), "hintForRelativePageIndex:", a3 - 1));
    if (v45)
      TSWPTopicNumberHints::operator=(&__p, objc_msgSend(v45, "topicNumbers"));
  }
  TSWPTopicNumberHints::advanceToCharIndex(&__p, *((_QWORD *)-[THPageHint firstHint](v7, "firstHint") + 4), (TSWPStorage *)-[THPaginatedPageController bodyStorage](v4, "bodyStorage"));
  -[THPageHint setTopicNumbers:](v7, "setTopicNumbers:", &__p);
  -[THPageHintController setHint:forRelativePageIndex:](-[THPaginatedPageController pageHints](v4, "pageHints"), "setHint:forRelativePageIndex:", v7, a3);
  TSWPTopicNumberHints::~TSWPTopicNumberHints(&__p);
LABEL_37:

  return v40;
}

- (void)p_insertPageLayoutIntoCache:(id)a3
{
  id v5;
  unint64_t v6[2];

  if (!objc_msgSend(a3, "layoutController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_insertPageLayoutIntoCache:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1143, CFSTR("invalid nil value for '%s'"), "pageLayout.layoutController");
  v5 = objc_msgSend(objc_msgSend(a3, "info"), "relativePageIndexInParent");
  if (self->_pageLayoutCache.__tree_.__pair3_.__value_ >= 0x10)
    -[THPaginatedPageController p_clearOffscreenLayouts](self, "p_clearOffscreenLayouts");
  v6[0] = (unint64_t)v5;
  v6[1] = (unint64_t)a3;
  sub_3C9C0((uint64_t **)&self->_pageLayoutCache, v6);
}

- (void)p_removeOrphanedLayoutsFromCache
{
  uint64_t **p_pageLayoutCache;
  THPaginatedPageController *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  THPageHintController **v13;
  THPageHintController *v14;
  THPageControllerDelegate *mDelegate;
  THModelContentNode *mContentNode;
  BOOL v17;
  unint64_t *v18;
  unint64_t *v19;
  unint64_t *__p;
  unint64_t *v21;
  unint64_t *v22;

  __p = 0;
  v21 = 0;
  v22 = 0;
  p_pageLayoutCache = (uint64_t **)&self->_pageLayoutCache;
  begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
  {
    do
    {
      if (!-[THBodyTextWrapController layoutController](begin_node->mWrapController, "layoutController"))
      {
        v5 = v21;
        if (v21 >= v22)
        {
          v7 = __p;
          v8 = v21 - __p;
          v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61)
            sub_36C30();
          v10 = (char *)v22 - (char *)__p;
          if (((char *)v22 - (char *)__p) >> 2 > v9)
            v9 = v10 >> 2;
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
            v11 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v11 = v9;
          if (v11)
          {
            v12 = (char *)sub_3CC38((uint64_t)&v22, v11);
            v7 = __p;
            v5 = v21;
          }
          else
          {
            v12 = 0;
          }
          v13 = (THPageHintController **)&v12[8 * v8];
          *v13 = begin_node->mPageHints;
          v6 = (unint64_t *)(v13 + 1);
          while (v5 != v7)
          {
            v14 = (THPageHintController *)*--v5;
            *--v13 = v14;
          }
          __p = (unint64_t *)v13;
          v22 = (unint64_t *)&v12[8 * v11];
          if (v7)
            operator delete(v7);
        }
        else
        {
          *v21 = (unint64_t)begin_node->mPageHints;
          v6 = v21 + 1;
        }
        v21 = v6;
      }
      mDelegate = begin_node->mDelegate;
      if (mDelegate)
      {
        do
        {
          mContentNode = (THModelContentNode *)mDelegate;
          mDelegate = *(THPageControllerDelegate **)mDelegate;
        }
        while (mDelegate);
      }
      else
      {
        do
        {
          mContentNode = begin_node->mContentNode;
          v17 = *(_QWORD *)mContentNode->super.TSPObject_opaque == (_QWORD)begin_node;
          begin_node = (THPaginatedPageController *)mContentNode;
        }
        while (!v17);
      }
      begin_node = (THPaginatedPageController *)mContentNode;
    }
    while (mContentNode != (THModelContentNode *)p_pair1);
    v19 = __p;
    v18 = v21;
    if (__p != v21)
    {
      do
        sub_3CC6C(p_pageLayoutCache, v19++);
      while (v19 != v21);
      v18 = __p;
    }
    if (v18)
      operator delete(v18);
  }
}

- (void)p_removePageLayoutFromCache:(id)a3
{
  id v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v9;
  unint64_t v10;
  BOOL v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v14;
  BOOL v15;

  v5 = objc_msgSend(objc_msgSend(a3, "info"), "relativePageIndexInParent");
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  v6 = left;
  if (left)
  {
    v9 = p_pair1;
    do
    {
      v10 = (unint64_t)v6[4].__value_.__left_;
      v11 = v10 >= (unint64_t)v5;
      if (v10 >= (unint64_t)v5)
        v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v6;
      else
        v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&v6[1];
      if (v11)
        v9 = v6;
      v6 = *v12;
    }
    while (*v12);
    if (v9 != p_pair1)
    {
      while (v5 == v9[4].__value_.__left_)
      {
        if (v9[5].__value_.__left_ == a3)
        {
          sub_3CD7C((uint64_t **)&p_pair1[-1], (uint64_t *)v9);
          operator delete(v9);
          return;
        }
        v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v9[1].__value_.__left_;
        if (v13)
        {
          do
          {
            v14 = v13;
            v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v13->__value_.__left_;
          }
          while (v13);
        }
        else
        {
          do
          {
            v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v9[2].__value_.__left_;
            v15 = v14->__value_.__left_ == v9;
            v9 = v14;
          }
          while (!v15);
        }
        v9 = v14;
        if (v14 == p_pair1)
          return;
      }
    }
  }
}

- (id)p_cachedPageLayoutForPageIndex:(unint64_t)a3 preferredLayoutController:(id)a4
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v8;
  unint64_t v9;
  BOOL v10;
  char **v11;
  void *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **v14;
  BOOL v15;

  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  left = (char *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return 0;
  v8 = &self->_pageLayoutCache.__tree_.__pair1_;
  do
  {
    v9 = *((_QWORD *)left + 4);
    v10 = v9 >= a3;
    if (v9 >= a3)
      v11 = (char **)left;
    else
      v11 = (char **)(left + 8);
    if (v10)
      v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)left;
    left = *v11;
  }
  while (*v11);
  if (v8 == p_pair1 || v8[4].__value_.__left_ != (void *)a3)
    return 0;
  do
  {
    v12 = v8[5].__value_.__left_;
    if (!a4 || objc_msgSend(v8[5].__value_.__left_, "layoutController") == a4)
      break;
    v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[1].__value_.__left_;
    v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v8;
    if (v13)
    {
      do
      {
        v8 = v13;
        v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v13->__value_.__left_;
      }
      while (v13);
    }
    else
    {
      do
      {
        v8 = v14[2];
        v15 = v8->__value_.__left_ == v14;
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)v8;
      }
      while (!v15);
    }
  }
  while (v8 != p_pair1 && v8[4].__value_.__left_ == (void *)a3);
  return v12;
}

- (void)p_performBlock:(id)a3 withPageLayoutAtRelativeIndex:(unint64_t)a4 preferredLayoutController:(id)a5
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (self->_firstPageIndexNeedingLayout < a4
    && (!-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete")
     || -[THPaginatedPageController pageCount](self, "pageCount") < a4))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1256, CFSTR("trying to generate a layout for a page past where we need layout"));
  }
  v9 = -[THPaginatedPageController p_cachedPageLayoutForPageIndex:preferredLayoutController:](self, "p_cachedPageLayoutForPageIndex:preferredLayoutController:", a4, a5);
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "layoutController"))
    {
      objc_msgSend(objc_msgSend(v10, "layoutController"), "validateLayoutWithDependencies:", v10);
      goto LABEL_16;
    }
    -[THPaginatedPageController p_removeOrphanedLayoutsFromCache](self, "p_removeOrphanedLayoutsFromCache");
  }
  v11 = -[THPaginatedPageController p_pageInfoForPageAtRelativeIndex:](self, "p_pageInfoForPageAtRelativeIndex:", a4);
  if (v11)
  {
    -[THSectionInfo setPages:](self->mOffscreenSectionInfo, "setPages:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
    -[THOffscreenLayoutController setInfos:](self->_drawablesLayoutController, "setInfos:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->mOffscreenSectionInfo));
    -[THPaginatedPageController p_removeOrphanedLayoutsFromCache](self, "p_removeOrphanedLayoutsFromCache");
    -[THOffscreenLayoutController validateLayouts](self->_drawablesLayoutController, "validateLayouts");
    v12 = -[THPaginatedPageController p_cachedPageLayoutForPageIndex:preferredLayoutController:](self, "p_cachedPageLayoutForPageIndex:preferredLayoutController:", a4, 0);
    if (v12)
    {
      v10 = v12;
      v13 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "info"), "modelBodyInfos"), "count");
      if (v13 != objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count"))
      {
        v14 = objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count");
        if (v14 != objc_msgSend(objc_msgSend(objc_msgSend(v10, "info"), "modelBodyInfos"), "count"))
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL verifyPageLayout(THPageLayout *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 116, CFSTR("Body layout count = %lu, Body info count = %lu"), objc_msgSend(objc_msgSend(v10, "bodyLayouts"), "count"), objc_msgSend(objc_msgSend(objc_msgSend(v10, "info"), "modelBodyInfos"), "count"));
      }
      goto LABEL_16;
    }
  }
  else if (!-[THPageControllerDelegate pageInfoForPageController:pageIndex:presentationType:](-[THPaginatedPageController delegate](self, "delegate"), "pageInfoForPageController:pageIndex:presentationType:", self, a4, -[THPaginatedPageController presentationType](self, "presentationType")))
  {
    return;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1304, CFSTR("should have found or created a page layout"));
  v10 = 0;
LABEL_16:
  (*((void (**)(id, void *))a3 + 2))(a3, v10);
}

- (id)p_pageInfoForPageAtRelativeIndex:(unint64_t)a3
{
  return -[THPageControllerDelegate pageInfoForPageController:pageIndex:presentationType:](-[THPaginatedPageController delegate](self, "delegate"), "pageInfoForPageController:pageIndex:presentationType:", self, a3, -[THPaginatedPageController presentationType](self, "presentationType"));
}

- (unint64_t)p_relativePageIndexForCharIndex:(unint64_t)a3 caretAffinity:(int)a4 forceLayout:(BOOL)a5 searchAfterLayoutPoint:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  THWPStorage *v11;
  THWPStorage *v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v26;

  v6 = a6;
  v7 = a5;
  v11 = -[THPaginatedPageController bodyStorage](self, "bodyStorage");
  if (a3 && (v12 = v11, (unint64_t)-[THWPStorage length](v11, "length") > a3))
  {
    v13 = -[THWPStorage characterAtIndex:](v12, "characterAtIndex:", a3 - 1);
    v14 = IsParagraphBreakingCharacter();
    if (v13 == 8232)
      v15 = 1;
    else
      v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
  v17 = 0;
  if (a4 != 1)
    v15 = 1;
  v26 = v15;
  while (1)
  {
    v18 = (unint64_t)-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v17, v7, v6);
    v19 = v18;
    v21 = v20;
    if (v18 | v20)
    {
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v6)
          return v22;
        v23 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
        if (a3 < 0x7FFFFFFFFFFFFFFFLL || v17 >= v23)
          return v22;
        goto LABEL_21;
      }
    }
    else if (!-[THModelContentNode isLoaded](-[THPaginatedPageController contentNode](self, "contentNode"), "isLoaded"))
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v19 > a3 && !v6)
      break;
    if (v19 > a3)
      return 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
    v16 += v21;
    v22 = v17;
    if (v19 + v21 <= a3)
    {
      v24 = v19 + v21 == a3 ? v26 : 0;
      v22 = v19 + v21 == a3 ? v17 : 0x7FFFFFFFFFFFFFFFLL;
      if (v24 == 1)
      {
        if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete")
          && v17 == -[THPaginatedPageController p_lastPageIndexWithBodyAfterPageIndex:](self, "p_lastPageIndexWithBodyAfterPageIndex:", v17))
        {
          v22 = v17;
          if (!(v16 | a3))
            return 0;
        }
        else
        {
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    ++v17;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      return v22;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_relativePageIndexForCharIndex:caretAffinity:forceLayout:searchAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1350, CFSTR("charIndex is before this page, but we haven't returned yet"));
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)p_lastPageIndexWithBodyAfterPageIndex:(unint64_t)a3
{
  THPageHintController *v4;
  char *v5;

  v4 = -[THPaginatedPageController pageHints](self, "pageHints");
  v5 = -[THPageHintController pageCount](v4, "pageCount");
  do
  {
    if ((unint64_t)v5 <= a3)
      break;
    --v5;
  }
  while (!objc_msgSend(-[THPageHintController hintForRelativePageIndex:](v4, "hintForRelativePageIndex:", v5), "bodyCount"));
  return (unint64_t)v5;
}

- (id)p_pageHintForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  uint64_t v10;
  id result;

  v5 = a5;
  if (a4)
    -[THPaginatedPageController layoutThroughRelativePageIndex:layoutController:](self, "layoutThroughRelativePageIndex:layoutController:", a3, -[THPageControllerDelegate layoutControllerForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "layoutControllerForPageController:", self));
  if (self->_firstPageIndexNeedingLayout <= a3 && !v5)
    return 0;
  if (!v5
    && -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount") <= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1421, CFSTR("we should need layout at this index if we don't have a page hint for it"));
  }
  if (-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount") <= a3)
    return 0;
  v10 = objc_opt_class(THPageHint, v9);
  result = (id)TSUDynamicCast(v10, -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", a3));
  if (!v5 && !result)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1425, CFSTR("page hint prior to _firstPageIndexNeedingLayout should be a THPageHint"));
    return 0;
  }
  return result;
}

- (_NSRange)p_bodyRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  id v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v5 = -[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", a3, a4, a5);
  if (!v5)
  {
    v15 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "firstHint");
  v8 = objc_msgSend(v6, "lastHint");
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1443, CFSTR("invalid nil value for '%s'"), "firstHint");
    if (v9)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_bodyRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1444, CFSTR("invalid nil value for '%s'"), "lastHint");
    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_13;
LABEL_4:
  v10 = v7[4];
  v11 = v9[5];
  v12 = v11 + v9[4];
  if (v10 <= v12)
    v13 = v11 + v9[4];
  else
    v13 = v7[4];
  if (v10 >= v12)
    v14 = v12;
  else
    v14 = v7[4];
  v15 = v13 - v14;
LABEL_14:
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)p_anchoredRangeForRelativePageIndex:(unint64_t)a3 forceLayout:(BOOL)a4 allowAfterLayoutPoint:(BOOL)a5
{
  id v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v5 = -[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", a3, a4, a5);
  if (!v5)
  {
    v15 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "firstHint");
  v8 = objc_msgSend(v6, "lastHint");
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1462, CFSTR("invalid nil value for '%s'"), "firstHint");
    if (v9)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1463, CFSTR("invalid nil value for '%s'"), "lastHint");
    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_13;
LABEL_4:
  v10 = v7[7];
  v11 = v9[8];
  v12 = v11 + v9[7];
  if (v10 <= v12)
    v13 = v11 + v9[7];
  else
    v13 = v7[7];
  if (v10 >= v12)
    v14 = v12;
  else
    v14 = v7[7];
  v15 = v13 - v14;
LABEL_14:
  result.length = v15;
  result.location = v14;
  return result;
}

- (unint64_t)p_relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4 searchAfterLayoutPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  unint64_t i;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = a5;
  v6 = a4;
  for (i = 0; ; ++i)
  {
    v10 = (char *)-[THPaginatedPageController p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_anchoredRangeForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", i, v6, v5);
    v11 = v10;
    v13 = v12;
    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v5)
        return v14;
      v15 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
      if (a3 < 0x7FFFFFFFFFFFFFFFLL || i >= v15)
        return v14;
      goto LABEL_10;
    }
    if ((unint64_t)v10 > a3 && !v5)
      break;
    if ((unint64_t)v10 > a3)
      return 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    v14 = i;
    if ((unint64_t)&v11[v13] <= a3)
    {
      if (&v11[v13] == (char *)a3 && -[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
      {
        if (i == self->_firstPageIndexNeedingLayout - 1)
          v14 = i;
        else
          v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      return v14;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_relativePageIndexForAnchoredCharIndex:forceLayout:searchAfterLayoutPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1490, CFSTR("anchoredCharIndex is before this page, but we haven't returned yet"));
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)p_processWidowsAndInflationForLayoutController:(id)a3
{
  THPaginatedPageController *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  THBodyTextWrapController *mWrapController;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  THPageControllerDelegate *mDelegate;
  THModelContentNode *mContentNode;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (a3)
  {
    begin_node = (THPaginatedPageController *)self->_pageLayoutCache.__tree_.__begin_node_;
    p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
    if (begin_node != (THPaginatedPageController *)&self->_pageLayoutCache.__tree_.__pair1_)
    {
      do
      {
        if (begin_node->mPageHints >= (THPageHintController *)self->_firstPageIndexNeedingLayout)
          break;
        mWrapController = begin_node->mWrapController;
        if (-[THBodyTextWrapController layoutController](mWrapController, "layoutController") == a3)
        {
          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          v8 = -[THBodyTextWrapController bodyLayouts](mWrapController, "bodyLayouts", 0);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v16;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(_QWORD *)v16 != v10)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "processWidowAndInflation");
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
            }
            while (v9);
          }
        }
        mDelegate = begin_node->mDelegate;
        if (mDelegate)
        {
          do
          {
            mContentNode = (THModelContentNode *)mDelegate;
            mDelegate = *(THPageControllerDelegate **)mDelegate;
          }
          while (mDelegate);
        }
        else
        {
          do
          {
            mContentNode = begin_node->mContentNode;
            v14 = *(_QWORD *)mContentNode->super.TSPObject_opaque == (_QWORD)begin_node;
            begin_node = (THPaginatedPageController *)mContentNode;
          }
          while (!v14);
        }
        begin_node = (THPaginatedPageController *)mContentNode;
      }
      while (mContentNode != (THModelContentNode *)p_pair1);
    }
  }
}

- (void)p_layoutThroughPageIndex:(unint64_t)a3 forLayoutController:(id)a4 clearOffscreenInfos:(BOOL)a5
{
  unsigned __int8 v8;
  unsigned __int8 v9;
  unint64_t firstPageIndexNeedingLayout;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  unint64_t v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v14;
  unint64_t v15;
  BOOL v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v19;
  BOOL v20;

  if (self->_doingLayout)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutThroughPageIndex:forLayoutController:clearOffscreenInfos:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1540, CFSTR("shouldn't trigger layout during layout"));
  -[THPaginatedPageController p_processWidowsAndInflationForLayoutController:](self, "p_processWidowsAndInflationForLayoutController:", a4, a4, a5);
  if (!-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete")
    && self->_firstPageIndexNeedingLayout <= a3)
  {
    v8 = -[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete");
    if ((v8 & 1) == 0)
    {
      v9 = v8;
      while (1)
      {
        -[THPaginatedPageController p_layoutNextPageForLayoutController:](self, "p_layoutNextPageForLayoutController:", a4);
        if (self->_firstPageIndexNeedingLayout > a3)
          break;
        if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
        {
          if ((v9 & 1) != 0)
            goto LABEL_11;
          break;
        }
      }
      -[THPaginatedPageController p_clearOffscreenLayouts](self, "p_clearOffscreenLayouts");
      -[THPaginatedPageController p_processWidowsAndInflationForLayoutController:](self, "p_processWidowsAndInflationForLayoutController:", a4);
      -[THPaginatedPageController p_didLayout](self, "p_didLayout");
    }
  }
LABEL_11:
  if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
  {
    firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    if (firstPageIndexNeedingLayout < -[THPaginatedPageController pageCount](self, "pageCount"))
    {
      p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        v13 = self->_firstPageIndexNeedingLayout;
        v14 = &self->_pageLayoutCache.__tree_.__pair1_;
        do
        {
          v15 = (unint64_t)left[4].__value_.__left_;
          v16 = v15 >= v13;
          if (v15 >= v13)
            v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
          else
            v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
          if (v16)
            v14 = left;
          left = *v17;
        }
        while (*v17);
        if (v14 != p_pair1)
        {
          do
          {
            if (v14[4].__value_.__left_ > (void *)a3)
              break;
            objc_msgSend(v14[5].__value_.__left_, "validate");
            v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v14[1].__value_.__left_;
            if (v18)
            {
              do
              {
                v19 = v18;
                v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v18->__value_.__left_;
              }
              while (v18);
            }
            else
            {
              do
              {
                v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v14[2].__value_.__left_;
                v20 = v19->__value_.__left_ == v14;
                v14 = v19;
              }
              while (!v20);
            }
            v14 = v19;
          }
          while (v19 != p_pair1);
        }
      }
    }
  }
}

- (void)p_bodyLayoutDidLayout:(id)a3
{
  id v5;
  double v6;
  double v7;

  v5 = objc_msgSend(a3, "bodyIndexInPageLayout");
  objc_msgSend(objc_msgSend(a3, "geometry"), "size");
  objc_msgSend(-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", objc_msgSend(objc_msgSend(a3, "parent"), "pageIndex"), 0, 1), "setSize:forBodyIndex:", v5, v6, v7);
}

- (void)p_layoutWithPageLayout:(id)a3 outDidSync:(BOOL *)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  unint64_t firstPageIndexNeedingLayout;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v20;
  unint64_t v21;
  BOOL v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v29;
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];

  v7 = objc_msgSend(a3, "bodyLayouts");
  v8 = -[THPaginatedPageController p_layoutManager](self, "p_layoutManager");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v41;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v11);
      v39 = 0;
      v13 = objc_msgSend(v8, "layoutIntoTarget:withLayoutState:outSync:", v12, self->_bodyLayoutState, &v39);
      self->_bodyLayoutState = v13;
      if (v39)
        *a4 = 1;
      if (!v13)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  -[THPaginatedPageController p_updateHintAtIndex:withBodyTargets:](self, "p_updateHintAtIndex:withBodyTargets:", self->_firstPageIndexNeedingLayout, v7);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v7);
        -[THPaginatedPageController p_bodyLayoutDidLayout:](self, "p_bodyLayoutDidLayout:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i));
      }
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }
  p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    v20 = &self->_pageLayoutCache.__tree_.__pair1_;
    do
    {
      v21 = (unint64_t)left[4].__value_.__left_;
      v22 = v21 >= firstPageIndexNeedingLayout;
      if (v21 >= firstPageIndexNeedingLayout)
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
      else
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
      if (v22)
        v20 = left;
      left = *v23;
    }
    while (*v23);
    if (v20 != p_pair1)
    {
      do
      {
        if (v20[4].__value_.__left_ != (void *)self->_firstPageIndexNeedingLayout)
          break;
        if (v20[5].__value_.__left_ != a3)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v24 = objc_msgSend(v20[5].__value_.__left_, "bodyLayouts", 0);
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(_QWORD *)v32 != v26)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j), "killColumns");
              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            }
            while (v25);
          }
        }
        v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v20[1].__value_.__left_;
        if (v28)
        {
          do
          {
            v29 = v28;
            v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v28->__value_.__left_;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v20[2].__value_.__left_;
            v30 = v29->__value_.__left_ == v20;
            v20 = v29;
          }
          while (!v30);
        }
        v20 = v29;
      }
      while (v29 != p_pair1);
    }
  }
  if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
    -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");
}

- (void)p_layoutNextPageForLayoutController:(id)a3
{
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[3];
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = -[THPaginatedPageController p_cachedPageLayoutForPageIndex:preferredLayoutController:](self, "p_cachedPageLayoutForPageIndex:preferredLayoutController:", self->_firstPageIndexNeedingLayout, a3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "bodyLayouts");
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v8 |= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "needsInflation") ^ 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  if (v8 & 1 | !-[THPaginatedPageController p_generateHintForPageIndex:](self, "p_generateHintForPageIndex:", self->_firstPageIndexNeedingLayout))
  {
    if (!self->_bodyLayoutState)
    {
      if (self->_firstPageIndexNeedingLayout)
      {
        v12 = -[THPaginatedPageController p_lastValidPageHint](self, "p_lastValidPageHint");
        if (v12)
        {
          v13 = -[THPaginatedPageController p_layoutManager](self, "p_layoutManager");
          if (objc_msgSend(objc_msgSend(v6, "bodyLayouts"), "count"))
            v14 = objc_msgSend(objc_msgSend(v6, "bodyLayouts"), "objectAtIndex:", 0);
          else
            v14 = 0;
          self->_bodyLayoutState = objc_msgSend(v13, "layoutStateForLayoutTarget:afterHint:childHint:topicNumbers:textIsVertical:", v14, objc_msgSend(v12, "lastHint"), objc_msgSend(v12, "lastChildHint"), objc_msgSend(v12, "topicNumbers"), 0);
        }
      }
    }
    if (self->_doingLayout)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_layoutNextPageForLayoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1703, CFSTR("already laying out a page"));
    self->_doingLayout = 1;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_3BA20;
    v15[3] = &unk_427950;
    v15[4] = self;
    v15[5] = v16;
    -[THPaginatedPageController p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:](self, "p_performBlock:withPageLayoutAtRelativeIndex:preferredLayoutController:", v15, self->_firstPageIndexNeedingLayout, a3);
    self->_doingLayout = 0;
    _Block_object_dispose(v16, 8);
  }
  else
  {
    -[THPaginatedPageController p_destroyBodyLayoutState](self, "p_destroyBodyLayoutState");
  }
  ++self->_firstPageIndexNeedingLayout;

}

- (void)p_didLayout
{
  unint64_t firstPageIndexNeedingLayout;
  unint64_t v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *p_pair1;
  unint64_t v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v8;
  unint64_t v9;
  BOOL v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (-[THPaginatedPageController p_isLayoutComplete](self, "p_isLayoutComplete"))
  {
    firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
    v4 = -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount");
    if (firstPageIndexNeedingLayout > v4)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController p_didLayout]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1751, CFSTR("should have at least as many page hints as we have pages"));
    if (firstPageIndexNeedingLayout < v4)
      -[THPageHintController clearHintsOnRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "clearHintsOnRelativePageIndex:", firstPageIndexNeedingLayout);
    p_pair1 = &self->_pageLayoutCache.__tree_.__pair1_;
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      v7 = self->_firstPageIndexNeedingLayout;
      v8 = &self->_pageLayoutCache.__tree_.__pair1_;
      do
      {
        v9 = (unint64_t)left[4].__value_.__left_;
        v10 = v9 >= v7;
        if (v9 >= v7)
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)left;
        else
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> **)&left[1];
        if (v10)
          v8 = left;
        left = *v11;
      }
      while (*v11);
      if (v8 != p_pair1)
      {
        do
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = objc_msgSend(v8[5].__value_.__left_, "bodyLayouts", 0);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "killColumns");
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v13);
          }
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[1].__value_.__left_;
          if (v16)
          {
            do
            {
              v17 = v16;
              v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v16->__value_.__left_;
            }
            while (v16);
          }
          else
          {
            do
            {
              v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, THPageLayout *>, void *>>> *)v8[2].__value_.__left_;
              v18 = v17->__value_.__left_ == v8;
              v8 = v17;
            }
            while (!v18);
          }
          v8 = v17;
        }
        while (v17 != p_pair1);
      }
    }
  }
}

- (id)i_pageHintForPageIndex:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount") <= a3)
    return 0;
  if (-[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount") <= a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_pageHintForPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1785, CFSTR("index past page hint count, but before valid page count"));
  v5 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", a3);
  v7 = objc_opt_class(THPageHint, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0 && v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_pageHintForPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1787, CFSTR("page hint prior to _firstPageIndexNeedingLayout is not a THPageHint"));
  return v5;
}

- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  objc_sync_enter(self);
  objc_msgSend(-[THPaginatedPageController i_pageHintForPageIndex:](self, "i_pageHintForPageIndex:", a4), "setSize:", width, height);
  objc_sync_exit(self);
}

- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6
{
  unint64_t firstPageIndexNeedingLayout;

  firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  if (firstPageIndexNeedingLayout <= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1804, CFSTR("trimming on or after where layout is"));
    firstPageIndexNeedingLayout = self->_firstPageIndexNeedingLayout;
  }
  if (firstPageIndexNeedingLayout - 1 != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1805, CFSTR("trimming on an unexpected page"));
  objc_msgSend(objc_msgSend(-[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", a3), "lastColumn"), "trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:", a4, a5, a6);
}

- (id)i_columnPriorToPageIndex:(unint64_t)a3
{
  unint64_t v5;
  id result;

  if (self->_firstPageIndexNeedingLayout >= a3)
  {
    if (!a3)
      return 0;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_columnPriorToPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1815, CFSTR("requesting a column from a page that needs layout"));
  }
  v5 = a3 - 1;
  if (!-[THPaginatedPageController p_cachedPageLayoutForPageIndex:preferredLayoutController:](self, "p_cachedPageLayoutForPageIndex:preferredLayoutController:", v5, 0)|| !-[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v5)|| (result = -[THVisibleColumnProxy initWithPageIndex:pageController:]([THVisibleColumnProxy alloc], "initWithPageIndex:pageController:", v5, self)) == 0)
  {
    result = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v5);
    if (result)
      return objc_msgSend(result, "lastColumn");
  }
  return result;
}

- (id)i_columnAfterPageIndex:(unint64_t)a3
{
  unint64_t v5;
  NSNull *v6;

  if (self->_firstPageIndexNeedingLayout < a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_columnAfterPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1846, CFSTR("requesting a column past one page after where we've laid out to / are currently laying out"));
  v5 = a3 + 1;
  if (v5 >= -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount"))
    return 0;
  v6 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v5);
  if (v6 == +[NSNull null](NSNull, "null"))
    return 0;
  else
    return -[NSNull firstColumn](v6, "firstColumn");
}

- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3
{
  unint64_t v5;
  NSNull *v6;

  if (self->_firstPageIndexNeedingLayout < a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_firstChildHintAfterPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1868, CFSTR("requesting a column past one page after where we've laid out to / are currently laying out"));
  v5 = a3 + 1;
  if (v5 >= -[THPageHintController pageCount](-[THPaginatedPageController pageHints](self, "pageHints"), "pageCount"))
    return 0;
  v6 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v5);
  if (v6 == +[NSNull null](NSNull, "null"))
    return 0;
  else
    return -[NSNull firstChildHint](v6, "firstChildHint");
}

- (void)i_inflateColumnsInBodyLayout:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *__p;
  void *v12;
  uint64_t v13;

  objc_sync_enter(self);
  if (!self->_doingLayout)
  {
    v5 = objc_msgSend(a3, "pageIndex");
    if (self->_firstPageIndexNeedingLayout <= v5
      && -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", v5))
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1914, CFSTR("trying to inflate a page that hasn't been laid out"));
    }
    else
    {
      v6 = -[THPaginatedPageController i_pageHintForPageIndex:](self, "i_pageHintForPageIndex:", v5);
      if (!v6)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1896, CFSTR("should have a page hint for a page before the first one needing layout"));
      if (v5)
        v7 = -[THPaginatedPageController i_pageHintForPageIndex:](self, "i_pageHintForPageIndex:", v5 - 1);
      else
        v7 = 0;
      v8 = objc_msgSend(a3, "bodyIndexInPageLayout");
      if (v8 < objc_msgSend(v6, "nonEmptyBodyCount"))
      {
        v9 = objc_msgSend(v6, "anchoredAttachmentPositionsForBodyChildAtIndex:", v8);
        v10 = -[THPaginatedPageController p_layoutManager](self, "p_layoutManager");
        if (v6)
        {
          objc_msgSend(v6, "hintsForBodyIndex:", v8);
        }
        else
        {
          __p = 0;
          v12 = 0;
          v13 = 0;
        }
        objc_msgSend(v10, "inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:", a3, &__p, objc_msgSend(v7, "lastChildHint"), v9, objc_msgSend(v6, "topicNumbers"));
        if (__p)
        {
          v12 = __p;
          operator delete(__p);
        }
        -[THPaginatedPageController p_validatePageHints](self, "p_validatePageHints");
        if (!objc_msgSend(objc_msgSend(a3, "columns"), "count"))
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_inflateColumnsInBodyLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1908, CFSTR("should have created columns unless we're in the process of doing layout"));
      }
      -[THPaginatedPageController p_bodyLayoutDidLayout:](self, "p_bodyLayoutDidLayout:", a3);
    }
  }
  objc_sync_exit(self);
}

- (void)i_registerPageLayout:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_registerPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1923, CFSTR("can't register or unregister nil"));
  -[THPaginatedPageController p_insertPageLayoutIntoCache:](self, "p_insertPageLayoutIntoCache:", a3);
  objc_sync_exit(self);
}

- (void)i_unregisterPageLayout:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_unregisterPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 1931, CFSTR("can't register or unregister nil"));
  -[THPaginatedPageController p_removePageLayoutFromCache:](self, "p_removePageLayoutFromCache:", a3);
  objc_sync_exit(self);
}

- (CGRect)i_rectForSectionLayout
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v3 = -[THPageControllerDelegate pagePositionControllerForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "pagePositionControllerForPageController:", self);
  objc_msgSend(v3, "pageSizeWithZeroInPagingDirection");
  v5 = v4;
  v7 = v6;
  v8 = -[THPaginatedPageController pageCount](self, "pageCount");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 1;
  else
    v9 = v8;
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      if (-[THPageHintController hasFullHintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hasFullHintForRelativePageIndex:", i))
      {
        objc_msgSend(-[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](self, "pageHints"), "hintForRelativePageIndex:", i), "size");
      }
      else
      {
        objc_msgSend(v3, "pageSize");
      }
      objc_msgSend(v3, "offsetSize:inPagingDirectionWithOffset:", v5, v7, v11, v12);
      v5 = v13;
      v7 = v14;
    }
  }
  -[THPageControllerDelegate canvasOriginForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "canvasOriginForPageController:", self);
  v16 = v15;
  v18 = v17;
  if ((objc_opt_respondsToSelector(-[THPaginatedPageController delegate](self, "delegate"), "canvasOriginDeltaForPageController:") & 1) != 0)
  {
    -[THPageControllerDelegate canvasOriginDeltaForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "canvasOriginDeltaForPageController:", self);
    v16 = v16 + v19;
    v18 = v18 + v20;
  }
  v21 = (char *)-[THPageControllerDelegate displaySinglePageChapterSeparatelyForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "displaySinglePageChapterSeparatelyForPageController:", self);
  if ((_DWORD)v21)
  {
    v21 = (char *)-[THPageControllerDelegate isTwoUpForNavigationUnitForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "isTwoUpForNavigationUnitForPageController:", self);
    if ((_DWORD)v21)
    {
      v21 = (char *)-[THPageControllerDelegate pageCountForNavigationUnitForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "pageCountForNavigationUnitForPageController:", self);
      if (v21 == (_BYTE *)&dword_0 + 1)
        v5 = v5 + v5;
    }
  }
  v22 = TSDRectWithOriginAndSize(v21, v16, v18, v5, v7);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)needsAnnotationSourceForLayout:(id)a3
{
  return -[THPageControllerDelegate pageController:needsAnnotationSourceForLayout:](-[THPaginatedPageController delegate](self, "delegate"), "pageController:needsAnnotationSourceForLayout:", self, a3);
}

- (BOOL)allowsDescendersToClip
{
  return -[THPageControllerDelegate allowsDescendersToClipForPageController:](-[THPaginatedPageController delegate](self, "delegate"), "allowsDescendersToClipForPageController:", self);
}

- (unint64_t)p_relativePageIndexPrecedingRelativePageIndex:(unint64_t)a3
{
  if (a3)
    return a3 - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)p_relativePageIndexFollowingRelativePageIndex:(unint64_t)a3
{
  if (a3 + 1 < -[THPaginatedPageController pageCount](self, "pageCount"))
    return a3 + 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3
{
  unint64_t v5;

  if (self->_firstPageIndexNeedingLayout < a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPaginatedPageController i_topicHintsPriorToPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageController.mm"), 2017, CFSTR("requesting topicNumberHints from a page that needs layout"));
  v5 = -[THPaginatedPageController p_relativePageIndexPrecedingRelativePageIndex:](self, "p_relativePageIndexPrecedingRelativePageIndex:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return objc_msgSend(-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v5, 0, 0), "topicNumbers");
}

- (const)i_topicHintsAfterPageIndex:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[THPaginatedPageController p_relativePageIndexFollowingRelativePageIndex:](self, "p_relativePageIndexFollowingRelativePageIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return objc_msgSend(-[THPaginatedPageController p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:](self, "p_pageHintForRelativePageIndex:forceLayout:allowAfterLayoutPoint:", v4, 0, 0), "topicNumbers");
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THPageControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageControllerDelegate *)a3;
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (void)setPageHints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THBodyTextWrapController)wrapController
{
  return self->mWrapController;
}

- (void)setWrapController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THReflowablePaginationController)paginationController
{
  return self->_paginationController;
}

- (void)setPaginationController:(id)a3
{
  self->_paginationController = (THReflowablePaginationController *)a3;
}

- (void).cxx_destruct
{
  sub_3D170((uint64_t)&self->_pageLayoutCache, (_QWORD *)self->_pageLayoutCache.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 8) = (char *)self + 72;
  return self;
}

@end
