@implementation UWBSignalFeatures

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3
{
  id v4;
  UWBSignalFeatures *v5;
  BiasEstimatorFeatures *v6;
  void *v7;
  BiasEstimatorFeatures *v8;
  BiasEstimatorFeatures *inputFeatures;
  BiasEstimatorOutputs *v10;
  void *v11;
  BiasEstimatorOutputs *v12;
  BiasEstimatorOutputs *outputs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UWBSignalFeatures;
  v5 = -[UWBSignalFeatures init](&v15, "init");
  if (v5)
  {
    v6 = [BiasEstimatorFeatures alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inputFeatures"));
    v8 = -[BiasEstimatorFeatures initWithBiasEstimatorFeatures:](v6, "initWithBiasEstimatorFeatures:", v7);
    inputFeatures = v5->_inputFeatures;
    v5->_inputFeatures = v8;

    v10 = [BiasEstimatorOutputs alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputs"));
    v12 = -[BiasEstimatorOutputs initWithBiasEstimatorOutputs:](v10, "initWithBiasEstimatorOutputs:", v11);
    outputs = v5->_outputs;
    v5->_outputs = v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithUWBSignalFeatures:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputFeatures, CFSTR("inputFeatures"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outputs, CFSTR("outputProbabilities"));

}

- (UWBSignalFeatures)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  UWBSignalFeatures *v11;
  UWBSignalFeatures *v12;
  objc_super v14;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BiasEstimatorFeatures, v5), CFSTR("inputFeatures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BiasEstimatorOutputs, v8), CFSTR("outputProbabilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14.receiver = self;
  v14.super_class = (Class)UWBSignalFeatures;
  v11 = -[UWBSignalFeatures init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[UWBSignalFeatures setInputFeatures:](v11, "setInputFeatures:", v7);
    -[UWBSignalFeatures setOutputs:](v12, "setOutputs:", v10);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BiasEstimatorFeatures *inputFeatures;
  void *v10;
  BiasEstimatorFeatures *v11;
  BOOL v12;
  BiasEstimatorOutputs *outputs;
  void *v14;
  BiasEstimatorOutputs *v15;
  BOOL v16;
  BOOL v17;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v17 = 0;
    goto LABEL_12;
  }
  v7 = v4;
  v8 = v7;
  inputFeatures = self->_inputFeatures;
  if (inputFeatures)
    goto LABEL_5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputFeatures"));

  if (v10)
  {
    inputFeatures = self->_inputFeatures;
LABEL_5:
    v11 = (BiasEstimatorFeatures *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputFeatures"));
    v12 = inputFeatures == v11;

    goto LABEL_6;
  }
  v12 = 1;
LABEL_6:
  outputs = self->_outputs;
  if (!outputs)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputs"));

    if (!v14)
    {
      v16 = 1;
      goto LABEL_10;
    }
    outputs = self->_outputs;
  }
  v15 = (BiasEstimatorOutputs *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputs"));
  v16 = outputs == v15;

LABEL_10:
  v17 = v12 && v16;

LABEL_12:
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures description](self->_inputFeatures, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs description](self->_outputs, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v3, v4));

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BiasEstimatorFeatures hash](self->_inputFeatures, "hash");
  return -[BiasEstimatorOutputs hash](self->_outputs, "hash") ^ v3;
}

- (id)orderedBiasEstimatorFeatutes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures populateOrderedInputFeature](self->_inputFeatures, "populateOrderedInputFeature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs populateOrderedBiasEstimatorOutputs](self->_outputs, "populateOrderedBiasEstimatorOutputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v3, v4));

  return v5;
}

- (BiasEstimatorFeatures)inputFeatures
{
  return self->_inputFeatures;
}

- (void)setInputFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BiasEstimatorOutputs)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputFeatures, 0);
}

@end
