@implementation NSDictionary(WebNSDictionaryExtras)

- (uint64_t)_webkit_numberForKey:()WebNSDictionaryExtras
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v1;
  else
    return 0;
}

- (uint64_t)_webkit_stringForKey:()WebNSDictionaryExtras
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v1;
  else
    return 0;
}

- (uint64_t)_webkit_arrayForKey:()WebNSDictionaryExtras
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v1;
  else
    return 0;
}

- (uint64_t)_webkit_objectForMIMEType:()WebNSDictionaryExtras
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a1, "objectForKey:");
  if (!result)
  {
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("/"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return objc_msgSend(a1, "objectForKey:", objc_msgSend(a3, "substringToIndex:", v6 + 1));
  }
  return result;
}

- (void)_webkit_BOOLForKey:()WebNSDictionaryExtras
{
  void *result;

  result = (void *)objc_msgSend(a1, "_webkit_numberForKey:");
  if (result)
    return (void *)objc_msgSend(result, "BOOLValue");
  return result;
}

@end
