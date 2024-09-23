@implementation SVXDeviceSetupContext

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3
{
  return -[SVXDeviceSetupContext initWithTimestamp:options:](self, "initWithTimestamp:options:", a3, 0);
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 presentsAlternativeFlowWhenStoreAccountIsUnavailable:(BOOL)a4
{
  return -[SVXDeviceSetupContext initWithTimestamp:options:](self, "initWithTimestamp:options:", a3, 0);
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4
{
  return -[SVXDeviceSetupContext initWithTimestamp:options:flowScene:](self, "initWithTimestamp:options:flowScene:", a3, a4, 0);
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5
{
  return -[SVXDeviceSetupContext initWithTimestamp:options:flowScene:beginDate:endDate:](self, "initWithTimestamp:options:flowScene:beginDate:endDate:", a3, a4, a5, 0, 0);
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5 beginDate:(id)a6 endDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SVXDeviceSetupContext *v16;
  SVXDeviceSetupContext *v17;
  uint64_t v18;
  SVXDeviceSetupOptions *options;
  uint64_t v20;
  SVXDeviceSetupFlowScene *flowScene;
  uint64_t v22;
  NSDate *beginDate;
  uint64_t v24;
  NSDate *endDate;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SVXDeviceSetupContext;
  v16 = -[SVXDeviceSetupContext init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_timestamp = a3;
    v18 = objc_msgSend(v12, "copy");
    options = v17->_options;
    v17->_options = (SVXDeviceSetupOptions *)v18;

    v20 = objc_msgSend(v13, "copy");
    flowScene = v17->_flowScene;
    v17->_flowScene = (SVXDeviceSetupFlowScene *)v20;

    v22 = objc_msgSend(v14, "copy");
    beginDate = v17->_beginDate;
    v17->_beginDate = (NSDate *)v22;

    v24 = objc_msgSend(v15, "copy");
    endDate = v17->_endDate;
    v17->_endDate = (NSDate *)v24;

  }
  return v17;
}

- (id)description
{
  return -[SVXDeviceSetupContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXDeviceSetupContext;
  -[SVXDeviceSetupContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timestamp = %llu, options = %@, flowScene = %@, beginDate = %@, endDate = %@}"), v5, self->_timestamp, self->_options, self->_flowScene, self->_beginDate, self->_endDate);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SVXDeviceSetupOptions hash](self->_options, "hash");
  v6 = v5 ^ -[SVXDeviceSetupFlowScene hash](self->_flowScene, "hash");
  v7 = v6 ^ -[NSDate hash](self->_beginDate, "hash") ^ v4;
  v8 = v7 ^ -[NSDate hash](self->_endDate, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceSetupContext *v4;
  SVXDeviceSetupContext *v5;
  unint64_t timestamp;
  SVXDeviceSetupOptions *v7;
  SVXDeviceSetupOptions *options;
  SVXDeviceSetupFlowScene *v9;
  SVXDeviceSetupFlowScene *flowScene;
  NSDate *v11;
  NSDate *beginDate;
  NSDate *v13;
  NSDate *endDate;
  BOOL v15;

  v4 = (SVXDeviceSetupContext *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timestamp = self->_timestamp;
      if (timestamp == -[SVXDeviceSetupContext timestamp](v5, "timestamp"))
      {
        -[SVXDeviceSetupContext options](v5, "options");
        v7 = (SVXDeviceSetupOptions *)objc_claimAutoreleasedReturnValue();
        options = self->_options;
        if (options == v7 || -[SVXDeviceSetupOptions isEqual:](options, "isEqual:", v7))
        {
          -[SVXDeviceSetupContext flowScene](v5, "flowScene");
          v9 = (SVXDeviceSetupFlowScene *)objc_claimAutoreleasedReturnValue();
          flowScene = self->_flowScene;
          if (flowScene == v9 || -[SVXDeviceSetupFlowScene isEqual:](flowScene, "isEqual:", v9))
          {
            -[SVXDeviceSetupContext beginDate](v5, "beginDate");
            v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
            beginDate = self->_beginDate;
            if (beginDate == v11 || -[NSDate isEqual:](beginDate, "isEqual:", v11))
            {
              -[SVXDeviceSetupContext endDate](v5, "endDate");
              v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
              endDate = self->_endDate;
              v15 = endDate == v13 || -[NSDate isEqual:](endDate, "isEqual:", v13);

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (SVXDeviceSetupContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SVXDeviceSetupContext *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupContext::timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupContext::options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupContext::flowScene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupContext::beginDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupContext::endDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SVXDeviceSetupContext initWithTimestamp:options:flowScene:beginDate:endDate:](self, "initWithTimestamp:options:flowScene:beginDate:endDate:", v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  timestamp = self->_timestamp;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SVXDeviceSetupContext::timestamp"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_options, CFSTR("SVXDeviceSetupContext::options"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_flowScene, CFSTR("SVXDeviceSetupContext::flowScene"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_beginDate, CFSTR("SVXDeviceSetupContext::beginDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_endDate, CFSTR("SVXDeviceSetupContext::endDate"));

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SVXDeviceSetupOptions)options
{
  return self->_options;
}

- (SVXDeviceSetupFlowScene)flowScene
{
  return self->_flowScene;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_flowScene, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceSetupContextMutation *);
  _SVXDeviceSetupContextMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceSetupContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceSetupContextMutation initWithBaseModel:]([_SVXDeviceSetupContextMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceSetupContextMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceSetupContext copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceSetupContextMutation *);
  _SVXDeviceSetupContextMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceSetupContextMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceSetupContextMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceSetupContextMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
