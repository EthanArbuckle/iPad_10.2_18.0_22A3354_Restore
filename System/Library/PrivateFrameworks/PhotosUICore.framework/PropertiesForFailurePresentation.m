@implementation PropertiesForFailurePresentation

void ___PropertiesForFailurePresentation_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  PXAlertAction *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a2;
  v9 = -[PXAlertAction initWithTitle:style:action:]([PXAlertAction alloc], "initWithTitle:style:action:", v8, a3, v7);

  objc_msgSend(v6, "addObject:", v9);
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_4()
{
  return +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 4, 0);
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_3()
{
  return +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 4, 0);
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_2()
{
  return +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 10, 0);
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_258()
{
  return +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 9, 0);
}

@end
