@implementation PUTilingLayout

- (PUTilingLayout)initWithDataSource:(id)a3
{
  id v5;
  PUTilingLayout *v6;
  PUTilingLayout *v7;
  PUTilingLayoutCoordinateSystem *v8;
  PUTilingCoordinateSystem *coordinateSystem;
  NSMutableDictionary *v10;
  NSMutableDictionary *tileIdentifierByIndexPathByKind;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUTilingLayout;
  v6 = -[PUTilingLayout init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(PUTilingLayoutCoordinateSystem);
    coordinateSystem = v7->_coordinateSystem;
    v7->_coordinateSystem = (PUTilingCoordinateSystem *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tileIdentifierByIndexPathByKind = v7->_tileIdentifierByIndexPathByKind;
    v7->_tileIdentifierByIndexPathByKind = v10;

  }
  return v7;
}

- (PUTilingLayout)init
{
  return -[PUTilingLayout initWithDataSource:](self, "initWithDataSource:", 0);
}

- (void)prepareLayout
{
  void *v4;
  id v5;

  -[PUTilingLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayout.m"), 39, CFSTR("data source must be set"));

  }
}

- (CGRect)contentBounds
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayout.m"), 43, CFSTR("must be implemented by concrete subclass"));

  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayout.m"), 48, CFSTR("must be implemented by concrete subclass"));

  return 0;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayout.m"), 53, CFSTR("must be implemented by concrete subclass"));

  return 0;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayout.m"), 58, CFSTR("must be implemented by concrete subclass"));

  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (PUTilingScrollInfo)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:", 0);
}

- (void)invalidateLayoutWithContext:(id)a3 updateImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUTilingLayout tilingView](self, "tilingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout:withContext:", self, v6);

  if (v4)
  {
    -[PUTilingLayout tilingView](self, "tilingView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  -[PUTilingLayout invalidateLayoutWithContext:updateImmediately:](self, "invalidateLayoutWithContext:updateImmediately:", a3, 0);
}

- (id)tileIdentifierForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  id v8;
  PUTileIdentifier *v9;
  PUTileIdentifier *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tileIdentifierByIndexPathByKind, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tileIdentifierByIndexPathByKind, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (PUTileIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [PUTileIdentifier alloc];
    -[PUTilingLayout dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PUTileIdentifier initWithIndexPath:tileKind:dataSourceIdentifier:](v10, "initWithIndexPath:tileKind:dataSourceIdentifier:", v6, v7, v12);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
  }

  return v9;
}

- (void)setParentCoordinateSystem:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentCoordinateSystem, obj);
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParentCoordinateSystem:", obj);

  }
}

- (void)setCoordinateSystemOrigin:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  if (a3.x != self->_coordinateSystemOrigin.x || a3.y != self->_coordinateSystemOrigin.y)
  {
    self->_coordinateSystemOrigin = a3;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCoordinateSystemOrigin:", x, y);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUTilingLayout;
  -[PUTilingLayout description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" dataSource:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PUTilingDataSource)dataSource
{
  return self->_dataSource;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (PUTilingCoordinateSystem)coordinateSystem
{
  return self->_coordinateSystem;
}

- (PUTilingView)tilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->_tilingView);
}

- (void)setTilingView:(id)a3
{
  objc_storeWeak((id *)&self->_tilingView, a3);
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  return (PUTilingCoordinateSystem *)objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);
}

- (CGPoint)coordinateSystemOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_coordinateSystemOrigin.x;
  y = self->_coordinateSystemOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentCoordinateSystem);
  objc_destroyWeak((id *)&self->_tilingView);
  objc_storeStrong((id *)&self->_coordinateSystem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tileIdentifierByIndexPathByKind, 0);
}

@end
