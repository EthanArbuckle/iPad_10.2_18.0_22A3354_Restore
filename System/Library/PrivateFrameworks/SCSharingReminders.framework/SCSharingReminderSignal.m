@implementation SCSharingReminderSignal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SCSharingReminderSignal sharingIdentifier](self, "sharingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SCSharingReminderSignal sharingType](self, "sharingType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sharingType"));

  -[SCSharingReminderSignal signalType](self, "signalType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("signalType"));

}

- (SCSharingReminderSignal)initWithCoder:(id)a3
{
  id v4;
  SCSharingReminderSignal *v5;
  uint64_t v6;
  NSString *sharingIdentifier;
  uint64_t v8;
  NSString *sharingType;
  uint64_t v10;
  NSString *signalType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCSharingReminderSignal;
  v5 = -[SCSharingReminderSignal init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingType"));
    v8 = objc_claimAutoreleasedReturnValue();
    sharingType = v5->_sharingType;
    v5->_sharingType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signalType"));
    v10 = objc_claimAutoreleasedReturnValue();
    signalType = v5->_signalType;
    v5->_signalType = (NSString *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SCSharingReminderSignal *v4;
  SCSharingReminderSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (SCSharingReminderSignal *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCSharingReminderSignal sharingIdentifier](v5, "sharingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCSharingReminderSignal sharingIdentifier](self, "sharingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[SCSharingReminderSignal sharingType](v5, "sharingType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCSharingReminderSignal sharingType](self, "sharingType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[SCSharingReminderSignal signalType](v5, "signalType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminderSignal signalType](self, "signalType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

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
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Identifier: %@ Sharing type: %@ Signal type: %@"), self->_sharingIdentifier, self->_sharingType, self->_signalType);
}

- (NSString)signalType
{
  return self->_signalType;
}

- (void)setSignalType:(id)a3
{
  objc_storeStrong((id *)&self->_signalType, a3);
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (void)setSharingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingIdentifier, a3);
}

- (NSString)sharingType
{
  return self->_sharingType;
}

- (void)setSharingType:(id)a3
{
  objc_storeStrong((id *)&self->_sharingType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingType, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
  objc_storeStrong((id *)&self->_signalType, 0);
}

@end
