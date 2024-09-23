@implementation _PASLPArray

- (_PASLPArray)initWithLazyPlistReader:(id)a3 context:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _PASLPArray *v11;
  _PASLPArray *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPArray.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reader"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPArray.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_PASLPArray;
  v11 = -[_PASLPArray init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_reader, a3);
    objc_storeStrong((id *)&v12->_context, a4);
  }

  return v12;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  _PASLPArrayContext *context;
  _QWORD v5[6];
  _NSRange v6;
  objc_super v7;

  context = self->_context;
  if (context)
    context = (_PASLPArrayContext *)context->_count;
  if (a4.location + a4.length > (unint64_t)context)
  {
    v7.receiver = self;
    v7.super_class = (Class)_PASLPArray;
    -[_PASLPArray getObjects:range:](&v7, sel_getObjects_range_, a3);
    __break(1u);
  }
  else if (a4.length)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32___PASLPArray_getObjects_range___block_invoke;
    v5[3] = &unk_1E44306A8;
    v5[4] = self;
    v5[5] = a3;
    v6 = a4;
    pthread_mutex_lock(&runWithGlobalPLPLock_lock);
    __32___PASLPArray_getObjects_range___block_invoke(v5);
    pthread_mutex_unlock(&runWithGlobalPLPLock_lock);
  }
}

- (unint64_t)count
{
  _PASLPArrayContext *context;

  context = self->_context;
  if (context)
    return context->_count;
  else
    return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[_PASLPReaderProtocol objectAtIndex:usingArrayContext:](self->_reader, "objectAtIndex:usingArrayContext:", a3, self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objects);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (_PASLPArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  _PASLPArray *v5;

  v5 = (_PASLPArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);

  return v5;
}

- (_PASLPArray)initWithCoder:(id)a3
{
  _PASLPArray *result;

  result = (_PASLPArray *)a3;
  __break(1u);
  return result;
}

- (BOOL)isEqualToArray:(id)a3
{
  _PASLPArray *v4;
  BOOL v5;
  objc_super v7;

  v4 = (_PASLPArray *)a3;
  if (v4 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_reader == v4->_reader
    && -[_PASLPArrayContext isEqual:](self->_context, "isEqual:", v4->_context))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_PASLPArray;
    v5 = -[_PASLazyArrayBase isEqualToArray:](&v7, sel_isEqualToArray_, v4);
  }

  return v5;
}

- (id)_pas_overrideUnlazyArray
{
  void *DeepCopy;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_PASLPReaderProtocol unlazyCopyForArrayWithContext:](self->_reader, "unlazyCopyForArrayWithContext:", self->_context);
    DeepCopy = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, self, 0);
  }
  return DeepCopy;
}

@end
