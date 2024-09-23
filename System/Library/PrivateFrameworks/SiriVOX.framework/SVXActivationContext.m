@implementation SVXActivationContext

- (SVXActivationContext)initWithSource:(int64_t)a3 timestamp:(unint64_t)a4 buttonEvent:(id)a5 systemEvent:(id)a6 clientInfo:(id)a7 requestInfo:(id)a8 userInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SVXActivationContext *v20;
  SVXActivationContext *v21;
  uint64_t v22;
  SVXButtonEvent *buttonEvent;
  uint64_t v24;
  SVXSystemEvent *systemEvent;
  uint64_t v26;
  SVXClientInfo *clientInfo;
  uint64_t v28;
  AFRequestInfo *requestInfo;
  uint64_t v30;
  NSDictionary *userInfo;
  objc_super v33;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SVXActivationContext;
  v20 = -[SVXActivationContext init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_source = a3;
    v20->_timestamp = a4;
    v22 = objc_msgSend(v15, "copy");
    buttonEvent = v21->_buttonEvent;
    v21->_buttonEvent = (SVXButtonEvent *)v22;

    v24 = objc_msgSend(v16, "copy");
    systemEvent = v21->_systemEvent;
    v21->_systemEvent = (SVXSystemEvent *)v24;

    v26 = objc_msgSend(v17, "copy");
    clientInfo = v21->_clientInfo;
    v21->_clientInfo = (SVXClientInfo *)v26;

    v28 = objc_msgSend(v18, "copy");
    requestInfo = v21->_requestInfo;
    v21->_requestInfo = (AFRequestInfo *)v28;

    v30 = objc_msgSend(v19, "copy");
    userInfo = v21->_userInfo;
    v21->_userInfo = (NSDictionary *)v30;

  }
  return v21;
}

- (id)description
{
  return -[SVXActivationContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
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
  v11.super_class = (Class)SVXActivationContext;
  -[SVXActivationContext description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  if (source > 9)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24D798[source];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {source = %@, timestamp = %llu, buttonEvent = %@, systemEvent = %@, clientInfo = %@, requestInfo = %@, userInfo = %@}"), v5, v8, self->_timestamp, self->_buttonEvent, self->_systemEvent, self->_clientInfo, self->_requestInfo, self->_userInfo);

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
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_source);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[SVXButtonEvent hash](self->_buttonEvent, "hash");
  v8 = v7 ^ -[SVXSystemEvent hash](self->_systemEvent, "hash");
  v9 = v8 ^ -[SVXClientInfo hash](self->_clientInfo, "hash");
  v10 = v6 ^ v9 ^ -[AFRequestInfo hash](self->_requestInfo, "hash");
  v11 = v10 ^ -[NSDictionary hash](self->_userInfo, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SVXActivationContext *v4;
  SVXActivationContext *v5;
  int64_t source;
  unint64_t timestamp;
  SVXButtonEvent *v8;
  SVXButtonEvent *buttonEvent;
  SVXSystemEvent *v10;
  SVXSystemEvent *systemEvent;
  SVXClientInfo *v12;
  SVXClientInfo *clientInfo;
  AFRequestInfo *v14;
  AFRequestInfo *requestInfo;
  NSDictionary *v16;
  NSDictionary *userInfo;
  BOOL v18;

  v4 = (SVXActivationContext *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      source = self->_source;
      if (source == -[SVXActivationContext source](v5, "source")
        && (timestamp = self->_timestamp, timestamp == -[SVXActivationContext timestamp](v5, "timestamp")))
      {
        -[SVXActivationContext buttonEvent](v5, "buttonEvent");
        v8 = (SVXButtonEvent *)objc_claimAutoreleasedReturnValue();
        buttonEvent = self->_buttonEvent;
        if (buttonEvent == v8 || -[SVXButtonEvent isEqual:](buttonEvent, "isEqual:", v8))
        {
          -[SVXActivationContext systemEvent](v5, "systemEvent");
          v10 = (SVXSystemEvent *)objc_claimAutoreleasedReturnValue();
          systemEvent = self->_systemEvent;
          if (systemEvent == v10 || -[SVXSystemEvent isEqual:](systemEvent, "isEqual:", v10))
          {
            -[SVXActivationContext clientInfo](v5, "clientInfo");
            v12 = (SVXClientInfo *)objc_claimAutoreleasedReturnValue();
            clientInfo = self->_clientInfo;
            if (clientInfo == v12 || -[SVXClientInfo isEqual:](clientInfo, "isEqual:", v12))
            {
              -[SVXActivationContext requestInfo](v5, "requestInfo");
              v14 = (AFRequestInfo *)objc_claimAutoreleasedReturnValue();
              requestInfo = self->_requestInfo;
              if (requestInfo == v14 || -[AFRequestInfo isEqual:](requestInfo, "isEqual:", v14))
              {
                -[SVXActivationContext userInfo](v5, "userInfo");
                v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                userInfo = self->_userInfo;
                v18 = userInfo == v16 || -[NSDictionary isEqual:](userInfo, "isEqual:", v16);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (SVXActivationContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SVXActivationContext *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::buttonEvent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::systemEvent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::clientInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXActivationContext::requestInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v19, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("SVXActivationContext::userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](self, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", v25, v24, v23, v22, v21, v6, v16);
  return v17;
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
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SVXActivationContext::source"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("SVXActivationContext::timestamp"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_buttonEvent, CFSTR("SVXActivationContext::buttonEvent"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_systemEvent, CFSTR("SVXActivationContext::systemEvent"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_clientInfo, CFSTR("SVXActivationContext::clientInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_requestInfo, CFSTR("SVXActivationContext::requestInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_userInfo, CFSTR("SVXActivationContext::userInfo"));

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

- (SVXSystemEvent)systemEvent
{
  return self->_systemEvent;
}

- (SVXClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_systemEvent, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXActivationContextMutation *);
  _SVXActivationContextMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXActivationContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXActivationContextMutation initWithBaseModel:]([_SVXActivationContextMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXActivationContextMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXActivationContext copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXActivationContextMutation *);
  _SVXActivationContextMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXActivationContextMutation *))a3;
  v4 = objc_alloc_init(_SVXActivationContextMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXActivationContextMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
