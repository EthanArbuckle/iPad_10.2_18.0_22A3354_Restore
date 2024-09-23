@implementation NSDictionary(MTLManipulationAdditions_Deprecated)

- (id)mtl_dictionaryByRemovingEntriesWithKeys:()MTLManipulationAdditions_Deprecated
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mtl_dictionaryByRemovingValuesForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
