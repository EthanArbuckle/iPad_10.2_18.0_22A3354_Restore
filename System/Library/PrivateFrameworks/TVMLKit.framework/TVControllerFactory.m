@implementation TVControllerFactory

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shelfControllerForElement:existingController:", a2, a3);
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gridControllerForElement:existingController:", a2, a3);
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_listControllerForElement:existingController:", a2, a3);
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_textFieldControllerForElement:existingController:", a2, a3);
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_carouselControllerForElement:layout:existingController:", a2, a3, a4);
}

_TVRotatingViewController *__51___TVControllerFactory__registerControllerCreators__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _TVRotatingViewController *v9;
  _TVRotatingViewController *v10;

  v4 = a2;
  v5 = a3;
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_viewFromElement:existingView:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (_TVRotatingViewController *)v5;
  else
    v9 = objc_alloc_init(_TVRotatingViewController);
  v10 = v9;
  -[_TVRotatingViewController setView:](v9, "setView:", v8);
  -[NSObject tv_setAssociatedIKViewElement:](v10, "tv_setAssociatedIKViewElement:", v4);

  return v10;
}

@end
