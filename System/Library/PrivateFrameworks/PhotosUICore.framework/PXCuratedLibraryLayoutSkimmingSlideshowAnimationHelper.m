@implementation PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper

uint64_t __170___PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[2];
  char v9;

  v9 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48) + 40 * a2;
  v6 = *(_OWORD *)(v4 + 56);
  v8[0] = *(_OWORD *)(v4 + 40);
  v8[1] = v6;
  result = objc_msgSend((id)v4, "_shoulAnimateSpriteWithInfo:matchingSectionIndexPath:spriteKind:", v5, v8, &v9);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

@end
