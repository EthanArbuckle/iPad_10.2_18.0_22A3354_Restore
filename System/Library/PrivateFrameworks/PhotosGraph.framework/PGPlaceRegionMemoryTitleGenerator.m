@implementation PGPlaceRegionMemoryTitleGenerator

- (id)_placeTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  -[PGPlaceMemoryTitleGenerator placeNode](self, "placeNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Urban")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PGPlaceMemoryTitleFormatCity");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Beach")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PGPlaceMemoryTitleFormatBeach");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mountain")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PGPlaceMemoryTitleFormatMountain");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Nature")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PGPlaceMemoryTitleFormatNature");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Water")))
    {
      v7 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("PGPlaceMemoryTitleFormatWater");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v8;
}

@end
