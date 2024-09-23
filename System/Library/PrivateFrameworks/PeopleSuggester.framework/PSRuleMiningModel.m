@implementation PSRuleMiningModel

uint64_t __101___PSRuleMiningModel_suggestionProxiesWithPredictionContext_photoSuggestedPeople_supportedBundleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "antecedent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "intersectSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "antecedent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "intersectSet:", *(_QWORD *)(a1 + 32));
  v11 = objc_msgSend(v8, "count");
  if (v11 < objc_msgSend(*(id *)(a1 + 40), "_PSRuleMiningModelRegularizingContextOverlapConstraint")
    || (v12 = objc_msgSend(v10, "count"),
        v12 < objc_msgSend(*(id *)(a1 + 40), "_PSRuleMiningModelRegularizingContextOverlapConstraint")))
  {
    v13 = objc_msgSend(v8, "count");
    if (v13 >= objc_msgSend(*(id *)(a1 + 40), "_PSRuleMiningModelRegularizingContextOverlapConstraint"))
    {
      v15 = -1;
      goto LABEL_8;
    }
    v14 = objc_msgSend(v10, "count");
    if (v14 >= objc_msgSend(*(id *)(a1 + 40), "_PSRuleMiningModelRegularizingContextOverlapConstraint"))
    {
      v15 = 1;
      goto LABEL_8;
    }
  }
  v15 = comparisonResult(v5, v6, *(void **)(a1 + 32));
LABEL_8:

  return v15;
}

@end
