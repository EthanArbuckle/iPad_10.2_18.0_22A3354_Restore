@implementation OIXMLAttribute

+ (id)attributeWithName:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:stringValue:", v7, v6);

  return v8;
}

- (OIXMLAttribute)initWithName:(id)a3 stringValue:(id)a4
{
  id v7;
  id v8;
  OIXMLAttribute *v9;
  OIXMLAttribute *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OIXMLAttribute;
  v9 = -[OIXMLAttribute init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:stringValue:", self->_name, self->_value);
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  __CFString *v6;
  void *v7;
  int v8;
  __int16 v9;
  UniChar chars[2];
  UniChar v11;

  v11 = 34;
  *(_DWORD *)chars = 2228285;
  -[OIXMLAttribute name](self, "name", a3, *(_QWORD *)&a4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringAppend(a3, v6);
  CFStringAppendCharacters(a3, chars, 2);
  v8 = 2490428;
  v9 = 34;
  -[OIXMLAttribute stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLNode _escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:](OIXMLNode, "_escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:", &v8, 3, 0, v7, a3);

  CFStringAppendCharacters(a3, &v11, 1);
}

- (id)name
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)stringValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
