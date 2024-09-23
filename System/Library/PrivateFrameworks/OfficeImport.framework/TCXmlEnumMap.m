@implementation TCXmlEnumMap

- (TCXmlEnumMap)initWithDescriptions:(const TCXmlEnumDescription *)a3
{
  __CFDictionary *Mutable;
  char *i;

  Mutable = CFDictionaryCreateMutable(0, 10, &TCXmlStringKeyCallBacks, 0);
  self->mNameToValueMap = Mutable;
  if (Mutable)
  {
    for (i = a3->var1; i; ++a3)
    {
      CFDictionaryAddValue(self->mNameToValueMap, i, (const void *)a3->var0);
      i = a3[1].var1;
    }
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mNameToValueMap);
  v3.receiver = self;
  v3.super_class = (Class)TCXmlEnumMap;
  -[TCXmlEnumMap dealloc](&v3, sel_dealloc);
}

- (BOOL)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 value:(int64_t *)a6
{
  xmlChar *NsProp;
  __CFDictionary *mNameToValueMap;
  void (**v11)(xmlChar *);
  uint64_t v12;
  void *value;

  NsProp = xmlGetNsProp(a3, (const xmlChar *)a5, (const xmlChar *)a4);
  if (NsProp)
  {
    value = 0;
    mNameToValueMap = self->mNameToValueMap;
    v11 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
    if (mNameToValueMap && CFDictionaryGetValueIfPresent(mNameToValueMap, NsProp, (const void **)&value))
    {
      *a6 = (int64_t)value;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute \"%s\" has bad value: %s"), a5, NsProp);
      (*v11)(NsProp);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("TCXmlException"), v12, 0), "raise");
    }
    (*v11)(NsProp);
  }
  return NsProp != 0;
}

- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5
{
  int64_t v7;

  v7 = 0;
  if (!-[TCXmlEnumMap readFromNode:ns:name:value:](self, "readFromNode:ns:name:value:", a3, a4, a5, &v7))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("TCXmlException"), CFSTR("Couldn't find attribute: %s"), a5);
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
