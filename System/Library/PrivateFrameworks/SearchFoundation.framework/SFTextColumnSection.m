@implementation SFTextColumnSection

- (SFTextColumnSection)initWithProtobuf:(id)a3
{
  id v4;
  SFTextColumnSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFTextColumnSection *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFTextColumnSection;
  v5 = -[SFTextColumnSection init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "textLines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "textLines", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    -[SFTextColumnSection setTextLines:](v5, "setTextLines:", v7);
    if (objc_msgSend(v4, "textNoWrap"))
      -[SFTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", objc_msgSend(v4, "textNoWrap"));
    if (objc_msgSend(v4, "textWeight"))
      -[SFTextColumnSection setTextWeight:](v5, "setTextWeight:", objc_msgSend(v4, "textWeight"));
    v13 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTextNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_textNoWrap = a3;
}

- (BOOL)hasTextNoWrap
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTextWeight:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_textWeight = a3;
}

- (BOOL)hasTextWeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFTextColumnSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextColumnSection *v6;
  SFTextColumnSection *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTextColumnSection initWithData:]([_SFPBTextColumnSection alloc], "initWithData:", v5);
  v7 = -[SFTextColumnSection initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextColumnSection *v6;

  v4 = a3;
  v6 = -[_SFPBTextColumnSection initWithFacade:]([_SFPBTextColumnSection alloc], "initWithFacade:", self);
  -[_SFPBTextColumnSection data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTextColumnSection *v2;
  void *v3;

  v2 = -[_SFPBTextColumnSection initWithFacade:]([_SFPBTextColumnSection alloc], "initWithFacade:", self);
  -[_SFPBTextColumnSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTextColumnSection *v2;
  void *v3;

  v2 = -[_SFPBTextColumnSection initWithFacade:]([_SFPBTextColumnSection alloc], "initWithFacade:", self);
  -[_SFPBTextColumnSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFTextColumnSection textLines](self, "textLines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTextLines:", v6);

  objc_msgSend(v4, "setTextNoWrap:", -[SFTextColumnSection textNoWrap](self, "textNoWrap"));
  objc_msgSend(v4, "setTextWeight:", -[SFTextColumnSection textWeight](self, "textWeight"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFTextColumnSection *v6;
  SFTextColumnSection *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  unint64_t v13;

  v6 = (SFTextColumnSection *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFTextColumnSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[SFTextColumnSection textLines](self, "textLines");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTextColumnSection textLines](v7, "textLines");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
      -[SFTextColumnSection textLines](self, "textLines");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[SFTextColumnSection textLines](self, "textLines"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFTextColumnSection textLines](v7, "textLines"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[SFTextColumnSection textNoWrap](self, "textNoWrap");
        if (v12 == -[SFTextColumnSection textNoWrap](v7, "textNoWrap"))
        {
          v13 = -[SFTextColumnSection textWeight](self, "textWeight");
          v11 = v13 == -[SFTextColumnSection textWeight](v7, "textWeight");
          if (!v10)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          v11 = 0;
          if (!v10)
            goto LABEL_15;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[SFTextColumnSection textLines](self, "textLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SFTextColumnSection textNoWrap](self, "textNoWrap");
  v6 = v4 ^ -[SFTextColumnSection textWeight](self, "textWeight") ^ v5;

  return v6;
}

- (NSArray)textLines
{
  return self->_textLines;
}

- (void)setTextLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)textNoWrap
{
  return self->_textNoWrap;
}

- (unint64_t)textWeight
{
  return self->_textWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLines, 0);
}

@end
