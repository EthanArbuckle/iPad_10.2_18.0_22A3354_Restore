@implementation PKPhysicsJointDistance

- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  id v12;
  id v13;
  PKPhysicsJointDistance *v14;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = -[PKPhysicsJoint init](self, "init");
  -[PKPhysicsJoint setBodyA:](v14, "setBodyA:", v12);
  -[PKPhysicsJoint setBodyB:](v14, "setBodyB:", v13);
  v14->_anchorA.x = v9;
  v14->_anchorA.y = v8;
  v14->_anchorB.x = x;
  v14->_anchorB.y = y;

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  id v11;
  id v12;
  PKPhysicsJointDistance *v13;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v11 = a3;
  v12 = a4;
  v13 = -[PKPhysicsJointDistance initWithBodyA:bodyB:localAnchorA:localAnchorB:]([PKPhysicsJointDistance alloc], "initWithBodyA:bodyB:localAnchorA:localAnchorB:", v11, v12, v9, v8, x, y);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  id v12;
  id v13;
  PKPhysicsJointDistance *v14;
  float v15;
  float v16;
  float v17;
  float *v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v31;
  float v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = -[PKPhysicsJoint init](self, "init");
  -[PKPhysicsJoint setBodyA:](v14, "setBodyA:", v12);
  -[PKPhysicsJoint setBodyB:](v14, "setBodyB:", v13);
  v15 = PKGet_INV_PTM_RATIO();
  v16 = PKGet_INV_PTM_RATIO();
  v17 = PKGet_INV_PTM_RATIO();
  v38 = v16;
  v39 = v15;
  v35 = PKGet_INV_PTM_RATIO();
  v36 = v17;
  v18 = (float *)objc_msgSend(v12, "_body");
  v33 = x;
  v34 = y;
  v20 = v18[10];
  v19 = v18[11];
  v21 = v18[8];
  v37 = v18[9];
  v22 = objc_msgSend(v13, "_body");
  v23 = *(float *)(v22 + 40);
  LODWORD(x) = *(_DWORD *)(v22 + 44);
  v31 = *(float *)(v22 + 36);
  v32 = *(float *)(v22 + 32);
  LODWORD(y) = PKGet_PTM_RATIO();
  v24 = PKGet_PTM_RATIO();
  v25 = v9 * v39;
  v26 = v8 * v38;
  v14->_anchorA.x = (float)((float)(v21 + (float)((float)(v19 * v25) - (float)(v20 * v26))) * *(float *)&y);
  v14->_anchorA.y = (float)((float)((float)((float)(v19 * v26) + (float)(v20 * v25)) + v37) * v24);
  LODWORD(y) = PKGet_PTM_RATIO();
  v27 = PKGet_PTM_RATIO();
  v28 = v33 * v36;
  v29 = v34 * v35;
  v14->_anchorB.x = (float)((float)(v32 + (float)((float)(*(float *)&x * v28) - (float)(v23 * v29))) * *(float *)&y);
  v14->_anchorB.y = (float)((float)((float)((float)(*(float *)&x * v29) + (float)(v23 * v28)) + v31) * v27);

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  id v11;
  id v12;
  PKPhysicsJointDistance *v13;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v11 = a3;
  v12 = a4;
  v13 = -[PKPhysicsJointDistance initWithBodyA:bodyB:anchorA:anchorB:]([PKPhysicsJointDistance alloc], "initWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointDistance;
  -[PKPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchorA"), self->_anchorA.x, self->_anchorA.y);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchorB"), self->_anchorB.x, self->_anchorB.y);
  -[PKPhysicsJointDistance damping](self, "damping");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("damping"));
  -[PKPhysicsJointDistance frequency](self, "frequency");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("frequency"));

}

