@implementation OADColorContext

- (OADColorContext)initWithScheme:(id)a3 map:(id)a4 palette:(id)a5
{
  id v9;
  id v10;
  id v11;
  OADColorContext *v12;
  OADColorContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OADColorContext;
  v12 = -[OADColorContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mScheme, a3);
    objc_storeStrong((id *)&v13->mMap, a4);
    objc_storeStrong((id *)&v13->mPalette, a5);
  }

  return v13;
}

- (OADColorMap)map
{
  return self->mMap;
}

- (OADColorScheme)scheme
{
  return self->mScheme;
}

- (OADColorPalette)palette
{
  return self->mPalette;
}

+ (id)colorContextWithScheme:(id)a3 map:(id)a4 palette:(id)a5
{
  id v7;
  id v8;
  id v9;
  OADColorContext *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[OADColorContext initWithScheme:map:palette:]([OADColorContext alloc], "initWithScheme:map:palette:", v7, v8, v9);

  return v10;
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
    if ((TCObjectEqual((objc_object *)self->mScheme, v7[1]) & 1) != 0
      && TCObjectEqual((objc_object *)self->mMap, v7[2]))
    {
      v6 = TCObjectEqual((objc_object *)self->mPalette, v7[3]);
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

  v3 = -[OADColorScheme hash](self->mScheme, "hash");
  v4 = (-[OADColorMap hash](self->mMap, "hash") << 8) + (v3 << 16);
  v6.receiver = self;
  v6.super_class = (Class)OADColorContext;
  return -[OADColorContext hash](&v6, sel_hash) + v4;
}

- (void)applyThemeOverrides:(id)a3 colorMapOverride:(id)a4
{
  id v6;
  void *v7;
  OADColorScheme *v8;
  OADColorScheme *mScheme;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "colorScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "colorScheme");
    v8 = (OADColorScheme *)objc_claimAutoreleasedReturnValue();
    mScheme = self->mScheme;
    self->mScheme = v8;

  }
  if (v6)
    objc_storeStrong((id *)&self->mMap, a4);

}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->mPalette, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPalette, 0);
  objc_storeStrong((id *)&self->mMap, 0);
  objc_storeStrong((id *)&self->mScheme, 0);
}

@end
