@implementation SXSystemFontFace

- (SXSystemFontFace)initWithMetadata:(id)a3
{
  id v4;
  SXSystemFontFace *v5;
  uint64_t v6;
  NSString *fontName;
  uint64_t v8;
  SXFontAttributes *fontAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXSystemFontFace;
  v5 = -[SXSystemFontFace init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ps"));
    v6 = objc_claimAutoreleasedReturnValue();
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v6;

    -[SXSystemFontFace fontAttributesForMetadata:](v5, "fontAttributesForMetadata:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    fontAttributes = v5->_fontAttributes;
    v5->_fontAttributes = (SXFontAttributes *)v8;

  }
  return v5;
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
  double v12;
  double *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v25[0] = *MEMORY[0x24BDF7750];
  -[SXSystemFontFace fontName](self, "fontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  v25[1] = *MEMORY[0x24BDF7770];
  v23[0] = *MEMORY[0x24BDF78A0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SXSystemFontFace fontAttributes](self, "fontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "weight");
  if (v6 <= 499)
  {
    if (v6 > 299)
    {
      if (v6 == 300)
      {
        v7 = (double *)MEMORY[0x24BDF7878];
        goto LABEL_21;
      }
    }
    else
    {
      if (v6 == 100)
      {
        v7 = (double *)MEMORY[0x24BDF7898];
        goto LABEL_21;
      }
      if (v6 == 200)
      {
        v7 = (double *)MEMORY[0x24BDF78A8];
        goto LABEL_21;
      }
    }
LABEL_15:
    v7 = (double *)MEMORY[0x24BDF7888];
    goto LABEL_21;
  }
  if (v6 <= 699)
  {
    if (v6 == 500)
    {
      v7 = (double *)MEMORY[0x24BDF7880];
      goto LABEL_21;
    }
    if (v6 == 600)
    {
      v7 = (double *)MEMORY[0x24BDF7890];
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if (v6 == 700)
  {
    v7 = (double *)MEMORY[0x24BDF7868];
    goto LABEL_21;
  }
  if (v6 == 800)
  {
    v7 = (double *)MEMORY[0x24BDF7870];
    goto LABEL_21;
  }
  if (v6 != 900)
    goto LABEL_15;
  v7 = (double *)MEMORY[0x24BDF7860];
LABEL_21:
  objc_msgSend(v4, "numberWithDouble:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v23[1] = *MEMORY[0x24BDF78B0];
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[SXSystemFontFace fontAttributes](self, "fontAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "width");
  v12 = 0.4;
  switch(v11)
  {
    case 0:
      v13 = (double *)MEMORY[0x24BDC4ED8];
      goto LABEL_32;
    case 1:
    case 2:
      v13 = (double *)MEMORY[0x24BDC4EA0];
      goto LABEL_32;
    case 3:
      v13 = (double *)MEMORY[0x24BDC4E88];
      goto LABEL_32;
    case 4:
      v13 = (double *)MEMORY[0x24BDC4EA8];
      goto LABEL_32;
    case 5:
      v13 = (double *)MEMORY[0x24BDC4E90];
      goto LABEL_32;
    case 6:
      v13 = (double *)MEMORY[0x24BDC4EB8];
      goto LABEL_32;
    case 8:
      v13 = (double *)MEMORY[0x24BDC4EC0];
      goto LABEL_32;
    case 9:
      v13 = (double *)MEMORY[0x24BDC4E98];
      goto LABEL_32;
    case 10:
      v13 = (double *)MEMORY[0x24BDC4EB0];
      goto LABEL_32;
    case 11:
      goto LABEL_33;
    default:
      v13 = (double *)MEMORY[0x24BDC4EC8];
LABEL_32:
      v12 = *v13;
LABEL_33:
      objc_msgSend(v9, "numberWithDouble:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      v23[2] = *MEMORY[0x24BDF7788];
      v15 = (void *)MEMORY[0x24BDD16E0];
      -[SXSystemFontFace fontAttributes](self, "fontAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "style");
      v18 = 0.06944444;
      if ((unint64_t)(v17 - 1) >= 2)
        v18 = 0.0;
      objc_msgSend(v15, "numberWithDouble:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSDictionary *)v21;
  }
}

- (id)fontAttributesForMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXFontAttributes *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("f"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("wi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("we"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("s"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SXFontAttributes initWithFamilyName:weight:width:style:grade:]([SXFontAttributes alloc], "initWithFamilyName:weight:width:style:grade:", v5, -[SXSystemFontFace fontWeightForValue:](self, "fontWeightForValue:", v7), -[SXSystemFontFace fontWidthForValue:](self, "fontWidthForValue:", v6), -[SXSystemFontFace fontStyleForValue:](self, "fontStyleForValue:", v8), 0);
  return v9;
}

- (int64_t)fontWidthForValue:(id)a3
{
  id v3;
  unint64_t v4;
  int64_t v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v3, "integerValue"), v4 <= 9))
    v5 = qword_21713C538[v4];
  else
    v5 = 7;

  return v5;
}

- (int64_t)fontWeightForValue:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v4 = objc_msgSend(v3, "integerValue");
  v5 = v4;
  if (v4 <= 499)
  {
    if (v4 > 299)
    {
      if (v4 != 300 && v4 != 400)
        goto LABEL_17;
    }
    else if (v4 != 100 && v4 != 200)
    {
      goto LABEL_17;
    }
  }
  else if (v4 <= 699)
  {
    if (v4 != 500 && v4 != 600)
      goto LABEL_17;
  }
  else if (v4 != 700 && v4 != 800 && v4 != 900)
  {
LABEL_17:
    v5 = 400;
  }

  return v5;
}

- (int64_t)fontStyleForValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v3, "isEqualToString:", CFSTR("n")) & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("i")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("o")) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_8;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[SXSystemFontFace fontName](self, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; PostScript name: %@"), v4);

  -[SXSystemFontFace fontAttributes](self, "fontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; attributes: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
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
