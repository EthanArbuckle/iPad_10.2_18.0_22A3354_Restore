@implementation POWSTrustTimestampType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustTimestampType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAttributeWithName:type:namespaceURI:", CFSTR("Id"), objc_opt_class(), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Created"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Expires"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)Id
{
  return self->_Id;
}

- (void)setId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)Created
{
  return self->_Created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_Created, a3);
}

- (NSDate)Expires
{
  return self->_Expires;
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_Expires, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Expires, 0);
  objc_storeStrong((id *)&self->_Created, 0);
  objc_storeStrong((id *)&self->_Id, 0);
}

@end
