@implementation RBSProcessBKSLegacyPredicate

- (BOOL)matchesProcess:(id)a3
{
  return objc_msgSend(a3, "isReported");
}

+ (id)legacyPredicateMatchingBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[RBSProcessBKSLegacyPredicate legacyPredicate](RBSProcessBKSLegacyPredicate, "legacyPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  +[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[RBSProcessPredicate predicateMatchingPredicates:](RBSProcessPredicate, "predicateMatchingPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)legacyPredicate
{
  if (legacyPredicate_onceToken != -1)
    dispatch_once(&legacyPredicate_onceToken, &__block_literal_global_4);
  return (id)legacyPredicate___LegacyPredicate;
}

+ (id)legacyPredicateMatchingProcessIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[RBSProcessBKSLegacyPredicate legacyPredicate](RBSProcessBKSLegacyPredicate, "legacyPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[RBSProcessPredicate predicateMatchingPredicates:](RBSProcessPredicate, "predicateMatchingPredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__RBSProcessBKSLegacyPredicate_legacyPredicate__block_invoke()
{
  RBSProcessBKSLegacyPredicate *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(RBSProcessBKSLegacyPredicate);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  +[RBSProcessPredicate predicateMatchingEuid:](RBSProcessPredicate, "predicateMatchingEuid:", geteuid());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessPredicate predicateMatchingPredicates:](RBSProcessPredicate, "predicateMatchingPredicates:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)legacyPredicate___LegacyPredicate;
  legacyPredicate___LegacyPredicate = v4;

}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

@end
