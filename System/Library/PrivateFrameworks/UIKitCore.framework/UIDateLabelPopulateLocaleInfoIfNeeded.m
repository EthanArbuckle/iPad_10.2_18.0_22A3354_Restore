@implementation UIDateLabelPopulateLocaleInfoIfNeeded

void ___UIDateLabelPopulateLocaleInfoIfNeeded_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _UIDateLabelUpdateLocaleInfo();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", 0x1E1761BC0, 0, 0, &__block_literal_global_115_0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UIDateLabelPopulateLocaleInfoIfNeeded_token;
  _UIDateLabelPopulateLocaleInfoIfNeeded_token = v0;

}

@end
