@implementation STURollingUserIdentitySet

- (STURollingUserIdentitySet)initWithActiveIdentityPersistentID:(id)a3 stagedIdentityPersistentID:(id)a4 userIdentifier:(id)a5
{
  id v8;
  STURollingUserIdentitySet *v9;
  NSString *v10;
  NSString *userIdentifier;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STURollingUserIdentitySet;
  v9 = -[STURollingIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:](&v13, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:", a3, a4);
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    userIdentifier = v9->_userIdentifier;
    v9->_userIdentifier = v10;

  }
  return v9;
}

- (STURollingUserIdentitySet)init
{
  return -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:](self, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STURollingUserIdentitySet *v8;
  STURollingUserIdentitySet *v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  STURollingUserIdentitySet *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v23;
  id v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STURollingUserIdentitySet;
  if (-[STURollingIdentitySet isEqual:](&v25, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("userIdentifier"), "componentsSeparatedByString:", CFSTR(",")));
    v6 = objc_msgSend(v5, "mutableCopy");

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100063920;
    v30[3] = &unk_1000C9E08;
    v7 = v6;
    v31 = v7;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v30);

    v8 = self;
    v9 = (STURollingUserIdentitySet *)v4;
    v10 = v7;
    v11 = v8 == v9;
    if (v8 == v9
      || !-[STURollingUserIdentitySet isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
    {

    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = v13;
        v23 = v10;
        v24 = v4;
        v15 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v18 = v9;
            v19 = objc_claimAutoreleasedReturnValue(-[STURollingUserIdentitySet valueForKey:](v8, "valueForKey:", v17));
            v20 = objc_claimAutoreleasedReturnValue(-[STURollingUserIdentitySet valueForKey:](v18, "valueForKey:", v17));

            if (v19 | v20)
            {
              v21 = objc_msgSend((id)v19, "isEqual:", v20);

              if (!v21)
              {
                v11 = 0;
                goto LABEL_17;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v14)
            continue;
          break;
        }
        v11 = 1;
LABEL_17:
        v10 = v23;
        v4 = v24;
      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STURollingUserIdentitySet;
  v3 = -[STURollingIdentitySet hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingUserIdentitySet userIdentifier](self, "userIdentifier"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)dictionaryValue
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v10.receiver = self;
  v10.super_class = (Class)STURollingUserIdentitySet;
  v4 = -[STURollingIdentitySet dictionaryValue](&v10, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingUserIdentitySet userIdentifier](self, "userIdentifier"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("userIdentifier"));

  v8 = objc_msgSend(v6, "copy");
  return v8;
}

- (STURollingUserIdentitySet)initWithDictionary:(id)a3
{
  id v4;
  STURollingUserIdentitySet *v5;
  uint64_t v6;
  NSString *userIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STURollingUserIdentitySet;
  v5 = -[STURollingIdentitySet initWithDictionary:](&v9, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userIdentifier")));
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
