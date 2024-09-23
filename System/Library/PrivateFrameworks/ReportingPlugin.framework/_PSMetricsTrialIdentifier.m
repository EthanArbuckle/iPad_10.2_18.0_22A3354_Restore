@implementation _PSMetricsTrialIdentifier

- (_PSMetricsTrialIdentifier)initWithExperiment:(id)a3 treatment:(id)a4 deployment:(id)a5
{
  id v7;
  id v8;
  id v9;
  _PSMetricsTrialIdentifier *v10;
  _PSMetricsTrialIdentifierInternal *v11;
  uint64_t v12;
  _PSMetricsTrialIdentifierInternal *underlyingObject;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_PSMetricsTrialIdentifier;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_PSMetricsTrialIdentifier init](&v15, sel_init);
  v11 = [_PSMetricsTrialIdentifierInternal alloc];
  v12 = -[_PSMetricsTrialIdentifierInternal initWithExperiment:treatment:deployment:](v11, "initWithExperiment:treatment:deployment:", v9, v8, v7, v15.receiver, v15.super_class);

  underlyingObject = v10->_underlyingObject;
  v10->_underlyingObject = (_PSMetricsTrialIdentifierInternal *)v12;

  return v10;
}

- (_PSMetricsTrialIdentifierInternal)underlyingObject
{
  return (_PSMetricsTrialIdentifierInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
