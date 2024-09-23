@implementation HKRPOxygenSaturationOnboardingManagerDataSource

id __79___HKRPOxygenSaturationOnboardingManagerDataSource_featureAvailabilityProvider__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
    v4 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v5 = objc_msgSend(v4, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E48], v3);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v2;
}

id __76___HKRPOxygenSaturationOnboardingManagerDataSource_oxygenSaturationSettings__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    +[HKRPOxygenSaturationSettings standardSettings](HKRPOxygenSaturationSettings, "standardSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v2;
}

id __67___HKRPOxygenSaturationOnboardingManagerDataSource_onboardingCache__block_invoke(uint64_t a1)
{
  void *v2;
  HKRPOxygenSaturationOnboardingCache *v3;
  void *v4;
  HKRPUserDefaultsSyncProvider *v5;
  HKRPUserDefaultsSyncProvider *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = [HKRPOxygenSaturationOnboardingCache alloc];
    objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [HKRPUserDefaultsSyncProvider alloc];
    v6 = -[HKRPUserDefaultsSyncProvider initWithUserDefaultsDomain:](v5, "initWithUserDefaultsDomain:", *MEMORY[0x24BDD36F0]);
    v7 = -[HKRPOxygenSaturationOnboardingCache initWithUserDefaults:userDefaultsSyncProvider:](v3, "initWithUserDefaults:userDefaultsSyncProvider:", v4, v6);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v2;
}

id __76___HKRPOxygenSaturationOnboardingManagerDataSource_mobileCountryCodeManager__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    HKPreferredRegulatoryDomainProvider();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return v2;
}

@end
