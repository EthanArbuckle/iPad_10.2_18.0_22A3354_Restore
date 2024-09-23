@implementation RCPNaturalInputCollectionSelection

- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  RCPNaturalInputCollectionSelection *result;
  objc_super v13;

  y = a5.y;
  x = a5.x;
  v10 = a3.y;
  v11 = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)RCPNaturalInputCollectionSelection;
  result = -[RCPNaturalInputCollectionSelection init](&v13, sel_init);
  result->_location.x = v11;
  result->_location.y = v10;
  result->_direction.x = x;
  result->_direction.y = y;
  result->_zPosition = a4;
  result->_zDirection = a6;
  return result;
}

- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4
{
  return -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:](self, "initWithLocation:zPosition:direction:zDirection:", a3.x, a3.y, a4, 0.0, 0.0, -1.0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCPNaturalInputCollectionSelection location](self, "location");
  v6 = v5;
  -[RCPNaturalInputCollectionSelection location](self, "location");
  v8 = v7;
  -[RCPNaturalInputCollectionSelection zPosition](self, "zPosition");
  v10 = v9;
  -[RCPNaturalInputCollectionSelection direction](self, "direction");
  v12 = v11;
  -[RCPNaturalInputCollectionSelection direction](self, "direction");
  v14 = v13;
  -[RCPNaturalInputCollectionSelection zDirection](self, "zDirection");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { location: (%f, %f), zPosition: %f, direction: (%f, %f), zDirection: %f }>"), v4, v6, v8, v10, v12, v14, v15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocation:zPosition:direction:zDirection:", self->_location.x, self->_location.y, self->_zPosition, self->_direction.x, self->_direction.y, self->_zDirection);
}

- (CGPoint)location
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (CGPoint)direction
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_direction, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)zDirection
{
  return self->_zDirection;
}

@end
