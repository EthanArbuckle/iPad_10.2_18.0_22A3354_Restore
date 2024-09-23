@implementation REMLWeightedModel

uint64_t __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureMode:", a2);
}

void __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetricsInteraction:", v4);

}

void __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMetricsInteraction:", v7);
}

@end
