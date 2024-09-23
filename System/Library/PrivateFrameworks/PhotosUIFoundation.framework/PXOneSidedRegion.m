@implementation PXOneSidedRegion

- (PXOneSidedRegion)init
{
  return -[PXOneSidedRegion initWithA:b:c:](self, "initWithA:b:c:", 0.0, 0.0, 0.0);
}

- (PXOneSidedRegion)initWithSideAngle:(double)a3 point:(CGPoint)a4 width:(double)a5 offset:(double)a6
{
  __sincos_stret(a3);
  return -[PXOneSidedRegion initWithA:b:c:](self, "initWithA:b:c:");
}

- (PXOneSidedRegion)initWithA:(double)a3 b:(double)a4 c:(double)a5
{
  PXOneSidedRegion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXOneSidedRegion;
  result = -[PXOneSidedRegion init](&v9, sel_init);
  if (result)
  {
    result->_a = a3;
    result->_b = a4;
    result->_c = a5;
  }
  return result;
}

- (id)transformedWithAffineTransform:(CGAffineTransform *)a3
{
  NSObject *v5;
  double v6;
  uint8_t v8[16];

  if (a3->b != 0.0 || a3->c != 0.0)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_24430E000, v5, OS_LOG_TYPE_ERROR, "currently only supporting non-rotational transforms", v8, 2u);
    }

  }
  v6 = self->_b / a3->d;
  return -[PXOneSidedRegion initWithA:b:c:]([PXOneSidedRegion alloc], "initWithA:b:c:", self->_a / a3->a, v6, self->_c - self->_a / a3->a * a3->tx - v6 * a3->ty);
}

- (double)valueAtPoint:(CGPoint)a3
{
  return a3.y * self->_b + self->_a * a3.x + self->_c;
}

- (CGPath)createPathInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  void *v9;
  void (**v10)(_QWORD, double, double);
  double MinX;
  CGFloat MinY;
  double MaxX;
  CGFloat v14;
  double v15;
  CGFloat MaxY;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  __int128 v26;
  _QWORD aBlock[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PXOneSidedRegion_createPathInRect___block_invoke;
  aBlock[3] = &unk_2514D0D30;
  aBlock[4] = self;
  aBlock[5] = &v28;
  aBlock[6] = Mutable;
  v25[0] = 0;
  v25[1] = v25;
  v25[3] = &unk_244396D4B;
  v25[2] = 0x3010000000;
  v26 = PXPointNull;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __37__PXOneSidedRegion_createPathInRect___block_invoke_2;
  v22[3] = &unk_2514D0D58;
  v24 = v25;
  v9 = _Block_copy(aBlock);
  v23 = v9;
  v10 = (void (**)(_QWORD, double, double))_Block_copy(v22);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinY = CGRectGetMinY(v33);
  v10[2](v10, MinX, MinY);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v14 = CGRectGetMinY(v35);
  v10[2](v10, MaxX, v14);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v15 = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MaxY = CGRectGetMaxY(v37);
  v10[2](v10, v15, MaxY);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v17 = CGRectGetMinX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v18 = CGRectGetMaxY(v39);
  v10[2](v10, v17, v18);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v19 = CGRectGetMinX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v20 = CGRectGetMinY(v41);
  v10[2](v10, v19, v20);
  if (*((_BYTE *)v29 + 24))
    CGPathCloseSubpath(Mutable);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v28, 8);
  return Mutable;
}

