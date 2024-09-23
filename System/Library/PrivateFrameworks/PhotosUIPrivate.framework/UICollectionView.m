@implementation UICollectionView

uint64_t __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
