@implementation PKPaper

+ (id)defaultGenericPaperForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (+[PKPaper defaultGenericPaperForLocale:]::onceToken != -1)
    dispatch_once(&+[PKPaper defaultGenericPaperForLocale:]::onceToken, &__block_literal_global_8);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && objc_msgSend((id)+[PKPaper defaultGenericPaperForLocale:]::_letterCountries, "containsObject:", v6))
  {
    objc_msgSend(a1, "genericLetterPaper");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "genericA4Paper");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

void __40__PKPaper_defaultGenericPaperForLocale___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("US"), CFSTR("CA"), CFSTR("MX"), CFSTR("CR"), CFSTR("PH"), CFSTR("CL"), CFSTR("CO"), 0);
  v1 = (void *)+[PKPaper defaultGenericPaperForLocale:]::_letterCountries;
  +[PKPaper defaultGenericPaperForLocale:]::_letterCountries = v0;

}

+ (BOOL)useMetric
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (id)mediaNameForWidth:(int)a3 Height:(int)a4 mediaType:(id)a5 Borderless:(BOOL)a6 Simplex:(BOOL)a7
{
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  void *v13;
  char v15[144];
  uint64_t v16;

  v7 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v8 = a7;
    v9 = a6;
    v10 = *(_QWORD *)&a4;
    v11 = pwgMediaForSize(*(const char **)&a3, *(uint64_t *)&a4, v15);
    v12 = "";
    if (v8)
      v12 = "-simplex";
    if (v9)
      v12 = "-fullbleed";
    if (v11 && *(_QWORD *)v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s"), *(_QWORD *)v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media-%dx%d%s"), v7, v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("roll-%dx0"), *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

+ (id)paperWithAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  double v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  unsigned int v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-size"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("x-dimension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-type"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("y-dimension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
  }
  else
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("y-dimension"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    v10 = v12;
  }
  v13 = v12;

  v14 = 0;
  if ((int)v6 >= 1 && (int)v13 >= v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-left-margin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-top-margin"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-right-margin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1;
    v20 = objc_msgSend(v18, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("media-bottom-margin"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    if ((isKindOfClass & 1) != 0)
    {
      v23 = objc_msgSend(v19, "useMetric");
      v24 = (double)(int)v6;
      v25 = "";
      if (!(v30 | v17 | v20 | v22))
        v25 = "-fullbleed";
      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("roll_anon_%.1fx0mm%s"), v24 / 100.0, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 0x24E6BF000;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("roll_anon_%.2fx0in%s"), v24 / 2540.0, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 0x24E6BF000uLL;
      }
    }
    else
    {
      v27 = 0x24E6BF000uLL;
      +[PKPaper mediaNameForWidth:Height:mediaType:Borderless:Simplex:](PKPaper, "mediaNameForWidth:Height:mediaType:Borderless:Simplex:", v6, v13, v31, (v30 | v17 | v20 | v22) == 0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v26;
    v14 = (void *)objc_msgSend(objc_alloc(*(Class *)(v27 + 1952)), "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", v6, v13, v30, v17, v20, v22, 0, v26, v4);

  }
  return v14;
}

- (unint64_t)topMarginInPoints
{
  return (unint64_t)((double)-[PKPaper topMargin](self, "topMargin") * 72.0 / 2540.0);
}

- (unint64_t)bottomMarginInPoints
{
  return (unint64_t)((double)-[PKPaper bottomMargin](self, "bottomMargin") * 72.0 / 2540.0);
}

- (unint64_t)minCutLength
{
  return (unint64_t)((double)-[PKPaper minHeight](self, "minHeight") * 72.0 / 2540.0);
}

- (unint64_t)maxCutLength
{
  return (unint64_t)((double)-[PKPaper maxHeight](self, "maxHeight") * 72.0 / 2540.0);
}

- (id)cutToLength:(double)a3
{
  uint64_t v3;

  LODWORD(v3) = llround(a3 * 2540.0 / 72.0);
  return -[PKPaper cutToPWGLength:](self, "cutToPWGLength:", v3);
}

- (id)cutToPWGLength:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  PKPaper *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PKPaper *v16;

  v3 = *(_QWORD *)&a3;
  v5 = -[PKPaper topMargin](self, "topMargin");
  v6 = -[PKPaper bottomMargin](self, "bottomMargin");
  if (-[PKPaper minHeight](self, "minHeight") <= (int)v3)
  {
    if (-[PKPaper maxHeight](self, "maxHeight") < (int)v3)
      v3 = -[PKPaper maxHeight](self, "maxHeight");
  }
  else
  {
    v7 = -[PKPaper minHeight](self, "minHeight") - v3;
    v8 = -[PKPaper topMargin](self, "topMargin");
    v9 = -[PKPaper bottomMargin](self, "bottomMargin");
    v3 = -[PKPaper minHeight](self, "minHeight");
    v6 = (v6 + (v8 + v7 - v9) / 2);
    v5 = (v7 + v5 - (v8 + v7 - v9) / 2);
  }
  if (!-[PKPaper isRoll](self, "isRoll"))
    return 0;
  v10 = [PKPaper alloc];
  v11 = -[PKPaper width](self, "width");
  v12 = -[PKPaper leftMargin](self, "leftMargin");
  v13 = -[PKPaper rightMargin](self, "rightMargin");
  -[PKPaper name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaper mediaInfo](self, "mediaInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:](v10, "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", v11, v3, v12, v5, v13, v6, 0, v14, v15);

  return v16;
}

- (PKPaper)initWithWidth:(int)a3 Height:(int)a4 Left:(int)a5 Top:(int)a6 Right:(int)a7 Bottom:(int)a8 localizedName:(id)a9 codeName:(id)a10 mediaInfo:(id)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  PKPaper *v19;
  PKPaper *v20;
  NSDictionary *v21;
  void *mediaInfo;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *v30;
  id v32;
  objc_super v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[2];
  _QWORD v37[4];

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v37[2] = *MEMORY[0x24BDAC8D0];
  v32 = a10;
  v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)PKPaper;
  v19 = -[PKPaper init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_width = v16;
    v19->_height = v15;
    v19->_leftMargin = v14;
    v19->_topMargin = v13;
    v19->_rightMargin = v12;
    v19->_bottomMargin = v11;
    objc_storeStrong((id *)&v19->_name, a10);
    if (v18)
    {
      v21 = (NSDictionary *)v18;
      mediaInfo = v20->_mediaInfo;
      v20->_mediaInfo = v21;
    }
    else
    {
      v36[0] = CFSTR("x-dimension");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v23;
      v36[1] = CFSTR("y-dimension");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      mediaInfo = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = mediaInfo;
      v34[0] = CFSTR("media-size");
      v34[1] = CFSTR("media-left-margin");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v25;
      v34[2] = CFSTR("media-top-margin");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v26;
      v34[3] = CFSTR("media-right-margin");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v27;
      v34[4] = CFSTR("media-bottom-margin");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v20->_mediaInfo;
      v20->_mediaInfo = (NSDictionary *)v29;

    }
  }

  return v20;
}

