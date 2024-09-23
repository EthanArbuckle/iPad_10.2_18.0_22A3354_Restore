@implementation _UIBarAppearanceData

- (id)markReadOnly
{
  *((_BYTE *)self + 8) = 1;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_immutable)
    return self;
  -[_UIBarAppearanceData replicate](self, "replicate", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  _UIBarAppearanceData *v4;
  _UIBarAppearanceData *v5;
  BOOL v6;

  v4 = (_UIBarAppearanceData *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && -[_UIBarAppearanceData isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[_UIBarAppearanceData checkEqualTo:](self, "checkEqualTo:", v5);

  return v6;
}

- (BOOL)checkEqualTo:(id)a3
{
  return 1;
}

- (id)writableInstance
{
  _UIBarAppearanceData *v2;

  if (self->_immutable)
  {
    -[_UIBarAppearanceData replicate](self, "replicate");
    v2 = (_UIBarAppearanceData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self;
  }
  return v2;
}

- (id)replicate
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)assertMutable:(SEL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_immutable)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Attempt to mutate immutable instance %@ (selector %@)"), self, v6);

  }
}

- (unint64_t)hash
{
  return -[_UIBarAppearanceData hashInto:](self, "hashInto:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIBarAppearanceData;
  -[_UIBarAppearanceData description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_immutable)
    v5 = CFSTR(" ro");
  else
    v5 = CFSTR(" rw");
  objc_msgSend(v4, "appendString:", v5);
  -[_UIBarAppearanceData describeInto:](self, "describeInto:", v4);
  return v4;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  return 0;
}

- (int64_t)hashInto:(int64_t)a3
{
  return a3;
}

@end
