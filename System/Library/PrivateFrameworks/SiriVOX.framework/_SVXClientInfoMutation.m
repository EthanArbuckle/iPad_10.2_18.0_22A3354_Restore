@implementation _SVXClientInfoMutation

- (_SVXClientInfoMutation)init
{
  return -[_SVXClientInfoMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXClientInfoMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXClientInfoMutation *v6;
  _SVXClientInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXClientInfoMutation;
  v6 = -[_SVXClientInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXClientInfo *baseModel;
  SVXClientInfo *v4;
  SVXClientInfo *v5;
  uint64_t processIdentifier;
  NSString *v7;
  NSString *v8;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXClientInfo initWithProcessIdentifier:processName:]([SVXClientInfo alloc], "initWithProcessIdentifier:processName:", self->_processIdentifier, self->_processName);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      processIdentifier = self->_processIdentifier;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_8;
    }
    else
    {
      processIdentifier = -[SVXClientInfo processIdentifier](baseModel, "processIdentifier");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_processName;
LABEL_11:
        v8 = v7;
        v5 = -[SVXClientInfo initWithProcessIdentifier:processName:]([SVXClientInfo alloc], "initWithProcessIdentifier:processName:", processIdentifier, v7);

        return v5;
      }
    }
    -[SVXClientInfo processName](self->_baseModel, "processName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = (SVXClientInfo *)-[SVXClientInfo copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
