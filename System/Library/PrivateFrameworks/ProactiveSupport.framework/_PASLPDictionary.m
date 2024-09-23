@implementation _PASLPDictionary

- (id)objectForKey:(id)a3
{
  return (id)-[_PASLPReaderProtocol objectForKey:usingDictionaryContext:](self->_reader, "objectForKey:usingDictionaryContext:", a3, self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objectsAndKeys);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (_PASLPDictionary)initWithLazyPlistReader:(id)a3 context:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _PASLPDictionary *v11;
  _PASLPDictionary *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPDictionary.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reader"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPDictionary.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_PASLPDictionary;
  v11 = -[_PASLPDictionary init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_reader, a3);
    objc_storeStrong((id *)&v12->_context, a4);
  }

  return v12;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, void *, _BYTE *);
  unint64_t v7;
  _PASLPDictionaryContext *context;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned __int8 v14;

  v6 = (void (**)(id, void *, void *, _BYTE *))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPDictionary.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v7 = 0;
  v14 = 0;
  do
  {
    context = self->_context;
    if (context)
      context = (_PASLPDictionaryContext *)context->_count;
    if (v7 >= (unint64_t)context)
      break;
    v9 = (void *)MEMORY[0x1A1AFDC98]();
    -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:", v7, self->_context);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLPReaderProtocol objectAtIndex:usingDictionaryContext:](self->_reader, "objectAtIndex:usingDictionaryContext:", v7, self->_context);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, v11, &v14);
    v12 = v14;

    objc_autoreleasePoolPop(v9);
    ++v7;
  }
  while (!v12);

}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[_PASLPDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, a3);
}

