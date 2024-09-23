@implementation NSDictionary(PVAdditions)

+ (id)objectForKey:()PVAdditions inDictionary:orInDefaultDictionary:
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
