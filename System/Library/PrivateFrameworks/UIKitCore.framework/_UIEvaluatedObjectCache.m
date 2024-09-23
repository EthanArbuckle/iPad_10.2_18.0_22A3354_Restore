@implementation _UIEvaluatedObjectCache

- (id)sortedObjects
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[_UIEvaluatedObjectCache _createStorageIfNeeded]((uint64_t)a1);
    a1 = (id *)objc_msgSend(v1[3], "copy");
  }
  return a1;
}

- (void)_createStorageIfNeeded
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 24))
    {
      v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 1);
      v3 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v2;

    }
  }
}

- (void)sortAndEvaluateTopObject
{
  if (a1)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 24), "count") >= 2)
      objc_msgSend(*(id *)(a1 + 24), "sortWithOptions:usingComparator:", 16, *(_QWORD *)(a1 + 8));
    -[_UIEvaluatedObjectCache evaluateTopObject](a1);
  }
}

- (_QWORD)initWithSortComparator:(const void *)a3 evaluationBlock:
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (!a1)
    return 0;
  v11.receiver = a1;
  v11.super_class = (Class)_UIEvaluatedObjectCache;
  v5 = objc_msgSendSuper2(&v11, sel_init);
  if (v5)
  {
    v6 = _Block_copy(a2);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = _Block_copy(a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (void)evaluateTopObject
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 24), "count") && *(_QWORD *)(a1 + 16))
    {
      v6 = 0;
      v7 = &v6;
      v8 = 0x3032000000;
      v9 = __Block_byref_object_copy__90;
      v10 = __Block_byref_object_dispose__90;
      v11 = 0;
      v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __44___UIEvaluatedObjectCache_evaluateTopObject__block_invoke;
      v5[3] = &unk_1E16C6E88;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "enumerateObjectsWithOptions:usingBlock:", 2, v5);
      v3 = (void *)v7[5];
      if (!v3)
        v3 = *(void **)(a1 + 32);
      objc_storeStrong((id *)(a1 + 32), v3);
      _Block_object_dispose(&v6, 8);

    }
    else
    {
      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
  }
}

- (void)addObject:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_addObject_, a1, CFSTR("_UIEvaluatedObjectCache.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    if ((objc_msgSend(*(id *)(a1 + 24), "containsObject:", a2) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 24), "addObject:", a2);
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (_UIEvaluatedObjectCache)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEvaluatedObjectCache.m"), 26, CFSTR("%s: init is not allowed on %@"), "-[_UIEvaluatedObjectCache init]", objc_opt_class());

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEvaluatedObjectCache debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEvaluatedObjectCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id topEvaluatedObject;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableOrderedSet count](self->_sortedObjects, "count"), CFSTR("sortedObjects.count"));
  topEvaluatedObject = self->_topEvaluatedObject;
  if (topEvaluatedObject)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = topEvaluatedObject;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("topEvaluatedObject"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEvaluatedObjectCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEvaluatedObjectCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIEvaluatedObjectCache *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (void)removeObject:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeObject_, a1, CFSTR("_UIEvaluatedObjectCache.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    }
    if (objc_msgSend(*(id *)(a1 + 24), "containsObject:", a2))
    {
      objc_msgSend(*(id *)(a1 + 24), "removeObject:", a2);
      -[_UIEvaluatedObjectCache evaluateTopObject](a1);
    }
  }
}

- (void)promoteObject:(uint64_t)a1
{
  int v4;
  void *v5;
  void *v6;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_promoteObject_, a1, CFSTR("_UIEvaluatedObjectCache.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    v4 = objc_msgSend(*(id *)(a1 + 24), "containsObject:", a2);
    v5 = *(void **)(a1 + 24);
    if (v4)
    {
      objc_msgSend(v5, "removeObject:", a2);
      v5 = *(void **)(a1 + 24);
    }
    objc_msgSend(v5, "addObject:", a2);
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (void)demoteObject:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_demoteObject_, a1, CFSTR("_UIEvaluatedObjectCache.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    if (objc_msgSend(*(id *)(a1 + 24), "containsObject:", a2))
      objc_msgSend(*(id *)(a1 + 24), "removeObject:", a2);
    objc_msgSend(*(id *)(a1 + 24), "insertObject:atIndex:", a2, 0);
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (id)topEvaluatedObject
{
  if (a1)
    a1 = (id *)a1[4];
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topEvaluatedObject, 0);
  objc_storeStrong((id *)&self->_sortedObjects, 0);
  objc_storeStrong(&self->_evaluationBlock, 0);
  objc_storeStrong(&self->_sortComparator, 0);
}

@end
