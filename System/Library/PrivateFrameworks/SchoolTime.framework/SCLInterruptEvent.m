@implementation SCLInterruptEvent

- (SCLInterruptEvent)init
{
  return (SCLInterruptEvent *)-[SCLInterruptEvent _initWithEvent:](self, "_initWithEvent:", 0);
}

- (id)_initWithEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "type");
    v7 = objc_msgSend(v5, "urgency");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v5, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SCLInterruptEvent _initWithType:urgency:sender:](self, "_initWithType:urgency:sender:", v6, v7, v8);

  return v9;
}

- (id)_initWithType:(unint64_t)a3 urgency:(unint64_t)a4 sender:(id)a5
{
  id v8;
  SCLInterruptEvent *v9;
  SCLInterruptEvent *v10;
  uint64_t v11;
  SCLContact *sender;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SCLInterruptEvent;
  v9 = -[SCLInterruptEvent init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_urgency = a4;
    v11 = objc_msgSend(v8, "copy");
    sender = v10->_sender;
    v10->_sender = (SCLContact *)v11;

  }
  return v10;
}

- (BOOL)shouldAlwaysInterrupt
{
  return self->_urgency == 1;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[SCLInterruptEvent type](self, "type");
  v4 = -[SCLInterruptEvent urgency](self, "urgency") ^ v3;
  -[SCLInterruptEvent sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SCLInterruptEvent *v4;
  SCLInterruptEvent *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (SCLInterruptEvent *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SCLInterruptEvent type](self, "type");
      if (v6 == -[SCLInterruptEvent type](v5, "type")
        && (v7 = -[SCLInterruptEvent urgency](self, "urgency"), v7 == -[SCLInterruptEvent urgency](v5, "urgency")))
      {
        -[SCLInterruptEvent sender](self, "sender");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLInterruptEvent sender](v5, "sender");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          v12 = 1;
        }
        else
        {
          -[SCLInterruptEvent sender](self, "sender");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCLInterruptEvent sender](v5, "sender");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SCLInterruptEvent type](self, "type");
  v5 = CFSTR("<unknown>");
  if (v4 <= 2)
    v5 = off_24E29C168[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  v6 = -[SCLInterruptEvent urgency](self, "urgency");
  v7 = CFSTR("critical");
  if (v6 != 1)
    v7 = CFSTR("<unknown>");
  if (v6)
    v8 = v7;
  else
    v8 = CFSTR("default");
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("urgency"));
  -[SCLInterruptEvent sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("sender"), 1);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLInterruptEvent _initWithEvent:]([SCLInterruptEvent alloc], "_initWithEvent:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLInterruptEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SCLInterruptEvent *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urgency"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SCLInterruptEvent _initWithType:urgency:sender:](self, "_initWithType:urgency:sender:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLInterruptEvent type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLInterruptEvent urgency](self, "urgency"), CFSTR("urgency"));
  -[SCLInterruptEvent sender](self, "sender");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sender"));

}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)urgency
{
  return self->_urgency;
}

- (SCLContact)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
