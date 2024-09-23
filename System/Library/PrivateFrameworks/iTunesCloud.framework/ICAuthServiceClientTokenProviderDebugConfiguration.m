@implementation ICAuthServiceClientTokenProviderDebugConfiguration

- (ICAuthServiceClientTokenProviderDebugConfiguration)initWithCommandOption:(unint64_t)a3 allDSIDsShouldError:(BOOL)a4 allDSIDsShouldSucceed:(BOOL)a5 errorDSIDs:(id)a6
{
  id v11;
  ICAuthServiceClientTokenProviderDebugConfiguration *v12;
  ICAuthServiceClientTokenProviderDebugConfiguration *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ICAuthServiceClientTokenProviderDebugConfiguration;
  v12 = -[ICAuthServiceClientTokenProviderDebugConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_commandOption = a3;
    v12->_allDSIDsShouldError = a4;
    v12->_allDSIDsShouldSucceed = a5;
    objc_storeStrong((id *)&v12->_errorDSIDs, a6);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t commandOption;
  id v5;

  commandOption = self->_commandOption;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", commandOption, CFSTR("CommandOption"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allDSIDsShouldError, CFSTR("AllDSIDsShouldError"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allDSIDsShouldSucceed, CFSTR("AllDSIDsShouldSucceed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorDSIDs, CFSTR("ErrorDSIDs"));

}

- (ICAuthServiceClientTokenProviderDebugConfiguration)initWithCoder:(id)a3
{
  id v4;
  ICAuthServiceClientTokenProviderDebugConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *errorDSIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICAuthServiceClientTokenProviderDebugConfiguration;
  v5 = -[ICAuthServiceClientTokenProviderDebugConfiguration init](&v12, sel_init);
  if (v5)
  {
    v5->_commandOption = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CommandOption"));
    v5->_allDSIDsShouldError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllDSIDsShouldError"));
    v5->_allDSIDsShouldSucceed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllDSIDsShouldSucceed"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ErrorDSIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    errorDSIDs = v5->_errorDSIDs;
    v5->_errorDSIDs = (NSArray *)v9;

  }
  return v5;
}

- (unint64_t)commandOption
{
  return self->_commandOption;
}

- (BOOL)allDSIDsShouldError
{
  return self->_allDSIDsShouldError;
}

- (BOOL)allDSIDsShouldSucceed
{
  return self->_allDSIDsShouldSucceed;
}

- (NSArray)errorDSIDs
{
  return self->_errorDSIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDSIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
