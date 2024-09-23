@implementation NSDictionary(REMDistributedEvaluationCollectionOptions)

- (uint64_t)remdes_BOOLForKey:()REMDistributedEvaluationCollectionOptions defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (uint64_t)remdes_nsuintegerForKey:()REMDistributedEvaluationCollectionOptions defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (double)remdes_doubleForKey:()REMDistributedEvaluationCollectionOptions defaultValue:
{
  void *v3;
  double v4;

  objc_msgSend(a1, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    a2 = v4;
  }

  return a2;
}

@end
