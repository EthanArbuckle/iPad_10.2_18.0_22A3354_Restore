@implementation PFXElementReaderInfo

- (PFXElementReaderInfo)initWithElementName:(const char *)a3 elementNamespace:(const char *)a4 mappingClass:(Class)a5
{
  PFXElementReaderInfo *result;
  objc_super v9;

  if (a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)PFXElementReaderInfo;
    result = -[PFXElementReaderInfo init](&v9, "init");
    if (result)
    {
      result->mElementName = a3;
      result->mElementNamespace = a4;
      result->mMappingClass = a5;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (const)elementName
{
  return self->mElementName;
}

- (const)elementNamespace
{
  return self->mElementNamespace;
}

- (Class)mappingClass
{
  return self->mMappingClass;
}

@end
