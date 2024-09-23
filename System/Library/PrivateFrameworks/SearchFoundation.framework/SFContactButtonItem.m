@implementation SFContactButtonItem

- (SFContactButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFContactButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  SFPerson *v9;
  void *v10;
  SFPerson *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  SFContactButtonItem *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SFContactButtonItem;
  v5 = -[SFContactButtonItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFContactButtonItem setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    objc_msgSend(v4, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFPerson alloc];
      objc_msgSend(v4, "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFPerson initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFContactButtonItem setPerson:](v5, "setPerson:", v11);

    }
    objc_msgSend(v4, "actionTypesToShows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "actionTypesToShows", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if (*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i))
            objc_msgSend(v13, "addObject:");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

    -[SFContactButtonItem setActionTypesToShow:](v5, "setActionTypesToShow:", v13);
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v19 = v5;

  }
  return v5;
}

- (SFContactButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBContactButtonItem *v6;
  SFContactButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBContactButtonItem initWithData:]([_SFPBContactButtonItem alloc], "initWithData:", v5);
  v7 = -[SFContactButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBContactButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBContactButtonItem initWithFacade:]([_SFPBContactButtonItem alloc], "initWithFacade:", self);
  -[_SFPBContactButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBContactButtonItem *v2;
  void *v3;

  v2 = -[_SFPBContactButtonItem initWithFacade:]([_SFPBContactButtonItem alloc], "initWithFacade:", self);
  -[_SFPBContactButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBContactButtonItem *v2;
  void *v3;

  v2 = -[_SFPBContactButtonItem initWithFacade:]([_SFPBContactButtonItem alloc], "initWithFacade:", self);
  -[_SFPBContactButtonItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFContactButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFContactButtonItem contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContactIdentifier:", v6);

  -[SFContactButtonItem person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPerson:", v8);

  -[SFContactButtonItem actionTypesToShow](self, "actionTypesToShow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setActionTypesToShow:", v10);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFContactButtonItem *v5;
  SFContactButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v5 = (SFContactButtonItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFContactButtonItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v33.receiver = self;
      v33.super_class = (Class)SFContactButtonItem;
      if (-[SFButtonItem isEqual:](&v33, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFContactButtonItem contactIdentifier](self, "contactIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactButtonItem contactIdentifier](v6, "contactIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[SFContactButtonItem contactIdentifier](self, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFContactButtonItem contactIdentifier](self, "contactIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactButtonItem contactIdentifier](v6, "contactIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        -[SFContactButtonItem person](self, "person");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactButtonItem person](v6, "person");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_30;
        }
        -[SFContactButtonItem person](self, "person");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v12;
          -[SFContactButtonItem person](self, "person");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactButtonItem person](v6, "person");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        -[SFContactButtonItem actionTypesToShow](self, "actionTypesToShow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactButtonItem actionTypesToShow](v6, "actionTypesToShow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v31;
          v3 = v28;
          if (!v31)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        -[SFContactButtonItem actionTypesToShow](self, "actionTypesToShow");
        v15 = v31;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (-[SFContactButtonItem actionTypesToShow](self, "actionTypesToShow"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFContactButtonItem actionTypesToShow](v6, "actionTypesToShow"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v3 = v28;
          v20 = -[SFButtonItem uniqueId](self, "uniqueId");
          v11 = v20 == -[SFButtonItem uniqueId](v6, "uniqueId");
          if (!v27)
            goto LABEL_27;
        }
        else
        {
          v11 = 0;
          v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFContactButtonItem;
  v3 = -[SFButtonItem hash](&v12, sel_hash);
  -[SFContactButtonItem contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFContactButtonItem person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFContactButtonItem actionTypesToShow](self, "actionTypesToShow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v10;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SFPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSArray)actionTypesToShow
{
  return self->_actionTypesToShow;
}

- (void)setActionTypesToShow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypesToShow, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
