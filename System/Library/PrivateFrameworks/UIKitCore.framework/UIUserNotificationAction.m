@implementation UIUserNotificationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  id v6;
  void *v7;
  NSString *title;
  void *v9;
  unsigned int v10;
  unint64_t behavior;
  unsigned int v12;
  NSDictionary *parameters;
  void *v14;
  _BOOL4 v15;
  unint64_t activationMode;
  int authenticationRequired;
  int destructive;
  int v19;
  BOOL v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    v6 = v4;
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v7);

    title = self->_title;
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = identifier & -[NSString isEqualToString:](title, "isEqualToString:", v9);

    behavior = self->_behavior;
    if (behavior == objc_msgSend(v6, "behavior"))
      v12 = v10;
    else
      v12 = 0;
    parameters = self->_parameters;
    objc_msgSend(v6, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12 & -[NSDictionary isEqualToDictionary:](parameters, "isEqualToDictionary:", v14);

    activationMode = self->_activationMode;
    if (activationMode != objc_msgSend(v6, "activationMode"))
      LOBYTE(v15) = 0;
    authenticationRequired = self->_authenticationRequired;
    if (authenticationRequired != objc_msgSend(v6, "isAuthenticationRequired"))
      LOBYTE(v15) = 0;
    destructive = self->_destructive;
    v19 = objc_msgSend(v6, "isDestructive");

    v20 = destructive == v19 && v15;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIUserNotificationActionBehavior)behavior
{
  return self->_behavior;
}

- (UIUserNotificationActivationMode)activationMode
{
  return self->_activationMode;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_activationMode = a3;
}

- (UIUserNotificationAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIUserNotificationAction;
  return -[UIUserNotificationAction init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 behavior:(unint64_t)a5 parameters:(id)a6 activationMode:(unint64_t)a7 isAuthenticationRequired:(BOOL)a8 isDestructive:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  UIUserNotificationAction *v18;
  UIUserNotificationAction *v19;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = -[UIUserNotificationAction init](self, "init");
  v19 = v18;
  if (v18)
    UIUserNotificationActionCommonSetup(v18, v15, v16, a5, v17, a7, a8, a9);

  return v19;
}

- (UIUserNotificationAction)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("kBehaviorKey"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kParametersKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("kActivationModeKey"));
  LOBYTE(v9) = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("kIsAuthenticationRequiredKey"));
  v13 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("kIsDestructiveKey"));

  UIUserNotificationActionCommonSetup(self, v5, v6, v7, v11, v12, (char)v9, v13);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("kIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("kTitleKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_behavior, CFSTR("kBehaviorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("kParametersKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activationMode, CFSTR("kActivationModeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authenticationRequired, CFSTR("kIsAuthenticationRequiredKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_destructive, CFSTR("kIsDestructiveKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  UIMutableUserNotificationAction *v4;
  uint64_t v6;

  v4 = [UIMutableUserNotificationAction alloc];
  LOBYTE(v6) = self->_destructive;
  return -[UIUserNotificationAction initWithIdentifier:title:behavior:parameters:activationMode:isAuthenticationRequired:isDestructive:](v4, "initWithIdentifier:title:behavior:parameters:activationMode:isAuthenticationRequired:isDestructive:", self->_identifier, self->_title, self->_behavior, self->_parameters, self->_activationMode, self->_authenticationRequired, v6);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t behavior_low;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  behavior_low = SLODWORD(self->_behavior);
  return v4 ^ behavior_low ^ -[NSDictionary hash](self->_parameters, "hash") ^ self->_activationMode ^ self->_authenticationRequired ^ self->_destructive;
}

- (NSString)activationModeString
{
  __CFString *activationModeString;
  unint64_t activationMode;

  activationModeString = (__CFString *)self->_activationModeString;
  if (!activationModeString)
  {
    activationMode = self->_activationMode;
    if (activationMode == 1)
    {
      activationModeString = CFSTR("UIUserNotificationActivationModeBackground");
    }
    else
    {
      if (activationMode)
      {
        activationModeString = 0;
        return (NSString *)activationModeString;
      }
      activationModeString = CFSTR("UIUserNotificationActivationModeForeground");
    }
    self->_activationModeString = &activationModeString->isa;
  }
  return (NSString *)activationModeString;
}

- (NSString)behaviorString
{
  unint64_t behavior;
  __CFString *v3;

  if (!self->_activationModeString)
  {
    behavior = self->_behavior;
    if (!behavior)
    {
      v3 = CFSTR("UIUserNotificationActionBehaviorDefault");
      goto LABEL_6;
    }
    if (behavior == 1)
    {
      v3 = CFSTR("UIUserNotificationActionBehaviorTextInput");
LABEL_6:
      self->_behaviorString = &v3->isa;
    }
  }
  return self->_behaviorString;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  NSString *title;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  identifier = self->_identifier;
  title = self->_title;
  -[UIUserNotificationAction behaviorString](self, "behaviorString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUserNotificationAction activationModeString](self, "activationModeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary description](self->_parameters, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, title: %@, behavior: %@, activationMode: %@, isAuthenticationRequired:%@, isDestructive:%@, parameters: %@>"),
    v4,
    self,
    identifier,
    title,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)validatedAction
{
  UIUserNotificationAction *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  v3 = v2;
  if (!v2->_activationMode && !v2->_authenticationRequired)
  {
    v4 = -[UIUserNotificationAction copy](v2, "copy");

    *(_BYTE *)(v4 + 8) = 1;
    v3 = (void *)v4;
  }
  return v3;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
