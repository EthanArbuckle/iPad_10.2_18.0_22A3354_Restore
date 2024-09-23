@implementation TPSURLActionComponents

- (unint64_t)actionType
{
  return self->_actionType;
}

+ (id)componentsWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

- (TPSURLActionComponents)initWithURL:(id)a3
{
  id v4;
  TPSURLActionComponents *v5;
  TPSURLActionComponents *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSURLActionComponents;
  v5 = -[TPSURLActionComponents init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TPSURLActionComponents _parseURL:](v5, "_parseURL:", v4);

  return v6;
}

- (void)_parseURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  TPSURLActionComponents *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  TPSURLActionComponents *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSURLActionComponents setActionType:](self, "setActionType:", 0);
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("tips"));

  if (!v8)
    goto LABEL_37;
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("open"));

  if (!v10)
    goto LABEL_37;
  v35 = v4;
  v36 = self;
  v33 = v6;
  v34 = v5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v6, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v12)
  {
    v14 = 0;
    v37 = 0;
    v15 = 0;
    goto LABEL_21;
  }
  v13 = v12;
  v14 = 0;
  v37 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v39 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("type"));

      if (v20)
      {
        objc_msgSend(v18, "value");
        v21 = v15;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v18, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("url"));

        if (v23)
        {
          objc_msgSend(v18, "value");
          v21 = v14;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v18, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("bundleId"));

          if (v25)
          {
            objc_msgSend(v18, "value");
            v21 = v37;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v18, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("identifier"));

            if (!v27)
              continue;
            objc_msgSend(v18, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPSURLActionComponents setIdentifier:](v36, "setIdentifier:", v21);
          }
        }
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v13);
LABEL_21:

  if (objc_msgSend(v14, "length"))
  {
    -[TPSURLActionComponents setActionType:](v36, "setActionType:", objc_msgSend((id)objc_opt_class(), "_actionTypeForString:", v15));
    v28 = v37;
    if (-[TPSURLActionComponents actionType](v36, "actionType"))
      goto LABEL_23;
    goto LABEL_36;
  }
  v28 = v37;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("userGuide")))
  {
    -[TPSURLActionComponents setActionType:](v36, "setActionType:", 9);
    -[TPSURLActionComponents setBundleID:](v36, "setBundleID:", v37);
    goto LABEL_36;
  }
  if (objc_msgSend(v37, "length"))
  {
    if (!objc_msgSend(v15, "isEqualToString:", CFSTR("app")))
      goto LABEL_36;
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appBundleIDForInstalledAppWithIdentifier:", v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[TPSURLActionComponents setActionType:](v36, "setActionType:", 1);
      -[TPSURLActionComponents setBundleID:](v36, "setBundleID:", v29);
    }
LABEL_24:

    goto LABEL_36;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("client")))
  {
    v31 = v36;
    v32 = 8;
  }
  else
  {
    if (!objc_msgSend(v15, "isEqualToString:", CFSTR("tryit")))
      goto LABEL_36;
    v31 = v36;
    v32 = 11;
  }
  -[TPSURLActionComponents setActionType:](v31, "setActionType:", v32);
  if (v14)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLActionComponents setURL:](v36, "setURL:", v29);
    goto LABEL_24;
  }
LABEL_36:

  v5 = v34;
  v4 = v35;
  v6 = v33;
LABEL_37:

}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (unint64_t)_actionTypeForString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = _actionTypeForString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_actionTypeForString__onceToken, &__block_literal_global_4);
  objc_msgSend((id)_actionTypeForString__actionTypeMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __47__TPSURLActionComponents__actionTypeForString___block_invoke()
{
  void *v0;

  v0 = (void *)_actionTypeForString__actionTypeMap;
  _actionTypeForString__actionTypeMap = (uint64_t)&unk_1E3978610;

}

- (TPSURLActionComponents)initWithString:(id)a3
{
  void *v4;
  TPSURLActionComponents *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[TPSURLActionComponents initWithURL:](self, "initWithURL:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
