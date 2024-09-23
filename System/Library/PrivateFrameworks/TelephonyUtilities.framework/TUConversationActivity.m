@implementation TUConversationActivity

- (TUConversationActivity)initWithMetadata:(id)a3 applicationContext:(id)a4 uuid:(id)a5 activityIdentifier:(id)a6
{
  return -[TUConversationActivity initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:](self, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:", 0, a3, a4, a5, a6, 0);
}

- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  TUConversationActivity *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "lookupApplicationNameForBundleIdentifier:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = -[TUConversationActivity initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:](self, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:", v12, v13, v14, v15, v16, v17);

  return v18;
}

- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7 fallbackApplicationName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)TUConversationActivity;
  v20 = -[TUConversationActivity init](&v36, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    v22 = (void *)*((_QWORD *)v20 + 2);
    *((_QWORD *)v20 + 2) = v21;

    v23 = objc_msgSend(v18, "copy");
    v24 = (void *)*((_QWORD *)v20 + 5);
    *((_QWORD *)v20 + 5) = v23;

    v25 = objc_msgSend(v14, "copy");
    v26 = (void *)*((_QWORD *)v20 + 4);
    *((_QWORD *)v20 + 4) = v25;

    v27 = objc_msgSend(v16, "copy");
    v28 = (void *)*((_QWORD *)v20 + 3);
    *((_QWORD *)v20 + 3) = v27;

    v29 = objc_msgSend(v15, "copy");
    v30 = (void *)*((_QWORD *)v20 + 6);
    *((_QWORD *)v20 + 6) = v29;

    v20[8] = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v20 + 9);
    *((_QWORD *)v20 + 9) = v31;

    v33 = objc_msgSend(v19, "copy");
    v34 = (void *)*((_QWORD *)v20 + 10);
    *((_QWORD *)v20 + 10) = v33;

    *(_WORD *)(v20 + 9) = 0;
  }

  return (TUConversationActivity *)v20;
}

- (TUConversationActivity)initWithCreationRequest:(id)a3 bundleIdentifier:(id)a4 systemActivity:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TUConversationActivity *v15;
  uint64_t v16;
  NSString *staticIdentifier;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sanitizedCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "applicationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TUConversationActivity initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:](self, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:", v8, v11, v12, v13, v14);

  v15->_systemActivity = a5;
  objc_msgSend(v9, "staticIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();

  staticIdentifier = v15->_staticIdentifier;
  v15->_staticIdentifier = (NSString *)v16;

  return v15;
}

+ (id)placeholderActivity
{
  TUConversationActivity *v2;
  void *v3;
  void *v4;
  TUConversationActivity *v5;

  v2 = [TUConversationActivity alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUConversationActivity initWithMetadata:applicationContext:uuid:activityIdentifier:](v2, "initWithMetadata:applicationContext:uuid:activityIdentifier:", 0, v3, v4, CFSTR("com.apple.groupactivities.placeholder"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleIdentifier=%@"), v5);

  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activityIdentifier=%@"), v6);

  -[TUConversationActivity metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" metadata=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(" isSupported=%d"), -[TUConversationActivity isSupported](self, "isSupported"));
  -[TUConversationActivity originator](self, "originator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" originator=%@"), v8);

  -[TUConversationActivity timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" timestamp=%@"), v9);

  -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" trustedFromHandle=%@"), v10);

  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" fallbackApplicationName=%@"), v12);

  }
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSystemActivity");

  if (v14)
  {
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.isSystemActivity=%d"), objc_msgSend(v15, "isSystemActivity"));

  }
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPlaceholderActivity");

  if (v17)
  {
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.isPlaceholderActivity=%d"), objc_msgSend(v18, "isPlaceholderActivity"));

  }
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "startWhenStaged");

  if (v20)
  {
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.startWhenStaged=%d"), objc_msgSend(v21, "startWhenStaged"));

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivity isEqualToConversationActivity:](self, "isEqualToConversationActivity:", v4);

  return v5;
}

