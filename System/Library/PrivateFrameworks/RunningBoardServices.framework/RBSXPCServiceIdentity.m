@implementation RBSXPCServiceIdentity

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCServiceIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSXPCServiceIdentity *v5;
  uint64_t v6;
  RBSXPCServiceDefinition *definition;
  uint64_t v8;
  NSString *sessionID;
  uint64_t v10;
  RBSProcessInstance *host;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  NSString *personaString;
  uint64_t v16;
  NSData *validationToken;

  v4 = a3;
  v5 = -[RBSXPCServiceIdentity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_definition"));
    v6 = objc_claimAutoreleasedReturnValue();
    definition = v5->_definition;
    v5->_definition = (RBSXPCServiceDefinition *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionID"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_host"));
    v10 = objc_claimAutoreleasedReturnValue();
    host = v5->_host;
    v5->_host = (RBSProcessInstance *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v12 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personaString"));
    v14 = objc_claimAutoreleasedReturnValue();
    personaString = v5->_personaString;
    v5->_personaString = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_validationToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    validationToken = v5->_validationToken;
    v5->_validationToken = (NSData *)v16;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  RBSXPCServiceDefinition *definition;
  id v5;

  definition = self->_definition;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", definition, CFSTR("_definition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("_sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_host, CFSTR("_host"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personaString, CFSTR("_personaString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validationToken, CFSTR("_validationToken"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  RBSXPCServiceDefinition *definition;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSString *sessionID;
  uint64_t v10;
  void *v11;
  char v12;
  RBSProcessInstance *host;
  uint64_t v14;
  void *v15;
  NSUUID *uuid;
  uint64_t v17;
  void *v18;
  NSString *personaString;
  uint64_t v20;
  void *v21;
  NSData *validationToken;
  uint64_t v23;
  void *v24;

  v4 = a3;
  definition = self->_definition;
  objc_msgSend(v4, "definition");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (definition == (RBSXPCServiceDefinition *)v6
    || (definition ? (v8 = v6 == 0) : (v8 = 1), !v8 && -[RBSXPCServiceDefinition isEqual:](definition, "isEqual:", v6)))
  {
    sessionID = self->_sessionID;
    objc_msgSend(v4, "sessionID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (sessionID != (NSString *)v10)
    {
      v12 = 0;
      if (!sessionID || !v10)
        goto LABEL_37;
      if (!-[NSString isEqual:](sessionID, "isEqual:", v10))
      {
        v12 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    host = self->_host;
    objc_msgSend(v4, "host");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (host != (RBSProcessInstance *)v14)
    {
      v12 = 0;
      if (!host || !v14)
        goto LABEL_36;
      if (!-[RBSProcessInstance isEqual:](host, "isEqual:", v14))
      {
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    uuid = self->_uuid;
    objc_msgSend(v4, "uuid");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (uuid != (NSUUID *)v17)
    {
      v12 = 0;
      if (!uuid || !v17)
        goto LABEL_35;
      if (!-[NSUUID isEqual:](uuid, "isEqual:", v17))
      {
        v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    personaString = self->_personaString;
    objc_msgSend(v4, "personaString");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (personaString == (NSString *)v20)
      goto LABEL_23;
    v12 = 0;
    if (personaString && v20)
    {
      if (-[NSString isEqual:](personaString, "isEqual:", v20))
      {
LABEL_23:
        validationToken = self->_validationToken;
        objc_msgSend(v4, "validationToken");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (validationToken == (NSData *)v23)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (validationToken && v23)
            v12 = -[NSData isEqual:](validationToken, "isEqual:", v23);
        }

        goto LABEL_34;
      }
      v12 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)personaString
{
  return self->_personaString;
}

- (NSData)validationToken
{
  return self->_validationToken;
}

- (RBSXPCServiceDefinition)definition
{
  return self->_definition;
}

- (RBSProcessInstance)host
{
  return self->_host;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[RBSXPCServiceDefinition hash](self->_definition, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash") ^ v3;
  v5 = -[RBSProcessInstance hash](self->_host, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_uuid, "hash");
  v7 = -[NSString hash](self->_personaString, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_validationToken, "hash");
}

- (NSString)sessionID
{
  return self->_sessionID;
}

+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6 persona:(id)a7 validationToken:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a4;
  v20 = objc_alloc_init((Class)a1);
  v21 = (void *)v20[1];
  v20[1] = v14;
  v22 = v14;

  v23 = objc_msgSend(v19, "copy");
  v24 = (void *)v20[2];
  v20[2] = v23;

  v25 = (void *)v20[3];
  v20[3] = v15;
  v26 = v15;

  v27 = (void *)v20[4];
  v20[4] = v16;
  v28 = v16;

  v29 = objc_msgSend(v18, "copy");
  v30 = (void *)v20[5];
  v20[5] = v29;

  v31 = objc_msgSend(v17, "copy");
  v32 = (void *)v20[6];
  v20[6] = v31;

  return (RBSXPCServiceIdentity *)v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_personaString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

+ (RBSXPCServiceIdentity)identityWithDefinition:(id)a3 sessionID:(id)a4 host:(id)a5 UUID:(id)a6
{
  return (RBSXPCServiceIdentity *)objc_msgSend(a1, "identityWithDefinition:sessionID:host:UUID:persona:validationToken:", a3, a4, a5, a6, 0, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSData *validationToken;
  uint64_t v9;

  -[RBSXPCServiceDefinition description](self->_definition, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_host)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("[%@]"), self->_host);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(":%@"), self->_uuid);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (self->_personaString)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(":%@"), self->_personaString);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  validationToken = self->_validationToken;
  if (validationToken)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(":{%lu}"), -[NSData hash](validationToken, "hash"));
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
