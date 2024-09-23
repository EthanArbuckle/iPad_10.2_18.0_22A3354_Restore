@implementation UIAttachmentBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis
{
  CGFloat dy;
  CGFloat dx;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  uint64_t v14;

  dy = axis.dy;
  dx = axis.dx;
  y = point.y;
  x = point.x;
  v12 = item2;
  v13 = item1;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:attachedToItem:", v13, v12);

  *(CGFloat *)(v14 + 48) = x;
  *(CGFloat *)(v14 + 56) = y;
  *(CGFloat *)(v14 + 136) = dx;
  *(CGFloat *)(v14 + 144) = dy;
  *(_QWORD *)(v14 + 152) = 2;
  *(UIFloatRange *)(v14 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v14;
}

+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis
{
  CGFloat dy;
  CGFloat dx;
  double y;
  double x;
  id v10;
  uint64_t v11;

  dy = axis.dy;
  dx = axis.dx;
  y = point.y;
  x = point.x;
  v10 = item;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:attachedToAnchor:", v10, x, y);

  *(double *)(v11 + 48) = x;
  *(double *)(v11 + 56) = y;
  *(CGFloat *)(v11 + 136) = dx;
  *(CGFloat *)(v11 + 144) = dy;
  *(_QWORD *)(v11 + 152) = 2;
  *(UIFloatRange *)(v11 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v11;
}

- (void)setAttachmentRange:(UIFloatRange)attachmentRange
{
  $888842945EE2C7AB0ACD33E179C69952 *p_attachmentRange;

  if (self->_attachmentType - 1 <= 1)
  {
    p_attachmentRange = &self->_attachmentRange;
    if (self->_attachmentRange.minimum != attachmentRange.minimum
      || self->_attachmentRange.maximum != attachmentRange.maximum)
    {
      p_attachmentRange->minimum = attachmentRange.minimum;
      self->_attachmentRange.maximum = attachmentRange.maximum;
      *(_BYTE *)&self->_stateFlags |= 8u;
      -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", p_attachmentRange->minimum, self->_attachmentRange.maximum);
      -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
    }
  }
}

- (void)_updateJointWithRange:(id)a3
{
  double var1;
  double var0;
  PKPhysicsJoint *v6;
  PKPhysicsJoint *v7;
  double v8;
  double v9;
  PKPhysicsJoint *v10;

  if (self->_joint && self->_attachmentType - 1 <= 1)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self->_joint;
      v7 = v6;
      if (var0 > -3.40282347e38 || var1 < 3.40282347e38)
      {
        v8 = 0.0;
        if (fabs(var0) > 2.22044605e-16)
          v9 = var0;
        else
          v9 = 0.0;
        if (fabs(var1) > 2.22044605e-16)
          v8 = var1;
        if (v9 <= 0.0 && v8 >= 0.0)
        {
          -[PKPhysicsJoint setShouldEnableLimits:](v6, "setShouldEnableLimits:", 1);
          -[PKPhysicsJoint setLowerDistanceLimit:](v7, "setLowerDistanceLimit:", var0);
          -[PKPhysicsJoint setUpperDistanceLimit:](v7, "setUpperDistanceLimit:", var1);
LABEL_20:

          goto LABEL_21;
        }
        NSLog(CFSTR("Attachment range (%f,%f) must include 0 for sliding attachment type %@"), v8, *(_QWORD *)&var0, *(_QWORD *)&var1, self);
        self->_attachmentRange = ($888842945EE2C7AB0ACD33E179C69952)UIFloatRangeInfinite;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        *(_BYTE *)&self->_stateFlags &= ~8u;
        return;
      }
      v10 = self->_joint;
      v7 = v10;
      if (var0 > -3.40282347e38 || var1 < 3.40282347e38)
      {
        -[PKPhysicsJoint setShouldEnableLimits:](v10, "setShouldEnableLimits:", 1);
        -[PKPhysicsJoint setLowerAngleLimit:](v7, "setLowerAngleLimit:", var0);
        -[PKPhysicsJoint setUpperAngleLimit:](v7, "setUpperAngleLimit:", var1);
        goto LABEL_20;
      }
    }
    -[PKPhysicsJoint setShouldEnableLimits:](v7, "setShouldEnableLimits:", 0);
    goto LABEL_20;
  }
}

