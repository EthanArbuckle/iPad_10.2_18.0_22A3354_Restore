@implementation PXSmartAlbumTitleCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 401);
  objc_msgSend(v3, "setStringValue:", &stru_1E5149688);
  objc_msgSend(v3, "setComparator:", 20);
  return v3;
}

@end
