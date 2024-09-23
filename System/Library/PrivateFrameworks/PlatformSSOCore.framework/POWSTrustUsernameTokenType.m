@implementation POWSTrustUsernameTokenType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustUsernameTokenType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAttributeWithName:type:namespaceURI:", CFSTR("Id"), objc_opt_class(), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Username"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Password"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
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

- (NSString)Username
{
  return self->_Username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)Password
{
  return self->_Password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Password, 0);
  objc_storeStrong((id *)&self->_Username, 0);
  objc_storeStrong((id *)&self->_Id, 0);
}

@end
