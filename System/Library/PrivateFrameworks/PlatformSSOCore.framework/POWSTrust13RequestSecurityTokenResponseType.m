@implementation POWSTrust13RequestSecurityTokenResponseType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust13RequestSecurityTokenResponseType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"));
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Lifetime"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("AppliesTo"), CFSTR("http://schemas.xmlsoap.org/ws/2004/09/policy"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:maxOccurs:minOccurs:", CFSTR("RequestedSecurityToken"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class(), 1, 1);
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("RequestedAttachedReference"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("RequestedUnattachedReference"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("TokenType"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("RequestType"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("KeyType"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POWSTrustRequestedSecurityTokenType)RequestedSecurityToken
{
  return self->_RequestedSecurityToken;
}

- (void)setRequestedSecurityToken:(id)a3
{
  objc_storeStrong((id *)&self->_RequestedSecurityToken, a3);
}

- (POWSTrustTimestampType)Lifetime
{
  return self->_Lifetime;
}

- (void)setLifetime:(id)a3
{
  objc_storeStrong((id *)&self->_Lifetime, a3);
}

- (POWSTrustAppliesToType)AppliesTo
{
  return self->_AppliesTo;
}

- (void)setAppliesTo:(id)a3
{
  objc_storeStrong((id *)&self->_AppliesTo, a3);
}

- (POWSTrustReferenceType)RequestedAttachedReference
{
  return self->_RequestedAttachedReference;
}

- (void)setRequestedAttachedReference:(id)a3
{
  objc_storeStrong((id *)&self->_RequestedAttachedReference, a3);
}

- (POWSTrustReferenceType)RequestedUnattachedReference
{
  return self->_RequestedUnattachedReference;
}

- (void)setRequestedUnattachedReference:(id)a3
{
  objc_storeStrong((id *)&self->_RequestedUnattachedReference, a3);
}

- (NSString)TokenType
{
  return self->_TokenType;
}

- (void)setTokenType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)RequestType
{
  return self->_RequestType;
}

- (void)setRequestType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)KeyType
{
  return self->_KeyType;
}

- (void)setKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KeyType, 0);
  objc_storeStrong((id *)&self->_RequestType, 0);
  objc_storeStrong((id *)&self->_TokenType, 0);
  objc_storeStrong((id *)&self->_RequestedUnattachedReference, 0);
  objc_storeStrong((id *)&self->_RequestedAttachedReference, 0);
  objc_storeStrong((id *)&self->_AppliesTo, 0);
  objc_storeStrong((id *)&self->_Lifetime, 0);
  objc_storeStrong((id *)&self->_RequestedSecurityToken, 0);
}

@end
