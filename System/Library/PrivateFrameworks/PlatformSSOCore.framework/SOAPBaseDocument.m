@implementation SOAPBaseDocument

- (NSData)XMLData
{
  return (NSData *)-[SOAPBaseDocument XMLDataWithOptions:](self, "XMLDataWithOptions:", 0);
}

- (id)XMLDataWithOptions:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SOAPBaseDocument XMLStringWithOptions:](self, "XMLStringWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)XMLString
{
  return (NSString *)-[SOAPBaseDocument XMLStringWithOptions:](self, "XMLStringWithOptions:", 0);
}

- (id)XMLStringWithOptions:(unint64_t)a3
{
  return 0;
}

@end
