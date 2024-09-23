@implementation PSPointerShape

+ (id)systemShape
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "_initWithShapeType:bounds:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)circleWithBounds:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)circleWithSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "circleWithBounds:", a3.width * -0.5, a3.height * -0.5, a3.width);
}

+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 3, x, y, width, height);
  *(double *)(v12 + 32) = a4;
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return (id)v12;
}

+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:cornerCurve:", *MEMORY[0x1E0CD2A68], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

+ (id)roundedRectWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:", a3.width * -0.5, a3.height * -0.5, a3.width, a3.height, a4);
}

+ (id)elasticRoundedRectPinnedAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v5;
  CGFloat *v6;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc((Class)a1);
  v6 = (CGFloat *)objc_msgSend(v5, "_initWithShapeType:bounds:", 5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6[6] = x;
  v6[7] = y;
  return v6;
}

+ (id)customShapeWithPath:(CGPath *)a3 usesEvenOddFillRule:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGRect BoundingBox;
  CGRect v19;

  if ((unint64_t)CGPathGetNumberOfPoints() <= 0x100)
  {
    BoundingBox = CGPathGetBoundingBox(a3);
    if (BoundingBox.size.width <= 10000.0 && BoundingBox.size.height <= 10000.0)
    {
      if (CGPathIsRoundedRect())
      {
        if (BSFloatEqualToFloat())
        {
          objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:", 0.0, 0.0, 0.0, 0.0, 0.0, 0);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      else if (CGPathIsEllipse())
      {
        objc_msgSend(a1, "circleWithBounds:", 0.0, 0.0, 0.0, 0.0, 0);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v8 = v7;
        if (v7)
          return (id)v8;
      }
      v19 = CGPathGetBoundingBox(a3);
      v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 4, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
      if (v8)
      {
        *(_QWORD *)(v8 + 8) = MEMORY[0x193FF6258](a3);
        *(_BYTE *)(v8 + 16) = a4;
      }
      return (id)v8;
    }
  }
  objc_msgSend(a1, "systemShape");
  v8 = objc_claimAutoreleasedReturnValue();
  PSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[PSPointerShape customShapeWithPath:usesEvenOddFillRule:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  return (id)v8;
}

+ (id)customShapeWithPath:(CGPath *)a3
{
  return (id)objc_msgSend(a1, "customShapeWithPath:usesEvenOddFillRule:", a3, 0);
}

- (id)_initWithShapeType:(int64_t)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PSPointerShape;
  result = -[PSPointerShape init](&v10, sel_init);
  if (result)
  {
    *((_QWORD *)result + 3) = a3;
    *((CGFloat *)result + 8) = x;
    *((CGFloat *)result + 9) = y;
    *((CGFloat *)result + 10) = width;
    *((CGFloat *)result + 11) = height;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)PSPointerShape;
  -[PSPointerShape dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_bounds.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_bounds.size));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ (unint64_t)self->_cornerRadius ^ self->_shapeType ^ self->_usesEvenOddFillRule;
}

