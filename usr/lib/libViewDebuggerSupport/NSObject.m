@implementation NSObject

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  void *v3;
  __CFDictionary *v5;

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("inspectedDebugDescription"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v5 = Mutable;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v7;
  void *v8;

  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("inspectedDebugDescription")))
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugDescription"));
  else
    v8 = 0;

  return v8;
}

@end
