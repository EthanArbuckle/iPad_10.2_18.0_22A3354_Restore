@implementation BKDisplayAnnotationLocation

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(BKDisplayAnnotationLocation);
  *((_BYTE *)result + 8) = self->_inhibitRotation;
  *((_BYTE *)result + 9) = self->_shouldAutoposition;
  *((_OWORD *)result + 1) = self->_superBias;
  *((_OWORD *)result + 2) = self->_point;
  *((_BYTE *)result + 10) = self->_definedInReferenceSpace;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int shouldAutoposition;
  int inhibitRotation;
  double v9;
  BOOL v10;
  double v11;
  int definedInReferenceSpace;
  double v13;
  double v14;

  v5 = a3;
  if (!v5)
    goto LABEL_11;
  v6 = objc_opt_class(self, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_11;
  shouldAutoposition = self->_shouldAutoposition;
  if (shouldAutoposition != objc_msgSend(v5, "shouldAutoposition"))
    goto LABEL_11;
  inhibitRotation = self->_inhibitRotation;
  if (inhibitRotation != objc_msgSend(v5, "inhibitRotation"))
    goto LABEL_11;
  objc_msgSend(v5, "superBias");
  v10 = 0;
  if (self->_superBias.x == v11 && self->_superBias.y == v9)
  {
    definedInReferenceSpace = self->_definedInReferenceSpace;
    if (definedInReferenceSpace == objc_msgSend(v5, "definedInReferenceSpace"))
    {
      objc_msgSend(v5, "point");
      v10 = self->_point.y == v14 && self->_point.x == v13;
      goto LABEL_12;
    }
LABEL_11:
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (BOOL)inhibitRotation
{
  return self->_inhibitRotation;
}

- (void)setInhibitRotation:(BOOL)a3
{
  self->_inhibitRotation = a3;
}

- (BOOL)shouldAutoposition
{
  return self->_shouldAutoposition;
}

- (void)setShouldAutoposition:(BOOL)a3
{
  self->_shouldAutoposition = a3;
}

- (CGPoint)superBias
{
  double x;
  double y;
  CGPoint result;

  x = self->_superBias.x;
  y = self->_superBias.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSuperBias:(CGPoint)a3
{
  self->_superBias = a3;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (BOOL)definedInReferenceSpace
{
  return self->_definedInReferenceSpace;
}

- (void)setDefinedInReferenceSpace:(BOOL)a3
{
  self->_definedInReferenceSpace = a3;
}

+ (id)controlledBySupernode
{
  if (qword_1001175C8 != -1)
    dispatch_once(&qword_1001175C8, &stru_1000ECC40);
  return (id)qword_1001175C0;
}

+ (id)centerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  BKDisplayAnnotationLocation *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 0.5);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToTopLeftOfSuper:(CGPoint)a3
{
  double y;
  double x;
  BKDisplayAnnotationLocation *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 0.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToBottomLeftOfSuper:(CGPoint)a3
{
  double y;
  double x;
  BKDisplayAnnotationLocation *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.0, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

+ (id)relativeToBottomMiddleOfSuper:(CGPoint)a3
{
  double y;
  double x;
  BKDisplayAnnotationLocation *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setShouldAutoposition:](v5, "setShouldAutoposition:", 1);
  -[BKDisplayAnnotationLocation setSuperBias:](v5, "setSuperBias:", 0.5, 1.0);
  -[BKDisplayAnnotationLocation setPoint:](v5, "setPoint:", ceil(x), ceil(y));
  return v5;
}

@end
