@implementation SVXDeactivationContext

- (SVXDeactivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 clientInfo:(id)a6 userInfo:(id)a7 options:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SVXDeactivationContext *v18;
  SVXDeactivationContext *v19;
  uint64_t v20;
  SVXButtonEvent *buttonEvent;
  uint64_t v22;
  SVXClientInfo *clientInfo;
  uint64_t v24;
  NSDictionary *userInfo;
  uint64_t v26;
  SVXDeactivationOptions *options;
  objc_super v29;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SVXDeactivationContext;
  v18 = -[SVXDeactivationContext init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_source = a3;
    v18->_timestamp = a4;
    v20 = objc_msgSend(v14, "copy");
    buttonEvent = v19->_buttonEvent;
    v19->_buttonEvent = (SVXButtonEvent *)v20;

    v22 = objc_msgSend(v15, "copy");
    clientInfo = v19->_clientInfo;
    v19->_clientInfo = (SVXClientInfo *)v22;

    v24 = objc_msgSend(v16, "copy");
    userInfo = v19->_userInfo;
    v19->_userInfo = (NSDictionary *)v24;

    v26 = objc_msgSend(v17, "copy");
    options = v19->_options;
    v19->_options = (SVXDeactivationOptions *)v26;

  }
  return v19;
}

- (id)description
{
  return -[SVXDeactivationContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t source;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXDeactivationContext;
  -[SVXDeactivationContext description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  if (source > 5)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24BF00[source];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {source = %@, timestamp = %llu, buttonEvent = %@, clientInfo = %@, userInfo = %@, options = %@}"), v5, v8, self->_timestamp, self->_buttonEvent, self->_clientInfo, self->_userInfo, self->_options);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_source);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[SVXButtonEvent hash](self->_buttonEvent, "hash");
  v8 = v7 ^ -[SVXClientInfo hash](self->_clientInfo, "hash");
  v9 = v8 ^ -[NSDictionary hash](self->_userInfo, "hash");
  v10 = v6 ^ v9 ^ -[SVXDeactivationOptions hash](self->_options, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeactivationContext *v4;
  SVXDeactivationContext *v5;
  int64_t source;
  unint64_t timestamp;
  SVXButtonEvent *v8;
  SVXButtonEvent *buttonEvent;
  SVXClientInfo *v10;
  SVXClientInfo *clientInfo;
  NSDictionary *v12;
  NSDictionary *userInfo;
  SVXDeactivationOptions *v14;
  SVXDeactivationOptions *options;
  BOOL v16;

  v4 = (SVXDeactivationContext *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      source = self->_source;
      if (source == -[SVXDeactivationContext source](v5, "source")
        && (timestamp = self->_timestamp, timestamp == -[SVXDeactivationContext timestamp](v5, "timestamp")))
      {
        -[SVXDeactivationContext buttonEvent](v5, "buttonEvent");
        v8 = (SVXButtonEvent *)objc_claimAutoreleasedReturnValue();
        buttonEvent = self->_buttonEvent;
        if (buttonEvent == v8 || -[SVXButtonEvent isEqual:](buttonEvent, "isEqual:", v8))
        {
          -[SVXDeactivationContext clientInfo](v5, "clientInfo");
          v10 = (SVXClientInfo *)objc_claimAutoreleasedReturnValue();
          clientInfo = self->_clientInfo;
          if (clientInfo == v10 || -[SVXClientInfo isEqual:](clientInfo, "isEqual:", v10))
          {
            -[SVXDeactivationContext userInfo](v5, "userInfo");
            v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            userInfo = self->_userInfo;
            if (userInfo == v12 || -[NSDictionary isEqual:](userInfo, "isEqual:", v12))
            {
              -[SVXDeactivationContext options](v5, "options");
              v14 = (SVXDeactivationOptions *)objc_claimAutoreleasedReturnValue();
              options = self->_options;
              v16 = options == v14 || -[SVXDeactivationOptions isEqual:](options, "isEqual:", v14);

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (SVXDeactivationContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  SVXDeactivationContext *v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationContext::source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationContext::timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationContext::buttonEvent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationContext::clientInfo"));
  v6 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = (void *)v6;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("SVXDeactivationContext::userInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationContext::options"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](self, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", v25, v24, v23, v22, v17, v18);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t source;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  source = self->_source;
  v8 = a3;
  objc_msgSend(v4, "numberWithInteger:", source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SVXDeactivationContext::source"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("SVXDeactivationContext::timestamp"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_buttonEvent, CFSTR("SVXDeactivationContext::buttonEvent"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_clientInfo, CFSTR("SVXDeactivationContext::clientInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_userInfo, CFSTR("SVXDeactivationContext::userInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_options, CFSTR("SVXDeactivationContext::options"));

}

- (int64_t)source
{
  return self->_source;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SVXButtonEvent)buttonEvent
{
  return self->_buttonEvent;
}

- (SVXClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (SVXDeactivationOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeactivationContextMutation *);
  _SVXDeactivationContextMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeactivationContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeactivationContextMutation initWithBaseModel:]([_SVXDeactivationContextMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeactivationContextMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeactivationContext copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeactivationContextMutation *);
  _SVXDeactivationContextMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeactivationContextMutation *))a3;
  v4 = objc_alloc_init(_SVXDeactivationContextMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeactivationContextMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
