@implementation TSUDateFormat

+ (id)formatWithFormat:(id)a3 name:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFormat:name:", a3, a4);
}

- (TSUDateFormat)initWithFormat:(id)a3 name:(id)a4
{
  TSUDateFormat *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUDateFormat;
  v6 = -[TSUDateFormat init](&v8, sel_init);
  if (v6)
  {
    v6->mFormat = (NSString *)a3;
    v6->mName = (NSString *)a4;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:name:", self->mFormat, self->mName);
}

- (void)dealloc
{
  objc_super v3;

  self->mFormat = 0;
  self->mName = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormat;
  -[TSUDateFormat dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  NSString *mName;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSString isEqualToString:](self->mFormat, "isEqualToString:", *((_QWORD *)a3 + 1));
    if (v5)
    {
      mName = self->mName;
      if ((unint64_t)mName | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSString isEqualToString:](mName, "isEqualToString:");
      else
        LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->mName, "hash");
  return -[NSString hash](self->mFormat, "hash") + v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SFTDateFormat[%p]: Format String: %@ Name: %@"), self, self->mFormat, self->mName);
}

- (id)format
{
  return self->mFormat;
}

- (id)formatName
{
  return self->mName;
}

- (void)setFormatName:(id)a3
{
  id v5;

  v5 = a3;

  self->mName = (NSString *)a3;
}

@end
