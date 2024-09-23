@implementation THDrawableStorage

- (THDrawableStorage)initWithContext:(id)a3
{
  THDrawableStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDrawableStorage;
  v3 = -[THDrawableStorage initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
  {
    v3->mDrawables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mDrawableTags = (NSMutableDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mDocumentRoot = 0;

  self->mDrawables = 0;
  self->mDrawableTags = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDrawableStorage;
  -[THDrawableStorage dealloc](&v3, "dealloc");
}

- (BOOL)isInDocumentRoot:(id)a3
{
  return -[THDrawableStorage documentRoot](self, "documentRoot") == a3;
}

- (unint64_t)drawableCount
{
  return (unint64_t)-[NSMutableArray count](self->mDrawables, "count");
}

- (NSArray)drawables
{
  return (NSArray *)-[NSMutableArray copy](self->mDrawables, "copy");
}

- (BOOL)containsDrawable:(id)a3
{
  return -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:", a3) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (void)addDrawable:(id)a3 insertContext:(id)a4
{
  THDocumentRoot *v7;
  THDocumentRoot *v8;

  v7 = -[THDrawableStorage documentRoot](self, "documentRoot");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a3, "willBeAddedToDocumentRoot:context:", v7, a4);
    -[NSMutableArray addObject:](self->mDrawables, "addObject:", a3);
    objc_msgSend(a3, "wasAddedToDocumentRoot:context:", v8, a4);
  }
  else
  {
    -[NSMutableArray addObject:](self->mDrawables, "addObject:", a3);
  }
}

- (void)setTag:(id)a3 forDrawable:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mDrawableTags, "setObject:forKey:", a4, a3);
}

- (id)drawableWithTag:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mDrawableTags, "objectForKey:", a3);
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v8;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage willBeAddedToDocumentRoot:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"), 114, CFSTR("invalid nil value for '%s'"), "documentRoot");
  v8 = objc_opt_class(THDocumentRoot, a2);
  if ((objc_opt_isKindOfClass(a3, v8) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage willBeAddedToDocumentRoot:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"), 115, CFSTR("invalid document class"));
  -[NSMutableArray tsu_makeObjectsPerformSelector:withObject:withObject:](self->mDrawables, "tsu_makeObjectsPerformSelector:withObject:withObject:", a2, a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage wasAddedToDocumentRoot:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"), 122, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[NSMutableArray tsu_makeObjectsPerformSelector:withObject:withObject:](self->mDrawables, "tsu_makeObjectsPerformSelector:withObject:withObject:", a2, a3, a4);
  v9 = objc_opt_class(THDocumentRoot, v8);
  -[THDrawableStorage setDocumentRoot:](self, "setDocumentRoot:", TSUDynamicCast(v9, a3));
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  -[THDrawableStorage setDocumentRoot:](self, "setDocumentRoot:", 0);
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage willBeRemovedFromDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"), 133, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mDrawables, "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDrawableStorage wasRemovedFromDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THDrawableStorage.m"), 140, CFSTR("invalid nil value for '%s'"), "documentRoot");
  -[NSMutableArray tsu_makeObjectsPerformSelectorIfImplemented:withObject:](self->mDrawables, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "setTextServices:", 0);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mDrawables, "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->mDocumentRoot = (THDocumentRoot *)a3;
}

@end
