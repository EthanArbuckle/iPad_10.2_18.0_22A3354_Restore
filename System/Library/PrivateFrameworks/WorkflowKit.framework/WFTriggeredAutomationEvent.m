@implementation WFTriggeredAutomationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  WFEventSignificantFigureValueTransformer *v2;
  WFEventSignificantFigureValueTransformer *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("batchCount");
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[1] = CFSTR("batchDroppedCount");
  v7[0] = v2;
  v3 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)requiredRuntimeConfirmation
{
  return self->_requiredRuntimeConfirmation;
}

- (void)setRequiredRuntimeConfirmation:(BOOL)a3
{
  self->_requiredRuntimeConfirmation = a3;
}

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  self->_batchCount = a3;
}

- (unsigned)batchDroppedCount
{
  return self->_batchDroppedCount;
}

- (void)setBatchDroppedCount:(unsigned int)a3
{
  self->_batchDroppedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
