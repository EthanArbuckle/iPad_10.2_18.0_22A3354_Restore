@implementation MFTriageActionUtilities

+ (int64_t)triageActionForActionKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = sub_1001BB994();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return (int64_t)v7;
}

+ (id)actionKeyForTriageAction:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = sub_1001BB994();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeysForObject:", v6));

  if (objc_msgSend(v7, "count") == (id)1)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  else
    v8 = 0;

  return v8;
}

+ (BOOL)isActionDestructive:(int64_t)a3
{
  return a3 == 8;
}

@end
