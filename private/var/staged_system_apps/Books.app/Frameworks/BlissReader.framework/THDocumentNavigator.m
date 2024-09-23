@implementation THDocumentNavigator

- (THDocumentNavigator)initWithDocumentRoot:(id)a3 interactiveCanvasController:(id)a4
{
  THDocumentNavigator *v6;
  THDocumentNavigator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THDocumentNavigator;
  v6 = -[THDocumentNavigator init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[THDocumentNavigator setDocumentRoot:](v6, "setDocumentRoot:", a3);
    v7->_interactiveCanvasController = (THInteractiveCanvasController *)a4;
    -[THBookspotHistoryStack setDelegate:](-[THDocumentRoot bookspotHistoryStack](v7->_documentRoot, "bookspotHistoryStack"), "setDelegate:", v7);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[THBookspotHistoryStack delegate](-[THDocumentRoot bookspotHistoryStack](self->_documentRoot, "bookspotHistoryStack"), "delegate") == self)-[THBookspotHistoryStack setDelegate:](-[THDocumentRoot bookspotHistoryStack](self->_documentRoot, "bookspotHistoryStack"), "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THDocumentNavigator;
  -[THDocumentNavigator dealloc](&v3, "dealloc");
}

- (void)setDocumentRoot:(id)a3
{
  THDocumentRoot *documentRoot;

  documentRoot = self->_documentRoot;
  if (documentRoot != a3)
  {

    self->_documentRoot = (THDocumentRoot *)a3;
    self->_documentLinkResolver = -[THDocumentLinkResolver initWithDocumentRoot:]([THDocumentLinkResolver alloc], "initWithDocumentRoot:", a3);
  }
}

- (THSectionController)sectionController
{
  return (THSectionController *)-[THDocumentNavigatorDelegate sectionControllerForDocumentNavigator:](self->_delegate, "sectionControllerForDocumentNavigator:", self);
}

- (void)p_resolveLink:(id)a3 andCallBlock:(id)a4
{
  id v5;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void (*v10)(id, unint64_t, id, id);
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  unint64_t v20;

  v5 = a3;
  if ((objc_msgSend(a3, "isPageLink") & 1) != 0
    || (objc_msgSend(v5, "isChapterGuidLink") & 1) != 0
    || objc_msgSend(v5, "isChapterLink"))
  {
    v7 = -[THDocumentLinkResolver absolutePageNumberFromCustomLink:presentationType:](-[THDocumentNavigator documentLinkResolver](self, "documentLinkResolver"), "absolutePageNumberFromCustomLink:presentationType:", v5, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      return;
    v8 = v7;
    v9 = -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", v7, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    v10 = (void (*)(id, unint64_t, id, id))*((_QWORD *)a4 + 2);
    v11 = a4;
    v12 = v8;
LABEL_7:
    v10(v11, v12, v9, v5);
    return;
  }
  v13 = -[THDocumentLinkResolver absoluteLink:withContentNode:](-[THDocumentNavigator documentLinkResolver](self, "documentLinkResolver"), "absoluteLink:withContentNode:", v5, -[THDocumentNavigator currentContentNode](self, "currentContentNode"));
  if (v13)
  {
    v5 = v13;
    v14 = -[THDocumentLinkResolver contentNodeFromLink:](-[THDocumentNavigator documentLinkResolver](self, "documentLinkResolver"), "contentNodeFromLink:", v13);
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "nodeBodyExists"))
      {
        v16 = +[THContentLinkResolver navigableAnchorFromLink:withContentNode:presentationType:](THContentLinkResolver, "navigableAnchorFromLink:withContentNode:presentationType:", v5, v15, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
        v17 = objc_opt_class(THModelStorageAnchor);
        *(_QWORD *)&v19 = TSUDynamicCast(v17, v16).n128_u64[0];
        v20 = v18
            ? -[THDocumentRoot absolutePageIndexForStorageAnchor:](self->_documentRoot, "absolutePageIndexForStorageAnchor:", v18, v19): -[THDocumentNavigationModel absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot", v19), "navigationModel"), "absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", 0, v15, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
        v12 = v20;
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = (void (*)(id, unint64_t, id, id))*((_QWORD *)a4 + 2);
          v11 = a4;
          v9 = v15;
          goto LABEL_7;
        }
      }
    }
  }
}

- (unint64_t)absolutePageIndexForLink:(id)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_19ADA8;
  v5[3] = &unk_42A920;
  v5[4] = &v6;
  -[THDocumentNavigator p_resolveLink:andCallBlock:](self, "p_resolveLink:andCallBlock:", a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)pageNumberStringForLink:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_19AE6C;
  v10 = sub_19AE7C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_19AE88;
  v5[3] = &unk_42A948;
  v5[4] = self;
  v5[5] = &v6;
  -[THDocumentNavigator p_resolveLink:andCallBlock:](self, "p_resolveLink:andCallBlock:", a3, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)followLink:(id)a3
{
  return -[THDocumentNavigator followLink:animated:](self, "followLink:animated:", a3, 1);
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  _BOOL8 v9;
  BOOL v10;

  v4 = a4;
  if ((objc_msgSend(a3, "isRelative") & 1) != 0)
    v7 = -[THDocumentNavigator p_anchorForLink:](self, "p_anchorForLink:", a3);
  else
    v7 = -[THDocumentLinkResolver anchorFromAbsoluteLink:presentationType:](-[THDocumentNavigator documentLinkResolver](self, "documentLinkResolver"), "anchorFromAbsoluteLink:presentationType:", a3, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
  v8 = v7;
  if (v7)
  {
    v9 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v4);
    v10 = -[THDocumentNavigator followAnchor:pulse:](self, "followAnchor:pulse:", v8, 1);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v9);
    return v10;
  }
  else
  {
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:failedToFollowLink:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:failedToFollowLink:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:failedToFollowLink:", self, a3);
    return 0;
  }
}