+ (UIAttachmentBehavior)limitAttachmentWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2
{
  double vertical;
  double horizontal;
  double v8;
  double v9;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  vertical = offset2.vertical;
  horizontal = offset2.horizontal;
  v8 = offset1.vertical;
  v9 = offset1.horizontal;
  v12 = item2;
  v13 = item1;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:offsetFromCenter:attachedToItem:offsetFromCenter:", v13, v12, v9, v8, horizontal, vertical);
  objc_msgSend(v13, "center");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v12, "center");
  v20 = v19;
  v22 = v21;

  *(double *)(v14 + 128) = sqrt((v20 - v16) * (v20 - v16) + (v22 - v18) * (v22 - v18));
  *(_QWORD *)(v14 + 152) = 4;
  return (UIAttachmentBehavior *)(id)v14;
}

+ (UIAttachmentBehavior)fixedAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  CGFloat *v11;

  y = point.y;
  x = point.x;
  v9 = item2;
  v10 = item1;
  v11 = (CGFloat *)objc_msgSend(objc_alloc((Class)a1), "initWithItem:attachedToItem:", v10, v9);

  v11[6] = x;
  v11[7] = y;
  *((_QWORD *)v11 + 19) = 3;
  return (UIAttachmentBehavior *)v11;
}

+ (UIAttachmentBehavior)pinAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  uint64_t v11;

  y = point.y;
  x = point.x;
  v9 = item2;
  v10 = item1;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:attachedToItem:", v10, v9);

  *(CGFloat *)(v11 + 48) = x;
  *(CGFloat *)(v11 + 56) = y;
  *(_QWORD *)(v11 + 152) = 1;
  *(UIFloatRange *)(v11 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v11;
}

- (void)setFrictionTorque:(CGFloat)frictionTorque
{
  PKPhysicsJoint *joint;

  if (self->_attachmentType == 1 && self->_frictionTorque != frictionTorque)
  {
    self->_frictionTorque = frictionTorque;
    joint = self->_joint;
    if (joint)
      -[PKPhysicsJoint setFrictionTorque:](joint, "setFrictionTorque:");
    else
      *(_BYTE *)&self->_stateFlags |= 0x10u;
    -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
  }
}

- (UIAttachmentBehavior)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("init is undefined for objects of type %@"), objc_opt_class());

  return 0;
}

- (UIAttachmentBehavior)initWithItem:(id)item attachedToAnchor:(CGPoint)point
{
  return -[UIAttachmentBehavior initWithItem:point:attachedToAnchor:](self, "initWithItem:point:attachedToAnchor:", item, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), point.x, point.y);
}

