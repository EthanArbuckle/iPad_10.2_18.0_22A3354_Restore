@implementation PKPhysicsContact

- (PKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (PKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (CGPoint)contactPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_contactPoint.x;
  y = self->_contactPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGVector)contactNormal
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_contactNormal.dx;
  dy = self->_contactNormal.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (double)collisionImpulse
{
  return self->_impulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);
  objc_storeStrong((id *)&self->_bodyA, 0);
}

- (PKPhysicsContact)init
{
  PKPhysicsContact *v2;
  PKPhysicsContact *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsContact;
  v2 = -[PKPhysicsContact init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPhysicsContact setDidBegin:](v2, "setDidBegin:", 0);
    -[PKPhysicsContact setDidEnd:](v3, "setDidEnd:", 0);
  }
  return v3;
}

- (void)setDidBegin:(BOOL)a3
{
  self->_didBegin = a3;
}

- (BOOL)didBegin
{
  return self->_didBegin;
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (void)setContactPoint:(CGPoint)a3
{
  self->_contactPoint = a3;
}

- (void)setContactNormal:(CGVector)a3
{
  self->_contactNormal = a3;
}

- (void)setBodyA:(id)a3
{
  objc_storeStrong((id *)&self->_bodyA, a3);
}

- (void)setBodyB:(id)a3
{
  objc_storeStrong((id *)&self->_bodyB, a3);
}

- (void)setCollisionImpulse:(double)a3
{
  self->_impulse = a3;
}

@end
