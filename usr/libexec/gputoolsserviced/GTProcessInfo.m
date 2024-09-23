@implementation GTProcessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessInfo)init
{
  GTProcessInfo *v2;
  void *v3;
  uint64_t v4;
  NSString *processName;
  uint64_t v6;
  NSDictionary *environment;
  uint64_t v8;
  NSArray *arguments;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GTProcessInfo;
  v2 = -[GTProcessInfo init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processName"));
    processName = v2->_processName;
    v2->_processName = (NSString *)v4;

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arguments"));
    arguments = v2->_arguments;
    v2->_arguments = (NSArray *)v8;

    v2->_processIdentifier = objc_msgSend(v3, "processIdentifier");
    v2->_ppid = getppid();
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v11;

  }
  return v2;
}

- (GTProcessInfo)initWithCoder:(id)a3
{
  id v4;
  GTProcessInfo *v5;
  id v6;
  uint64_t v7;
  NSString *processName;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  id v12;
  uint64_t v13;
  NSArray *arguments;
  NSArray *v15;
  uint64_t v16;
  NSArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSDictionary *environment;
  NSDictionary *v29;
  uint64_t v30;
  NSDictionary *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  uint64_t v36;
  uint64_t v37;
  char isKindOfClass;
  NSDictionary *v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  uint64_t v44;
  NSString *bundleIdentifier;
  NSString *v46;
  uint64_t v47;
  NSString *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)GTProcessInfo;
  v5 = -[GTProcessInfo init](&v58, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("processName"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    processName = v5->_processName;
    v5->_processName = (NSString *)v7;

    v9 = v5->_processName;
    if (v9)
    {
      v10 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        v11 = v5->_processName;
        v5->_processName = 0;

      }
    }
    v12 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("arguments"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v13;

    v15 = v5->_arguments;
    if (v15)
    {
      v16 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v17 = v5->_arguments;
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v55;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v55 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
              v23 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
              {
                v24 = v5->_arguments;
                v5->_arguments = 0;

                goto LABEL_18;
              }
            }
            v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
            if (v19)
              continue;
            break;
          }
        }
      }
      else
      {
        v17 = v5->_arguments;
        v5->_arguments = 0;
      }
LABEL_18:

    }
    v25 = objc_opt_class(NSString);
    v26 = objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v25, objc_opt_class(NSString), CFSTR("environment"));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    environment = v5->_environment;
    v5->_environment = (NSDictionary *)v27;

    v29 = v5->_environment;
    if (v29)
    {
      v30 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v31 = v5->_environment;
        v32 = -[NSDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v51;
          while (2)
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(_QWORD *)v51 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
              v37 = objc_opt_class(NSString);
              isKindOfClass = objc_opt_isKindOfClass(v36, v37);
              v39 = v5->_environment;
              if ((isKindOfClass & 1) == 0)
                goto LABEL_33;
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v36, (_QWORD)v50));
              v41 = objc_opt_class(NSString);
              v42 = objc_opt_isKindOfClass(v40, v41);

              if ((v42 & 1) == 0)
              {
                v39 = v5->_environment;
LABEL_33:
                v5->_environment = 0;

                goto LABEL_34;
              }
            }
            v33 = -[NSDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            if (v33)
              continue;
            break;
          }
        }
      }
      else
      {
        v31 = v5->_environment;
        v5->_environment = 0;
      }
LABEL_34:

    }
    v43 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue(v43);
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v44;

    v46 = v5->_bundleIdentifier;
    if (v46)
    {
      v47 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
      {
        v48 = v5->_bundleIdentifier;
        v5->_bundleIdentifier = 0;

      }
    }
    v5->_processIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("processIdentifier"), (_QWORD)v50);
    v5->_ppid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ppid"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *processName;
  id v5;

  processName = self->_processName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processName, CFSTR("processName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_processIdentifier, CFSTR("processIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_ppid, CFSTR("ppid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GTProcessInfo *v4;
  id v5;
  id v6;

  v4 = objc_alloc_init(GTProcessInfo);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", self->_arguments, 1);
  -[GTProcessInfo setArguments:](v4, "setArguments:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", self->_environment, 1);
  -[GTProcessInfo setEnvironment:](v4, "setEnvironment:", v6);

  -[GTProcessInfo setBundleIdentifier:](v4, "setBundleIdentifier:", self->_bundleIdentifier);
  -[GTProcessInfo setProcessIdentifier:](v4, "setProcessIdentifier:", self->_processIdentifier);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: processName=%@ arguments=%@ environment=%@ bundleIdentifier=%@ processIdentifier=%d ppid=%d>"), v5, self->_processName, self->_arguments, self->_environment, self->_bundleIdentifier, self->_processIdentifier, self->_ppid));

  return v6;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (int)ppid
{
  return self->_ppid;
}

- (void)setPpid:(int)a3
{
  self->_ppid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
