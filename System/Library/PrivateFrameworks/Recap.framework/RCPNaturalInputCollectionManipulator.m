@implementation RCPNaturalInputCollectionManipulator

- (RCPNaturalInputCollectionManipulator)initWithLocation:(CGPoint)a3 zPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6 isOpen:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  RCPNaturalInputCollectionManipulator *result;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)RCPNaturalInputCollectionManipulator;
  result = -[RCPNaturalInputCollectionManipulator init](&v14, sel_init);
  result->_location.x = x;
  result->_location.y = y;
  result->_zPosition = a4;
  result->_sourceGroup = a5;
  result->_interactionMethod = a6;
  result->_isOpen = a7;
  return result;
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
  int64_t v11;
  int64_t v12;
  _BOOL4 v13;
  const __CFString *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCPNaturalInputCollectionManipulator location](self, "location");
  v6 = v5;
  -[RCPNaturalInputCollectionManipulator location](self, "location");
  v8 = v7;
  -[RCPNaturalInputCollectionManipulator zPosition](self, "zPosition");
  v10 = v9;
  v11 = -[RCPNaturalInputCollectionManipulator sourceGroup](self, "sourceGroup");
  v12 = -[RCPNaturalInputCollectionManipulator interactionMethod](self, "interactionMethod");
  v13 = -[RCPNaturalInputCollectionManipulator isOpen](self, "isOpen");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { Location: (%f, %f), zPosition: %f, Source Group: %ld, Interaction Method: %ld, Open: %@ }>"), v4, v6, v8, v10, v11, v12, v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", self->_sourceGroup, self->_interactionMethod, self->_isOpen, self->_location.x, self->_location.y, self->_zPosition);
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

- (int64_t)sourceGroup
{
  return self->_sourceGroup;
}

- (int64_t)interactionMethod
{
  return self->_interactionMethod;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

@end
