@implementation IsAllCapsMeridiemIndicatorRegion

void __IsAllCapsMeridiemIndicatorRegion_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 0);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "hasPrefix:", CFSTR("en")))
    IsAllCapsMeridiemIndicatorRegion_isAllCapsLanguage = 1;

}

@end
