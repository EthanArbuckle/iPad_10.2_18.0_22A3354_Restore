@implementation THContentLinkResolver

+ (id)contentLinkResolverWithContentNode:(id)a3 presentationType:(id)a4
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithContentNode:presentationType:", a3, a4);
}

- (THContentLinkResolver)initWithContentNode:(id)a3 presentationType:(id)a4
{
  THContentLinkResolver *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THContentLinkResolver;
  v6 = -[THContentLinkResolver init](&v8, "init");
  if (v6)
  {
    v6->mPresentationType = (THPresentationType *)a4;
    v6->mContentNode = (THModelContentNode *)a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->mContentNode = 0;
  self->mPresentationType = 0;
  v3.receiver = self;
  v3.super_class = (Class)THContentLinkResolver;
  -[THContentLinkResolver dealloc](&v3, "dealloc");
}

- (id)navigableAnchorFromLink:(id)a3
{
  id result;

  result = -[THContentLinkResolver p_storageAnchorFromLink:](self, "p_storageAnchorFromLink:");
  if (!result)
  {
    result = -[THContentLinkResolver p_contentNodeAnchorFromLink:](self, "p_contentNodeAnchorFromLink:", a3);
    if (!result)
      return -[THContentLinkResolver p_pageAnchorFromLink:](self, "p_pageAnchorFromLink:", a3);
  }
  return result;
}

+ (id)navigableAnchorFromLink:(id)a3 withContentNode:(id)a4 presentationType:(id)a5
{
  return -[THContentLinkResolver navigableAnchorFromLink:](+[THContentLinkResolver contentLinkResolverWithContentNode:presentationType:](THContentLinkResolver, "contentLinkResolverWithContentNode:presentationType:", a4, a5), "navigableAnchorFromLink:", a3);
}

- (BOOL)p_linkContentNodeIsConsistentWithOurs:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = objc_msgSend(a3, "docRelativePath");
  if (!v4
    || (v5 = objc_msgSend(v4, "isEqualToString:", -[THModelContentNode applePubRelativePath](-[THContentLinkResolver contentNode](self, "contentNode"), "applePubRelativePath"))) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)p_pageAnchorFromLink:(id)a3
{
  THModelPageAnchor *v5;
  _BYTE *v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;

  if (!-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THContentLinkResolver p_pageAnchorFromLink:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THContentLinkResolver.m"), 99, CFSTR("Resolving URL path specifying content node which unexpectedly does not match ours."));
  if (!-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:", a3))return 0;
  v5 = -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", -[THContentLinkResolver contentNode](self, "contentNode"), 0, -[THContentLinkResolver presentationType](self, "presentationType"));
  if (objc_msgSend(a3, "isCustom"))
  {
    if (objc_msgSend(a3, "isCustomPage"))
    {
      v6 = objc_msgSend(a3, "customPageIndex");
      if (v6 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = v6;
        v8 = -[THModelNode absolutePageRangeForPresentationType:](-[THContentLinkResolver contentNode](self, "contentNode"), "absolutePageRangeForPresentationType:", -[THContentLinkResolver presentationType](self, "presentationType"));
        if (v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL && v7 >= v8 && v7 - v8 < v9)
          return -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", -[THContentLinkResolver contentNode](self, "contentNode"), -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THContentLinkResolver contentNode](self, "contentNode"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", v7, -[THContentLinkResolver presentationType](self, "presentationType")), -[THContentLinkResolver presentationType](self, "presentationType"));
      }
    }
  }
  return v5;
}

- (id)p_storageAnchorFromLink:(id)a3
{
  id v5;

  if (!-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THContentLinkResolver p_storageAnchorFromLink:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THContentLinkResolver.m"), 128, CFSTR("Resolving URL path specifying content node which unexpectedly does not match ours."));
  if (!-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:", a3))return 0;
  if (objc_msgSend(a3, "isOrdinary"))
    return -[THContentLinkResolver p_storageAnchorFromFixedAnchor:](self, "p_storageAnchorFromFixedAnchor:", -[THModelFixedAnchor initWithContentNode:elementId:]([THModelFixedAnchor alloc], "initWithContentNode:elementId:", -[THContentLinkResolver contentNode](self, "contentNode"), objc_msgSend(a3, "fragment")));
  if (objc_msgSend(a3, "isDynamic")
    && (v5 = objc_msgSend(objc_msgSend(a3, "fragment"), "componentsSeparatedByString:", CFSTR("#")),
        objc_msgSend(v5, "count") == (char *)&dword_0 + 2))
  {
    return -[THContentLinkResolver p_storageAnchorFromDynamicAnchor:](self, "p_storageAnchorFromDynamicAnchor:", -[THModelDynamicAnchor initWithContentNode:startXPointer:endXPointer:]([THModelDynamicAnchor alloc], "initWithContentNode:startXPointer:endXPointer:", -[THContentLinkResolver contentNode](self, "contentNode"), objc_msgSend(v5, "objectAtIndex:", 0), objc_msgSend(v5, "objectAtIndex:", 1)));
  }
  else
  {
    return 0;
  }
}

- (id)p_storageAnchorFromFixedAnchor:(id)a3
{
  return -[THModelContentNode storageAnchorForAnchorId:](-[THContentLinkResolver contentNode](self, "contentNode"), "storageAnchorForAnchorId:", objc_msgSend(a3, "elementId"));
}

- (id)p_storageAnchorFromDynamicAnchor:(id)a3
{
  return 0;
}

- (id)p_contentNodeAnchorFromLink:(id)a3
{
  if (!-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THContentLinkResolver p_contentNodeAnchorFromLink:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THContentLinkResolver.m"), 175, CFSTR("Resolving URL path specifying content node which unexpectedly does not match ours."));
  if (-[THContentLinkResolver p_linkContentNodeIsConsistentWithOurs:](self, "p_linkContentNodeIsConsistentWithOurs:", a3)&& objc_msgSend(a3, "isOrdinary")&& !objc_msgSend(objc_msgSend(a3, "fragment"), "length"))
  {
    return +[THModelContentNodeAnchor contentNodeAnchorWithContentNode:](THModelContentNodeAnchor, "contentNodeAnchorWithContentNode:", -[THContentLinkResolver contentNode](self, "contentNode"));
  }
  else
  {
    return 0;
  }
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

@end
