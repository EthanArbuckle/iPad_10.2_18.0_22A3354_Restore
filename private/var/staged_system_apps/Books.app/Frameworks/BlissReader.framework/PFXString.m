@implementation PFXString

- (PFXString)initWithXmlString:(const char *)a3
{
  PFXString *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PFXString;
    v4 = -[PFXString init](&v6, "init");
    if (v4)
      v4->mXmlString = (char *)xmlStrdup((const xmlChar *)a3);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->mXmlString);
  self->mXmlString = 0;

  self->mNSString = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFXString;
  -[PFXString dealloc](&v3, "dealloc");
}

- (NSString)nsString
{
  NSString *result;

  result = self->mNSString;
  if (!result)
  {
    result = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", self->mXmlString);
    self->mNSString = result;
  }
  return result;
}

- (const)xmlString
{
  return self->mXmlString;
}

- (const)cString
{
  return self->mXmlString;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_opt_class(self, a2);
  return v5 == objc_opt_class(a3, v6)
      && xmlStrEqual((const xmlChar *)self->mXmlString, *((const xmlChar **)a3 + 1)) != 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->mNSString, "hash");
}

@end
