@implementation _RWIDriverInterfaceInfo

- (_RWIDriverInterfaceInfo)initWithConfiguration:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  _RWIDriverInterfaceInfo *v8;
  uint64_t v9;
  RWIDriverConfiguration *configuration;
  uint64_t v11;
  RWIDriverState *state;
  _RWIDriverInterfaceInfo *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_RWIDriverInterfaceInfo;
  v8 = -[_RWIDriverInterfaceInfo init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (RWIDriverConfiguration *)v9;

    objc_storeStrong((id *)&v8->_connection, a4);
    +[RWIDriverState inactive](RWIDriverState, "inactive");
    v11 = objc_claimAutoreleasedReturnValue();
    state = v8->_state;
    v8->_state = (RWIDriverState *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)identifier
{
  return -[RWIDriverConfiguration driverIdentifier](self->_configuration, "driverIdentifier");
}

- (NSString)name
{
  return -[RWIDriverConfiguration driverName](self->_configuration, "driverName");
}

- (NSString)version
{
  return -[RWIDriverConfiguration driverVersion](self->_configuration, "driverVersion");
}

- (BOOL)isActive
{
  return -[RWIDriverState isActive](self->_state, "isActive");
}

- (id)dictionaryRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RWIDriverConfiguration encodeToPayload:](self->_configuration, "encodeToPayload:", v3);
  -[RWIDriverState encodeToPayload:](self->_state, "encodeToPayload:", v3);
  return v3;
}

- (void)updateDriverState:(id)a3
{
  RWIDriverState *v5;
  RWIDriverState **p_state;
  RWIDriverState *state;
  RWIDriverState *v8;

  v5 = (RWIDriverState *)a3;
  state = self->_state;
  p_state = &self->_state;
  if (state != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_state, a3);
    v5 = v8;
  }

}

- (_RWIRelayClientConnection)connection
{
  return self->_connection;
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
