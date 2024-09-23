@implementation STURollingCourseIdentitySet

- (STURollingCourseIdentitySet)initWithActiveIdentityPersistentID:(id)a3 stagedIdentityPersistentID:(id)a4 userIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v11;
  STURollingCourseIdentitySet *v12;
  STURollingCourseIdentitySet *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)STURollingCourseIdentitySet;
  v12 = -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:](&v15, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_groupIdentifier, a6);

  return v13;
}

- (STURollingCourseIdentitySet)initWithRollingIdentity:(id)a3 userIdentifier:(id)a4 groupIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  STURollingCourseIdentitySet *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeIdentityPersistentID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stagedIdentityPersistentID"));

  v13 = -[STURollingCourseIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:](self, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:", v11, v12, v9, v8);
  return v13;
}

- (STURollingCourseIdentitySet)initWithCoursePrivateIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STURollingCourseIdentitySet *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identityPersistentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stagedIdentityPersistentId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "studentIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));

  v9 = -[STURollingCourseIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:](self, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STURollingCourseIdentitySet *v8;
  STURollingCourseIdentitySet *v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  STURollingCourseIdentitySet *v18;
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
  v25.super_class = (Class)STURollingCourseIdentitySet;
  if (-[STURollingUserIdentitySet isEqual:](&v25, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("groupIdentifier"), "componentsSeparatedByString:", CFSTR(",")));
    v6 = objc_msgSend(v5, "mutableCopy");

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001756C;
    v30[3] = &unk_1000C9E08;
    v7 = v6;
    v31 = v7;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v30);

    v8 = self;
    v9 = (STURollingCourseIdentitySet *)v4;
    v10 = v7;
    v11 = v8 == v9;
    if (v8 == v9
      || !-[STURollingCourseIdentitySet isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
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
            v19 = objc_claimAutoreleasedReturnValue(-[STURollingCourseIdentitySet valueForKey:](v8, "valueForKey:", v17));
            v20 = objc_claimAutoreleasedReturnValue(-[STURollingCourseIdentitySet valueForKey:](v18, "valueForKey:", v17));

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
  v7.super_class = (Class)STURollingCourseIdentitySet;
  v3 = -[STURollingUserIdentitySet hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingCourseIdentitySet groupIdentifier](self, "groupIdentifier"));
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
  void *v8;
  id v9;
  objc_super v11;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v11.receiver = self;
  v11.super_class = (Class)STURollingCourseIdentitySet;
  v4 = -[STURollingUserIdentitySet dictionaryValue](&v11, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingCourseIdentitySet groupIdentifier](self, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("groupIdentifier"));

  v9 = objc_msgSend(v6, "copy");
  return v9;
}

- (STURollingCourseIdentitySet)initWithDictionary:(id)a3
{
  uint64_t v3;
  id v5;
  STURollingCourseIdentitySet *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STURollingCourseIdentitySet;
  v6 = -[STURollingUserIdentitySet initWithDictionary:](&v12, "initWithDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupIdentifier")));
    v8 = objc_alloc((Class)DMFControlGroupIdentifier);
    v9 = v8;
    if (v7)
    {
      v10 = objc_msgSend(v8, "initWithString:", v7);
    }
    else
    {
      v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v10 = objc_msgSend(v9, "initWithOrganizationUUID:groupID:", v3, 0);
    }
    objc_storeStrong((id *)&v6->_groupIdentifier, v10);
    if (!v7)
    {

      v10 = (id)v3;
    }

  }
  return v6;
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
