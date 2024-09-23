@implementation NSArray(MTLManipulationAdditions)

- (id)mtl_arrayByRemovingObject:()MTLManipulationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  return v5;
}

- (id)mtl_arrayByRemovingFirstObject
{
  id v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "subarrayWithRange:", 1, objc_msgSend(a1, "count") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)mtl_arrayByRemovingLastObject
{
  id v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, objc_msgSend(a1, "count") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

@end
