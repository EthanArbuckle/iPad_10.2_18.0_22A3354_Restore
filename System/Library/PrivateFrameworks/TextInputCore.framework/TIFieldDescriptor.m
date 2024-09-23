@implementation TIFieldDescriptor

- (TIFieldDescriptor)initWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TIFieldDescriptor *v17;
  TIFieldDescriptor *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIFieldDescriptor;
  v17 = -[TIFieldDescriptor init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fieldName, a3);
    objc_storeStrong((id *)&v18->_fieldDescription, a4);
    objc_storeStrong((id *)&v18->_metricName, a5);
    objc_storeStrong((id *)&v18->_metricType, a6);
    objc_storeStrong((id *)&v18->_inactiveValue, a7);
  }

  return v18;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSString)fieldDescription
{
  return self->_fieldDescription;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (NSString)metricType
{
  return self->_metricType;
}

- (NSObject)inactiveValue
{
  return self->_inactiveValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveValue, 0);
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
  objc_storeStrong((id *)&self->_fieldDescription, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

+ (id)fieldDescriptorWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  TIFieldDescriptor *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[TIFieldDescriptor initWithFieldName:fieldDescription:metricName:metricType:inactiveValue:]([TIFieldDescriptor alloc], "initWithFieldName:fieldDescription:metricName:metricType:inactiveValue:", v15, v14, v13, v12, v11);

  return v16;
}

@end
