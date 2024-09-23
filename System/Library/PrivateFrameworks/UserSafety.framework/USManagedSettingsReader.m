@implementation USManagedSettingsReader

+ (id)currentScanningPolicy
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "userSafety");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanningPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)currentInterventionType
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "currentScanningPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interventionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)subscribeForScanningPolicyChanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE63ED8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63F28], "publisherForGroups:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__USManagedSettingsReader_subscribeForScanningPolicyChanges___block_invoke;
  v9[3] = &unk_251B15EA0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "sinkWithReceiveInput:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __61__USManagedSettingsReader_subscribeForScanningPolicyChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a2, "containsObject:", *MEMORY[0x24BE63ED8]))
  {
    v6 = (id)objc_opt_new();
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "userSafety");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scanningPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  }
}

@end
