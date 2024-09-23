@implementation PXMappingAudioAssetFetchResult

void __62___PXMappingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 40);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);

}

void __50___PXMappingAudioAssetFetchResult_containsObject___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = (void *)a1[4];
  (*(void (**)(void))(*(_QWORD *)(a1[5] + 16) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __52___PXMappingAudioAssetFetchResult_objectsAtIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

@end
