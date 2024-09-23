@implementation SFSymbolImage

- (void)setPunchThroughBackground:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_punchThroughBackground = a3;
}

- (BOOL)hasPunchThroughBackground
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBackgroundColor:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_backgroundColor = a3;
}

- (BOOL)hasBackgroundColor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPrimaryColor:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_primaryColor = a3;
}

- (BOOL)hasPrimaryColor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSecondaryColor:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_secondaryColor = a3;
}

- (BOOL)hasSecondaryColor
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFillStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_fillStyle = a3;
}

- (BOOL)hasFillStyle
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (SFSymbolImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFSymbolImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFSymbolImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSymbolImage *v2;
  void *v3;

  v2 = -[_SFPBSymbolImage initWithFacade:]([_SFPBSymbolImage alloc], "initWithFacade:", self);
  -[_SFPBSymbolImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSymbolImage *v2;
  void *v3;

  v2 = -[_SFPBSymbolImage initWithFacade:]([_SFPBSymbolImage alloc], "initWithFacade:", self);
  -[_SFPBSymbolImage jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFSymbolImage;
  v4 = -[SFImage copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFSymbolImage symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSymbolName:", v6);

  objc_msgSend(v4, "setPunchThroughBackground:", -[SFSymbolImage punchThroughBackground](self, "punchThroughBackground"));
  objc_msgSend(v4, "setBackgroundColor:", -[SFSymbolImage backgroundColor](self, "backgroundColor"));
  objc_msgSend(v4, "setPrimaryColor:", -[SFSymbolImage primaryColor](self, "primaryColor"));
  objc_msgSend(v4, "setSecondaryColor:", -[SFSymbolImage secondaryColor](self, "secondaryColor"));
  objc_msgSend(v4, "setFillStyle:", -[SFSymbolImage fillStyle](self, "fillStyle"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFSymbolImage *v6;
  SFSymbolImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  objc_super v19;

  v6 = (SFSymbolImage *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFSymbolImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v19.receiver = self;
      v19.super_class = (Class)SFSymbolImage;
      if (-[SFImage isEqual:](&v19, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFSymbolImage symbolName](self, "symbolName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSymbolImage symbolName](v7, "symbolName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFSymbolImage symbolName](self, "symbolName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFSymbolImage symbolName](self, "symbolName"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFSymbolImage symbolName](v7, "symbolName"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v13 = -[SFSymbolImage punchThroughBackground](self, "punchThroughBackground");
          if (v13 == -[SFSymbolImage punchThroughBackground](v7, "punchThroughBackground")
            && (v14 = -[SFSymbolImage backgroundColor](self, "backgroundColor"),
                v14 == -[SFSymbolImage backgroundColor](v7, "backgroundColor"))
            && (v15 = -[SFSymbolImage primaryColor](self, "primaryColor"),
                v15 == -[SFSymbolImage primaryColor](v7, "primaryColor"))
            && (v16 = -[SFSymbolImage secondaryColor](self, "secondaryColor"),
                v16 == -[SFSymbolImage secondaryColor](v7, "secondaryColor")))
          {
            v17 = -[SFSymbolImage fillStyle](self, "fillStyle");
            v11 = v17 == -[SFSymbolImage fillStyle](v7, "fillStyle");
            v12 = v11;
            if (!v10)
              goto LABEL_19;
          }
          else
          {
            v11 = 0;
            v12 = 0;
            if (!v10)
            {
LABEL_19:

              goto LABEL_20;
            }
          }
        }
        else
        {
          v11 = 0;
        }

        v12 = v11;
        goto LABEL_19;
      }
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFSymbolImage;
  v3 = -[SFImage hash](&v12, sel_hash);
  -[SFSymbolImage symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFSymbolImage punchThroughBackground](self, "punchThroughBackground");
  v7 = v6 ^ -[SFSymbolImage backgroundColor](self, "backgroundColor");
  v8 = v7 ^ -[SFSymbolImage primaryColor](self, "primaryColor") ^ v3;
  v9 = -[SFSymbolImage secondaryColor](self, "secondaryColor");
  v10 = v8 ^ v9 ^ -[SFSymbolImage fillStyle](self, "fillStyle");

  return v10;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (int)fillStyle
{
  return self->_fillStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSymbolImage)initWithProtobuf:(id)a3
{
  id v4;
  SFSymbolImage *v5;
  void *v6;
  void *v7;
  SFSymbolImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSymbolImage;
  v5 = -[SFSymbolImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "symbolName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSymbolImage setSymbolName:](v5, "setSymbolName:", v7);

    }
    if (objc_msgSend(v4, "punchThroughBackground"))
      -[SFSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", objc_msgSend(v4, "punchThroughBackground"));
    if (objc_msgSend(v4, "backgroundColor"))
      -[SFSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(v4, "backgroundColor"));
    if (objc_msgSend(v4, "primaryColor"))
      -[SFSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", objc_msgSend(v4, "primaryColor"));
    if (objc_msgSend(v4, "secondaryColor"))
      -[SFSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", objc_msgSend(v4, "secondaryColor"));
    if (objc_msgSend(v4, "fillStyle"))
      -[SFSymbolImage setFillStyle:](v5, "setFillStyle:", objc_msgSend(v4, "fillStyle"));
    v8 = v5;
  }

  return v5;
}

@end
