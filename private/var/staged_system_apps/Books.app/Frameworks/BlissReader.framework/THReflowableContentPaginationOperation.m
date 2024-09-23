@implementation THReflowableContentPaginationOperation

- (THReflowableContentPaginationOperation)initWithContentNode:(id)a3 paginationResults:(id)a4 flowModelContentNodeBody:(id)a5 presentationType:(id)a6 documentRoot:(id)a7 isForegroundPagination:(BOOL)a8 delegate:(id)a9
{
  THReflowableContentPaginationOperation *v15;
  THReflowableContentPaginationOperation *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THReflowableContentPaginationOperation;
  v15 = -[THReflowableContentPaginationOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    v15->_contentNode = (THModelContentNode *)a3;
    v15->_documentRoot = (THDocumentRoot *)a7;
    v16->_flowModelContentNodeBody = (THModelContentNodeBody *)a5;
    v16->_presentationType = (THPresentationType *)objc_msgSend(a6, "copyFixingSize");
    v16->_paginationResults = (THModelContentNodeReflowablePaginationResults *)a4;
    v16->_isForegroundPagination = a8;
    v16->_delegate = (THReflowableContentPaginationOperationDelegate *)a9;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  self->_documentRoot = 0;
  self->_flowModelContentNodeBody = 0;

  self->_paginatedModelContentNodeBody = 0;
  self->_presentationType = 0;

  self->_pageController = 0;
  self->_pagePositionController = 0;

  self->_paginationResults = 0;
  v3.receiver = self;
  v3.super_class = (Class)THReflowableContentPaginationOperation;
  -[THReflowableContentPaginationOperation dealloc](&v3, "dealloc");
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THReflowableContentPaginationOperation;
  -[THReflowableContentPaginationOperation cancel](&v3, "cancel");
  -[THPaginatedPageController teardown](self->_pageController, "teardown");
}

- (void)p_accumulateStorageUIDsForChildrenInObject:(id)a3 forRelativePageIndex:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "childEnumerator", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(TSWPShapeInfo, v8);
        v14 = (void *)TSUDynamicCast(v13, v12);
        if (v14)
        {
          -[THModelContentNodeReflowablePaginationResults assignRelativePageIndex:toStorageUID:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "assignRelativePageIndex:toStorageUID:", a4, -[THModelContentNodeBody nodeUniqueIDForInfo:](-[THReflowableContentPaginationOperation flowModelContentNodeBody](self, "flowModelContentNodeBody"), "nodeUniqueIDForInfo:", objc_msgSend(v14, "containedStorage")));
        }
        else if ((objc_opt_respondsToSelector(v12, "childEnumerator") & 1) != 0)
        {
          -[THReflowableContentPaginationOperation p_accumulateStorageUIDsForChildrenInObject:forRelativePageIndex:](self, "p_accumulateStorageUIDsForChildrenInObject:forRelativePageIndex:", v12, a4);
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

- (void)main
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  THModelContentNodeReflowablePaginationResults *v14;
  THWPStorage *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = objc_autoreleasePoolPush();
  if ((-[THReflowableContentPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    self->_pageController = -[THPaginatedPageController initWithDelegate:contentNode:paginationController:presentationType:]([THPaginatedPageController alloc], "initWithDelegate:contentNode:paginationController:presentationType:", self, self->_contentNode, 0, self->_presentationType);
    self->_pagePositionController = (THPagePositionController *)+[THPagePositionController paginatedPositionerWithDelegate:](THPagePositionController, "paginatedPositionerWithDelegate:", self);
    self->_paginatedModelContentNodeBody = -[THModelContentNodeBody initWithContext:]([THModelContentNodeBody alloc], "initWithContext:", -[THDocumentRoot context](-[THReflowableContentPaginationOperation documentRoot](self, "documentRoot"), "context"));
    -[THModelContentNodeBody setStylesheet:](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "setStylesheet:", -[THModelContentNodeBody stylesheet](-[THReflowableContentPaginationOperation flowModelContentNodeBody](self, "flowModelContentNodeBody"), "stylesheet"));
    -[THModelContentNodeBody setBodyStorage:](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "setBodyStorage:", -[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation flowModelContentNodeBody](self, "flowModelContentNodeBody"), "bodyStorage"));
    -[THWPStorage setFontSize:](-[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage"), "setFontSize:", -[THPresentationType fontSize](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "fontSize"));
    -[THWPStorage setUsesApplicationFontScaling:](-[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage"), "setUsesApplicationFontScaling:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = -[THModelContentNodeBody infos](self->_flowModelContentNodeBody, "infos");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          -[THModelContentNodeBody setNodeUniqueID:forInfo:](self->_paginatedModelContentNodeBody, "setNodeUniqueID:forInfo:", -[THModelContentNodeBody nodeUniqueIDForInfo:](self->_flowModelContentNodeBody, "nodeUniqueIDForInfo:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8)), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }
    if (-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"))
    {
      if (-[THModelContentNodeReflowablePaginationResults pageCount](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "pageCount"))
      {
        v9 = 0;
        do
        {
          v10 = -[THReflowableContentPaginationOperation p_addPageToContentBody](self, "p_addPageToContentBody");
          v11 = (char *)-[THModelContentNodeReflowablePaginationResults hintRangeForRelativePageIndex:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "hintRangeForRelativePageIndex:", v9);
          v13 = v12;
          objc_msgSend(v10, "setPageStartCharIndex:", v11);
          objc_msgSend(v10, "setPageEndCharIndex:", &v11[v13]);
          ++v9;
        }
        while (v9 < -[THModelContentNodeReflowablePaginationResults pageCount](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "pageCount"));
      }
    }
    else
    {
      if ((-[THReflowableContentPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        v14 = objc_alloc_init(THModelContentNodeReflowablePaginationResults);
        self->_paginationResults = v14;
        -[THModelContentNodeReflowablePaginationResults setPageCount:](v14, "setPageCount:", 1);
        -[THModelContentNodeReflowablePaginationResults setNodeGUID:](self->_paginationResults, "setNodeGUID:", -[THModelNode nodeGUID](-[THReflowableContentPaginationOperation contentNode](self, "contentNode"), "nodeGUID"));
        -[THModelContentNodeReflowablePaginationResults setPresentationType:](self->_paginationResults, "setPresentationType:", -[THPresentationType copyFixingSize](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "copyFixingSize"));
        -[THPaginatedPageController layoutThroughRelativePageIndex:layoutController:](-[THReflowableContentPaginationOperation pageController](self, "pageController"), "layoutThroughRelativePageIndex:layoutController:", -1, 0);
      }
      if ((-[THReflowableContentPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        -[THModelContentNodeReflowablePaginationResults setPageHints:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "setPageHints:", -[NSArray mutableCopy](-[THPageHintController pageHints](-[THPaginatedPageController pageHints](-[THReflowableContentPaginationOperation pageController](self, "pageController"), "pageHints"), "pageHints"), "mutableCopy"));
        -[THModelContentNodeReflowablePaginationResults setBodyStorageUID:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "setBodyStorageUID:", -[THModelContentNodeBody nodeUniqueIDForInfo:](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "nodeUniqueIDForInfo:", -[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage")));
        v15 = -[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage");
        v17 = objc_opt_class(TSWPDrawableAttachment, v16);
        v18 = -[THWPStorage range](v15, "range");
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_44FA0;
        v20[3] = &unk_427A00;
        v20[4] = self;
        -[THWPStorage enumerateAttachmentsOfClass:inTextRange:usingBlock:](v15, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v17, v18, v19, v20);
      }
    }
  }
  if ((-[THReflowableContentPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[THReflowableContentPaginationOperationDelegate contentPaginationOperation:paginatedNodeBody:forPresentationType:](-[THReflowableContentPaginationOperation delegate](self, "delegate"), "contentPaginationOperation:paginatedNodeBody:forPresentationType:", self, -[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), -[THReflowableContentPaginationOperation presentationType](self, "presentationType"));
  -[THPaginatedPageController teardown](self->_pageController, "teardown");
  objc_autoreleasePoolPop(v3);
}

- (id)p_addPageToContentBody
{
  id v3;
  THModelPageInfo *v4;
  id v5;
  id v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  THModelBodyTextInfo *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v23;
  id v24;
  THDrawablesZOrder *v25;

  v3 = -[THWGutterDrawableStorage context](-[THModelContentNodeBody gutterDrawableStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "gutterDrawableStorage"), "context");
  v4 = -[THModelPageInfo initWithContext:]([THModelPageInfo alloc], "initWithContext:", v3);
  v5 = objc_alloc((Class)TSDInfoGeometry);
  -[THPresentationType pageSize](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "pageSize");
  v6 = objc_msgSend(v5, "initWithSize:");
  -[THModelPageInfo setGeometry:](v4, "setGeometry:", v6);

  -[THModelContentNodeBody addPageInfo:](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "addPageInfo:", v4);
  y = CGPointZero.y;
  -[THPresentationType pageSize](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "pageSize");
  v9 = v8;
  v11 = v10;
  -[THPresentationType contentInsets](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "contentInsets");
  v15 = v9 - (v13 + v14);
  v17 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", CGPointZero.x + v13, y + v12, v15, v11 - (v12 + v16));
  v18 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", v3, v17);

  v19 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
  objc_msgSend(v19, "setObject:forProperty:", +[TSWPPadding padding](TSWPPadding, "padding"), 145);
  v20 = -[THPresentationType columnCount](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "columnCount");
  if (v20 < 2)
  {
    objc_msgSend(v19, "setObject:forProperty:", +[TSWPColumns columns](TSWPColumns, "columns"), 148);
  }
  else
  {
    v21 = v20;
    -[THPresentationType gutterWidth](-[THReflowableContentPaginationOperation presentationType](self, "presentationType"), "gutterWidth");
    v23 = objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithEqualColumnCount:gapFraction:", v21, v22 / v15);
    objc_msgSend(v19, "setObject:forProperty:", v23, 148);

  }
  v24 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", v3, 0, v19, 0);
  -[THModelBodyTextInfo setColumnStyle:](v18, "setColumnStyle:", v24);

  -[THModelBodyTextInfo setExteriorTextWrap:](v18, "setExteriorTextWrap:", +[TSDExteriorTextWrap exteriorTextWrap](TSDExteriorTextWrap, "exteriorTextWrap"));
  -[THModelPageInfo addBodyBoxInfo:insertContext:](v4, "addBodyBoxInfo:insertContext:", v18, 0);
  v25 = -[THModelPageInfo drawablesZOrder](v4, "drawablesZOrder");
  -[THDrawablesZOrder addDrawable:](v25, "addDrawable:", -[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage"));
  -[THDrawablesZOrder addDrawable:](v25, "addDrawable:", v18);
  -[THModelPageInfo setParent:](v4, "setParent:", -[THReflowableContentPaginationOperation contentNode](self, "contentNode"));

  return v4;
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[THPresentationType pageSize](-[THReflowableContentPaginationOperation presentationType](self, "presentationType", a3), "pageSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)wantsPageCharIndicesFilledForPageController:(id)a3
{
  return 1;
}

- (id)accessControllerForPageController:(id)a3
{
  return 0;
}

- (CGPoint)canvasOriginForPageController:(id)a3
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isCompactFlowPresentationForPageController:(id)a3
{
  return 1;
}

- (unint64_t)pageCountForNavigationUnitForPageController:(id)a3
{
  return 0;
}

- (BOOL)displaySinglePageChapterSeparatelyForPageController:(id)a3
{
  return 0;
}

- (BOOL)isTwoUpForNavigationUnitForPageController:(id)a3
{
  return 0;
}

- (BOOL)allowsDescendersToClipForPageController:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForPageController:(id)a3
{
  return 1;
}

- (BOOL)shouldScaleFlowLayoutsForPageController:(id)a3
{
  return 0;
}

- (unint64_t)pageCountForPageController:(id)a3 presentationType:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  NSNull *v7;
  NSNull *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v5 = -[NSArray count](-[THModelContentNodeBody pages](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody", a3, a4), "pages"), "count");
  if ((-[THReflowableContentPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v5)
    {
      v6 = v5 + 1;
      v7 = -[THPageHintController hintForRelativePageIndex:](-[THPaginatedPageController pageHints](-[THReflowableContentPaginationOperation pageController](self, "pageController"), "pageHints"), "hintForRelativePageIndex:", v5 - 1);
      if (v7)
      {
        v8 = v7;
        if (v7 != +[NSNull null](NSNull, "null"))
        {
          v9 = (char *)-[THWPStorage range](-[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "bodyStorage"), "range");
          v11 = &v9[v10];
          v12 = (char *)-[NSNull range](v8, "range");
          if (v11 <= &v12[v13])
            v6 = v5;
        }
      }
    }
    else
    {
      v6 = 1;
    }
    if (v6 >= 0xFA0)
      v5 = 4000;
    else
      v5 = v6;
    -[THModelContentNodeReflowablePaginationResults setPageCount:](-[THReflowableContentPaginationOperation paginationResults](self, "paginationResults"), "setPageCount:", v5);
  }
  return v5;
}

- (id)layoutControllerForPageController:(id)a3
{
  return 0;
}

- (id)bodyStorageForPageController:(id)a3 presentationType:(id)a4
{
  return -[THModelContentNodeBody bodyStorage](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody", a3, a4), "bodyStorage");
}

- (id)pageInfoForPageController:(id)a3 pageIndex:(unint64_t)a4 presentationType:(id)a5
{
  unint64_t v8;
  unint64_t v9;

  if (-[THReflowableContentPaginationOperation pageController](self, "pageController", a3, a4, a5) != a3)
    return 0;
  if (-[NSArray count](-[THModelContentNodeBody pages](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "pages"), "count") <= a4|| !-[NSArray objectAtIndex:](-[THModelContentNodeBody pages](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "pages"), "objectAtIndex:", a4))
  {
    v8 = -[NSArray count](-[THModelContentNodeBody pages](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "pages"), "count");
    if (v8 <= a4)
    {
      v9 = v8;
      do
      {
        -[THReflowableContentPaginationOperation p_addPageToContentBody](self, "p_addPageToContentBody");
        ++v9;
      }
      while (v9 <= a4);
    }
  }
  return -[NSArray objectAtIndex:](-[THModelContentNodeBody pages](-[THReflowableContentPaginationOperation paginatedModelContentNodeBody](self, "paginatedModelContentNodeBody"), "pages"), "objectAtIndex:", a4);
}

- (BOOL)pageController:(id)a3 needsAnnotationSourceForLayout:(id)a4
{
  return 0;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  self->_contentNode = (THModelContentNode *)a3;
}

- (THModelContentNodeReflowablePaginationResults)paginationResults
{
  return self->_paginationResults;
}

- (void)setPaginationResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (THModelContentNodeBody)flowModelContentNodeBody
{
  return self->_flowModelContentNodeBody;
}

- (void)setFlowModelContentNodeBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THModelContentNodeBody)paginatedModelContentNodeBody
{
  return self->_paginatedModelContentNodeBody;
}

- (void)setPaginatedModelContentNodeBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THPaginatedPageController)pageController
{
  return self->_pageController;
}

- (void)setPageController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THPagePositionController)pagePositionController
{
  return self->_pagePositionController;
}

- (void)setPagePositionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)isForegroundPagination
{
  return self->_isForegroundPagination;
}

- (void)setIsForegroundPagination:(BOOL)a3
{
  self->_isForegroundPagination = a3;
}

- (THReflowableContentPaginationOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReflowableContentPaginationOperationDelegate *)a3;
}

@end