- (PKPhysicsJointDistance)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJointDistance *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  PKPhysicsJointDistance *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointDistance;
  v5 = -[PKPhysicsJoint initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_anchorA"));
    v5->_anchorA.x = v6;
    v5->_anchorA.y = v7;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_anchorB"));
    v5->_anchorB.x = v8;
    v5->_anchorB.y = v9;
    -[PKPhysicsJoint bodyA](v5, "bodyA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicsJoint bodyB](v5, "bodyB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPhysicsJointDistance initWithBodyA:bodyB:anchorA:anchorB:](v5, "initWithBodyA:bodyB:anchorA:anchorB:", v10, v11, v5->_anchorA.x, v5->_anchorA.y, v5->_anchorB.x, v5->_anchorB.y);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("damping"));
    -[PKPhysicsJointDistance setDamping:](v12, "setDamping:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frequency"));
    -[PKPhysicsJointDistance setFrequency:](v12, "setFrequency:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToDistanceJoint:(id)a3
{
  PKPhysicsJointDistance *v4;

  v4 = (PKPhysicsJointDistance *)a3;
  if (self != v4)
  {
    -[PKPhysicsJointDistance damping](self, "damping");
    -[PKPhysicsJointDistance damping](v4, "damping");
    -[PKPhysicsJointDistance frequency](self, "frequency");
    -[PKPhysicsJointDistance frequency](v4, "frequency");
  }

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
  v5.super_class = (Class)PKPhysicsJointDistance;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2DistanceJoint *)a3;
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
  double v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  b2Vec2 v19;
  b2Vec2 v20;

  -[PKPhysicsJoint bodyA](self, "bodyA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (b2Body *)objc_msgSend(v3, "_body");
  -[PKPhysicsJoint bodyB](self, "bodyB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (b2Body *)objc_msgSend(v5, "_body");
  x = self->_anchorA.x;
  v8 = PKGet_INV_PTM_RATIO();
  y = self->_anchorA.y;
  v10 = PKGet_INV_PTM_RATIO();
  v11 = x * v8;
  v12 = y * v10;
  v20.x = v11;
  v20.y = v12;
  v13 = self->_anchorB.x;
  v14 = PKGet_INV_PTM_RATIO();
  v15 = self->_anchorB.y;
  v16 = PKGet_INV_PTM_RATIO();
  v17 = v13 * v14;
  v18 = v15 * v16;
  v19.x = v17;
  v19.y = v18;
  b2DistanceJointDef::Initialize(&self->_jointDef, v4, v6, &v20, &v19);

}

- (void)setDamping:(double)a3
{
  float v3;
  b2DistanceJoint *joint;

  v3 = a3;
  self->_jointDef.dampingRatio = v3;
  joint = self->_joint;
  if (joint)
    joint->var12 = v3;
}

- (double)damping
{
  return self->_jointDef.dampingRatio;
}

- (void)setLength:(double)a3
{
  float v5;
  b2DistanceJoint *joint;
  float v7;

  v5 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.length = v5;
  joint = self->_joint;
  if (joint)
  {
    v7 = PKGet_INV_PTM_RATIO() * a3;
    joint->var18 = v7;
  }
}

- (double)length
{
  float length;

  length = self->_jointDef.length;
  return (float)(length * PKGet_PTM_RATIO());
}

- (void)setFrequency:(double)a3
{
  float v3;
  b2DistanceJoint *joint;

  v3 = a3;
  self->_jointDef.frequencyHz = v3;
  joint = self->_joint;
  if (joint)
    joint->var11 = v3;
}

- (double)frequency
{
  return self->_jointDef.frequencyHz;
}

- (BOOL)collideConnected
{
  return self->_jointDef.collideConnected;
}

- (void)setCollideConnected:(BOOL)a3
{
  b2Joint *joint;

  self->_jointDef.collideConnected = a3;
  joint = (b2Joint *)self->_joint;
  if (joint)
    b2Joint::SetCollideConnected(joint, a3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_DWORD *)self + 10) = 3;
  *(_QWORD *)((char *)self + 84) = 0;
  *(_QWORD *)((char *)self + 76) = 0;
  *(_QWORD *)((char *)self + 92) = 1065353216;
  *((_DWORD *)self + 25) = 0;
  return self;
}

@end