- (BOOL)isEquivalentToActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  int v20;
  void *v21;
  void *v22;
  int v23;

  v7 = a3;
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
  {
    LOBYTE(v11) = 0;
    goto LABEL_21;
  }
  -[TUConversationActivity metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v7, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v23 = 0;
LABEL_9:
      -[TUConversationActivity applicationContext](self, "applicationContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {
        v22 = v3;
        -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activityIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v14;
        v16 = (void *)v14;
        v17 = (void *)v15;
        if (objc_msgSend(v16, "isEqual:", v15)
          && (v20 = -[TUConversationActivity isPlaceholderActivity](self, "isPlaceholderActivity"),
              v20 == objc_msgSend(v7, "isPlaceholderActivity")))
        {
          v18 = -[TUConversationActivity startWhenStaged](self, "startWhenStaged");
          v11 = v18 ^ objc_msgSend(v7, "startWhenStaged") ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        v3 = v22;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      if (!v23)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  -[TUConversationActivity metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEquivalentToActivityMetadata:", v5))
  {
    v23 = 1;
    goto LABEL_9;
  }
  LOBYTE(v11) = 0;
LABEL_17:

LABEL_18:
  if (!v10)

LABEL_21:
  return v11;
}

- (BOOL)isEqualToConversationActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  int v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUConversationActivity metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationActivity applicationContext](self, "applicationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applicationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToData:", v10))
      {
        -[TUConversationActivity UUID](self, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v37 = v12;
          -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "activityIdentifier");
          v39 = v13;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            v36 = v11;
            v14 = -[TUConversationActivity isSupported](self, "isSupported");
            if (v14 == objc_msgSend(v4, "isSupported"))
            {
              -[TUConversationActivity originator](self, "originator");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "originator");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)v16;
              if (TUObjectsAreEqualOrNil(v16, (uint64_t)v34))
              {
                -[TUConversationActivity timestamp](self, "timestamp");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "timestamp");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v17;
                if (objc_msgSend(v17, "isEqualToDate:"))
                {
                  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
                  v18 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "fallbackApplicationName");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v30)
                    && (v19 = -[TUConversationActivity isSystemActivity](self, "isSystemActivity"),
                        v19 == objc_msgSend(v4, "isSystemActivity")))
                  {
                    -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
                    v20 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "staticIdentifier");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = (void *)v20;
                    if (TUObjectsAreEqualOrNil(v20, (uint64_t)v28)
                      && (v21 = -[TUConversationActivity isPlaceholderActivity](self, "isPlaceholderActivity"),
                          v21 == objc_msgSend(v4, "isPlaceholderActivity")))
                    {
                      -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "trustedFromHandle");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if (TUObjectsAreEqualOrNil((unint64_t)v22, (uint64_t)v27))
                      {
                        v23 = v22;
                        v24 = -[TUConversationActivity startWhenStaged](self, "startWhenStaged");
                        v25 = v24 ^ objc_msgSend(v4, "startWhenStaged");
                        v22 = v23;
                        v15 = v25 ^ 1;
                      }
                      else
                      {
                        v15 = 0;
                      }
                      v12 = v37;

                      v11 = v36;
                    }
                    else
                    {
                      v15 = 0;
                      v11 = v36;
                      v12 = v37;
                    }

                  }
                  else
                  {
                    v15 = 0;
                    v11 = v36;
                    v12 = v37;
                  }

                }
                else
                {
                  v15 = 0;
                  v11 = v36;
                  v12 = v37;
                }

              }
              else
              {
                v15 = 0;
                v11 = v36;
                v12 = v37;
              }

            }
            else
            {
              v15 = 0;
              v11 = v36;
              v12 = v37;
            }
          }
          else
          {
            v15 = 0;
            v12 = v37;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[TUConversationActivity metadata](self, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash") ^ v3;
  -[TUConversationActivity applicationContext](self, "applicationContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v29, "hash");
  -[TUConversationActivity UUID](self, "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v28, "hash");
  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "hash");
  if (-[TUConversationActivity isSupported](self, "isSupported"))
    v8 = 1231;
  else
    v8 = 1237;
  v9 = v6 ^ v7 ^ v8;
  -[TUConversationActivity originator](self, "originator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[TUConversationActivity timestamp](self, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  if (-[TUConversationActivity isSystemActivity](self, "isSystemActivity"))
    v16 = 1231;
  else
    v16 = 1237;
  v17 = v9 ^ v15 ^ v16;
  -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  if (-[TUConversationActivity isPlaceholderActivity](self, "isPlaceholderActivity"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v19 ^ v20;
  -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  if (-[TUConversationActivity startWhenStaged](self, "startWhenStaged"))
    v24 = 1231;
  else
    v24 = 1237;
  v25 = v17 ^ v23 ^ v24;

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity applicationContext](self, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:", v5, v6, v7, v8, v9, v10);

  objc_msgSend(v11, "setSupported:", -[TUConversationActivity isSupported](self, "isSupported"));
  -[TUConversationActivity originator](self, "originator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginator:", v12);

  -[TUConversationActivity timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimestamp:", v13);

  objc_msgSend(v11, "setSystemActivity:", -[TUConversationActivity isSystemActivity](self, "isSystemActivity"));
  -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStaticIdentifier:", v14);

  -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTrustedFromHandle:", v15);

  objc_msgSend(v11, "setStartWhenStaged:", -[TUConversationActivity startWhenStaged](self, "startWhenStaged"));
  return v11;
}

- (id)sanitizedCopy
{
  return -[TUConversationActivity sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sanitizedCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity applicationContext](self, "applicationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:", v5, v7, v8, v9, v10, v11);

  objc_msgSend(v12, "setSupported:", -[TUConversationActivity isSupported](self, "isSupported"));
  -[TUConversationActivity originator](self, "originator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOriginator:", v13);

  -[TUConversationActivity timestamp](self, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimestamp:", v14);

  objc_msgSend(v12, "setSystemActivity:", -[TUConversationActivity isSystemActivity](self, "isSystemActivity"));
  -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStaticIdentifier:", v15);

  -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrustedFromHandle:", v16);

  objc_msgSend(v12, "setStartWhenStaged:", -[TUConversationActivity startWhenStaged](self, "startWhenStaged"));
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  TUConversationActivity *v35;
  NSString *staticIdentifier;
  NSString *v37;
  TUHandle *trustedFromHandle;
  TUConversationActivity *v39;
  char v41;
  uint64_t v42;
  void *v43;
  char v44;
  char v45;
  id v46;
  id obj;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_bundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_metadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_applicationContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_opt_class();
      NSStringFromSelector(sel_activityIdentifier);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        NSStringFromSelector(sel_isSupported);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v4, "decodeBoolForKey:", v20);

        v21 = objc_opt_class();
        NSStringFromSelector(sel_originator);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
        obj = (id)objc_claimAutoreleasedReturnValue();

        v23 = objc_opt_class();
        NSStringFromSelector(sel_timestamp);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v46 = v25;
          v26 = objc_opt_class();
          NSStringFromSelector(sel_fallbackApplicationName);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          NSStringFromSelector(sel_isSystemActivity);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v4, "decodeBoolForKey:", v28);

          v29 = objc_opt_class();
          NSStringFromSelector(sel_staticIdentifier);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v29, v30);
          v31 = (NSString *)objc_claimAutoreleasedReturnValue();

          v32 = objc_opt_class();
          NSStringFromSelector(sel_trustedFromHandle);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
          v42 = objc_claimAutoreleasedReturnValue();

          NSStringFromSelector(sel_startWhenStaged);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v4, "decodeBoolForKey:", v34);

          v35 = -[TUConversationActivity initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:](self, "initWithBundleIdentifier:metadata:applicationContext:uuid:activityIdentifier:fallbackApplicationName:", v7, v10, v13, v16, v19, v43);
          v35->_supported = v45;
          objc_storeStrong((id *)&v35->_originator, obj);
          objc_storeStrong((id *)&v35->_timestamp, v46);
          v35->_systemActivity = v44;
          staticIdentifier = v35->_staticIdentifier;
          v35->_staticIdentifier = v31;
          v37 = v31;

          v25 = v46;
          trustedFromHandle = v35->_trustedFromHandle;
          v35->_trustedFromHandle = (TUHandle *)v42;

          v35->_startWhenStaged = v41;
          self = v35;

          v39 = self;
        }
        else
        {
          v39 = 0;
        }

      }
      else
      {
        v39 = 0;
      }

    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;

  v4 = a3;
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivity metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationActivity applicationContext](self, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationActivity UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[TUConversationActivity isSupported](self, "isSupported");
  NSStringFromSelector(sel_isSupported);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  -[TUConversationActivity originator](self, "originator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originator);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUConversationActivity timestamp](self, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamp);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fallbackApplicationName);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  v23 = -[TUConversationActivity isSystemActivity](self, "isSystemActivity");
  NSStringFromSelector(sel_isSystemActivity);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_staticIdentifier);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUConversationActivity trustedFromHandle](self, "trustedFromHandle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_trustedFromHandle);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  v29 = -[TUConversationActivity startWhenStaged](self, "startWhenStaged");
  NSStringFromSelector(sel_startWhenStaged);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

}

- (NSString)representativeBundleIdentifier
{
  __CFString *v3;

  if (-[TUConversationActivity isEligibleForWebBrowser](self, "isEligibleForWebBrowser"))
  {
    v3 = CFSTR("com.apple.Safari");
  }
  else
  {
    if (-[TUConversationActivity isScreenSharingActivity](self, "isScreenSharingActivity"))
      -[TUConversationActivity platformScreenSharingBundleIdentifier](self, "platformScreenSharingBundleIdentifier");
    else
      -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)isEligibleForHandoff
{
  void *v2;
  char v3;

  -[TUConversationActivity metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsContinuationOnTV");

  return v3;
}

- (BOOL)isEligibleForWebBrowser
{
  return 0;
}

- (BOOL)isPlaceholderActivity
{
  void *v2;
  char v3;

  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.groupactivities.placeholder"));

  return v3;
}

- (BOOL)isStaticActivity
{
  void *v2;
  BOOL v3;

  -[TUConversationActivity staticIdentifier](self, "staticIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString *fallbackApplicationName;
  NSString *v8;

  v5 = (NSString *)a3;
  if (self->_bundleIdentifier != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    if (self->_bundleIdentifier)
    {
      objc_msgSend((id)objc_opt_class(), "lookupApplicationNameForBundleIdentifier:", v8);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      fallbackApplicationName = self->_fallbackApplicationName;
      self->_fallbackApplicationName = v6;
    }
    else
    {
      fallbackApplicationName = self->_fallbackApplicationName;
      self->_fallbackApplicationName = 0;
    }

    v5 = v8;
  }

}

- (id)localizedApplicationName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lookupApplicationNameForBundleIdentifier:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "length"))
    {
      -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        -[TUConversationActivity fallbackApplicationName](self, "fallbackApplicationName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "copy");

        v3 = (void *)v9;
      }
    }
  }
  return v3;
}

