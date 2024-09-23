@implementation THModelPageInfo

- (BOOL)autosizes
{
  return self->mAutosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  -[THModelPageInfo willModify](self, "willModify");
  self->mAutosizes = a3;
}

- (CGSize)autosizeMargin
{
  double width;
  double height;
  CGSize result;

  width = self->mAutosizeMargin.width;
  height = self->mAutosizeMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAutosizeMargin:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  -[THModelPageInfo willModify](self, "willModify");
  self->mAutosizeMargin.width = width;
  self->mAutosizeMargin.height = height;
}

- (NSMutableArray)bodyBoxInfos
{
  return self->mBodyBoxInfos;
}

- (void)setBodyBoxInfos:(id)a3
{
  id v5;

  -[THModelPageInfo willModify](self, "willModify");
  v5 = a3;

  self->mBodyBoxInfos = (NSMutableArray *)a3;
}

- (THDrawablesZOrder)drawablesZOrder
{
  return self->mDrawablesZOrder;
}

- (void)setDrawablesZOrder:(id)a3
{
  id v5;

  -[THModelPageInfo willModify](self, "willModify");
  v5 = a3;

  self->mDrawablesZOrder = (THDrawablesZOrder *)a3;
}

- (THDrawableStorage)floatingDrawableStorage
{
  return self->mFloatingDrawableStorage;
}

