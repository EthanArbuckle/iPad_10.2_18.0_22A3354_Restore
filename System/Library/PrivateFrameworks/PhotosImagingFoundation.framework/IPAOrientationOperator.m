@implementation IPAOrientationOperator

- (id)transformForGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  IPAImageGeometry *v17;
  IPAAffineImageTransform *v18;
  float64x2_t v20[4];
  __int128 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v4 = a3;
  objc_msgSend(v4, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  IPAOrientationMakeTransformWithSize(self->_orientation, (uint64_t)&v37, v9, v11);
  v28 = v37;
  v29 = 0;
  v30 = 0;
  v31 = v38;
  v32 = 0u;
  v33 = 0u;
  v34 = xmmword_1D4CCD0F0;
  v35 = v39;
  v36 = xmmword_1D4CCD100;
  *(double *)&v21 = v6;
  *((double *)&v21 + 1) = v8;
  v22 = v6 + v10;
  v23 = v8;
  v24 = v6;
  v25 = v8 + v12;
  v26 = v6 + v10;
  v27 = v8 + v12;
  PA::operator*((uint64_t)v20, (double *)&v28, &v21);
  v13 = PA::Quad2d::boundingRect(v20);
  v17 = -[IPAImageGeometry initWithIdentifier:extent:]([IPAImageGeometry alloc], "initWithIdentifier:extent:", CFSTR("oriented"), v13, v14, v15, v16);
  v18 = -[IPAAffineImageTransform initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:]([IPAAffineImageTransform alloc], "initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:", v4, v17, &v28, 1);

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t orientation;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  orientation = self->_orientation;
  if ((unint64_t)(orientation - 1) >= 8)
    orientation = 0;
  v7 = IPAOrientationName_names[orientation];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p orientation:%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)operatorWithOrientation:(int64_t)a3
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:orientation:", CFSTR("orientation"), a3);
}

+ (id)operatorWithIdentifier:(id)a3 orientation:(int64_t)a4
{
  id v5;
  IPAOrientationOperator *v6;
  id result;

  v5 = a3;
  if (a4)
  {
    v6 = -[IPAGeometryOperator initWithIdentifier:]([IPAOrientationOperator alloc], "initWithIdentifier:", v5);
    v6->_orientation = a4;

    return v6;
  }
  else
  {
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

@end
