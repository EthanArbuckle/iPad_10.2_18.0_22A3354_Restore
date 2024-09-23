@implementation POWSTrustSecurityType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustSecurityType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("UsernameToken"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Timestamp"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"), objc_opt_class());
  objc_msgSend(v2, "addAttributeWithName:type:namespaceURI:", CFSTR("mustUnderstand"), objc_opt_class(), CFSTR("http://www.w3.org/2003/05/soap-envelope"));
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)mustUnderstand
{
  return self->_mustUnderstand;
}

- (void)setMustUnderstand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (POWSTrustUsernameTokenType)UsernameToken
{
  return self->_UsernameToken;
}

- (void)setUsernameToken:(id)a3
{
  objc_storeStrong((id *)&self->_UsernameToken, a3);
}

- (POWSTrustTimestampType)Timestamp
{
  return self->_Timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_Timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Timestamp, 0);
  objc_storeStrong((id *)&self->_UsernameToken, 0);
  objc_storeStrong((id *)&self->_mustUnderstand, 0);
}

@end
