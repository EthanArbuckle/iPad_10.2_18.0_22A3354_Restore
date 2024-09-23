@implementation VKRecognizedBarcode

- (VKRecognizedBarcode)initWithFrameInfo:(id)a3 barcodeObservation:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKRecognizedBarcode;
  return -[VKRecognizedItem initWithFrameInfo:rectangleObservation:](&v5, sel_initWithFrameInfo_rectangleObservation_, a3, a4);
}

- (VNBarcodeObservation)observation
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)VKRecognizedBarcode;
  -[VKRecognizedItem observation](&v7, sel_observation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNBarcodeObservation *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VKRecognizedBarcode;
  -[VKRecognizedBarcode description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRecognizedBarcode observation](self, "observation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ payload:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)symbology
{
  void *v2;
  void *v3;

  -[VKRecognizedBarcode observation](self, "observation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbology");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CIBarcodeDescriptor)barcodeDescriptor
{
  void *v2;
  void *v3;

  -[VKRecognizedBarcode observation](self, "observation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barcodeDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CIBarcodeDescriptor *)v3;
}

- (NSString)payloadStringValue
{
  void *v2;
  void *v3;

  -[VKRecognizedBarcode observation](self, "observation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
