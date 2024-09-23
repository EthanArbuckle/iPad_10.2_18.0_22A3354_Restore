@implementation SSDownloadPolicy

- (SSDownloadPolicy)initWithDownloadKind:(id)a3 URLBagType:(int64_t)a4
{
  SSDownloadPolicy *v6;
  SSDownloadPolicy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSDownloadPolicy;
  v6 = -[SSDownloadPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_bagType = a4;
    v6->_downloadKind = (NSString *)objc_msgSend(a3, "copy");
  }
  return v7;
}

- (SSDownloadPolicy)initWithNetworkConstraints:(id)a3
{
  SSDownloadPolicy *v4;
  SSDownloadPolicy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDownloadPolicy;
  v4 = -[SSDownloadPolicy init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SSDownloadPolicy unionNetworkConstraints:](v4, "unionNetworkConstraints:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicy;
  -[SSDownloadPolicy dealloc](&v3, sel_dealloc);
}

- (void)setPolicyRule:(id)a3
{
  id v5;
  NSMutableArray *policyRules;

  v5 = -[SSDownloadPolicy _policyRuleForSizeLimit:](self, "_policyRuleForSizeLimit:", objc_msgSend(a3, "downloadSizeLimit"));
  policyRules = self->_policyRules;
  if (v5)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_policyRules, "replaceObjectAtIndex:withObject:", -[NSMutableArray indexOfObjectIdenticalTo:](policyRules, "indexOfObjectIdenticalTo:"), a3);
  }
  else
  {
    if (!policyRules)
    {
      policyRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_policyRules = policyRules;
    }
    -[NSMutableArray addObject:](policyRules, "addObject:", a3);
  }
}

- (void)setPolicyRules:(id)a3
{
  NSMutableArray *policyRules;

  policyRules = self->_policyRules;
  if (policyRules != a3)
  {

    self->_policyRules = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
}

- (void)unionNetworkConstraints:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SSDownloadPolicy_unionNetworkConstraints___block_invoke;
  v3[3] = &unk_1E47BBA70;
  v3[4] = a3;
  v3[5] = self;
  SSNetworkTypeApplyBlock((uint64_t)v3);
}

void __44__SSDownloadPolicy_unionNetworkConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  SSDownloadPolicyRule *v4;

  v4 = objc_alloc_init(SSDownloadPolicyRule);
  -[SSDownloadPolicyRule addNetworkType:](v4, "addNetworkType:", a2);
  -[SSDownloadPolicyRule setDownloadSizeLimit:](v4, "setDownloadSizeLimit:", objc_msgSend(*(id *)(a1 + 32), "sizeLimitForNetworkType:", a2));
  objc_msgSend(*(id *)(a1 + 40), "unionPolicyRule:", v4);

}

- (void)unionPolicyRule:(id)a3
{
  id v5;
  NSMutableArray *policyRules;

  v5 = -[SSDownloadPolicy _policyRuleForSizeLimit:](self, "_policyRuleForSizeLimit:", objc_msgSend(a3, "downloadSizeLimit"));
  if (v5)
  {
    objc_msgSend(v5, "unionPolicyRule:", a3);
  }
  else
  {
    policyRules = self->_policyRules;
    if (!policyRules)
    {
      policyRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_policyRules = policyRules;
    }
    -[NSMutableArray addObject:](policyRules, "addObject:", a3);
  }
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_policyRules, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSString *downloadKind;
  int v7;
  NSMutableArray *policyRules;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_bagType == *((_QWORD *)a3 + 1))
  {
    downloadKind = self->_downloadKind;
    if (downloadKind == *((NSString **)a3 + 2)
      || (v7 = -[NSString isEqualToString:](downloadKind, "isEqualToString:")) != 0)
    {
      policyRules = self->_policyRules;
      if (policyRules == *((NSMutableArray **)a3 + 3))
        LOBYTE(v7) = 1;
      else
        LOBYTE(v7) = -[NSMutableArray isEqualToArray:](policyRules, "isEqualToArray:");
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_downloadKind, CFSTR("kind"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_policyRules, CFSTR("rules"));
  objc_msgSend(a3, "encodeObject:forKey:", SSGetStringForURLBagType(self->_bagType), CFSTR("bagtype"));
}

- (SSDownloadPolicy)initWithCoder:(id)a3
{
  SSDownloadPolicy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSDownloadPolicy;
  v4 = -[SSDownloadPolicy init](&v9, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bagtype"));
    v4->_bagType = SSURLBagTypeForString(v5);
    v4->_downloadKind = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v4->_policyRules = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("rules")), "mutableCopy");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_bagType;
  v5[2] = -[NSString copyWithZone:](self->_downloadKind, "copyWithZone:", a3);
  v5[3] = -[NSMutableArray mutableCopyWithZone:](self->_policyRules, "mutableCopyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_downloadKind);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_policyRules);
  xpc_dictionary_set_int64(v3, "2", self->_bagType);
  return v3;
}

- (SSDownloadPolicy)initWithXPCEncoding:(id)a3
{
  SSDownloadPolicy *v5;
  xpc_object_t value;
  uint64_t v8;
  id v9;
  objc_super v10;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSDownloadPolicy;
    v5 = -[SSDownloadPolicy init](&v10, sel_init);
    if (v5)
    {
      value = xpc_dictionary_get_value(a3, "1");
      v8 = objc_opt_class();
      v9 = SSXPCCreateNSArrayFromXPCEncodedArray(value, v8);
      v5->_bagType = xpc_dictionary_get_int64(a3, "2");
      objc_opt_class();
      v5->_downloadKind = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      v5->_policyRules = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)_policyRuleForSizeLimit:(int64_t)a3
{
  NSMutableArray *policyRules;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  policyRules = self->_policyRules;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](policyRules, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(policyRules);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "downloadSizeLimit") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](policyRules, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSString)downloadKind
{
  return self->_downloadKind;
}

- (NSArray)policyRules
{
  return &self->_policyRules->super;
}

- (int64_t)URLBagType
{
  return self->_bagType;
}

@end
