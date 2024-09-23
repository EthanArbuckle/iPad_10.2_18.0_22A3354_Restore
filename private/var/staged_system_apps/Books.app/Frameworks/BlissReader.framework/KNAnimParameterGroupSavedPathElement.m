@implementation KNAnimParameterGroupSavedPathElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNAnimParameterGroupSavedPathElement)initWithCoder:(id)a3
{
  id v4;
  KNAnimParameterGroupSavedPathElement *v5;
  id v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)KNAnimParameterGroupSavedPathElement;
  v5 = -[KNAnimParameterGroupSavedPathElement init](&v19, "init");
  if (v5)
  {
    v5->_elementType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ele"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue), CFSTR("tv"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v7, "CGPointValue");
    v5->_toPoint.x = v8;
    v5->_toPoint.y = v9;

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue), CFSTR("cp1"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v11, "CGPointValue");
    v5->_cp1.x = v12;
    v5->_cp1.y = v13;

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue), CFSTR("cp2"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "CGPointValue");
    v5->_cp2.x = v16;
    v5->_cp2.y = v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[KNAnimParameterGroupSavedPathElement elementType](self, "elementType"), CFSTR("ele"));
  -[KNAnimParameterGroupSavedPathElement toPoint](self, "toPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tv"));

  -[KNAnimParameterGroupSavedPathElement cp1](self, "cp1");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cp1"));

  -[KNAnimParameterGroupSavedPathElement cp2](self, "cp2");
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cp2"));

}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(unint64_t)a3
{
  self->_elementType = a3;
}

- (CGPoint)toPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_toPoint.x;
  y = self->_toPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setToPoint:(CGPoint)a3
{
  self->_toPoint = a3;
}

- (CGPoint)cp1
{
  double x;
  double y;
  CGPoint result;

  x = self->_cp1.x;
  y = self->_cp1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCp1:(CGPoint)a3
{
  self->_cp1 = a3;
}

- (CGPoint)cp2
{
  double x;
  double y;
  CGPoint result;

  x = self->_cp2.x;
  y = self->_cp2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCp2:(CGPoint)a3
{
  self->_cp2 = a3;
}

@end
