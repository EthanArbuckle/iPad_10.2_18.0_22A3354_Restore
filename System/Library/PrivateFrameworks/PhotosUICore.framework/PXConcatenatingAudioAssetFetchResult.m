@implementation PXConcatenatingAudioAssetFetchResult

void __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  v7 = (void *)MEMORY[0x1A85CE17C]();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E5137418;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  objc_autoreleasePoolPop(v7);
}

uint64_t __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  **(_BYTE **)(a1 + 48) = *a4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __58___PXConcatenatingAudioAssetFetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __62___PXConcatenatingAudioAssetFetchResult_initWithFetchResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") > 0;
}

@end
