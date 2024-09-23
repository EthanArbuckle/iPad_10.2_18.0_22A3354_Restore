@implementation THModelNode

- (BOOL)includeInTOC
{
  return self->mIncludeInTOC;
}

- (void)setIncludeInTOC:(BOOL)a3
{
  -[THModelNode willModify](self, "willModify");
  self->mIncludeInTOC = a3;
}

- (NSString)nodeGUID
{
  return self->mGUID;
}

- (void)setNodeGUID:(id)a3
{
  id v5;

  -[THModelNode willModify](self, "willModify");
  v5 = a3;

  self->mGUID = (NSString *)a3;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  id v5;

  -[THModelNode willModify](self, "willModify");
  v5 = a3;

  self->mTitle = (NSString *)a3;
}

- (int)state
{
  return self->mState;
}

- (void)setState:(int)a3
{
  -[THModelNode willModify](self, "willModify");
  self->mState = a3;
}

- (THModelContainerNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  -[THModelNode willModify](self, "willModify");
  self->mParent = (THModelContainerNode *)a3;
}

- (THModelNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  _BOOL8 v6;
  THModelNode *v8;
  THModelNode *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)THModelNode;
  v8 = -[THModelNode initWithContext:](&v11, "initWithContext:", a5);
  v9 = v8;
  if (v8)
  {
    -[THModelNode setState:](v8, "setState:", 0);
    -[THModelNode setNodeGUID:](v9, "setNodeGUID:", +[NSString tsu_stringWithUUID](NSString, "tsu_stringWithUUID"));
    -[THModelNode setTitle:](v9, "setTitle:", a3);
    -[THModelNode setIncludeInTOC:](v9, "setIncludeInTOC:", v6);
    -[THModelNode setPaginatedPresentationType:](v9, "setPaginatedPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", a5));
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->mGUID = 0;
  self->mTitle = 0;

  self->mPageCountByPresentationType = 0;
  self->mPaginatedPresentationType = 0;
  self->mParent = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelNode;
  -[THModelNode dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(THModelNode, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[NSString isEqualToString:](-[THModelNode nodeGUID](self, "nodeGUID"), "isEqualToString:", objc_msgSend(a3, "nodeGUID"));
  else
    return 0;
}

- (unint64_t)precedingPageCountForPresentationType:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;

  v5 = -[THModelNode precedingPageCountForPresentationType:](-[THModelNode parent](self, "parent"), "precedingPageCountForPresentationType:", a3);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = -[THModelNode previousSibling](self, "previousSibling");
    if (v8)
    {
      v9 = v8;
      v6 = v7;
      while (1)
      {
        v10 = objc_msgSend(v9, "pageCountForPresentationType:", a3);
        if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
          break;
        v6 += (unint64_t)v10;
        v9 = objc_msgSend(v9, "previousSibling");
        if (!v9)
          return v6;
      }
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      return v7;
    }
  }
  return v6;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode pageCountForPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 114, CFSTR("Subclasses must override"));
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setPageCount:(unint64_t)a3 forPresentationType:(id)a4
{
  TSUNoCopyDictionary *mPageCountByPresentationType;
  TSUNoCopyDictionary *v8;

  mPageCountByPresentationType = self->mPageCountByPresentationType;
  if (mPageCountByPresentationType)
  {
    objc_msgSend(-[TSUNoCopyDictionary objectForKey:](mPageCountByPresentationType, "objectForKey:", a4), "integerValue");
    v8 = self->mPageCountByPresentationType;
  }
  else
  {
    v8 = (TSUNoCopyDictionary *)objc_msgSend(objc_alloc((Class)TSUNoCopyDictionary), "initWithCapacity:", 2);
    self->mPageCountByPresentationType = v8;
  }
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](v8, "setObject:forUncopiedKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), a4);
}

- (_NSRange)absolutePageRangeForPresentationType:(id)a3
{
  unint64_t v5;
  id v6;
  id v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[THModelNode pageCountForPresentationType:](self, "pageCountForPresentationType:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = NSInvalidRange[0];
    v7 = NSInvalidRange[1];
  }
  else
  {
    v7 = (id)v5;
    v6 = -[THModelNode precedingPageCountForPresentationType:](self, "precedingPageCountForPresentationType:", a3);
  }
  v8 = (NSUInteger)v7;
  result.length = v8;
  result.location = (NSUInteger)v6;
  return result;
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode pageAtRelativeIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 148, CFSTR("Subclasses must override"));
  return 0;
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode contentNodeForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 153, CFSTR("Subclasses must override"));
  return 0;
}

- (void)addMappingFromGUIDToNodeToDictionary:(id)a3
{
  objc_msgSend(a3, "setObject:forKey:", self, -[THModelNode nodeGUID](self, "nodeGUID"));
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id v7;
  id v8;

  if (-[THModelNode parent](self, "parent"))
  {
    a3 = -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THModelNode parent](self, "parent"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, a4);
    v7 = -[THModelNode previousSibling](self, "previousSibling");
    if (v7)
    {
      v8 = v7;
      do
      {
        a3 -= (unint64_t)objc_msgSend(v8, "pageCountForPresentationType:", a4);
        v8 = objc_msgSend(v8, "previousSibling");
      }
      while (v8);
    }
  }
  return a3;
}

