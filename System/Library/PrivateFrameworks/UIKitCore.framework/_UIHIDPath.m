@implementation _UIHIDPath

- (_UIHIDPath)init
{
  _UIHIDPath *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIHIDPath;
  result = -[_UIHIDPath init](&v3, sel_init);
  if (result)
    result->_deliveryPhase = 0;
  return result;
}

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  int Type;
  NSNumber *v7;
  NSNumber *pathId;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t DataValue;
  double v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;
  unint64_t v35;
  NSObject *v36;
  uint8_t v37[16];

  Type = IOHIDEventGetType();
  if (Type == 7)
  {
    -[_UIHIDPath overridePathId](self, "overridePathId");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = &unk_1E1A99FA8;
    objc_storeStrong((id *)&self->_pathId, v17);

    v18 = _UIEventHIDGetChildPointerEvent((uint64_t)a3);
    if (dyld_program_sdk_at_least())
    {
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHIDPath.m"), 126, CFSTR("scale event missing child pointer event"));

      }
    }
    else if (!v18)
    {
      v35 = _MergedGlobals_1197;
      if (!_MergedGlobals_1197)
      {
        v35 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v35, (unint64_t *)&_MergedGlobals_1197);
      }
      v36 = *(NSObject **)(v35 + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "scale event missing child pointer event", v37, 2u);
      }
    }
    IOHIDEventGetFloatValue();
    v32 = v31;
    IOHIDEventGetFloatValue();
    self->_position.x = v32;
    self->_position.y = v33;
    *(_OWORD *)&self->_majorRadius = xmmword_186682A10;
    *(_OWORD *)&self->_density = xmmword_186682A20;
    self->_twist = 90.0;
    self->_generationCount = 0;
    *(_OWORD *)&self->_force = xmmword_186682A30;
    self->_identity = 0;
    _ZF = (IOHIDEventGetPhase() & 0xC) == 0;
LABEL_22:
    v34 = !_ZF;
    self->_touching = v34;
    return;
  }
  if (Type != 17)
  {
    if (Type != 11)
      return;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", IOHIDEventGetIntegerValue());
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    pathId = self->_pathId;
    self->_pathId = v7;

    IOHIDEventGetFloatValue();
    v10 = v9;
    IOHIDEventGetFloatValue();
    self->_position.x = v10;
    self->_position.y = v11;
    IOHIDEventGetFloatValue();
    self->_majorRadius = v12;
    self->_generationCount = IOHIDEventGetIntegerValue();
    IOHIDEventGetFloatValue();
    self->_force = v13;
    self->_identity = IOHIDEventGetIntegerValue();
    _ZF = IOHIDEventGetIntegerValue() == 0;
    goto LABEL_22;
  }
  -[_UIHIDPath overridePathId](self, "overridePathId");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = &unk_1E1A99FA8;
  objc_storeStrong((id *)&self->_pathId, v22);

  IOHIDEventGetFloatValue();
  v24 = v23;
  IOHIDEventGetFloatValue();
  self->_position.x = v24;
  self->_position.y = v25;
  __asm { FMOV            V1.2D, #1.5 }
  *(_OWORD *)&self->_minorRadius = xmmword_186682A40;
  *(_OWORD *)&self->_quality = _Q1;
  *(_OWORD *)&self->_irregularity = xmmword_186682A50;
  self->_generationCount = 0;
  self->_identity = 0;
  self->_touching = IOHIDEventGetIntegerValue() != 0;
  if (qword_1ECD7FA18 != -1)
    dispatch_once(&qword_1ECD7FA18, &__block_literal_global_457);
  if (_UIHIDPathShouldPopulatePointerForce_shouldPopulate
    && _UIEventHIDGetChildVendorDefinedForceStageEvent((uint64_t)a3))
  {
    DataValue = IOHIDEventGetDataValue();
    BKSHIDEventGetDigitizerAttributes();

    self->_force = *(double *)(DataValue + 32) * 1000.0;
  }
  else
  {
    self->_force = 0.0;
  }
}

- (void)applyTransform:(CGAffineTransform *)a3
{
  self->_position = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a3->a, self->_position.x), vmulq_n_f64(*(float64x2_t *)&a3->c, self->_position.y)));
}

- (NSNumber)pathId
{
  return self->_pathId;
}

- (unsigned)identity
{
  return self->_identity;
}

- (double)force
{
  return self->_force;
}

- (double)minorRadius
{
  return self->_minorRadius;
}

- (double)majorRadius
{
  return self->_majorRadius;
}

- (double)quality
{
  return self->_quality;
}

- (double)density
{
  return self->_density;
}

- (double)irregularity
{
  return self->_irregularity;
}

- (double)twist
{
  return self->_twist;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (NSNumber)overridePathId
{
  return self->_overridePathId;
}

- (void)setOverridePathId:(id)a3
{
  objc_storeStrong((id *)&self->_overridePathId, a3);
}

- (int64_t)deliveryPhase
{
  return self->_deliveryPhase;
}

- (void)setDeliveryPhase:(int64_t)a3
{
  self->_deliveryPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePathId, 0);
  objc_storeStrong((id *)&self->_pathId, 0);
}

@end
