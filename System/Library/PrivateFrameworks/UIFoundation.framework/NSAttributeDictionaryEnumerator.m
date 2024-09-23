@implementation NSAttributeDictionaryEnumerator

- (id)nextObject
{
  unint64_t nextElement;
  NSAttributeDictionary *dictionary;

  nextElement = self->nextElement;
  dictionary = self->dictionary;
  if (nextElement == dictionary->numElements)
    return 0;
  self->nextElement = nextElement + 1;
  return dictionary->elements[nextElement].key;
}

- (NSAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3
{
  NSAttributeDictionaryEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSAttributeDictionaryEnumerator;
  v4 = -[NSAttributeDictionaryEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->dictionary = (NSAttributeDictionary *)a3;
    v4->nextElement = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDictionaryEnumerator;
  -[NSAttributeDictionaryEnumerator dealloc](&v3, sel_dealloc);
}

@end
