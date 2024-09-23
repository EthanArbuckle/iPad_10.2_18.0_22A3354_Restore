@implementation ObjectCacheByCString

- (ObjectCacheByCString)init
{
  objc_super v4;

  self->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &kCStringDictionaryKeyCallBacks, MEMORY[0x24BDBD6B0]);
  v4.receiver = self;
  v4.super_class = (Class)ObjectCacheByCString;
  return -[ObjectCacheByCString init](&v4, sel_init);
}

- (void)dealloc
{
  __CFDictionary *dictionary;
  objc_super v4;

  dictionary = self->_dictionary;
  if (dictionary)
    CFRelease(dictionary);
  v4.receiver = self;
  v4.super_class = (Class)ObjectCacheByCString;
  -[ObjectCacheByCString dealloc](&v4, sel_dealloc);
}

- (void)setObject:(id)a3 forCStringKey:(char *)a4
{
  CFDictionaryAddValue(self->_dictionary, a4, a3);
}

- (id)getObjectForCStringKey:(char *)a3
{
  return (id)CFDictionaryGetValue(self->_dictionary, a3);
}

@end
