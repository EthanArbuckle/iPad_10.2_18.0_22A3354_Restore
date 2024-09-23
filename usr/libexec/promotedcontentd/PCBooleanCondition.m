@implementation PCBooleanCondition

- (PCBooleanCondition)initWithType:(id)a3 value:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PCBooleanCondition *v12;
  PCBooleanCondition *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PCBooleanCondition;
  v12 = -[PCBooleanCondition init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    v14 = objc_claimAutoreleasedReturnValue(-[PCBooleanCondition shortCircuitBundleIdentifier:condition:](v13, "shortCircuitBundleIdentifier:condition:", v11, v10));
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

  }
  return v13;
}

- (id)shortCircuitBundleIdentifier:(id)a3 condition:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10022B2F8, "objectForKey:", v5));
  v8 = v7;
  if (v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v5;
    v12 = v11;

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

- (id)storageRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iTunesDSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCBooleanCondition type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCBooleanCondition value](self, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCBooleanCondition identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@"), v4, v5, v6, v7));

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
