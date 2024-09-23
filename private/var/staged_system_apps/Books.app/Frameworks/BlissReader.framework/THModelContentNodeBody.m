@implementation THModelContentNodeBody

- (THModelContentNodeBody)initWithContext:(id)a3
{
  THModelContentNodeBody *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THModelContentNodeBody;
  v4 = -[THModelContentNodeBody init](&v6, "init");
  if (v4)
  {
    -[THModelContentNodeBody setPages:](v4, "setPages:", +[NSMutableArray array](NSMutableArray, "array"));
    -[THModelContentNodeBody setGutterDrawableStorage:](v4, "setGutterDrawableStorage:", -[THWGutterDrawableStorage initWithContext:]([THWGutterDrawableStorage alloc], "initWithContext:", a3));
    -[THModelContentNodeBody setInfosForIDs:](v4, "setInfosForIDs:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THModelContentNodeBody setIDsForInfos:](v4, "setIDsForInfos:", +[TSUPointerKeyDictionary dictionary](TSUPointerKeyDictionary, "dictionary"));
    -[THModelContentNodeBody setPageIndexesForInfos:](v4, "setPageIndexesForInfos:", +[TSUNoCopyDictionary dictionary](TSUNoCopyDictionary, "dictionary"));
    -[THModelContentNodeBody setDrawablesForWidgetInfos:](v4, "setDrawablesForWidgetInfos:", +[TSUNoCopyDictionary dictionary](TSUNoCopyDictionary, "dictionary"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[THModelContentNodeBody p_clearFlushableMembers](self, "p_clearFlushableMembers");
  v3.receiver = self;
  v3.super_class = (Class)THModelContentNodeBody;
  -[THModelContentNodeBody dealloc](&v3, "dealloc");
}

- (void)p_clearFlushableMembers
{
  NSMutableArray *mPages;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->mBodyStorage = 0;
  self->mGutterDrawableStorage = 0;

  self->mStylesheet = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mPages = self->mPages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPages, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mPages);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "setParentContentNodeBody:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPages, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->mPages = 0;
  self->mInfosForID = 0;

  self->mIDsForInfos = 0;
  self->mPageIndexesForInfos = 0;

  self->mDrawablesForWidgetInfos = 0;
}

- (void)unload
{
  -[THModelContentNodeBody p_clearFlushableMembers](self, "p_clearFlushableMembers");
  -[THModelContentNode i_flushingBody:](self->mParent, "i_flushingBody:", self);
}

- (BOOL)hasFlushableContent
{
  return -[THModelContentNodeBody pages](self, "pages") != 0;
}

- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4
{
  id v7;

  v7 = -[NSMutableDictionary objectForKey:](-[THModelContentNodeBody infosForIDs](self, "infosForIDs"), "objectForKey:", a3);
  if (v7)
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "removeObjectForKey:", v7);
  -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "setObject:forUncopiedKey:", a3, a4);
  -[NSMutableDictionary setObject:forKey:](-[THModelContentNodeBody infosForIDs](self, "infosForIDs"), "setObject:forKey:", a4, a3);
}

- (void)clearNodeUniqueIDForInfo:(id)a3
{
  id v5;

  v5 = -[TSUPointerKeyDictionary objectForKey:](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "objectForKey:", a3);
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](-[THModelContentNodeBody infosForIDs](self, "infosForIDs"), "removeObjectForKey:", v5);
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "removeObjectForKey:", a3);
  }
}

- (id)nodeUniqueIDForInfo:(id)a3
{
  if (a3)
    return -[TSUPointerKeyDictionary objectForKey:](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "objectForKey:", a3);
  else
    return 0;
}

- (id)infoForNodeUniqueID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[THModelContentNodeBody infosForIDs](self, "infosForIDs"), "objectForKey:", a3);
}

- (id)infos
{
  return -[TSUPointerKeyDictionary allKeys](-[THModelContentNodeBody IDsForInfos](self, "IDsForInfos"), "allKeys");
}

- (int64_t)pageCount
{
  return (int64_t)-[NSMutableArray count](self->mPages, "count");
}

- (void)addPageInfo:(id)a3
{
  -[NSMutableArray addObject:](self->mPages, "addObject:");
  objc_msgSend(a3, "setParentContentNodeBody:", self);
}

- (unint64_t)relativeIndexOfPageInfo:(id)a3
{
  return -[NSArray indexOfObject:](-[THModelContentNodeBody pages](self, "pages"), "indexOfObject:", a3);
}

