@implementation _SVXDeviceSetupFlowMutation

- (_SVXDeviceSetupFlowMutation)init
{
  return -[_SVXDeviceSetupFlowMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceSetupFlowMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceSetupFlowMutation *v6;
  _SVXDeviceSetupFlowMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowMutation;
  v6 = -[_SVXDeviceSetupFlowMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setScenes:(id)a3
{
  objc_storeStrong((id *)&self->_scenes, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXDeviceSetupFlow *baseModel;
  SVXDeviceSetupFlow *v4;
  SVXDeviceSetupFlow *v5;
  NSString *v6;
  NSString *v7;
  NSArray *v8;
  NSArray *v9;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXDeviceSetupFlow initWithIdentifier:scenes:]([SVXDeviceSetupFlow alloc], "initWithIdentifier:scenes:", self->_identifier, self->_scenes);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXDeviceSetupFlow *)-[SVXDeviceSetupFlow copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_identifier;
  }
  else
  {
    -[SVXDeviceSetupFlow identifier](baseModel, "identifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v8 = self->_scenes;
  }
  else
  {
    -[SVXDeviceSetupFlow scenes](self->_baseModel, "scenes");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v5 = -[SVXDeviceSetupFlow initWithIdentifier:scenes:]([SVXDeviceSetupFlow alloc], "initWithIdentifier:scenes:", v7, v8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
