@implementation PKExtendedPhysicsBody

+ (id)bodyWithEllipseInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  const CGPath *v10;
  PKExtendedPhysicsBody *v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3) * -0.5;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v8 = CGRectGetHeight(v13) * -0.5;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetWidth(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v16.size.height = CGRectGetHeight(v15);
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = v9;
  v10 = CGPathCreateWithEllipseInRect(v16, 0);
  v11 = -[PKExtendedPhysicsBody initWithPolygonFromPath:]([PKExtendedPhysicsBody alloc], "initWithPolygonFromPath:", v10);
  CGPathRelease(v10);
  return v11;
}

+ (id)bodyWithCircleOfRadius:(double)a3
{
  return -[PKExtendedPhysicsBody initWithCircleOfRadius:]([PKExtendedPhysicsBody alloc], "initWithCircleOfRadius:", a3);
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3
{
  return -[PKExtendedPhysicsBody initWithRectangleOfSize:]([PKExtendedPhysicsBody alloc], "initWithRectangleOfSize:", a3.width, a3.height);
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  return -[PKExtendedPhysicsBody initWithRectangleOfSize:center:]([PKExtendedPhysicsBody alloc], "initWithRectangleOfSize:center:", a3.width, a3.height, a4.x, a4.y);
}

+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return -[PKExtendedPhysicsBody initWithEdgeFromPoint:toPoint:]([PKExtendedPhysicsBody alloc], "initWithEdgeFromPoint:toPoint:", a3.x, a3.y, a4.x, a4.y);
}

+ (id)bodyWithPolygonFromPath:(CGPath *)a3
{
  return -[PKExtendedPhysicsBody initWithPolygonFromPath:]([PKExtendedPhysicsBody alloc], "initWithPolygonFromPath:", a3);
}

+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3
{
  return -[PKExtendedPhysicsBody initWithEdgeChainFromPath:]([PKExtendedPhysicsBody alloc], "initWithEdgeChainFromPath:", a3);
}

+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3
{
  return -[PKExtendedPhysicsBody initWithEdgeLoopFromPath:]([PKExtendedPhysicsBody alloc], "initWithEdgeLoopFromPath:", a3);
}

+ (id)bodyWithBodies:(id)a3
{
  id v3;
  PKExtendedPhysicsBody *v4;

  v3 = a3;
  v4 = -[PKExtendedPhysicsBody initWithBodies:]([PKExtendedPhysicsBody alloc], "initWithBodies:", v3);

  return v4;
}

- (PKExtendedPhysicsBody)init
{
  PKExtendedPhysicsBody *v2;
  PKExtendedPhysicsBody *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExtendedPhysicsBody;
  v2 = -[PKExtendedPhysicsBody init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKExtendedPhysicsBody setNormalizedDensity:](v2, "setNormalizedDensity:", 1.0);
    -[PKExtendedPhysicsBody set_allowSleep:](v3, "set_allowSleep:", 1);
  }
  return v3;
}

- (void)setNormalizedDensity:(double)a3
{
  double areaFactor;

  areaFactor = self->_areaFactor;
  if (areaFactor == 0.0)
    areaFactor = 1.0;
  -[PKExtendedPhysicsBody setDensity:](self, "setDensity:", areaFactor * a3);
}

- (double)normalizedDensity
{
  double areaFactor;
  double result;

  areaFactor = self->_areaFactor;
  -[PKExtendedPhysicsBody density](self, "density");
  if (areaFactor != 0.0)
    return result / self->_areaFactor;
  return result;
}

- (PKExtendedPhysicsBody)initWithRectangleOfSize:(CGSize)a3
{
  double height;
  double width;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  PKGet_INV_PTM_RATIO();
  v7 = 0.02 / v6;
  v8 = v7 + 1.0;
  v9 = width - v7;
  v10 = width * 0.5;
  if (width - v7 >= width * 0.5)
    v10 = width - v7;
  if (width <= v8)
    v9 = v10;
  v11 = height - v7;
  v12 = height * 0.5;
  if (v11 >= height * 0.5)
    v12 = v11;
  if (height <= v8)
    v11 = v12;
  self->_areaFactor = width * height / (v9 * v11);
  v14.receiver = self;
  v14.super_class = (Class)PKExtendedPhysicsBody;
  return -[PKExtendedPhysicsBody initWithRectangleOfSize:](&v14, sel_initWithRectangleOfSize_);
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
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExtendedPhysicsBody position](self, "position");
  v5 = v4;
  -[PKExtendedPhysicsBody position](self, "position");
  objc_msgSend(v3, "appendFormat:", CFSTR(" PO:(%f,%f)"), v5, v6);
  -[PKExtendedPhysicsBody rotation](self, "rotation");
  objc_msgSend(v3, "appendFormat:", CFSTR(" AN:(%f)"), v7);
  -[PKExtendedPhysicsBody velocity](self, "velocity");
  v9 = v8;
  -[PKExtendedPhysicsBody velocity](self, "velocity");
  objc_msgSend(v3, "appendFormat:", CFSTR(" VE:(%f,%f)"), v9, v10);
  -[PKExtendedPhysicsBody angularVelocity](self, "angularVelocity");
  objc_msgSend(v3, "appendFormat:", CFSTR(" AV:(%f)"), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR(" dy:(%d)"), -[PKExtendedPhysicsBody isDynamic](self, "isDynamic"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" cc:(%d)"), -[PKExtendedPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ar:(%d)"), -[PKExtendedPhysicsBody allowsRotation](self, "allowsRotation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" rs:(%d)"), -[PKExtendedPhysicsBody isResting](self, "isResting"));
  -[PKExtendedPhysicsBody friction](self, "friction");
  objc_msgSend(v3, "appendFormat:", CFSTR(" fr:(%f)"), v12);
  -[PKExtendedPhysicsBody restitution](self, "restitution");
  objc_msgSend(v3, "appendFormat:", CFSTR(" re:(%f)"), v13);
  -[PKExtendedPhysicsBody density](self, "density");
  objc_msgSend(v3, "appendFormat:", CFSTR(" de:(%f)"), v14);
  objc_msgSend(v3, "appendFormat:", CFSTR(" gr:(%d)"), -[PKExtendedPhysicsBody affectedByGravity](self, "affectedByGravity"));
  v15 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)PKExtendedPhysicsBody;
  -[PKExtendedPhysicsBody description](&v19, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %p %@"), v16, self, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)associate
{
  ++self->_associations;
}

- (BOOL)dissociate
{
  int64_t v2;

  v2 = self->_associations - 1;
  self->_associations = v2;
  return v2 == 0;
}

@end
