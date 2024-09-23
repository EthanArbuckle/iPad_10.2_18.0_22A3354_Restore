@implementation RESiriEngagementPredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  REFeatureSet *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature siriDomainFeature](REFeature, "siriDomainFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v4);

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RESiriEngagementPredictor;
  return -[REPredictor _init](&v3, sel__init);
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  NSString *lastSiriDomain;
  void *v8;
  double siriInfluence;

  lastSiriDomain = self->_lastSiriDomain;
  objc_msgSend(a4, "bundleIdentifier", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(lastSiriDomain) = -[NSString isEqualToString:](lastSiriDomain, "isEqualToString:", v8);

  siriInfluence = 0.0;
  if ((_DWORD)lastSiriDomain)
    siriInfluence = self->_siriInfluence;
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", siriInfluence);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)siriServer:(id)a3 receivedCompletedRequestDomain:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[REPredictor onQueue:](self, "onQueue:", v7);

}

void __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 72), *(id *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = 1065353216;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v7, 1800.0);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke_2;
  v15[3] = &unk_24CF8D0F0;
  objc_copyWeak(&v18, &location);
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  v17 = v11;
  +[REUpNextTimer timerWithFireInterval:atRate:queue:block:](REUpNextTimer, "timerWithFireInterval:atRate:queue:block:", v10, v9, v15, 60.0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 64);
  *(_QWORD *)(v13 + 64) = v12;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float *WeakRetained;

  WeakRetained = (float *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = v4;

    objc_msgSend(a1[4], "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;

    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v10 = REPercentThroughRange(v9, v5, v8) * -0.189999998 / 60.0;
    WeakRetained[20] = expf(v10) * 0.34;
    objc_msgSend(a1[5], "updateObservers");

  }
}

- (NSString)lastSiriDomain
{
  return self->_lastSiriDomain;
}

- (float)siriInfluence
{
  return self->_siriInfluence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSiriDomain, 0);
  objc_storeStrong((id *)&self->_siriDecayTimer, 0);
}

@end
