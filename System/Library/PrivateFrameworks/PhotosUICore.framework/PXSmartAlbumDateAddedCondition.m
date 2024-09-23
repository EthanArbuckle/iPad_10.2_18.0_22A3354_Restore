@implementation PXSmartAlbumDateAddedCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 201);
  objc_msgSend(v3, "setIntegerValue:", 30);
  objc_msgSend(v3, "setComparator:", 40);
  objc_msgSend(v3, "setUnit:", 1);
  return v3;
}

@end
