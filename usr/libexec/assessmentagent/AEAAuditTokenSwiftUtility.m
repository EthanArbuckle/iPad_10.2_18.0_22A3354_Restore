@implementation AEAAuditTokenSwiftUtility

+ (id)auditTokenWithUnderlyingAuditToken:(id *)a3
{
  AEAConcreteAuditToken *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = [AEAConcreteAuditToken alloc];
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return -[AEAConcreteAuditToken initWithAuditToken:](v4, "initWithAuditToken:", v7);
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)underlyingAuditTokenFromAuditToken:(SEL)a3
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v10;

  v10 = a4;
  v5 = objc_opt_class(AEAConcreteAuditToken);
  isKindOfClass = objc_opt_isKindOfClass(v10, v5);
  if (v10 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "underlyingToken");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAConcreteAuditToken invalidAuditToken](AEAConcreteAuditToken, "invalidAuditToken"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "underlyingToken");
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }

  }
  return result;
}

@end
