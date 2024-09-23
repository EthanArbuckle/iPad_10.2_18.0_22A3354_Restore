@implementation SUInstallOptions

- (SUInstallOptions)init
{
  SUInstallOptions *v2;
  SUInstallOptions *v3;
  NSString *clientName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUInstallOptions;
  v2 = -[SUOptionsBase init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_darkBoot = 0;
    v2->_required = 0;
    v2->_managed = 0;
    v2->_skipActivationCheck = 0;
    v2->_automaticInstallation = 0;
    clientName = v2->_clientName;
    v2->_clientName = (NSString *)CFSTR("com.apple.softwareupdateservicesd");

    v3->_ignorableConstraints = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUInstallOptions)initWithCoder:(id)a3
{
  id v4;
  SUInstallOptions *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUInstallOptions;
  v5 = -[SUOptionsBase init](&v8, sel_init);
  if (v5)
  {
    -[SUInstallOptions setDarkBoot:](v5, "setDarkBoot:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("darkBootKey")));
    -[SUInstallOptions setRequired:](v5, "setRequired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiredKey")));
    -[SUInstallOptions setManaged:](v5, "setManaged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("managedKey")));
    -[SUInstallOptions setSkipActivationCheck:](v5, "setSkipActivationCheck:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipActivationCheck")));
    -[SUInstallOptions setAutomaticInstallation:](v5, "setAutomaticInstallation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticInstallation")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstallOptions setClientName:](v5, "setClientName:", v6);

    -[SUInstallOptions setIgnorableConstraints:](v5, "setIgnorableConstraints:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ignorableConstraintsKey")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 darkBoot;
  id v5;

  darkBoot = self->_darkBoot;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", darkBoot, CFSTR("darkBootKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_required, CFSTR("requiredKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_managed, CFSTR("managedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_skipActivationCheck, CFSTR("skipActivationCheck"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_automaticInstallation, CFSTR("automaticInstallation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("clientNameKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ignorableConstraints, CFSTR("ignorableConstraintsKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDarkBoot:", self->_darkBoot);
  objc_msgSend(v4, "setRequired:", self->_required);
  objc_msgSend(v4, "setManaged:", self->_managed);
  objc_msgSend(v4, "setSkipActivationCheck:", self->_skipActivationCheck);
  objc_msgSend(v4, "setAutomaticInstallation:", self->_automaticInstallation);
  objc_msgSend(v4, "setClientName:", self->_clientName);
  objc_msgSend(v4, "setIgnorableConstraints:", self->_ignorableConstraints);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUInstallOptions clientName](self, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("NO");
  if (-[SUInstallOptions isDarkBoot](self, "isDarkBoot"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUInstallOptions isManaged](self, "isManaged"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUInstallOptions skipActivationCheck](self, "skipActivationCheck"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUInstallOptions automaticInstallation](self, "automaticInstallation"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[SUInstallOptions isRequired](self, "isRequired"))
    v5 = CFSTR("YES");
  SUStringFromInstallationConstraints(-[SUInstallOptions ignorableConstraints](self, "ignorableConstraints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            ClientName: %@\n            DarkBoot: %@\n            isManaged: %@\n            skipActivationCheck: %@\n            automaticInstallation: %@\n            Installation required: %@\n            IgnorableConstraints: %@\n"), v4, v6, v7, v8, v9, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isDarkBoot
{
  return self->_darkBoot;
}

- (void)setDarkBoot:(BOOL)a3
{
  self->_darkBoot = a3;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)skipActivationCheck
{
  return self->_skipActivationCheck;
}

- (void)setSkipActivationCheck:(BOOL)a3
{
  self->_skipActivationCheck = a3;
}

- (BOOL)automaticInstallation
{
  return self->_automaticInstallation;
}

- (void)setAutomaticInstallation:(BOOL)a3
{
  self->_automaticInstallation = a3;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (unint64_t)ignorableConstraints
{
  return self->_ignorableConstraints;
}

- (void)setIgnorableConstraints:(unint64_t)a3
{
  self->_ignorableConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
