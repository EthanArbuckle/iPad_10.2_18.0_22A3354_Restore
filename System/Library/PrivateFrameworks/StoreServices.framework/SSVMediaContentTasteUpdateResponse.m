@implementation SSVMediaContentTasteUpdateResponse

- (void)encodeWithCoder:(id)a3
{
  NSArray *contentTasteItems;
  id v5;

  contentTasteItems = self->_contentTasteItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contentTasteItems, CFSTR("SSVMediaContentTasteUpdateResponseContentTasteItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("SSVMediaContentTasteUpdateResponseExpirationDate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_responseRevisionID, CFSTR("SSVMediaContentTasteUpdateResponseResponseRevisionID"));

}

- (SSVMediaContentTasteUpdateResponse)initWithCoder:(id)a3
{
  id v4;
  SSVMediaContentTasteUpdateResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *contentTasteItems;
  uint64_t v11;
  NSDate *expirationDate;

  v4 = a3;
  v5 = -[SSVMediaContentTasteUpdateResponse init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SSVMediaContentTasteUpdateResponseContentTasteItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    contentTasteItems = v5->_contentTasteItems;
    v5->_contentTasteItems = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSVMediaContentTasteUpdateResponseExpirationDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v11;

    v5->_responseRevisionID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVMediaContentTasteUpdateResponseResponseRevisionID"));
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_cachedResponse)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p contentTasteItems:%@ expirationDate:%@ responseRevisionID:%llu isCachedResponse:%@>"), v5, self, *(_OWORD *)&self->_contentTasteItems, self->_responseRevisionID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteUpdateResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  uint64_t v5;
  id NSSecureCodingObjectForXPCObject;
  SSVMediaContentTasteUpdateResponse *v7;

  v4 = a3;
  v5 = objc_opt_class();
  NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  v7 = (SSVMediaContentTasteUpdateResponse *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (NSArray)contentTasteItems
{
  return self->_contentTasteItems;
}

- (void)setContentTasteItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)responseRevisionID
{
  return self->_responseRevisionID;
}

- (void)setResponseRevisionID:(unint64_t)a3
{
  self->_responseRevisionID = a3;
}

- (BOOL)isCachedResponse
{
  return self->_cachedResponse;
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_contentTasteItems, 0);
}

@end
