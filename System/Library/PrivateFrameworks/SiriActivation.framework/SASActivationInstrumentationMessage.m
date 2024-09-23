@implementation SASActivationInstrumentationMessage

- (SASActivationInstrumentationMessage)initWithEvent:(id)a3 activationEventIdentifier:(id)a4 machAbsoluteTime:(unint64_t)a5
{
  id v9;
  id v10;
  SASActivationInstrumentationMessage *v11;
  SASActivationInstrumentationMessage *v12;
  uint64_t v13;
  NSUUID *activationEventIdentifier;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SASActivationInstrumentationMessage;
  v11 = -[SASActivationInstrumentationMessage init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_event, a3);
    v13 = objc_msgSend(v10, "copy");
    activationEventIdentifier = v12->_activationEventIdentifier;
    v12->_activationEventIdentifier = (NSUUID *)v13;

    v12->_machAbsoluteTime = a5;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)SASActivationInstrumentationMessage;
  -[SASActivationInstrumentationMessage description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ACTVSchemaACTVClientEvent description](self->_event, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("event = %@"), v6);
  v19[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSUUID description](self->_activationEventIdentifier, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("activationEventIdentifier = %@"), v9);
  v19[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_machAbsoluteTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("machAbsoluteTime = %@"), v12);
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v15);

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[ACTVSchemaACTVClientEvent hash](self->_event, "hash");
  v4 = -[NSUUID hash](self->_activationEventIdentifier, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_machAbsoluteTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SASActivationInstrumentationMessage *v4;
  SASActivationInstrumentationMessage *v5;
  unint64_t machAbsoluteTime;
  ACTVSchemaACTVClientEvent *v7;
  ACTVSchemaACTVClientEvent *event;
  NSUUID *v9;
  NSUUID *activationEventIdentifier;
  BOOL v11;

  v4 = (SASActivationInstrumentationMessage *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      machAbsoluteTime = self->_machAbsoluteTime;
      if (machAbsoluteTime == -[SASActivationInstrumentationMessage machAbsoluteTime](v5, "machAbsoluteTime"))
      {
        -[SASActivationInstrumentationMessage event](v5, "event");
        v7 = (ACTVSchemaACTVClientEvent *)objc_claimAutoreleasedReturnValue();
        event = self->_event;
        if (event == v7 || -[ACTVSchemaACTVClientEvent isEqual:](event, "isEqual:", v7))
        {
          -[SASActivationInstrumentationMessage activationEventIdentifier](v5, "activationEventIdentifier");
          v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          activationEventIdentifier = self->_activationEventIdentifier;
          v11 = activationEventIdentifier == v9
             || -[NSUUID isEqual:](activationEventIdentifier, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASActivationInstrumentationMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SASActivationInstrumentationMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASActivationInstrumentationMessage::event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASActivationInstrumentationMessage::activationEventIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASActivationInstrumentationMessage::machAbsoluteTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  v9 = -[SASActivationInstrumentationMessage initWithEvent:activationEventIdentifier:machAbsoluteTime:](self, "initWithEvent:activationEventIdentifier:machAbsoluteTime:", v5, v6, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  ACTVSchemaACTVClientEvent *event;
  id v5;
  id v6;

  event = self->_event;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", event, CFSTR("SASActivationInstrumentationMessage::event"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationEventIdentifier, CFSTR("SASActivationInstrumentationMessage::activationEventIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_machAbsoluteTime);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SASActivationInstrumentationMessage::machAbsoluteTime"));

}

- (ACTVSchemaACTVClientEvent)event
{
  return self->_event;
}

- (NSUUID)activationEventIdentifier
{
  return self->_activationEventIdentifier;
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEventIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
