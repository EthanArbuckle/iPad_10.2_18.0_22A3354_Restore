@implementation SFFormattedText

- (SFFormattedText)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  SFFormattedText *v6;
  void *v7;
  SFImage *v8;
  void *v9;
  SFImage *v10;
  SFFormattedText *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SFFormattedText;
  v6 = -[SFText initWithProtobuf:](&v13, sel_initWithProtobuf_, v5);

  if (v6)
  {
    objc_msgSend(v4, "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [SFImage alloc];
      objc_msgSend(v4, "glyph");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SFImage initWithProtobuf:](v8, "initWithProtobuf:", v9);
      -[SFFormattedText setGlyph:](v6, "setGlyph:", v10);

    }
    if (objc_msgSend(v4, "isEmphasized"))
      -[SFFormattedText setIsEmphasized:](v6, "setIsEmphasized:", objc_msgSend(v4, "isEmphasized"));
    if (objc_msgSend(v4, "isBold"))
      -[SFFormattedText setIsBold:](v6, "setIsBold:", objc_msgSend(v4, "isBold"));
    if (objc_msgSend(v4, "textColor"))
      -[SFFormattedText setTextColor:](v6, "setTextColor:", objc_msgSend(v4, "textColor"));
    if (objc_msgSend(v4, "encapsulationStyle"))
      -[SFFormattedText setEncapsulationStyle:](v6, "setEncapsulationStyle:", objc_msgSend(v4, "encapsulationStyle"));
    v11 = v6;
  }

  return v6;
}

- (void)setIsEmphasized:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isEmphasized = a3;
}

- (BOOL)hasIsEmphasized
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsBold:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isBold = a3;
}

- (BOOL)hasIsBold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTextColor:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_textColor = a3;
}

- (BOOL)hasTextColor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEncapsulationStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_encapsulationStyle = a3;
}

- (BOOL)hasEncapsulationStyle
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFFormattedText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFormattedText *v6;
  SFFormattedText *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBFormattedText initWithData:]([_SFPBFormattedText alloc], "initWithData:", v5);
  v7 = -[SFFormattedText initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFormattedText *v6;

  v4 = a3;
  v6 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", self);
  -[_SFPBFormattedText data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBFormattedText *v2;
  void *v3;

  v2 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", self);
  -[_SFPBFormattedText dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBFormattedText *v2;
  void *v3;

  v2 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", self);
  -[_SFPBFormattedText jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFFormattedText;
  v4 = -[SFText copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFFormattedText glyph](self, "glyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setGlyph:", v6);

  objc_msgSend(v4, "setIsEmphasized:", -[SFFormattedText isEmphasized](self, "isEmphasized"));
  objc_msgSend(v4, "setIsBold:", -[SFFormattedText isBold](self, "isBold"));
  objc_msgSend(v4, "setTextColor:", -[SFFormattedText textColor](self, "textColor"));
  objc_msgSend(v4, "setEncapsulationStyle:", -[SFFormattedText encapsulationStyle](self, "encapsulationStyle"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFFormattedText *v6;
  SFFormattedText *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  int v16;
  objc_super v18;

  v6 = (SFFormattedText *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFFormattedText isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v18.receiver = self;
      v18.super_class = (Class)SFFormattedText;
      if (-[SFText isEqual:](&v18, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFFormattedText glyph](self, "glyph");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFormattedText glyph](v7, "glyph");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        -[SFFormattedText glyph](self, "glyph");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFFormattedText glyph](self, "glyph"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFFormattedText glyph](v7, "glyph"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v13 = -[SFFormattedText isEmphasized](self, "isEmphasized");
          if (v13 == -[SFFormattedText isEmphasized](v7, "isEmphasized")
            && (v14 = -[SFFormattedText isBold](self, "isBold"), v14 == -[SFFormattedText isBold](v7, "isBold"))
            && (v15 = -[SFFormattedText textColor](self, "textColor"),
                v15 == -[SFFormattedText textColor](v7, "textColor")))
          {
            v16 = -[SFFormattedText encapsulationStyle](self, "encapsulationStyle");
            v11 = v16 == -[SFFormattedText encapsulationStyle](v7, "encapsulationStyle");
            v12 = v11;
            if (!v10)
              goto LABEL_18;
          }
          else
          {
            v11 = 0;
            v12 = 0;
            if (!v10)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
        }
        else
        {
          v11 = 0;
        }

        v12 = v11;
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_20:

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
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFFormattedText;
  v3 = -[SFText hash](&v11, sel_hash);
  -[SFFormattedText glyph](self, "glyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFFormattedText isEmphasized](self, "isEmphasized");
  v7 = v6 ^ -[SFFormattedText isBold](self, "isBold");
  v8 = v7 ^ -[SFFormattedText textColor](self, "textColor") ^ v3;
  v9 = v8 ^ -[SFFormattedText encapsulationStyle](self, "encapsulationStyle");

  return v9;
}

- (SFImage)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (int)textColor
{
  return self->_textColor;
}

- (int)encapsulationStyle
{
  return self->_encapsulationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