- (void)clearFlowAnchorCache
{

  self->_cachedFlowAnchorForRect = 0;
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;
  THDocumentNavigationModel *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  int v12;
  BOOL v13;

  v4 = a4;
  -[THDocumentNavigator setFollowingAnchor:](self, "setFollowingAnchor:", 1);
  if (objc_msgSend(a3, "contentNode"))
  {
    v7 = -[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel");
    v8 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](v7, "navigationUnits"), "indexOfObject:", -[THDocumentNavigationModel navigationUnitContainingContentNode:](v7, "navigationUnitContainingContentNode:", -[THDocumentNavigator currentContentNode](self, "currentContentNode")));
    v9 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](v7, "navigationUnits"), "indexOfObject:", -[THDocumentNavigationModel navigationUnitContainingContentNode:](v7, "navigationUnitContainingContentNode:", objc_msgSend(a3, "contentNode")));
    v10 = v9;
    v11 = v8 == (id)0x7FFFFFFFFFFFFFFFLL || v8 == v9;
    v12 = !v11;
    if (v11)
    {
      if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = -[THDocumentNavigator p_followDocumentAnchor:pulse:](self, "p_followDocumentAnchor:pulse:", a3, v4);
        goto LABEL_23;
      }
    }
    else if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willChangeFromChapterAtIndex:toChapterAtIndex:") & 1) != 0)
    {
      -[THDocumentNavigatorDelegate documentNavigator:willChangeFromChapterAtIndex:toChapterAtIndex:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willChangeFromChapterAtIndex:toChapterAtIndex:", self, v8, v10);
    }
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willChangeFromContentNode:toContentNode:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:willChangeFromContentNode:toContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willChangeFromContentNode:toContentNode:", self, -[THDocumentNavigator currentContentNode](self, "currentContentNode"), objc_msgSend(a3, "contentNode"));
    v13 = -[THDocumentNavigator p_followDocumentAnchor:pulse:](self, "p_followDocumentAnchor:pulse:", a3, v4);
    if (v12
      && (objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didChangeFromChapterAtIndex:toChapterAtIndex:") & 1) != 0)
    {
      -[THDocumentNavigatorDelegate documentNavigator:didChangeFromChapterAtIndex:toChapterAtIndex:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didChangeFromChapterAtIndex:toChapterAtIndex:", self, v8, v10);
    }
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didChangeFromContentNode:toContentNode:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:didChangeFromContentNode:toContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didChangeFromContentNode:toContentNode:", self, -[THDocumentNavigator currentContentNode](self, "currentContentNode"), objc_msgSend(a3, "contentNode"));
  }
  else
  {
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:failedToFollowAnchor:pulse:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:failedToFollowAnchor:pulse:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:failedToFollowAnchor:pulse:", self, a3, v4);
    v13 = 0;
  }
LABEL_23:
  -[THDocumentNavigator setFollowingAnchor:](self, "setFollowingAnchor:", 0);

  self->_cachedFlowAnchorForRect = 0;
  return v13;
}

- (BOOL)p_followDocumentAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  BOOL v19;

  v4 = a4;
  if (!objc_msgSend(a3, "contentNode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_followDocumentAnchor:pulse:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 290, CFSTR("Attempt to follow nil contentNode anchor."));
  if (!objc_msgSend(a3, "contentNode"))
    return 0;
  v7 = objc_opt_class(THModelStorageAnchor);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, a3).n128_u64[0];
  if (!v8)
  {
    v10 = objc_opt_class(THAnnotationAnchor);
    *(_QWORD *)&v12 = TSUDynamicCast(v10, a3).n128_u64[0];
    if (v11)
    {
      -[THDocumentNavigator p_jumpToAnnotationAnchor:pulse:](self, "p_jumpToAnnotationAnchor:pulse:", v11, v4, v12);
      goto LABEL_12;
    }
    v13 = objc_opt_class(THModelPageAnchor);
    *(_QWORD *)&v15 = TSUDynamicCast(v13, a3).n128_u64[0];
    if (v14)
    {
      -[THDocumentNavigator p_jumpToPageAnchor:](self, "p_jumpToPageAnchor:", v14, v15);
      goto LABEL_12;
    }
    v16 = objc_opt_class(THModelContentNodeAnchor);
    *(_QWORD *)&v18 = TSUDynamicCast(v16, a3).n128_u64[0];
    if (v17)
    {
      -[THDocumentNavigator p_jumpToContentNodeAnchor:](self, "p_jumpToContentNodeAnchor:", v17, v18);
      goto LABEL_12;
    }
    return 0;
  }
  -[THDocumentNavigator p_jumpToStorageAnchor:pulse:](self, "p_jumpToStorageAnchor:pulse:", v8, v4, v9);
LABEL_12:
  v19 = 1;
  -[THDocumentNavigator setVisitedPagesAfterOpening:](self, "setVisitedPagesAfterOpening:", 1);
  return v19;
}

- (void)p_scrollToAbsolutePageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  THDocumentNavigationModel *v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  unsigned int v12;
  unint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double x;
  double y;
  double width;
  double height;
  id v23;

  v4 = a4;
  v7 = -[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel");
  v8 = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](v7, "contentNodeForAbsolutePageIndex:", a3);
  -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, a3, v8);
  v9 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
  if (v8)
  {
    v10 = v9;
    if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
    {
      v11 = -[THDocumentNavigationModel navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:](v7, "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", a3, v10);
      if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorIsInTwoPageMode:") & 1) != 0)
      {
        v12 = -[THDocumentNavigatorDelegate documentNavigatorIsInTwoPageMode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorIsInTwoPageMode:", self);
        v13 = a3 - 1;
        v14 = v11 - 1;
        if ((v11 & 1) == 0)
        {
          v14 = v11;
          v13 = a3;
        }
        if (v12)
        {
          v11 = v14;
          a3 = v13;
        }
      }
      -[THSectionController canvasRectForRelativePageIndex:](-[THDocumentNavigator sectionController](self, "sectionController"), "canvasRectForRelativePageIndex:", v11);
    }
    else
    {
      v23 = objc_msgSend(v8, "storageAnchorForNodeRelativePageIndex:", objc_msgSend(v8, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, v10));
      objc_msgSend(v23, "setAbsolutePageIndex:", a3);
      -[THSectionController rectForBodyAnchor:](-[THDocumentNavigator sectionController](self, "sectionController"), "rectForBodyAnchor:", v23);
    }
    x = v15;
    y = v16;
    width = v17;
    height = v18;
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  -[THDocumentNavigatorDelegate documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:", self, a3, v4, 0, x, y, width, height);
}

- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    -[THDocumentNavigator p_scrollToAbsolutePageIndex:animated:](self, "p_scrollToAbsolutePageIndex:animated:", a3, 1);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    -[THDocumentNavigator p_scrollToAbsolutePageIndex:animated:](self, "p_scrollToAbsolutePageIndex:animated:", a3, 0);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)setVisibleAbsolutePhysicalPageIndex:(unint64_t)a3
{
  -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:animated:](self, "setVisibleAbsolutePhysicalPageIndex:animated:", a3, 0);
  -[THDocumentNavigator setVisitedPagesAfterOpening:](self, "setVisitedPagesAfterOpening:", 1);
}

- (unint64_t)relativePageIndexForLink:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v10;
  id v11;
  THPresentationType *v12;

  v5 = -[THDocumentNavigator p_anchorForLink:](self, "p_anchorForLink:");
  v6 = objc_opt_class(THModelStorageAnchor);
  *(_QWORD *)&v8 = TSUDynamicCast(v6, v5).n128_u64[0];
  if (v7)
    return -[THSectionController relativePageIndexForBodyStorageAnchor:](-[THDocumentNavigator sectionController](self, "sectionController", v8), "relativePageIndexForBodyStorageAnchor:", v7);
  v10 = -[THDocumentLinkResolver contentNodeFromLink:](-[THDocumentNavigator documentLinkResolver](self, "documentLinkResolver", v8), "contentNodeFromLink:", a3);
  if (!v10)
    return 0x7FFFFFFFFFFFFFFFLL;
  v11 = v10;
  if (-[THDocumentNavigator sectionController](self, "sectionController"))
    v12 = -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType");
  else
    v12 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
  return -[THDocumentNavigationModel navigationUnitRelativePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", 0, v11, v12);
}

- (id)currentContentNode
{
  unint64_t v3;

  v3 = -[THDocumentNavigator currentNavigationUnitRelativePageIndex](self, "currentNavigationUnitRelativePageIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THNavigationUnit contentNodeForRelativePageIndex:forPresentationType:](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", v3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
}

- (unint64_t)currentAbsolutePageIndexForBeginningOfVisibleCanvas
{
  id v4;

  if (!-[THDocumentNavigator sectionController](self, "sectionController"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    return -[THSectionController absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v4 = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation");
  if (v4)
    return (unint64_t)objc_msgSend(v4, "absolutePhysicalPageIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)currentAbsolutePageIndexForEndOfVisibleCanvas
{
  id v4;

  if (!-[THDocumentNavigator sectionController](self, "sectionController"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    return -[THSectionController absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v4 = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation");
  if (v4)
    return (unint64_t)objc_msgSend(v4, "absolutePhysicalPageIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)currentAbsolutePageIndex
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t result;

  if (!-[THDocumentNavigator visitedPagesAfterOpening](self, "visitedPagesAfterOpening")
    || !-[THDocumentNavigator sectionController](self, "sectionController"))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    return -[THSectionController absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForCenterOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v3 = objc_msgSend(-[THInteractiveCanvasController canvasView](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView");
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "contentSize");
  v7 = v6;
  objc_msgSend(v3, "frame");
  if (v5 >= 25.0)
  {
    if (v5 < v7 - v8 + -25.0)
      goto LABEL_11;
    v9 = objc_msgSend(objc_msgSend(-[NSArray lastObject](-[THNavigationUnit contentNodes](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodes"), "lastObject"), "pagesForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "context"))), "lastObject");
    if (!v9)
      goto LABEL_11;
LABEL_10:
    result = (unint64_t)objc_msgSend(v9, "absolutePageIndex");
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return result;
    goto LABEL_11;
  }
  v9 = objc_msgSend(objc_msgSend(-[NSArray firstObject](-[THNavigationUnit contentNodes](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodes"), "firstObject"), "pagesForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "context"))), "firstObject");
  if (v9)
    goto LABEL_10;
LABEL_11:
  v10 = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation");
  if (v10)
  {
    v11 = v10;
    result = (unint64_t)objc_msgSend(v10, "absolutePhysicalPageIndex");
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return result;
    v12 = -[THDocumentNavigationModel contentNodeForPageLocation:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForPageLocation:", v11);
    if (v12)
      return -[THDocumentRoot absolutePageIndexForStorageAnchor:](-[THDocumentNavigator documentRoot](self, "documentRoot"), "absolutePageIndexForStorageAnchor:", +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", v12, v11));
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)currentPageInfoForEndOfVisibleCanvas
{
  id result;

  result = -[THDocumentNavigator sectionController](self, "sectionController");
  if (result)
  {
    if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
    {
      return -[THSectionController pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "pageInfoForSecondQuadrantOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
    }
    else
    {
      return objc_msgSend(-[THDocumentNavigator currentContentNode](self, "currentContentNode"), "pageAtRelativeIndex:forPresentationType:", 0, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
    }
  }
  return result;
}

- (id)currentPageInfo
{
  if (!-[THDocumentNavigator visitedPagesAfterOpening](self, "visitedPagesAfterOpening")
    || !-[THDocumentNavigator sectionController](self, "sectionController"))
  {
    return 0;
  }
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    return -[THSectionController pageInfoForCenterOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "pageInfoForCenterOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
  }
  return objc_msgSend(-[THDocumentNavigator currentContentNode](self, "currentContentNode"), "pageAtRelativeIndex:forPresentationType:", 0, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
}

- (id)currentBookspotLocation
{
  id v3;
  THPageLocation *v4;

  v3 = -[THDocumentNavigator storageAnchorForCurrentPage](self, "storageAnchorForCurrentPage");
  if (!v3)
    return -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v4 = +[THPageLocation pageLocationWithStorageAnchor:](THPageLocation, "pageLocationWithStorageAnchor:", v3);
  if (-[THPageLocation absolutePhysicalPageIndex](v4, "absolutePhysicalPageIndex") == 0x7FFFFFFFFFFFFFFFLL)
    -[THPageLocation setAbsolutePhysicalPageIndex:](v4, "setAbsolutePhysicalPageIndex:", -[THDocumentRoot absolutePageIndexForStorageAnchor:](-[THDocumentNavigator documentRoot](self, "documentRoot"), "absolutePageIndexForStorageAnchor:", v3));
  return v4;
}

- (_NSRange)currentAbsolutePageIndexRange
{
  unint64_t v3;
  char *v4;
  id v5;
  NSUInteger v6;
  _NSRange result;

  if (!-[THDocumentNavigator sectionController](self, "sectionController"))
    goto LABEL_6;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    v5 = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation");
    if (v5)
    {
      v3 = (unint64_t)objc_msgSend(v5, "absolutePhysicalPageIndex");
LABEL_7:
      v4 = (_BYTE *)(&dword_0 + 1);
      goto LABEL_8;
    }
LABEL_6:
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  v3 = -[THSectionController absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForFirstQuadrantOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (char *)-[THSectionController absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForSecondQuadrantOfVisibleRectInInteractiveCanvasController:", -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"))- v3+ 1;
LABEL_8:
  v6 = v3;
  result.length = (NSUInteger)v4;
  result.location = v6;
  return result;
}

- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  THModelStorageAnchor *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSNotificationCenter *v14;
  __CFString *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v5 = a5;
  v6 = a4;
  if (a4)
    -[THBookspotHistoryStack recordCurrentLocationInHistory](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "recordCurrentLocationInHistory");
  v9 = -[THDocumentNavigationModel contentNodeForPageLocation:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForPageLocation:", a3);
  if (v9)
  {
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willJumpToPageLocation:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:willJumpToPageLocation:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willJumpToPageLocation:", self, a3);
    if (objc_msgSend(a3, "storageUID"))
    {
      v10 = -[THModelStorageAnchor initWithContentNode:pageLocation:]([THModelStorageAnchor alloc], "initWithContentNode:pageLocation:", v9, a3);
      if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookDescription"), "isEpub"))
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v11 = (uint64_t)objc_msgSend(a3, "absolutePhysicalPageIndex");
      }
      -[THModelStorageAnchor setAbsolutePageIndex:](v10, "setAbsolutePageIndex:", v11);
      -[THDocumentNavigator followAnchor:pulse:](self, "followAnchor:pulse:", v10, 0);

    }
    else
    {
      v12 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode"), "context"));
      -[THDocumentNavigator followAnchor:pulse:](self, "followAnchor:pulse:", -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v9, objc_msgSend(v9, "relativePageIndexForAbsolutePageIndex:forPresentationType:", objc_msgSend(a3, "absolutePhysicalPageIndex"), v12), v12), 0);
    }
    if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didJumpToPageLocation:") & 1) != 0)-[THDocumentNavigatorDelegate documentNavigator:didJumpToPageLocation:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didJumpToPageLocation:", self, a3);
    if (v6)
      -[THBookspotHistoryStack gotoBookspot:minor:](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "gotoBookspot:minor:", a3, v5);
    v13 = objc_msgSend(a3, "copy");
    v14 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v15 = THNavigationHistoryDidChangeNotification;
    v17[0] = CFSTR("pageLocation");
    v17[1] = CFSTR("minor");
    v18[0] = v13;
    v18[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
    -[NSNotificationCenter postNotificationName:object:](v14, "postNotificationName:object:", v15, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  }
  return v9 != 0;
}

- (unint64_t)currentAbsolutePageIndexForBookmarksUsingViewCenter:(BOOL)a3
{
  if (a3)
    return -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  else
    return -[THDocumentNavigator currentAbsolutePageIndexForEndOfVisibleCanvas](self, "currentAbsolutePageIndexForEndOfVisibleCanvas");
}

- (id)currentPageInfoForBookmarksUsingViewCenter:(BOOL)a3
{
  _BOOL4 v3;
  id result;
  id v6;

  v3 = a3;
  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated")|| !-[THBookDescription isEpub](-[THDocumentRoot bookDescription](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookDescription"), "isEpub"))
  {
    if (v3)
      return -[THDocumentNavigator currentPageInfo](self, "currentPageInfo");
    else
      return -[THDocumentNavigator currentPageInfoForEndOfVisibleCanvas](self, "currentPageInfoForEndOfVisibleCanvas");
  }
  else
  {
    result = -[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit");
    if (result)
    {
      v6 = -[THDocumentNavigator p_bodyStorageAnchorForFlow](self, "p_bodyStorageAnchorForFlow");
      +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
      return objc_msgSend(objc_msgSend(v6, "contentNode"), "pageInfoForStorageAnchor:forPresentationType:");
    }
  }
  return result;
}

- (unint64_t)currentChapterIndex
{
  THDocumentNavigationModel *v3;
  id v4;

  v3 = -[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel");
  v4 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  if (v3 && v4)
    return -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](v3, "navigationUnits"), "indexOfObject:", -[THDocumentNavigationModel navigationUnitContainingContentNode:](v3, "navigationUnitContainingContentNode:", v4));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_bodyStorageAnchorForAbsolutePageIndex:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;

  v5 = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForAbsolutePageIndex:", a3);
  v6 = objc_msgSend(v5, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
  v7 = objc_msgSend(v5, "storageAnchorForNodeRelativePageIndex:", v6);
  objc_msgSend(v7, "setNodeRelativePageIndex:", v6);
  return v7;
}

- (id)p_bodyStorageAnchorForFlow
{
  -[THInteractiveCanvasController visibleUnscaledRect](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
  return -[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:](self, "p_bodyStorageAnchorForFlowInRect:");
}

- (id)p_bodyStorageAnchorForFlowInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  THModelStorageAnchor *v14;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THDocumentNavigator rectForFlowAnchor](self, "rectForFlowAnchor");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectEqualToRect(v16, v17)
    || !-[THDocumentNavigator cachedFlowAnchorForRect](self, "cachedFlowAnchorForRect")
    || -[THDocumentNavigator followingAnchor](self, "followingAnchor"))
  {
    v8 = -[THSectionController bodyAnchorForCanvasRect:](-[THDocumentNavigator sectionController](self, "sectionController"), "bodyAnchorForCanvasRect:", x, y, width, height);
    v9 = -[THDocumentNavigator p_flowPivotRangeForBodyAnchor:](self, "p_flowPivotRangeForBodyAnchor:", v8);
    v11 = v10;
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 778, CFSTR("Failed to find a flow pivot range."));
    v12 = objc_msgSend(v8, "contentNode");
    v13 = objc_msgSend(v12, "relativePageIndexForBodyCharacterIndex:", v9);

    self->_cachedFlowAnchorForRect = 0;
    v14 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v12, objc_msgSend(v8, "storageUID"), v9, v11);
    self->_cachedFlowAnchorForRect = v14;
    -[THModelStorageAnchor setNodeRelativePageIndex:](v14, "setNodeRelativePageIndex:", v13);
    -[THDocumentNavigator setRectForFlowAnchor:](self, "setRectForFlowAnchor:", x, y, width, height);
  }
  return -[THDocumentNavigator cachedFlowAnchorForRect](self, "cachedFlowAnchorForRect");
}

- (id)storageAnchorForCurrentPage
{
  unint64_t v3;

  if (!-[THDocumentNavigator sectionController](self, "sectionController"))
    return 0;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))return -[THDocumentNavigator p_bodyStorageAnchorForFlow](self, "p_bodyStorageAnchorForFlow");
  v3 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return -[THDocumentNavigator p_bodyStorageAnchorForAbsolutePageIndex:](self, "p_bodyStorageAnchorForAbsolutePageIndex:", v3);
}

- (id)storageAnchorForAbsolutePageIndex:(unint64_t)a3
{
  if (!-[THDocumentNavigator sectionController](self, "sectionController"))
    return 0;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))return -[THDocumentNavigator p_bodyStorageAnchorForFlow](self, "p_bodyStorageAnchorForFlow");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return -[THDocumentNavigator p_bodyStorageAnchorForAbsolutePageIndex:](self, "p_bodyStorageAnchorForAbsolutePageIndex:", a3);
}

- (id)storageAnchorForBookmarksUsingViewCenter:(BOOL)a3
{
  _BOOL8 v3;
  id result;

  v3 = a3;
  result = -[THDocumentNavigator sectionController](self, "sectionController");
  if (result)
  {
    if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
    {
      return -[THDocumentNavigator p_bodyStorageAnchorForAbsolutePageIndex:](self, "p_bodyStorageAnchorForAbsolutePageIndex:", -[THDocumentNavigator currentAbsolutePageIndexForBookmarksUsingViewCenter:](self, "currentAbsolutePageIndexForBookmarksUsingViewCenter:", v3));
    }
    else
    {
      return -[THDocumentNavigator p_bodyStorageAnchorForFlow](self, "p_bodyStorageAnchorForFlow");
    }
  }
  return result;
}

- (id)currentPageLocationForCenterOfVisibleRectInInteractiveCanvasController
{
  id v3;
  unint64_t v5;

  -[THInteractiveCanvasController visibleUnscaledRect](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
  v3 = -[THDocumentNavigator p_bodyStorageAnchorForFlowInRect:](self, "p_bodyStorageAnchorForFlowInRect:");
  if (v3)
    return +[THPageLocation pageLocationWithStorageAnchor:](THPageLocation, "pageLocationWithStorageAnchor:", v3);
  v5 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", v5);
}

- (id)currentPageLocation
{
  id v3;
  unint64_t v5;

  v3 = -[THDocumentNavigator storageAnchorForCurrentPage](self, "storageAnchorForCurrentPage");
  if (v3)
    return +[THPageLocation pageLocationWithStorageAnchor:](THPageLocation, "pageLocationWithStorageAnchor:", v3);
  v5 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", v5);
}

- (id)pageLocationForAbsolutePageIndex:(unint64_t)a3
{
  id v4;

  v4 = -[THDocumentNavigator storageAnchorForAbsolutePageIndex:](self, "storageAnchorForAbsolutePageIndex:");
  if (v4)
    return +[THPageLocation pageLocationWithStorageAnchor:](THPageLocation, "pageLocationWithStorageAnchor:", v4);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", a3);
}

- (id)readingProgress
{
  return -[THDocumentNavigator readingProgressAllowSample:](self, "readingProgressAllowSample:", 0);
}

- (id)readingProgressAllowSample:(BOOL)a3
{
  id result;
  id v6;
  unint64_t v7;
  double v8;

  if (-[THDocumentRoot reflowablePaginationController](-[THDocumentNavigator documentRoot](self, "documentRoot"), "reflowablePaginationController")&& !-[THReflowablePaginationController paginationComplete](-[THDocumentRoot reflowablePaginationController](-[THDocumentNavigator documentRoot](self, "documentRoot"), "reflowablePaginationController"), "paginationComplete"))
  {
    return 0;
  }
  result = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation");
  if (!result)
    return result;
  v6 = result;
  if (!a3
    && -[THBookDescription isSample](-[THDocumentRoot bookDescription](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookDescription"), "isSample"))
  {
    return 0;
  }
  v7 = -[THDocumentNavigationModel pageCount](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
  if (!v7)
    return &off_468FF8;
  *(float *)&v8 = (float)(unint64_t)objc_msgSend(v6, "absolutePhysicalPageIndex") / (float)v7;
  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8);
}

- (id)linkForURL:(id)a3 inStorage:(id)a4
{
  return -[THDocumentNavigator linkForURL:inContentNode:](self, "linkForURL:inContentNode:", a3, -[THNavigationUnit contentNodeForInfo:](-[THSectionController currentNavigationUnit](-[THDocumentNavigator sectionController](self, "sectionController"), "currentNavigationUnit"), "contentNodeForInfo:", a4));
}

- (id)linkForURL:(id)a3 inContentNode:(id)a4
{
  NSString *v7;
  NSString *v8;

  v7 = (NSString *)objc_msgSend(a3, "absoluteString");
  if (!objc_msgSend(a3, "scheme"))
  {
    if (-[NSString hasPrefix:](v7, "hasPrefix:", CFSTR("OPS/")))
      v7 = -[NSString substringFromIndex:](v7, "substringFromIndex:", 4);
    if (a4)
    {
      v8 = (NSString *)objc_msgSend(CFSTR("apub:///0/0/0/"), "stringByAppendingString:", objc_msgSend(a4, "applePubRelativePath"));
      if (-[NSString characterAtIndex:](v7, "characterAtIndex:", 0) != 35)
        v8 = -[NSURL absoluteString](-[NSURL standardizedURL](+[NSURL URLWithString:](NSURL, "URLWithString:", -[NSString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("/../"))), "standardizedURL"), "absoluteString");
      v7 = -[NSString stringByAppendingString:](v8, "stringByAppendingString:", v7);
    }
  }
  return -[THModelLink initWithTarget:context:]([THModelLink alloc], "initWithTarget:context:", v7, -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
}

- (_NSRange)p_flowPivotRangeForBodyAnchor:(id)a3
{
  id v5;
  _BOOL8 v6;
  _BOOL8 v7;
  THSectionController *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_flowPivotRangeForBodyAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 1009, CFSTR("Attempting to calculate flow pivot text for rotation when not in flow mode."));
  }
  v5 = objc_msgSend(a3, "range");
  v7 = v6;
  if (!-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated"))
  {
    v8 = -[THDocumentNavigator sectionController](self, "sectionController");
    -[THInteractiveCanvasController visibleUnscaledRect](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    v9 = -[THSectionController firstLineInRect:forBodyAnchor:](v8, "firstLineInRect:forBodyAnchor:", a3);
    v11 = (uint64_t)v9 + v10 - 1;
    if (!v10)
      v11 = (uint64_t)v9;
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v10 != 0;
      v5 = (id)v11;
    }
  }
  v12 = (NSUInteger)v5;
  v13 = v7;
  result.length = v13;
  result.location = v12;
  return result;
}

- (unint64_t)currentNavigationUnitRelativePageIndex
{
  unint64_t v3;

  v3 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[THDocumentNavigationModel navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", v3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
}

- (void)p_jumpToContentNodeAnchor:(id)a3
{
  id v5;
  THDocumentNavigatorDelegate *v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (a3)
  {
    v5 = objc_msgSend(objc_msgSend(a3, "contentNode"), "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, v5, objc_msgSend(a3, "contentNode"));
    if (-[THDocumentRoot isCorrupt](-[THDocumentNavigator documentRoot](self, "documentRoot"), "isCorrupt"))
    {
      v6 = -[THDocumentNavigator delegate](self, "delegate");
      -[THDocumentNavigatorDelegate documentNavigatorBookIsCorrupt:](v6, "documentNavigatorBookIsCorrupt:", self, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      v7 = objc_msgSend(objc_msgSend(a3, "contentNode"), "pageCountForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
        v8 = 1;
      else
        v8 = (uint64_t)v7;
      -[THSectionController ensureLayoutThroughRelativePageRange:](-[THDocumentNavigator sectionController](self, "sectionController"), "ensureLayoutThroughRelativePageRange:", 0, v8);
      -[THSectionController sectionOriginForContentNode:](-[THDocumentNavigator sectionController](self, "sectionController"), "sectionOriginForContentNode:", objc_msgSend(a3, "contentNode"));
      if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v9;
        v12 = v10;
        -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, v5, objc_msgSend(a3, "contentNode"));
        -[THDocumentNavigatorDelegate documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:scrollToAbsolutePageIndex:specificUnscaledCanvasRect:animated:willPulse:", self, v5, 0, 0, v11, v12, 1.0, 1.0);
      }
    }
  }
}

- (void)p_jumpToPageAnchor:(id)a3
{
  if (a3)
    -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:animated:](self, "setVisibleAbsolutePhysicalPageIndex:animated:", objc_msgSend(a3, "absolutePageIndex"), 1);
}

- (id)p_anchorForLink:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_19AE6C;
  v10 = sub_19AE7C;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_19CC1C;
  v5[3] = &unk_42A970;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[THDocumentNavigator p_resolveLink:andCallBlock:](self, "p_resolveLink:andCallBlock:", a3, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  THPresentationType *v12;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat x;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  _QWORD *v34;
  THDocumentNavigator *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  THModelStorageAnchor *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[6];
  _QWORD v49[10];
  BOOL v50;
  _QWORD v51[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[6];
  BOOL v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  if (a3)
  {
    v4 = a4;
    v7 = objc_msgSend(a3, "contentNode");
    if (-[THDocumentRoot isCorrupt](-[THDocumentNavigator documentRoot](self, "documentRoot"), "isCorrupt"))
    {
      -[THDocumentNavigatorDelegate documentNavigatorBookIsCorrupt:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorBookIsCorrupt:", self);
      return;
    }
    if (-[THPresentationType isPaginated](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isPaginated")&& objc_msgSend(a3, "absolutePageIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[THDocumentNavigator p_scrollToAbsolutePageIndex:animated:](self, "p_scrollToAbsolutePageIndex:animated:", objc_msgSend(a3, "absolutePageIndex"), 0);
      return;
    }
    v8 = objc_msgSend(v7, "bodyStorageForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    if (!v8)
      v8 = objc_msgSend(v7, "bodyStorageForPresentationType:", +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context")));
    if (objc_msgSend(objc_msgSend(v7, "nodeUniqueIDForInfo:", v8), "isEqual:", objc_msgSend(a3, "storageUID")))
    {
      if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookDescription"), "isEpub"))
      {
        v9 = 0;
      }
      else
      {
        v9 = -[THSectionController absolutePageIndexForBodyStorageAnchor:](-[THDocumentNavigator sectionController](self, "sectionController"), "absolutePageIndexForBodyStorageAnchor:", a3);
      }
      -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, v9, v7);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_19D408;
      v56[3] = &unk_428E10;
      v56[4] = self;
      v56[5] = a3;
      v57 = v4;
      if (v4)
        v33 = a3;
      else
        v33 = 0;
      v34 = v56;
LABEL_29:
      v35 = self;
LABEL_30:
      -[THDocumentNavigator p_jumpWithBlock:andPulseStorageAnchor:](v35, "p_jumpWithBlock:andPulseStorageAnchor:", v34, v33);
      return;
    }
    v10 = objc_msgSend(v7, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
    if (!v10)
      return;
    v11 = v10;
    v12 = -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType");
    if (-[THPresentationType isFlow](v12, "isFlow"))
    {
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v16 = objc_msgSend(v7, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
      v17 = height;
      v18 = width;
      v19 = y;
      x = CGRectZero.origin.x;
      if (v16)
      {
        v21 = v16;
        v22 = 0;
        do
        {
          v23 = v21;
          v21 = objc_msgSend(v21, "parentInfo");
          v24 = objc_opt_class(THWAnchoredWidgetInfo);
          if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0)
            v22 = v21;
        }
        while (v21);
        v25 = objc_opt_class(TSWPStorage);
        if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0 && v22)
        {
          v52 = 0;
          v53 = &v52;
          v54 = 0x2020000000;
          v55 = 0x7FFFFFFFFFFFFFFFLL;
          v26 = objc_opt_class(TSWPDrawableAttachment);
          v27 = objc_msgSend(v23, "range");
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_19D490;
          v51[3] = &unk_42A998;
          v51[4] = v22;
          v51[5] = &v52;
          objc_msgSend(v23, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v26, v27, v28, v51);
          v17 = height;
          v18 = width;
          v19 = y;
          x = CGRectZero.origin.x;
          if (v53[3] != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, objc_msgSend(a3, "absolutePageIndex"), objc_msgSend(a3, "contentNode"));
            -[THSectionController rectForBodyAnchor:](-[THDocumentNavigator sectionController](self, "sectionController"), "rectForBodyAnchor:", +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v7, 0, v53[3], 1));
            x = v29;
            v19 = v30;
            v18 = v31;
            v17 = v32;
          }
          _Block_object_dispose(&v52, 8);
        }
        else
        {
          -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, objc_msgSend(a3, "absolutePageIndex"), objc_msgSend(a3, "contentNode"));
          -[THSectionController rectForContentNode:layout:](-[THDocumentNavigator sectionController](self, "sectionController"), "rectForContentNode:layout:", v7, -[THInteractiveCanvasController validatedLayoutForInfo:](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "validatedLayoutForInfo:", v23));
          x = v37;
          v19 = v38;
          v18 = v39;
          v17 = v40;
        }
      }
      v58.origin.x = x;
      v58.origin.y = v19;
      v58.size.width = v18;
      v58.size.height = v17;
      v60.origin.x = CGRectZero.origin.x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      if (CGRectEqualToRect(v58, v60))
      {
        v41 = -[THDocumentNavigator p_bodyRangeForStorageAnchorInFlow:](self, "p_bodyRangeForStorageAnchorInFlow:", a3);
        if (v41 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpToStorageAnchor:pulse:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 1234, CFSTR("Failed to find bodyRange in flow for targetStorageAnchor %@"), a3);
        }
        else
        {
          v43 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v7, 0, v41, v42);
          -[THDocumentNavigatorDelegate documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willNavigateToAbsolutePageIndex:inContentNode:", self, objc_msgSend(a3, "absolutePageIndex"), objc_msgSend(a3, "contentNode"));
          -[THSectionController rectForBodyAnchor:](-[THDocumentNavigator sectionController](self, "sectionController"), "rectForBodyAnchor:", v43);
          x = v44;
          v19 = v45;
          v18 = v46;
          v17 = v47;
        }
      }
      v59.origin.x = x;
      v59.origin.y = v19;
      v59.size.width = v18;
      v59.size.height = v17;
      v61.origin.x = CGRectZero.origin.x;
      v61.origin.y = y;
      v61.size.width = width;
      v61.size.height = height;
      if (!CGRectEqualToRect(v59, v61))
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_19D4E4;
        v49[3] = &unk_42A9C0;
        v49[4] = self;
        v49[5] = a3;
        *(CGFloat *)&v49[6] = x;
        *(CGFloat *)&v49[7] = v19;
        *(CGFloat *)&v49[8] = v18;
        *(CGFloat *)&v49[9] = v17;
        v50 = v4;
        v34 = v49;
        v35 = self;
        v33 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (-[THDocumentRoot reflowablePaginationController](-[THDocumentNavigator documentRoot](self, "documentRoot"), "reflowablePaginationController"))
      {
        v36 = -[THDocumentRoot absolutePageIndexForStorageAnchor:](-[THDocumentNavigator documentRoot](self, "documentRoot"), "absolutePageIndexForStorageAnchor:", a3);
      }
      else
      {
        v36 = objc_msgSend(v7, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(v7, "relativePageIndexForInfo:forPresentationType:", v11, v12), v12);
      }
      if (v36 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_19D538;
        v48[3] = &unk_427240;
        v48[4] = self;
        v48[5] = v36;
        if (v4)
          v33 = a3;
        else
          v33 = 0;
        v34 = v48;
        goto LABEL_29;
      }
    }
  }
}

- (void)p_jumpToAnnotationAnchor:(id)a3 pulse:(BOOL)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    v6 = objc_msgSend(a3, "annotation", _NSConcreteStackBlock, 3221225472, sub_19D5E0, &unk_427240, self, objc_msgSend(a3, "absolutePageIndex"));
    v7 = objc_msgSend(a3, "noteRange");
    -[THDocumentNavigator p_jumpWithBlock:annotation:noteSelectionRange:](self, "p_jumpWithBlock:annotation:noteSelectionRange:", &v9, v6, v7, v8);
  }
}

- (void)p_jumpWithBlock:(id)a3 andPulseStorageAnchor:(id)a4
{
  id v7;
  _QWORD v8[6];

  if (a3)
  {
    v7 = -[THDocumentNavigatorDelegate documentNavigator:willJumpToStorageAnchor:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willJumpToStorageAnchor:", self, a4);
    (*((void (**)(id))a3 + 2))(a3);
    if (a4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_19D73C;
      v8[3] = &unk_426E28;
      v8[4] = self;
      v8[5] = a4;
      -[THInteractiveCanvasController performBlockAfterNextLayout:](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "performBlockAfterNextLayout:", v8);
      -[THInteractiveCanvasController layoutInvalidated](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
      -[THInteractiveCanvasController layoutIfNeeded](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
      if (-[THPresentationType isFlow](-[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"), "isFlow"))
      {
        (*((void (**)(id))a3 + 2))(a3);
      }
    }
    -[THDocumentNavigatorDelegate documentNavigator:didJumpToStorageAnchor:withWillJumpReturn:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didJumpToStorageAnchor:withWillJumpReturn:", self, a4, v7);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpWithBlock:andPulseStorageAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 1299, CFSTR("Requested a jump without providing jump instructions."));
  }
}

- (void)p_jumpWithBlock:(id)a3 annotation:(id)a4 noteSelectionRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  _QWORD v11[9];
  _QWORD v12[6];

  if (a3)
  {
    length = a5.length;
    location = a5.location;
    v10 = -[THDocumentNavigatorDelegate documentNavigator:willJumpToStorageAnchor:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:willJumpToStorageAnchor:", self, 0);
    (*((void (**)(id))a3 + 2))(a3);
    if (a4)
    {
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12[0] = 0;
        v12[1] = v12;
        v12[2] = 0x3052000000;
        v12[3] = sub_19AE6C;
        v12[4] = sub_19AE7C;
        v12[5] = self;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_19D8FC;
        v11[3] = &unk_42A9E8;
        v11[4] = self;
        v11[5] = a4;
        v11[6] = v12;
        v11[7] = location;
        v11[8] = length;
        -[THInteractiveCanvasController performBlockAfterNextLayout:](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "performBlockAfterNextLayout:", v11);
        -[THInteractiveCanvasController layoutInvalidated](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
        -[THInteractiveCanvasController layoutIfNeeded](-[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
        _Block_object_dispose(v12, 8);
      }
    }
    -[THDocumentNavigatorDelegate documentNavigator:didJumpToStorageAnchor:withWillJumpReturn:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigator:didJumpToStorageAnchor:withWillJumpReturn:", self, 0, v10);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4, a5.location, a5.length), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_jumpWithBlock:annotation:noteSelectionRange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 1362, CFSTR("Requested a jump without providing jump instructions."));
  }
}

- (void)p_pulseStorageAnchor:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  THInteractiveCanvasController *v10;
  id v11;
  uint64_t v12;

  v5 = objc_msgSend(objc_msgSend(a3, "contentNode"), "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
  v6 = objc_opt_class(THWPStorage);
  *(_QWORD *)&v8 = TSUDynamicCast(v6, v5).n128_u64[0];
  if (v7)
  {
    v9 = v7;
    v10 = -[THDocumentNavigator interactiveCanvasController](self, "interactiveCanvasController", v8);
    v11 = objc_msgSend(a3, "range");
    -[THInteractiveCanvasController pulseStorage:range:](v10, "pulseStorage:range:", v9, v11, v12);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v8), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator p_pulseStorageAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 1393, CFSTR("Failed to find a storage for anchor %@"), a3);
  }
}

- (_NSRange)p_bodyRangeForStorageAnchorInFlow:(id)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[THDocumentNavigator bodyRangeForStorageAnchorInFlow:sectionController:](self, "bodyRangeForStorageAnchorInFlow:sectionController:", a3, -[THDocumentNavigator sectionController](self, "sectionController"));
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (_NSRange)bodyRangeForStorageAnchorInFlow:(id)a3 sectionController:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  v7 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
  v8 = +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[THDocumentNavigator documentRoot](self, "documentRoot"), "context"));
  v9 = objc_msgSend(a3, "contentNode");
  v10 = objc_msgSend(v9, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), v7);
  if (!v10)
    v10 = objc_msgSend(v9, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), v8);
  v11 = (NSUInteger)-[THDocumentNavigator p_bodyRangeForPossiblyAttachedInfo:body:](self, "p_bodyRangeForPossiblyAttachedInfo:body:", v10, objc_msgSend(objc_msgSend(a3, "contentNode"), "bodyStorageForPresentationType:", objc_msgSend(a4, "presentationType")));
  v13 = v12;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(objc_msgSend(a3, "contentNode"), "relativePageIndexForInfo:forPresentationType:", v10, v7);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v15 = objc_msgSend(objc_msgSend(a3, "contentNode", 0x7FFFFFFFFFFFFFFFLL), "relativePageIndexForInfo:forPresentationType:", v10, v8);
    v14 = v15;
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL && v10)
    {
      v16 = objc_msgSend(objc_msgSend(a3, "contentNode", 0x7FFFFFFFFFFFFFFFLL), "pageAtRelativeIndex:forPresentationType:", 0, v8);
      if (v16 && (id)TSDTopmostInfoFromInfo(v10) == v16)
      {
        v14 = 0;
        goto LABEL_12;
      }
    }
    else if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_12:
      v17 = objc_msgSend(v9, "storageAnchorForNodeRelativePageIndex:", v14);
      if (v17)
      {
        v11 = (NSUInteger)objc_msgSend(v17, "range");
        v13 = v18;
      }
      else
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_15;
    }
    v14 = objc_msgSend(a3, "nodeRelativePageIndex");
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    goto LABEL_12;
  }
LABEL_15:
  v19 = v13;
  result.length = v19;
  result.location = v11;
  return result;
}

- (_NSRange)p_bodyRangeForPossiblyAttachedInfo:(id)a3 body:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  const char *v23;
  __int128 v24;
  _NSRange result;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3010000000;
  v23 = "";
  v24 = xmmword_3146B0;
  v6 = objc_opt_class(TSWPAttachment);
  v7 = TSDTopmostOwningAttachmentFromInfo(a3);
  *(_QWORD *)&v9 = TSUDynamicCast(v6, v7).n128_u64[0];
  if (v8)
  {
    v10 = objc_msgSend(v8, "findCharIndex", v9);
    v11 = v21;
    v12 = 1;
    v21[4] = (uint64_t)v10;
    v11[5] = 1;
  }
  else
  {
    v13 = TSDTopmostInfoFromInfo(a3);
    v14 = objc_opt_class(TSWPDrawableAttachment);
    v15 = objc_msgSend(a4, "range");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_19DD78;
    v19[3] = &unk_42A998;
    v19[4] = v13;
    v19[5] = &v20;
    objc_msgSend(a4, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v14, v15, v16, v19);
    v10 = (id)v21[4];
    v12 = v21[5];
  }
  _Block_object_dispose(&v20, 8);
  v17 = (NSUInteger)v10;
  v18 = v12;
  result.length = v18;
  result.location = v17;
  return result;
}

- (unint64_t)lastAbsolutePageIndex
{
  uint64_t v3;
  double v4;
  id v5;
  id v6;
  char *v7;
  uint64_t v8;

  v3 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THDocumentRoot rootNode](-[THDocumentNavigator documentRoot](self, "documentRoot"), "rootNode")).n128_u64[0];
  v6 = objc_msgSend(objc_msgSend(v5, "childNodes", v4), "lastObject");
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = (char *)objc_msgSend(v6, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController"), "presentationType"));
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (&v7[v8])
    return (unint64_t)&v7[v8 - 1];
  return 0;
}

- (unint64_t)absolutePageIndexForPreviousSection
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;

  v3 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  v4 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(v3, "parent")).n128_u64[0];
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    v8 = v5;
    v9 = objc_msgSend(v5, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v6), "presentationType"));
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (unint64_t)v9;
      if (v9 >= (id)-[THDocumentNavigator currentAbsolutePageIndexForBeginningOfVisibleCanvas](self, "currentAbsolutePageIndexForBeginningOfVisibleCanvas"))
      {
        v10 = objc_opt_class(THModelContainerNode);
        *(_QWORD *)&v12 = TSUDynamicCast(v10, objc_msgSend(v8, "previousSibling")).n128_u64[0];
        if (v11)
          return (unint64_t)objc_msgSend(v11, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v12), "presentationType"));
        else
          return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v7;
}

- (unint64_t)absolutePageIndexForEndOfPreviousSection
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  v3 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  v4 = objc_opt_class(THModelContainerNode);
  TSUDynamicCast(v4, objc_msgSend(v3, "parent"));
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, objc_msgSend(v6, "previousSibling")).n128_u64[0];
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v11 = objc_msgSend(v8, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v9), "presentationType"));
    if (v11 != (id)0x7FFFFFFFFFFFFFFFLL && v12 != 0)
      return (unint64_t)v11 + v12 - 1;
  }
  return v10;
}

