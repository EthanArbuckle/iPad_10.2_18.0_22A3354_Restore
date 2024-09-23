@implementation PKPhysicsJointPrismatic

- (PKPhysicsJointPrismatic)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6
{
  CGFloat dy;
  CGFloat dx;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  PKPhysicsJointPrismatic *v14;

  dy = a6.dy;
  dx = a6.dx;
  y = a5.y;
  x = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = -[PKPhysicsJoint init](self, "init");
  -[PKPhysicsJoint setBodyA:](v14, "setBodyA:", v12);
  -[PKPhysicsJoint setBodyB:](v14, "setBodyB:", v13);
  v14->_anchor.x = x;
  v14->_anchor.y = y;
  v14->_axis.dx = dx;
  v14->_axis.dy = dy;

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6
{
  double dy;
  double dx;
  double y;
  double x;
  id v11;
  id v12;
  PKPhysicsJointPrismatic *v13;

  dy = a6.dy;
  dx = a6.dx;
  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  v13 = -[PKPhysicsJointPrismatic initWithBodyA:bodyB:anchor:axis:]([PKPhysicsJointPrismatic alloc], "initWithBodyA:bodyB:anchor:axis:", v11, v12, x, y, dx, dy);

  return v13;
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
  v5.super_class = (Class)PKPhysicsJointPrismatic;
  -[PKPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchor"), self->_anchor.x, self->_anchor.y);
  objc_msgSend(v4, "encodeCGVector:forKey:", CFSTR("_axis"), self->_axis.dx, self->_axis.dy);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsJointPrismatic shouldEnableLimits](self, "shouldEnableLimits"), CFSTR("enableLimits"));
  -[PKPhysicsJointPrismatic lowerDistanceLimit](self, "lowerDistanceLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lowerDistanceLimit"));
  -[PKPhysicsJointPrismatic upperDistanceLimit](self, "upperDistanceLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("upperDistanceLimit"));

}

- (PKPhysicsJointPrismatic)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJointPrismatic *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  PKPhysicsJointPrismatic *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointPrismatic;
  v5 = -[PKPhysicsJoint initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_anchor"));
    v5->_anchor.x = v6;
    v5->_anchor.y = v7;
    objc_msgSend(v4, "decodeCGVectorForKey:", CFSTR("_axis"));
    v5->_axis.dx = v8;
    v5->_axis.dy = v9;
    -[PKPhysicsJoint bodyA](v5, "bodyA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicsJoint bodyB](v5, "bodyB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPhysicsJointPrismatic initWithBodyA:bodyB:anchor:axis:](v5, "initWithBodyA:bodyB:anchor:axis:", v10, v11, v5->_anchor.x, v5->_anchor.y, v5->_axis.dx, v5->_axis.dy);

    -[PKPhysicsJointPrismatic setShouldEnableLimits:](v12, "setShouldEnableLimits:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableLimits")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lowerDistanceLimit"));
    -[PKPhysicsJointPrismatic setLowerDistanceLimit:](v12, "setLowerDistanceLimit:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("upperDistanceLimit"));
    -[PKPhysicsJointPrismatic setUpperDistanceLimit:](v12, "setUpperDistanceLimit:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToPrismaticJoint:(id)a3
{
  PKPhysicsJointPrismatic *v4;
  _BOOL4 v5;
  BOOL v6;

  v4 = (PKPhysicsJointPrismatic *)a3;
  if (self == v4)
    goto LABEL_5;
  v5 = -[PKPhysicsJointPrismatic shouldEnableLimits](self, "shouldEnableLimits");
  if (v5 == -[PKPhysicsJointPrismatic shouldEnableLimits](v4, "shouldEnableLimits"))
  {
    -[PKPhysicsJointPrismatic lowerDistanceLimit](self, "lowerDistanceLimit");
    -[PKPhysicsJointPrismatic lowerDistanceLimit](v4, "lowerDistanceLimit");
    -[PKPhysicsJointPrismatic upperDistanceLimit](self, "upperDistanceLimit");
    -[PKPhysicsJointPrismatic upperDistanceLimit](v4, "upperDistanceLimit");
LABEL_5:
    v6 = 1;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)shouldEnableLimits
{
  return self->_jointDef.enableLimit;
}

- (void)setShouldEnableLimits:(BOOL)a3
{
  b2PrismaticJoint *joint;

  self->_jointDef.enableLimit = a3;
  joint = self->_joint;
  if (joint)
    b2PrismaticJoint::EnableLimit(joint, a3);
}

- (double)lowerDistanceLimit
{
  float lowerTranslation;

  lowerTranslation = self->_jointDef.lowerTranslation;
  return (float)(lowerTranslation * PKGet_PTM_RATIO());
}

- (void)setLowerDistanceLimit:(double)a3
{
  float v4;
  b2PrismaticJoint *joint;

  v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.lowerTranslation = v4;
  joint = self->_joint;
  if (joint)
    b2PrismaticJoint::SetLimits(joint, v4, self->_jointDef.upperTranslation);
}

- (double)upperDistanceLimit
{
  float upperTranslation;

  upperTranslation = self->_jointDef.upperTranslation;
  return (float)(upperTranslation * PKGet_PTM_RATIO());
}

- (void)setUpperDistanceLimit:(double)a3
{
  float v4;
  b2PrismaticJoint *joint;

  v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.upperTranslation = v4;
  joint = self->_joint;
  if (joint)
    b2PrismaticJoint::SetLimits(joint, self->_jointDef.lowerTranslation, v4);
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointPrismatic;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2PrismaticJoint *)a3;
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
  float32x2_t v13;
  b2Vec2 v14;

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
  v14.x = v11;
  v14.y = v12;
  v13 = vcvt_f32_f64((float64x2_t)self->_axis);
  b2PrismaticJointDef::Initialize(&self->_jointDef, v4, v6, &v14, (const b2Vec2 *)&v13);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_DWORD *)self + 10) = 2;
  *(_QWORD *)((char *)self + 84) = 0;
  *(_QWORD *)((char *)self + 76) = 0;
  *((_DWORD *)self + 23) = 1065353216;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_BYTE *)self + 104) = 0;
  *(_QWORD *)((char *)self + 108) = 0;
  *((_BYTE *)self + 116) = 0;
  return self;
}

@end
