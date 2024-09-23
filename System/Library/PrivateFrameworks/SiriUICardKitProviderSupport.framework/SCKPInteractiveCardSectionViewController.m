@implementation SCKPInteractiveCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken != -1)
    dispatch_once(&cardSectionClasses_onceToken, &__block_literal_global_0);
  return (id)cardSectionClasses_cardSectionClasses;
}

void __62__SCKPInteractiveCardSectionViewController_cardSectionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cardSectionClasses_cardSectionClasses;
  cardSectionClasses_cardSectionClasses = v0;

}

- (void)_loadCardSectionView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCKPInteractiveCardSectionViewController;
  -[CRKCardSectionViewController _loadCardSectionView](&v4, sel__loadCardSectionView);
  -[SCKPInteractiveCardSectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterceptsTouches:", 0);

}

- (BOOL)_shouldRenderButtonOverlay
{
  return 0;
}

@end
