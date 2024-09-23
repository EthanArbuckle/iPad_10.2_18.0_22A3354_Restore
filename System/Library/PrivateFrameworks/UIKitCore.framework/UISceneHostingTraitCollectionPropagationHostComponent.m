@implementation UISceneHostingTraitCollectionPropagationHostComponent

void __77___UISceneHostingTraitCollectionPropagationHostComponent_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTraitCollection:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

@end
