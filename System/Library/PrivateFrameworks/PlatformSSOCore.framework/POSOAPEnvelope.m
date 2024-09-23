@implementation POSOAPEnvelope

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://www.w3.org/2003/05/soap-envelope"));
  objc_msgSend(v2, "addUnboundedElementWithName:namespaceURI:type:", CFSTR("Header"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  objc_msgSend(v2, "addUnboundedElementWithName:namespaceURI:type:", CFSTR("Body"), CFSTR("http://www.w3.org/2003/05/soap-envelope"), objc_opt_class());
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://www.w3.org/2005/08/addressing"));
  objc_msgSend(v2, "addNamespaceWithURI:", CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"));
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (NSArray)Header
{
  return self->_Header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)Body
{
  return self->_Body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Body, 0);
  objc_storeStrong((id *)&self->_Header, 0);
}

@end
