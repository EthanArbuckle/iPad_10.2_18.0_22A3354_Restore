@implementation DNSAgent

+ (id)agentType
{
  return CFSTR("DNSAgent");
}

- (DNSAgent)initWithParameters:(id)a3
{
  id v4;
  DNSAgent *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSString *internalAgentName;
  NSString *agentDescription;
  id v14;
  uint64_t v15;
  NSUUID *agentUUID;
  uint64_t v17;
  NSUUID *v18;
  objc_super v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DNSAgent;
  v5 = -[ConfigAgent initWithParameters:](&v21, "initWithParameters:", v4);
  if (!v5)
    goto LABEL_10;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("EntityName")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("AgentSubType")));
  v8 = objc_msgSend((id)objc_opt_class(v5), "agentType");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v7, "unsignedIntegerValue") == (id)4)
  {
    v10 = CFSTR("DNSAgent(m)");
LABEL_6:

    v9 = (__CFString *)v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "unsignedIntegerValue") == (id)5)
  {
    v10 = CFSTR("DNSAgent(p)");
    goto LABEL_6;
  }
LABEL_7:
  v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v9, v6));
  internalAgentName = v5->_internalAgentName;
  v5->_internalAgentName = (NSString *)v11;

  v5->_internalAgentSubType = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");
  v5->_internalAgentType = 2;
  objc_storeStrong((id *)&v5->agentDescription, v5->_internalAgentName);
  agentDescription = v5->agentDescription;
  v20.receiver = v5;
  v20.super_class = (Class)DNSAgent;
  v14 = -[ConfigAgent createUUIDForName:](&v20, "createUUIDForName:", agentDescription);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  agentUUID = v5->agentUUID;
  v5->agentUUID = (NSUUID *)v15;

  if (!v5->agentUUID)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v18 = v5->agentUUID;
    v5->agentUUID = (NSUUID *)v17;

  }
LABEL_10:

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
