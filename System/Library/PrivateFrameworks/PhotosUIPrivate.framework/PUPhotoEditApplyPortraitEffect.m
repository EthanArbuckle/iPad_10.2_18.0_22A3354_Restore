@implementation PUPhotoEditApplyPortraitEffect

uint64_t __PUPhotoEditApplyPortraitEffect_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ppt_selectLightingEffect:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
