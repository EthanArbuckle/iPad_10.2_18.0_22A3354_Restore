@implementation PMLPlanSerialization

+ (id)planFromData:(id)a3 withStore:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = CFSTR("TRAINING_STORE");
  v13[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "planFromData:withArgs:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)planFromData:(id)a3 store:(id)a4 trainingNetworkPath:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("TRAINING_STORE");
  v15[1] = CFSTR("PML_ESPRESSO_TRAINING_NETWORK_PATH");
  v16[0] = a4;
  v16[1] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "planFromData:withArgs:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)planFromData:(id)a3 withArgs:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  PMLReadChunkData((uint64_t)v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "plan");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)serializePlan:(id)a3
{
  id v3;
  PMLPlanWrapper *v4;
  void *v5;

  v3 = a3;
  v4 = -[PMLPlanWrapper initWithPlan:]([PMLPlanWrapper alloc], "initWithPlan:", v3);

  PMLBuildChunkFile(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
