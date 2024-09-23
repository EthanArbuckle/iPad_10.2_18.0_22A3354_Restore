@implementation POWSTrust13RequestSecurityTokenType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust13RequestSecurityTokenType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("AppliesTo"), CFSTR("http://schemas.xmlsoap.org/ws/2004/09/policy"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("KeyType"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("RequestType"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)KeyType
{
  return self->_KeyType;
}

- (void)setKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)RequestType
{
  return self->_RequestType;
}

- (void)setRequestType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (POWSTrustAppliesToType)AppliesTo
{
  return self->_AppliesTo;
}

- (void)setAppliesTo:(id)a3
{
  objc_storeStrong((id *)&self->_AppliesTo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AppliesTo, 0);
  objc_storeStrong((id *)&self->_RequestType, 0);
  objc_storeStrong((id *)&self->_KeyType, 0);
}

@end
