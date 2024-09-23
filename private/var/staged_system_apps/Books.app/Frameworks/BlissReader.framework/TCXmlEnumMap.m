@implementation TCXmlEnumMap

- (TCXmlEnumMap)initWithDescriptions:(const TCXmlEnumDescription *)a3
{
  char *i;

  self->mNameToValueMap = CFDictionaryCreateMutable(0, 10, (const CFDictionaryKeyCallBacks *)&TCXmlStringKeyCallBacks, 0);
  for (i = a3->var1; i; ++a3)
  {
    CFDictionaryAddValue(self->mNameToValueMap, i, (const void *)a3->var0);
    i = a3[1].var1;
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mNameToValueMap);
  v3.receiver = self;
  v3.super_class = (Class)TCXmlEnumMap;
  -[TCXmlEnumMap dealloc](&v3, "dealloc");
}

- (BOOL)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 value:(int64_t *)a6
{
  xmlChar *NsProp;
  void *value;

  NsProp = xmlGetNsProp(a3, (const xmlChar *)a5, (const xmlChar *)a4);
  if (NsProp)
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(self->mNameToValueMap, NsProp, (const void **)&value))
    {
      *a6 = (int64_t)value;
    }
    else
    {
      xmlFree(NsProp);
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("TCXmlException"), CFSTR("Attribute \"%s\" has bad value: %s"), a5, NsProp);
    }
    xmlFree(NsProp);
  }
  return NsProp != 0;
}

- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5
{
  int64_t v7;

  v7 = 0;
  if (!-[TCXmlEnumMap readFromNode:ns:name:value:](self, "readFromNode:ns:name:value:", a3, a4, a5, &v7))
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("TCXmlException"), CFSTR("Couldn't find attribute: %s"), a5);
  return v7;
}

- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 def:(int64_t)a6
{
  int64_t v8;

  v8 = 0;
  if (-[TCXmlEnumMap readFromNode:ns:name:value:](self, "readFromNode:ns:name:value:", a3, a4, a5, &v8))
    return v8;
  else
    return a6;
}

@end