- (unint64_t)absolutePageIndexForNextSection
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;

  v3 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  v4 = objc_opt_class(THModelContainerNode);
  TSUDynamicCast(v4, objc_msgSend(v3, "parent"));
  v6 = v5;
  v7 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, objc_msgSend(v6, "nextSibling")).n128_u64[0];
  if (v8)
    return (unint64_t)objc_msgSend(v8, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v9), "presentationType"));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextVisibleAbsolutePageNumber
{
  char *v3;
  unint64_t v4;

  if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "visiblePageCountForDocumentNavigator:") & 1) != 0)v3 = (char *)-[THDocumentNavigatorDelegate visiblePageCountForDocumentNavigator:](-[THDocumentNavigator delegate](self, "delegate"), "visiblePageCountForDocumentNavigator:", self);
  else
    v3 = (_BYTE *)(&dword_0 + 1);
  v4 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  if (&v3[v4] <= (char *)-[THDocumentNavigator lastAbsolutePageIndex](self, "lastAbsolutePageIndex"))
    return (unint64_t)&v3[v4];
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)previousVisibleAbsolutePageNumber
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "visiblePageCountForDocumentNavigator:") & 1) != 0)v3 = -[THDocumentNavigatorDelegate visiblePageCountForDocumentNavigator:](-[THDocumentNavigator delegate](self, "delegate"), "visiblePageCountForDocumentNavigator:", self);
  else
    v3 = &dword_0 + 1;
  v4 = -[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  v5 = -[THDocumentNavigator absolutePageIndexForBeginningOfSection](self, "absolutePageIndexForBeginningOfSection");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4 <= v5 || (v6 = v5, v4 >= (unint64_t)v3 + v5))
    {
      if (v4 == v5)
        return -[THDocumentNavigator absolutePageIndexForEndOfPreviousSection](self, "absolutePageIndexForEndOfPreviousSection");
      v6 = v4 - (_QWORD)v3;
      if (v4 < (unint64_t)v3)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (unint64_t)absolutePageIndexForBeginningOfSection
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;

  v3 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  v4 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(v3, "parent")).n128_u64[0];
  if (v5)
    return (unint64_t)objc_msgSend(v5, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v6), "presentationType"));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)absolutePageIndexForEndOfSection
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  unint64_t v7;
  id v8;
  uint64_t v9;

  v3 = -[THDocumentNavigator currentContentNode](self, "currentContentNode");
  v4 = objc_opt_class(THModelContainerNode);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(v3, "parent")).n128_u64[0];
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    v8 = objc_msgSend(v5, "absolutePageRangeForPresentationType:", -[THSectionController presentationType](-[THDocumentNavigator sectionController](self, "sectionController", v6), "presentationType"));
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL && v9 != 0)
      return (unint64_t)v8 + v9 - 1;
  }
  return v7;
}

