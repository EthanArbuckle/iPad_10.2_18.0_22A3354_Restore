@implementation EDColorsCollection

- (EDColorsCollection)initWithDefaultSetup:(BOOL)a3
{
  _BOOL4 v3;
  EDColorsCollection *v4;
  EDColorsCollection *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDColorsCollection;
  v4 = -[EDCollection init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mDefaultColorsCount = 0;
    if (v3)
      -[EDColorsCollection setupDefaults](v4, "setupDefaults");
  }
  return v5;
}

- (void)setupDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v3);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 0xFFFFFFLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v4);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 255);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v5);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 65280);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v6);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 16711680);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v7);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 0xFFFFLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v8);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 16711935);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v9);

  +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", 16776960);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection addObject:](self, "addObject:", v10);

  self->mDefaultColorsCount = -[EDCollection count](self, "count");
}

+ (BOOL)isSystemColorId:(unint64_t)a3
{
  return a3 > 0x3F && a3 - 80 < 0xFFFFFFFFFFFFFFFDLL;
}

+ (int)systemColorIdFromIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while ((unsigned __int16)systemColorArray[v3] != a3)
  {
    v3 += 4;
    if (v3 == 76)
      return 0;
  }
  return *(_DWORD *)&systemColorArray[v3 + 2];
}

- (void)addPalette:(const unsigned int *)a3 paletteSize:(unsigned int)a4 paletteX:(const unsigned int *)a5 paletteXSize:(unsigned int)a6
{
  uint64_t v6;
  uint64_t i;
  void *v10;
  uint64_t j;
  void *v12;

  v6 = *(_QWORD *)&a6;
  -[EDColorsCollection addColors:count:defaultColors:defaultCount:](self, "addColors:count:defaultColors:defaultCount:", a3, *(_QWORD *)&a4, -[EDColorsCollection defaultPalette](self, "defaultPalette"), 56);
  for (i = 64; i != 77; ++i)
  {
    +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", objc_msgSend((id)objc_opt_class(), "systemColorIdFromIndex:", i));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCollection addObject:](self, "addObject:", v10);

  }
  -[EDColorsCollection addColors:count:defaultColors:defaultCount:](self, "addColors:count:defaultColors:defaultCount:", a5, v6, &-[EDColorsCollection addPalette:paletteSize:paletteX:paletteXSize:]::defaultPaletteX, 3);
  for (j = 80; j != 82; ++j)
  {
    +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", objc_msgSend((id)objc_opt_class(), "systemColorIdFromIndex:", j));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCollection addObject:](self, "addObject:", v12);

  }
}

- (const)defaultPalette
{
  return (const unsigned int *)&-[EDColorsCollection defaultPalette]::defPalette;
}

- (void)addColors:(const unsigned int *)a3 count:(unsigned int)a4 defaultColors:(const unsigned int *)a5 defaultCount:(unsigned int)a6
{
  unsigned int v9;
  uint64_t v10;
  const unsigned int *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  BOOL v15;
  int v16;
  const unsigned int *v17;
  unsigned int v18;
  void *v19;

  if (a4 >= a6)
    v9 = a6;
  else
    v9 = a4;
  if (a3)
    v10 = v9;
  else
    v10 = a6;
  if (a3)
    v11 = a3;
  else
    v11 = a5;
  if ((_DWORD)v10)
  {
    v12 = v10;
    do
    {
      v13 = *v11++;
      +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDCollection addObject:](self, "addObject:", v14);

      --v12;
    }
    while (v12);
  }
  v15 = a6 >= v10;
  v16 = a6 - v10;
  if (v16 != 0 && v15)
  {
    v17 = &a5[v10];
    do
    {
      v18 = *v17++;
      +[OITSUColor colorWithBGRValue:](OITSUColor, "colorWithBGRValue:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDCollection addObject:](self, "addObject:", v19);

      --v16;
    }
    while (v16);
  }
}

- (unint64_t)addOrEquivalentColorExcludingDefaults:(id)a3
{
  id v4;
  OITSUColor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  OITSUColor *v13;
  unint64_t v14;
  unint64_t mDefaultColorsCount;
  void *v16;
  BOOL v17;

  v4 = a3;
  v5 = [OITSUColor alloc];
  objc_msgSend(v4, "redComponent");
  v7 = v6;
  objc_msgSend(v4, "greenComponent");
  v9 = v8;
  objc_msgSend(v4, "blueComponent");
  v11 = v10;
  objc_msgSend(v4, "alphaComponent");
  v13 = -[OITSUColor initWithRed:green:blue:alpha:](v5, "initWithRed:green:blue:alpha:", v7, v9, v11, v12);
  v14 = -[EDCollection count](self, "count");
  mDefaultColorsCount = self->mDefaultColorsCount;
  if (mDefaultColorsCount >= v14)
  {
LABEL_4:
    mDefaultColorsCount = -[EDCollection addObject:](self, "addObject:", v13);
  }
  else
  {
    while (1)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", mDefaultColorsCount);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[OITSUColor isEqual:](v13, "isEqual:", v16);

      if (v17)
        break;
      if (v14 == ++mDefaultColorsCount)
        goto LABEL_4;
    }
  }

  return mDefaultColorsCount;
}

+ (int)oadSchemeColorIdFromThemeIndex:(int)a3
{
  if (a3 > 0xC)
    return -1;
  else
    return dword_22A4C1F0C[a3];
}

- (unint64_t)defaultColorsCount
{
  return self->mDefaultColorsCount;
}

+ (unsigned)xlColorIndexFromTCSystemColorIDEnum:(int)a3
{
  uint64_t v3;

  v3 = 0;
  while (*(_DWORD *)&systemColorArray[v3 + 2] != a3)
  {
    v3 += 4;
    if (v3 == 76)
      return -1;
  }
  return (unsigned __int16)systemColorArray[v3];
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDColorsCollection;
  -[EDCollection description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
