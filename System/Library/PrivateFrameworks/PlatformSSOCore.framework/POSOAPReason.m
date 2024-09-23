@implementation POSOAPReason

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addElementWithName:namespaceURI:type:", CFSTR("Text"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (POSOAPText)Text
{
  return self->_Text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_Text, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Text, 0);
}

@end
