@implementation PGMoodSourceScore

- (double)weight
{
  return 1.0;
}

- (id)positiveVectorWithGraph:(id)a3
{
  return -[PGMoodVector initWithArray:]([PGMoodVector alloc], "initWithArray:", &unk_1E84EA0A8);
}

- (id)negativeVectorWithGraph:(id)a3
{
  return (id)objc_opt_new();
}

@end
