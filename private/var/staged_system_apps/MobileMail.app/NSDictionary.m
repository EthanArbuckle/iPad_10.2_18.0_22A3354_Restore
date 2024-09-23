@implementation NSDictionary

- (NSString)mf_testName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("testName"));
}

- (BOOL)mf_isAMSTest
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary mf_testName](self, "mf_testName"));
  v3 = objc_msgSend(v2, "containsString:", CFSTR("AMS"));

  return v3;
}

- (NSString)mf_mailboxName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("mailboxName"));
}

- (int)mf_iterations
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("iterations")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)mf_pages
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("pages")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)mf_maxScrollLength
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("maxScrollLength")));

  if (!v3)
    return 10000;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("maxScrollLength")));
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

- (int)mf_scrollOffset
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("offset")));
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int64_t)mf_testInterfaceOrientation
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary mf_testName](self, "mf_testName"));
  if (objc_msgSend(v2, "mf_containsSubstring:", CFSTR("Landscape")))
    v3 = 3;
  else
    v3 = 1;

  return v3;
}

@end
