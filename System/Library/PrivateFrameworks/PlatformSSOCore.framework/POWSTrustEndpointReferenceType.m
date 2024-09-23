@implementation POWSTrustEndpointReferenceType

+ (id)definition
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustEndpointReferenceType;
  objc_msgSendSuper2(&v4, sel_definition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Address"), CFSTR("http://www.w3.org/2005/08/addressing"), objc_opt_class());
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)Address
{
  return self->_Address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Address, 0);
}

@end
