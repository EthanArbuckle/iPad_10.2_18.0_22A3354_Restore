@implementation VUIDebugMetricsTermCollector

- (NSArray)baseTerms
{
  return (NSArray *)&unk_1EA0BB910;
}

- (NSArray)metricsKitTerms
{
  return (NSArray *)&unk_1EA0BB928;
}

- (NSDictionary)primaryTerms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x1E0C80C00];
  -[VUIDebugMetricsTermCollector pageTerms](self, "pageTerms", CFSTR("page"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("click");
  -[VUIDebugMetricsTermCollector clickTerms](self, "clickTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("impressions");
  -[VUIDebugMetricsTermCollector impressionsTerms](self, "impressionsTerms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("media");
  -[VUIDebugMetricsTermCollector clickTerms](self, "clickTerms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("search");
  -[VUIDebugMetricsTermCollector searchTerms](self, "searchTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("enter");
  -[VUIDebugMetricsTermCollector enterTerms](self, "enterTerms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("exit");
  -[VUIDebugMetricsTermCollector exitTerms](self, "exitTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("account");
  -[VUIDebugMetricsTermCollector accountTerms](self, "accountTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("pageRender");
  -[VUIDebugMetricsTermCollector pageRenderTerms](self, "pageRenderTerms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)pageTerms
{
  return &unk_1EA0BB940;
}

- (id)dialogTerms
{
  return &unk_1EA0BB958;
}

- (id)clickTerms
{
  return &unk_1EA0BB970;
}

- (id)enterTerms
{
  return &unk_1EA0BB988;
}

- (id)exitTerms
{
  return &unk_1EA0BB9A0;
}

- (id)searchTerms
{
  return &unk_1EA0BB9B8;
}

- (id)accountTerms
{
  return &unk_1EA0BB9D0;
}

- (id)impressionsTerms
{
  return &unk_1EA0BB9E8;
}

- (id)pageRenderTerms
{
  return &unk_1EA0BBA00;
}

- (NSArray)filteredTerms
{
  return (NSArray *)&unk_1EA0BBA18;
}

@end