- (BOOL)_getIntersectionWithLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 intersectionFromPoint:(CGPoint *)a5 toPoint:(CGPoint *)a6
{
  double y;
  double x;
  double v10;
  double v11;
  double (**v12)(double, double);
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v18;
  _QWORD aBlock[5];

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXOneSidedRegion__getIntersectionWithLineFromPoint_toPoint_intersectionFromPoint_toPoint___block_invoke;
  aBlock[3] = &unk_2514D0D80;
  aBlock[4] = self;
  v12 = (double (**)(double, double))_Block_copy(aBlock);
  v13 = v12[2](v11, v10);
  ((void (*)(double (**)(double, double), double, double))v12[2])(v12, x, y);
  v15 = v14 >= 0.0 || v13 >= 0.0;
  if (!v15 || v13 >= 0.0 && v14 >= 0.0)
  {
LABEL_9:
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v13 >= 0.0)
  {
    v16 = -v14 / (v13 - v14);
    x = x + v16 * (v11 - x);
    y = y + v16 * (v10 - y);
    goto LABEL_9;
  }
  v18 = -v13 / (v14 - v13);
  v11 = v11 + v18 * (x - v11);
  v10 = v10 + v18 * (y - v10);
  if (a5)
  {
LABEL_10:
    a5->x = v11;
    a5->y = v10;
  }
LABEL_11:
  if (a6)
  {
    a6->x = x;
    a6->y = y;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  PXOneSidedRegion *v4;
  unsigned int v5;
  BOOL v6;
  PXOneSidedRegion *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v4 = (PXOneSidedRegion *)a3;
  v18.receiver = self;
  v18.super_class = (Class)PXOneSidedRegion;
  v5 = -[PXOneSidedRegion isEqual:](&v18, sel_isEqual_, v4);
  v6 = v5;
  if (v4 != self && v5)
  {
    v7 = v4;
    -[PXOneSidedRegion a](self, "a");
    v9 = v8;
    -[PXOneSidedRegion a](v7, "a");
    if (v9 == v10 && (-[PXOneSidedRegion b](self, "b"), v12 = v11, -[PXOneSidedRegion b](v7, "b"), v12 == v13))
    {
      -[PXOneSidedRegion c](self, "c");
      v15 = v14;
      -[PXOneSidedRegion c](v7, "c");
      v6 = v15 == v16;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PXOneSidedRegion a](self, "a");
  v4 = v3;
  -[PXOneSidedRegion b](self, "b");
  v6 = v4 + v5;
  -[PXOneSidedRegion c](self, "c");
  return (unint64_t)(v6 + v7);
}

- (double)a
{
  return self->_a;
}

- (double)b
{
  return self->_b;
}

- (double)c
{
  return self->_c;
}

double __92__PXOneSidedRegion__getIntersectionWithLineFromPoint_toPoint_intersectionFromPoint_toPoint___block_invoke(uint64_t a1, double a2, double a3)
{
  return a3 * *(double *)(*(_QWORD *)(a1 + 32) + 16)
       + *(double *)(*(_QWORD *)(a1 + 32) + 8) * a2
       + *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

void __37__PXOneSidedRegion_createPathInRect___block_invoke(uint64_t a1)
{
  CGPath *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  v5 = 0.0;
  v6 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_getIntersectionWithLineFromPoint:toPoint:intersectionFromPoint:toPoint:", &v5, &v3))
  {
    v2 = *(CGPath **)(a1 + 48);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      CGPathAddLineToPoint(v2, 0, v5, v6);
    }
    else
    {
      CGPathMoveToPoint(v2, 0, v5, v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 48), 0, v3, v4);
  }
}

uint64_t __37__PXOneSidedRegion_createPathInRect___block_invoke_2(uint64_t result, double a2, double a3)
{
  uint64_t v5;
  uint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(double *)(v5 + 32) != INFINITY || *(double *)(v5 + 40) != INFINITY)
  {
    v7 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8);
  }
  *(double *)(v5 + 32) = a2;
  *(double *)(v5 + 40) = a3;
  return result;
}

+ (PXOneSidedRegion)identityRegion
{
  if (identityRegion_onceToken != -1)
    dispatch_once(&identityRegion_onceToken, &__block_literal_global_7275);
  return (PXOneSidedRegion *)(id)identityRegion_identityRegion;
}

void __34__PXOneSidedRegion_identityRegion__block_invoke()
{
  PXOneSidedRegion *v0;
  void *v1;

  v0 = -[PXOneSidedRegion initWithA:b:c:]([PXOneSidedRegion alloc], "initWithA:b:c:", 0.0, 0.0, 1.0);
  v1 = (void *)identityRegion_identityRegion;
  identityRegion_identityRegion = (uint64_t)v0;

}

@end
