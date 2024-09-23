@implementation NSDictionary

- (id)objectForKey:(id)a3 checkingKindOfClass:(Class)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

@end
