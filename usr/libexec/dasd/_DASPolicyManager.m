@implementation _DASPolicyManager

+ (id)allPoliciesForPlatform
{
  +[_DASPolicyManager initializeAllPolicies](_DASPolicyManager, "initializeAllPolicies");
  return (id)qword_1001ABA68;
}

+ (void)initializeAllPolicies
{
  if (qword_1001ABA60 != -1)
    dispatch_once(&qword_1001ABA60, &stru_10015EA40);
}

+ (id)allPredictingPoliciesForPlatform
{
  +[_DASPolicyManager initializeAllPolicies](_DASPolicyManager, "initializeAllPolicies");
  return (id)qword_1001ABA80;
}

+ (unint64_t)bitmaskForPolicy:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABA78, "objectForKeyedSubscript:", a3));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return 1 << v4;
}

+ (id)policyForBitIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1001ABA70;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  return v5;
}

@end
