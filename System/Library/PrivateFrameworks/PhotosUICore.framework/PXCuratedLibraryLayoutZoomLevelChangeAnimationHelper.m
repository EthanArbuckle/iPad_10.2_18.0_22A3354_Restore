@implementation PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper

void __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2[1];
  *a3 = *a2;
  a3[1] = v4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          v11 = a3[1];
          v13[0] = *a3;
          v13[1] = v11;
          objc_msgSend(v10, "indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:", v13, 0, 0);
        }
        else
        {
          v14 = 0u;
          v15 = 0u;
        }
        v12 = v15;
        *a3 = v14;
        a3[1] = v12;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void *__115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
    return (void *)objc_msgSend(result, "visualPositionAfterRevertingChangesFromIndex:", a2);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

void __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3(uint64_t a1@<X0>, _OWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2[1];
  *a3 = *a2;
  a3[1] = v4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if (v10)
        {
          v11 = a3[1];
          v13[0] = *a3;
          v13[1] = v11;
          objc_msgSend(v10, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:", v13, 0, 0);
        }
        else
        {
          v14 = 0u;
          v15 = 0u;
        }
        v12 = v15;
        *a3 = v14;
        a3[1] = v12;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void *__115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
    return (void *)objc_msgSend(result, "visualPositionAfterApplyingChangesToIndex:", a2);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

uint64_t __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5(uint64_t a1)
{
  CGRect v3;
  CGRect v4;

  objc_msgSend(*(id *)(a1 + 32), "headerRect");
  CGRectGetMinY(v3);
  objc_msgSend(*(id *)(a1 + 32), "sectionRect");
  CGRectGetMinY(v4);
  return PXFloatApproximatelyEqualToFloat() ^ 1;
}

uint64_t __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_6(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 1 && ((a2 ^ (a2 >> 2) & 1) & 1) != 0)
    a2 ^= 5uLL;
  return a2;
}

double __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_7(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v1 = a1;
  objc_msgSend(v1, "sectionRect");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(v1, "keyAssetRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  if (!CGRectIsNull(v19))
  {
    v20.origin.x = v11;
    v20.origin.y = v13;
    v20.size.width = v15;
    v20.size.height = v17;
    CGRectGetMaxY(v20);
    v21.origin.x = v3;
    v21.origin.y = v5;
    v21.size.width = v7;
    v21.size.height = v9;
    CGRectGetMaxY(v21);
  }
  return v3;
}

double __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_8(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double MidX;
  double v13;
  double v14;
  double v15;
  double v16;

  MidX = CGRectGetMidX(*(CGRect *)&a3);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (a1 >= a2)
    CGRectGetMinY(*(CGRect *)&v13);
  else
    CGRectGetMaxY(*(CGRect *)&v13);
  return MidX;
}

uint64_t __168___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke()
{
  return PXGSectionedSpriteTagDecompose();
}

@end
