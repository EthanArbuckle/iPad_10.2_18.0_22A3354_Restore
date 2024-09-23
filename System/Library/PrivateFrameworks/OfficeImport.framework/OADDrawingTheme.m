@implementation OADDrawingTheme

- (OADDrawingTheme)initWithStyleMatrix:(id)a3 fontScheme:(id)a4 colorScheme:(id)a5 colorMap:(id)a6 colorPalette:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  OADDrawingTheme *v18;
  OADDrawingTheme *v19;
  OADColorContext *v20;
  OADColorContext *mColorContext;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)OADDrawingTheme;
  v18 = -[OADDrawingTheme init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->mStyleMatrix, a3);
    objc_storeStrong((id *)&v19->mFontScheme, a4);
    v20 = -[OADColorContext initWithScheme:map:palette:]([OADColorContext alloc], "initWithScheme:map:palette:", v15, v16, v17);
    mColorContext = v19->mColorContext;
    v19->mColorContext = v20;

  }
  return v19;
}

- (OADDrawingTheme)initWithTheme:(id)a3 colorMap:(id)a4 colorPalette:(id)a5
{
  id v8;
  id v9;
  id v10;
  OADDrawingTheme *v11;
  void *v12;
  uint64_t v13;
  OADStyleMatrix *mStyleMatrix;
  void *v15;
  uint64_t v16;
  OADFontScheme *mFontScheme;
  OADColorContext *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  OADColorContext *mColorContext;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)OADDrawingTheme;
  v11 = -[OADDrawingTheme init](&v24, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "baseStyles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "styleMatrix");
    v13 = objc_claimAutoreleasedReturnValue();
    mStyleMatrix = v11->mStyleMatrix;
    v11->mStyleMatrix = (OADStyleMatrix *)v13;

    objc_msgSend(v8, "baseStyles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontScheme");
    v16 = objc_claimAutoreleasedReturnValue();
    mFontScheme = v11->mFontScheme;
    v11->mFontScheme = (OADFontScheme *)v16;

    v18 = [OADColorContext alloc];
    objc_msgSend(v8, "baseStyles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorScheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[OADColorContext initWithScheme:map:palette:](v18, "initWithScheme:map:palette:", v20, v9, v10);
    mColorContext = v11->mColorContext;
    v11->mColorContext = (OADColorContext *)v21;

  }
  return v11;
}

- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4
{
  id v6;
  void *v7;
  OADFontScheme *v8;
  OADFontScheme *mFontScheme;
  void *v10;
  OADStyleMatrix *v11;
  OADStyleMatrix *mStyleMatrix;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "fontScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v13, "fontScheme");
    v8 = (OADFontScheme *)objc_claimAutoreleasedReturnValue();
    mFontScheme = self->mFontScheme;
    self->mFontScheme = v8;

  }
  objc_msgSend(v13, "styleMatrix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v13, "styleMatrix");
    v11 = (OADStyleMatrix *)objc_claimAutoreleasedReturnValue();
    mStyleMatrix = self->mStyleMatrix;
    self->mStyleMatrix = v11;

  }
  -[OADColorContext applyThemeOverrides:colorMapOverride:](self->mColorContext, "applyThemeOverrides:colorMapOverride:", v13, v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  objc_object **v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (objc_object **)v4;
    if ((TCObjectEqual((objc_object *)self->mStyleMatrix, v7[1]) & 1) != 0
      && TCObjectEqual((objc_object *)self->mFontScheme, v7[2]))
    {
      v6 = TCObjectEqual((objc_object *)self->mColorContext, v7[3]);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v3 = -[OADFontScheme hash](self->mFontScheme, "hash");
  v4 = (-[OADColorContext hash](self->mColorContext, "hash") << 8) + (v3 << 16);
  v6.receiver = self;
  v6.super_class = (Class)OADDrawingTheme;
  return -[OADDrawingTheme hash](&v6, sel_hash) + v4;
}

- (OADColorScheme)colorScheme
{
  return -[OADColorContext scheme](self->mColorContext, "scheme");
}

- (OADColorMap)colorMap
{
  return -[OADColorContext map](self->mColorContext, "map");
}

- (OADColorPalette)colorPalette
{
  return -[OADColorContext palette](self->mColorContext, "palette");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[OITSUDescription descriptionWithObject:class:](OITSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStyleMatrix description](self->mStyleMatrix, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("StyleMatrix"), v4);

  -[OADFontScheme description](self->mFontScheme, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("FontScheme"), v5);

  -[OADColorContext description](self->mColorContext, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("ColorContext"), v6);

  objc_msgSend(v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OADStyleMatrix)styleMatrix
{
  return self->mStyleMatrix;
}

- (OADFontScheme)fontScheme
{
  return self->mFontScheme;
}

- (OADColorContext)colorContext
{
  return self->mColorContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorContext, 0);
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
}

@end
