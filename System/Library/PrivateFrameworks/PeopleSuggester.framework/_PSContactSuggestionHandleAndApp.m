@implementation _PSContactSuggestionHandleAndApp

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_handle, "hash");
  v4 = -[NSString hash](self->_appBundleId, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_interactionMechanism, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _PSContactSuggestionHandleAndApp *v4;
  _PSContactSuggestionHandleAndApp *v5;
  _PSContactSuggestionHandleAndApp *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (_PSContactSuggestionHandleAndApp *)a3;
  v5 = v4;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[_PSContactSuggestionHandleAndApp appBundleId](self, "appBundleId");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          -[_PSContactSuggestionHandleAndApp handle](self, "handle");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v20 = 0;
LABEL_23:

            goto LABEL_24;
          }
          v10 = (void *)v9;
          -[_PSContactSuggestionHandleAndApp interactionMechanism](self, "interactionMechanism");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_17;
          v12 = (void *)v11;
          -[_PSContactSuggestionHandleAndApp appBundleId](v6, "appBundleId");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v20 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v14 = (void *)v13;
          -[_PSContactSuggestionHandleAndApp handle](v6, "handle");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_19;
          v16 = (void *)v15;
          -[_PSContactSuggestionHandleAndApp interactionMechanism](v6, "interactionMechanism");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[_PSContactSuggestionHandleAndApp appBundleId](self, "appBundleId");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSContactSuggestionHandleAndApp appBundleId](v6, "appBundleId");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "isEqualToString:", v10))
            {
              -[_PSContactSuggestionHandleAndApp handle](self, "handle");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSContactSuggestionHandleAndApp handle](v6, "handle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqualToString:", v14))
              {
                -[_PSContactSuggestionHandleAndApp interactionMechanism](self, "interactionMechanism");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactSuggestionHandleAndApp interactionMechanism](v6, "interactionMechanism");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

LABEL_20:
                goto LABEL_21;
              }
LABEL_19:
              v20 = 0;
              goto LABEL_20;
            }
LABEL_17:
            v20 = 0;
LABEL_22:

            goto LABEL_23;
          }
        }
        v20 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    v20 = 0;
  }
LABEL_25:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PSContactSuggestionHandleAndApp *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[_PSContactSuggestionHandleAndApp init](+[_PSContactSuggestionHandleAndApp allocWithZone:](_PSContactSuggestionHandleAndApp, "allocWithZone:", a3), "init");
  -[_PSContactSuggestionHandleAndApp handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggestionHandleAndApp setHandle:](v4, "setHandle:", v5);

  -[_PSContactSuggestionHandleAndApp appBundleId](self, "appBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggestionHandleAndApp setAppBundleId:](v4, "setAppBundleId:", v6);

  -[_PSContactSuggestionHandleAndApp interactionMechanism](self, "interactionMechanism");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggestionHandleAndApp setInteractionMechanism:](v4, "setInteractionMechanism:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSContactSuggestionHandleAndApp)initWithCoder:(id)a3
{
  id v4;
  _PSContactSuggestionHandleAndApp *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *appBundleId;
  uint64_t v10;
  NSNumber *interactionMechanism;
  _PSContactSuggestionHandleAndApp *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PSContactSuggestionHandleAndApp;
  v5 = -[_PSContactSuggestionHandleAndApp init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v8 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionMechanism"));
    v10 = objc_claimAutoreleasedReturnValue();
    interactionMechanism = v5->_interactionMechanism;
    v5->_interactionMechanism = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleId, CFSTR("appBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionMechanism, CFSTR("interactionMechanism"));

}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)interactionMechanism
{
  return self->_interactionMechanism;
}

- (void)setInteractionMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionMechanism, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
