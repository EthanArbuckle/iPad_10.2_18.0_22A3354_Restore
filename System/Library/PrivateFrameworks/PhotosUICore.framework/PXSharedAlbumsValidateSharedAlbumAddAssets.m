@implementation PXSharedAlbumsValidateSharedAlbumAddAssets

void __PXSharedAlbumsValidateSharedAlbumAddAssets_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __PXSharedAlbumsValidateSharedAlbumAddAssets_block_invoke_2;
    v5[3] = &unk_1E5148CE0;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    PXSharedAlbumsPresentSpatialMediaDataLossAlertIfNeededForAssets(v6, v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __PXSharedAlbumsValidateSharedAlbumAddAssets_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
