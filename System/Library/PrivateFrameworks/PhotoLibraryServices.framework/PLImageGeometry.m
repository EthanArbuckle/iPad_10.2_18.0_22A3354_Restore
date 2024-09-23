@implementation PLImageGeometry

- (PLImageGeometry)init
{
  return -[PLImageGeometry initWithInputSize:inputOrientation:](self, "initWithInputSize:inputOrientation:", 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PLImageGeometry)initWithInputSize:(CGSize)a3 inputOrientation:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  PLImageGeometry *result;
  void *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  if ((unint64_t)(a4 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageGeometry.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLOrientationIsValid(orientation)"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PLImageGeometry;
  result = -[PLImageGeometry init](&v11, sel_init);
  if (result)
  {
    result->_inputRect.origin.x = 0.0;
    result->_inputRect.origin.y = 0.0;
    result->_inputRect.size.width = width;
    result->_inputRect.size.height = height;
    result->_inputOrientation = a4;
    result->_userOrientation = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGPoint origin;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_userOrientation;
  *((_QWORD *)result + 1) = self->_inputOrientation;
  origin = self->_inputRect.origin;
  *(CGSize *)((char *)result + 40) = self->_inputRect.size;
  *(CGPoint *)((char *)result + 24) = origin;
  return result;
}

- (int64_t)appliedOrientation
{
  return PLOrientationConcat(-[PLImageGeometry inputOrientation](self, "inputOrientation"), -[PLImageGeometry userOrientation](self, "userOrientation"));
}

- (void)setAppliedOrientation:(int64_t)a3
{
  -[PLImageGeometry setUserOrientation:](self, "setUserOrientation:", PLOrientationBetweenOrientations(-[PLImageGeometry inputOrientation](self, "inputOrientation"), a3));
}

- (CGRect)outputRect
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = -[PLImageGeometry appliedOrientation](self, "appliedOrientation");
  -[PLImageGeometry inputRect](self, "inputRect");
  v5 = v4;
  v7 = v6;
  -[PLImageGeometry inputRect](self, "inputRect");
  v12 = PLOrientationTransformImageRect(v3, v5, v7, v8, v9, v10, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)appliedTransform
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v5 = -[PLImageGeometry appliedOrientation](self, "appliedOrientation");
  v6 = 6;
  if (v5 != 8)
    v6 = v5;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (v5 == 6)
    v7 = 8;
  else
    v7 = v6;
  *(_OWORD *)&retstr->a = 0uLL;
  -[PLImageGeometry inputRect](self, "inputRect");
  return (CGAffineTransform *)PLOrientationMakeTransformWithSize(v7, (uint64_t)retstr, v8, v9);
}

- (BOOL)isSizeInverted
{
  return (unint64_t)(-[PLImageGeometry appliedOrientation](self, "appliedOrientation") - 5) < 4;
}

- (BOOL)isMirrored
{
  unint64_t v2;

  v2 = -[PLImageGeometry appliedOrientation](self, "appliedOrientation");
  return (v2 < 8) & (0xB4u >> v2);
}

- (void)flipVertically
{
  -[PLImageGeometry applyOrientation:](self, "applyOrientation:", 4);
}

- (void)flipHorizontally
{
  -[PLImageGeometry applyOrientation:](self, "applyOrientation:", 2);
}

- (void)rotateClockwise
{
  -[PLImageGeometry applyOrientation:](self, "applyOrientation:", 6);
}

- (void)rotateCounterClockwise
{
  -[PLImageGeometry applyOrientation:](self, "applyOrientation:", 8);
}

- (void)applyOrientation:(int64_t)a3
{
  void *v6;

  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageGeometry.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLOrientationIsValid(orientation)"));

  }
  self->_userOrientation = PLOrientationConcat(self->_userOrientation, a3);
}

- (CGRect)inputRectForOutputRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PLImageGeometry appliedOrientation](self, "appliedOrientation");
  -[PLImageGeometry outputRect](self, "outputRect");
  v11 = PLOrientationTransformImageRect(v8, v9, v10, x, y, width, height);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)outputRectForInputRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PLImageGeometry appliedOrientation](self, "appliedOrientation");
  v9 = 6;
  if (v8 != 8)
    v9 = v8;
  if (v8 == 6)
    v10 = 8;
  else
    v10 = v9;
  -[PLImageGeometry inputRect](self, "inputRect");
  v13 = PLOrientationTransformImageRect(v10, v11, v12, x, y, width, height);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)denormalizeRect:(CGRect)a3 basis:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLImageGeometry _basisRect:](self, "_basisRect:", a4);
  v10 = v8 + x * v9;
  v13 = v11 + y * v12;
  v14 = width * v9;
  v15 = height * v12;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v10;
  return result;
}