- (BOOL)canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  unint64_t v7;
  id v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;
  id v14;
  NSString *v15;
  BOOL result;
  unint64_t v17;

  if (-[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v7 = -[THDocumentNavigator lastAbsolutePageIndex](self, "lastAbsolutePageIndex");
      switch(a4)
      {
        case 0:
          v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator canNavigateByBookDirection:bookGranularity:]");
          v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m");
          v11 = v8;
          v12 = v9;
          v13 = 1695;
          goto LABEL_8;
        case 1:
          result = -[THDocumentNavigator nextVisibleAbsolutePageNumber](self, "nextVisibleAbsolutePageNumber") <= v7;
          break;
        case 2:
          v17 = -[THDocumentNavigator absolutePageIndexForBeginningOfSection](self, "absolutePageIndexForBeginningOfSection");
          goto LABEL_18;
        case 3:
          v17 = -[THDocumentNavigator absolutePageIndexForNextSection](self, "absolutePageIndexForNextSection");
          goto LABEL_18;
        case 4:
          goto LABEL_11;
        default:
          return 0;
      }
      return result;
    }
    return 0;
  }
  switch(a4)
  {
    case 0:
      v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator canNavigateByBookDirection:bookGranularity:]");
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m");
      v11 = v14;
      v12 = v15;
      v13 = 1736;
