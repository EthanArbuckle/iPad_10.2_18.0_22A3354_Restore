@implementation PKFeatureFailureCollection

- (PKFeatureFailureCollection)initWithArray:(id)a3
{
  id v4;
  PKFeatureFailureCollection *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *failuresByFeature;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  PKFeatureFailure *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  PKFeatureFailureCollection *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v24.receiver = self;
    v24.super_class = (Class)PKFeatureFailureCollection;
    v5 = -[PKFeatureFailureCollection init](&v24, sel_init);
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      failuresByFeature = v5->_failuresByFeature;
      v5->_failuresByFeature = v6;

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[PKFeatureFailure initWithDictionary:]([PKFeatureFailure alloc], "initWithDictionary:", v13);
              v15 = -[PKFeatureFailure featureIdentifier](v14, "featureIdentifier");
              v16 = v5->_failuresByFeature;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v14, v17);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v10);
      }

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)errorForFeature:(unint64_t)a3
{
  NSMutableDictionary *failuresByFeature;
  void *v4;
  void *v5;
  void *v6;

  failuresByFeature = self->_failuresByFeature;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](failuresByFeature, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "errorRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureFailureCollection)initWithCoder:(id)a3
{
  id v4;
  PKFeatureFailureCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *failuresByFeature;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFeatureFailureCollection;
  v5 = -[PKFeatureFailureCollection init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("failuresByFeature"));
    v10 = objc_claimAutoreleasedReturnValue();
    failuresByFeature = v5->_failuresByFeature;
    v5->_failuresByFeature = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_failuresByFeature, CFSTR("failuresByFeature"));
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_failuresByFeature);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char isKindOfClass;
  char v6;
  NSMutableDictionary *failuresByFeature;
  NSMutableDictionary *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    failuresByFeature = self->_failuresByFeature;
    v8 = (NSMutableDictionary *)v4[1];
    if (failuresByFeature && v8)
      v6 = -[NSMutableDictionary isEqual:](failuresByFeature, "isEqual:");
    else
      v6 = failuresByFeature == v8;
  }

  return v6;
}

- (id)description
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_failuresByFeature;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        PKFeatureIdentifierToString(objc_msgSend(v9, "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_failuresByFeature, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("'%@' -> %@"), v10, v11, (_QWORD)v14);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failuresByFeature, 0);
}

@end
