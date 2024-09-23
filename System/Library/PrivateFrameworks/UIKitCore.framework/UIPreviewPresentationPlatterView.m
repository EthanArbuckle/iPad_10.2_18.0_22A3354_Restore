@implementation UIPreviewPresentationPlatterView

void __51___UIPreviewPresentationPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "contentTransformView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

@end