LABEL_8:
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v10, v13, CFSTR("Not implemented."));
      return 0;
    case 1:
      v17 = -[THDocumentNavigator previousVisibleAbsolutePageNumber](self, "previousVisibleAbsolutePageNumber");
      goto LABEL_18;
    case 2:
      v17 = -[THDocumentNavigator absolutePageIndexForEndOfSection](self, "absolutePageIndexForEndOfSection");
      goto LABEL_18;
    case 3:
      v17 = -[THDocumentNavigator absolutePageIndexForPreviousSection](self, "absolutePageIndexForPreviousSection");
LABEL_18:
      result = v17 != 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 4:
LABEL_11:
      result = 1;
      break;
    default:
      return 0;
  }
  return result;
}

- (void)scrollToNextSection
{
  _QWORD v3[6];

  if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorWillScrollToNextSection:completionBlock:") & 1) != 0)
  {
    -[THDocumentNavigator setIsScrollingAcrossSections:](self, "setIsScrollingAcrossSections:", 1);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_19E578;
    v3[3] = &unk_427240;
    v3[4] = self;
    v3[5] = -[THDocumentNavigator absolutePageIndexForNextSection](self, "absolutePageIndexForNextSection");
    -[THDocumentNavigatorDelegate documentNavigatorWillScrollToNextSection:completionBlock:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorWillScrollToNextSection:completionBlock:", self, v3);
  }
  else
  {
    -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](self, "setVisibleAbsolutePhysicalPageIndex:", -[THDocumentNavigator absolutePageIndexForNextSection](self, "absolutePageIndexForNextSection"));
  }
}

