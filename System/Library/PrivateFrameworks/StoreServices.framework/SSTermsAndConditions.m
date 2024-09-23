@implementation SSTermsAndConditions

- (SSTermsAndConditions)initWithResponseData:(id)a3 error:(id *)a4
{
  void *v6;
  SSTermsAndConditions *v7;
  SSTermsAndConditions *v8;
  void *v9;
  uint64_t v10;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;
  void *v21;

  v21 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v21);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_18:
    if (!a4)
      return 0;
    v17 = v21;
    if (!v21)
      v17 = (void *)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v8 = 0;
    *a4 = v17;
    return v8;
  }
  v20.receiver = self;
  v20.super_class = (Class)SSTermsAndConditions;
  v7 = -[SSTermsAndConditions init](&v20, sel_init);
  if (!v7)
    goto LABEL_18;
  v8 = v7;
  v9 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("errorNumber"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "integerValue");
    v12 = v10 == 5300 || v10 == 5601;
    v8->_requiresAuthentication = v12;
  }
  v13 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("latestTermsVersionId"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8->_versionID = objc_msgSend(v13, "longLongValue");
  v14 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("isCurrent"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8->_userAccepted = objc_msgSend(v14, "BOOLValue");
  v15 = objc_msgSend(v6, "objectForKey:", CFSTR("termsContentText"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)v15;
LABEL_25:
    v8->_text = (NSString *)objc_msgSend(v16, "copy");
    return v8;
  }
  v18 = objc_msgSend(v6, "objectForKey:", CFSTR("termsContextText"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)v18;
    goto LABEL_25;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSTermsAndConditions;
  -[SSTermsAndConditions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_requiresAuthentication;
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 24) = self->_userAccepted;
  *(_QWORD *)(v5 + 32) = self->_versionID;
  return (id)v5;
}

- (NSString)currentText
{
  return self->_text;
}

- (void)setCurrentText:(id)a3
{
  self->_text = (NSString *)a3;
}

- (int64_t)currentVersionIdentifier
{
  return self->_versionID;
}

- (void)setCurrentVersionIdentifier:(int64_t)a3
{
  self->_versionID = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isUserAccepted
{
  return self->_userAccepted;
}

- (void)setUserAccepted:(BOOL)a3
{
  self->_userAccepted = a3;
}

@end
