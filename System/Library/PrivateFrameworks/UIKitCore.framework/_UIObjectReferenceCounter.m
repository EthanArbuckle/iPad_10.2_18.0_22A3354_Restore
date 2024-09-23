@implementation _UIObjectReferenceCounter

- (void)decrementReferenceForObject:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSUInteger v21;
  __int16 v22;
  NSUInteger v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = -[NSCountedSet countForObject:](self->_objectReferences, "countForObject:", v7);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplication_BackgroundTasks.m"), 52, CFSTR("Object passed to %s is not in reference map: object %@"), "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]", v7);

  }
  v10 = qword_1ECD7DE60;
  if (!qword_1ECD7DE60)
  {
    v10 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD7DE60);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v15 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
      v20 = 2112;
      v21 = (NSUInteger)v7;
      v22 = 2048;
      v23 = v9;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "%s: reference map for object %@: existing count is %ld", buf, 0x20u);
    }
  }
  -[NSCountedSet removeObject:](self->_objectReferences, "removeObject:", v7);
  v11 = v9 - 1;
  if (v11)
  {
    v13 = qword_1ECD7DE70;
    if (!qword_1ECD7DE70)
    {
      v13 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD7DE70);
    }
    if ((*(_BYTE *)v13 & 1) != 0)
    {
      v17 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
        v20 = 2048;
        v21 = v11;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "%s: Updating reference map with count %ld", buf, 0x16u);
      }
    }
  }
  else
  {
    v12 = qword_1ECD7DE68;
    if (!qword_1ECD7DE68)
    {
      v12 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD7DE68);
    }
    if ((*(_BYTE *)v12 & 1) != 0)
    {
      v16 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "%s: Object is no longer being referenced, removing object from reference map and invalidating it", buf, 0xCu);
      }
    }
    if (v8)
      v8[2](v8);
  }

}

- (void)incrementReferenceForObject:(id)a3
{
  id v4;
  NSCountedSet *objectReferences;
  NSCountedSet *v6;
  NSCountedSet *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objectReferences = self->_objectReferences;
  if (!objectReferences)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v7 = self->_objectReferences;
    self->_objectReferences = v6;

    objectReferences = self->_objectReferences;
  }
  v8 = -[NSCountedSet countForObject:](objectReferences, "countForObject:", v4);
  v9 = qword_1ECD7DE50;
  if (!qword_1ECD7DE50)
  {
    v9 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1ECD7DE50);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v11 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315650;
      v14 = "-[_UIObjectReferenceCounter incrementReferenceForObject:]";
      v15 = 2112;
      v16 = v4;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "%s: reference map for object %@: existing entry is %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  v10 = qword_1ECD7DE58;
  if (!qword_1ECD7DE58)
  {
    v10 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD7DE58);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v12 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315650;
      v14 = "-[_UIObjectReferenceCounter incrementReferenceForObject:]";
      v15 = 2112;
      v16 = v4;
      v17 = 2048;
      v18 = v8 + 1;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%s: Updating reference map for object %@ with count %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  -[NSCountedSet addObject:](self->_objectReferences, "addObject:", v4);

}

- (id)allObjects
{
  return (id)-[NSCountedSet allObjects](self->_objectReferences, "allObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectReferences, 0);
}

@end
