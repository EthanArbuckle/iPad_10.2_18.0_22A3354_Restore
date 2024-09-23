@implementation NSLayoutConstraint

- (void)_baselineLoweringInfoForFirstItem:(void *)result
{
  void *v2;
  id v3;
  void *v4;
  id AssociatedObject;

  if (!result)
    return result;
  v2 = result;
  if (!a2)
  {
    if (objc_msgSend(result, "secondAttribute") - 11 < 2)
    {
      AssociatedObject = objc_getAssociatedObject(v2, &unk_1ECD790BC);
      if (objc_msgSend(AssociatedObject, "count") == 2)
        return (void *)objc_msgSend(AssociatedObject, "objectAtIndexedSubscript:", 1);
    }
    return 0;
  }
  if (objc_msgSend(result, "firstAttribute") - 11 >= 2)
    return 0;
  v3 = objc_getAssociatedObject(v2, &unk_1ECD790BC);
  result = (void *)objc_msgSend(v3, "count");
  if (result)
  {
    v4 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    if (objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
      return 0;
    else
      return v4;
  }
  return result;
}

@end
