@implementation _REMCKIdentifierAccountIdentifierPair

- (_REMCKIdentifierAccountIdentifierPair)initWithCkIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _REMCKIdentifierAccountIdentifierPair *v10;
  _REMCKIdentifierAccountIdentifierPair *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
    goto LABEL_9;
  }
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    sub_100684C24(v13, v14, v15, v16, v17, v18, v19, v20);

  if (!v9)
  {
LABEL_9:
    v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      sub_100684BB4(v21, v22, v23, v24, v25, v26, v27, v28);

  }
LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_REMCKIdentifierAccountIdentifierPair;
  v10 = -[_REMCKIdentifierAccountIdentifierPair init](&v29, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ckIdentifier, a3);
    objc_storeStrong((id *)&v11->_accountIdentifier, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _REMCKIdentifierAccountIdentifierPair *v4;
  _REMCKIdentifierAccountIdentifierPair *v5;
  _REMCKIdentifierAccountIdentifierPair *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (_REMCKIdentifierAccountIdentifierPair *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    v7 = objc_opt_class(_REMCKIdentifierAccountIdentifierPair);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](self, "ckIdentifier"));
      v9 = objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](v6, "ckIdentifier"));
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](self, "ckIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](v6, "ckIdentifier"));
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_5;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](self, "accountIdentifier"));
      v16 = objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](v6, "accountIdentifier"));
      if (v15 == (void *)v16)
      {
        v14 = 1;
        v17 = v15;
      }
      else
      {
        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](self, "accountIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](v6, "accountIdentifier"));
        v14 = objc_msgSend(v18, "isEqual:", v19);

      }
      goto LABEL_12;
    }
LABEL_5:
    v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](self, "ckIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](self, "accountIdentifier"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair ckIdentifier](self, "ckIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_REMCKIdentifierAccountIdentifierPair accountIdentifier](self, "accountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(ckIdentifier: %@, accountIdentifier: %@)"), v3, v4));

  return v5;
}

- (NSString)ckIdentifier
{
  return self->_ckIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_ckIdentifier, 0);
}

@end
