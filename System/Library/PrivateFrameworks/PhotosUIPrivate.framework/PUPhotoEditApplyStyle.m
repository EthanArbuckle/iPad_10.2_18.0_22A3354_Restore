@implementation PUPhotoEditApplyStyle

uint64_t __PUPhotoEditApplyStyle_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ppt_selectStyle:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
