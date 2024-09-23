@implementation UIPasteboard

uint64_t __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 1, 0);
  return 0;
}

uint64_t __83__UIPasteboard_PhotosUICore__px_newPasteboardItemProviderForAsset_fileURL_utiType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

@end
