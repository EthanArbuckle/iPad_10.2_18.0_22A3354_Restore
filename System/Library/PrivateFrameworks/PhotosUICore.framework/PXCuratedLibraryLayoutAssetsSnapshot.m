@implementation PXCuratedLibraryLayoutAssetsSnapshot

void __64___PXCuratedLibraryLayoutAssetsSnapshot_dominantAssetIdentifier__block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = objc_msgSend(a3, "integerValue");
  v9 = v8;
  if (v8 < 0 || (v10 = a1[4], v8 >= *(_QWORD *)(v10 + 24)))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < _spriteSnapshotsCount"));

    v10 = a1[4];
  }
  if (*(_BYTE *)(*(_QWORD *)(v10 + 40) + 56 * v9 + 52))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __77___PXCuratedLibraryLayoutAssetsSnapshot_enumerateAssetIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a2 | 0x100000000;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_2;
  v10[3] = &unk_1E512EAB0;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "enumerateSpritesInRange:usingBlock:", v6, v10);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;

}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v12[0] = MEMORY[0x1E0C809B0];
  v10 = HIDWORD(a2);
  v12[1] = 3221225472;
  v12[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_5;
  v12[3] = &unk_1E512EB00;
  v15 = *(_QWORD *)(a1 + 48);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v11, "enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:", a4, a5, a6, v10, 0, v12);

}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_5(uint64_t a1, void *a2, unsigned int a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  float v8;
  double v9;
  __int128 v10;
  void *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  float v19;
  __int128 v20;
  char v21;
  __int16 v22;
  char v23;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = a2;
  LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v6);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(double *)(*(_QWORD *)(a1 + 56) + 48);
  v9 = *(double *)(*(_QWORD *)(a1 + 64) + 32 * a3 + 16) + v8;
  PXRectWithCenterAndSize();
  v10 = *(_OWORD *)(v7 + 160 * a3 + 4);
  v11 = *(void **)(a1 + 40);
  v12 = v9;
  v18[0] = v13;
  v18[1] = v14;
  v18[2] = v15;
  v18[3] = v16;
  v19 = v12;
  v20 = v10;
  v21 = (char)v5;
  v22 = 0;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "_addSpriteSnapshot:", v18));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, v6);

}

uint64_t __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _BYTE *a9)
{
  void *v10;
  uint64_t result;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_3;
  v12[3] = &unk_1E512EA88;
  v10 = *(void **)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(v10, "enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:", a4, a5, a6, HIDWORD(a2), 0, v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a9 = 1;
  return result;
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

@end
