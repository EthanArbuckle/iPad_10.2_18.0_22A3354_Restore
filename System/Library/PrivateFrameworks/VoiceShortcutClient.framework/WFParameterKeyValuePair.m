@implementation WFParameterKeyValuePair

- (WFParameterKeyValuePair)initWithParameterKey:(id)a3 parameterValue:(id)a4
{
  id v6;
  id v7;
  WFParameterKeyValuePair *v8;
  uint64_t v9;
  NSString *parameterKey;
  WFParameterKeyValuePair *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFParameterKeyValuePair;
  v8 = -[WFParameterKeyValuePair init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parameterKey = v8->_parameterKey;
    v8->_parameterKey = (NSString *)v9;

    objc_storeStrong((id *)&v8->_parameterValue, a4);
    v11 = v8;
  }

  return v8;
}

- (WFParameterKeyValuePair)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *parameterKey;
  WFEncodedTypedValue *v7;
  WFEncodedTypedValue *parameterValue;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterKey"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  parameterKey = self->_parameterKey;
  self->_parameterKey = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterValue"));
  v7 = (WFEncodedTypedValue *)objc_claimAutoreleasedReturnValue();

  parameterValue = self->_parameterValue;
  self->_parameterValue = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFParameterKeyValuePair parameterKey](self, "parameterKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterKey"));

  -[WFParameterKeyValuePair parameterValue](self, "parameterValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterValue"));

}

- (BOOL)isEqual:(id)a3
{
  WFParameterKeyValuePair *v4;
  WFParameterKeyValuePair *v5;
  WFParameterKeyValuePair *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (WFParameterKeyValuePair *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[WFParameterKeyValuePair parameterKey](self, "parameterKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterKeyValuePair parameterKey](v6, "parameterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[WFParameterKeyValuePair parameterValue](self, "parameterValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterKeyValuePair parameterValue](v6, "parameterValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFParameterKeyValuePair parameterKey](self, "parameterKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFParameterKeyValuePair parameterValue](self, "parameterValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (WFEncodedTypedValue)parameterValue
{
  return self->_parameterValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterValue, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
