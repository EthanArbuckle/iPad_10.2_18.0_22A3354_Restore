@implementation SFInfoTuple

- (SFInfoTuple)initWithProtobuf:(id)a3
{
  id v4;
  SFInfoTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SFCommandButtonItem *v15;
  void *v16;
  void *v17;
  SFInfoTuple *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFInfoTuple;
  v5 = -[SFInfoTuple init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFInfoTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "values", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = -[SFCommandButtonItem initWithProtobuf:]([SFCommandButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    -[SFInfoTuple setValues:](v5, "setValues:", v9);
    if (objc_msgSend(v4, "initiallyVisibleValues"))
      -[SFInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", objc_msgSend(v4, "initiallyVisibleValues"));
    objc_msgSend(v4, "showMoreString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "showMoreString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFInfoTuple setShowMoreString:](v5, "setShowMoreString:", v17);

    }
    v18 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setInitiallyVisibleValues:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_initiallyVisibleValues = a3;
}

- (BOOL)hasInitiallyVisibleValues
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFInfoTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBInfoTuple *v6;
  SFInfoTuple *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBInfoTuple initWithData:]([_SFPBInfoTuple alloc], "initWithData:", v5);
  v7 = -[SFInfoTuple initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBInfoTuple *v6;

  v4 = a3;
  v6 = -[_SFPBInfoTuple initWithFacade:]([_SFPBInfoTuple alloc], "initWithFacade:", self);
  -[_SFPBInfoTuple data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBInfoTuple *v2;
  void *v3;

  v2 = -[_SFPBInfoTuple initWithFacade:]([_SFPBInfoTuple alloc], "initWithFacade:", self);
  -[_SFPBInfoTuple dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBInfoTuple *v2;
  void *v3;

  v2 = -[_SFPBInfoTuple initWithFacade:]([_SFPBInfoTuple alloc], "initWithFacade:", self);
  -[_SFPBInfoTuple jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFInfoTuple key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setKey:", v6);

  -[SFInfoTuple values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setValues:", v8);

  objc_msgSend(v4, "setInitiallyVisibleValues:", -[SFInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues"));
  -[SFInfoTuple showMoreString](self, "showMoreString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setShowMoreString:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFInfoTuple *v5;
  SFInfoTuple *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (SFInfoTuple *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFInfoTuple isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFInfoTuple key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFInfoTuple key](v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[SFInfoTuple key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFInfoTuple key](self, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFInfoTuple key](v6, "key");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[SFInfoTuple values](self, "values");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFInfoTuple values](v6, "values");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[SFInfoTuple values](self, "values");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v26 = v3;
        -[SFInfoTuple values](self, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFInfoTuple values](v6, "values");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v3 = v26;
          goto LABEL_25;
        }
        v28 = v15;
        v3 = v26;
      }
      else
      {
        v28 = 0;
      }
      v17 = -[SFInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues");
      if (v17 == -[SFInfoTuple initiallyVisibleValues](v6, "initiallyVisibleValues"))
      {
        -[SFInfoTuple showMoreString](self, "showMoreString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFInfoTuple showMoreString](v6, "showMoreString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v18 == 0) != (v19 != 0))
        {
          v25 = v19;
          v27 = v18;
          -[SFInfoTuple showMoreString](self, "showMoreString");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v24 = (void *)v20;
            -[SFInfoTuple showMoreString](self, "showMoreString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFInfoTuple showMoreString](v6, "showMoreString");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v23, "isEqual:", v21);

          }
          else
          {

            v11 = 1;
          }
LABEL_24:
          v15 = v28;
          if (!v28)
          {
LABEL_26:

LABEL_27:
            v10 = v31;
            if (!v9)
            {
LABEL_29:

              goto LABEL_30;
            }
LABEL_28:

            goto LABEL_29;
          }
LABEL_25:

          goto LABEL_26;
        }

      }
      v11 = 0;
      goto LABEL_24;
    }
    v11 = 0;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[SFInfoTuple key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFInfoTuple values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[SFInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues");
  -[SFInfoTuple showMoreString](self, "showMoreString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)initiallyVisibleValues
{
  return self->_initiallyVisibleValues;
}

- (NSString)showMoreString
{
  return self->_showMoreString;
}

- (void)setShowMoreString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreString, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
