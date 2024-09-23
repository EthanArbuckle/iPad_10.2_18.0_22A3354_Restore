@implementation PKPhysicsJointRope

- (PKPhysicsJointRope)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  id v12;
  id v13;
  PKPhysicsJointRope *v14;
  PKPhysicsJointRope *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float *p_var0;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  objc_super v35;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v12 = a3;
  v13 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PKPhysicsJointRope;
  v14 = -[PKPhysicsJoint init](&v35, sel_init);
  v15 = v14;
  if (v14)
  {
    -[PKPhysicsJoint setBodyA:](v14, "setBodyA:", v12);
    -[PKPhysicsJoint setBodyB:](v15, "setBodyB:", v13);
    v15->_anchorA.x = v9;
    v15->_anchorA.y = v8;
    v15->_anchorB.x = x;
    v15->_anchorB.y = y;
    v16 = PKGet_INV_PTM_RATIO();
    v17 = PKGet_INV_PTM_RATIO();
    v18 = PKGet_INV_PTM_RATIO();
    v19 = PKGet_INV_PTM_RATIO();
    v15->_jointDef.bodyA = (b2Body *)objc_msgSend(v12, "_body");
    v20 = (float *)objc_msgSend(v13, "_body");
    v21 = v9 * v16;
    v22 = v8 * v17;
    v23 = x * v18;
    v24 = y * v19;
    v15->_jointDef.bodyB = (b2Body *)v20;
    p_var0 = (float *)&v15->_jointDef.bodyA->var0;
    v26 = v21 - p_var0[8];
    v27 = v22 - p_var0[9];
    v29 = p_var0[10];
    v28 = p_var0[11];
    v15->_jointDef.localAnchorA.x = (float)(v27 * v29) + (float)(v28 * v26);
    v15->_jointDef.localAnchorA.y = (float)(v28 * v27) - (float)(v29 * v26);
    v30 = v23 - v20[8];
    v31 = v24 - v20[9];
    v33 = v20[10];
    v32 = v20[11];
    v15->_jointDef.localAnchorB.x = (float)(v31 * v33) + (float)(v32 * v30);
    v15->_jointDef.localAnchorB.y = (float)(v32 * v31) - (float)(v33 * v30);
    v15->_jointDef.maxLength = sqrtf((float)((float)(v22 - v24) * (float)(v22 - v24))+ (float)((float)(v21 - v23) * (float)(v21 - v23)));
  }

  return v15;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  id v11;
  id v12;
  PKPhysicsJointRope *v13;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v11 = a3;
  v12 = a4;
  v13 = -[PKPhysicsJointRope initWithBodyA:bodyB:anchorA:anchorB:]([PKPhysicsJointRope alloc], "initWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

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
  v5.super_class = (Class)PKPhysicsJointRope;
  -[PKPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchorA"), self->_anchorA.x, self->_anchorA.y);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_anchorB"), self->_anchorB.x, self->_anchorB.y);
  -[PKPhysicsJointRope maxLength](self, "maxLength");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxLength"));

}

- (PKPhysicsJointRope)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsJointRope *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  PKPhysicsJointRope *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointRope;
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
    v12 = -[PKPhysicsJointRope initWithBodyA:bodyB:anchorA:anchorB:](v5, "initWithBodyA:bodyB:anchorA:anchorB:", v10, v11, v5->_anchorA.x, v5->_anchorA.y, v5->_anchorB.x, v5->_anchorB.y);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxLength"));
    -[PKPhysicsJointRope setMaxLength:](v12, "setMaxLength:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToRopeJoint:(id)a3
{
  PKPhysicsJointRope *v4;

  v4 = (PKPhysicsJointRope *)a3;
  if (self != v4)
  {
    -[PKPhysicsJointRope maxLength](self, "maxLength");
    -[PKPhysicsJointRope maxLength](v4, "maxLength");
  }

  return 1;
}

- (double)maxLength
{
  float maxLength;

  maxLength = self->_jointDef.maxLength;
  return (float)(maxLength * PKGet_PTM_RATIO());
}

- (void)setMaxLength:(double)a3
{
  float v4;

  v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.maxLength = v4;
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointRope;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2RopeJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_DWORD *)self + 10) = 10;
  *(_OWORD *)((char *)self + 76) = xmmword_208FD6050;
  *((_DWORD *)self + 23) = 0;
  return self;
}

@end
