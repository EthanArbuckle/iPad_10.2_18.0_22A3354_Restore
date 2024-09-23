@implementation PAApplication

- (unint64_t)hash
{
  unint64_t result;
  int8x16_t v4;
  int16x8_t v5;
  int8x16_t v6;
  int16x8_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;

  result = self->_identifierType;
  switch(result)
  {
    case 0uLL:
      result = -[NSString hash](self->_bundleID, "hash");
      break;
    case 1uLL:
      result = -[NSString hash](self->_path, "hash") + 31;
      break;
    case 2uLL:
      v4 = veorq_s8(*(int8x16_t *)self->_auditToken.val, *(int8x16_t *)&self->_auditToken.val[4]);
      v5 = vmovl_high_s8(v4);
      v6 = (int8x16_t)vmovl_s16(*(int16x4_t *)v5.i8);
      v7 = vmovl_s8(*(int8x8_t *)v4.i8);
      v8 = (int8x16_t)vmovl_s16(*(int16x4_t *)v7.i8);
      v9 = (int8x16_t)vmovl_high_s16(v5);
      v10 = (int8x16_t)vmovl_high_s16(v7);
      *(int8x8_t *)v10.i8 = veor_s8(veor_s8(veor_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v6.i8), veor_s8(*(int8x8_t *)v10.i8, *(int8x8_t *)v9.i8)), veor_s8(veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL))));
      v11.i64[0] = v10.i32[0];
      v11.i64[1] = v10.i32[1];
      result = *(_QWORD *)&veor_s8((int8x8_t)v10.i32[0], (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) + 62;
      break;
    case 3uLL:
      result = self->_insecureProcessIdentifier + 93;
      break;
    case 4uLL:
      result = -[PABridgedTCCIdentity hash](self->_bridgedAssumedIdentity, "hash") + 124;
      break;
    default:
      return result;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedAssumedIdentity, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (PAApplication)applicationWithAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (PAApplication *)(id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

- (PAApplication)initWithAuditToken:(id *)a3
{
  PAApplication *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAApplication;
  result = -[PAApplication init](&v6, sel_init);
  if (result)
  {
    result->_identifierType = 2;
    v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = v5;
  }
  return result;
}

- (id)JSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAApplication descriptionForIdentifierType](self, "descriptionForIdentifierType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifierType"));

  -[PAApplication descriptionForIdentifier](self, "descriptionForIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  if (self->_identifierType == 4)
  {
    -[PABridgedTCCIdentity description](self->_bridgedAssumedIdentity, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assumedIdentity"));

  }
  return v3;
}

- (NSString)descriptionForIdentifier
{
  NSString *bundleID;
  NSString *result;
  uint64_t v4;

  switch(self->_identifierType)
  {
    case 0:
      bundleID = self->_bundleID;
      return bundleID;
    case 1:
      bundleID = self->_path;
      return bundleID;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{pid:%d, version:%d}"), self->_auditToken.val[5], self->_auditToken.val[7]);
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{pid:%d}"), self->_insecureProcessIdentifier, v4);
LABEL_8:
      result = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = (NSString *)0;
      break;
  }
  return result;
}

- (id)descriptionForIdentifierType
{
  unint64_t identifierType;

  identifierType = self->_identifierType;
  if (identifierType > 4)
    return CFSTR("unknown");
  else
    return off_1E4FA5558[identifierType];
}

- (void)encodeWithCoder:(id)a3
{
  PABridgedTCCIdentity *bundleID;
  const __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_identifierType, CFSTR("identifierType"));
  switch(self->_identifierType)
  {
    case 0:
      bundleID = (PABridgedTCCIdentity *)self->_bundleID;
      v5 = CFSTR("bundleID");
      goto LABEL_7;
    case 1:
      bundleID = (PABridgedTCCIdentity *)self->_path;
      v5 = CFSTR("path");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_auditToken, "{?=[8I]}");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("auditToken"));

      break;
    case 3:
      objc_msgSend(v7, "encodeInt:forKey:", self->_insecureProcessIdentifier, CFSTR("insecureProcessIdentifier"));
      break;
    case 4:
      bundleID = self->_bridgedAssumedIdentity;
      v5 = CFSTR("assumedIdentity");
