@implementation SFOpenCalculationCommand

- (SFOpenCalculationCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFOpenCalculationCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFOpenCalculationCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFOpenCalculationCommand;
  v5 = -[SFOpenCalculationCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenCalculationCommand setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "output");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFOpenCalculationCommand setOutput:](v5, "setOutput:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFOpenCalculationCommand)initWithCoder:(id)a3
{
  id v4;
  SFOpenCalculationCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SFOpenCalculationCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand input](v8, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenCalculationCommand setInput:](v5, "setInput:", v9);

    -[SFCommand output](v8, "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFOpenCalculationCommand setOutput:](v5, "setOutput:", v10);

    -[SFCommand commandDetail](v8, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v11);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v12);

    -[SFCommand backendData](v8, "backendData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v13);

    -[SFCommand commandReference](v8, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFOpenCalculationCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBOpenCalculationCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenCalculationCommand initWithFacade:]([_SFPBOpenCalculationCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenCalculationCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBOpenCalculationCommand *v2;
  void *v3;

  v2 = -[_SFPBOpenCalculationCommand initWithFacade:]([_SFPBOpenCalculationCommand alloc], "initWithFacade:", self);
  -[_SFPBOpenCalculationCommand jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFOpenCalculationCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFOpenCalculationCommand input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setInput:", v6);

  -[SFOpenCalculationCommand output](self, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setOutput:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFOpenCalculationCommand *v5;
  SFOpenCalculationCommand *v6;
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

  v5 = (SFOpenCalculationCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFOpenCalculationCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFOpenCalculationCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFOpenCalculationCommand input](self, "input");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenCalculationCommand input](v6, "input");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFOpenCalculationCommand input](self, "input");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFOpenCalculationCommand input](self, "input");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFOpenCalculationCommand input](v6, "input");
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
        -[SFOpenCalculationCommand output](self, "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFOpenCalculationCommand output](v6, "output");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFOpenCalculationCommand output](self, "output");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFOpenCalculationCommand output](self, "output");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFOpenCalculationCommand output](v6, "output");
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
  v9.super_class = (Class)SFOpenCalculationCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFOpenCalculationCommand input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFOpenCalculationCommand output](self, "output");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
