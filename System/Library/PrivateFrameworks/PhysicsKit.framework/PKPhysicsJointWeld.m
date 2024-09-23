@implementation PKPhysicsJointWeld

- (PKPhysicsJointWeld)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  PKPhysicsJointWeld *v11;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = -[PKPhysicsJoint init](self, "init");
  -[PKPhysicsJoint setBodyA:](v11, "setBodyA:", v9);
  -[PKPhysicsJoint setBodyB:](v11, "setBodyB:", v10);
  v11->_anchor.x = x;
  v11->_anchor.y = y;

  return v11;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  PKPhysicsJointWeld *v10;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v9 = a4;
  v10 = -[PKPhysicsJointWeld initWithBodyA:bodyB:anchor:]([PKPhysicsJointWeld alloc], "initWithBodyA:bodyB:anchor:", v8, v9, x, y);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointWeld;
  -[PKPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchor"), self->_anchor.x, self->_anchor.y);

}

- (PKPhysicsJointWeld)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJointWeld *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicsJointWeld;
  v5 = -[PKPhysicsJoint initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_anchor"));
    v5->_anchor.x = v6;
    v5->_anchor.y = v7;
    -[PKPhysicsJoint bodyA](v5, "bodyA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicsJoint bodyB](v5, "bodyB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPhysicsJointWeld initWithBodyA:bodyB:anchor:](v5, "initWithBodyA:bodyB:anchor:", v8, v9, v5->_anchor.x, v5->_anchor.y);

  }
  return v5;
}

- (BOOL)isEqualToWeldJoint:(id)a3
{
  return 1;
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointWeld;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2WeldJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (void)create
{
  void *v3;
  b2Body *v4;
  void *v5;
  b2Body *v6;
  double x;
  float v8;
  double y;
  float v10;
  float v11;
  float v12;
  b2Vec2 v13;

  -[PKPhysicsJoint bodyA](self, "bodyA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (b2Body *)objc_msgSend(v3, "_body");
  -[PKPhysicsJoint bodyB](self, "bodyB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (b2Body *)objc_msgSend(v5, "_body");
  x = self->_anchor.x;
  v8 = PKGet_INV_PTM_RATIO();
  y = self->_anchor.y;
  v10 = PKGet_INV_PTM_RATIO();
  v11 = x * v8;
  v12 = y * v10;
  v13.x = v11;
  v13.y = v12;
  b2RevoluteJointDef::Initialize((b2RevoluteJointDef *)&self->_jointDef, v4, v6, &v13);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_DWORD *)self + 10) = 8;
  *(_QWORD *)((char *)self + 84) = 0;
  *(_QWORD *)((char *)self + 76) = 0;
  *((_DWORD *)self + 23) = 0;
  return self;
}

@end
