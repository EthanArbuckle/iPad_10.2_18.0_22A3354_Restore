@implementation NSString(RWINSStringExtras)

- (id)rwi_macAddressForBonjourServiceName
{
  void *v1;
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("@"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsString:", CFSTR(":"));

    v4 = 0;
    if (v3)
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
