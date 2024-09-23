@implementation POWSTrustActionType

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentPropertyName:type:", CFSTR("stringValue"), objc_opt_class());
  objc_msgSend(v2, "addAttributeWithName:type:namespaceURI:", CFSTR("mustUnderstand"), objc_opt_class(), CFSTR("http://www.w3.org/2003/05/soap-envelope"));
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)mustUnderstand
{
  return self->_mustUnderstand;
}

- (void)setMustUnderstand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mustUnderstand, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
