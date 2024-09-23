@implementation PXSmartAlbumDateCapturedCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D732E8]);
  objc_msgSend(v3, "setKey:", 200);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateValue:", v4);

  objc_msgSend(v3, "setComparator:", 1);
  return v3;
}

@end
