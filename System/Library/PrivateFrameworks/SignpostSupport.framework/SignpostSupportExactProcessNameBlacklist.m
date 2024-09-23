@implementation SignpostSupportExactProcessNameBlacklist

- (BOOL)_wantsNotEqual
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesProcessName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 1;
  v4 = a3;
  -[SignpostSupportExactProcessNameFilter processNameSet](self, "processNameSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

@end
