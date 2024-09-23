@implementation NSArray(UIRemovalAdditions)

- (id)ui_arrayByRemovingLastObjectEqualTo:()UIRemovalAdditions
{
  CFIndex v5;
  CFIndex LastIndexOfValue;
  CFIndex v7;
  void *v8;
  CFRange v10;

  v5 = objc_msgSend(a1, "count");
  v10.location = 0;
  v10.length = v5;
  LastIndexOfValue = CFArrayGetLastIndexOfValue((CFArrayRef)a1, v10, a3);
  if (LastIndexOfValue == -1)
    return a1;
  v7 = LastIndexOfValue;
  v8 = (void *)objc_msgSend(a1, "subarrayWithRange:", 0, LastIndexOfValue);
  if (v5 != v7 + 1)
    v8 = (void *)objc_msgSend(v8, "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "subarrayWithRange:", v7 + 1, v5 - (v7 + 1)));
  if (!v8)
    return a1;
  else
    return v8;
}

@end