- (CGSize)paperSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[PKPaper width](self, "width") * 72.0 / 2540.0;
  v4 = (double)-[PKPaper height](self, "height") * 72.0 / 2540.0;
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGRect)imageableAreaRect
{
  double v3;
  double v4;
  int v5;
  int v6;
  double v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = (double)-[PKPaper leftMargin](self, "leftMargin") * 72.0 / 2540.0;
  v4 = (double)-[PKPaper topMargin](self, "topMargin") * 72.0 / 2540.0;
  v5 = -[PKPaper width](self, "width");
  v6 = -[PKPaper leftMargin](self, "leftMargin");
  v7 = (double)(v5 - (v6 + -[PKPaper rightMargin](self, "rightMargin"))) * 72.0 / 2540.0;
  v8 = -[PKPaper height](self, "height");
  v9 = -[PKPaper topMargin](self, "topMargin");
  v10 = (double)(v8 - (v9 + -[PKPaper bottomMargin](self, "bottomMargin"))) * 72.0 / 2540.0;
  v11 = v3;
  v12 = v4;
  v13 = v7;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)imageableArea
{
  int v3;
  int v4;
  double v5;
  int v6;
  int v7;

  v3 = -[PKPaper width](self, "width");
  v4 = -[PKPaper leftMargin](self, "leftMargin");
  v5 = (double)(v3 - (v4 + -[PKPaper rightMargin](self, "rightMargin"))) * 72.0 / 2540.0;
  v6 = -[PKPaper height](self, "height");
  v7 = -[PKPaper topMargin](self, "topMargin");
  return v5 * ((double)(v6 - (v7 + -[PKPaper bottomMargin](self, "bottomMargin"))) * 72.0 / 2540.0);
}

