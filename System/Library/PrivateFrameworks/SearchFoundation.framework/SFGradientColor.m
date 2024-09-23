@implementation SFGradientColor

- (void)setGradientType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_gradientType = a3;
}

- (BOOL)hasGradientType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFGradientColor)initWithCoder:(id)a3
{
  id v4;
  SFGradientColor *v5;
  void *v6;
  _SFPBColor *v7;
  SFColor *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[SFGradientColor init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v6);
  v8 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFColor colors](v8, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFGradientColor setColors:](v5, "setColors:", v9);

    -[SFGradientColor setGradientType:](v5, "setGradientType:", -[SFColor gradientType](v8, "gradientType"));
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
  v3.super_class = (Class)SFGradientColor;
  -[SFColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBGradientColor *v2;
  void *v3;

  v2 = -[_SFPBGradientColor initWithFacade:]([_SFPBGradientColor alloc], "initWithFacade:", self);
  -[_SFPBGradientColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBGradientColor *v2;
  void *v3;

  v2 = -[_SFPBGradientColor initWithFacade:]([_SFPBGradientColor alloc], "initWithFacade:", self);
  -[_SFPBGradientColor jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFGradientColor;
  v4 = -[SFColor copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFGradientColor colors](self, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setColors:", v6);

  objc_msgSend(v4, "setGradientType:", -[SFGradientColor gradientType](self, "gradientType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFGradientColor *v6;
  SFGradientColor *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = (SFGradientColor *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFGradientColor isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFGradientColor;
      if (-[SFColor isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFGradientColor colors](self, "colors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFGradientColor colors](v7, "colors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFGradientColor colors](self, "colors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFGradientColor colors](self, "colors"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFGradientColor colors](v7, "colors"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFGradientColor gradientType](self, "gradientType");
          v11 = v12 == -[SFGradientColor gradientType](v7, "gradientType");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFGradientColor;
  v3 = -[SFColor hash](&v8, sel_hash);
  -[SFGradientColor colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFGradientColor gradientType](self, "gradientType") ^ v3;

  return v6;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)gradientType
{
  return self->_gradientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFGradientColor)initWithProtobuf:(id)a3
{
  id v4;
  SFGradientColor *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFColor *v13;
  SFGradientColor *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFGradientColor;
  v5 = -[SFGradientColor init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "colors", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[SFGradientColor setColors:](v5, "setColors:", v7);
    if (objc_msgSend(v4, "gradientType"))
      -[SFGradientColor setGradientType:](v5, "setGradientType:", objc_msgSend(v4, "gradientType"));
    v14 = v5;

  }
  return v5;
}

@end
