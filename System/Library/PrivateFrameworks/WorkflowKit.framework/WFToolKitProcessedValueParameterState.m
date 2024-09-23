@implementation WFToolKitProcessedValueParameterState

- (WFToolKitProcessedValueParameterState)initWithProcessedValue:(id)a3
{
  id v5;
  WFToolKitProcessedValueParameterState *v6;
  WFToolKitProcessedValueParameterState *v7;
  WFToolKitProcessedValueParameterState *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToolKitProcessedValueParameterState;
  v6 = -[WFToolKitProcessedValueParameterState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_processedValue, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  -[WFToolKitProcessedValueParameterState processedValue](self, "processedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v9 && v10)
      v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  return v12;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFToolKitProcessedValueParameterState processedValue](self, "processedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[WFToolKitProcessedValueParameterState processedValue](self, "processedValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

}

- (WFPropertyListObject)serializedRepresentation
{
  return 0;
}

- (id)processedValue
{
  return self->_processedValue;
}

- (void)setProcessedValue:(id)a3
{
  objc_storeStrong(&self->_processedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processedValue, 0);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
