@implementation UIFocusEnvironmentPreferenceCache

uint64_t __82___UIFocusEnvironmentPreferenceCache_preferredEnvironmentsForEnvironment_isFinal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment");
}

_UIFocusEnvironmentPreferenceCacheNode *__78___UIFocusEnvironmentPreferenceCache_setPreferredEnvironments_forEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _UIFocusEnvironmentPreferenceCacheNode *v5;
  void *v6;

  v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "environmentsMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (_UIFocusEnvironmentPreferenceCacheNode *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v5 = -[_UIFocusEnvironmentPreferenceCacheNode initWithEnvironment:]([_UIFocusEnvironmentPreferenceCacheNode alloc], "initWithEnvironment:", v3);
      objc_msgSend(*(id *)(a1 + 40), "environmentsMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v3);

    }
  }

  return v5;
}

@end
