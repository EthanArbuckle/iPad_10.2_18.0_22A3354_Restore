@implementation PLMigrationServiceOptions

- (PLMigrationServiceOptions)init
{
  PLMigrationServiceOptions *v2;
  void *v3;
  uint64_t v4;
  NSString *clientBundleId;
  void *v6;
  uint64_t v7;
  NSString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLMigrationServiceOptions;
  v2 = -[PLMigrationServiceOptions init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    clientBundleId = v2->_clientBundleId;
    v2->_clientBundleId = (NSString *)v4;

    if (!v2->_clientBundleId)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v2->_clientBundleId;
      v2->_clientBundleId = (NSString *)v7;

    }
  }
  return v2;
}

- (PLMigrationServiceOptions)initWithCoder:(id)a3
{
  id v4;
  PLMigrationServiceOptions *v5;
  uint64_t v6;
  NSString *clientBundleId;
  void *v8;

  v4 = a3;
  v5 = -[PLMigrationServiceOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("clientBundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientBundleId = v5->_clientBundleId;
    v5->_clientBundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedDestinationName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMigrationServiceOptions setSuggestedDestinationName:](v5, "setSuggestedDestinationName:", v8);

    -[PLMigrationServiceOptions setOption:](v5, "setOption:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("option")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLMigrationServiceOptions clientBundleId](self, "clientBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("clientBundleId"));

  -[PLMigrationServiceOptions suggestedDestinationName](self, "suggestedDestinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("suggestedDestinationName"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[PLMigrationServiceOptions option](self, "option"), CFSTR("option"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PLMigrationServiceOptions clientBundleId](self, "clientBundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  -[PLMigrationServiceOptions suggestedDestinationName](self, "suggestedDestinationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedDestinationName:", v7);

  objc_msgSend(v4, "setOption:", -[PLMigrationServiceOptions option](self, "option"));
  return v4;
}

- (BOOL)isPMSOption:(unsigned __int16)a3
{
  return (-[PLMigrationServiceOptions option](self, "option") & a3) != 0;
}

- (id)nameForOption:(unsigned __int16)a3
{
  id result;

  if ((int)a3 > 15)
  {
    if ((int)a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("NotifyTask");
      if (a3 == 32)
        return CFSTR("CopyResources");
    }
    else
    {
      switch(a3)
      {
        case 0x40u:
          return CFSTR("PreserveProxies");
        case 0x80u:
          return CFSTR("CorruptedMigration");
        case 0x100u:
          return CFSTR("FailOnValidationErrors");
      }
    }
    return &stru_1E376D3F8;
  }
  else
  {
    result = CFSTR("None");
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        result = CFSTR("EnableMT");
        break;
      case 2u:
        result = CFSTR("Rebuild");
        break;
      case 4u:
        result = CFSTR("ResumeInterruptedMigration");
        break;
      case 8u:
        result = CFSTR("SilentMigration");
        break;
      default:
        return &stru_1E376D3F8;
    }
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)PLMigrationServiceOptions;
  -[PLMigrationServiceOptions description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMigrationServiceOptions clientBundleId](self, "clientBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMigrationServiceOptions suggestedDestinationName](self, "suggestedDestinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ clientBundleId=%@ suggestedDestinationName=%@ options[%d]={"), v4, v5, v6, -[PLMigrationServiceOptions option](self, "option"));

  if (-[PLMigrationServiceOptions option](self, "option"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (-[PLMigrationServiceOptions isPMSOption:](self, "isPMSOption:", (unsigned __int16)(1 << v7)))
      {
        if ((v8 & 1) != 0)
          objc_msgSend(v3, "appendFormat:", CFSTR(","));
        -[PLMigrationServiceOptions nameForOption:](self, "nameForOption:", (unsigned __int16)(1 << v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);

        v8 = 1;
      }
      ++v7;
    }
    while (v7 != 9);
    objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  }
  else
  {
    -[PLMigrationServiceOptions nameForOption:](self, "nameForOption:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@}"), v10);

  }
  return v3;
}

- (NSString)clientBundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)suggestedDestinationName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSuggestedDestinationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unsigned)option
{
  return self->_option;
}

- (void)setOption:(unsigned __int16)a3
{
  self->_option = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDestinationName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
