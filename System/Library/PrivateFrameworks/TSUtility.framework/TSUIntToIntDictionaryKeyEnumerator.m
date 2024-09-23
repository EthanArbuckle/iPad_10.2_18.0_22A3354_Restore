@implementation TSUIntToIntDictionaryKeyEnumerator

- (TSUIntToIntDictionaryKeyEnumerator)initWithIntegerKeyDictionary:(id)a3
{
  TSUIntToIntDictionaryKeyEnumerator *v4;
  size_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUIntToIntDictionaryKeyEnumerator;
  v4 = -[TSUIntToIntDictionaryKeyEnumerator init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "count");
    v4->_count = v5;
    if (v5)
    {
      v4->_keys = (int64_t **)malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)objc_msgSend(a3, "p_cfDictionary"), (const void **)v4->_keys, 0);
    }
  }
  return v4;
}

- (void)dealloc
{
  int64_t **keys;
  objc_super v4;

  keys = self->_keys;
  if (keys)
    free(keys);
  v4.receiver = self;
  v4.super_class = (Class)TSUIntToIntDictionaryKeyEnumerator;
  -[TSUIntToIntDictionaryKeyEnumerator dealloc](&v4, sel_dealloc);
}

- (int64_t)nextKey
{
  unint64_t index;
  int64_t **keys;

  index = self->_index;
  if (index >= self->_count)
    return 0x7FFFFFFFFFFFFFFFLL;
  keys = self->_keys;
  self->_index = index + 1;
  return (int64_t)keys[index];
}

@end
