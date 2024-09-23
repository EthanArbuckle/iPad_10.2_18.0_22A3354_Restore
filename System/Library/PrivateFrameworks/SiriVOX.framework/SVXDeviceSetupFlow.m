@implementation SVXDeviceSetupFlow

- (SVXDeviceSetupFlow)initWithIdentifier:(id)a3 scenes:(id)a4
{
  id v6;
  id v7;
  SVXDeviceSetupFlow *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSArray *scenes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXDeviceSetupFlow;
  v8 = -[SVXDeviceSetupFlow init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    scenes = v8->_scenes;
    v8->_scenes = (NSArray *)v11;

  }
  return v8;
}

- (id)description
{
  return -[SVXDeviceSetupFlow _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXDeviceSetupFlow;
  -[SVXDeviceSetupFlow description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, scenes = %@}"), v5, self->_identifier, self->_scenes);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSArray hash](self->_scenes, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceSetupFlow *v4;
  SVXDeviceSetupFlow *v5;
  NSString *v6;
  NSString *identifier;
  NSArray *v8;
  NSArray *scenes;
  BOOL v10;

  v4 = (SVXDeviceSetupFlow *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SVXDeviceSetupFlow identifier](v5, "identifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      if (identifier == v6 || -[NSString isEqual:](identifier, "isEqual:", v6))
      {
        -[SVXDeviceSetupFlow scenes](v5, "scenes");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        scenes = self->_scenes;
        v10 = scenes == v8 || -[NSArray isEqual:](scenes, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (SVXDeviceSetupFlow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SVXDeviceSetupFlow *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlow::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SVXDeviceSetupFlow::scenes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SVXDeviceSetupFlow initWithIdentifier:scenes:](self, "initWithIdentifier:scenes:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("SVXDeviceSetupFlow::identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scenes, CFSTR("SVXDeviceSetupFlow::scenes"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)scenes
{
  return self->_scenes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceSetupFlowMutation *);
  _SVXDeviceSetupFlowMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceSetupFlowMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceSetupFlowMutation initWithBaseModel:]([_SVXDeviceSetupFlowMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceSetupFlowMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceSetupFlow copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceSetupFlowMutation *);
  _SVXDeviceSetupFlowMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceSetupFlowMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceSetupFlowMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceSetupFlowMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
