@implementation THSectionInfo

- (void)dealloc
{
  objc_super v3;

  -[THSectionInfo setPages:](self, "setPages:", 0);
  -[THSectionInfo setPageController:](self, "setPageController:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THSectionInfo;
  -[THSectionInfo dealloc](&v3, "dealloc");
}

- (id)copyWithContext:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo copyWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 38, CFSTR("not implemented"));
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setOwningAttachment:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 47, CFSTR("Can't put a section info in an attachment. What does that even mean!"));
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)isFloatingAboveText
{
  return 1;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THSectionLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THSectionRep, a2);
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (void)setParentInfo:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setParentInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 83, CFSTR("Can't set the parent info of a THSectionInfo"));
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo setGeometry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 91, CFSTR("Can't set geometry on TSDInfoGeometry"));
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[THSectionInfo pages](self, "pages"));
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo childCommandForReplaceAllCommand:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 110, CFSTR("THSectionInfo objects should not be included when enumerating model objects"));
  return 0;
}

- (id)childEnumerator
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionInfo childEnumerator]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionInfo.mm"), 116, CFSTR("THSectionInfo objects should not be included when enumerating model objects"));
  return 0;
}

- (THModelPageInfo)lastPage
{
  NSArray *v2;
  id v3;
  id v4;
  THModelPageInfo *v5;
  uint64_t v6;
  void *i;
  THModelPageInfo *v8;
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
  v2 = -[THSectionInfo pages](self, "pages", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
      v8 = *(THModelPageInfo **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      if (v5)
      {
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "relativePageIndexInParent");
        if (v9 <= (id)-[THModelPageInfo relativePageIndexInParent](v5, "relativePageIndexInParent"))
          continue;
      }
      v5 = v8;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v4);
  return v5;
}

- (THModelContentNode)contentNode
{
  return (THModelContentNode *)-[THPageController contentNode](-[THSectionInfo pageController](self, "pageController"), "contentNode");
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> pages = %@"), objc_opt_class(self, a2), self, self->mPages);
}

- (BOOL)anchorAtOrigin
{
  return self->mAnchorAtOrigin;
}

- (void)setAnchorAtOrigin:(BOOL)a3
{
  self->mAnchorAtOrigin = a3;
}

- (NSArray)pages
{
  return self->mPages;
}

- (void)setPages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (THPageController)pageController
{
  return self->mPageController;
}

- (void)setPageController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setLastPage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
