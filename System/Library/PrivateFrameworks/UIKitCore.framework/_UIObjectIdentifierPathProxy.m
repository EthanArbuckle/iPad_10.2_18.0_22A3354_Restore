@implementation _UIObjectIdentifierPathProxy

- (_UIObjectIdentifierPathProxy)initWithObject:(id)a3
{
  void *v5;
  _UIObjectIdentifierPathProxy *v6;
  _UIObjectIdentifierPathProxy *v7;
  objc_super v9;

  v5 = (void *)objc_msgSend((id)_restorationIdentifierPathArrayForObject(a3), "componentsJoinedByString:", CFSTR("/"));
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Initializing with identifier path %@"), "-[_UIObjectIdentifierPathProxy initWithObject:]", v5);
  v9.receiver = self;
  v9.super_class = (Class)_UIObjectIdentifierPathProxy;
  v6 = -[_UIObjectIdentifierPathProxy init](&v9, sel_init);
  if (v6)
  {
    if (v5)
    {
      v6->_identifierPath = (NSString *)v5;
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Warning! Tried to create _UIObjectIdentifierPathProxy for object without restoration path: %@"), "-[_UIObjectIdentifierPathProxy initWithObject:]", a3);
      v7 = v6;
      return 0;
    }
  }
  return v6;
}

- (_UIObjectIdentifierPathProxy)initWithCoder:(id)a3
{
  uint64_t v4;
  int v5;
  _UIObjectIdentifierPathProxy *v6;
  id v8;

  v4 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kObjectIdentifierPathProxyIdentifierPathKey"));
  v5 = _UIStateRestorationDebugLogEnabled();
  if (v4)
  {
    if (v5)
      NSLog(CFSTR("%s: Decoded restoration identifier path %@"), "-[_UIObjectIdentifierPathProxy initWithCoder:]", v4);
    v8 = +[UIResponder objectWithRestorationIdentifierPath:](UIResponder, "objectWithRestorationIdentifierPath:", v4);
  }
  else
  {
    if (v5)
      NSLog(CFSTR("%s: Warning! Couldn't decode restoration identifier path, returning nil"), "-[_UIObjectIdentifierPathProxy initWithCoder:]");
    v8 = 0;
  }
  v6 = self;
  return (_UIObjectIdentifierPathProxy *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifierPath, CFSTR("kObjectIdentifierPathProxyIdentifierPathKey"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s<%p>: %@"), object_getClassName(self), self, self->_identifierPath);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIObjectIdentifierPathProxy;
  -[_UIObjectIdentifierPathProxy dealloc](&v3, sel_dealloc);
}

@end
