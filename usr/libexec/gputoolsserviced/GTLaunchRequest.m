@implementation GTLaunchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTLaunchRequest)init
{
  GTLaunchRequest *v2;
  GTLaunchRequest *v3;
  NSDictionary *environment;
  NSArray *arguments;
  uint64_t v6;
  NSString *deviceUDID;
  uint64_t v8;
  NSUUID *sessionUUID;
  GTLaunchRequest *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GTLaunchRequest;
  v2 = -[GTLaunchRequest init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)&__NSDictionary0__struct;

    arguments = v3->_arguments;
    v3->_arguments = (NSArray *)&__NSArray0__struct;

    v6 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID"));
    deviceUDID = v3->_deviceUDID;
    v3->_deviceUDID = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = (NSUUID *)v8;

    v10 = v3;
  }

  return v3;
}

- (GTLaunchRequest)initWithCoder:(id)a3
{
  id v4;
  GTLaunchRequest *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSDictionary *environment;
  NSDictionary *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  NSDictionary *v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t v24;
  NSArray *arguments;
  NSArray *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  uint64_t v33;
  NSArray *v34;
  id v35;
  uint64_t v36;
  NSString *deviceUDID;
  NSString *v38;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  id v42;
  uint64_t v43;
  NSUUID *sessionUUID;
  NSUUID *v45;
  uint64_t v46;
  uint64_t v47;
  NSUUID *v48;
  GTLaunchRequest *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)GTLaunchRequest;
  v5 = -[GTLaunchRequest init](&v59, "init");
  if (!v5)
    goto LABEL_39;
  v6 = objc_opt_class(NSString);
  v7 = objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(NSString), CFSTR("environment"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  environment = v5->_environment;
  v5->_environment = (NSDictionary *)v8;

  v10 = v5->_environment;
  if (!v10)
    goto LABEL_15;
  v11 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v10 = v5->_environment;
LABEL_15:
    v5->_environment = (NSDictionary *)&__NSDictionary0__struct;
    goto LABEL_18;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v10 = v5->_environment;
  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v17 = objc_opt_class(NSString);
        isKindOfClass = objc_opt_isKindOfClass(v16, v17);
        v19 = v5->_environment;
        if ((isKindOfClass & 1) == 0)
          goto LABEL_17;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v16));
        v21 = objc_opt_class(NSString);
        v22 = objc_opt_isKindOfClass(v20, v21);

        if ((v22 & 1) == 0)
        {
          v19 = v5->_environment;
LABEL_17:
          v5->_environment = (NSDictionary *)&__NSDictionary0__struct;

          goto LABEL_18;
        }
      }
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_18:

  v23 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("arguments"));
  v24 = objc_claimAutoreleasedReturnValue(v23);
  arguments = v5->_arguments;
  v5->_arguments = (NSArray *)v24;

  v26 = v5->_arguments;
  if (v26)
  {
    v27 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v26 = v5->_arguments;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v52;
        while (2)
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(_QWORD *)v52 != v30)
              objc_enumerationMutation(v26);
            v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
            v33 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v32, v33) & 1) == 0)
            {
              v34 = v5->_arguments;
              v5->_arguments = (NSArray *)&__NSArray0__struct;

              goto LABEL_32;
            }
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v29)
            continue;
          break;
        }
      }
      goto LABEL_32;
    }
    v26 = v5->_arguments;
  }
  v5->_arguments = (NSArray *)&__NSArray0__struct;
LABEL_32:

  v35 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceUDID"));
  v36 = objc_claimAutoreleasedReturnValue(v35);
  deviceUDID = v5->_deviceUDID;
  v5->_deviceUDID = (NSString *)v36;

  v38 = v5->_deviceUDID;
  if (!v38 || (v39 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v38, v39) & 1) == 0))
  {
    v40 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID", (_QWORD)v51));
    v41 = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v40;

  }
  v42 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("sessionUUID"));
  v43 = objc_claimAutoreleasedReturnValue(v42);
  sessionUUID = v5->_sessionUUID;
  v5->_sessionUUID = (NSUUID *)v43;

  v45 = v5->_sessionUUID;
  if (!v45 || (v46 = objc_opt_class(NSUUID), (objc_opt_isKindOfClass(v45, v46) & 1) == 0))
  {
    v47 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID", (_QWORD)v51));
    v48 = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v47;

  }
  v49 = v5;
LABEL_39:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *environment;
  id v5;

  environment = self->_environment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionUUID, CFSTR("sessionUUID"));

}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
