@implementation PSContentFeatures

id __63___PSContentFeatures_utiTypesFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D020D0]);
  +[_PSContentFeatures preservePrivacyUTIMapping:](_PSContentFeatures, "preservePrivacyUTIMapping:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, v3, 0, 0);

  return v4;
}

id __64___PSContentFeatures_sourceAppFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0D020D0]);
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContentFeatures preservePrivacySourceBundleID:](_PSContentFeatures, "preservePrivacySourceBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, v4, 0, 0);

  return v5;
}

id __82___PSContentFeatures_numberOfContentFromPredictionContext_contentType_candidates___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0D020D0]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v4 >= 0xA)
    v5 = 10;
  else
    v5 = v4;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", v6, 0, 0, 0, 0);

  return v7;
}

id __72___PSContentFeatures_urlTopLevelDomainFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D020D0]);
  +[_PSContentFeatures preservePrivacyTopLevelDomain:](_PSContentFeatures, "preservePrivacyTopLevelDomain:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, v3, 0, 0);

  return v4;
}

@end
