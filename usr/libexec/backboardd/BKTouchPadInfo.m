@implementation BKTouchPadInfo

- (BKTouchPadInfo)initWithService:(id)a3
{
  id v5;
  BKTouchPadInfo *v6;
  BKTouchPadInfo *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  float v30;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BKTouchPadInfo;
  v6 = -[BKTouchPadInfo init](&v32, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderInfo, a3);
    v9 = objc_msgSend(v5, "propertyOfClass:forKey:", objc_opt_class(NSDictionary, v8), CFSTR("SurfaceDimensions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = v10;
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Width")));
      v15 = objc_opt_class(NSNumber, v14);
      v16 = v13;
      v17 = v16;
      if (v15)
      {
        if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Height")));
      v22 = objc_opt_class(NSNumber, v21);
      v23 = v20;
      v24 = v23;
      if (v22)
      {
        if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v26 = v25;

      v7->_digitizerSurfaceDimensions.width = (double)(uint64_t)objc_msgSend(v19, "integerValue") * 0.0000152587891;
      v27 = objc_msgSend(v26, "integerValue");

      v7->_digitizerSurfaceDimensions.height = (double)(uint64_t)v27 * 0.0000152587891;
    }
    v28 = objc_msgSend(v5, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v11), CFSTR("AccurateMaxDigitizerPressureValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v29, "floatValue");
    v7->_maxForce = v30;

  }
  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendInteger:withName:", self->_pathIndexInRangeMask, CFSTR("pathIndexInRangeMask"));
  v5 = objc_msgSend(v3, "appendInteger:withName:", self->_pathIndexTouchingMask, CFSTR("pathIndexTouchingMask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%g"), self->_maxForce));
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("maxForce"));

  v7 = objc_msgSend(v3, "appendObject:withName:", self->_currentDestinations, CFSTR("currentDestinations"));
  v8 = objc_msgSend(v3, "appendObject:withName:", self->_senderInfo, CFSTR("senderInfo"));
  v9 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_overrideSenderDescriptor, CFSTR("overrideSenderDescriptor"), 1);
  v10 = objc_msgSend(v3, "appendObject:withName:", self->_eventDispatcher, CFSTR("dispatcher"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v11;
}

- (void)resetForCancel
{
  NSSet *currentDestinations;
  BKHIDEventDispatcher *eventDispatcher;

  currentDestinations = self->_currentDestinations;
  self->_currentDestinations = 0;

  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = 0;

  *(_QWORD *)&self->_pathIndexInRangeMask = 0;
}

- (BKHIDEventSenderInfo)senderInfo
{
  return self->_senderInfo;
}

- (void)setSenderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_senderInfo, a3);
}

- (BKSHIDEventSenderDescriptor)overrideSenderDescriptor
{
  return self->_overrideSenderDescriptor;
}

- (void)setOverrideSenderDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSenderDescriptor, a3);
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (NSSet)currentDestinations
{
  return self->_currentDestinations;
}

- (void)setCurrentDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_currentDestinations, a3);
}

- (unsigned)pathIndexInRangeMask
{
  return self->_pathIndexInRangeMask;
}

- (void)setPathIndexInRangeMask:(unsigned int)a3
{
  self->_pathIndexInRangeMask = a3;
}

- (unsigned)pathIndexTouchingMask
{
  return self->_pathIndexTouchingMask;
}

- (void)setPathIndexTouchingMask:(unsigned int)a3
{
  self->_pathIndexTouchingMask = a3;
}

- (float)maxForce
{
  return self->_maxForce;
}

- (void)setMaxForce:(float)a3
{
  self->_maxForce = a3;
}

- (CGSize)digitizerSurfaceDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_digitizerSurfaceDimensions.width;
  height = self->_digitizerSurfaceDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDigitizerSurfaceDimensions:(CGSize)a3
{
  self->_digitizerSurfaceDimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDestinations, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_overrideSenderDescriptor, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
}

@end
