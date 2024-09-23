@implementation POWSTrustReferenceType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustReferenceType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("SecurityTokenReference"), CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POWSTrustSecurityTokenReferenceType)SecurityTokenReference
{
  return self->_SecurityTokenReference;
}

- (void)setSecurityTokenReference:(id)a3
{
  objc_storeStrong((id *)&self->_SecurityTokenReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SecurityTokenReference, 0);
}

@end
