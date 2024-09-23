@implementation NSArray(UIKitConvenienceAdditions)

- (id)_ui_firstObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_ui_onlyObject
{
  void *v2;

  if (objc_msgSend(a1, "count") == 1)
  {
    objc_msgSend(a1, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
