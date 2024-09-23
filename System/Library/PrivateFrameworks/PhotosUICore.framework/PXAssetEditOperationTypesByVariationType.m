@implementation PXAssetEditOperationTypesByVariationType

void ___PXAssetEditOperationTypesByVariationType_block_invoke()
{
  id v0;
  id v1;
  void (**v2)(void *, _QWORD);
  uint64_t v3;
  void *v4;
  _QWORD aBlock[4];
  id v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___PXAssetEditOperationTypesByVariationType_block_invoke_2;
  aBlock[3] = &unk_1E51438B0;
  v6 = v0;
  v1 = v0;
  v2 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v2[2](v2, 0);
  v2[2](v2, 1);
  v2[2](v2, 2);
  v2[2](v2, 3);
  v3 = objc_msgSend(v1, "copy");
  v4 = (void *)_PXAssetEditOperationTypesByVariationType_editOperationTypesByVariationType;
  _PXAssetEditOperationTypesByVariationType_editOperationTypesByVariationType = v3;

}

void ___PXAssetEditOperationTypesByVariationType_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("PXAssetEditOperation.Variation"), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

@end