- (BOOL)isBorderless
{
  return !-[PKPaper leftMargin](self, "leftMargin")
      && !-[PKPaper rightMargin](self, "rightMargin")
      && !-[PKPaper topMargin](self, "topMargin")
      && -[PKPaper bottomMargin](self, "bottomMargin") == 0;
}

- (id)nameWithoutSuffixes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id *v13;
  uint64_t v14;

  v4 = a3;
  -[PKPaper name](self, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  v13 = (id *)&v14;
  if (v6)
  {
    v8 = v6;
    while (!objc_msgSend(v5, "hasSuffix:", v8))
    {
      v9 = v13++;
      v10 = *v9;

      v8 = v10;
      if (!v10)
        goto LABEL_7;
    }
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v8, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
LABEL_7:
    v11 = v5;
  }

  return v11;
}

- (id)baseName
{
  PKPaper *v2;
  uint64_t v3;
  NSString *cachedBaseName;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedBaseName)
  {
    -[PKPaper nameWithoutSuffixes:](v2, "nameWithoutSuffixes:", CFSTR("-fullbleed"), CFSTR("-simplex"), CFSTR("-transverse"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    cachedBaseName = v2->_cachedBaseName;
    v2->_cachedBaseName = (NSString *)v3;

  }
  objc_sync_exit(v2);

  return v2->_cachedBaseName;
}

- (int)minHeight
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (double)-[PKPaper height](self, "height");
  -[PKPaper mediaInfo](self, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaper mediaInfo](self, "mediaInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("media-size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("y-dimension"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v3 = (double)(int)objc_msgSend(v8, "intValue");

  }
  return (int)v3;
}

- (int)maxHeight
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (double)-[PKPaper height](self, "height");
  -[PKPaper mediaInfo](self, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaper mediaInfo](self, "mediaInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("media-size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("y-dimension"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v3 = (double)(int)objc_msgSend(v8, "intValue");

  }
  return (int)v3;
}

- (BOOL)isRoll
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  -[PKPaper mediaInfo](self, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("media-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y-dimension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)mediaType
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[PKPaper mediaInfo](self, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("media-type"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24E6CFEB0;
  v5 = v4;

  return v5;
}

- (NSString)mediaTypeName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;

  -[PKPaper mediaInfo](self, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("media-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("MediaTypeNames"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v6 && !-[__CFString isEqualToString:](v6, "isEqualToString:", v4))
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
  }
  -[PKPaper mediaInfo](self, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_vendor_media-type"));
  v8 = objc_claimAutoreleasedReturnValue();

  v6 = (__CFString *)v8;
  if (!v8)
  {
LABEL_8:

    v6 = &stru_24E6CFEB0;
    goto LABEL_9;
  }
LABEL_7:
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", v4))
    goto LABEL_8;
LABEL_9:

  return (NSString *)v6;
}

- (void)addToMediaCol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PKPaper mediaInfo](self, "mediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__PKPaper_addToMediaCol___block_invoke;
  v7[3] = &unk_24E6CD648;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __25__PKPaper_addToMediaCol___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (id)createMediaColAndDoMargins:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  +[PKMediaSize mediaSizeWithWidth:height:](PKMediaSize, "mediaSizeWithWidth:height:", -[PKPaper width](self, "width"), -[PKPaper height](self, "height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaSize:", v6);

  -[PKPaper mediaInfo](self, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKPaper addToMediaCol:](self, "addToMediaCol:", v5);
  }
  else if (v3)
  {
    objc_msgSend(v5, "setMarginsTop:left:bottom:right:", -[PKPaper topMargin](self, "topMargin"), -[PKPaper leftMargin](self, "leftMargin"), -[PKPaper bottomMargin](self, "bottomMargin"), -[PKPaper rightMargin](self, "rightMargin"));
  }
  return v5;
}

- (id)localizedNameFromDimensions
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  const __CFString *v8;
  double v9;
  void *v10;
  int v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;

  -[PKPaper baseName](self, "baseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKMediaName pkMediaNameWithString:](PKMediaName, "pkMediaNameWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unitStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("in"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    v8 = CFSTR("%@ x %@ inches");
    v9 = 2540.0;
  }
  else
  {
    objc_msgSend(v4, "unitStr");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("mm"));

    v12 = v11 == 0;
    if (v11)
      v9 = 100.0;
    else
      v9 = 1.0;
    v7 = v11 == 0;
    if (v12)
      v8 = 0;
    else
      v8 = CFSTR("%@ x %@ mm");
  }
  if (-[PKPaper isRoll](self, "isRoll"))
  {
    v13 = (double)-[PKPaper width](self, "width") / v9;
    v14 = (double)-[PKPaper height](self, "height") / v9;
    if (!v7)
      goto LABEL_11;
LABEL_14:
    v23 = 0;
LABEL_15:
    -[PKPaper baseName](self, "baseName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    goto LABEL_16;
  }
  objc_msgSend(v4, "widthInUnits");
  v13 = v24;
  objc_msgSend(v4, "heightInUnits");
  v14 = v25;
  if (v7)
    goto LABEL_14;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v8, v8, CFSTR("PaperNames"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v19, "setMaximumFractionDigits:", 1);
  objc_msgSend(v19, "stringFromNumber:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromNumber:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@ %@"), 0, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v16;
  if (!v22)
    goto LABEL_15;
LABEL_16:

  return v22;
}

- (BOOL)isEqualSizeAndMediaType:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4
    && (v5 = -[PKPaper height](self, "height"), v5 == objc_msgSend(v4, "height"))
    && (v6 = -[PKPaper width](self, "width"), v6 == objc_msgSend(v4, "width")))
  {
    -[PKPaper mediaType](self, "mediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualSize:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  if (v4 && (v5 = -[PKPaper height](self, "height"), v5 == objc_msgSend(v4, "height")))
  {
    v6 = -[PKPaper width](self, "width");
    v7 = v6 == objc_msgSend(v4, "width");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)sizeAndImageableCompare:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  _BOOL8 v14;
  int64_t v15;

  v4 = a3;
  v5 = -[PKPaper width](self, "width");
  v6 = objc_msgSend(v4, "width");
  v7 = v5 - v6;
  if (v5 == v6)
  {
    v8 = -[PKPaper height](self, "height");
    v9 = objc_msgSend(v4, "height");
    v7 = v8 - v9;
    if (v8 == v9)
    {
      -[PKPaper imageableArea](self, "imageableArea");
      v11 = v10;
      objc_msgSend(v4, "imageableArea");
      v7 = (int)(v11 - v12);
    }
  }
  v13 = v7 < 0;
  v14 = v7 != 0;
  if (v13)
    v15 = -1;
  else
    v15 = v14;

  return v15;
}

- (int64_t)sizeMediaTypeAndImageableCompare:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;

  v4 = a3;
  v5 = -[PKPaper width](self, "width");
  v6 = objc_msgSend(v4, "width");
  v7 = v5 - v6;
  if (v5 == v6)
  {
    v8 = -[PKPaper height](self, "height");
    v9 = objc_msgSend(v4, "height");
    v7 = v8 - v9;
    if (v8 == v9)
    {
      -[PKPaper mediaType](self, "mediaType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v11);

      if (!v7)
      {
        -[PKPaper imageableArea](self, "imageableArea");
        v13 = v12;
        objc_msgSend(v4, "imageableArea");
        v7 = (int)(v13 - v14);
      }
    }
  }
  if (v7 < 0)
    v15 = -1;
  else
    v15 = v7 != 0;

  return v15;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaper baseName](self, "baseName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, CFSTR("."), CFSTR("PaperNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR(".")))
  {
    -[PKPaper localizedNameFromDimensions](self, "localizedNameFromDimensions");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return (NSString *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PKPaper;
  -[PKPaper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaper name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@ }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;

  -[PKPaper imageableAreaRect](self, "imageableAreaRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[PKPaper name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKPaper width](self, "width");
  v14 = -[PKPaper height](self, "height");
  -[PKPaper mediaType](self, "mediaType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ width = %.2f height = %.2f imageableAreaRect origin = (%.2f, %.2f), size = (%.2f, %.2f) media-type=%@"), v12, (double)v13 * 72.0 / 2540.0, (double)v14 * 72.0 / 2540.0, v4, v6, v8, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

+ (id)genericA4Paper
{
  return genericSize(CFSTR("iso_a4_210x297mm"), 21000, 29700, 1411);
}

+ (id)genericLetterPaper
{
  return genericSize(CFSTR("na_letter_8.5x11in"), 21590, 27940, 1411);
}

+ (id)genericLegalPaper
{
  return genericSize(CFSTR("na_legal_8.5x14in"), 21590, 35560, 1411);
}

+ (id)generic3_5x5Paper
{
  return -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", 8890, 12700, 0, 0, 0, 0, 0, CFSTR("oe_photo-l_3.5x5in"), 0);
}

+ (id)generic4x6Paper
{
  return -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", 10160, 15240, 0, 0, 0, 0, 0, CFSTR("na_index-4x6_4x6in"), 0);
}

+ (id)genericA6Paper
{
  return -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", 10500, 14800, 0, 0, 0, 0, 0, CFSTR("iso_a6_105x148mm"), 0);
}

+ (id)genericHagakiPaper
{
  return -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", 10000, 14800, 0, 0, 0, 0, 0, CFSTR("jpn_hagaki_100x148mm"), 0);
}

+ (id)genericPRC32KPaper
{
  return -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", 9700, 15100, 0, 0, 0, 0, 0, CFSTR("prc_32k_97x151mm"), 0);
}

+ (id)genericWithName:(id)a3
{
  NSString *v3;
  NSString *v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  char v12[144];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (NSString *)a3;
  v4 = v3;
  if (v3 && (v5 = pwgMediaForPWG(v3, v12)) != 0)
  {
    v6 = *((unsigned int *)v5 + 6);
    v7 = *((unsigned int *)v5 + 7);
    if ((int)v6 <= 20319 || (int)v7 <= 20319)
      v9 = 635;
    else
      v9 = 1411;
    genericSize(v4, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)genericBorderlessWithName:(id)a3
{
  id v3;
  void *v4;
  PKPaper *v5;
  char v7[144];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (PKPaper *)pwgMediaForPWG(v3, v7);
    if (v5)
      v5 = -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", v5->_width, v5->_height, 0, 0, 0, 0, 0, v4, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)willAdjustMarginsForDuplexMode:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("one-sided")) ^ 1;
}

- (PKPaper)paperWithMarginsAdjustedForDuplexMode:(id)a3
{
  id v4;
  PKPaper *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  PKPaper *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  v5 = self;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("one-sided")) & 1) == 0)
  {
    v6 = -[PKPaper topMargin](v5, "topMargin");
    v7 = -[PKPaper bottomMargin](v5, "bottomMargin");
    v8 = -[PKPaper leftMargin](v5, "leftMargin");
    if (v8 <= -[PKPaper rightMargin](v5, "rightMargin"))
      v9 = -[PKPaper rightMargin](v5, "rightMargin");
    else
      v9 = -[PKPaper leftMargin](v5, "leftMargin");
    v10 = v9;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("two-sided-short-edge")))
    {
      v11 = -[PKPaper topMargin](v5, "topMargin");
      if (v11 <= -[PKPaper bottomMargin](v5, "bottomMargin"))
        v12 = -[PKPaper bottomMargin](v5, "bottomMargin");
      else
        v12 = -[PKPaper topMargin](v5, "topMargin");
      v6 = v12;
      v7 = v12;
    }
    v13 = [PKPaper alloc];
    v14 = -[PKPaper width](v5, "width");
    v15 = -[PKPaper height](v5, "height");
    -[PKPaper localizedName](v5, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaper name](v5, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:](v13, "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", v14, v15, v10, v6, v10, v7, v16, v17, 0);

    v5 = (PKPaper *)v18;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaper *v4;
  PKPaper *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PKPaper *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PKPaper name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaper name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKPaper name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)photoPapers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x24BDBCE30];
  +[PKPaper genericA6Paper](PKPaper, "genericA6Paper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper generic4x6Paper](PKPaper, "generic4x6Paper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper generic3_5x5Paper](PKPaper, "generic3_5x5Paper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericPRC32KPaper](PKPaper, "genericPRC32KPaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericHagakiPaper](PKPaper, "genericHagakiPaper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericBorderlessWithName:](PKPaper, "genericBorderlessWithName:", CFSTR("na_5x7_5x7in"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericBorderlessWithName:](PKPaper, "genericBorderlessWithName:", CFSTR("na_govt-letter_8x10in"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericBorderlessWithName:](PKPaper, "genericBorderlessWithName:", CFSTR("om_small-photo_100x150mm"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericBorderlessWithName:](PKPaper, "genericBorderlessWithName:", CFSTR("om_large-photo_200x300"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)documentPapers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  +[PKPaper genericA4Paper](PKPaper, "genericA4Paper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericLetterPaper](PKPaper, "genericLetterPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mediaNameForWidth:(int)a3 height:(int)a4 borderless:(BOOL)a5 simplex:(BOOL)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  char *v10;
  const char *v11;
  void *v12;
  char v14[144];
  uint64_t v15;

  v6 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = a6;
    v8 = a5;
    v9 = *(_QWORD *)&a4;
    v10 = pwgMediaForSize(*(const char **)&a3, *(uint64_t *)&a4, v14);
    v11 = "";
    if (v7)
      v11 = "-simplex";
    if (v8)
      v11 = "-fullbleed";
    if (v10 && *(_QWORD *)v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s"), *(_QWORD *)v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media-%dx%d%s"), v6, v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("roll-%dx0"), *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (NSDictionary)mediaInfo
{
  return self->_mediaInfo;
}

- (id)name
{
  return self->_name;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)leftMargin
{
  return self->_leftMargin;
}

- (int)topMargin
{
  return self->_topMargin;
}

- (int)rightMargin
{
  return self->_rightMargin;
}

- (int)bottomMargin
{
  return self->_bottomMargin;
}

- (PKPaper)initWithCoder:(id)a3
{
  id v4;
  PKPaper *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *mediaInfo;
  objc_super v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaper;
  v5 = -[PKPaper init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_width"));
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_height"));
    v5->_leftMargin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_leftMargin"));
    v5->_topMargin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_topMargin"));
    v5->_rightMargin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_rightMargin"));
    v5->_bottomMargin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_bottomMargin"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_mediaInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_width, CFSTR("_width"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_height, CFSTR("_height"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_leftMargin, CFSTR("_leftMargin"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_topMargin, CFSTR("_topMargin"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rightMargin, CFSTR("_rightMargin"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_bottomMargin, CFSTR("_bottomMargin"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaInfo, CFSTR("_mediaInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userCodableDictionary
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__PKPaper_userCodableDictionary__block_invoke;
  v6[3] = &unk_24E6CD670;
  v4 = v3;
  v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __32__PKPaper_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = v8;
  if (*a5)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

  }
}

- (PKPaper)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKPaper *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaper;
  v5 = -[PKPaper init](&v9, sel_init);
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__PKPaper_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_24E6CD670;
    v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);

  }
  return v5;
}

void __41__PKPaper_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  void (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *a5;
    *a5 = (void *)v10;

  }
}