- (UIAttachmentBehavior)initWithItem:(id)item1 attachedToItem:(id)item2
{
  return -[UIAttachmentBehavior initWithItem:point:attachedToItem:point:](self, "initWithItem:point:attachedToItem:point:", item1, item2, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (UIAttachmentBehavior)initWithItem:(id)item offsetFromCenter:(UIOffset)offset attachedToAnchor:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  CGFloat vertical;
  CGFloat horizontal;
  id v10;
  UIAttachmentBehavior *v11;
  UIAttachmentBehavior *v12;
  objc_super v14;

  y = point.y;
  x = point.x;
  vertical = offset.vertical;
  horizontal = offset.horizontal;
  v10 = item;
  v14.receiver = self;
  v14.super_class = (Class)UIAttachmentBehavior;
  v11 = -[UIDynamicBehavior init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[UIDynamicBehavior _addItem:](v11, "_addItem:", v10);
    v12->_anchorPoint.x = x;
    v12->_anchorPoint.y = y;
    v12->_anchorPointA.x = horizontal;
    v12->_anchorPointA.y = vertical;
    v12->_type = 1;
  }

  return v12;
}

- (UIAttachmentBehavior)initWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2
{
  CGFloat vertical;
  CGFloat horizontal;
  CGFloat v9;
  CGFloat v10;
  id v12;
  id v13;
  UIAttachmentBehavior *v14;
  UIAttachmentBehavior *v15;
  objc_super v17;

  vertical = offset2.vertical;
  horizontal = offset2.horizontal;
  v9 = offset1.vertical;
  v10 = offset1.horizontal;
  v12 = item1;
  v13 = item2;
  v17.receiver = self;
  v17.super_class = (Class)UIAttachmentBehavior;
  v14 = -[UIDynamicBehavior init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[UIDynamicBehavior _addItem:](v14, "_addItem:", v12);
    -[UIDynamicBehavior _addItem:](v15, "_addItem:", v13);
    v15->_anchorPointA.x = v10;
    v15->_anchorPointA.y = v9;
    v15->_anchorPointB.x = horizontal;
    v15->_anchorPointB.y = vertical;
    v15->_type = 0;
  }

  return v15;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIDynamicBehavior _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (CGFloat)length
{
  PKPhysicsJoint *joint;
  CGFloat result;

  joint = self->_joint;
  if (!joint)
    return self->_length;
  result = 0.0;
  if ((*(_BYTE *)&self->_stateFlags & 0x20) == 0)
  {
    if (self->_attachmentType == 4)
      -[PKPhysicsJoint maxLength](joint, "maxLength", 0.0);
    else
      -[PKPhysicsJoint length](joint, "length", 0.0);
  }
  return result;
}

- (void)setLength:(CGFloat)length
{
  double v5;
  double v6;
  PKPhysicsJoint *joint;
  double v8;

  -[UIAttachmentBehavior length](self, "length");
  if (v5 == length)
  {
    if (!self->_joint)
      *(_BYTE *)&self->_stateFlags |= 4u;
  }
  else
  {
    if (length == 0.0 || (-[UIAttachmentBehavior length](self, "length"), v6 == 0.0))
    {
      self->_length = length;
      *(_BYTE *)&self->_stateFlags |= 4u;
      -[UIAttachmentBehavior _reevaluateJoint](self, "_reevaluateJoint");
    }
    else
    {
      self->_length = length;
      *(_BYTE *)&self->_stateFlags |= 4u;
      joint = self->_joint;
      v8 = self->_length;
      if (self->_attachmentType == 4)
        -[PKPhysicsJoint setMaxLength:](joint, "setMaxLength:", v8);
      else
        -[PKPhysicsJoint setLength:](joint, "setLength:", v8);
    }
    -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
  }
}

- (CGFloat)damping
{
  CGFloat result;

  if (!self->_joint || (*(_BYTE *)&self->_stateFlags & 0x20) != 0)
    return self->_damping;
  -[PKPhysicsJoint damping](self->_joint, "damping");
  return result;
}

- (void)setDamping:(CGFloat)damping
{
  double v5;
  char stateFlags;

  -[UIAttachmentBehavior damping](self, "damping");
  if (v5 != damping)
  {
    self->_damping = damping;
    stateFlags = (char)self->_stateFlags;
    *(_BYTE *)&self->_stateFlags = stateFlags | 1;
    if ((stateFlags & 0x20) == 0)
    {
      -[PKPhysicsJoint setDamping:](self->_joint, "setDamping:", self->_damping);
      -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
    }
  }
}

- (CGFloat)frequency
{
  PKPhysicsJoint *joint;
  CGFloat result;

  joint = self->_joint;
  if (!joint)
    return self->_frequency;
  result = 0.0;
  if ((*(_BYTE *)&self->_stateFlags & 0x20) == 0)
    -[PKPhysicsJoint frequency](joint, "frequency", 0.0);
  return result;
}

- (void)setFrequency:(CGFloat)frequency
{
  double v3;

  v3 = self->_frequency;
  if (v3 != frequency)
  {
    self->_frequency = frequency;
    *(_BYTE *)&self->_stateFlags |= 2u;
    if (frequency == 0.0 || v3 == 0.0)
      -[UIAttachmentBehavior _reevaluateJoint](self, "_reevaluateJoint");
    else
      -[PKPhysicsJoint setFrequency:](self->_joint, "setFrequency:", self->_frequency);
    -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
  }
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  if (self->_anchorBody)
  {
    -[PKExtendedPhysicsBody position](self->_anchorBody, "position");
  }
  else
  {
    x = self->_anchorPoint.x;
    y = self->_anchorPoint.y;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  if (anchorPoint.x != self->_anchorPoint.x || anchorPoint.y != self->_anchorPoint.y)
  {
    self->_anchorPoint = anchorPoint;
    -[PKExtendedPhysicsBody setPosition:](self->_anchorBody, "setPosition:");
    -[UIAttachmentBehavior _changedParameter](self, "_changedParameter");
  }
}

- (void)_changedParameter
{
  int64_t type;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  type = self->_type;
  -[UIDynamicBehavior _context](self, "_context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bodyForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (type)
  {
    objc_msgSend(v7, "setResting:", 0);
    -[PKExtendedPhysicsBody setResting:](self->_anchorBody, "setResting:", 0);
  }
  else
  {
    -[UIDynamicBehavior _context](self, "_context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDynamicBehavior _items](self, "_items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_bodyForItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setResting:", 0);
    objc_msgSend(v11, "setResting:", 0);

  }
  -[UIDynamicBehavior _context](self, "_context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_tickle");

}

- (void)_reevaluateJoint
{
  void *v3;
  void *v4;
  int64_t type;
  void *v6;
  void *v7;
  void *v8;
  PKExtendedPhysicsBody *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPhysicsJoint **p_joint;
  void *v15;
  void *v16;
  PKPhysicsJoint *v17;
  uint64_t v18;
  PKPhysicsJoint *v19;
  char stateFlags;
  char v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  PKPhysicsJoint *v27;
  uint64_t v28;
  PKPhysicsJoint *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  PKPhysicsJoint *v35;
  char v36;
  uint64_t v37;
  PKPhysicsJoint *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  PKPhysicsJoint *v46;
  char v47;
  id v48;

  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_world");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    type = self->_type;
    -[UIDynamicBehavior _items](self, "_items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (type)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_bodyForItem:", v7);
      v48 = (id)objc_claimAutoreleasedReturnValue();

      v9 = self->_anchorBody;
    }
    else
    {
      -[UIDynamicBehavior _items](self, "_items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDynamicBehavior _context](self, "_context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_bodyForItem:", v7);
      v48 = (id)objc_claimAutoreleasedReturnValue();

      -[UIDynamicBehavior _context](self, "_context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_bodyForItem:", v11);
      v9 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();

    }
    p_joint = &self->_joint;
    if (self->_joint)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_world");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeJoint:", *p_joint);

      v17 = *p_joint;
      *p_joint = 0;

    }
    switch(self->_attachmentType)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0D7D308], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", v48, v9, self->_anchorPointA.x, self->_anchorPointA.y, self->_anchorPointB.x, self->_anchorPointB.y);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v18;

        stateFlags = (char)self->_stateFlags;
        v21 = stateFlags & 0xDF;
        *(_BYTE *)&self->_stateFlags = stateFlags & 0xDF;
        if ((stateFlags & 1) != 0)
        {
          -[PKPhysicsJoint setDamping:](*p_joint, "setDamping:", self->_damping);
          v21 = (char)self->_stateFlags;
        }
        if ((v21 & 2) != 0)
        {
          -[PKPhysicsJoint setFrequency:](*p_joint, "setFrequency:", self->_frequency);
          v21 = (char)self->_stateFlags;
        }
        if ((v21 & 4) != 0)
          -[PKPhysicsJoint setLength:](*p_joint, "setLength:", self->_length);
        if (!self->_type)
          -[PKPhysicsJoint setCollideConnected:](*p_joint, "setCollideConnected:", 1);
        -[UIDynamicBehavior _context](self, "_context");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_world");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addJoint:", *p_joint);

        if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
          -[PKPhysicsJoint setLength:](*p_joint, "setLength:", self->_length);
        -[PKPhysicsJoint length](*p_joint, "length");
        if (v24 < 1.0 && self->_frequency == 0.0 && self->_type == 1 && (*(_BYTE *)&self->_stateFlags & 4) == 0)
        {
          -[UIDynamicBehavior _context](self, "_context");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_world");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeJoint:", *p_joint);

          v27 = *p_joint;
          *p_joint = 0;

          -[PKExtendedPhysicsBody position](v9, "position");
          objc_msgSend(MEMORY[0x1E0D7D318], "jointWithBodyA:bodyB:anchor:", v48, v9);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = *p_joint;
          *p_joint = (PKPhysicsJoint *)v28;

          *(_BYTE *)&self->_stateFlags |= 0x20u;
          goto LABEL_34;
        }
        break;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0D7D318], "jointWithBodyA:bodyB:anchor:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)&self->_stateFlags |= 0x20u;
        objc_storeStrong((id *)&self->_joint, v30);
        v31 = (char)self->_stateFlags;
        if ((v31 & 0x10) != 0)
        {
          objc_msgSend(v30, "setFrictionTorque:", self->_frictionTorque);
          v31 = (char)self->_stateFlags;
        }
        if ((v31 & 8) != 0)
          -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", self->_attachmentRange.minimum, self->_attachmentRange.maximum);
        -[UIDynamicBehavior _context](self, "_context");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_world");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addJoint:", *p_joint);

        goto LABEL_35;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0D7D310], "jointWithBodyA:bodyB:anchor:axis:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y, self->_axis.dx, self->_axis.dy);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v34;

        v36 = (char)self->_stateFlags;
        *(_BYTE *)&self->_stateFlags = v36 & 0xDF;
        if ((v36 & 8) != 0)
          -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", self->_attachmentRange.minimum, self->_attachmentRange.maximum);
        goto LABEL_34;
      case 3uLL:
        objc_msgSend(MEMORY[0x1E0D7D328], "jointWithBodyA:bodyB:anchor:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v37;

        *(_BYTE *)&self->_stateFlags &= ~0x20u;
        goto LABEL_34;
      case 4uLL:
        objc_msgSend(v48, "position");
        v40 = v39 - self->_anchorPointA.x;
        v42 = v41 - self->_anchorPointA.y;
        -[PKExtendedPhysicsBody position](v9, "position");
        objc_msgSend(MEMORY[0x1E0D7D320], "jointWithBodyA:bodyB:anchorA:anchorB:", v48, v9, v40, v42, v43 - self->_anchorPointB.x, v44 - self->_anchorPointB.y);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v45;

        v47 = (char)self->_stateFlags;
        *(_BYTE *)&self->_stateFlags = v47 & 0xDF;
        if ((v47 & 4) != 0)
          -[PKPhysicsJoint setMaxLength:](*p_joint, "setMaxLength:", self->_length);
LABEL_34:
        -[UIDynamicBehavior _context](self, "_context");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_world");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addJoint:", *p_joint);
