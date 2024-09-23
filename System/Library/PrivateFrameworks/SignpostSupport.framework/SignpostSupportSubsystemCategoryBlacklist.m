@implementation SignpostSupportSubsystemCategoryBlacklist

- (BOOL)_wantsNotSubsystem
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesSubsystem:(id)a3 category:(id)a4
{
  return !-[SignpostSupportSubsystemCategoryFilter matchesSubsystem:category:](self, "matchesSubsystem:category:", a3, a4);
}

- (void)_forceInclusionOfSubsystem:(id)a3 category:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
  else
  {
    objc_msgSend(v8, "removeObject:", v6);
  }

}

@end
