@implementation SVXButtonEvent

- (SVXButtonEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4
{
  SVXButtonEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVXButtonEvent;
  result = -[SVXButtonEvent init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_timestamp = a4;
  }
  return result;
}

- (id)description
{
  return -[SVXButtonEvent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t type;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXButtonEvent;
  -[SVXButtonEvent description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24DBF0[type];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {type = %@, timestamp = %llu}"), v5, v8, self->_timestamp);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXButtonEvent *v4;
  SVXButtonEvent *v5;
  int64_t type;
  unint64_t timestamp;
  BOOL v8;

  v4 = (SVXButtonEvent *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[SVXButtonEvent type](v5, "type"))
      {
        timestamp = self->_timestamp;
        v8 = timestamp == -[SVXButtonEvent timestamp](v5, "timestamp");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (SVXButtonEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXButtonEvent::type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXButtonEvent::timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  return -[SVXButtonEvent initWithType:timestamp:](self, "initWithType:timestamp:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXButtonEvent::type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXButtonEvent::timestamp"));

}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXButtonEventMutation *);
  _SVXButtonEventMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXButtonEventMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXButtonEventMutation initWithBaseModel:]([_SVXButtonEventMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXButtonEventMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXButtonEvent copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXButtonEventMutation *);
  _SVXButtonEventMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXButtonEventMutation *))a3;
  v4 = objc_alloc_init(_SVXButtonEventMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXButtonEventMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
