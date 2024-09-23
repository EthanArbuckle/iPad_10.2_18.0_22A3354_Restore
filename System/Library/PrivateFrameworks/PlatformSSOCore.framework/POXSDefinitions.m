@implementation POXSDefinitions

+ (id)definitionForType:(Class)a3
{
  id v4;
  void *v5;

  if (definitionForType__predicate != -1)
  {
    dispatch_once(&definitionForType__predicate, &__block_literal_global_4);
    if (a3)
      goto LABEL_3;
LABEL_10:
    v5 = 0;
    return v5;
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  v4 = (id)definitionForType__definitions;
  objc_sync_enter(v4);
  objc_msgSend((id)definitionForType__definitions, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_257367730))
    {
      -[objc_class definition](a3, "definition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend((id)definitionForType__definitions, "setObject:forKey:", v5, a3);
    }
    else
    {
      v5 = 0;
    }
  }
  objc_sync_exit(v4);

  return v5;
}

void __37__POXSDefinitions_definitionForType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  v1 = (void *)definitionForType__definitions;
  definitionForType__definitions = v0;

}

@end