- (void)scrollToPreviousSection
{
  _QWORD v3[6];

  if ((objc_opt_respondsToSelector(-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorWillScrollToPreviousSection:completionBlock:") & 1) != 0)
  {
    -[THDocumentNavigator setIsScrollingAcrossSections:](self, "setIsScrollingAcrossSections:", 1);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_19E65C;
    v3[3] = &unk_427240;
    v3[4] = self;
    v3[5] = -[THDocumentNavigator previousVisibleAbsolutePageNumber](self, "previousVisibleAbsolutePageNumber");
    -[THDocumentNavigatorDelegate documentNavigatorWillScrollToPreviousSection:completionBlock:](-[THDocumentNavigator delegate](self, "delegate"), "documentNavigatorWillScrollToPreviousSection:completionBlock:", self, v3);
  }
  else
  {
    -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](self, "setVisibleAbsolutePhysicalPageIndex:", -[THDocumentNavigator previousVisibleAbsolutePageNumber](self, "previousVisibleAbsolutePageNumber"));
  }
}

- (BOOL)canNavigateByHistoryDirection:(int)a3
{
  if (-[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (a3 != 2)
  {
    if (a3 == 1)
      return -[THBookspotHistoryStack hasNextBookspot](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "hasNextBookspot");
    return 0;
  }
  return -[THBookspotHistoryStack hasPrevBookspot](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "hasPrevBookspot");
}

- (void)navigateByHistoryDirection:(int)a3
{
  if (-[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      -[THBookspotHistoryStack gotoPrevBookspot](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "gotoPrevBookspot");
    }
    else if (a3 == 1)
    {
      -[THBookspotHistoryStack gotoNextBookspot](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "gotoNextBookspot");
    }
  }
}

- (void)navigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  id v13;
  NSString *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  THDocumentNavigator *v20;
  unint64_t v21;

  if (-[THDocumentNavigator currentAbsolutePageIndex](self, "currentAbsolutePageIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      switch(a4)
      {
        case 0:
          v13 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator navigateByBookDirection:bookGranularity:]");
          v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m");
          v10 = v13;
          v11 = v14;
          v12 = 1931;
LABEL_8:
          objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v9, v12, CFSTR("Not implemented."));
          return;
        case 1:
          v21 = -[THDocumentNavigator previousVisibleAbsolutePageNumber](self, "previousVisibleAbsolutePageNumber");
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = v21;
            if (v21 >= -[THDocumentNavigator absolutePageIndexForBeginningOfSection](self, "absolutePageIndexForBeginningOfSection"))
            {
LABEL_24:
              v20 = self;
              v19 = v17;
              goto LABEL_25;
            }
            -[THDocumentNavigator scrollToPreviousSection](self, "scrollToPreviousSection");
          }
          return;
        case 2:
          v18 = -[THDocumentNavigator absolutePageIndexForBeginningOfSection](self, "absolutePageIndexForBeginningOfSection");
          goto LABEL_17;
        case 3:
          v18 = -[THDocumentNavigator absolutePageIndexForPreviousSection](self, "absolutePageIndexForPreviousSection");
LABEL_17:
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
            return;
LABEL_19:
          v19 = v18;
          v20 = self;
LABEL_25:
          -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:animated:](v20, "setVisibleAbsolutePhysicalPageIndex:animated:", v19, 1);
          break;
        case 4:
          v20 = self;
          v19 = 0;
          goto LABEL_25;
        default:
          return;
      }
    }
    else if (a3 == 1)
    {
      switch(a4)
      {
        case 0:
          v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator navigateByBookDirection:bookGranularity:]");
          v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m");
          v10 = v7;
          v11 = v8;
          v12 = 1876;
          goto LABEL_8;
        case 1:
          v15 = -[THDocumentNavigator lastAbsolutePageIndex](self, "lastAbsolutePageIndex");
          v16 = -[THDocumentNavigator nextVisibleAbsolutePageNumber](self, "nextVisibleAbsolutePageNumber");
          if (v16 > v15)
            return;
          v17 = v16;
          if (v16 <= -[THDocumentNavigator absolutePageIndexForEndOfSection](self, "absolutePageIndexForEndOfSection"))
            goto LABEL_24;
          -[THDocumentNavigator scrollToNextSection](self, "scrollToNextSection");
          break;
        case 2:
          v18 = -[THDocumentNavigator absolutePageIndexForEndOfSection](self, "absolutePageIndexForEndOfSection");
          goto LABEL_17;
        case 3:
          v18 = -[THDocumentNavigator absolutePageIndexForNextSection](self, "absolutePageIndexForNextSection");
          goto LABEL_17;
        case 4:
          v18 = -[THDocumentNavigator lastAbsolutePageIndex](self, "lastAbsolutePageIndex");
          goto LABEL_19;
        default:
          return;
      }
    }
  }
}

