@implementation TPSRegionsCondition

- (id)targetingValidations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSCondition values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCondition values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__TPSRegionsCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1EA1E0750;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __43__TPSRegionsCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSRegionsValidation *v4;
  void *v5;
  void *v6;
  TPSRegionsValidation *v7;

  v3 = a2;
  v4 = [TPSRegionsValidation alloc];
  objc_msgSend(v3, "targetValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "excludeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TPSRegionsValidation initWithTargetRegions:excludeRegions:](v4, "initWithTargetRegions:excludeRegions:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (TPSRegionsCondition)init
{
  TPSRegionsCondition *v2;
  TPSRegionsCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSRegionsCondition;
  v2 = -[TPSRegionsCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 3);
  return v3;
}

@end
