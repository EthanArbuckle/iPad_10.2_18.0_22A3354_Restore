@implementation _NSLineBreakerNodeDictionary

- (void)dealloc
{
  __CFDictionary *dict;
  objc_super v4;

  dict = self->_dict;
  if (dict)
    CFRelease(dict);
  v4.receiver = self;
  v4.super_class = (Class)_NSLineBreakerNodeDictionary;
  -[_NSLineBreakerNodeDictionary dealloc](&v4, sel_dealloc);
}

- (void)setNode:(void *)key forClass:
{
  __CFDictionary *Mutable;

  if (a1)
  {
    if (a1[2] && (void *)a1[1] != key)
    {
      Mutable = (__CFDictionary *)a1[3];
      if (!Mutable)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
        a1[3] = Mutable;
      }
      CFDictionarySetValue(Mutable, key, value);
    }
    else
    {
      a1[1] = key;
      a1[2] = value;
    }
  }
}

- (void)enumerateClassesAndNodesUsingBlock:(_QWORD *)a1
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (a1[2])
      (*((void (**)(id, _QWORD))v3 + 2))(v3, a1[1]);
    v5 = (const __CFDictionary *)a1[3];
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __67___NSLineBreakerNodeDictionary_enumerateClassesAndNodesUsingBlock___block_invoke;
      v6[3] = &unk_1E26031C0;
      v7 = v4;
      _CFDictionaryApplyBlock(v5, v6);

    }
  }

}

@end
