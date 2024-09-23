@implementation FxPlug

- (FxPlug)initWithDescriptor:(id)a3 andHost:(id)a4
{
  FxPlug *v6;
  FxPlugPriv *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxPlug;
  v6 = -[FxPlug init](&v9, sel_init);
  if (v6)
  {
    v7 = (FxPlugPriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
    v6->_priv = v7;
    if (v7)
    {
      v6->_priv->var1 = a3;
      v6->_priv->var0 = a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxPlugPriv *priv;
  id var1;
  id var2;
  id var3;
  objc_super v13;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v13.receiver);
  priv = self->_priv;
  if (priv)
  {
    var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    if (priv->var0)
    {

      priv = self->_priv;
    }
    var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v13.receiver = self;
  v13.super_class = (Class)FxPlug;
  -[FxPlug dealloc](&v13, sel_dealloc);
}

+ (id)pinInPinList:(id)a3 withUUID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a3, "objectEnumerator");
  do
  {
    v6 = (void *)objc_msgSend(v5, "nextObject");
    v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "uuid"), "isEqualToString:", a4));
  return v7;
}

- (id)inputPinWithUUID:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "pinInPinList:withUUID:", -[FxPlug inputPins](self, "inputPins"), a3);
}

- (id)outputPinWithUUID:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "pinInPinList:withUUID:", -[FxPlug outputPins](self, "outputPins"), a3);
}

- (id)descriptor
{
  return self->_priv->var1;
}

- (id)createInputPinArray
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)createOutputPinArray
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)imageOutputPin
{
  return 0;
}

- (id)filterImageInputPin
{
  return 0;
}

- (id)transitionImageAInputPin
{
  return 0;
}

- (id)transitionImageBInputPin
{
  return 0;
}

- (Class)canvasControlClass
{
  return (Class)objc_opt_class();
}

- (unsigned)timeScaleForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -timeScaleForStream not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)startTimeForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -startTimeForStream not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)durationForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -durationForStream not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)frameDurationForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -frameDurationForStream not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isStreamPremultiplied:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isStreamPremultiplied not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)pixelAspectForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -pixelAspectForStream not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isContextTypeSupported:bySample: not implemented by FxPlug"), (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)fieldOrderForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -fieldOrderForSample: not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)isSamplePredetermined:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isSamplePredetermined not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)requiredSamplesForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -requiredSamplesForSample: not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)evaluateSample:(id)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -evaluateSample:withOptions: not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)domainOfDefinitionForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -domainOfDefinition not implemented by FxPlug"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

+ (id)fxPlugWithDescriptor:(id)a3 andHost:(id)a4
{
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (void *)objc_msgSend(a3, "plugInClass");
  v7 = objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class());
  v8 = NSStringFromClass((Class)v6);
  FxDebugAssert(v7, CFSTR("%@ is not a subclass of FxPlug"), v9, v10, v11, v12, v13, v14, v8);
  return (id)objc_msgSend(objc_alloc((Class)v6), "initWithDescriptor:andHost:", a3, a4);
}

- (id)host
{
  return self->_priv->var0;
}

- (id)inputPins
{
  id result;

  result = self->_priv->var2;
  if (!result)
  {
    result = -[FxPlug createInputPinArray](self, "createInputPinArray");
    self->_priv->var2 = result;
  }
  return result;
}

- (id)outputPins
{
  id result;

  result = self->_priv->var3;
  if (!result)
  {
    result = -[FxPlug createOutputPinArray](self, "createOutputPinArray");
    self->_priv->var3 = result;
  }
  return result;
}

- (BOOL)renderImageOutputAtTime:(double)a3 withOptions:(id)a4 inFxContext:(id)a5 inRegionOfInterest:(id)a6
{
  id v10;
  void *v11;

  v10 = -[FxPlug imageOutputPin](self, "imageOutputPin");
  if (v10)
  {
    v10 = (id)objc_msgSend(v10, "stream");
    if (v10)
    {
      v10 = (id)objc_msgSend(v10, "createSampleAtTime:", a3);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "setRegionOfInterest:", a6);
        objc_msgSend(v11, "setContext:", a5);
        LOBYTE(v10) = objc_msgSend(v11, "evaluateWithOptions:", a4) != 0;
      }
    }
  }
  return (char)v10;
}

+ (unsigned)leastCommonMultipleOfA:(unsigned int)a3 andB:(unsigned int)a4
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  if (a4)
  {
    v4 = a4;
    v5 = a3;
    do
    {
      v6 = v4;
      v4 = v5 % v4;
      v5 = v6;
    }
    while (v4);
    return a4 * a3 / v6;
  }
  v6 = a3;
  if (a3)
    return a4 * a3 / v6;
  return 0;
}

@end
