@implementation PSFamilyMLModel

_PSFamilyFeatureExtractor *__30___PSFamilyMLModel_commonInit__block_invoke(uint64_t a1)
{
  return -[_PSFamilyFeatureExtractor initWithActivity:]([_PSFamilyFeatureExtractor alloc], "initWithActivity:", *(_QWORD *)(a1 + 32));
}

uint64_t __68___PSFamilyMLModel_familiesPredictionForContacts_withMaxSuggestion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(a2, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  if (v8 >= v9)
  {
    objc_msgSend(v5, "doubleValue");
    v12 = v11;
    objc_msgSend(v6, "doubleValue");
    if (v12 <= v13)
      v10 = 0;
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

@end
