@implementation SAMetrics

- (id)_descriptionHint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[SAMetrics timings](self, "timings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __45__SAMetrics_PrettyPrinting___descriptionHint__block_invoke;
    v11 = &unk_1E4C81BF0;
    v12 = v3;
    objc_msgSend(v4, "sortedArrayUsingComparator:", &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = CFSTR("timings");
    v13[1] = CFSTR("eventInformation");
    v14[0] = v5;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2, v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __45__SAMetrics_PrettyPrinting___descriptionHint__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Metrics");
}

+ (id)metrics
{
  return objc_alloc_init((Class)a1);
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (NSString)category
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("category"));
}

- (void)setCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("category"), a3);
}

- (NSDictionary)eventInformation
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eventInformation"));
}

- (void)setEventInformation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eventInformation"), a3);
}

- (NSString)originalCommandId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalCommandId"));
}

- (void)setOriginalCommandId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalCommandId"), a3);
}

- (NSString)speechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechId"));
}

- (void)setSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechId"), a3);
}

- (NSDictionary)timings
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timings"));
}

- (void)setTimings:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timings"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
