@implementation THWGutterDrawableStorage

- (THDrawableStorage)drawableStorage
{
  return self->mDrawableStorage;
}

- (void)setDrawableStorage:(id)a3
{
  id v5;

  -[THWGutterDrawableStorage willModify](self, "willModify");
  v5 = a3;

  self->mDrawableStorage = (THDrawableStorage *)a3;
}

- (TSUPointerKeyDictionary)drawablePositionings
{
  return self->mDrawablePositionings;
}

- (void)setDrawablePositionings:(id)a3
{
  id v5;

  -[THWGutterDrawableStorage willModify](self, "willModify");
  v5 = a3;

  self->mDrawablePositionings = (TSUPointerKeyDictionary *)a3;
}

- (THWGutterDrawableStorage)initWithContext:(id)a3
{
  THWGutterDrawableStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWGutterDrawableStorage;
  v3 = -[THWGutterDrawableStorage initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
  {
    -[THWGutterDrawableStorage setDrawableStorage:](v3, "setDrawableStorage:", -[THDrawableStorage initWithContext:]([THDrawableStorage alloc], "initWithContext:", -[THWGutterDrawableStorage context](v3, "context")));
    -[THWGutterDrawableStorage setDrawablePositionings:](v3, "setDrawablePositionings:", objc_alloc_init((Class)TSUPointerKeyDictionary));
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mDrawableStorage = 0;
  self->mDrawablePositionings = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWGutterDrawableStorage;
  -[THWGutterDrawableStorage dealloc](&v3, "dealloc");
}

- (id)drawables
{
  return -[THDrawableStorage drawables](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "drawables");
}

- (id)orderedDrawables
{
  unsigned int v3;
  id v4;
  _QWORD v6[5];

  v3 = -[THWGutterDrawableStorage shouldUseGutterOrder](self, "shouldUseGutterOrder");
  v4 = -[THWGutterDrawableStorage drawables](self, "drawables");
  if (v3)
    return objc_msgSend(v4, "sortedArrayUsingSelector:", "gutterOrderCompare:");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_57144;
  v6[3] = &unk_427B40;
  v6[4] = self;
  return objc_msgSend(v4, "sortedArrayUsingComparator:", v6);
}

- (void)addDrawable:(id)a3 positioning:(id)a4 insertContext:(id)a5
{
  -[THWGutterDrawableStorage willModify](self, "willModify");
  -[THDrawableStorage addDrawable:insertContext:](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "addDrawable:insertContext:", a3, a5);
  -[TSUPointerKeyDictionary setObject:forUncopiedKey:](-[THWGutterDrawableStorage drawablePositionings](self, "drawablePositionings"), "setObject:forUncopiedKey:", a4, a3);
}

- (id)positioningOfDrawable:(id)a3
{
  id result;

  if (!a3
    || (result = -[TSUPointerKeyDictionary objectForKey:](-[THWGutterDrawableStorage drawablePositionings](self, "drawablePositionings"), "objectForKey:", a3)) == 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWGutterDrawableStorage positioningOfDrawable:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWGutterDrawableStorage.m"), 97, CFSTR("invalid nil value for '%s'"), "positioning");
    return 0;
  }
  return result;
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  -[THDrawableStorage willBeAddedToDocumentRoot:context:](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "willBeAddedToDocumentRoot:context:", a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  -[THDrawableStorage wasAddedToDocumentRoot:context:](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "wasAddedToDocumentRoot:context:", a3, a4);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  -[THDrawableStorage willBeRemovedFromDocumentRoot:](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "willBeRemovedFromDocumentRoot:", a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  -[THDrawableStorage wasRemovedFromDocumentRoot:](-[THWGutterDrawableStorage drawableStorage](self, "drawableStorage"), "wasRemovedFromDocumentRoot:", a3);
}

- (BOOL)shouldUseGutterOrder
{
  return self->mShouldUseGutterOrder;
}

- (void)setShouldUseGutterOrder:(BOOL)a3
{
  self->mShouldUseGutterOrder = a3;
}

@end
