@implementation WFContextualActionMetricEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  WFEventSignificantFigureValueTransformer *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("itemCount");
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasTrackpad
{
  return self->_hasTrackpad;
}

- (void)setHasTrackpad:(BOOL)a3
{
  self->_hasTrackpad = a3;
}

- (unsigned)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unsigned int)a3
{
  self->_itemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