- (void)setFloatingDrawableStorage:(id)a3
{
  id v5;

  -[THModelPageInfo willModify](self, "willModify");
  v5 = a3;

  self->mFloatingDrawableStorage = (THDrawableStorage *)a3;
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (void)setGeometry:(id)a3
{
  id v5;

  -[THModelPageInfo willModify](self, "willModify");
  v5 = a3;

  self->mGeometry = (TSDInfoGeometry *)a3;
}

- (THModelContentNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  -[THModelPageInfo willModify](self, "willModify");
  self->mParent = (THModelContentNode *)a3;
}

- (void)setParentContentNodeBody:(id)a3
{
  -[THModelPageInfo willModify](self, "willModify");
  self->mParentContentNodeBody = (THModelContentNodeBody *)a3;
}

- (unint64_t)pageStartCharIndex
{
  return self->mPageStartCharIndex;
}

- (void)setPageStartCharIndex:(unint64_t)a3
{
  -[THModelPageInfo willModify](self, "willModify");
  self->mPageStartCharIndex = a3;
}

- (unint64_t)pageEndCharIndex
{
  return self->mPageEndCharIndex;
}

- (void)setPageEndCharIndex:(unint64_t)a3
{
  -[THModelPageInfo willModify](self, "willModify");
  self->mPageEndCharIndex = a3;
}

- (THModelPageInfo)initWithContext:(id)a3
{
  THModelPageInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THModelPageInfo;
  v3 = -[THModelPageInfo initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
  {
    -[THModelPageInfo setFloatingDrawableStorage:](v3, "setFloatingDrawableStorage:", -[THDrawableStorage initWithContext:]([THDrawableStorage alloc], "initWithContext:", -[THModelPageInfo context](v3, "context")));
    -[THModelPageInfo setDrawablesZOrder:](v3, "setDrawablesZOrder:", -[THDrawablesZOrder initWithContext:]([THDrawablesZOrder alloc], "initWithContext:", -[THModelPageInfo context](v3, "context")));
    -[THModelPageInfo setBodyBoxInfos:](v3, "setBodyBoxInfos:", +[NSMutableArray array](NSMutableArray, "array"));
    -[THModelPageInfo setPageStartCharIndex:](v3, "setPageStartCharIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[THModelPageInfo setPageEndCharIndex:](v3, "setPageEndCharIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (void)dealloc
{
  NSMutableArray *mBodyBoxInfos;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mBodyBoxInfos = self->mBodyBoxInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyBoxInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mBodyBoxInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "setParentInfo:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mBodyBoxInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->mBodyBoxInfos = 0;
  self->mFloatingDrawableStorage = 0;

  self->mDrawablesZOrder = 0;
  self->mGeometry = 0;
  v8.receiver = self;
  v8.super_class = (Class)THModelPageInfo;
  -[THModelPageInfo dealloc](&v8, "dealloc");
}

- (id)copyWithContext:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo copyWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"), 86, CFSTR("not implemented"));
  return 0;
}

- (BOOL)isThemeContent
{
  return 0;
}

- (THModelContentNodeBody)parentContentNodeBody
{
  return (THModelContentNodeBody *)-[THModelContentNodeBody ownerAutoreleasedAccess](self->mParentContentNodeBody, "ownerAutoreleasedAccess");
}

- (NSArray)floatingDrawables
{
  return -[THDrawableStorage drawables](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "drawables");
}

- (NSArray)modelBodyInfos
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"));
}

- (THWPStorage)bodyStorage
{
  return -[THModelContentNodeBody bodyStorage](-[THModelPageInfo parentContentNodeBody](self, "parentContentNodeBody"), "bodyStorage");
}

- (_NSRange)bodyStorageRange
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t mPageStartCharIndex;
  unint64_t mPageEndCharIndex;
  _NSRange result;

  v3 = NSInvalidRange[0];
  v4 = NSInvalidRange[1];
  mPageStartCharIndex = self->mPageStartCharIndex;
  if (mPageStartCharIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    mPageEndCharIndex = self->mPageEndCharIndex;
    if (mPageEndCharIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = mPageEndCharIndex - mPageStartCharIndex;
      v3 = mPageStartCharIndex;
    }
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)relativePageIndexInParent
{
  return -[THModelContentNodeBody relativeIndexOfPageInfo:](-[THModelPageInfo parentContentNodeBody](self, "parentContentNodeBody"), "relativeIndexOfPageInfo:", self);
}

- (unint64_t)absolutePageIndex
{
  return -[THModelNode absolutePageIndexForRelativePageIndex:](-[THModelPageInfo parent](self, "parent"), "absolutePageIndexForRelativePageIndex:", -[THModelPageInfo relativePageIndexInParent](self, "relativePageIndexInParent"));
}

- (void)addFloatingDrawable:(id)a3 insertContext:(id)a4
{
  objc_msgSend(a3, "setParentInfo:", self);
  -[THDrawableStorage addDrawable:insertContext:](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "addDrawable:insertContext:", a3, a4);
}

- (void)addBodyBoxInfo:(id)a3 insertContext:(id)a4
{
  id v7;
  id v8;

  v7 = -[THModelPageInfo documentRoot](self, "documentRoot");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a3, "willBeAddedToDocumentRoot:context:", v7, a4);
    objc_msgSend(a3, "setParentInfo:", self);
    -[NSMutableArray addObject:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "addObject:", a3);
    objc_msgSend(a3, "wasAddedToDocumentRoot:context:", v8, a4);
  }
  else
  {
    objc_msgSend(a3, "setParentInfo:", self);
    -[NSMutableArray addObject:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "addObject:", a3);
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  _QWORD v7[6];

  -[THDrawableStorage willBeAddedToDocumentRoot:context:](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "willBeAddedToDocumentRoot:context:", a3, a4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_375F8;
  v7[3] = &unk_4278B0;
  v7[4] = a3;
  v7[5] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "enumerateObjectsUsingBlock:", v7);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  _QWORD v7[6];

  -[THDrawableStorage wasAddedToDocumentRoot:context:](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "wasAddedToDocumentRoot:context:", a3, a4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_37688;
  v7[3] = &unk_4278B0;
  v7[4] = a3;
  v7[5] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "enumerateObjectsUsingBlock:", v7);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  _QWORD v5[5];

  -[THDrawableStorage willBeRemovedFromDocumentRoot:](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "willBeRemovedFromDocumentRoot:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_37708;
  v5[3] = &unk_4278D8;
  v5[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "enumerateObjectsUsingBlock:", v5);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  _QWORD v5[5];

  -[THDrawableStorage wasRemovedFromDocumentRoot:](-[THModelPageInfo floatingDrawableStorage](self, "floatingDrawableStorage"), "wasRemovedFromDocumentRoot:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_37788;
  v5[3] = &unk_4278D8;
  v5[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[THModelPageInfo bodyBoxInfos](self, "bodyBoxInfos"), "enumerateObjectsUsingBlock:", v5);
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo setOwningAttachment:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"), 193, CFSTR("Can't set owning attachment on page info. It's a page."));
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (void)setParentInfo:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo setParentInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"), 205, CFSTR("THModelPageInfos have no info parent"));
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THPageLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THPageRep, a2);
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelPageInfo childCommandForReplaceAllCommand:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelPageInfo.m"), 218, CFSTR("THModelPageInfo objects should not be included when enumerating model objects"));
  return 0;
}

- (id)childEnumerator
{
  return objc_msgSend(-[THModelPageInfo childInfos](self, "childInfos"), "objectEnumerator");
}

- (BOOL)isFloatingAboveText
{
  return -[THModelPageInfo owningAttachment](self, "owningAttachment") == 0;
}

- (BOOL)isAnchoredToText
{
  return -[TSDOwningAttachment isAnchored](-[THModelPageInfo owningAttachment](self, "owningAttachment"), "isAnchored");
}

- (BOOL)isInlineWithText
{
  if (-[THModelPageInfo isFloatingAboveText](self, "isFloatingAboveText"))
    return 0;
  else
    return !-[THModelPageInfo isAnchoredToText](self, "isAnchoredToText");
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (id)childInfos
{
  return -[THModelPageInfo floatingDrawables](self, "floatingDrawables");
}

@end
