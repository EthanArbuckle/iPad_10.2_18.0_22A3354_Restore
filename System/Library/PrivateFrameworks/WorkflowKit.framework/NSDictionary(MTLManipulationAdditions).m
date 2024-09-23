@implementation NSDictionary(MTLManipulationAdditions)

- (id)mtl_dictionaryByAddingEntriesFromDictionary:()MTLManipulationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  return v5;
}

- (id)mtl_dictionaryByRemovingValuesForKeys:()MTLManipulationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

  return v5;
}

@end