- (BOOL)isEqual:(id)a3
{
  PSPointerShape *v4;
  BOOL v5;

  v4 = (PSPointerShape *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_shapeType == self->_shapeType
      && BSRectEqualToRect()
      && BSFloatEqualToFloat()
      && CGPathEqualToPath(v4->_path, self->_path)
      && v4->_usesEvenOddFillRule == self->_usesEvenOddFillRule;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  PSPointerShape *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __29__PSPointerShape_description__block_invoke;
  v11 = &unk_1E287B708;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("PSPointerShape"), v4, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __29__PSPointerShape_description__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  const CGPath *v14;
  id v15;
  id v16;
  CGRect BoundingBox;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) - 1;
  if (v3 > 4)
    v4 = CFSTR("PSPointerShapeTypeUnknown");
  else
    v4 = (const __CFString *)*((_QWORD *)&off_1E287B728 + v3);
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("_shapeType"));
  v6 = *(void **)(a1 + 32);
  BSStringFromCGPoint();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("_pinnedPoint"));

  v9 = *(void **)(a1 + 32);
  BSStringFromCGRect();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("_bounds"));

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("_cornerRadius"), *(double *)(*(_QWORD *)(a1 + 40) + 32));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("_cornerCurve"));
  v14 = *(const CGPath **)(*(_QWORD *)(a1 + 40) + 8);
  if (v14)
  {
    if ((unint64_t)CGPathGetNumberOfPoints() <= 0x100)
    {
      BoundingBox = CGPathGetBoundingBox(v14);
      if (BoundingBox.size.width <= 10000.0 && BoundingBox.size.height <= 10000.0)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        CGPathApply(*(CGPathRef *)(*(_QWORD *)(a1 + 40) + 8), v15, (CGPathApplierFunction)__encodePathElementIntoData);
        v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v15, CFSTR("_path"));

      }
    }
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("_usesEvenOddFillRule"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPointerShape)initWithCoder:(id)a3
{
  id v4;
  PSPointerShape *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  NSString *cornerCurve;
  void *v17;
  const CGPath *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CGSize v27;
  NSString *v28;
  objc_super v30;
  CGRect BoundingBox;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PSPointerShape;
  v5 = -[PSPointerShape init](&v30, sel_init);
  if (v5)
  {
    v5->_shapeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shapeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedPoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_CGPointValue");
    v5->_pinnedPoint.x = v7;
    v5->_pinnedPoint.y = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bounds"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_CGRectValue");
    v5->_bounds.origin.x = v10;
    v5->_bounds.origin.y = v11;
    v5->_bounds.size.width = v12;
    v5->_bounds.size.height = v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cornerCurve"));
    v15 = objc_claimAutoreleasedReturnValue();
    cornerCurve = v5->_cornerCurve;
    v5->_cornerCurve = (NSString *)v15;

    v5->_usesEvenOddFillRule = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fillRule"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      v18 = -[PSPointerShape _createMutablePathByDecodingData:](v5, "_createMutablePathByDecodingData:", v17);
      if ((unint64_t)CGPathGetNumberOfPoints() > 0x100
        || (BoundingBox = CGPathGetBoundingBox(v18), BoundingBox.size.width > 10000.0)
        || BoundingBox.size.height > 10000.0)
      {
        PSLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[PSPointerShape initWithCoder:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

        v27 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        v5->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
        v5->_bounds.size = v27;
        v5->_shapeType = 1;
        v5->_cornerRadius = 0.0;
        v28 = v5->_cornerCurve;
        v5->_cornerCurve = 0;

        v5->_usesEvenOddFillRule = 0;
      }
      else
      {
        v5->_path = (CGPath *)MEMORY[0x193FF6258](v18);
      }
      CGPathRelease(v18);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_shapeType, CFSTR("shapeType"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", self->_pinnedPoint.x, self->_pinnedPoint.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("pinnedPoint"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bounds"));

  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v7, "encodeObject:forKey:", self->_cornerCurve, CFSTR("cornerCurve"));
  if (self->_path)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    CGPathApply(self->_path, v6, (CGPathApplierFunction)__encodePathElementIntoData);
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("path"));
    objc_msgSend(v7, "encodeBool:forKey:", self->_usesEvenOddFillRule, CFSTR("fillRule"));

  }
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPath)_createMutablePathByDecodingData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  CGPath *Mutable;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  float64x2_t *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = v6;
    v24 = a2;
    Mutable = CGPathCreateMutable();
    v9 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v10 = 0;
    v25 = *MEMORY[0x1E0C9D538];
    do
    {
      v11 = *(unsigned int *)(v9 + v10 + 4);
      v12 = *(int *)(v9 + v10);
      v26 = v25;
      v27 = v25;
      v28 = v25;
      if (v12 > 3)
        v13 = 0;
      else
        v13 = dword_18EB08DA0[v12];
      v14 = v10 + 8;
      if ((_DWORD)v11 != v13 || (_DWORD)v11 == 0)
      {
        v10 += 8;
      }
      else
      {
        v16 = (float64x2_t *)&v26;
        v17 = v11;
        do
        {
          v10 = v14 + 8;
          *v16++ = vcvtq_f64_f32(*(float32x2_t *)(v9 + v14));
          v14 += 8;
          --v17;
        }
        while (v17);
      }
      switch((int)v12)
      {
        case 0:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PSPointerShape.m"), 255, CFSTR("incorrect number of points for path element type kCGPathElementMoveToPoint"));

          }
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 1:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PSPointerShape.m"), 259, CFSTR("incorrect number of points for path element type kCGPathElementAddLineToPoint"));

          }
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 2:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PSPointerShape.m"), 263, CFSTR("incorrect number of points for path element type kCGPathElementAddQuadCurveToPoint"));

          }
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1));
          break;
        case 3:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PSPointerShape.m"), 267, CFSTR("incorrect number of points for path element type kCGPathElementAddCurveToPoint"));

          }
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1), *(CGFloat *)&v28, *((CGFloat *)&v28 + 1));
          break;
        case 4:
          if ((_DWORD)v11 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PSPointerShape.m"), 271, CFSTR("incorrect number of points for path element type kCGPathElementCloseSubpath"));

          }
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
    }
    while (v10 < v7);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (int64_t)shapeType
{
  return self->_shapeType;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGPoint)pinnedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_pinnedPoint.x;
  y = self->_pinnedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (CGPath)path
{
  return self->_path;
}

- (BOOL)usesEvenOddFillRule
{
  return self->_usesEvenOddFillRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
}

+ (void)customShapeWithPath:(uint64_t)a3 usesEvenOddFillRule:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAFD000, a1, a3, "Custom pointer shape rejected for being too complex. Using system pointer shape instead.", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18EAFD000, a1, a3, "Custom pointer shape rejected for being too complex while decoding. Using system pointer shape instead.", a5, a6, a7, a8, 0);
}

@end
