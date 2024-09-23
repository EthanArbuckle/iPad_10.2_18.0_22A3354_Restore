@implementation SFImageDerivedColor

- (SFImageDerivedColor)initWithProtobuf:(id)a3
{
  id v4;
  SFImageDerivedColor *v5;
  void *v6;
  SFImage *v7;
  void *v8;
  SFImage *v9;
  SFImageDerivedColor *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFImageDerivedColor;
  v5 = -[SFImageDerivedColor init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFImageDerivedColor setImage:](v5, "setImage:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFImageDerivedColor)initWithCoder:(id)a3
{
  id v4;
  SFImageDerivedColor *v5;
  void *v6;
  _SFPBColor *v7;
  SFColor *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[SFImageDerivedColor init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v6);
  v8 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFColor image](v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImageDerivedColor setImage:](v5, "setImage:", v9);

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
  v3.super_class = (Class)SFImageDerivedColor;
  -[SFColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBImageDerivedColor *v2;
  void *v3;

  v2 = -[_SFPBImageDerivedColor initWithFacade:]([_SFPBImageDerivedColor alloc], "initWithFacade:", self);
  -[_SFPBImageDerivedColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBImageDerivedColor *v2;
  void *v3;

  v2 = -[_SFPBImageDerivedColor initWithFacade:]([_SFPBImageDerivedColor alloc], "initWithFacade:", self);
  -[_SFPBImageDerivedColor jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFImageDerivedColor;
  v4 = -[SFColor copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFImageDerivedColor image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFImageDerivedColor *v4;
  SFImageDerivedColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFImageDerivedColor *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFImageDerivedColor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFImageDerivedColor,
             -[SFColor isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFImageDerivedColor image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImageDerivedColor image](v5, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFImageDerivedColor image](self, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFImageDerivedColor image](self, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFImageDerivedColor image](v5, "image");
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
  v7.super_class = (Class)SFImageDerivedColor;
  v3 = -[SFColor hash](&v7, sel_hash);
  -[SFImageDerivedColor image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