- (unint64_t)relativePageIndexForInfo:(id)a3
{
  id v3;
  uint64_t v5;
  void *v6;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = a3;
  while (1)
  {
    v5 = objc_opt_class(NSNumber, a2);
    v6 = (void *)TSUDynamicCast(v5, -[TSUPointerKeyDictionary objectForKey:](self->mPageIndexesForInfos, "objectForKey:", v3));
    if (v6)
      break;
    v3 = objc_msgSend(v3, "parentInfo");
    if (!v3)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return objc_msgSend(v6, "unsignedIntValue");
}

- (void)setRelativePageIndex:(unint64_t)a3 forInfo:(id)a4
{
  -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mPageIndexesForInfos, "setObject:forUncopiedKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), a4);
}

- (void)addGutterDrawable:(id)a3 positioning:(id)a4 insertContext:(id)a5
{
  -[THWGutterDrawableStorage addDrawable:positioning:insertContext:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "addDrawable:positioning:insertContext:", a3, a4, a5);
}

- (unint64_t)bodyCharIndexOfGutterDrawable:(id)a3
{
  return (unint64_t)objc_msgSend(-[THWGutterDrawableStorage positioningOfDrawable:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "positioningOfDrawable:", a3), "bodyCharIndex");
}

- (id)gutterDrawables
{
  return -[THWGutterDrawableStorage drawables](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "drawables");
}

- (id)expandableInfoForWidgetInfo:(id)a3
{
  if (a3)
    return -[TSUPointerKeyDictionary objectForKey:](self->mDrawablesForWidgetInfos, "objectForKey:");
  else
    return 0;
}

- (void)setExpandedDrawable:(id)a3 forWidgetInfo:(id)a4
{
  if (a3 && a4)
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mDrawablesForWidgetInfos, "setObject:forUncopiedKey:");
  else
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNodeBody setExpandedDrawable:forWidgetInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNodeBody.m"), 183, CFSTR("Invalid parameter not satisfying: %s"), "gutterDrawable != nil && widgetInfo != nil");
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  _QWORD v7[6];

  -[THWPStorage willBeAddedToDocumentRoot:dolcContext:](-[THModelContentNodeBody bodyStorage](self, "bodyStorage"), "willBeAddedToDocumentRoot:dolcContext:", a3, a4);
  -[THWGutterDrawableStorage willBeAddedToDocumentRoot:context:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "willBeAddedToDocumentRoot:context:", a3, a4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4BE18;
  v7[3] = &unk_4278B0;
  v7[4] = a3;
  v7[5] = a4;
  -[NSArray enumerateObjectsUsingBlock:](-[THModelContentNodeBody pages](self, "pages"), "enumerateObjectsUsingBlock:", v7);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  _QWORD v7[6];

  -[THWPStorage wasAddedToDocumentRoot:dolcContext:](-[THModelContentNodeBody bodyStorage](self, "bodyStorage"), "wasAddedToDocumentRoot:dolcContext:", a3, a4);
  -[THWGutterDrawableStorage wasAddedToDocumentRoot:context:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "wasAddedToDocumentRoot:context:", a3, a4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4BEBC;
  v7[3] = &unk_4278B0;
  v7[4] = a3;
  v7[5] = a4;
  -[NSArray enumerateObjectsUsingBlock:](-[THModelContentNodeBody pages](self, "pages"), "enumerateObjectsUsingBlock:", v7);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  _QWORD v5[5];

  -[THWPStorage willBeRemovedFromDocumentRoot:](-[THModelContentNodeBody bodyStorage](self, "bodyStorage"), "willBeRemovedFromDocumentRoot:", a3);
  -[THWGutterDrawableStorage willBeRemovedFromDocumentRoot:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "willBeRemovedFromDocumentRoot:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4BF4C;
  v5[3] = &unk_4278D8;
  v5[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](-[THModelContentNodeBody pages](self, "pages"), "enumerateObjectsUsingBlock:", v5);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  _QWORD v5[5];

  -[THWPStorage wasRemovedFromDocumentRoot:](-[THModelContentNodeBody bodyStorage](self, "bodyStorage"), "wasRemovedFromDocumentRoot:", a3);
  -[THWGutterDrawableStorage wasRemovedFromDocumentRoot:](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "wasRemovedFromDocumentRoot:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4BFDC;
  v5[3] = &unk_4278D8;
  v5[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](-[THModelContentNodeBody pages](self, "pages"), "enumerateObjectsUsingBlock:", v5);
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNodeBody childCommandForReplaceAllCommand:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNodeBody.m"), 227, CFSTR("THModelContentNodeBody can't perform replacements"));
  return 0;
}

- (id)childEnumerator
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[THModelContentNodeBody bodyStorage](self, "bodyStorage"))
    objc_msgSend(v3, "addObject:", -[THModelContentNodeBody bodyStorage](self, "bodyStorage"));
  if (-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"))
    objc_msgSend(v3, "addObjectsFromArray:", -[THWGutterDrawableStorage drawables](-[THModelContentNodeBody gutterDrawableStorage](self, "gutterDrawableStorage"), "drawables"));
  if (-[THModelContentNodeBody pages](self, "pages"))
    objc_msgSend(v3, "addObjectsFromArray:", -[THModelContentNodeBody pages](self, "pages"));
  return objc_msgSend(v3, "objectEnumerator");
}

- (THWPStorage)bodyStorage
{
  return self->mBodyStorage;
}

- (void)setBodyStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)pages
{
  return &self->mPages->super;
}

- (void)setPages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THWGutterDrawableStorage)gutterDrawableStorage
{
  return self->mGutterDrawableStorage;
}

- (void)setGutterDrawableStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THModelContentNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelContentNode *)a3;
}

- (TSUPointerKeyDictionary)IDsForInfos
{
  return self->mIDsForInfos;
}

- (void)setIDsForInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableDictionary)infosForIDs
{
  return self->mInfosForID;
}

- (void)setInfosForIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (TSUNoCopyDictionary)pageIndexesForInfos
{
  return self->mPageIndexesForInfos;
}

- (void)setPageIndexesForInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (TSUNoCopyDictionary)drawablesForWidgetInfos
{
  return self->mDrawablesForWidgetInfos;
}

- (void)setDrawablesForWidgetInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
