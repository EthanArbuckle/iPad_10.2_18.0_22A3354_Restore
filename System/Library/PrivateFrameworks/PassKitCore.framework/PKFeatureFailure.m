@implementation PKFeatureFailure

- (PKFeatureFailure)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureFailure *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *errorCode;
  uint64_t v11;
  NSString *localizedTitle;
  uint64_t v13;
  NSString *localizedDescription;
  uint64_t v15;
  NSString *serverDescription;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKFeatureFailure;
  v5 = -[PKFeatureFailure init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("featureIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_featureIdentifier = PKFeatureIdentifierFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("errorCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    else
      objc_msgSend(v4, "PKNumberForKey:", CFSTR("errorCode"));
    v9 = objc_claimAutoreleasedReturnValue();
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("debugDescription"));
    v15 = objc_claimAutoreleasedReturnValue();
    serverDescription = v5->_serverDescription;
    v5->_serverDescription = (NSString *)v15;

  }
  return v5;
}

- (id)errorRepresentation
{
  id v3;
  void *v4;
  NSString *localizedTitle;
  NSString *localizedDescription;
  id v7;
  NSInteger v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedTitle, *MEMORY[0x1E0CB2D50]);
  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v4, "setObject:forKey:", localizedDescription, *MEMORY[0x1E0CB2D68]);
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v8 = -[NSNumber integerValue](self->_errorCode, "integerValue");
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("PKAccountErrorDomain"), v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureFailure)initWithCoder:(id)a3
{
  id v4;
  PKFeatureFailure *v5;
  uint64_t v6;
  NSNumber *errorCode;
  uint64_t v8;
  NSString *localizedTitle;
  uint64_t v10;
  NSString *localizedDescription;
  uint64_t v12;
  NSString *serverDescription;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKFeatureFailure;
  v5 = -[PKFeatureFailure init](&v15, sel_init);
  if (v5)
  {
    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    serverDescription = v5->_serverDescription;
    v5->_serverDescription = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t featureIdentifier;
  id v5;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorCode, CFSTR("errorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverDescription, CFSTR("serverDescription"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_errorCode);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_serverDescription);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_featureIdentifier - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  NSNumber *errorCode;
  NSNumber *v9;
  NSString *localizedTitle;
  NSString *v11;
  NSString *localizedDescription;
  NSString *v13;
  NSString *serverDescription;
  NSString *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6 || self->_featureIdentifier != v6[1])
    goto LABEL_23;
  errorCode = self->_errorCode;
  v9 = (NSNumber *)v7[2];
  if (errorCode && v9)
  {
    if ((-[NSNumber isEqual:](errorCode, "isEqual:") & 1) == 0)
      goto LABEL_23;
  }
  else if (errorCode != v9)
  {
    goto LABEL_23;
  }
  localizedTitle = self->_localizedTitle;
  v11 = (NSString *)v7[3];
  if (localizedTitle && v11)
  {
    if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0)
      goto LABEL_23;
  }
  else if (localizedTitle != v11)
  {
    goto LABEL_23;
  }
  localizedDescription = self->_localizedDescription;
  v13 = (NSString *)v7[4];
  if (!localizedDescription || !v13)
  {
    if (localizedDescription == v13)
      goto LABEL_19;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  if ((-[NSString isEqual:](localizedDescription, "isEqual:") & 1) == 0)
    goto LABEL_23;
LABEL_19:
  serverDescription = self->_serverDescription;
  v15 = (NSString *)v7[5];
  if (serverDescription && v15)
    v16 = -[NSString isEqual:](serverDescription, "isEqual:");
  else
    v16 = serverDescription == v15;
LABEL_24:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKFeatureIdentifierToString(self->_featureIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("featureIdentifier: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("errorCode: '%@'; "), self->_errorCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedTitle: '%@'; "), self->_localizedTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDescription: '%@'; "), self->_localizedDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("serverDescription: '%@'; "), self->_serverDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)serverDescription
{
  return self->_serverDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDescription, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
