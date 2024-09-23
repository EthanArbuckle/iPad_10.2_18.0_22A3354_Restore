@implementation PKApplyActionContentTextItemODIDetail

- (PKApplyActionContentTextItemODIDetail)initWithDictionary:(id)a3
{
  id v4;
  PKApplyActionContentTextItemODIDetail *v5;
  uint64_t v6;
  NSString *odiAttribute;
  uint64_t v8;
  NSString *odiValue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyActionContentTextItemODIDetail;
  v5 = -[PKApplyActionContentTextItemODIDetail init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("odiAttribute"));
    v6 = objc_claimAutoreleasedReturnValue();
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("odiValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    odiValue = v5->_odiValue;
    v5->_odiValue = (NSString *)v8;

  }
  return v5;
}

- (id)odiAttributesDictionary
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "safelySetObject:forKey:", self->_odiValue, self->_odiAttribute);
  return v3;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_odiAttribute)
    objc_msgSend(v3, "appendString:");
  if (self->_odiValue)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyActionContentTextItemODIDetail *v5;
  uint64_t v6;
  NSString *odiAttribute;
  uint64_t v8;
  NSString *odiValue;

  v5 = -[PKApplyActionContentTextItemODIDetail init](+[PKApplyActionContentTextItemODIDetail allocWithZone:](PKApplyActionContentTextItemODIDetail, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_odiAttribute, "copyWithZone:", a3);
  odiAttribute = v5->_odiAttribute;
  v5->_odiAttribute = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_odiValue, "copyWithZone:", a3);
  odiValue = v5->_odiValue;
  v5->_odiValue = (NSString *)v8;

  return v5;
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (NSString)odiValue
{
  return self->_odiValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiValue, 0);
  objc_storeStrong((id *)&self->_odiAttribute, 0);
}

@end
