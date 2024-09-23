@implementation PKPhysicsJointRevolute

- (PKPhysicsJointRevolute)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  PKPhysicsJointRevolute *v11;

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
  PKPhysicsJointRevolute *v10;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v9 = a4;
  v10 = -[PKPhysicsJointRevolute initWithBodyA:bodyB:anchor:]([PKPhysicsJointRevolute alloc], "initWithBodyA:bodyB:anchor:", v8, v9, x, y);

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
  v5.super_class = (Class)PKPhysicsJointRevolute;
  -[PKPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchor"), self->_anchor.x, self->_anchor.y);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsJointRevolute shouldEnableLimits](self, "shouldEnableLimits"), CFSTR("enableLimits"));
  -[PKPhysicsJointRevolute lowerAngleLimit](self, "lowerAngleLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lowerAngleLimit"));
  -[PKPhysicsJointRevolute upperAngleLimit](self, "upperAngleLimit");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("upperAngleLimit"));
  -[PKPhysicsJointRevolute frictionTorque](self, "frictionTorque");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("frictionTorque"));

}

- (PKPhysicsJointRevolute)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJointRevolute *v5;
  double *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPhysicsJointRevolute;
  v5 = -[PKPhysicsJoint initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = (double *)v5;
  if (v5)
  {
    -[PKPhysicsJoint bodyA](v5, "bodyA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bodyB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithBodyA:bodyB:anchor:", v7, v8, v6[16], v6[17]);

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_anchor"));
    *(_QWORD *)(v9 + 128) = v10;
    *(_QWORD *)(v9 + 136) = v11;
    objc_msgSend((id)v9, "setShouldEnableLimits:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableLimits")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lowerAngleLimit"));
    objc_msgSend((id)v9, "setLowerAngleLimit:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("upperAngleLimit"));
    objc_msgSend((id)v9, "setUpperAngleLimit:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frictionTorque"));
    objc_msgSend((id)v9, "setFrictionTorque:");
  }
  else
  {
    v9 = 0;
  }

  return (PKPhysicsJointRevolute *)v9;
}

- (BOOL)isEqualToRevoluteJoint:(id)a3
{
  PKPhysicsJointRevolute *v4;
  _BOOL4 v5;
  BOOL v6;

  v4 = (PKPhysicsJointRevolute *)a3;
  if (self == v4)
    goto LABEL_5;
  v5 = -[PKPhysicsJointRevolute shouldEnableLimits](self, "shouldEnableLimits");
  if (v5 == -[PKPhysicsJointRevolute shouldEnableLimits](v4, "shouldEnableLimits"))
  {
    -[PKPhysicsJointRevolute lowerAngleLimit](self, "lowerAngleLimit");
    -[PKPhysicsJointRevolute lowerAngleLimit](v4, "lowerAngleLimit");
    -[PKPhysicsJointRevolute upperAngleLimit](self, "upperAngleLimit");
    -[PKPhysicsJointRevolute upperAngleLimit](v4, "upperAngleLimit");
    -[PKPhysicsJointRevolute frictionTorque](self, "frictionTorque");
    -[PKPhysicsJointRevolute frictionTorque](v4, "frictionTorque");
    -[PKPhysicsJointRevolute rotationSpeed](self, "rotationSpeed");
    -[PKPhysicsJointRevolute rotationSpeed](v4, "rotationSpeed");
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
  b2RevoluteJoint *joint;

  self->_jointDef.enableLimit = a3;
  joint = self->_joint;
  if (joint)
    b2RevoluteJoint::EnableLimit(joint, a3);
}

- (double)lowerAngleLimit
{
  return self->_jointDef.lowerAngle;
}

- (void)setLowerAngleLimit:(double)a3
{
  float v3;
  b2RevoluteJointDef *p_jointDef;
  b2RevoluteJoint *joint;

  v3 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.lowerAngle = v3;
  joint = self->_joint;
  if (joint)
    b2RevoluteJoint::SetLimits(joint, v3, p_jointDef->upperAngle);
}

- (double)upperAngleLimit
{
  return self->_jointDef.upperAngle;
}

- (void)setUpperAngleLimit:(double)a3
{
  float v3;
  b2RevoluteJointDef *p_jointDef;
  b2RevoluteJoint *joint;

  v3 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.upperAngle = v3;
  joint = self->_joint;
  if (joint)
    b2RevoluteJoint::SetLimits(joint, p_jointDef->lowerAngle, v3);
}

- (double)frictionTorque
{
  return self->_jointDef.maxMotorTorque;
}

- (void)setFrictionTorque:(double)a3
{
  float v4;
  b2RevoluteJointDef *p_jointDef;
  BOOL v6;
  b2RevoluteJoint *joint;

  v4 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.maxMotorTorque = v4;
  v6 = (LODWORD(v4) & 0x60000000) != 0 || (HIBYTE(self->_jointDef.motorSpeed) & 0x60) != 0;
  self->_jointDef.enableMotor = v6;
  joint = self->_joint;
  if (joint)
  {
    b2RevoluteJoint::SetMaxMotorTorque(joint, v4);
    b2RevoluteJoint::SetMotorSpeed(self->_joint, p_jointDef->motorSpeed);
    b2RevoluteJoint::EnableMotor(self->_joint, p_jointDef->enableMotor);
  }
}

- (double)rotationSpeed
{
  return self->_jointDef.motorSpeed;
}

- (void)setRotationSpeed:(double)a3
{
  float v3;

  v3 = a3;
  self->_jointDef.motorSpeed = v3;
  -[PKPhysicsJointRevolute setFrictionTorque:](self, "setFrictionTorque:", self->_jointDef.maxMotorTorque);
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointRevolute;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2RevoluteJoint *)a3;
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
  b2RevoluteJointDef::Initialize(&self->_jointDef, v4, v6, &v13);

}

- (CGPoint)anchor
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_anchor, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_DWORD *)self + 10) = 1;
  *((_QWORD *)self + 14) = 0;
  *(_QWORD *)((char *)self + 84) = 0;
  *(_QWORD *)((char *)self + 76) = 0;
  *(_QWORD *)((char *)self + 89) = 0;
  *(_QWORD *)((char *)self + 100) = 0;
  *((_BYTE *)self + 108) = 0;
  return self;
}

@end
