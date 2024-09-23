@implementation OADDrawable

- (OADDrawable)initWithPropertiesClass:(Class)a3
{
  char *v4;
  OADDrawable *v5;
  OADDrawableProperties *v6;
  OADDrawableProperties *mDrawableProperties;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OADDrawable;
  v4 = -[OADDrawable init](&v9, sel_init);
  v5 = (OADDrawable *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 12) = -1;
    v6 = (OADDrawableProperties *)objc_alloc_init(a3);
    mDrawableProperties = v5->mDrawableProperties;
    v5->mDrawableProperties = v6;

  }
  return v5;
}

- (id)drawableProperties
{
  return self->mDrawableProperties;
}

- (void)setId:(unsigned int)a3
{
  self->mId = a3;
}

- (void)setDrawableProperties:(id)a3
{
  objc_storeStrong((id *)&self->mDrawableProperties, a3);
}

- (void)setClientData:(id)a3
{
  objc_storeStrong((id *)&self->mClientData, a3);
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (id)clientData
{
  return self->mClientData;
}

- (void)removeUnnecessaryOverrides
{
  -[OADDrawableProperties removeUnnecessaryOverrides](self->mDrawableProperties, "removeUnnecessaryOverrides");
}

- (BOOL)hidden
{
  return self->mHidden;
}

- (OADDrawableContainer)parent
{
  return (OADDrawableContainer *)objc_loadWeakRetained((id *)&self->mParent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->mParent, a3);
}

- (unsigned)id
{
  return self->mId;
}

- (id)ensureClientDataOfClass:(Class)a3
{
  OADClient *mClientData;
  OADClient *v5;
  OADClient *v6;

  mClientData = self->mClientData;
  if (!mClientData)
  {
    v5 = (OADClient *)objc_alloc_init(a3);
    v6 = self->mClientData;
    self->mClientData = v5;

    mClientData = self->mClientData;
  }
  return mClientData;
}

- (unsigned)altId
{
  return self->mAltId;
}

- (void)setAltId:(unsigned int)a3
{
  self->mAltId = a3;
}

- (void)setParentTextListStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADDrawable setParentTextListStyle:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 89, 0, "Abstract method not overridden by %@", v7);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v11, "-[OADDrawable setParentTextListStyle:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADDrawable changeParentTextListStylePreservingEffectiveValues:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 93, 0, "Abstract method not overridden by %@", v7);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v11, "-[OADDrawable changeParentTextListStylePreservingEffectiveValues:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)createOrientedBoundsWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  void *v9;
  void *v10;
  OADOrientedBounds *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[OADProperties isMergedWithParent](self->mDrawableProperties, "isMergedWithParent");
  -[OADProperties setMergedWithParent:](self->mDrawableProperties, "setMergedWithParent:", 0);
  if (-[OADDrawableProperties hasOrientedBounds](self->mDrawableProperties, "hasOrientedBounds"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADDrawable createOrientedBoundsWithBounds:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADDrawable.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 103, 0, "An oriented bounds object already exists");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OADProperties setMergedWithParent:](self->mDrawableProperties, "setMergedWithParent:", v8);
  v11 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", x, y, width, height);
  -[OADDrawable drawableProperties](self, "drawableProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrientedBounds:", v11);

  return v11;
}

+ (unsigned)generateOADDrawableId:(id)a3
{
  return objc_msgSend(a3, "hash");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDrawable;
  -[OADDrawable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mParent);
  objc_storeStrong((id *)&self->mClientData, 0);
  objc_storeStrong((id *)&self->mDrawableProperties, 0);
}

- (id)createWordClientDataWithTextType:(int)a3
{
  uint64_t v3;
  WDAContent *v5;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(WDAContent);
  objc_storeStrong((id *)&self->mClientData, v5);
  -[WDAContent setTextType:](v5, "setTextType:", v3);
  return v5;
}

@end
