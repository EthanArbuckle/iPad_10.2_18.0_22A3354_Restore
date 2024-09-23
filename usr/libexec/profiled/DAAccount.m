@implementation DAAccount

- (BOOL)isConsideredTheSame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount emailAddress](self, "emailAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAddress"));
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount host](self, "host"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    if (!objc_msgSend(v7, "isEqualToString:", v8)
      || (v9 = kDAExchangeOAuthSupportedKey,
          v10 = -[DAAccount accountBoolPropertyForKey:](self, "accountBoolPropertyForKey:", kDAExchangeOAuthSupportedKey), v10 != objc_msgSend(v4, "accountBoolPropertyForKey:", v9)))
    {
      v11 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v12 = kDAExchangeOAuthURI;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount accountPropertyForKey:](self, "accountPropertyForKey:", kDAExchangeOAuthURI));
    if (v13
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountPropertyForKey:", v12))) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount accountPropertyForKey:](self, "accountPropertyForKey:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountPropertyForKey:", v12));
      if (!objc_msgSend(v14, "isEqual:", v15))
      {
        v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v24 = v15;
      v27 = v14;
      v16 = 1;
    }
    else
    {
      v25 = 0;
      v16 = 0;
    }
    v17 = kDAExchangeTokenRequestURI;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount accountPropertyForKey:](self, "accountPropertyForKey:", kDAExchangeTokenRequestURI));
    if (v18 || (v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountPropertyForKey:", v17))) != 0)
    {
      v26 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DAAccount accountPropertyForKey:](self, "accountPropertyForKey:", v17));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountPropertyForKey:", v17));
      v11 = objc_msgSend(v19, "isEqual:", v20);

      if (v18)
      {

        v14 = v27;
        if (v26)
        {
          v15 = v24;
          goto LABEL_20;
        }
LABEL_21:
        if (!v13)

        goto LABEL_24;
      }
      v14 = v27;
      LOBYTE(v16) = v26;
      v21 = (void *)v23;
    }
    else
    {
      v21 = 0;
      v11 = 1;
      v14 = v27;
    }

    v15 = v24;
    if ((v16 & 1) != 0)
      goto LABEL_20;
    goto LABEL_21;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

@end
