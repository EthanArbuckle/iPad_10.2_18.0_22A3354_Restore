@implementation SAUIAssistantUtteranceView(SiriVOX)

- (id)svx_parseableExpression
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "svx_isDeferredExpressionContextObject");

    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BE81920]);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAceId:", v7);

      objc_msgSend(a1, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "setContext:", v8);
      objc_msgSend(a1, "speakableText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExpressionString:", v9);

      return v5;
    }
  }
  else
  {

  }
  v10 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(a1, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[SAUIAssistantUtteranceView(SiriVOX) svx_parseableExpression]";
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s Don't know how to generate a parseable expression for context object: %@", (uint8_t *)&v14, 0x16u);

  }
  v5 = 0;
  return v5;
}

- (void)svx_applyParsedExpression:()SiriVOX
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "parseableExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v9, "parsedOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setSpeakableText:", v8);

  }
}

@end
