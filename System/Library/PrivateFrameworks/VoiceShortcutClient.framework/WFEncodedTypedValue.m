@implementation WFEncodedTypedValue

- (WFEncodedTypedValue)initWithData:(id)a3
{
  id v5;
  WFEncodedTypedValue *v6;
  WFEncodedTypedValue *v7;
  WFEncodedTypedValue *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEncodedTypedValue;
  v6 = -[WFEncodedTypedValue init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WFEncodedTypedValue *v4;
  WFEncodedTypedValue *v5;
  WFEncodedTypedValue *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (WFEncodedTypedValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFEncodedTypedValue data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEncodedTypedValue data](v6, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFEncodedTypedValue data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEncodedTypedValue data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (WFEncodedTypedValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFEncodedTypedValue *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFEncodedTypedValue initWithData:](self, "initWithData:", v5);
  return v6;
}

- (WFEncodedTypedValue)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  WFEncodedTypedValue *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFEncodedTypedValue initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEncodedTypedValue data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
