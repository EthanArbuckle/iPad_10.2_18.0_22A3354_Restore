@implementation SUICKPActivityIndicatorCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken_0 != -1)
    dispatch_once(&cardSectionClasses_onceToken_0, &__block_literal_global_0);
  return (id)cardSectionClasses_cardSectionClasses_0;
}

void __70__SUICKPActivityIndicatorCardSectionViewController_cardSectionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cardSectionClasses_cardSectionClasses_0;
  cardSectionClasses_cardSectionClasses_0 = v0;

}

- (BOOL)_isIndicatingActivity
{
  return 1;
}

- (BOOL)_shouldRenderButtonOverlay
{
  return 1;
}

- (BOOL)_expectsSearchUIView
{
  return 1;
}

@end
