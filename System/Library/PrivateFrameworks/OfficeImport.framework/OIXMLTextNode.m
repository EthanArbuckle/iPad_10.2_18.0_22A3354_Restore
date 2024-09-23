@implementation OIXMLTextNode

- (id)name
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 216, CFSTR("This should never be reached"));

  return 0;
}

+ (id)textNodeWithStringValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStringValue:", v4);

  return v5;
}

- (OIXMLTextNode)initWithStringValue:(id)a3
{
  id v4;
  OIXMLTextNode *v5;
  OIXMLTextNode *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OIXMLTextNode;
  v5 = -[OIXMLTextNode init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[OIXMLTextNode setStringValue:](v5, "setStringValue:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[OIXMLTextNode stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStringValue:", v5);

  return v6;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  LOWORD(v7) = -3913;
  -[OIXMLTextNode stringValue](self, "stringValue", a3, *(_QWORD *)&a4, 0xB07ED0026003CLL, 0xF0A7000E000D0009, v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLNode _escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:](OIXMLNode, "_escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:", &v6, 9, 1, v5, a3);

}

- (id)stringValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
