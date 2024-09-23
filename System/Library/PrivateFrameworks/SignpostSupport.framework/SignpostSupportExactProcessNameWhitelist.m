@implementation SignpostSupportExactProcessNameWhitelist

- (BOOL)_wantsNotEqual
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 2;
}

- (BOOL)passesProcessName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[SignpostSupportExactProcessNameFilter processNameSet](self, "processNameSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

@end
