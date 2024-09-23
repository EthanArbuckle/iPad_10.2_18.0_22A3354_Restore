@implementation SBAlertItemsObjectQueue

- (BOOL)hasObjectOfClass:(Class)a3
{
  NSMutableOrderedSet *objects;
  _QWORD v5[5];

  objects = self->_objects;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SBAlertItemsObjectQueue_hasObjectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  return -[NSMutableOrderedSet indexOfObjectPassingTest:](objects, "indexOfObjectPassingTest:", v5) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasObject
{
  return -[NSMutableOrderedSet count](self->_objects, "count") != 0;
}

- (SBAlertItemsObjectQueue)init
{
  SBAlertItemsObjectQueue *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBAlertItemsObjectQueue;
  v2 = -[SBAlertItemsObjectQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    objects = v2->_objects;
    v2->_objects = v3;

  }
  return v2;
}

- (void)appendObject:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsObjectQueue.m"), 34, CFSTR("Cannot append nil to the queue."));

    v5 = 0;
  }
  -[NSMutableOrderedSet addObject:](self->_objects, "addObject:", v5);

}

- (void)prependObject:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsObjectQueue.m"), 39, CFSTR("Cannot prepend nil to the queue."));

    v5 = 0;
  }
  -[NSMutableOrderedSet insertObject:atIndex:](self->_objects, "insertObject:atIndex:", v5, 0);

}

- (id)dequeueAllObjects
{
  void *v3;
  void *v4;

  v3 = (void *)-[NSMutableOrderedSet copy](self->_objects, "copy");
  -[NSMutableOrderedSet removeAllObjects](self->_objects, "removeAllObjects");
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_objects, "containsObject:", a3);
}

- (void)removeObject:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SBAlertItemsObjectQueue containsObject:](self, "containsObject:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsObjectQueue.m"), 58, CFSTR("Trying to remove an object that is not in the queue."));

  }
  -[NSMutableOrderedSet removeObject:](self->_objects, "removeObject:", v6);

}

uint64_t __44__SBAlertItemsObjectQueue_hasObjectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)objectsOfClass:(Class)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_objects;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](self->_objects, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAlertItemsObjectQueue succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_objects, CFSTR("objects"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAlertItemsObjectQueue descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableOrderedSet)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
