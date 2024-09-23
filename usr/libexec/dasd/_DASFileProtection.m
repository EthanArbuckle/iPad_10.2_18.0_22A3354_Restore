@implementation _DASFileProtection

- (unint64_t)asBiomeProtectionClass
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassA](_DASDataProtectionStateMonitor, "dataProtectionClassA"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassB](_DASDataProtectionStateMonitor, "dataProtectionClassB"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
    return 2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
    return 3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassD](_DASDataProtectionStateMonitor, "dataProtectionClassD"));
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
    return 4;
  else
    return 3;
}

@end
