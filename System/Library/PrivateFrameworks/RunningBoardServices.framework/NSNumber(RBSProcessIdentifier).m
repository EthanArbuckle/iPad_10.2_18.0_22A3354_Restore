@implementation NSNumber(RBSProcessIdentifier)

- (uint64_t)rbs_pid
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "intValue");
  if ((int)result < 0)
    return 0xFFFFFFFFLL;
  else
    return result;
}

- (BOOL)matchesProcess:()RBSProcessIdentifier
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a1) = objc_msgSend(a1, "rbs_pid");
  v5 = objc_msgSend(v4, "rbs_pid");

  return (_DWORD)a1 == v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", a1);
}

@end
