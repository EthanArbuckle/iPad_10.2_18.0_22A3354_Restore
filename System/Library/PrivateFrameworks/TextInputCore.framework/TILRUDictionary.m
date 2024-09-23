@implementation TILRUDictionary

- (id)objectForKey:(id)a3
{
  void *v4;
  void *v5;

  CFDictionaryGetValue(self->_dictionary, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TILRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v4);
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->_dictionary);
  objc_storeStrong((id *)&self->_head->next, self->_tail);
  self->_tail->prev = self->_head;
}

- (TILRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  TILRUDictionary *v4;
  TILRUDictionaryNode *v5;
  TILRUDictionaryNode *head;
  TILRUDictionaryNode *v7;
  TILRUDictionaryNode *tail;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TILRUDictionary;
  v4 = -[TILRUDictionary init](&v10, sel_init);
  if (v4)
  {
    v4->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v4->_maxCount = a3;
    v5 = -[TILRUDictionaryNode initWithKey:object:]([TILRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    head = v4->_head;
    v4->_head = v5;

    v7 = -[TILRUDictionaryNode initWithKey:object:]([TILRUDictionaryNode alloc], "initWithKey:object:", 0, 0);
    tail = v4->_tail;
    v4->_tail = v7;

    objc_storeStrong((id *)&v4->_head->next, v4->_tail);
    v4->_tail->prev = v4->_head;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_dictionary);
  v3.receiver = self;
  v3.super_class = (Class)TILRUDictionary;
  -[TILRUDictionary dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  TILRUDictionaryNode *v4;
  id *p_isa;
  void *v6;
  void *v7;
  TILRUDictionaryNode *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>{\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    v8 = v4;
  }
  else
  {
    do
    {
      objc_msgSend(p_isa, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ = %@;\n"), v6, v7);

      v8 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v8->super.isa;
    }
    while (v8 != self->_tail);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));

  return v3;
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dictionary);
}

- (id)allKeys
{
  return (id)-[__CFDictionary allKeys](self->_dictionary, "allKeys");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  __CFDictionary *dictionary;
  id v7;
  uint64_t v8;
  TILRUDictionaryNode *v9;
  const void *v10;
  id key;

  key = a4;
  dictionary = self->_dictionary;
  v7 = a3;
  CFDictionaryGetValue(dictionary, key);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (TILRUDictionaryNode *)v8;
    -[TILRUDictionary _moveNodeToFront:](self, "_moveNodeToFront:", v8);
    -[TILRUDictionaryNode setObject:](v9, "setObject:", v7);
  }
  else
  {
    if (CFDictionaryGetCount(self->_dictionary) == self->_maxCount)
      -[TILRUDictionary _removeNode:](self, "_removeNode:", self->_tail->prev);
    v10 = (const void *)objc_msgSend(key, "copyWithZone:", 0);
    v9 = -[TILRUDictionaryNode initWithKey:object:]([TILRUDictionaryNode alloc], "initWithKey:object:", v10, v7);

    CFDictionaryAddValue(self->_dictionary, v10, v9);
    -[TILRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v9);
    v7 = (id)v10;
  }

}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;

  CFDictionaryGetValue(self->_dictionary, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[TILRUDictionary _removeNode:](self, "_removeNode:", v4);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMaximumCapacity:", a3);
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;

  v4 = (_QWORD *)*((_QWORD *)a3 + 4);
  v5 = *((id *)a3 + 3);
  v6 = (void *)v4[3];
  v4[3] = v5;
  v7 = v5;
  v8 = v4;
  v9 = a3;

  v7[4] = v8;
}

- (void)_removeNode:(id)a3
{
  id v4;
  __CFDictionary *dictionary;
  const void *v6;

  v4 = a3;
  -[TILRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:", v4);
  dictionary = self->_dictionary;
  v6 = (const void *)objc_msgSend(v4, "key");

  CFDictionaryRemoveValue(dictionary, v6);
}

- (void)_moveNodeToFront:(id)a3
{
  id v4;

  if (self->_head->next != a3)
  {
    v4 = a3;
    -[TILRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:", v4);
    -[TILRUDictionary _addNodeToFront:](self, "_addNodeToFront:", v4);

  }
}

- (void)_addNodeToFront:(id)a3
{
  TILRUDictionaryNode *v4;
  TILRUDictionaryNode *v5;
  TILRUDictionaryNode *head;
  TILRUDictionaryNode *next;
  TILRUDictionaryNode *v8;
  TILRUDictionaryNode *v9;
  TILRUDictionaryNode *v10;
  TILRUDictionaryNode *v11;

  v4 = (TILRUDictionaryNode *)a3;
  v5 = self->_head->next;
  head = self->_head;
  next = head->next;
  head->next = v4;
  v11 = v4;

  v8 = self->_head;
  v9 = v11->next;
  v11->next = v5;
  v11->prev = v8;
  v10 = v5;

  v10->prev = v11;
}

- (unint64_t)linkedListCount
{
  TILRUDictionaryNode *v3;
  TILRUDictionaryNode *v4;
  unint64_t v5;
  id *p_isa;

  v3 = self->_head->next;
  v4 = v3;
  if (v3 == self->_tail)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    p_isa = (id *)&v3->super.isa;
    do
    {
      ++v5;
      v4 = (TILRUDictionaryNode *)p_isa[3];

      p_isa = (id *)&v4->super.isa;
    }
    while (v4 != self->_tail);
  }

  return v5;
}

- (id)allKeysInLRUOrder
{
  void *v3;
  TILRUDictionaryNode *v4;
  id *p_isa;
  void *v6;
  TILRUDictionaryNode *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    v7 = v4;
  }
  else
  {
    do
    {
      objc_msgSend(p_isa, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      v7 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v7->super.isa;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (id)allValuesInLRUOrder
{
  void *v3;
  TILRUDictionaryNode *v4;
  id *p_isa;
  void *v6;
  TILRUDictionaryNode *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    v7 = v4;
  }
  else
  {
    do
    {
      objc_msgSend(p_isa, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      v7 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v7->super.isa;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (id)objectForKeyWithoutAffectingLRU:(id)a3
{
  return (id)objc_msgSend((id)CFDictionaryGetValue(self->_dictionary, a3), "object");
}

@end
