@implementation NDStatusMonitorClientHolder

- (NDStatusMonitorClientHolder)initWithClient:(id)a3 identifier:(unint64_t)a4
{
  id v7;
  NDStatusMonitorClientHolder *v8;
  NDStatusMonitorClientHolder *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NDStatusMonitorClientHolder;
  v8 = -[NDStatusMonitorClientHolder init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_client, a3);
    v9->_identifier = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_identifier ^ (unint64_t)self->_client;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(NDStatusMonitorClientHolder);
  v6 = (objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && self->_client == (NDStatusMonitorClient *)v4[1]
    && self->_identifier == v4[2];

  return v6;
}

- (NDStatusMonitorClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
