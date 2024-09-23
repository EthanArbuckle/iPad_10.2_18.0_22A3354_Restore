@implementation OADTheme

- (OADTheme)init
{
  OADTheme *v2;
  OADBaseStyles *v3;
  OADBaseStyles *mBaseStyles;
  uint64_t v5;
  OADDrawableDefaults *mDrawableDefaults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADTheme;
  v2 = -[OADTheme init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADBaseStyles);
    mBaseStyles = v2->mBaseStyles;
    v2->mBaseStyles = v3;

    v5 = objc_opt_new();
    mDrawableDefaults = v2->mDrawableDefaults;
    v2->mDrawableDefaults = (OADDrawableDefaults *)v5;

  }
  return v2;
}

- (OADBaseStyles)baseStyles
{
  return self->mBaseStyles;
}

- (BOOL)isEmpty
{
  return -[OADBaseStyles isEmpty](self->mBaseStyles, "isEmpty")
      && -[OADDrawableDefaults isEmpty](self->mDrawableDefaults, "isEmpty");
}

- (void)validateTheme
{
  void *v3;
  uint64_t v4;

  -[OADTheme name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    -[OADTheme setName:](self, "setName:", CFSTR("Office"));
  -[OADBaseStyles validateBaseStyles](self->mBaseStyles, "validateBaseStyles");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTheme;
  -[OADTheme description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBaseStyles:(id)a3
{
  objc_storeStrong((id *)&self->mBaseStyles, a3);
}

- (OADDrawableDefaults)drawableDefaults
{
  return self->mDrawableDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawableDefaults, 0);
  objc_storeStrong((id *)&self->mBaseStyles, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
