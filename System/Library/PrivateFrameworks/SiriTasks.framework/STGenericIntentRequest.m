@implementation STGenericIntentRequest

- (STGenericIntentRequest)initWithAppIdentifier:(id)a3 intentString:(id)a4 utterance:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  STGenericIntentRequest *v14;
  uint64_t v15;
  NSString *appIdentifier;
  uint64_t v17;
  NSString *intentString;
  uint64_t v19;
  NSString *utterance;
  uint64_t v21;
  NSDictionary *info;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STGenericIntentRequest;
  v14 = -[AFSiriRequest init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    appIdentifier = v14->_appIdentifier;
    v14->_appIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    intentString = v14->_intentString;
    v14->_intentString = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    utterance = v14->_utterance;
    v14->_utterance = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    info = v14->_info;
    v14->_info = (NSDictionary *)v21;

    v14->__launchToForeground = 0;
  }

  return v14;
}

- (id)appIdentifier
{
  return self->_appIdentifier;
}

- (id)intentString
{
  return self->_intentString;
}

- (id)utterance
{
  return self->_utterance;
}

- (id)info
{
  return self->_info;
}

- (id)responseWithCode:(int64_t)a3
{
  id v4;

  if (a3)
  {
    v4 = -[AFSiriResponse _initWithRequest:]([STGenericIntentResponse alloc], "_initWithRequest:", self);
    objc_msgSend(v4, "setResponseCode:", a3);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
  }
  return v4;
}

- (BOOL)isForegroundLaunch
{
  return self->__launchToForeground;
}

- (BOOL)_makeAppFrontmost
{
  return self->__launchToForeground;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STGenericIntentRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentString, CFSTR("_intentString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_utterance, CFSTR("_utterance"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_info, CFSTR("_info"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__launchToForeground, CFSTR("__launchToForeground"));

}

- (STGenericIntentRequest)initWithCoder:(id)a3
{
  id v4;
  STGenericIntentRequest *v5;
  uint64_t v6;
  NSString *intentString;
  uint64_t v8;
  NSString *utterance;
  uint64_t v10;
  NSDictionary *info;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STGenericIntentRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentString"));
    v6 = objc_claimAutoreleasedReturnValue();
    intentString = v5->_intentString;
    v5->_intentString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_utterance"));
    v8 = objc_claimAutoreleasedReturnValue();
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_info"));
    v10 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSDictionary *)v10;

    v5->__launchToForeground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__launchToForeground"));
  }

  return v5;
}

- (BOOL)_launchToForeground
{
  return self->__launchToForeground;
}

- (void)_setLaunchToForeground:(BOOL)a3
{
  self->__launchToForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_intentString, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_af_analyticsContextDescription
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STGenericIntentRequest;
  -[AFSiriRequest _af_analyticsContextDescription](&v10, sel__af_analyticsContextDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGenericIntentRequest appIdentifier](self, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BE08B80]);
  v5 = -[STGenericIntentRequest _launchToForeground](self, "_launchToForeground");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("backgroundLaunch"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[STGenericIntentRequest _launchToForeground](self, "_launchToForeground"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("presentsResults"));

  -[STGenericIntentRequest intentString](self, "intentString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("intentString"));

  return v3;
}

@end
