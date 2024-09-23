@implementation AEAConcreteAuditToken

- (AEAConcreteAuditToken)initWithAuditToken:(id *)a3
{
  AEAConcreteAuditToken *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEAConcreteAuditToken;
  result = -[AEAConcreteAuditToken init](&v6, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_underlyingToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_underlyingToken.val[4] = v5;
  }
  return result;
}

+ (id)auditTokenWithData:(id)a3
{
  void *v3;
  void *v4;
  __int128 v5;
  AEAConcreteAuditToken *v6;
  AEAConcreteAuditToken *v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ae_valueFromData:ofObjCType:](NSValue, "ae_valueFromData:ofObjCType:", a3, "{?=[8I]}"));
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    v10 = v5;
    v11 = v5;
    objc_msgSend(v3, "getValue:", &v10);
    v6 = [AEAConcreteAuditToken alloc];
    v9[0] = v10;
    v9[1] = v11;
    v7 = -[AEAConcreteAuditToken initWithAuditToken:](v6, "initWithAuditToken:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)invalidAuditToken
{
  AEAConcreteAuditToken *v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = [AEAConcreteAuditToken alloc];
  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return -[AEAConcreteAuditToken initWithAuditToken:](v2, "initWithAuditToken:", v5);
}

- (int)processIdentifier
{
  audit_token_t v3;

  -[AEAConcreteAuditToken underlyingToken](self, "underlyingToken");
  return audit_token_to_pid(&v3);
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;
  __int128 v5;

  -[AEAConcreteAuditToken underlyingToken](self, "underlyingToken", 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", &v5, "{?=[8I]}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ae_dataRepresentation"));

  return v3;
}

- (unint64_t)hash
{
  return -[AEAConcreteAuditToken processIdentifier](self, "processIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  AEAConcreteAuditToken *v4;
  AEAConcreteAuditToken *v5;
  BOOL v6;

  v4 = (AEAConcreteAuditToken *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAConcreteAuditToken isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(AEAConcreteAuditToken)))v6 = sub_1000032C0(self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)underlyingToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

@end
