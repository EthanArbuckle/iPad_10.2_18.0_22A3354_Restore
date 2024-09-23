@implementation RFPreview

- (RFPreview)initWithProtobuf:(id)a3
{
  id v4;
  RFPreview *v5;
  void *v6;
  void *v7;
  void *v8;
  SFCommandReference *v9;
  void *v10;
  SFCommandReference *v11;
  RFPreview *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFPreview;
  v5 = -[RFPreview init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFPreview setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "command_reference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFCommandReference alloc];
      objc_msgSend(v4, "command_reference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFCommandReference initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[RFPreview setCommand_reference:](v5, "setCommand_reference:", v11);

    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFPreview)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFPreview *v6;
  RFPreview *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFPreview initWithData:]([_SFPBRFPreview alloc], "initWithData:", v5);
  v7 = -[RFPreview initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFPreview *v6;

  v4 = a3;
  v6 = -[_SFPBRFPreview initWithFacade:]([_SFPBRFPreview alloc], "initWithFacade:", self);
  -[_SFPBRFPreview data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFPreview *v2;
  void *v3;

  v2 = -[_SFPBRFPreview initWithFacade:]([_SFPBRFPreview alloc], "initWithFacade:", self);
  -[_SFPBRFPreview dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFPreview *v2;
  void *v3;

  v2 = -[_SFPBRFPreview initWithFacade:]([_SFPBRFPreview alloc], "initWithFacade:", self);
  -[_SFPBRFPreview jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFPreview text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText:", v6);

  -[RFPreview command_reference](self, "command_reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCommand_reference:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFPreview *v5;
  RFPreview *v6;
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

  v5 = (RFPreview *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFPreview isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFPreview text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFPreview text](v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFPreview text](self, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFPreview text](self, "text");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFPreview text](v6, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[RFPreview command_reference](self, "command_reference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFPreview command_reference](v6, "command_reference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFPreview command_reference](self, "command_reference");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFPreview command_reference](self, "command_reference");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFPreview command_reference](v6, "command_reference");
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
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RFPreview text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFPreview command_reference](self, "command_reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SFCommandReference)command_reference
{
  return self->_command_reference;
}

- (void)setCommand_reference:(id)a3
{
  objc_storeStrong((id *)&self->_command_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command_reference, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
