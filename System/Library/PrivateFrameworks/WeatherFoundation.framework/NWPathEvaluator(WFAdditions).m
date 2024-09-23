@implementation NWPathEvaluator(WFAdditions)

+ (id)wf_pathEvaluatorForURL:()WFAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "port");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("80");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend(MEMORY[0x24BDE07D0], "endpointWithHostname:port:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE07E8]), "initWithEndpoint:parameters:", v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)wf_isReachable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "status");

  return (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

@end
