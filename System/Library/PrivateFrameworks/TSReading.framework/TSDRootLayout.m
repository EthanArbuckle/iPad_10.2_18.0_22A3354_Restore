@implementation TSDRootLayout

- (TSDRootLayout)initWithLayoutController:(id)a3
{
  TSDRootLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDRootLayout;
  result = -[TSDAbstractLayout init](&v5, sel_init);
  if (result)
  {
    result->mLayoutController = (TSDLayoutController *)a3;
    result->mSupportsAdaptiveLayout = 0;
    result->mShiftedObjects = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDRootLayout;
  -[TSDAbstractLayout dealloc](&v3, sel_dealloc);
}

- (id)layoutController
{
  return self->mLayoutController;
}

- (id)childLayoutsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = -[TSDAbstractLayout children](self, "children", 0);
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "addLayoutsInRect:toArray:deep:", v8, 0, x, y, width, height);
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  return v8;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 1;
}

- (id)p_shiftedObjects
{
  id result;

  if (!self->mSupportsAdaptiveLayout)
    return 0;
  result = self->mShiftedObjects;
  if (!result)
  {
    result = objc_alloc_init(MEMORY[0x24BEB3CE0]);
    self->mShiftedObjects = (TSUPointerKeyDictionary *)result;
  }
  return result;
}

- (void)beginDynamicAdaptiveLayout
{
  self->mSupportsAdaptiveLayout = objc_msgSend(-[TSDLayoutController canvas](self->mLayoutController, "canvas"), "supportsAdaptiveLayout");
}

- (void)endDynamicAdaptiveLayout
{
  TSUPointerKeyDictionary *v3;

  if (self->mSupportsAdaptiveLayout)
  {
    v3 = self->mShiftedObjects;
    self->mShiftedObjects = 0;
  }
}

- (CGPoint)applyAdaptiveLayoutTo:(id)a3 info:(id)a4 offset:(CGPoint)a5
{
  double y;
  double x;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  if (!self->mSupportsAdaptiveLayout)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 128, CFSTR("should not use this API"));
  }
  objc_opt_class();
  v12 = (void *)TSUDynamicCast();
  if (a3)
  {
    if ((TSDRootLayout *)objc_msgSend(a3, "parent") != self)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 135, CFSTR("unexpected layout being shifted"));
    }
    if ((void *)objc_msgSend(a3, "info") != v12)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 137, CFSTR("layout's info didn't match passed in info"));
    }
  }
  v18 = *MEMORY[0x24BDBEFB0];
  v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v12 && (objc_msgSend(v12, "isLocked") & 1) == 0)
  {
    v19 = -[TSDRootLayout p_shiftedObjects](self, "p_shiftedObjects");
    if (!v19)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 146, CFSTR("invalid nil value for '%s'"), "shiftedObjects");
    }
    v22 = (void *)objc_msgSend(v19, "objectForKey:", v12);
    v17 = y;
    v18 = x;
    if (a3)
    {
      v17 = y;
      v18 = x;
      if (v22)
      {
        objc_msgSend(v22, "CGPointValue");
        v18 = TSDAddPoints(v23, v24, x);
        v17 = v25;
      }
    }
    objc_msgSend(v19, "setObject:forUncopiedKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v18, v17), a4);
    if (a3)
      objc_msgSend(a3, "offsetGeometryBy:", x, y);
  }
  v26 = v18;
  v27 = v17;
  result.y = v27;
  result.x = v26;
  return result;
}

@end
