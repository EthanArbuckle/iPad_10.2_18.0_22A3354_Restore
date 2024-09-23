@implementation POWSTrustRequestedSecurityTokenType

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentPropertyName:type:", CFSTR("stringValue"), objc_opt_class());
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
