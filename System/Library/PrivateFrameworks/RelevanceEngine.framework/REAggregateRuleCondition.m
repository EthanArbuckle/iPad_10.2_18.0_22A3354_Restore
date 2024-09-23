@implementation REAggregateRuleCondition

uint64_t __74___REAggregateRuleCondition__acceptsFeatureMap_predictionSet_explanation___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  id v13;

  v3 = a1[4];
  v4 = a1[5];
  v13 = 0;
  v5 = objc_msgSend(a2, "_acceptsFeatureMap:predictionSet:explanation:", v3, v4, &v13);
  v6 = v13;
  if ((_DWORD)v5)
  {
    v7 = *(id **)(*(_QWORD *)(a1[6] + 8) + 24);
    if (v7)
    {
      v8 = *v7;
      v9 = v8;
      if (v8)
        v10 = v6 == 0;
      else
        v10 = 1;
      if (v10)
      {
        if (!v8)
          v8 = v6;
        v11 = objc_retainAutorelease(v8);
      }
      else
      {
        objc_msgSend(v8, "explanationByCombiningWithExplanation:", v6);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      **(_QWORD **)(*(_QWORD *)(a1[6] + 8) + 24) = v11;

    }
  }

  return v5;
}

@end
