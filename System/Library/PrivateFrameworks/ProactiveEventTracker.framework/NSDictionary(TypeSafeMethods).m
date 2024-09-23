@implementation NSDictionary(TypeSafeMethods)

- (id)pet_dictForKey:()TypeSafeMethods
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pet_objectForKey:()TypeSafeMethods class:
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)pet_strForKey:()TypeSafeMethods
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pet_numForKey:()TypeSafeMethods
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pet_arrayForKey:()TypeSafeMethods
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