LABEL_35:

        break;
      default:
        break;
    }

  }
}

- (void)_associate
{
  int64_t type;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  PKExtendedPhysicsBody *v8;
  PKExtendedPhysicsBody *anchorBody;
  PKExtendedPhysicsBody *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  type = self->_type;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (type)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "_registerBodyForItem:", v5);

    +[PKExtendedPhysicsBody bodyWithRectangleOfSize:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:", 1.0, 1.0);
    v8 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
    -[PKExtendedPhysicsBody setPosition:](v8, "setPosition:", self->_anchorPoint.x, self->_anchorPoint.y);
    -[PKExtendedPhysicsBody setDynamic:](v8, "setDynamic:", 0);
    anchorBody = self->_anchorBody;
    self->_anchorBody = v8;
    v10 = v8;

    -[UIDynamicBehavior _context](self, "_context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_world");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBody:", v10);

  }
  else
  {
    -[UIDynamicBehavior _items](self, "_items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDynamicBehavior _context](self, "_context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "_registerBodyForItem:", v5);

    -[UIDynamicBehavior _context](self, "_context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v12, "_registerBodyForItem:", v11);
  }

  -[UIAttachmentBehavior _reevaluateJoint](self, "_reevaluateJoint");
}

- (void)_dissociate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKExtendedPhysicsBody *anchorBody;
  PKPhysicsJoint *joint;
  int64_t type;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_world");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeJoint:", self->_joint);

  if (self->_type == 1)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_world");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeBody:", self->_anchorBody);

    anchorBody = self->_anchorBody;
    self->_anchorBody = 0;

  }
  joint = self->_joint;
  self->_joint = 0;

  type = self->_type;
  -[UIDynamicBehavior _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (type)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_unregisterBodyForItem:action:", v15, 0);
  }
  else
  {
    -[UIDynamicBehavior _items](self, "_items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDynamicBehavior _context](self, "_context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_unregisterBodyForItem:action:", v15, 0);

    -[UIDynamicBehavior _context](self, "_context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_unregisterBodyForItem:action:", v11, 0);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char stateFlags;
  char v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGPoint v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)UIAttachmentBehavior;
  -[UIDynamicBehavior description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDynamicBehavior _items](self, "_items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ <-"), v7);
  stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 1) == 0)
    goto LABEL_15;
  objc_msgSend(v5, "appendString:", CFSTR("("));
  if ((*(_BYTE *)&self->_stateFlags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_stateFlags & 2) == 0)
    {
      if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
        goto LABEL_13;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("D:%f"), *(_QWORD *)&self->_damping);
  v9 = (char)self->_stateFlags;
  if ((v9 & 2) != 0)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" "));
