@implementation SFUIShareSheetActivityCellSpec

+ (id)titleLabelFontTextStyleForIdiom:(int64_t)a3
{
  id *v3;

  v3 = (id *)MEMORY[0x24BEBE1F0];
  if (a3 != 6)
    v3 = (id *)MEMORY[0x24BEBE1E8];
  return *v3;
}

+ (double)nearbyAirDropBadgeSizeForIdiom:(int64_t)a3
{
  return 24.0;
}

+ (double)peopleIconWidth
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 6)
    return 52.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (v6 >= 414.0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v4 = 62.0;
    else
      v4 = 66.0;
  }
  else
  {
    v4 = 62.0;
  }

  return v4;
}

+ (double)appIconWidth
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 6)
    return 52.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (v6 >= 414.0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v4 = 60.0;
    else
      v4 = 64.0;
  }
  else
  {
    v4 = 60.0;
  }

  return v4;
}

+ (double)transportIconWidth
{
  void *v2;
  uint64_t v3;
  double result;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 20.0;
  if (v3 == 6)
    return 24.0;
  return result;
}

+ (id)subtitleLabelColorForIdiom:(int64_t)a3
{
  if (a3 == 6)
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
