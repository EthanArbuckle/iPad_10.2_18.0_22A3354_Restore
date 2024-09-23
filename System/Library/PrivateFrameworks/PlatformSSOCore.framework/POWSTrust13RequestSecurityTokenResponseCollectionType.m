@implementation POWSTrust13RequestSecurityTokenResponseCollectionType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust13RequestSecurityTokenResponseCollectionType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"));
  objc_msgSend(v2, "addUnboundedElementWithName:namespaceURI:type:", CFSTR("RequestSecurityTokenResponse"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSArray)RequestSecurityTokenResponse
{
  return self->_RequestSecurityTokenResponse;
}

- (void)setRequestSecurityTokenResponse:(id)a3
{
  objc_storeStrong((id *)&self->_RequestSecurityTokenResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RequestSecurityTokenResponse, 0);
}

@end
