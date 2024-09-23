@implementation PXTilingCoordinateSpace

- (PXTilingCoordinateSpace)init
{
  PXTilingCoordinateSpace *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTilingCoordinateSpace;
  result = -[PXTilingCoordinateSpace init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (PXTilingCoordinateSpace)parentSpace
{
  return (PXTilingCoordinateSpace *)objc_loadWeakRetained((id *)&self->_parentSpace);
}

- (void)setParentSpace:(id)a3
{
  objc_storeWeak((id *)&self->_parentSpace, a3);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSpace);
}

@end
