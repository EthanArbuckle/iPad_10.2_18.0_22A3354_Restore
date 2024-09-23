@implementation UPDetectedData

- (UPDetectedData)initWithLabel:(id)a3 dataDetectorResult:(__CFArray *)a4
{
  id v7;
  UPDetectedData *v8;
  UPDetectedData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UPDetectedData;
  v8 = -[UPDetectedData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_dataDetectorResult = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_dataDetectorResult);
  v3.receiver = self;
  v3.super_class = (Class)UPDetectedData;
  -[UPDetectedData dealloc](&v3, sel_dealloc);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (__CFArray)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
