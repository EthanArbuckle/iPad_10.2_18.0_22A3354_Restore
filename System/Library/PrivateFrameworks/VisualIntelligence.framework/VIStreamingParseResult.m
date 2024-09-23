@implementation VIStreamingParseResult

- (VIStreamingParseResult)initWithDetectedObjects:(id)a3
{
  id v4;
  VIStreamingParseResult *v5;
  uint64_t v6;
  NSArray *detectedObjects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIStreamingParseResult;
  v5 = -[VIStreamingParseResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    detectedObjects = v5->_detectedObjects;
    v5->_detectedObjects = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedObjects, 0);
}

@end
