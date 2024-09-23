@implementation SFCreateContactCommand

- (void)setAddToExistingContact:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_addToExistingContact = a3;
}

- (BOOL)hasAddToExistingContact
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFCreateContactCommand)initWithCoder:(id)a3
{
  id v4;
  SFCreateContactCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[SFCreateContactCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand person](v8, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCreateContactCommand setPerson:](v5, "setPerson:", v9);

    -[SFCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", -[SFCommand addToExistingContact](v8, "addToExistingContact"));
    -[SFCommand commandDetail](v8, "commandDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v10);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    -[SFCommand backendData](v8, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v12);

    -[SFCommand commandReference](v8, "commandReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCreateContactCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCreateContactCommand *v2;
  void *v3;

  v2 = -[_SFPBCreateContactCommand initWithFacade:]([_SFPBCreateContactCommand alloc], "initWithFacade:", self);
  -[_SFPBCreateContactCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCreateContactCommand *v2;
  void *v3;

  v2 = -[_SFPBCreateContactCommand initWithFacade:]([_SFPBCreateContactCommand alloc], "initWithFacade:", self);
  -[_SFPBCreateContactCommand jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFCreateContactCommand;
  v4 = -[SFCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFCreateContactCommand person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPerson:", v6);

  objc_msgSend(v4, "setAddToExistingContact:", -[SFCreateContactCommand addToExistingContact](self, "addToExistingContact"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFCreateContactCommand *v6;
  SFCreateContactCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v6 = (SFCreateContactCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFCreateContactCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFCreateContactCommand;
      if (-[SFCommand isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFCreateContactCommand person](self, "person");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCreateContactCommand person](v7, "person");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFCreateContactCommand person](self, "person");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFCreateContactCommand person](self, "person"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCreateContactCommand person](v7, "person"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFCreateContactCommand addToExistingContact](self, "addToExistingContact");
          v11 = v12 ^ -[SFCreateContactCommand addToExistingContact](v7, "addToExistingContact") ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
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
  v8.super_class = (Class)SFCreateContactCommand;
  v3 = -[SFCommand hash](&v8, sel_hash);
  -[SFCreateContactCommand person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFCreateContactCommand addToExistingContact](self, "addToExistingContact") ^ v3;

  return v6;
}

- (SFPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (BOOL)addToExistingContact
{
  return self->_addToExistingContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCreateContactCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFCreateContactCommand *v5;
  void *v6;
  SFPerson *v7;
  void *v8;
  SFPerson *v9;
  SFCreateContactCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCreateContactCommand;
  v5 = -[SFCreateContactCommand init](&v12, sel_init);
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
      -[SFCreateContactCommand setPerson:](v5, "setPerson:", v9);

    }
    if (objc_msgSend(v4, "addToExistingContact"))
      -[SFCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", objc_msgSend(v4, "addToExistingContact"));
    v10 = v5;
  }

  return v5;
}

@end
