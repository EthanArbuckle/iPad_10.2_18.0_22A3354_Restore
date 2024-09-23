@implementation PUPhotosSharingViewControllerSpec

- (BOOL)maximizeImageHeightForBounds:(CGRect)a3
{
  return _isPhone() && (PLIsTallScreen() & 1) != 0;
}

- (double)interItemSpacing
{
  double v2;

  v2 = 30.0;
  if (_isPhone())
  {
    if (PLIsTallScreen())
      return 10.0;
    else
      return 15.0;
  }
  return v2;
}

- (double)interItemSpacingForWidth:(double)a3
{
  BOOL v3;
  double result;

  v3 = a3 > 375.0;
  result = 12.0;
  if (!v3)
    return 10.0;
  return result;
}

- (CGSize)selectionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  if (selectionBadgeSize_onceToken != -1)
    dispatch_once(&selectionBadgeSize_onceToken, &__block_literal_global_74162);
  v2 = *(double *)&selectionBadgeSize_selectionBadgeSize_0;
  v3 = *(double *)&selectionBadgeSize_selectionBadgeSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIOffset)selectionBadgeOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = 10.0;
  v3 = 10.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (unint64_t)selectionBadgeCorner
{
  return 8;
}

- (unint64_t)optionBadgeCorner
{
  return 1;
}

- (CGSize)optionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  if (optionBadgeSize_onceToken != -1)
    dispatch_once(&optionBadgeSize_onceToken, &__block_literal_global_2);
  v3 = *((double *)&optionBadgeSize__s_maxSize + 1);
  v2 = *(double *)&optionBadgeSize__s_maxSize;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)embedsActivityViewForBounds:(CGRect)a3 horizontalSizeClass:(int64_t)a4 verticalSizeClass:(int64_t)a5
{
  double height;
  double width;

  height = a3.size.height;
  width = a3.size.width;
  if (!_isPhone())
    return 1;
  if (height <= width)
    return 0;
  return PLIsTallScreen();
}

void __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void (**v3)(void *, uint64_t);
  _QWORD aBlock[4];
  id v5;

  optionBadgeSize__s_maxSize = *MEMORY[0x1E0C9D820];
  v0 = objc_alloc(MEMORY[0x1E0D7BB38]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setStyle:", 4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke_2;
  aBlock[3] = &unk_1E58A6A20;
  v5 = v1;
  v2 = v1;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v3[2](v3, 64);
  v3[2](v3, 8388672);
  v3[2](v3, 16777280);
  v3[2](v3, 10485824);
  v3[2](v3, 18874432);

}

uint64_t __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  PXAssetBadgeInfoCreateWithBadges();
  objc_msgSend(v2, "setBadgeInfo:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result = PXSizeMax();
  *(_QWORD *)&optionBadgeSize__s_maxSize = v4;
  *((_QWORD *)&optionBadgeSize__s_maxSize + 1) = v5;
  return result;
}

void __55__PUPhotosSharingViewControllerSpec_selectionBadgeSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  selectionBadgeSize_selectionBadgeSize_0 = v0;
  selectionBadgeSize_selectionBadgeSize_1 = v1;

}

@end