LABEL_8:
    objc_msgSend(v5, "appendFormat:", CFSTR("F:%f"), *(_QWORD *)&self->_frequency);
    v9 = (char)self->_stateFlags;
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" "));
LABEL_13:
    objc_msgSend(v5, "appendFormat:", CFSTR("L:%f"), *(_QWORD *)&self->_length);
    goto LABEL_14;
  }
  objc_msgSend(v5, "appendString:", CFSTR(" "));
LABEL_11:
  -[UIAttachmentBehavior length](self, "length");
  objc_msgSend(v5, "appendFormat:", CFSTR("l:%f"), v10);
LABEL_14:
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  stateFlags = (char)self->_stateFlags;
LABEL_15:
  if ((stateFlags & 0x20) != 0)
    v11 = CFSTR(" R ");
  else
    v11 = CFSTR(" D ");
  objc_msgSend(v5, "appendString:", v11);
  if (self->_type)
  {
    -[UIAttachmentBehavior anchorPoint](self, "anchorPoint");
    NSStringFromCGPoint(v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIDynamicBehavior _items](self, "_items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "appendFormat:", CFSTR("-> %@"), v12);

  return v5;
}

- (UIAttachmentBehaviorType)attachedBehaviorType
{
  return self->_attachedBehaviorType;
}

- (CGFloat)frictionTorque
{
  return self->_frictionTorque;
}

- (UIFloatRange)attachmentRange
{
  double minimum;
  double maximum;
  UIFloatRange result;

  minimum = self->_attachmentRange.minimum;
  maximum = self->_attachmentRange.maximum;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joint, 0);
  objc_storeStrong((id *)&self->_anchorBody, 0);
}

@end
