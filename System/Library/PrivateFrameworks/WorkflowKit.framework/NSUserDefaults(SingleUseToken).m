@implementation NSUserDefaults(SingleUseToken)

- (void)setWorkflowIdentifier:()SingleUseToken forToken:
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "dictionaryForKey:", CFSTR("WFWorkflowSingleUseTokenMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");

  if (v9 | v8)
  {
    if (!v8)
      v8 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v9)
      objc_msgSend((id)v8, "setObject:forKeyedSubscript:", v9, v6);
    else
      objc_msgSend((id)v8, "removeObjectForKey:", v6);
    objc_msgSend(a1, "setObject:forKey:", v8, CFSTR("WFWorkflowSingleUseTokenMap"));

  }
}

- (id)workflowIdentifierConsumingSingleUseToken:()SingleUseToken
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "dictionaryForKey:", CFSTR("WFWorkflowSingleUseTokenMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(a1, "setWorkflowIdentifier:forToken:", 0, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
