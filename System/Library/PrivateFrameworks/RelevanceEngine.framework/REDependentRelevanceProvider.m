@implementation REDependentRelevanceProvider

+ (id)_dependentConditionWithRelevanceProvider:(id)a3 invertsRelevance:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke;
  v9[3] = &unk_24CF8EC50;
  v10 = v5;
  v11 = a4;
  v6 = v5;
  +[RERelevanceCondition conditionWithBlock:](RERelevanceCondition, "conditionWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

float __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  const char *v9;
  int v10;
  float v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a2;
  v4 = 0.0;
  if (objc_msgSend(v3, "containsRelevanceProvider:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "featuresForRelevanceProvider:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "relevancesForRelevanceProvider:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke_2;
    v19 = &unk_24CF8EC28;
    v21 = &v22;
    v7 = v6;
    v20 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v16);
    v8 = v23[3];
    if (!v8)
    {
      v8 = objc_msgSend(v7, "firstFeatureValue", v16, v17, v18, v19);
      v23[3] = v8;
    }
    switch(REFeatureValueTypeForTaggedPointer(v8))
    {
      case 0:
        v10 = REBooleanValueForTaggedPointer(v23[3]) ^ 1;
        break;
      case 1:
        v10 = REIntegerValueForTaggedPointer(v23[3]) == 0;
        break;
      case 2:
        v11 = REDoubleValueForTaggedPointer((void *)v23[3], v9);
        v10 = RERelevanceEqualToRelevance(v11, 0.0);
        break;
      case 3:
        REStringValueForTaggedPointer(v23[3]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        goto LABEL_11;
      case 4:
        RESetValueForTaggedPointer((void *)v23[3]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
LABEL_11:
        v10 = v13 == 0;

        break;
      default:
        v10 = 0;
        break;
    }
    v14 = v10 ^ (*(_BYTE *)(a1 + 40) == 0);

    _Block_object_dispose(&v22, 8);
    if (v14)
      v4 = 1.0;
    else
      v4 = 0.0;
  }

  return v4;
}

uint64_t __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "featureType");
  if ((result | 2) == 2)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "featureValueAtIndex:", a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

+ (id)dependentProviderWithProvider:(id)a3
{
  return (id)objc_msgSend(a1, "dependentProviderWithProvider:invertsRelevance:", a3, 0);
}

+ (id)dependentProviderWithProvider:(id)a3 invertsRelevance:(BOOL)a4
{
  void *v4;
  REConditionalRelevanceProvider *v5;

  +[REDependentRelevanceProvider _dependentConditionWithRelevanceProvider:invertsRelevance:](REDependentRelevanceProvider, "_dependentConditionWithRelevanceProvider:invertsRelevance:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REConditionalRelevanceProvider initWithRelevanceCondition:]([REConditionalRelevanceProvider alloc], "initWithRelevanceCondition:", v4);

  return v5;
}

@end
