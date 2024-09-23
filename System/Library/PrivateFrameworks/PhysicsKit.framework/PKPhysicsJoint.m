@implementation PKPhysicsJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPhysicsJoint bodyA](self, "bodyA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("_bodyA"));

  -[PKPhysicsJoint bodyB](self, "bodyB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("_bodyB"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_implicit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("_implicit"));

}

- (PKPhysicsJoint)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJoint *v5;
  uint64_t v6;
  PKPhysicsBody *bodyA;
  uint64_t v8;
  PKPhysicsBody *bodyB;
  void *v10;

  v4 = a3;
  v5 = -[PKPhysicsJoint init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bodyA"));
    v6 = objc_claimAutoreleasedReturnValue();
    bodyA = v5->_bodyA;
    v5->_bodyA = (PKPhysicsBody *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bodyB"));
    v8 = objc_claimAutoreleasedReturnValue();
    bodyB = v5->_bodyB;
    v5->_bodyB = (PKPhysicsBody *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_implicit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_implicit = objc_msgSend(v10, "BOOLValue");

  }
  return v5;
}

- (BOOL)isEqualToJoint:(id)a3
{
  PKPhysicsJoint *v4;
  char v5;
  BOOL v6;

  v4 = (PKPhysicsJoint *)a3;
  if (self == v4)
    goto LABEL_17;
  if (-[PKPhysicsBody isEqualToBody:](self->_bodyA, "isEqualToBody:", v4->_bodyA)
    && -[PKPhysicsBody isEqualToBody:](self->_bodyB, "isEqualToBody:", v4->_bodyB)
    && self->_implicit == v4->_implicit)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PKPhysicsJoint isEqualToRevoluteJoint:](self, "isEqualToRevoluteJoint:", v4);
LABEL_16:
      v6 = v5;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PKPhysicsJoint isEqualToDistanceJoint:](self, "isEqualToDistanceJoint:", v4);
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PKPhysicsJoint isEqualToRopeJoint:](self, "isEqualToRopeJoint:", v4);
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PKPhysicsJoint isEqualToWeldJoint:](self, "isEqualToWeldJoint:", v4);
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PKPhysicsJoint isEqualToPrismaticJoint:](self, "isEqualToPrismaticJoint:", v4);
      goto LABEL_16;
    }
LABEL_17:
    v6 = 1;
    goto LABEL_18;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

- (PKPhysicsJoint)init
{
  PKPhysicsJoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsJoint;
  result = -[PKPhysicsJoint init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_inUse = 0;
    result->_baseJoint = 0;
  }
  return result;
}

- (CGVector)reactionForce
{
  b2Joint *baseJoint;
  double v3;
  float v4;
  double v5;
  CGVector result;

  baseJoint = self->_baseJoint;
  if (baseJoint)
  {
    v3 = (*((float (**)(b2Joint *, SEL, float))baseJoint->var0 + 2))(baseJoint, a2, 1.0);
    v5 = v4;
  }
  else
  {
    v3 = 0.0;
    v5 = 0.0;
  }
  result.dy = v5;
  result.dx = v3;
  return result;
}

- (double)reactionTorque
{
  b2Joint *baseJoint;

  baseJoint = self->_baseJoint;
  if (baseJoint)
    return (*((float (**)(b2Joint *, SEL, float))baseJoint->var0 + 3))(baseJoint, a2, 1.0);
  else
    return 0.0;
}

- (PKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (void)setBodyA:(id)a3
{
  objc_storeStrong((id *)&self->_bodyA, a3);
}

- (PKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (void)setBodyB:(id)a3
{
  objc_storeStrong((id *)&self->_bodyB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);
  objc_storeStrong((id *)&self->_bodyA, 0);
}

- (b2Joint)_joint
{
  return self->_baseJoint;
}

- (void)set_joint:(b2Joint *)a3
{
  self->_baseJoint = a3;
}

- (BOOL)_implicit
{
  return self->_implicit;
}

- (void)set_implicit:(BOOL)a3
{
  self->_implicit = a3;
}

- (BOOL)_inUse
{
  return self->_inUse;
}

- (void)set_inUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (b2JointDef)_jointDef
{
  return 0;
}

@end
