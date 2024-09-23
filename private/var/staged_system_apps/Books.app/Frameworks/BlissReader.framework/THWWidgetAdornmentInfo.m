@implementation THWWidgetAdornmentInfo

- (void)dealloc
{
  objc_super v3;

  -[THWWidgetAdornmentInfo setExteriorTextWrap:](self, "setExteriorTextWrap:", 0);
  -[THWWidgetAdornmentInfo setInsertionOrder:](self, "setInsertionOrder:", 0);
  -[THWWidgetAdornmentInfo setBackground:](self, "setBackground:", 0);
  -[THWWidgetAdornmentInfo setTitle:](self, "setTitle:", 0);
  -[THWWidgetAdornmentInfo setCaption:](self, "setCaption:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWWidgetAdornmentInfo;
  -[THWWidgetAdornmentInfo dealloc](&v3, "dealloc");
}

- (TSWPStorage)titleStorage
{
  return (TSWPStorage *)-[TSWPShapeInfo containedStorage](self->_title, "containedStorage");
}

- (TSWPStorage)captionStorage
{
  return (TSWPStorage *)-[TSWPShapeInfo containedStorage](self->_caption, "containedStorage");
}

- (BOOL)hasTitle
{
  return -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage") != 0;
}

- (BOOL)hasCaption
{
  return -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage") != 0;
}

- (id)interleavedInfosWithInfos:(id)a3
{
  id v5;
  uint64_t v6;
  NSArray *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!-[THWWidgetAdornmentInfo insertionOrder](self, "insertionOrder"))
  {
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (-[THWWidgetAdornmentInfo background](self, "background"))
    {
      objc_msgSend(v5, "setObject:forKey:", -[THWWidgetAdornmentInfo background](self, "background"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
    if (-[THWWidgetAdornmentInfo title](self, "title"))
      objc_msgSend(v5, "setObject:forKey:", -[THWWidgetAdornmentInfo title](self, "title"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6++));
    if (-[THWWidgetAdornmentInfo caption](self, "caption"))
      objc_msgSend(v5, "setObject:forKey:", -[THWWidgetAdornmentInfo caption](self, "caption"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    -[THWWidgetAdornmentInfo setInsertionOrder:](self, "setInsertionOrder:", v5);
  }
  v7 = -[NSArray sortedArrayUsingComparator:](-[NSDictionary allKeys](-[THWWidgetAdornmentInfo insertionOrder](self, "insertionOrder"), "allKeys"), "sortedArrayUsingComparator:", &stru_429E50);
  if (a3)
    v8 = objc_msgSend(a3, "mutableCopy");
  else
    v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = v8;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v14, "integerValue");
        if (v15 <= objc_msgSend(v9, "count"))
          objc_msgSend(v9, "insertObject:atIndex:", -[NSDictionary objectForKey:](-[THWWidgetAdornmentInfo insertionOrder](self, "insertionOrder"), "objectForKey:", v14), objc_msgSend(v14, "integerValue"));
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  return v9;
}

- (void)updateParentInfo:(id)a3
{
  -[TSWPShapeInfo setParentInfo:](self->_title, "setParentInfo:");
  -[TSWPShapeInfo setParentInfo:](self->_caption, "setParentInfo:", a3);
  -[THWWidgetBackgroundInfo setParentInfo:](self->_background, "setParentInfo:", a3);
}

- (id)p_colorForStorage:(id)a3
{
  id v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v4 = objc_msgSend(objc_msgSend(a3, "characterStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  if (!v4)
    v4 = objc_msgSend(objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  v5 = objc_opt_class(TSUColor);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWidgetAdornmentInfo p_colorForStorage:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWWidgetAdornmentInfo.m"), 113, CFSTR("style returned non-TSUColor"));
  return v4;
}

- (id)titleColor
{
  return -[THWWidgetAdornmentInfo p_colorForStorage:](self, "p_colorForStorage:", -[TSWPShapeInfo containedStorage](self->_title, "containedStorage"));
}

- (BOOL)panelContentProviderHasContentForPanel:(int)a3
{
  TSWPStorage *v3;

  if (a3 == 1)
  {
    v3 = -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage");
    return v3 != 0;
  }
  if (!a3)
  {
    v3 = -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage");
    return v3 != 0;
  }
  return 0;
}

- (id)topPanelInfos
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if ((!-[THWWidgetAdornmentInfo layoutMode](self, "layoutMode")
     || -[THWWidgetAdornmentInfo layoutMode](self, "layoutMode") == 1)
    && -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage"))
  {
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage"));
  }
  if (-[THWWidgetAdornmentInfo layoutMode](self, "layoutMode") == 1
    && -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage"))
  {
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage"));
  }
  return v3;
}

- (id)bottomPanelInfos
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[THWWidgetAdornmentInfo layoutMode](self, "layoutMode") == 2
    && -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage"))
  {
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage"));
  }
  if (!-[THWWidgetAdornmentInfo layoutMode](self, "layoutMode")
    || -[THWWidgetAdornmentInfo layoutMode](self, "layoutMode") == 2)
  {
    if (-[THWWidgetAdornmentInfo captionStorage](self, "captionStorage"))
      objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage"));
  }
  return v3;
}

- (id)panelContentProviderChildInfosForPanel:(int)a3
{
  id result;
  id v4;

  if (a3 == 1)
  {
    result = -[THWWidgetAdornmentInfo captionStorage](self, "captionStorage");
    if (!result)
      return result;
    goto LABEL_6;
  }
  if (a3)
    return 0;
  result = -[THWWidgetAdornmentInfo titleStorage](self, "titleStorage");
  if (result)
  {
LABEL_6:
    v4 = result;
    return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1);
  }
  return result;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWidgetAdornmentInfo childCommandForReplaceAllCommand:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWWidgetAdornmentInfo.m"), 200, CFSTR("THWWidgetAdornmentInfo doesn't support replace"));
  return 0;
}

- (id)childEnumerator
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[THWWidgetAdornmentInfo background](self, "background"))
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo background](self, "background"));
  if (-[THWWidgetAdornmentInfo title](self, "title"))
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo title](self, "title"));
  if (-[THWWidgetAdornmentInfo caption](self, "caption"))
    objc_msgSend(v3, "addObject:", -[THWWidgetAdornmentInfo caption](self, "caption"));
  return objc_msgSend(v3, "objectEnumerator");
}

- (THWWidgetBackgroundInfo)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSWPShapeInfo)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSWPShapeInfo)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

- (int)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int)a3
{
  self->_layoutMode = a3;
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->_exteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSDictionary)insertionOrder
{
  return self->_insertionOrder;
}

- (void)setInsertionOrder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
