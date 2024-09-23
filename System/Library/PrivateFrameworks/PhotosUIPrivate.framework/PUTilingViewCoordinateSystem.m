@implementation PUTilingViewCoordinateSystem

- (PUTilingViewCoordinateSystem)init
{
  return -[PUTilingViewCoordinateSystem initWithTilingView:](self, "initWithTilingView:", 0);
}

- (PUTilingViewCoordinateSystem)initWithTilingView:(id)a3
{
  id v4;
  PUTilingViewCoordinateSystem *v5;
  PUTilingViewCoordinateSystem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUTilingViewCoordinateSystem;
  v5 = -[PUTilingViewCoordinateSystem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_tilingView, v4);

  return v6;
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewCoordinateSystem.m"), 29, CFSTR("must be implemented by concrete subclass"));

  return 0;
}

- (CGPoint)coordinateSystemOrigin
{
  void *v4;
  double v5;
  double v6;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewCoordinateSystem.m"), 34, CFSTR("must be implemented by concrete subclass"));

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- (PUTilingView)tilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->_tilingView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tilingView);
}

@end
