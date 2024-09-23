@implementation ProxyAgent

+ (id)agentType
{
  return CFSTR("ProxyAgent");
}

- (ProxyAgent)initWithParameters:(id)a3
{
  id v4;
  ProxyAgent *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSString *internalAgentName;
  NSString *agentDescription;
  id v13;
  uint64_t v14;
  NSUUID *agentUUID;
  uint64_t v16;
  NSUUID *v17;
  objc_super v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ProxyAgent;
  v5 = -[ConfigAgent initWithParameters:](&v20, "initWithParameters:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("EntityName")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("AgentSubType")));
    v8 = objc_msgSend((id)objc_opt_class(v5), "agentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v9, v6));
    internalAgentName = v5->_internalAgentName;
    v5->_internalAgentName = (NSString *)v10;

    v5->_internalAgentSubType = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");
    v5->_internalAgentType = 1;
    objc_storeStrong((id *)&v5->agentDescription, v5->_internalAgentName);
    agentDescription = v5->agentDescription;
    v19.receiver = v5;
    v19.super_class = (Class)ProxyAgent;
    v13 = -[ConfigAgent createUUIDForName:](&v19, "createUUIDForName:", agentDescription);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    agentUUID = v5->agentUUID;
    v5->agentUUID = (NSUUID *)v14;

    if (!v5->agentUUID)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v17 = v5->agentUUID;
      v5->agentUUID = (NSUUID *)v16;

    }
  }

  return v5;
}

- (unint64_t)getAgentType
{
  return self->_internalAgentType;
}

- (id)getAgentName
{
  return self->_internalAgentName;
}

- (unint64_t)getAgentSubType
{
  return self->_internalAgentSubType;
}

- (id)getAgentUUID
{
  return self->agentUUID;
}

- (id)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)internalAgentType
{
  return self->_internalAgentType;
}

- (void)setInternalAgentType:(unint64_t)a3
{
  self->_internalAgentType = a3;
}

- (NSString)internalAgentName
{
  return self->_internalAgentName;
}

- (void)setInternalAgentName:(id)a3
{
  objc_storeStrong((id *)&self->_internalAgentName, a3);
}

- (unint64_t)internalAgentSubType
{
  return self->_internalAgentSubType;
}

- (void)setInternalAgentSubType:(unint64_t)a3
{
  self->_internalAgentSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAgentName, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
