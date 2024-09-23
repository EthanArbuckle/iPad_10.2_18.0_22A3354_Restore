@implementation PXTilingControllerPreheatRecord

- (PXTilingControllerPreheatRecord)initWithPreheatHandler:(id)a3 context:(void *)a4
{
  id v6;
  PXTilingControllerPreheatRecord *v7;
  PXTilingControllerPreheatRecord *v8;
  uint64_t v9;
  NSIndexSet *preheatedTileIndexes;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXTilingControllerPreheatRecord;
  v7 = -[PXTilingControllerPreheatRecord init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_preheatHandler, v6);
    v8->_context = a4;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = objc_claimAutoreleasedReturnValue();
    preheatedTileIndexes = v8->_preheatedTileIndexes;
    v8->_preheatedTileIndexes = (NSIndexSet *)v9;

  }
  return v8;
}

- (PXTilingControllerPreheatHandler)preheatHandler
{
  return (PXTilingControllerPreheatHandler *)objc_loadWeakRetained((id *)&self->_preheatHandler);
}

- (void)context
{
  return self->_context;
}

- (unint64_t)tileGroup
{
  return self->_tileGroup;
}

- (void)setTileGroup:(unint64_t)a3
{
  self->_tileGroup = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (NSIndexSet)preheatedTileIndexes
{
  return self->_preheatedTileIndexes;
}

- (void)setPreheatedTileIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_preheatedTileIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preheatedTileIndexes, 0);
  objc_destroyWeak((id *)&self->_preheatHandler);
}

@end
