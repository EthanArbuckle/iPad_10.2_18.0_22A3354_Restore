@implementation SFAppColor

- (SFAppColor)initWithCoder:(id)a3
{
  id v4;
  SFAppColor *v5;
  void *v6;
  _SFPBColor *v7;
  SFColor *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[SFAppColor init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v6);
  v8 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFColor applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppColor setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    -[SFColor redComponent](v8, "redComponent");
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    -[SFColor greenComponent](v8, "greenComponent");
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    -[SFColor blueComponent](v8, "blueComponent");
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    -[SFColor alphaComponent](v8, "alphaComponent");
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    -[SFColor setColorTintStyle:](v5, "setColorTintStyle:", -[SFColor colorTintStyle](v8, "colorTintStyle"));
    -[SFColor darkModeColor](v8, "darkModeColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColor setDarkModeColor:](v5, "setDarkModeColor:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAppColor;
  -[SFColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppColor *v2;
  void *v3;

  v2 = -[_SFPBAppColor initWithFacade:]([_SFPBAppColor alloc], "initWithFacade:", self);
  -[_SFPBAppColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppColor *v2;
  void *v3;

  v2 = -[_SFPBAppColor initWithFacade:]([_SFPBAppColor alloc], "initWithFacade:", self);
  -[_SFPBAppColor jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAppColor;
  v4 = -[SFColor copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFAppColor applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAppColor *v4;
  SFAppColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFAppColor *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFAppColor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFAppColor,
             -[SFColor isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFAppColor applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppColor applicationBundleIdentifier](v5, "applicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFAppColor applicationBundleIdentifier](self, "applicationBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFAppColor applicationBundleIdentifier](self, "applicationBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppColor applicationBundleIdentifier](v5, "applicationBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFAppColor;
  v3 = -[SFColor hash](&v7, sel_hash);
  -[SFAppColor applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppColor)initWithProtobuf:(id)a3
{
  id v4;
  SFAppColor *v5;
  void *v6;
  void *v7;
  SFAppColor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppColor;
  v5 = -[SFAppColor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppColor setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
