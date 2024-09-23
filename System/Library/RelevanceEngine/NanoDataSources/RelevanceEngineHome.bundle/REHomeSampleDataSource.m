@implementation REHomeSampleDataSource

+ (id)bundleIdentifier
{
  return REHomeBundleIdentifier;
}

- (id)supportedSections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE7D0B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a4;
  REHomeLocalizedString(CFSTR("UP_NEXT_SAMPLE_HOME_NAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REHomeLocalizedString(CFSTR("UP_NEXT_SAMPLE_HOME_SCENE_NAME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  REUISampleRelevanceProviderForSamplePosition();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  REHomeContent(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE7D080]);
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithIdentifier:content:action:relevanceProviders:", CFSTR("nanoHome.sample"), v8, 0, v10);

  v13 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v12);

}

@end
