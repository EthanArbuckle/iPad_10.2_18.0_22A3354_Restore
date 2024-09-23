@implementation OIXMLDocument

- (OIXMLDocument)initWithRootElement:(id)a3
{
  id v4;
  OIXMLDocument *v5;
  OIXMLDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OIXMLDocument;
  v5 = -[OIXMLDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[OIXMLDocument setRootElement:](v5, "setRootElement:", v4);

  return v6;
}

- (void)setRootElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setCharacterEncoding:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (OIXMLElement)rootElement
{
  return (OIXMLElement *)objc_getProperty(self, a2, 8, 1);
}

- (id)openingTagString
{
  return &stru_24F3BFFF8;
}

- (id)closingTagString
{
  return &stru_24F3BFFF8;
}

- (id)XMLString
{
  return -[OIXMLDocument createMutableXMLString](self, "createMutableXMLString");
}

- (id)createMutableXMLString
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 100000);
  -[OIXMLElement _appendXMLStringToString:level:](self->_rootElement, "_appendXMLStringToString:level:", v3, 0);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OIXMLDocument *v5;
  id v6;
  OIXMLDocument *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *encoding;

  v5 = [OIXMLDocument alloc];
  v6 = -[OIXMLElement copyWithZone:](self->_rootElement, "copyWithZone:", a3);
  v7 = -[OIXMLDocument initWithRootElement:](v5, "initWithRootElement:", v6);

  -[OIXMLDocument version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLDocument setVersion:](v7, "setVersion:", v8);

  -[OIXMLDocument characterEncoding](self, "characterEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLDocument setCharacterEncoding:](v7, "setCharacterEncoding:", v9);

  v10 = -[NSString copyWithZone:](self->_encoding, "copyWithZone:", a3);
  encoding = v7->_encoding;
  v7->_encoding = (NSString *)v10;

  return v7;
}

- (NSString)characterEncoding
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
}

@end
