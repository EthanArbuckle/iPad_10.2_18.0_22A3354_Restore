@implementation POSOAPCode

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Value"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Subcode"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSString)Value
{
  return self->_Value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (POSOAPSubcode)Subcode
{
  return self->_Subcode;
}

- (void)setSubcode:(id)a3
{
  objc_storeStrong((id *)&self->_Subcode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Subcode, 0);
  objc_storeStrong((id *)&self->_Value, 0);
}

@end
