@implementation TIFeatureUsageDescriptor

- (TIFeatureUsageDescriptor)initWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  TIFeatureUsageDescriptor *v39;
  TIFeatureUsageDescriptor *v40;
  id v42;
  id v43;
  id obj;
  id v46;
  id v48;
  id v49;
  objc_super v50;

  v15 = a3;
  obj = a4;
  v49 = a4;
  v46 = a6;
  v48 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  if (!v20)
  {
    v22 = (void *)MEMORY[0x1E0C99D20];
    v43 = v15;
    LODWORD(v21) = 1008981770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v23 = objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v42 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1053609165;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1058642330;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1061997773;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 1065185444;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v22;
    v35 = v17;
    v36 = v16;
    v37 = (void *)v23;
    objc_msgSend(v34, "arrayWithObjects:", v23, v25, v27, v29, v31, v33, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v43;
    v18 = v42;

    v16 = v36;
    v17 = v35;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0DBEAF0], *MEMORY[0x1E0DBEAE8], *MEMORY[0x1E0DBEAC8], *MEMORY[0x1E0DBEAD0], *MEMORY[0x1E0DBEAC0], *MEMORY[0x1E0DBEAE0], *MEMORY[0x1E0DBEAD8], 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50.receiver = self;
  v50.super_class = (Class)TIFeatureUsageDescriptor;
  v39 = -[TINumericValueDescriptor initWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:](&v50, sel_initWithMetricName_calculationExpression_calculationPrecondition_calculationDefaultValue_calculationDependencies_bucketThresholds_bucketValues_, v15, v16, v17, v18, v19, v20, v38);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_discoveryCounter, obj);
    v40->_discoveryThreshold = a5;
    objc_storeStrong((id *)&v40->_configString, v46);
  }

  return v40;
}

- (NSString)discoveryCounter
{
  return self->_discoveryCounter;
}

- (int64_t)discoveryThreshold
{
  return self->_discoveryThreshold;
}

- (NSString)configString
{
  return self->_configString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configString, 0);
  objc_storeStrong((id *)&self->_discoveryCounter, 0);
}

+ (id)featureUsageDescriptorWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TIFeatureUsageDescriptor *v25;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  v25 = -[TIFeatureUsageDescriptor initWithMetricName:discoveryCounter:discoveryThreshold:configString:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:]([TIFeatureUsageDescriptor alloc], "initWithMetricName:discoveryCounter:discoveryThreshold:configString:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:", v24, v23, a5, v22, v21, v20, v19, v18, v17);

  return v25;
}

@end