- (BOOL)isPageLocationValid:(id)a3
{
  id v6;

  if (!a3)
    return 0;
  if (objc_msgSend(a3, "absolutePhysicalPageIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = objc_msgSend(a3, "absolutePhysicalPageIndex");
  return v6 < (id)-[THDocumentNavigationModel pageCount](-[THDocumentRoot navigationModel](-[THDocumentNavigator documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
}

- (BOOL)restorePlaceholderWithOverrideLocation:(id)a3
{
  unsigned int v5;
  THBookspotHistoryStack *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  if (!-[THDocumentNavigator documentRoot](self, "documentRoot"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator restorePlaceholderWithOverrideLocation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 2000, CFSTR("invalid nil value for '%s'"), "self.documentRoot");
  v9 = 0;
  v10 = 0;
  -[THAnnotationStorageController getPlaceholder:andPageHistory:](-[THDocumentRoot annotationController](-[THDocumentNavigator documentRoot](self, "documentRoot"), "annotationController"), "getPlaceholder:andPageHistory:", &v10, &v9);
  v5 = -[THDocumentNavigator isPageLocationValid:](self, "isPageLocationValid:", v10);
  if (v5 && v9)
  {
    v6 = -[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack");
    -[THBookspotHistoryStack resetWithDictionaryRepresentation:](v6, "resetWithDictionaryRepresentation:", v9);
  }
  if (!a3 || (v7 = 1, !-[THDocumentNavigator followAnchor:pulse:](self, "followAnchor:pulse:", a3, 1)))
  {
    if (v5)
    {
      return -[THDocumentNavigator jumpToPageLocation:touchHistory:minor:](self, "jumpToPageLocation:touchHistory:minor:", v10, v9 == 0, 1);
    }
    else
    {
      -[THDocumentNavigator setVisitedPagesAfterOpening:](self, "setVisitedPagesAfterOpening:", 0);
      return 0;
    }
  }
  return v7;
}

- (void)savePlaceholder
{
  THAnnotationStorageController *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  THAnnotationStorageController *v8;
  id v9;
  id v10;

  if (!-[THDocumentNavigator documentRoot](self, "documentRoot"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentNavigator savePlaceholder]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THDocumentNavigator.m"), 2036, CFSTR("invalid nil value for '%s'"), "self.documentRoot");
  v3 = -[THDocumentRoot annotationController](-[THDocumentNavigator documentRoot](self, "documentRoot"), "annotationController");
  if (-[THDocumentRoot isCorrupt](-[THDocumentNavigator documentRoot](self, "documentRoot"), "isCorrupt")
    || (v4 = -[THDocumentNavigator currentPageLocation](self, "currentPageLocation"),
        v5 = -[THDocumentNavigator storageAnchorForCurrentPage](self, "storageAnchorForCurrentPage"),
        v6 = -[THBookspotHistoryStack dictionaryRepresentation](-[THDocumentRoot bookspotHistoryStack](-[THDocumentNavigator documentRoot](self, "documentRoot"), "bookspotHistoryStack"), "dictionaryRepresentation"), !objc_msgSend(v4, "absolutePhysicalPageIndex")))
  {
    v8 = v3;
    v9 = 0;
    v10 = 0;
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "contentNode");
    v8 = v3;
    v9 = v4;
    v10 = v6;
  }
  -[THAnnotationStorageController setPlaceholder:pageHistoryDictionary:withContentNode:](v8, "setPlaceholder:pageHistoryDictionary:withContentNode:", v9, v10, v7);
}

- (THDocumentNavigatorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THDocumentNavigatorDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->_documentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)isScrollingAcrossSections
{
  return self->_isScrollingAcrossSections;
}

- (void)setIsScrollingAcrossSections:(BOOL)a3
{
  self->_isScrollingAcrossSections = a3;
}

- (BOOL)visitedPagesAfterOpening
{
  return self->_visitedPagesAfterOpening;
}

- (void)setVisitedPagesAfterOpening:(BOOL)a3
{
  self->_visitedPagesAfterOpening = a3;
}

- (THPageSpotHistory)pagespotHistory
{
  return self->_pagespotHistory;
}

- (void)setPagespotHistory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THModelStorageAnchor)cachedFlowAnchorForRect
{
  return self->_cachedFlowAnchorForRect;
}

- (void)setCachedFlowAnchorForRect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CGRect)rectForFlowAnchor
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForFlowAnchor.origin.x;
  y = self->_rectForFlowAnchor.origin.y;
  width = self->_rectForFlowAnchor.size.width;
  height = self->_rectForFlowAnchor.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectForFlowAnchor:(CGRect)a3
{
  self->_rectForFlowAnchor = a3;
}

- (BOOL)followingAnchor
{
  return self->_followingAnchor;
}

- (void)setFollowingAnchor:(BOOL)a3
{
  self->_followingAnchor = a3;
}

@end
