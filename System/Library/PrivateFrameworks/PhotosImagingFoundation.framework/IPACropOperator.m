@implementation IPACropOperator

- (id)transformForGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect *p_cropRect;
  double v10;
  double v11;
  double v12;
  double width;
  double v14;
  double height;
  double v16;
  double v17;
  double v18;
  IPAImageGeometry *v19;
  IPAAffineImageTransform *v20;
  id result;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  double v30;
  __int128 v31;

  v4 = a3;
  objc_msgSend(v4, "domain");
  p_cropRect = &self->_cropRect;
  if (v5 + p_cropRect->origin.x >= v5)
    v10 = v5 + p_cropRect->origin.x;
  else
    v10 = v5;
  if (v6 + p_cropRect->origin.y >= v6)
    v11 = v6 + p_cropRect->origin.y;
  else
    v11 = v6;
  v12 = v5 + v7;
  if (p_cropRect->size.width + v10 <= v12)
    width = p_cropRect->size.width;
  else
    width = v12 - v10;
  v14 = v6 + v8;
  if (p_cropRect->size.height + v11 <= v14)
    height = p_cropRect->size.height;
  else
    height = v14 - v11;
  v16 = v10;
  v17 = v11;
  v18 = width;
  if (CGRectIsEmpty(*(CGRect *)(&height - 3)))
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v22 = 0x3FF0000000000000;
    v23 = 0u;
    v24 = 0u;
    v25 = 0x3FF0000000000000;
    v26 = 0u;
    v27 = 0u;
    v28 = xmmword_1D4CCD0F0;
    v29 = -v10;
    v30 = -v11;
    v31 = xmmword_1D4CCD100;
    v19 = -[IPAImageGeometry initWithIdentifier:extent:]([IPAImageGeometry alloc], "initWithIdentifier:extent:", CFSTR("cropped"), 0.0, 0.0, width, p_cropRect->size.width);
    v20 = -[IPAAffineImageTransform initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:]([IPAAffineImageTransform alloc], "initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:", v4, v19, &v22, 1);

    return v20;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRect(self->_cropRect);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p cropRect:%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)operatorWithCropRect:(CGRect)a3
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:cropRect:", CFSTR("crop"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)operatorWithIdentifier:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  IPACropOperator *v9;
  id result;
  CGRect v11;
  NSRect v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (CGRectIsEmpty(v11))
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    NSStringFromRect(v12);
    objc_claimAutoreleasedReturnValue();
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v9 = -[IPAGeometryOperator initWithIdentifier:]([IPACropOperator alloc], "initWithIdentifier:", v8);
    v9->_cropRect.origin.x = x;
    v9->_cropRect.origin.y = y;
    v9->_cropRect.size.width = width;
    v9->_cropRect.size.height = height;

    return v9;
  }
  return result;
}

@end