LABEL_7:
      objc_msgSend(v7, "encodeObject:forKey:", bundleID, v5);
      break;
    default:
      break;
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isEqual:(id)a3
{
  PAApplication *v4;
  PAApplication *v5;
  int64_t identifierType;
  NSString *bundleID;
  NSString *path;
  BOOL v9;
  __int128 v10;
  BOOL v13;
  PABridgedTCCIdentity *bridgedAssumedIdentity;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = (PAApplication *)a3;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (-[PAApplication isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    identifierType = self->_identifierType;
    if (identifierType == -[PAApplication identifierType](v5, "identifierType"))
    {
      switch(self->_identifierType)
      {
        case 0:
          bundleID = self->_bundleID;
          path = v5->_bundleID;
          goto LABEL_10;
        case 1:
          bundleID = self->_path;
          path = v5->_path;
LABEL_10:
          v9 = -[NSString isEqualToString:](bundleID, "isEqualToString:", path);
          goto LABEL_26;
        case 2:
          v17 = *(_OWORD *)self->_auditToken.val;
          v18 = *(_OWORD *)&self->_auditToken.val[4];
          v10 = *(_OWORD *)&v5->_auditToken.val[4];
          v16 = *(_OWORD *)v5->_auditToken.val;
          v13 = (_QWORD)v17 == (_QWORD)v16
             && *((_QWORD *)&v17 + 1) == *((_QWORD *)&v16 + 1)
             && (_QWORD)v18 == (_QWORD)v10
             && *((_QWORD *)&v18 + 1) == *((_QWORD *)&v10 + 1);
          goto LABEL_21;
        case 3:
          v13 = self->_insecureProcessIdentifier == v5->_insecureProcessIdentifier;
LABEL_21:
          LOBYTE(self) = v13;
          break;
        case 4:
          bridgedAssumedIdentity = self->_bridgedAssumedIdentity;
          if (bridgedAssumedIdentity == v5->_bridgedAssumedIdentity)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v9 = -[PABridgedTCCIdentity isEqual:](bridgedAssumedIdentity, "isEqual:");
LABEL_26:
            LOBYTE(self) = v9;
          }
          break;
        default:
          break;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PAApplication)applicationWithType:(int64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:", a3, v6);

  return (PAApplication *)v7;
}

- (PAApplication)initWithType:(int64_t)a3 identifier:(id)a4
{
  id v6;
  PAApplication *v7;
  PAApplication *v8;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = -[PAApplication initWithPath:](self, "initWithPath:", v6);
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[PAApplication initWithBundleID:](self, "initWithBundleID:", v6);
  }
  self = v7;
  v8 = self;
LABEL_7:

  return v8;
}

- (PAApplication)initWithTCCIdentity:(id)a3
{
  id v4;
  uint64_t type;
  void *v6;
  PAApplication *v7;
  PAApplication *v8;

  v4 = a3;
  type = tcc_identity_get_type();
  if (type == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PAApplication initWithPath:](self, "initWithPath:", v6);
  }
  else
  {
    if (type)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PAApplication initWithBundleID:](self, "initWithBundleID:", v6);
  }
  self = v7;

  v8 = self;
LABEL_7:

  return v8;
}

+ (PAApplication)applicationWithBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleID:", v4);

  return (PAApplication *)v5;
}

void __45__PAApplication_applicationForCurrentProcess__block_invoke()
{
  PAApplication *v0;
  void *v1;

  v0 = -[PAApplication initWithInProcessIdentity]([PAApplication alloc], "initWithInProcessIdentity");
  v1 = (void *)applicationForCurrentProcess_application;
  applicationForCurrentProcess_application = (uint64_t)v0;

}

- (PAApplication)initWithInProcessIdentity
{
  return -[PAApplication initWithInProcessBridgedAssumedIdentity:](self, "initWithInProcessBridgedAssumedIdentity:", 0);
}

- (PAApplication)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PAApplication *v6;
  PAApplication *v7;
  void *v8;
  PAApplication *v9;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v4 = a3;
  switch(objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifierType")))
  {
    case 0:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PAApplication initWithBundleID:](self, "initWithBundleID:", v5);
      goto LABEL_9;
    case 1:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PAApplication initWithPath:](self, "initWithPath:", v5);
      goto LABEL_9;
    case 2:
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getValue:size:", &v12, 32);

      v11[0] = v12;
      v11[1] = v13;
      v9 = -[PAApplication initWithAuditToken:](self, "initWithAuditToken:", v11);
      goto LABEL_7;
    case 3:
      v9 = -[PAApplication initWithInsecureProcessIdentifier:](self, "initWithInsecureProcessIdentifier:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("insecureProcessIdentifier")));
LABEL_7:
      self = v9;
      v7 = self;
      break;
    case 4:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assumedIdentity"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PAApplication initWithInProcessBridgedAssumedIdentity:](self, "initWithInProcessBridgedAssumedIdentity:", v5);
LABEL_9:
      self = v6;

      v7 = self;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (PAApplication)initWithInProcessBridgedAssumedIdentity:(id)a3
{
  id v5;
  PAApplication *v6;
  PAApplication *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAApplication;
  v6 = -[PAApplication init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_identifierType = 4;
    objc_storeStrong((id *)&v6->_bridgedAssumedIdentity, a3);
  }

  return v7;
}

- (PAApplication)initWithBundleID:(id)a3
{
  id v4;
  PAApplication *v5;
  PAApplication *v6;
  uint64_t v7;
  NSString *bundleID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAApplication;
  v5 = -[PAApplication init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_identifierType = 0;
    v7 = objc_msgSend(v4, "copy");
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v7;

  }
  return v6;
}

+ (PAApplication)applicationForCurrentProcess
{
  if (applicationForCurrentProcess_onceToken != -1)
    dispatch_once(&applicationForCurrentProcess_onceToken, &__block_literal_global_8);
  return (PAApplication *)(id)applicationForCurrentProcess_application;
}

+ (PAApplication)applicationWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return (PAApplication *)v5;
}

