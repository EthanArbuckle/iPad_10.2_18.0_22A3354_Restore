@implementation _PSCandidate

- (_PSCandidate)initWithDomainId:(id)a3 derivedIntentId:(id)a4 bundleId:(id)a5 recipientsId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PSCandidate *v14;
  uint64_t v15;
  NSString *domainId;
  uint64_t v17;
  NSString *derivedIntentId;
  uint64_t v19;
  NSString *bundleId;
  uint64_t v21;
  NSString *recipientsId;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_PSCandidate;
  v14 = -[_PSCandidate init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    domainId = v14->_domainId;
    v14->_domainId = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    derivedIntentId = v14->_derivedIntentId;
    v14->_derivedIntentId = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    recipientsId = v14->_recipientsId;
    v14->_recipientsId = (NSString *)v21;

    -[_PSCandidate populateIsSystemBundleId](v14, "populateIsSystemBundleId");
  }

  return v14;
}

- (_PSCandidate)initWithCoder:(id)a3
{
  id v4;
  _PSCandidate *v5;
  uint64_t v6;
  NSString *domainId;
  uint64_t v8;
  NSString *derivedIntentId;
  uint64_t v10;
  NSString *bundleId;
  uint64_t v12;
  NSString *recipientsId;
  _PSCandidate *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PSCandidate;
  v5 = -[_PSCandidate init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainId"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainId = v5->_domainId;
    v5->_domainId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("derivedIntentId"));
    v8 = objc_claimAutoreleasedReturnValue();
    derivedIntentId = v5->_derivedIntentId;
    v5->_derivedIntentId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientsId"));
    v12 = objc_claimAutoreleasedReturnValue();
    recipientsId = v5->_recipientsId;
    v5->_recipientsId = (NSString *)v12;

    -[_PSCandidate populateIsSystemBundleId](v5, "populateIsSystemBundleId");
    v14 = v5;
  }

  return v5;
}

- (void)populateIsSystemBundleId
{
  id v3;

  +[_PSConstants systemBundleIds](_PSConstants, "systemBundleIds");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_isSystemBundleId = objc_msgSend(v3, "containsObject:", self->_bundleId);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainId;
  id v5;

  domainId = self->_domainId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainId, CFSTR("domainId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_derivedIntentId, CFSTR("derivedIntentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientsId, CFSTR("recipientsId"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_PSCandidate candidateIdentifier](self, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@_%@"), v4, self->_bundleId);

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_domainId, "hash");
  v4 = -[NSString hash](self->_derivedIntentId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_recipientsId, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_bundleId, "hash") - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  _PSCandidate *v4;
  _PSCandidate *v5;
  NSString *domainId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *derivedIntentId;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *recipientsId;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSString *v22;
  NSString *v23;

  v4 = (_PSCandidate *)a3;
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
      domainId = self->_domainId;
      v7 = v5->_domainId;
      if (domainId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = domainId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_15;
      }
      derivedIntentId = self->_derivedIntentId;
      v13 = v5->_derivedIntentId;
      if (derivedIntentId == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = derivedIntentId;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_15;
      }
      recipientsId = self->_recipientsId;
      v18 = v5->_recipientsId;
      if (recipientsId == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = recipientsId;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
        {
LABEL_15:
          v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      v22 = self->_bundleId;
      v23 = v22;
      if (v22 == v5->_bundleId)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v22, "isEqual:");

      goto LABEL_21;
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (BOOL)hasCandidateIdentifier
{
  return self->_domainId || self->_derivedIntentId || self->_recipientsId != 0;
}

- (id)candidateIdentifier
{
  NSString *derivedIntentId;

  if (!self->_isSystemBundleId)
  {
    derivedIntentId = self->_derivedIntentId;
    if (derivedIntentId)
      return derivedIntentId;
    goto LABEL_3;
  }
  derivedIntentId = self->_domainId;
  if (!derivedIntentId)
LABEL_3:
    derivedIntentId = self->_recipientsId;
  return derivedIntentId;
}

- (id)candidateForDeduping
{
  _BOOL4 isSystemBundleId;
  _PSCandidate *v4;
  NSString *derivedIntentId;
  NSString *domainId;
  _PSCandidate *v7;
  _PSCandidate *v8;

  isSystemBundleId = self->_isSystemBundleId;
  v4 = [_PSCandidate alloc];
  if (isSystemBundleId)
  {
    derivedIntentId = 0;
    domainId = self->_domainId;
  }
  else
  {
    domainId = 0;
    derivedIntentId = self->_derivedIntentId;
  }
  v7 = -[_PSCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:](v4, "initWithDomainId:derivedIntentId:bundleId:recipientsId:", domainId, derivedIntentId, self->_bundleId, self->_recipientsId);
  if (-[_PSCandidate isEqual:](v7, "isEqual:", self))
  {
    v8 = self;

    v7 = v8;
  }
  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[_PSCandidate candidateIdentifier](self, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)selfCandidate
{
  if (selfCandidate__pasOnceToken2 != -1)
    dispatch_once(&selfCandidate__pasOnceToken2, &__block_literal_global_8);
  return (id)selfCandidate__pasExprOnceResult;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)derivedIntentId
{
  return self->_derivedIntentId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)recipientsId
{
  return self->_recipientsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientsId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_derivedIntentId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
}

@end
