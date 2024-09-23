@implementation TIContextValueDescriptor

- (TIContextValueDescriptor)initWithMetricName:(id)a3 contextFieldName:(id)a4
{
  id v7;
  TIContextValueDescriptor *v8;
  TIContextValueDescriptor *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIContextValueDescriptor;
  v8 = -[TIMetricDescriptor initWithMetricName:](&v11, sel_initWithMetricName_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_contextFieldName, a4);

  return v9;
}

- (NSString)contextFieldName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContextFieldName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextFieldName, 0);
}

+ (id)contextValueDescriptorWithMetricName:(id)a3 contextFieldName:(id)a4
{
  id v5;
  id v6;
  TIContextValueDescriptor *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TIContextValueDescriptor initWithMetricName:contextFieldName:]([TIContextValueDescriptor alloc], "initWithMetricName:contextFieldName:", v6, v5);

  return v7;
}

@end
