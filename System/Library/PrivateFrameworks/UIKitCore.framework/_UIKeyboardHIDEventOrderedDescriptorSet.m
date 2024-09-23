@implementation _UIKeyboardHIDEventOrderedDescriptorSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByDescriptor, 0);
  objc_storeStrong((id *)&self->_orderedDescriptors, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIKeyboardHIDEventOrderedDescriptorSet *v4;
  uint64_t v5;
  NSMutableOrderedSet *orderedDescriptors;
  uint64_t v7;
  NSMutableDictionary *eventsByDescriptor;

  v4 = -[_UIKeyboardHIDEventOrderedDescriptorSet init](+[_UIKeyboardHIDEventOrderedDescriptorSet allocWithZone:](_UIKeyboardHIDEventOrderedDescriptorSet, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSMutableOrderedSet mutableCopy](self->_orderedDescriptors, "mutableCopy");
    orderedDescriptors = v4->_orderedDescriptors;
    v4->_orderedDescriptors = (NSMutableOrderedSet *)v5;

    v7 = -[NSMutableDictionary mutableCopy](self->_eventsByDescriptor, "mutableCopy");
    eventsByDescriptor = v4->_eventsByDescriptor;
    v4->_eventsByDescriptor = (NSMutableDictionary *)v7;

  }
  return v4;
}

- (void)removeAllEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllObjects");

    -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllObjects");

  }
}

- (id)events
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v1;
  if (!objc_msgSend(a1[2], "count"))
  {
    v1 = (id *)MEMORY[0x1E0C9AA60];
    return v1;
  }
  v2 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](v1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "objectForKey:", v8, (_QWORD)v13);

        if (v10)
          objc_msgSend(v2, "addObject:", v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return (id *)v11;
}

- (_QWORD)_orderedDescriptors
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)_eventsByDescriptor
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (void)addEvent:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (IOHIDEventGetType() == 3)
  {
    +[_UIKeyboardHIDEventDescriptor descriptorWithEvent:](_UIKeyboardHIDEventDescriptor, "descriptorWithEvent:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = v4;
      -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", a2, v10);

      v4 = v10;
    }

    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = objc_opt_class();
      v13 = 2112;
      v14 = a2;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Invalid HID event type added to %@: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  v7 = addEvent____s_category;
  if (!addEvent____s_category)
  {
    v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&addEvent____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    *(_DWORD *)buf = 138412546;
    v12 = objc_opt_class();
    v13 = 2112;
    v14 = a2;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Invalid HID event type added to %@: %@", buf, 0x16u);
LABEL_11:

  }
}

- (void)removeEvent:(_QWORD *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    +[_UIKeyboardHIDEventDescriptor descriptorWithEvent:](_UIKeyboardHIDEventDescriptor, "descriptorWithEvent:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObject:", v6);

      -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectForKey:", v6);

      v3 = v6;
    }

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; orderedDescriptors.count: %lu; eventsByDescriptor.count: %lu>"),
               objc_opt_class(),
               self,
               -[NSMutableOrderedSet count](self->_orderedDescriptors, "count"),
               -[NSMutableDictionary count](self->_eventsByDescriptor, "count"));
}

@end