- (CGRect)normalizeRect:(CGRect)a3 basis:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLImageGeometry _basisRect:](self, "_basisRect:", a4);
  v10 = (x - v8) / v9;
  v13 = (y - v11) / v12;
  v14 = width / v9;
  v15 = height / v12;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v10;
  return result;
}

- (CGRect)_basisRect:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (a3 == 1)
  {
    -[PLImageGeometry outputRect](self, "outputRect");
  }
  else if (!a3)
  {
    -[PLImageGeometry inputRect](self, "inputRect");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)transformToOrientation:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return -[PLImageGeometry _transformFromOrientation:toOrientation:](self, "_transformFromOrientation:toOrientation:", -[PLImageGeometry appliedOrientation](self, "appliedOrientation"), a4);
}

- (CGAffineTransform)transformFromOrientation:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return -[PLImageGeometry _transformFromOrientation:toOrientation:](self, "_transformFromOrientation:toOrientation:", a4, -[PLImageGeometry appliedOrientation](self, "appliedOrientation"));
}

- (CGAffineTransform)_transformFromOrientation:(SEL)a3 toOrientation:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;

  v7 = PLOrientationBetweenOrientations(a4, a5);
  v8 = 6;
  if (v7 != 8)
    v8 = v7;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (v7 == 6)
    v9 = 8;
  else
    v9 = v8;
  *(_OWORD *)&retstr->a = 0uLL;
  -[PLImageGeometry inputRect](self, "inputRect");
  return (CGAffineTransform *)PLOrientationMakeTransformWithSize(v9, (uint64_t)retstr, v10, v11);
}

- (id)description
{
  void *v3;
  void *v4;
  CGFloat width;
  CGFloat height;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLImageGeometry;
  -[PLImageGeometry description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  width = self->_inputRect.size.width;
  height = self->_inputRect.size.height;
  PLOrientationName(self->_inputOrientation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLOrientationName(self->_userOrientation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLOrientationName(-[PLImageGeometry appliedOrientation](self, "appliedOrientation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" Input size: {%f, %f}, Orientation :: original | user | applied  =  %@ | %@ | %@"), *(_QWORD *)&width, *(_QWORD *)&height, v7, v8, v9);

  return v4;
}

- (CGRect)inputRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputRect.origin.x;
  y = self->_inputRect.origin.y;
  width = self->_inputRect.size.width;
  height = self->_inputRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)inputOrientation
{
  return self->_inputOrientation;
}

- (int64_t)userOrientation
{
  return self->_userOrientation;
}

- (void)setUserOrientation:(int64_t)a3
{
  self->_userOrientation = a3;
}

+ (id)geometryWithInputSize:(CGSize)a3 initialOrientation:(int64_t)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputSize:inputOrientation:", 1, a3.width, a3.height);
  objc_msgSend(v5, "applyOrientation:", a4);
  return v5;
}

+ (id)geometryWithOutputSize:(CGSize)a3 appliedOrientation:(int64_t)a4
{
  double width;

  if ((unint64_t)(a4 - 5) >= 4)
    width = a3.width;
  else
    width = a3.height;
  if ((unint64_t)(a4 - 5) < 4)
    a3.height = a3.width;
  return (id)objc_msgSend(a1, "geometryWithInputSize:initialOrientation:", width, a3.height);
}

@end
