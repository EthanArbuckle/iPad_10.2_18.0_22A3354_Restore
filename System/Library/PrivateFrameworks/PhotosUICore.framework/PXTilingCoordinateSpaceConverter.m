@implementation PXTilingCoordinateSpaceConverter

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4 != a5)
  {
    -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:](self, "_transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:");
    v7 = y * 0.0 + 0.0 * x;
    x = v7 + 0.0;
    y = v7 + 0.0;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13[2];
  CGRect v14;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 != a5)
  {
    memset(&v13[1], 0, sizeof(CGAffineTransform));
    -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:](self, "_transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:");
    v13[0] = v13[1];
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v15 = CGRectApplyAffineTransform(v14, v13);
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
  }
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (PXTileGeometry)convertTileGeometry:(SEL)a3 toCoordinateSpaceIdentifier:(PXTileGeometry *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGSize size;
  CGSize v11;
  PXTileGeometry *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;

  v6 = *(_OWORD *)&a4->contentSize.height;
  *(_OWORD *)&retstr->hidden = *(_OWORD *)&a4->hidden;
  *(_OWORD *)&retstr->contentSize.height = v6;
  v7 = *(_OWORD *)&a4->contentsRect.size.height;
  *(_OWORD *)&retstr->contentsRect.origin.y = *(_OWORD *)&a4->contentsRect.origin.y;
  *(_OWORD *)&retstr->contentsRect.size.height = v7;
  v8 = *(_OWORD *)&a4->transform.c;
  *(_OWORD *)&retstr->transform.a = *(_OWORD *)&a4->transform.a;
  *(_OWORD *)&retstr->transform.c = v8;
  v9 = *(_OWORD *)&a4->alpha;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)&a4->transform.tx;
  *(_OWORD *)&retstr->alpha = v9;
  size = a4->frame.size;
  retstr->frame.origin = a4->frame.origin;
  retstr->frame.size = size;
  v11 = a4->size;
  retstr->center = a4->center;
  retstr->size = v11;
  if (retstr->coordinateSpaceIdentifier != a5)
  {
    v14 = self;
    -[PXTileGeometry convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:](self, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", a4->coordinateSpaceIdentifier, a4->frame.origin.x, a4->frame.origin.y, a4->frame.size.width, a4->frame.size.height);
    retstr->frame.origin.x = v15;
    retstr->frame.origin.y = v16;
    retstr->frame.size.width = v17;
    retstr->frame.size.height = v18;
    self = (PXTileGeometry *)-[PXTileGeometry convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:](v14, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", a4->coordinateSpaceIdentifier, a5, a4->center.x, a4->center.y);
    retstr->center.x = v19;
    retstr->center.y = v20;
    retstr->coordinateSpaceIdentifier = a5;
  }
  return self;
}

- (CGAffineTransform)_transformOfCoordinateSpaceIdentifier:(SEL)a3 relativeToCoordinateSpaceIdentifier:(void *)a4
{
  void *v8;
  CGAffineTransform *result;
  id v10;

  v10 = a4;
  v8 = a5;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpace:relativeToCoordinateSpace:](self, "_transformOfCoordinateSpace:relativeToCoordinateSpace:", v10, v8);

  return result;
}

- (CGAffineTransform)_transformOfCoordinateSpace:(SEL)a3 relativeToCoordinateSpace:(id)a4
{
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform *v19;
  CGAffineTransform *p_t1;
  void *v21;
  __int128 v22;
  CGAffineTransform *result;
  CGAffineTransform v24;
  CGAffineTransform t2;
  _OWORD v26[3];
  CGAffineTransform t1;

  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C9BAA8];
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v11 + 32);
  if (v9 != v10)
  {
    objc_msgSend(v9, "parentSpace");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpace:relativeToCoordinateSpace:](self, "_transformOfCoordinateSpace:relativeToCoordinateSpace:", v13, v10);
      v15 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
      if (v9)
        objc_msgSend(v9, "transform");
      else
        memset(v26, 0, sizeof(v26));
      v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t1.c = v18;
      *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
      v19 = (CGAffineTransform *)v26;
      p_t1 = &t1;
LABEL_13:
      CGAffineTransformConcat(retstr, v19, p_t1);

      goto LABEL_14;
    }
    objc_msgSend(v10, "parentSpace");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v14 = (void *)v16;
      -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpace:relativeToCoordinateSpace:](self, "_transformOfCoordinateSpace:relativeToCoordinateSpace:", v9, v16);
      v17 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v17;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
      if (v10)
        objc_msgSend(v10, "transform");
      else
        memset(&v24, 0, sizeof(v24));
      CGAffineTransformInvert(&t2, &v24);
      v22 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t1.c = v22;
      *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
      v19 = &t1;
      p_t1 = &t2;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXTilingCoordinateSpaceConverter.m"), 80, CFSTR("coordinate spaces don't have a common ancestor"));

  }
LABEL_14:

  return result;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

+ (id)defaultConverter
{
  if (defaultConverter_onceToken != -1)
    dispatch_once(&defaultConverter_onceToken, &__block_literal_global_153341);
  return (id)defaultConverter_defaultConverter;
}

+ (BOOL)canConvertBetweenCoordinateSpaceIdentifier:(void *)a3 andCoordinateSpaceIdentifier:(void *)a4
{
  void *v6;
  void *v7;

  v6 = a3;
  v7 = a4;
  LOBYTE(a1) = objc_msgSend(a1, "_canConvertBetweenCoordinateSpace:andCoordinateSpace:", v6, v7);

  return (char)a1;
}

+ (BOOL)_canConvertBetweenCoordinateSpace:(id)a3 andCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v6, "parentSpace");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = a1;
      v11 = v9;
      v12 = v7;
    }
    else
    {
      objc_msgSend(v7, "parentSpace");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v13 = 0;
        goto LABEL_8;
      }
      v9 = (void *)v14;
      v10 = a1;
      v11 = v6;
      v12 = v9;
    }
    v13 = objc_msgSend(v10, "_canConvertBetweenCoordinateSpace:andCoordinateSpace:", v11, v12);

  }
LABEL_8:

  return v13;
}

void __52__PXTilingCoordinateSpaceConverter_defaultConverter__block_invoke()
{
  PXTilingCoordinateSpaceConverter *v0;
  void *v1;

  v0 = objc_alloc_init(PXTilingCoordinateSpaceConverter);
  v1 = (void *)defaultConverter_defaultConverter;
  defaultConverter_defaultConverter = (uint64_t)v0;

}

@end
