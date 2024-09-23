@implementation IPAScaleOperator

- (id)transformForGeometry:(id)a3
{
  id v4;
  void *v5;
  double xScale;
  double yScale;
  _BOOL8 v8;
  IPAImageGeometry *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  IPAAffineImageTransform *v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  v5 = v4;
  xScale = self->_xScale;
  yScale = self->_yScale;
  v8 = yScale == 1.0 && xScale == 1.0;
  if (v8)
  {
    v9 = (IPAImageGeometry *)v4;
    v29 = 0u;
    v30 = 0u;
    v32 = 0u;
    v33 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = 0x3FF0000000000000;
    v31 = 0x3FF0000000000000;
    v34 = 0x3FF0000000000000;
    v37 = 0x3FF0000000000000;
  }
  else
  {
    objc_msgSend(v4, "extent", *(_QWORD *)&xScale, 0, 0, 0, 0, *(_QWORD *)&yScale, 0, 0, 0, 0, 0x3FF0000000000000, 0, 0, 0, 0, 0x3FF0000000000000);
    v10 = self->_xScale;
    v11 = self->_yScale;
    v38.origin.x = v12 * v10;
    v38.origin.y = v13 * v11;
    v38.size.width = v14 * v10;
    v38.size.height = v15 * v11;
    v39 = CGRectStandardize(v38);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    objc_msgSend(v5, "domain");
    v20 = self->_xScale;
    v21 = self->_yScale;
    v40.origin.x = v22 * v20;
    v40.origin.y = v23 * v21;
    v40.size.width = v24 * v20;
    v40.size.height = v25 * v21;
    v41 = CGRectStandardize(v40);
    v9 = -[IPAImageGeometry initWithIdentifier:extent:domain:]([IPAImageGeometry alloc], "initWithIdentifier:extent:domain:", CFSTR("scaled"), x, y, width, height, v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  }
  v26 = -[IPAAffineImageTransform initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:]([IPAAffineImageTransform alloc], "initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:", v5, v9, &v28, v8);

  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p xScale:%f yScale:%f>"), v5, self, *(_QWORD *)&self->_xScale, *(_QWORD *)&self->_yScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)operatorWithScaleX:(double)a3 Y:(double)a4
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:scaleX:Y:", CFSTR("scale"), a3, a4);
}

+ (id)operatorWithIdentifier:(id)a3 scaleX:(double)a4 Y:(double)a5
{
  id v7;
  IPAScaleOperator *v8;
  id result;

  v7 = a3;
  if (a4 <= 0.0 || a5 <= 0.0)
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v8 = -[IPAGeometryOperator initWithIdentifier:]([IPAScaleOperator alloc], "initWithIdentifier:", v7);
    v8->_xScale = a4;
    v8->_yScale = a5;

    return v8;
  }
  return result;
}

@end
