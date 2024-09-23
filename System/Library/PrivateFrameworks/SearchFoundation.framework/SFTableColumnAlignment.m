@implementation SFTableColumnAlignment

- (SFTableColumnAlignment)initWithProtobuf:(id)a3
{
  id v4;
  SFTableColumnAlignment *v5;
  SFTableColumnAlignment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFTableColumnAlignment;
  v5 = -[SFTableColumnAlignment init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "columnAlignment"))
      -[SFTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", objc_msgSend(v4, "columnAlignment"));
    if (objc_msgSend(v4, "dataAlignment"))
      -[SFTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", objc_msgSend(v4, "dataAlignment"));
    if (objc_msgSend(v4, "isEqualWidth"))
      -[SFTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", objc_msgSend(v4, "isEqualWidth"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setColumnAlignment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_columnAlignment = a3;
}

- (BOOL)hasColumnAlignment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDataAlignment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataAlignment = a3;
}

- (BOOL)hasDataAlignment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsEqualWidth:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isEqualWidth = a3;
}

- (BOOL)hasIsEqualWidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFTableColumnAlignment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTableColumnAlignment *v6;
  SFTableColumnAlignment *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTableColumnAlignment initWithData:]([_SFPBTableColumnAlignment alloc], "initWithData:", v5);
  v7 = -[SFTableColumnAlignment initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTableColumnAlignment *v6;

  v4 = a3;
  v6 = -[_SFPBTableColumnAlignment initWithFacade:]([_SFPBTableColumnAlignment alloc], "initWithFacade:", self);
  -[_SFPBTableColumnAlignment data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTableColumnAlignment *v2;
  void *v3;

  v2 = -[_SFPBTableColumnAlignment initWithFacade:]([_SFPBTableColumnAlignment alloc], "initWithFacade:", self);
  -[_SFPBTableColumnAlignment dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTableColumnAlignment *v2;
  void *v3;

  v2 = -[_SFPBTableColumnAlignment initWithFacade:]([_SFPBTableColumnAlignment alloc], "initWithFacade:", self);
  -[_SFPBTableColumnAlignment jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setColumnAlignment:", -[SFTableColumnAlignment columnAlignment](self, "columnAlignment"));
  objc_msgSend(v4, "setDataAlignment:", -[SFTableColumnAlignment dataAlignment](self, "dataAlignment"));
  objc_msgSend(v4, "setIsEqualWidth:", -[SFTableColumnAlignment isEqualWidth](self, "isEqualWidth"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFTableColumnAlignment *v4;
  SFTableColumnAlignment *v5;
  int v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (SFTableColumnAlignment *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if (-[SFTableColumnAlignment isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFTableColumnAlignment columnAlignment](self, "columnAlignment");
    if (v6 == -[SFTableColumnAlignment columnAlignment](v5, "columnAlignment")
      && (v7 = -[SFTableColumnAlignment dataAlignment](self, "dataAlignment"),
          v7 == -[SFTableColumnAlignment dataAlignment](v5, "dataAlignment")))
    {
      v8 = -[SFTableColumnAlignment isEqualWidth](self, "isEqualWidth");
      v9 = v8 ^ -[SFTableColumnAlignment isEqualWidth](v5, "isEqualWidth") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;

  v3 = -[SFTableColumnAlignment columnAlignment](self, "columnAlignment");
  v4 = -[SFTableColumnAlignment dataAlignment](self, "dataAlignment") ^ v3;
  return v4 ^ -[SFTableColumnAlignment isEqualWidth](self, "isEqualWidth");
}

- (int)columnAlignment
{
  return self->_columnAlignment;
}

- (int)dataAlignment
{
  return self->_dataAlignment;
}

- (BOOL)isEqualWidth
{
  return self->_isEqualWidth;
}

@end
