@implementation SFReferentialCommand

- (SFReferentialCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFReferentialCommand *v5;
  void *v6;
  void *v7;
  SFReferentialCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFReferentialCommand;
  v5 = -[SFReferentialCommand init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "referenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "referenceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReferentialCommand setReferenceIdentifier:](v5, "setReferenceIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFReferentialCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBReferentialCommand *v6;
  SFReferentialCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBReferentialCommand initWithData:]([_SFPBReferentialCommand alloc], "initWithData:", v5);
  v7 = -[SFReferentialCommand initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBReferentialCommand *v6;

  v4 = a3;
  v6 = -[_SFPBReferentialCommand initWithFacade:]([_SFPBReferentialCommand alloc], "initWithFacade:", self);
  -[_SFPBReferentialCommand data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBReferentialCommand *v2;
  void *v3;

  v2 = -[_SFPBReferentialCommand initWithFacade:]([_SFPBReferentialCommand alloc], "initWithFacade:", self);
  -[_SFPBReferentialCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBReferentialCommand *v2;
  void *v3;

  v2 = -[_SFPBReferentialCommand initWithFacade:]([_SFPBReferentialCommand alloc], "initWithFacade:", self);
  -[_SFPBReferentialCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFReferentialCommand referenceIdentifier](self, "referenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setReferenceIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFReferentialCommand *v4;
  SFReferentialCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFReferentialCommand *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFReferentialCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFReferentialCommand referenceIdentifier](self, "referenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFReferentialCommand referenceIdentifier](v5, "referenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFReferentialCommand referenceIdentifier](self, "referenceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFReferentialCommand referenceIdentifier](self, "referenceIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFReferentialCommand referenceIdentifier](v5, "referenceIdentifier");
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
  void *v2;
  unint64_t v3;

  -[SFReferentialCommand referenceIdentifier](self, "referenceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end
