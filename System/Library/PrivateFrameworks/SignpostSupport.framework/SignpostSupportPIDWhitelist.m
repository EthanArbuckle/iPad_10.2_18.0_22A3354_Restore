@implementation SignpostSupportPIDWhitelist

- (BOOL)_wantsNotEqual
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 2;
}

- (BOOL)passesPIDNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SignpostSupportPIDFilter pidSet](self, "pidSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

@end
