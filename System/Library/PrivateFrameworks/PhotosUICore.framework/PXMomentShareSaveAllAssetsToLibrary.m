@implementation PXMomentShareSaveAllAssetsToLibrary

uint64_t __PXMomentShareSaveAllAssetsToLibrary_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __PXMomentShareSaveAllAssetsToLibrary_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3928];
  v3 = a2;
  objc_msgSend(v2, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

}

@end
