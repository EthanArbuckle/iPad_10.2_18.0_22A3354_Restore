@implementation UIFontPickerPersistToRecentsForSuite

void ___UIFontPickerPersistToRecentsForSuite_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  +[_UIFontPickerFontInfo infoWithName:](_UIFontPickerFontInfo, "infoWithName:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFontFamilyAvailable"))
  {
    objc_msgSend(v3, "familyName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "familyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

@end
