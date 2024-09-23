@implementation VideosExtrasShelfCollectionViewLayout

uint64_t __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = result;
  if (*(_BYTE *)(result + 96))
    result = objc_msgSend(*(id *)(result + 32), "collectionView:layout:insetForSectionAtIndex:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), a2);
  else
    v3 = *(_QWORD *)(result + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 32) = v3;
  return result;
}

void __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  CGRect v15;

  v3 = a2;
  v14 = v3;
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:sizeForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *(double *)(a1 + 80);
    v7 = *(double *)(a1 + 88);
  }
  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(double *)(v9 + 32);
  v11 = *(double *)(v9 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v10, v11, v5, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, v14);

  v15.origin.x = v10;
  v15.origin.y = v11;
  v15.size.width = v5;
  v15.size.height = v7;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 32), v15);
  if (*(_BYTE *)(a1 + 105))
    objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:minimumInteritemSpacingForSectionAtIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(v14, "section"));
  else
    v13 = *(double *)(a1 + 96);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v5
                                                              + v13
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 32);

}

@end
