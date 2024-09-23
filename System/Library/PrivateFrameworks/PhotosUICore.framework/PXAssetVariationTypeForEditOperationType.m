@implementation PXAssetVariationTypeForEditOperationType

void __PXAssetVariationTypeForEditOperationType_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  _PXAssetEditOperationTypesByVariationType();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PXAssetVariationTypeForEditOperationType_block_invoke_2;
  v5[3] = &unk_1E51438F8;
  v6 = v0;
  v1 = v0;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)PXAssetVariationTypeForEditOperationType_variationTypesByEditOperationType;
  PXAssetVariationTypeForEditOperationType_variationTypesByEditOperationType = v2;

}

uint64_t __PXAssetVariationTypeForEditOperationType_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

@end
