@implementation PHMemoryChangeRequest

id __115__PHMemoryChangeRequest_PhotosUICore__px_creationRequestForAssetCollection_displayTitleInfo_people_ignoreCuration___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1[4], a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

@end
