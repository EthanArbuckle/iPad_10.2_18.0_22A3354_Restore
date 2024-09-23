@implementation SBHDefaultIconGridSizeClassEditingAnimationStrengths

void ___SBHDefaultIconGridSizeClassEditingAnimationStrengths_block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "gridSizeForGridSizeClass:", v8);
  v4 = 1.0;
  if (v8
    && *(_BYTE *)(a1 + 56)
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsGridSizeClass:", v8))
      v4 = 0.5;
    else
      v4 = 1.0;
  }
  v5 = SBHIconListLayoutDefaultEditingAnimationStrengthForGridSize(v3);
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 * v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v8);

}

@end
