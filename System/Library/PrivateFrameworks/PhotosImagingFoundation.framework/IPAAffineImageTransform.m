@implementation IPAAffineImageTransform

- (IPAAffineImageTransform)initWithInputGeometry:(id)a3 intrinsicGeometry:(id)a4 matrix:(const Matrix4d *)a5 canAlignToPixelsExactly:(BOOL)a6
{
  IPAAffineImageTransform *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IPAAffineImageTransform;
  result = -[IPAImageTransform initWithInputGeometry:intrinsicGeometry:](&v15, sel_initWithInputGeometry_intrinsicGeometry_, a3, a4);
  if (result)
  {
    v9 = *(_OWORD *)&a5->m[6];
    v11 = *(_OWORD *)a5->m;
    v10 = *(_OWORD *)&a5->m[2];
    *(_OWORD *)&result->_matrix.m[4] = *(_OWORD *)&a5->m[4];
    *(_OWORD *)&result->_matrix.m[6] = v9;
    *(_OWORD *)result->_matrix.m = v11;
    *(_OWORD *)&result->_matrix.m[2] = v10;
    v12 = *(_OWORD *)&a5->m[14];
    v14 = *(_OWORD *)&a5->m[8];
    v13 = *(_OWORD *)&a5->m[10];
    *(_OWORD *)&result->_matrix.m[12] = *(_OWORD *)&a5->m[12];
    *(_OWORD *)&result->_matrix.m[14] = v12;
    *(_OWORD *)&result->_matrix.m[8] = v14;
    *(_OWORD *)&result->_matrix.m[10] = v13;
    result->_canAlignToPixelsExactly = a6;
  }
  return result;
}

- (Matrix4d)matrix
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m[14];
  *(_OWORD *)&retstr->m[8] = *(_OWORD *)&self->m[12];
  *(_OWORD *)&retstr->m[10] = v3;
  v4 = *(_OWORD *)&self[1].m[2];
  *(_OWORD *)&retstr->m[12] = *(_OWORD *)self[1].m;
  *(_OWORD *)&retstr->m[14] = v4;
  v5 = *(_OWORD *)&self->m[6];
  *(_OWORD *)retstr->m = *(_OWORD *)&self->m[4];
  *(_OWORD *)&retstr->m[2] = v5;
  v6 = *(_OWORD *)&self->m[10];
  *(_OWORD *)&retstr->m[4] = *(_OWORD *)&self->m[8];
  *(_OWORD *)&retstr->m[6] = v6;
  return self;
}

- (id)inverseTransform
{
  Matrix4d *p_matrix;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id result;
  _OWORD v13[8];

  p_matrix = &self->_matrix;
  v4 = *(_OWORD *)&self->_matrix.m[10];
  v13[4] = *(_OWORD *)&self->_matrix.m[8];
  v13[5] = v4;
  v5 = *(_OWORD *)&self->_matrix.m[14];
  v13[6] = *(_OWORD *)&self->_matrix.m[12];
  v13[7] = v5;
  v6 = *(_OWORD *)&self->_matrix.m[2];
  v13[0] = *(_OWORD *)self->_matrix.m;
  v13[1] = v6;
  v7 = *(_OWORD *)&self->_matrix.m[6];
  v13[2] = *(_OWORD *)&self->_matrix.m[4];
  v13[3] = v7;
  if (PA::Matrix4d::invert((PA::Matrix4d *)v13))
  {
    v8 = objc_alloc((Class)objc_opt_class());
    -[IPAImageTransform intrinsicGeometry](self, "intrinsicGeometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPAImageTransform inputGeometry](self, "inputGeometry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithInputGeometry:intrinsicGeometry:matrix:canAlignToPixelsExactly:", v9, v10, v13, self->_canAlignToPixelsExactly);

    return v11;
  }
  else
  {
    PA::Matrix4d::description((PA::Matrix4d *)p_matrix);
    objc_claimAutoreleasedReturnValue();
    result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (Vector2d)mapVector:(Vector2d)a3
{
  double v3;
  double v4;
  Vector2d v5[2];
  Vector2d result;

  v5[0] = a3;
  v5[1] = (Vector2d)xmmword_1D4CCD100;
  v3 = PA::operator*(self->_matrix.m, &v5[0].X);
  result.Y = v4;
  result.X = v3;
  return result;
}

- (BOOL)canAlignToPixelsExactly
{
  return self->_canAlignToPixelsExactly;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 canAlignToPixelsExactly;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAImageTransform inputGeometry](self, "inputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAImageTransform intrinsicGeometry](self, "intrinsicGeometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  canAlignToPixelsExactly = self->_canAlignToPixelsExactly;
  PA::Matrix4d::description((PA::Matrix4d *)&self->_matrix);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p inputGeometry:%@ intrinsicGeometry:%@ canAlignToPixelsExactly:%d matrix:\n%@>"), v5, self, v6, v7, canAlignToPixelsExactly, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
