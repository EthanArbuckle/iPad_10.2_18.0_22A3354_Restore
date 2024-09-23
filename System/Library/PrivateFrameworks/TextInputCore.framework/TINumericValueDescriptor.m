@implementation TINumericValueDescriptor

- (TINumericValueDescriptor)initWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9
{
  id v16;
  id v17;
  TINumericValueDescriptor *v18;
  TINumericValueDescriptor *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)TINumericValueDescriptor;
  v18 = -[TIMetricDescriptor initWithMetricName:](&v25, sel_initWithMetricName_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_calculationExpression, a4);
    objc_storeStrong((id *)&v19->_calculationPrecondition, a5);
    objc_storeStrong((id *)&v19->_calculationDefaultValue, a6);
    objc_storeStrong((id *)&v19->_calculationDependencies, a7);
    objc_storeStrong((id *)&v19->_bucketThresholds, a8);
    objc_storeStrong((id *)&v19->_bucketValues, a9);
  }

  return v19;
}

- (NSString)calculationExpression
{
  return self->_calculationExpression;
}

- (NSString)calculationPrecondition
{
  return self->_calculationPrecondition;
}

- (NSNumber)calculationDefaultValue
{
  return self->_calculationDefaultValue;
}

- (NSArray)calculationDependencies
{
  return self->_calculationDependencies;
}

- (NSArray)bucketThresholds
{
  return self->_bucketThresholds;
}

- (NSArray)bucketValues
{
  return self->_bucketValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketValues, 0);
  objc_storeStrong((id *)&self->_bucketThresholds, 0);
  objc_storeStrong((id *)&self->_calculationDependencies, 0);
  objc_storeStrong((id *)&self->_calculationDefaultValue, 0);
  objc_storeStrong((id *)&self->_calculationPrecondition, 0);
  objc_storeStrong((id *)&self->_calculationExpression, 0);
}

+ (id)numericValueDescriptorWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TINumericValueDescriptor *v22;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[TINumericValueDescriptor initWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:]([TINumericValueDescriptor alloc], "initWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:", v21, v20, v19, v18, v17, v16, v15);

  return v22;
}

@end
