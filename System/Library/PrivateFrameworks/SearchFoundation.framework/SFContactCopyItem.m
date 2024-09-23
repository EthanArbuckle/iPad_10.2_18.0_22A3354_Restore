@implementation SFContactCopyItem

- (SFContactCopyItem)initWithProtobuf:(id)a3
{
  id v4;
  SFContactCopyItem *v5;
  void *v6;
  SFPerson *v7;
  void *v8;
  SFPerson *v9;
  void *v10;
  void *v11;
  void *v12;
  SFContactCopyItem *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFContactCopyItem;
  v5 = -[SFContactCopyItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFPerson alloc];
      objc_msgSend(v4, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFPerson initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFContactCopyItem setPerson:](v5, "setPerson:", v9);

    }
    objc_msgSend(v4, "contactFileLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "contactFileLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFContactCopyItem setContactFileLocation:](v5, "setContactFileLocation:", v12);

    }
    v13 = v5;
  }

  return v5;
}

- (SFContactCopyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBContactCopyItem *v6;
  SFContactCopyItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBContactCopyItem initWithData:]([_SFPBContactCopyItem alloc], "initWithData:", v5);
  v7 = -[SFContactCopyItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBContactCopyItem *v6;

  v4 = a3;
  v6 = -[_SFPBContactCopyItem initWithFacade:]([_SFPBContactCopyItem alloc], "initWithFacade:", self);
  -[_SFPBContactCopyItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBContactCopyItem *v2;
  void *v3;

  v2 = -[_SFPBContactCopyItem initWithFacade:]([_SFPBContactCopyItem alloc], "initWithFacade:", self);
  -[_SFPBContactCopyItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBContactCopyItem *v2;
  void *v3;

  v2 = -[_SFPBContactCopyItem initWithFacade:]([_SFPBContactCopyItem alloc], "initWithFacade:", self);
  -[_SFPBContactCopyItem jsonData](v2, "jsonData");
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFContactCopyItem;
  v4 = -[SFCopyItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFContactCopyItem person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPerson:", v6);

  -[SFContactCopyItem contactFileLocation](self, "contactFileLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setContactFileLocation:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFContactCopyItem *v5;
  SFContactCopyItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (SFContactCopyItem *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFContactCopyItem isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFContactCopyItem;
      if (-[SFCopyItem isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFContactCopyItem person](self, "person");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactCopyItem person](v6, "person");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFContactCopyItem person](self, "person");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFContactCopyItem person](self, "person");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactCopyItem person](v6, "person");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[SFContactCopyItem contactFileLocation](self, "contactFileLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactCopyItem contactFileLocation](v6, "contactFileLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFContactCopyItem contactFileLocation](self, "contactFileLocation");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFContactCopyItem contactFileLocation](self, "contactFileLocation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFContactCopyItem contactFileLocation](v6, "contactFileLocation");
            v20 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v19, "isEqual:", v17);

            v3 = v20;
          }
          else
          {

            v11 = 1;
          }
        }
        v10 = v21;
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFContactCopyItem;
  v3 = -[SFCopyItem hash](&v9, sel_hash);
  -[SFContactCopyItem person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFContactCopyItem contactFileLocation](self, "contactFileLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (SFPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSURL)contactFileLocation
{
  return self->_contactFileLocation;
}

- (void)setContactFileLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFileLocation, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
