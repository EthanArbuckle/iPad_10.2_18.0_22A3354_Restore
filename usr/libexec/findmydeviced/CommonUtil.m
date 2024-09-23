@implementation CommonUtil

+ (void)handleAlertAction:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sensitive")));

    v5 = objc_msgSend(v4, "BOOLValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "openSensitiveURL:withOptions:", v8, 0);
    else
      objc_msgSend(v6, "openURL:configuration:completionHandler:", v8, 0, &stru_1002C17B8);

  }
}

@end
