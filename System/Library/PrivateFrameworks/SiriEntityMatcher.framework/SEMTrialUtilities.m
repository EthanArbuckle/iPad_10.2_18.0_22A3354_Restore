@implementation SEMTrialUtilities

+ (BOOL)getBoolTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5
{
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  objc_msgSend_levelForFactor_withNamespaceName_(a3, a2, (uint64_t)a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_BOOLeanValue(v5, v6, v7);

  return v8;
}

+ (int64_t)getLongTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5
{
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_levelForFactor_withNamespaceName_(a3, a2, (uint64_t)a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_longValue(v5, v6, v7);

  return v8;
}

@end