- (_PASLPDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  _PASLPDictionary *v6;

  v6 = (_PASLPDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", a3, a4, a5);

  return v6;
}

- (_PASLPDictionary)initWithCoder:(id)a3
{
  _PASLPDictionary *result;

  result = (_PASLPDictionary *)a3;
  __break(1u);
  return result;
}

- (unint64_t)count
{
  _PASLPDictionaryContext *context;

  context = self->_context;
  if (context)
    return context->_count;
  else
    return 0;
}

- (id)keyEnumerator
{
  return -[_PASLPDictionaryEnumerator initWithLazyPlistReader:context:]([_PASLPDictionaryEnumerator alloc], "initWithLazyPlistReader:context:", self->_reader, self->_context);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  void *v11;
  id v12;
  _PASLPDictionaryContext *context;
  void *v14;
  void *v15;
  _PASLPDictionaryContext *v16;
  unint64_t v17;
  unint64_t v18;
  _PASLPDictionaryContext *v19;
  void *v20;
  void *v22;

  var0 = a3->var0;
  -[_PASLPDictionaryContext enumerationCache](self->_context, "enumerationCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (var0)
  {
    if (v11)
      objc_msgSend(v11, "removeAllObjects");
  }
  else if (!v11)
  {
    context = self->_context;
    if (context && context->_count)
    {
      v14 = (void *)objc_opt_new();
      v15 = v14;
      v16 = self->_context;
      if (v16)
        v16 = (_PASLPDictionaryContext *)v16->_count;
      if ((unint64_t)v16 >= a5)
        v17 = a5;
      else
        v17 = (unint64_t)v16;
      objc_msgSend(v14, "setCountLimit:", v17);
      -[_PASLPDictionaryContext setEnumerationCache:](self->_context, "setEnumerationCache:", v15);
      v12 = v15;
      CFAutorelease(v12);
    }
    else
    {
      v12 = 0;
    }
  }

  v18 = 0;
  if (a5)
  {
    while (1)
    {
      v19 = self->_context;
      if (!v19 || a3->var0 >= v19->_count)
        break;
      -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPDictionary.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

      }
      CFRetain(v20);
      CFAutorelease(v20);
      a4[v18] = v20;
      ++a3->var0;

      if (a5 == ++v18)
      {
        v18 = a5;
        break;
      }
    }
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  return v18;
}

- (id)allKeys
{
  id v3;
  _PASLPDictionaryContext *context;
  unint64_t count;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  context = self->_context;
  if (context)
    count = context->_count;
  else
    count = 0;
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", count);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27___PASLPDictionary_allKeys__block_invoke;
  v10[3] = &unk_1E4430630;
  v11 = v6;
  v7 = v6;
  -[_PASLPDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (id)allValues
{
  id v3;
  _PASLPDictionaryContext *context;
  unint64_t count;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  context = self->_context;
  if (context)
    count = context->_count;
  else
    count = 0;
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", count);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29___PASLPDictionary_allValues__block_invoke;
  v10[3] = &unk_1E4430630;
  v11 = v6;
  v7 = v6;
  -[_PASLPDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (id)allKeysForObject:(id)a3
{
  id v4;
  _PASLPDictionaryContext *context;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4 && (context = self->_context) != 0 && context->_count)
  {
    v6 = (void *)objc_opt_new();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __37___PASLPDictionary_allKeysForObject___block_invoke;
    v13 = &unk_1E4430658;
    v14 = v4;
    v15 = v6;
    v7 = v6;
    -[_PASLPDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", &v10);
    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  _PASLPDictionary *v4;
  _PASLPDictionary *v5;
  BOOL v6;
  uint64_t v7;
  _PASLPDictionaryContext *context;
  _QWORD v10[4];
  _PASLPDictionary *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (_PASLPDictionary *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_6;
  if (!v4)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_reader != v5->_reader
    || !-[_PASLPDictionaryContext isEqual:](self->_context, "isEqual:", v5->_context))
  {
    v7 = -[_PASLPDictionary count](v5, "count");
    context = self->_context;
    if (context)
      context = (_PASLPDictionaryContext *)context->_count;
    if ((_PASLPDictionaryContext *)v7 == context)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 1;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40___PASLPDictionary_isEqualToDictionary___block_invoke;
      v10[3] = &unk_1E4430680;
      v11 = v5;
      v12 = &v13;
      -[_PASLPDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v10);
      v6 = *((_BYTE *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_6:
  v6 = 1;
LABEL_12:

  return v6;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t context;
  _QWORD v6[8];

  if (a5)
  {
    context = (unint64_t)self->_context;
    if (context)
      context = *(_QWORD *)(context + 16);
    if (context >= a5)
      context = a5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45___PASLPDictionary_getObjects_andKeys_count___block_invoke;
    v6[3] = &unk_1E44306A8;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = context;
    v6[7] = a4;
    pthread_mutex_lock(&runWithGlobalPLPLock_lock_3171);
    __45___PASLPDictionary_getObjects_andKeys_count___block_invoke(v6);
    pthread_mutex_unlock(&runWithGlobalPLPLock_lock_3171);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  _PASLPDictionaryContext *context;
  unint64_t count;
  void *v7;
  unint64_t i;
  _PASLPDictionaryContext *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  context = self->_context;
  if (context)
    count = context->_count;
  else
    count = 0;
  v7 = (void *)objc_msgSend(v4, "initWithCapacity:", count);
  for (i = 0; ; ++i)
  {
    v9 = self->_context;
    if (v9)
      v9 = (_PASLPDictionaryContext *)v9->_count;
    if (i >= (unint64_t)v9)
      break;
    v10 = (void *)MEMORY[0x1A1AFDC98]();
    -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:", i, self->_context);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLPReaderProtocol objectAtIndex:usingDictionaryContext:](self->_reader, "objectAtIndex:usingDictionaryContext:", i, self->_context);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);

    objc_autoreleasePoolPop(v10);
  }
  return v7;
}

- (id)_pas_overrideUnlazyDictionary
{
  void *DeepCopy;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_PASLPReaderProtocol unlazyCopyForDictionaryWithContext:](self->_reader, "unlazyCopyForDictionaryWithContext:", self->_context);
    DeepCopy = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, self, 0);
  }
  return DeepCopy;
}

@end
