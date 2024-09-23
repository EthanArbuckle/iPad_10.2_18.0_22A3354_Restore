@implementation PUINumberingSystemTypeSortArray

uint64_t __PUINumberingSystemTypeSortArray_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  +[PUINumberingSystem numberingSystemForType:](PUINumberingSystem, "numberingSystemForType:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUINumberingSystem numberingSystemForType:](PUINumberingSystem, "numberingSystemForType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "localizedCompare:", v8);
  return v9;
}

@end
