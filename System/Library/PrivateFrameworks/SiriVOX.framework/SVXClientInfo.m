@implementation SVXClientInfo

- (SVXClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4
{
  id v6;
  SVXClientInfo *v7;
  SVXClientInfo *v8;
  uint64_t v9;
  NSString *processName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXClientInfo;
  v7 = -[SVXClientInfo init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_processIdentifier = a3;
    v9 = objc_msgSend(v6, "copy");
    processName = v8->_processName;
    v8->_processName = (NSString *)v9;

  }
  return v8;
}

- (id)description
{
  return -[SVXClientInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXClientInfo;
  -[SVXClientInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {processIdentifier = %d, processName = %@}"), v5, self->_processIdentifier, self->_processName);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_processIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_processName, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SVXClientInfo *v4;
  SVXClientInfo *v5;
  int processIdentifier;
  NSString *v7;
  NSString *processName;
  BOOL v9;

  v4 = (SVXClientInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      processIdentifier = self->_processIdentifier;
      if (processIdentifier == -[SVXClientInfo processIdentifier](v5, "processIdentifier"))
      {
        -[SVXClientInfo processName](v5, "processName");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        processName = self->_processName;
        v9 = processName == v7 || -[NSString isEqual:](processName, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SVXClientInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SVXClientInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXClientInfo::processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXClientInfo::processName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SVXClientInfo initWithProcessIdentifier:processName:](self, "initWithProcessIdentifier:processName:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t processIdentifier;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  processIdentifier = self->_processIdentifier;
  v7 = a3;
  objc_msgSend(v4, "numberWithInt:", processIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SVXClientInfo::processIdentifier"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_processName, CFSTR("SVXClientInfo::processName"));
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXClientInfoMutation *);
  _SVXClientInfoMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXClientInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXClientInfoMutation initWithBaseModel:]([_SVXClientInfoMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXClientInfoMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXClientInfo copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXClientInfoMutation *);
  _SVXClientInfoMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXClientInfoMutation *))a3;
  v4 = objc_alloc_init(_SVXClientInfoMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXClientInfoMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
