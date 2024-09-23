@implementation SignpostSupportUniquePIDBlacklist

- (BOOL)_wantsNotEqual
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesUniquePIDNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SignpostSupportUniquePIDFilter uniquePidSet](self, "uniquePidSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

@end