- (unint64_t)relativePageIndexForAbsolutePageIndex:(unint64_t)a3
{
  return -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](self, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, -[THModelNode paginatedPresentationType](self, "paginatedPresentationType"));
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  unint64_t v5;

  v5 = -[THModelNode precedingPageCountForPresentationType:](self, "precedingPageCountForPresentationType:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v5 + a3;
}

- (unint64_t)absolutePageIndexForRelativePageIndex:(unint64_t)a3
{
  return -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](self, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, -[THModelNode paginatedPresentationType](self, "paginatedPresentationType"));
}

- (id)modelLinkWithFragment:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  THModelNode *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", objc_msgSend(-[THModelNode documentRoot](self, "documentRoot"), "applePubDocId"));
  v7 = objc_opt_class(THModelContentNode, v6);
  v8 = (void *)TSUDynamicCast(v7, self);
  if (v8)
    goto LABEL_2;
  v11 = objc_opt_class(THModelContainerNode, v9);
  v12 = self;
  while (1)
  {
    v13 = (void *)TSUDynamicCast(v11, v12);
    v14 = v13;
    if (!v13)
      break;
    if (!objc_msgSend(v13, "count"))
      break;
    v15 = objc_msgSend(v14, "nodeAtIndex:", 0);
    v17 = objc_opt_class(THModelContainerNode, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
      break;
    v19 = objc_opt_class(THModelContainerNode, v18);
    v12 = (THModelNode *)objc_msgSend(v14, "nodeAtIndex:", 0);
    v11 = v19;
  }
  if (objc_msgSend(v14, "count"))
  {
    v21 = objc_opt_class(THModelContentNode, v20);
    v8 = (void *)TSUDynamicCast(v21, objc_msgSend(v14, "nodeAtIndex:", 0));
    if (v8)
LABEL_2:
      v5 = objc_msgSend(v5, "stringByAppendingPathComponent:", objc_msgSend(v8, "applePubRelativePath"));
  }
  return -[THModelLink initWithPath:fragment:context:]([THModelLink alloc], "initWithPath:fragment:context:", v5, a3, objc_msgSend(-[THModelNode documentRoot](self, "documentRoot"), "context"));
}

- (BOOL)isRoot
{
  return -[THModelNode parent](self, "parent") == 0;
}

- (void)enterAddingState:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterAddingState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 231, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[THModelNode setState:](self, "setState:", 1);
}

- (void)enterAddedState:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterAddedState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 238, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[THModelNode setState:](self, "setState:", 2);
}

- (void)enterRemovingState:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterRemovingState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 245, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[THModelNode setState:](self, "setState:", 3);
}

- (void)enterRemovedState:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode enterRemovedState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 252, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[THModelNode setState:](self, "setState:", 4);
}

- (id)nextSibling
{
  return -[THModelContainerNode nodeAfterNode:](-[THModelNode parent](self, "parent"), "nodeAfterNode:", self);
}

- (id)previousSibling
{
  return -[THModelContainerNode nodeBeforeNode:](-[THModelNode parent](self, "parent"), "nodeBeforeNode:", self);
}

- (id)majorSnippet
{
  return 0;
}

- (id)minorSnippet
{
  return 0;
}

- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4
{
  id v7;
  unint64_t v8;
  id v9;

  v7 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0);
  v8 = -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](self, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, a4);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](self, "contentNodeForRelativePageIndex:forPresentationType:", v8, a4);
    if (v9)
      return objc_msgSend(v9, "pageNumberStringForAbsolutePageIndex:presentationType:", a3, a4);
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return v7;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3 + 1);
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((-[THModelNode state](self, "state", a3, a4) | 4) == 4)
  {
    v7 = objc_opt_class(THDocumentRoot, v6);
    v8 = TSUDynamicCast(v7, a3);
    -[THModelNode enterAddingState:](self, "enterAddingState:", v8);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode willBeAddedToDocumentRoot:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 313, CFSTR("Invalid DOLC state transition willBeAddedToDocument"));
  }
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (-[THModelNode state](self, "state", a3, a4) == 1)
  {
    v7 = objc_opt_class(THDocumentRoot, v6);
    v8 = TSUDynamicCast(v7, a3);
    -[THModelNode enterAddedState:](self, "enterAddedState:", v8);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode wasAddedToDocumentRoot:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 327, CFSTR("Invalid DOLC state transition wasAddedToDocument"));
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[THModelNode state](self, "state") == 2)
  {
    v6 = objc_opt_class(THDocumentRoot, v5);
    v7 = TSUDynamicCast(v6, a3);
    -[THModelNode enterRemovingState:](self, "enterRemovingState:", v7);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode willBeRemovedFromDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 342, CFSTR("Invalid DOLC state transition willBeRemovedFromDocument"));
  }
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[THModelNode state](self, "state") == 4)
  {
    v6 = objc_opt_class(THDocumentRoot, v5);
    v7 = TSUDynamicCast(v6, a3);
    -[THModelNode enterRemovedState:](self, "enterRemovedState:", v7);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelNode wasRemovedFromDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelNode.m"), 356, CFSTR("Invalid DOLC state transition wasRemovedFromDocument"));
  }
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (THPresentationType)paginatedPresentationType
{
  return self->mPaginatedPresentationType;
}

- (void)setPaginatedPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
