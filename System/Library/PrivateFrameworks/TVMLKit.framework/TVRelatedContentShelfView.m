@implementation TVRelatedContentShelfView

uint64_t __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "setAlpha:", 1.0);
}

uint64_t __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
