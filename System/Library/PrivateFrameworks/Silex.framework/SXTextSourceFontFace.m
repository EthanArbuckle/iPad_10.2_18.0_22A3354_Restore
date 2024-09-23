@implementation SXTextSourceFontFace

+ (id)fontFaceWithFontName:(id)a3 andAttributes:(id)a4
{
  NSString *v5;
  SXFontAttributes *v6;
  SXTextSourceFontFace *v7;
  NSString *fontName;
  NSString *v9;
  SXFontAttributes *fontAttributes;

  v5 = (NSString *)a3;
  v6 = (SXFontAttributes *)a4;
  v7 = objc_alloc_init(SXTextSourceFontFace);
  fontName = v7->_fontName;
  v7->_fontName = v5;
  v9 = v5;

  fontAttributes = v7->_fontAttributes;
  v7->_fontAttributes = v6;

  return v7;
}

+ (id)fontFaceWithFontName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "basicFontAttributesForFontName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXTextSourceFontFace fontFaceWithFontName:andAttributes:](SXTextSourceFontFace, "fontFaceWithFontName:andAttributes:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)basicFontAttributesForFontName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", a3, 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "symbolicTraits") & 1;

    objc_msgSend(v4, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "symbolicTraits") & 2) != 0)
      v8 = 700;
    else
      v8 = 400;

    objc_msgSend(v4, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXTextSourceFontAttributes attributesWithFamilyName:style:weight:](SXTextSourceFontAttributes, "attributesWithFamilyName:style:weight:", v9, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)fontDescriptorAttributes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v24[0] = *MEMORY[0x24BDF7750];
  -[SXTextSourceFontFace fontName](self, "fontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v24[1] = *MEMORY[0x24BDF7770];
  v22[0] = *MEMORY[0x24BDF78A0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SXTextSourceFontFace fontAttributes](self, "fontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "weight");
  if (v6 <= 499)
  {
    if (v6 > 299)
    {
      if (v6 != 300)
      {
LABEL_15:
        v7 = (double *)MEMORY[0x24BDF7888];
        goto LABEL_21;
      }
      v7 = (double *)MEMORY[0x24BDF7878];
    }
    else
    {
      if (v6 != 100)
      {
        if (v6 == 200)
        {
          v7 = (double *)MEMORY[0x24BDF78A8];
          goto LABEL_21;
        }
        goto LABEL_15;
      }
      v7 = (double *)MEMORY[0x24BDF7898];
    }
  }
  else if (v6 <= 699)
  {
    if (v6 != 500)
    {
      if (v6 == 600)
      {
        v7 = (double *)MEMORY[0x24BDF7890];
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    v7 = (double *)MEMORY[0x24BDF7880];
  }
  else
  {
    switch(v6)
    {
      case 700:
        v7 = (double *)MEMORY[0x24BDF7868];
        break;
      case 800:
        v7 = (double *)MEMORY[0x24BDF7870];
        break;
      case 900:
        v7 = (double *)MEMORY[0x24BDF7860];
        break;
      default:
        goto LABEL_15;
    }
  }
LABEL_21:
  objc_msgSend(v4, "numberWithDouble:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v22[1] = *MEMORY[0x24BDF78B0];
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[SXTextSourceFontFace fontAttributes](self, "fontAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "width");
  if (v11 <= 499)
  {
    if (v11 > 299)
    {
      if (v11 != 300)
      {
LABEL_35:
        v12 = (double *)MEMORY[0x24BDF7888];
        goto LABEL_41;
      }
      v12 = (double *)MEMORY[0x24BDF7878];
    }
    else
    {
      if (v11 != 100)
      {
        if (v11 == 200)
        {
          v12 = (double *)MEMORY[0x24BDF78A8];
          goto LABEL_41;
        }
        goto LABEL_35;
      }
      v12 = (double *)MEMORY[0x24BDF7898];
    }
  }
  else if (v11 <= 699)
  {
    if (v11 != 500)
    {
      if (v11 == 600)
      {
        v12 = (double *)MEMORY[0x24BDF7890];
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    v12 = (double *)MEMORY[0x24BDF7880];
  }
  else
  {
    switch(v11)
    {
      case 700:
        v12 = (double *)MEMORY[0x24BDF7868];
        break;
      case 800:
        v12 = (double *)MEMORY[0x24BDF7870];
        break;
      case 900:
        v12 = (double *)MEMORY[0x24BDF7860];
        break;
      default:
        goto LABEL_35;
    }
  }
LABEL_41:
  objc_msgSend(v9, "numberWithDouble:", *v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  v22[2] = *MEMORY[0x24BDF7788];
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SXTextSourceFontFace fontAttributes](self, "fontAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "style");
  v17 = 0.06944444;
  if ((unint64_t)(v16 - 1) >= 2)
    v17 = 0.0;
  objc_msgSend(v14, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v20;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (SXFontAttributes)fontAttributes
{
  return self->_fontAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end
