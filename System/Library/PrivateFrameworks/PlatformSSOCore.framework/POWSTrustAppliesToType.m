@implementation POWSTrustAppliesToType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustAppliesToType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://schemas.xmlsoap.org/ws/2004/09/policy"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("EndpointReference"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POWSTrustEndpointReferenceType)EndpointReference
{
  return self->_EndpointReference;
}

- (void)setEndpointReference:(id)a3
{
  objc_storeStrong((id *)&self->_EndpointReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EndpointReference, 0);
}

@end
