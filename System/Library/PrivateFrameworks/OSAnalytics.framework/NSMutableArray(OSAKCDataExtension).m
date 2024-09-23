@implementation NSMutableArray(OSAKCDataExtension)

- (id)pop
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (id)parent
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "count");
  if (v2 < 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2 - 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
