@implementation PKSecureElementApplet

+ (id)secureElementAppletWithInternalApplet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "packageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "lifecycleState");
  v8 = 0;
  if (v7 <= 14)
  {
    switch(v7)
    {
      case 1:
        v8 = 1;
        break;
      case 3:
        v8 = 3;
        break;
      case 7:
        v8 = 7;
        break;
    }
  }
  else if (v7 > 128)
  {
    if (v7 == 129)
    {
      v8 = 129;
    }
    else if (v7 == 130)
    {
      v8 = 130;
    }
  }
  else if (v7 == 15)
  {
    v8 = 15;
  }
  else if (v7 == 23)
  {
    v8 = 23;
  }
  if (objc_msgSend(v5, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:", v5, v6, v8, objc_msgSend(v4, "isGPLocked"), objc_msgSend(v4, "containsSubKeys"));
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "INVALID APPLET RECEIVED FROM NEARFIELD! Applet does not contain an identifier: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 lifecycleState:(unint64_t)a4
{
  return -[PKSecureElementApplet initWithIdentifier:packageIdentifier:lifecycleState:](self, "initWithIdentifier:packageIdentifier:lifecycleState:", a3, 0, a4);
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5
{
  return -[PKSecureElementApplet initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:](self, "initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:", a3, a4, a5, 0, 0);
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5 locked:(BOOL)a6 containsSubKeys:(BOOL)a7
{
  id v12;
  id v13;
  PKSecureElementApplet *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *packageIdentifier;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKSecureElementApplet;
  v14 = -[PKSecureElementApplet init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    packageIdentifier = v14->_packageIdentifier;
    v14->_packageIdentifier = (NSString *)v17;

    v14->_lifecycleState = a5;
    v14->_locked = a6;
    v14->_containsSubKeys = a7;
  }

  return v14;
}

- (id)jsonDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", self->_identifier, CFSTR("appletAid"));
  objc_msgSend(v3, "setObject:forKey:", self->_packageIdentifier, CFSTR("packageAid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lifecycleState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lifeCycleState"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementApplet)initWithCoder:(id)a3
{
  id v4;
  PKSecureElementApplet *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *packageIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSecureElementApplet;
  v5 = -[PKSecureElementApplet init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("packageIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    packageIdentifier = v5->_packageIdentifier;
    v5->_packageIdentifier = (NSString *)v8;

    v5->_lifecycleState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lifecycleState"));
    v5->_locked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("locked"));
    v5->_containsSubKeys = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsSubKeys"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageIdentifier, CFSTR("packageIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lifecycleState, CFSTR("lifecycleState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_locked, CFSTR("locked"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_containsSubKeys, CFSTR("containsSubKeys"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)packageIdentifier
{
  return self->_packageIdentifier;
}

- (unint64_t)lifecycleState
{
  return self->_lifecycleState;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)containsSubKeys
{
  return self->_containsSubKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
