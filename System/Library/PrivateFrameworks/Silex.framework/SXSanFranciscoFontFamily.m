@implementation SXSanFranciscoFontFamily

- (NSString)familyName
{
  return (NSString *)CFSTR("system");
}

- (NSSet)fontFaces
{
  return (NSSet *)MEMORY[0x24BDBD1A8];
}

- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  double *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SXSanFranciscoFontFace *v20;
  void *v21;
  void *v22;
  SXSanFranciscoFontFace *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDF7798], *MEMORY[0x24BDF77A0]);
  v6 = objc_msgSend(v4, "weight");
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF78A0]);

  v9 = objc_msgSend(v4, "width");
  v10 = 0.4;
  switch(v9)
  {
    case 0:
      v11 = (double *)MEMORY[0x24BDC4ED8];
      goto LABEL_32;
    case 1:
    case 2:
      v11 = (double *)MEMORY[0x24BDC4EA0];
      goto LABEL_32;
    case 3:
      v11 = (double *)MEMORY[0x24BDC4E88];
      goto LABEL_32;
    case 4:
      v11 = (double *)MEMORY[0x24BDC4EA8];
      goto LABEL_32;
    case 5:
      v11 = (double *)MEMORY[0x24BDC4E90];
      goto LABEL_32;
    case 6:
      v11 = (double *)MEMORY[0x24BDC4EB8];
      goto LABEL_32;
    case 8:
      v11 = (double *)MEMORY[0x24BDC4EC0];
      goto LABEL_32;
    case 9:
      v11 = (double *)MEMORY[0x24BDC4E98];
      goto LABEL_32;
    case 10:
      v11 = (double *)MEMORY[0x24BDC4EB0];
      goto LABEL_32;
    case 11:
      goto LABEL_33;
    default:
      v11 = (double *)MEMORY[0x24BDC4EC8];
LABEL_32:
      v10 = *v11;
LABEL_33:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v12, *MEMORY[0x24BDF78B0]);

      v13 = objc_msgSend(v4, "style");
      v14 = 0.06944444;
      if ((unint64_t)(v13 - 1) >= 2)
        v14 = 0.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v15, *MEMORY[0x24BDF7788]);

      objc_msgSend(v4, "grade");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v4, "grade");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v17, *MEMORY[0x24BDF77A8]);

      }
      v25 = *MEMORY[0x24BDF7770];
      v26[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithFontAttributes:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = [SXSanFranciscoFontFace alloc];
      objc_msgSend(v19, "postscriptName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fontAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SXSanFranciscoFontFace initWithFontName:fontAttributes:fontDescriptorAttributes:](v20, "initWithFontName:fontAttributes:fontDescriptorAttributes:", v21, v4, v22);

      return v23;
  }
}

@end