- (void)visitProperties:(Visitor *)a3
{
  void *v5;
  uint64_t v6;
  NSDictionary **p_mediaInfo;
  NSDictionary *mediaInfo;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("name"), &self->_name);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("width"), &self->_width);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("height"), &self->_height);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("leftMargin"), &self->_leftMargin);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("topMargin"), &self->_topMargin);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("rightMargin"), &self->_rightMargin);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("bottomMargin"), &self->_bottomMargin);
  v25 = (id)objc_opt_new();
  v24 = (id)objc_opt_new();
  -[PKPaper mediaInfo](self, "mediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __27__PKPaper_visitProperties___block_invoke;
  v21[3] = &unk_24E6CD698;
  v22 = v25;
  v23 = v24;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v21);

  (*((void (**)(Visitor *, const __CFString *, id *))a3->var0 + 12))(a3, CFSTR("_strMediaInfo"), &v25);
  (*((void (**)(Visitor *, const __CFString *, id *))a3->var0 + 18))(a3, CFSTR("_numMediaInfo"), &v24);
  mediaInfo = self->_mediaInfo;
  p_mediaInfo = &self->_mediaInfo;
  v9 = (void *)-[NSDictionary mutableCopy](mediaInfo, "mutableCopy");
  v10 = v25;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __27__PKPaper_visitProperties___block_invoke_139;
  v19[3] = &unk_24E6CD6C0;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
  v12 = (void *)objc_opt_new();
  v13 = v24;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __27__PKPaper_visitProperties___block_invoke_2;
  v16[3] = &unk_24E6CD6E8;
  v14 = v11;
  v17 = v14;
  v15 = v12;
  v18 = v15;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (objc_msgSend(v15, "count") == 2)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("media-size"));
  objc_storeStrong((id *)p_mediaInfo, v9);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);

}

void __27__PKPaper_visitProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v7, "setObject:forKeyedSubscript:", v6, v5);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id *)(a1 + 40);
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("media-size"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v6;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("x-dimension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, CFSTR("media-size:x-dimension"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("y-dimension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, CFSTR("media-size:y-dimension"));

  }
  else
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_220F9A000, v11, OS_LOG_TYPE_DEFAULT, "Unknown mediaInfo type for %@", (uint8_t *)&v12, 0xCu);
    }

  }
LABEL_6:

}

uint64_t __27__PKPaper_visitProperties___block_invoke_139(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __27__PKPaper_visitProperties___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("media-size:")) & 1) != 0)
  {
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("media-size:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_cachedBaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