- (id)representativeDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TUConversationActivity isEligibleForWebBrowser](self, "isEligibleForWebBrowser"))
  {
    -[TUConversationActivity metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fallbackURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TUConversationActivity localizedApplicationName](self, "localizedApplicationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)lookupApplicationNameForBundleIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")) & 1) == 0)
  {
    v10 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
    v6 = v10;
    if (v6)
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[TUConversationActivity lookupApplicationNameForBundleIdentifier:].cold.1((uint64_t)v3, (uint64_t)v6, v7);

    }
    else if (v5)
    {
      objc_msgSend(v5, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v8 = 0;
LABEL_10:
    v4 = v8;

    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (BOOL)isScreenSharingActivity
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[TUConversationActivity activityIdentifier](self, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.FaceTime.ScreenSharing"));

  if (!v4)
    return 0;
  -[TUConversationActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.InCallService"));

  return v6;
}

- (id)concatenatedMetadataDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[TUConversationActivity metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUConversationActivity metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUConversationActivity metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[TUConversationActivity metadata](self, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUConversationActivity metadata](self, "metadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ ⋅ %@"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        return v13;
      }
      -[TUConversationActivity metadata](self, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = v14;
      v13 = (void *)objc_msgSend(v14, "copy");
      goto LABEL_10;
    }
    if (v7)
    {
      -[TUConversationActivity metadata](self, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v13 = 0;
  return v13;
}

- (id)concatenatedDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[TUConversationActivity concatenatedMetadataDescription](self, "concatenatedMetadataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    TUBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVITY"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)platformScreenSharingBundleIdentifier
{
  return CFSTR("com.apple.InCallService");
}

- (TUConversationActivityContext)activityContext
{
  void *v2;
  void *v3;

  -[TUConversationActivity metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUConversationActivityContext *)v3;
}

- (void)setActivityContext:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Not setting activity context: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUConversationActivityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (TUHandle)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSystemActivity
{
  return self->_systemActivity;
}

- (void)setSystemActivity:(BOOL)a3
{
  self->_systemActivity = a3;
}

- (TUHandle)trustedFromHandle
{
  return self->_trustedFromHandle;
}

- (void)setTrustedFromHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)fallbackApplicationName
{
  return self->_fallbackApplicationName;
}

- (void)setFallbackApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)staticIdentifier
{
  return self->_staticIdentifier;
}

- (void)setStaticIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)startWhenStaged
{
  return self->_startWhenStaged;
}

- (void)setStartWhenStaged:(BOOL)a3
{
  self->_startWhenStaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackApplicationName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_trustedFromHandle, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (void)lookupApplicationNameForBundleIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Lookup failed when trying to retrieve a name for bundle ID %@ with error %@", (uint8_t *)&v3, 0x16u);
}

@end