- (PAApplication)initWithPath:(id)a3
{
  id v4;
  PAApplication *v5;
  PAApplication *v6;
  uint64_t v7;
  NSString *path;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAApplication;
  v5 = -[PAApplication init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_identifierType = 1;
    v7 = objc_msgSend(v4, "copy");
    path = v6->_path;
    v6->_path = (NSString *)v7;

  }
  return v6;
}

- (PAApplication)initWithInProcessAssumedIdentity:(id)a3
{
  id v4;
  PABridgedTCCIdentity *v5;
  PAApplication *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PABridgedTCCIdentity initWithTCCIdentity:]([PABridgedTCCIdentity alloc], "initWithTCCIdentity:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = -[PAApplication initWithInProcessBridgedAssumedIdentity:](self, "initWithInProcessBridgedAssumedIdentity:", v5);

  return v6;
}

- (PAApplication)initWithInsecureProcessIdentifier:(int)a3
{
  PAApplication *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAApplication;
  result = -[PAApplication init](&v5, sel_init);
  if (result)
  {
    result->_identifierType = 3;
    result->_insecureProcessIdentifier = a3;
  }
  return result;
}

- (NSString)identifier
{
  int64_t identifierType;
  void *v3;

  identifierType = self->_identifierType;
  if (identifierType == 1)
  {
    -[PAApplication path](self, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (identifierType)
  {
    v3 = 0;
  }
  else
  {
    -[PAApplication bundleID](self, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)path
{
  return self->_path;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[2].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (int)insecureProcessIdentifier
{
  return self->_insecureProcessIdentifier;
}

- (OS_tcc_identity)assumedIdentity
{
  return -[PABridgedTCCIdentity identity](self->_bridgedAssumedIdentity, "identity");
}

- (id)description
{
  int64_t identifierType;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  identifierType = self->_identifierType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[PAApplication descriptionForIdentifierType](self, "descriptionForIdentifierType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (identifierType == 4)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p identifierType:%@ assumedIdentity:%@>"), v5, self, v6, self->_bridgedAssumedIdentity);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PAApplication descriptionForIdentifier](self, "descriptionForIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p identifierType:%@ identifier:%@>"), v5, self, v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[PAApplication proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PAApplication)initWithProto:(id)a3
{
  id v4;
  id v5;
  PAApplication *v6;
  int v7;
  void *v8;
  PAApplication *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (PAApplication *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v5, "identifierType");
      if (v7 == 2)
      {
        objc_msgSend(v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[PAApplication initWithPath:](self, "initWithPath:", v8);
      }
      else
      {
        if (v7 != 1)
        {
          v6 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[PAApplication initWithBundleID:](self, "initWithBundleID:", v8);
      }
      self = v9;

      v6 = self;
    }
LABEL_10:

    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (PAApplication)initWithProtoData:(id)a3
{
  id v4;
  PAPBApplication *v5;
  PAApplication *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBApplication initWithData:]([PAPBApplication alloc], "initWithData:", v4);

    v6 = -[PAApplication initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  int64_t identifierType;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  identifierType = self->_identifierType;
  if (identifierType)
  {
    if (identifierType != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = 2;
    v7 = 24;
  }
  else
  {
    v6 = 1;
    v7 = 16;
  }
  objc_msgSend(v3, "setIdentifierType:", v6);
  objc_msgSend(v4, "setIdentifier:", *(Class *)((char *)&self->super.isa + v7));
  v8 = v4;
LABEL_7:

  return v8;
}

- (PABridgedTCCIdentity)bridgedAssumedIdentity
{
  return self->_bridgedAssumedIdentity;
}

@end
