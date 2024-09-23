@implementation _TUIIdentifierNumberWithUUID

- (_TUIIdentifierNumberWithUUID)initWithUUID:(id)a3 value:(unint64_t)a4
{
  id v6;
  _TUIIdentifierNumberWithUUID *v7;
  _TUIIdentifierNumberWithUUID *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUIIdentifierNumberWithUUID;
  v7 = -[_TUIIdentifierNumberWithUUID init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v6, "getUUIDBytes:", v7->_uuid);
    v8->_value = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  return *(_QWORD *)self->_uuid ^ self->_value;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  _TUIIdentifierNumberWithUUID *v5;
  uint64_t v6;
  BOOL v8;

  v5 = (_TUIIdentifierNumberWithUUID *)a3;
  if (self == v5)
  {
    v8 = 1;
  }
  else
  {
    v6 = objc_opt_class(_TUIIdentifierNumberWithUUID, v4);
    v8 = (objc_opt_isKindOfClass(v5, v6) & 1) != 0
      && self->_value == v5->_value
      && *(_QWORD *)self->_uuid == *(_QWORD *)v5->_uuid
      && *(_QWORD *)&self->_uuid[8] == *(_QWORD *)&v5->_uuid[8];
  }

  return v8;
}

- (id)tui_identifierToString
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_uuid);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%lu"), v4, self->_value));

  return v5;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v10[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIIdentifierMap describeForDebuggingIdentifierIndex:package:](TUIIdentifierMap, "describeForDebuggingIdentifierIndex:package:", self->_value, v4));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  return v8;
}

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  return 0;
}

- (id)tui_identifierByAppendingString:(id)a3
{
  return 0;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  return 0;
}

- (id)tui_identifierUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_uuid);
}

@end
