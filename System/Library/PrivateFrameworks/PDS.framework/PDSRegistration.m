@implementation PDSRegistration

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[PDSRegistration topicString](self, "topicString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSRegistration qualifierString](self, "qualifierString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; topic = %@; qual = \"%@\"; env = %d>"),
    v4,
    self,
    v5,
    v6,
    -[PDSRegistration pushEnvironment](self, "pushEnvironment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)topicString
{
  return self->_topicString;
}

- (NSString)qualifierString
{
  return self->_qualifierString;
}

- (char)pushEnvironment
{
  return self->_pushEnvironment;
}

- (PDSRegistration)initWithTopic:(id)a3 qualifier:(id)a4 pushEnvironment:(char)a5
{
  unsigned int v5;
  id v10;
  id v11;
  void *v12;
  PDSRegistration *v13;
  PDSRegistration *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v5 = a5;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistration.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topic"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistration.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("qualifier"));

LABEL_3:
  if (v5 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistration.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pushEnvironment == PDSPushEnvironmentSandbox || pushEnvironment == PDSPushEnvironmentProduction"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PDSRegistration;
  v13 = -[PDSRegistration init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_topicString, a3);
    objc_storeStrong((id *)&v14->_qualifierString, a4);
    v14->_pushEnvironment = v5;
  }

  return v14;
}

- (PDSRegistration)initWithTopic:(id)a3 pushEnvironment:(char)a4
{
  return -[PDSRegistration initWithTopic:qualifier:pushEnvironment:](self, "initWithTopic:qualifier:pushEnvironment:", a3, &stru_24CFD06D0, a4);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PDSRegistration isEqualToRegistration:](self, "isEqualToRegistration:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[PDSRegistration topicString](self, "topicString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PDSRegistration qualifierString](self, "qualifierString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[PDSRegistration pushEnvironment](self, "pushEnvironment");

  return v7;
}

- (BOOL)isEqualToRegistration:(id)a3
{
  PDSRegistration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = (PDSRegistration *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    -[PDSRegistration qualifierString](self, "qualifierString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSRegistration qualifierString](v4, "qualifierString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[PDSRegistration topicString](self, "topicString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSRegistration topicString](v4, "topicString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = -[PDSRegistration pushEnvironment](self, "pushEnvironment");
        v10 = v9 == -[PDSRegistration pushEnvironment](v4, "pushEnvironment");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PDSRegistration topicString](self, "topicString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("topic"));

  -[PDSRegistration qualifierString](self, "qualifierString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("qualifier"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[PDSRegistration pushEnvironment](self, "pushEnvironment"), CFSTR("env"));
}

- (PDSRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  PDSRegistration *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qualifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("env"));

  v8 = -[PDSRegistration initWithTopic:qualifier:pushEnvironment:](self, "initWithTopic:qualifier:pushEnvironment:", v6, v5, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifierString, 0);
  objc_storeStrong((id *)&self->_topicString, 0);
}

@end
