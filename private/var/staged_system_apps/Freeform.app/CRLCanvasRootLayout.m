@implementation CRLCanvasRootLayout

- (CRLCanvasRootLayout)initWithLayoutController:(id)a3
{
  id v4;
  char *v5;
  CRLCanvasRootLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasRootLayout;
  v5 = -[CRLCanvasAbstractLayout init](&v8, "init");
  v6 = (CRLCanvasRootLayout *)v5;
  if (v5)
    objc_storeWeak((id *)(v5 + 74), v4);

  return v6;
}

- (id)childLayoutsInRect:(CGRect)a3 deep:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "addLayoutsInRect:toArray:deep:", v10, v4, x, y, width, height);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  return v10;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 1;
}

- (BOOL)isRootLevelForInlineGeometry
{
  return 1;
}

- (CRLCanvasLayoutController)layoutController
{
  return (CRLCanvasLayoutController *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)(&self->super._lastInterimPositionYSet
                                                                                             + 1)));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)(&self->super._lastInterimPositionYSet + 1));
}

@end
