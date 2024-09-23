@implementation POWSTrustSecurityTokenReferenceType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustSecurityTokenReferenceType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"));
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-wssecurity-secext-1.1.xsd"));
  objc_msgSend(v2, "addAttributeWithName:type:namespaceURI:", CFSTR("TokenType"), objc_opt_class(), CFSTR("http://docs.oasis-open.org/wss/oasis-wss-wssecurity-secext-1.1.xsd"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("KeyIdentifier"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POWSTrustKeyIdentifierType)KeyIdentifier
{
  return self->_KeyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_KeyIdentifier, a3);
}

- (NSString)TokenType
{
  return self->_TokenType;
}

- (void)setTokenType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_TokenType, 0);
  objc_storeStrong((id *)&self->_KeyIdentifier, 0);
}

@end
