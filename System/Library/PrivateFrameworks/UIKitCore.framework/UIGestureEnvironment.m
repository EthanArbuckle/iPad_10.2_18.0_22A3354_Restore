@implementation UIGestureEnvironment

- (uint64_t)gestureRecognizer:(uint64_t)a3 requiresGestureRecognizerToFail:
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v4 = result;
    objc_msgSend(*(id *)(result + 96), "objectForKey:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v4 + 96), "objectForKey:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasEdgeFromNode:", v6);

    return v7;
  }
  return result;
}

- (uint64_t)_runPreUpdateActions
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(result + 72);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 72), "removeAllObjects", (_QWORD)v7);
  }
  return result;
}

- (uint64_t)_clearGestureNeedsUpdate:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__clearGestureNeedsUpdate_, v3, CFSTR("UIGestureEnvironment.m"), 1021, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

    }
    return objc_msgSend(*(id *)(v3 + 16), "removeObject:", a2);
  }
  return result;
}

- (void)_queueGestureRecognizersForResetIfFinished:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = a2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v8, "state", (_QWORD)v9) >= 3
            && (-[UIGestureEnvironment _activeRelationshipsForGestureRecognizer:](a1, (uint64_t)v8) & 1) == 0)
          {
            -[UIGestureEnvironment _gestureNeedsReset:](a1, (uint64_t)v8);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)_gestureNeedsReset:(uint64_t)a1
{
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id location;
  __int128 buf;
  id (*v15)(uint64_t);
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__gestureNeedsReset_, a1, CFSTR("UIGestureEnvironment.m"), 1054, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

    }
    v4 = _gestureNeedsReset____s_category;
    if (!_gestureNeedsReset____s_category)
    {
      v4 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_gestureNeedsReset____s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v10 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        objc_msgSend((id)a2, "_briefDescription");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = objc_claimAutoreleasedReturnValue();
        v12 = *(void **)((char *)&buf + 4);
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Queueing gesture for reset: %@", (uint8_t *)&buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 24), "addObject:", a2);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", a2);
    if (!*(_QWORD *)(a1 + 64))
    {
      objc_initWeak(&location, (id)a1);
      v5 = MEMORY[0x1E0C80D38];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v15 = __69__UIGestureEnvironment__configureBlockResetStateCaptureTokenIfNeeded__block_invoke;
      v16 = &unk_1E16B4DD0;
      objc_copyWeak(v17, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v6;

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    if (a2)
    {
      v8 = *(_BYTE *)(a2 + 16);
      if ((v8 & 0x10) == 0)
      {
        *(_QWORD *)(a2 + 8) = *(_QWORD *)(a2 + 8);
        *(_BYTE *)(a2 + 16) = v8 | 0x10;
        *(_QWORD *)(a2 + 216) = mach_absolute_time();
      }
    }
  }
}

- (void)_notifyDependentsGestureRecognizerHasCompleted:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  NSObject *log;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "outEdges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "targetNode");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "propertyForKey:", CFSTR("gestureRecognizerNode"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = _notifyDependentsGestureRecognizerHasCompleted____s_category;
          if (!_notifyDependentsGestureRecognizerHasCompleted____s_category)
          {
            v10 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v10, (unint64_t *)&_notifyDependentsGestureRecognizerHasCompleted____s_category);
          }
          if ((*(_BYTE *)v10 & 1) != 0)
          {
            v11 = *(NSObject **)(v10 + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              log = v11;
              objc_msgSend(v9, "_briefDescription");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (a2)
              {
                v13 = CFSTR("will be unblocked");
                if ((unint64_t)(a2[9] - 1) < 3)
                  v13 = CFSTR("will be failed");
              }
              else
              {
                v13 = CFSTR("will be unblocked");
              }
              v15 = v13;
              objc_msgSend(a2, "_briefDescription");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v24 = v12;
              v25 = 2112;
              v26 = v15;
              v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "%@ %@ by %@", buf, 0x20u);

            }
          }
          -[UIGestureRecognizer _requiredGestureRecognizerCompletedOrWasUnrelated:]((uint64_t)v9, a2);

          ++v7;
        }
        while (v5 != v7);
        v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        v5 = v14;
      }
      while (v14);
    }

  }
}

- (void)addGestureRecognizer:(id)a3
{
  void *v5;
  UIGestureGraph *dependencyGraph;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableSet removeObject:](self->_gestureRecognizersNeedingRemoval, "removeObject:");
    objc_storeStrong((id *)a3 + 32, self);
    -[UIGestureEnvironment _nodeForGestureRecognizer:]((id *)&self->super.isa, (uint64_t)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      dependencyGraph = self->_dependencyGraph;
      v28 = CFSTR("gestureRecognizerNode");
      v29[0] = a3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureGraph addNodeWithLabel:properties:](dependencyGraph, "addNodeWithLabel:properties:", CFSTR("gestureRecognizerNode"), v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_nodesByGestureRecognizer, "setObject:forKey:", v5, a3);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *((id *)a3 + 20);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self, (uint64_t)a3);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = *((id *)a3 + 21);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

- (id)_nodeForGestureRecognizer:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[12], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)addRequirementForGestureRecognizer:(uint64_t)a1 requiringGestureRecognizerToFail:(uint64_t)a2
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v8 = addRequirementForGestureRecognizer_requiringGestureRecognizerToFail____s_category;
      if (!addRequirementForGestureRecognizer_requiringGestureRecognizerToFail____s_category)
      {
        v8 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&addRequirementForGestureRecognizer_requiringGestureRecognizerToFail____s_category);
      }
      if ((*(_BYTE *)v8 & 1) != 0)
      {
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = 136315138;
          v12 = "-[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]";
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s - unable to add requirement at this time because connections nodes have not yet added", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    else
    {
      v10 = (id)objc_msgSend(*(id *)(a1 + 88), "addUniqueEdgeWithLabel:sourceNode:targetNode:directed:properties:", CFSTR("failureRequirement"), v4, v5, 1, 0);
    }

  }
}

- (uint64_t)unmetRequirementsForGestureRecognizer:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "inEdges", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "sourceNode");
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "propertyForKey:", CFSTR("gestureRecognizerNode"));
        v9 = (uint64_t *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v8) = -[UIGestureRecognizer _isActive](v9);
        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (uint64_t)_activeRelationshipsForGestureRecognizer:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "allEdges", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "oppositeNode:", v2);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "propertyForKey:", CFSTR("gestureRecognizerNode"));
        v9 = (uint64_t *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v8) = -[UIGestureRecognizer _isActive](v9);
        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)removeGestureRecognizer:(id)a3
{
  void *v5;
  id WeakRetained;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[UIGestureEnvironment _nodeForGestureRecognizer:]((id *)&self->super.isa, (uint64_t)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)a3 + 6);

      if (WeakRetained)
        -[UIGestureRecognizer setContainer:]((uint64_t)a3, 0);
      if ((*((_QWORD *)a3 + 1) & 0x200000000) != 0)
      {
        v11 = qword_1ECD788F0;
        if (!qword_1ECD788F0)
        {
          v11 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&qword_1ECD788F0);
        }
        if ((*(_BYTE *)v11 & 1) != 0)
        {
          v12 = *(NSObject **)(v11 + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = v12;
            objc_msgSend(a3, "_briefDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 138412290;
            v16 = v14;
            _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "queueing gesture for removal from environment %@", (uint8_t *)&v15, 0xCu);

          }
        }
        -[NSMutableSet addObject:](self->_gestureRecognizersNeedingRemoval, "addObject:", a3);
        if (objc_msgSend(a3, "state") >= 3
          && (-[UIGestureEnvironment _activeRelationshipsForGestureRecognizer:]((uint64_t)self, (uint64_t)a3) & 1) == 0)
        {
          -[UIGestureEnvironment _gestureNeedsReset:]((uint64_t)self, (uint64_t)a3);
        }
      }
      else
      {
        -[UIGestureEnvironment _removeNodeFromGestureGraph:]((id *)&self->super.isa, v5);
      }
    }
    else
    {
      v7 = qword_1ECD788F8;
      if (!qword_1ECD788F8)
      {
        v7 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD788F8);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = v8;
          objc_msgSend(a3, "_briefDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "ERROR - Unable to find node for gesture %@", (uint8_t *)&v15, 0xCu);

        }
      }
    }

  }
}

- (void)_removeNodeFromGestureGraph:(id *)a1
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "propertyForKey:", CFSTR("gestureRecognizerNode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _removeNodeFromGestureGraph____s_category;
    if (!_removeNodeFromGestureGraph____s_category)
    {
      v5 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_removeNodeFromGestureGraph____s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        objc_msgSend(v4, "_briefDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "removing gesture from environment %@", (uint8_t *)&v9, 0xCu);

      }
    }
    objc_msgSend(a1[12], "removeObjectForKey:", v4);
    objc_msgSend(a1[11], "removeNode:", a2);
    objc_msgSend(a1[4], "removeObject:", v4);
    -[UIGestureRecognizer setGestureEnvironment:]((uint64_t)v4, 0);

  }
}

- (void)_deliverEvent:(void *)a3 toGestureRecognizers:(uint64_t)a4 usingBlock:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = a3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((*(unsigned int (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11))
          {
            -[UIGestureEnvironment _markGestureAsDirty:](a1, v11);
            if (v11)
            {
              if ((*(_BYTE *)(v11 + 16) & 0x20) != 0)
                -[UIGestureEnvironment setGestureNeedsUpdate:](a1, v11);
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:](a1, v6);
    if (objc_msgSend(*(id *)(a1 + 16), "count", (_QWORD)v15)
      || (objc_msgSend((id)UIApp, "_gestureDelayedEventComponentDispatcher"),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v13 = (void *)v12, v14 = objc_msgSend(*(id *)(v12 + 16), "count"), v13, v14))
    {
      _UIGestureEnvironmentUpdate(a1);
    }
  }
}

- (uint64_t)setGestureNeedsUpdate:(uint64_t)result
{
  uint64_t v3;
  id WeakRetained;
  void *v5;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a2 + 48));

      if (WeakRetained)
        return objc_msgSend(*(id *)(v3 + 16), "addObject:", a2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_setGestureNeedsUpdate_, v3, CFSTR("UIGestureEnvironment.m"), 1045, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

    }
    return -[UIGestureEnvironment _clearGestureNeedsUpdate:](v3, a2);
  }
  return result;
}

uint64_t __47__UIGestureEnvironment__updateForEvent_window___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a2, "state");
  v5 = *(void **)(a1 + 32);
  if (v4 <= 2)
    return objc_msgSend(v5, "_sendEventToGestureRecognizer:", a2);
  objc_msgSend(v5, "_gestureRecognizerNoLongerNeedsSendEvent:", a2);
  return 0;
}

- (uint64_t)_markGestureAsDirty:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__markGestureAsDirty_, v3, CFSTR("UIGestureEnvironment.m"), 1063, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

    }
    result = objc_msgSend(*(id *)(v3 + 40), "containsObject:", a2);
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(v3 + 40), "addObject:", a2);
      if (a2)
        *(_QWORD *)(a2 + 8) |= 0x200000000uLL;
      *(_WORD *)(v3 + 80) = 257;
    }
  }
  return result;
}

- (void)_cancelGestureRecognizers:(uint64_t)a1
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = a2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (!v4)
      goto LABEL_30;
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v20 = v3;
    v21 = v2;
    v19 = *(_QWORD *)v27;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if (!v8)
        {
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, 0);
          goto LABEL_26;
        }
        WeakRetained = objc_loadWeakRetained((id *)(v8 + 48));

        if (!WeakRetained)
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, v8);
        if ((*(_QWORD *)(v8 + 8) & 0x200000000) != 0 && objc_msgSend((id)v8, "state") <= 2)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend((id)v8, "_activeEvents");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "_removeGestureRecognizersSendingCancelledEvent:", v16);

                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v12);
          }

          if (objc_msgSend((id)v8, "state"))
          {
            v3 = v20;
            v2 = v21;
            v6 = v19;
            if (objc_msgSend((id)v8, "state") <= 2)
            {
              v17 = 4;
              goto LABEL_23;
            }
          }
          else
          {
            v17 = 5;
            v3 = v20;
            v2 = v21;
            v6 = v19;
LABEL_23:
            objc_msgSend((id)v8, "setState:", v17);
          }
          -[UIGestureEnvironment _clearGestureNeedsUpdate:](v2, v8);
          -[UIGestureRecognizer _updateGestureForActiveEvents]((void *)v8);
          if (objc_msgSend((id)v8, "state") >= 3)
            -[UIGestureEnvironment _notifyDependentsGestureRecognizerHasCompleted:](v2, (_QWORD *)v8);
        }
LABEL_26:
        ++v7;
      }
      while (v7 != v5);
      v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v5 = v18;
      if (!v18)
      {
LABEL_30:

        -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:](v2, v3);
        return;
      }
    }
  }
}

- (UIGestureEnvironment)init
{
  UIGestureEnvironment *v2;
  UIGestureEnvironment *v3;
  CFRunLoopObserverRef v4;
  __CFRunLoop *Main;
  uint64_t v6;
  NSMutableSet *gestureRecognizersNeedingUpdate;
  uint64_t v8;
  NSMutableSet *gestureRecognizersNeedingReset;
  uint64_t v10;
  NSMutableSet *gestureRecognizersNeedingRemoval;
  uint64_t v12;
  NSMutableArray *dirtyGestureRecognizers;
  uint64_t v14;
  NSMutableArray *preUpdateActions;
  uint64_t v16;
  NSMutableSet *gestureRecognizersBlockedFromReset;
  uint64_t v18;
  UIGestureGraph *dependencyGraph;
  uint64_t v20;
  NSMapTable *nodesByGestureRecognizer;
  CFRunLoopObserverContext v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)UIGestureEnvironment;
  v2 = -[UIGestureEnvironment init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v23.version = 0;
    memset(&v23.retain, 0, 24);
    v23.info = v2;
    v4 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x20uLL, 1u, 0, (CFRunLoopObserverCallBack)_UIGestureRecognizerUpdateObserver, &v23);
    v3->_gestureEnvironmentUpdateObserver = v4;
    if (v4)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v3->_gestureEnvironmentUpdateObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    gestureRecognizersNeedingUpdate = v3->_gestureRecognizersNeedingUpdate;
    v3->_gestureRecognizersNeedingUpdate = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    gestureRecognizersNeedingReset = v3->_gestureRecognizersNeedingReset;
    v3->_gestureRecognizersNeedingReset = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    gestureRecognizersNeedingRemoval = v3->_gestureRecognizersNeedingRemoval;
    v3->_gestureRecognizersNeedingRemoval = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    dirtyGestureRecognizers = v3->_dirtyGestureRecognizers;
    v3->_dirtyGestureRecognizers = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    preUpdateActions = v3->_preUpdateActions;
    v3->_preUpdateActions = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    gestureRecognizersBlockedFromReset = v3->_gestureRecognizersBlockedFromReset;
    v3->_gestureRecognizersBlockedFromReset = (NSMutableSet *)v16;

    v3->_lastBlockedResetEvaluationMachTime = 0;
    v18 = objc_opt_new();
    dependencyGraph = v3->_dependencyGraph;
    v3->_dependencyGraph = (UIGestureGraph *)v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    nodesByGestureRecognizer = v3->_nodesByGestureRecognizer;
    v3->_nodesByGestureRecognizer = (NSMapTable *)v20;

  }
  return v3;
}

- (void)_updateForEvent:(uint64_t)a3 window:
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  if (a1)
  {
    -[UIGestureEnvironment _runPreUpdateActions](a1);
    objc_msgSend(a2, "_gestureRecognizersForWindow:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "copy");

    if ((objc_msgSend(a2, "_consumeBeforeDeliveryToGestureRecognizers:inWindow:", v8, a3) & 1) == 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__UIGestureEnvironment__updateForEvent_window___block_invoke;
      v9[3] = &unk_1E16B5D38;
      v9[4] = a2;
      -[UIGestureEnvironment _deliverEvent:toGestureRecognizers:usingBlock:](a1, v7, v8, (uint64_t)v9);
      objc_msgSend(a2, "_wasDeliveredToGestureRecognizers");
    }

  }
}

id __69__UIGestureEnvironment__configureBlockResetStateCaptureTokenIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _UIGestureEnvironmentSubgraphsBlockedFromResetDescription((uint64_t)WeakRetained, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_blockedResetStateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIGestureEnvironment;
  -[UIGestureEnvironment dealloc](&v3, sel_dealloc);
}

- (void)removeRequirementForGestureRecognizer:(uint64_t)a3 requiringGestureRecognizerToFail:
{
  void *v5;
  id v6;
  _QWORD v7[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__UIGestureEnvironment_removeRequirementForGestureRecognizer_requiringGestureRecognizerToFail___block_invoke;
    v7[3] = &unk_1E16C9440;
    v7[4] = a1;
    objc_msgSend(v6, "enumerateEdgesFromNode:usingBlock:", v5, v7);

  }
}

void __95__UIGestureEnvironment_removeRequirementForGestureRecognizer_requiringGestureRecognizerToFail___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;

  objc_msgSend(a2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("failureRequirement"));

  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeEdge:", a2);
}

- (id)_gesturesWithDelayedTouchForTouch:(uint64_t)a1 event:(_QWORD *)a2
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend(a2, "isDelayed"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a2, "gestureRecognizers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minusSet:", v7);
  if (objc_msgSend(v4, "count"))
  {
    v20 = v7;
    v21 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v4;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    v8 = 0;
    if (v24)
    {
      v23 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          if (v10)
            v11 = (void *)objc_msgSend(*(id *)(v10 + 32), "copy");
          else
            v11 = 0;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD **)(*((_QWORD *)&v25 + 1) + 8 * i);
                if (v16)
                  v16 = (_QWORD *)v16[3];
                v17 = v16;

                if (v17 == a2)
                {
                  if (!v8)
                    v8 = (void *)objc_opt_new();
                  objc_msgSend(v8, "addObject:", v10);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v24);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v24 = v18;
      }
      while (v18);
    }

    v7 = v20;
    v4 = v21;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_performTouchContinuationWithOverrideHitTestedView:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *m;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  _WORD *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t jj;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t kk;
  id v66;
  id obj;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  id v76;
  id v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)UIApp;
    objc_msgSend(a2, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "_touchesEventForWindow:", v3);

    v78 = v4;
    objc_msgSend(v4, "allTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v112 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          objc_msgSend(v10, "gestureRecognizers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v108;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v108 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
                if ((objc_msgSend(v16, "_keepTouchesOnContinuation") & 1) == 0)
                  -[UIGestureRecognizer _removeTouch:forEvent:byCancellingTouches:]((uint64_t)v16, (uint64_t)v10, (uint64_t)v78, 1);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
      }
      while (v7);
    }
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = v5;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v104;
      v20 = (void *)MEMORY[0x1E0C9AAB0];
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v104 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
          objc_msgSend(v22, "_responder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            if (objc_msgSend(v22, "phase") <= 3)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "phase"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setAssociatedObject(v22, &_MergedGlobals_58, v24, (void *)1);

              objc_msgSend(v22, "setPhase:", 4);
              if (objc_msgSend(v22, "isDelayed"))
                objc_setAssociatedObject(v22, &unk_1ECD788E9, v20, (void *)1);
            }
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
      }
      while (v18);
    }

    _UIGestureEnvironmentUpdate(a1);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    objc_msgSend(v78, "_allWindows");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
    if (v70)
    {
      v69 = *(_QWORD *)v100;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v100 != v69)
            objc_enumerationMutation(v66);
          v71 = v25;
          v26 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v25);
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          objc_msgSend(v78, "_respondersForWindow:", v26);
          v72 = (id)objc_claimAutoreleasedReturnValue();
          v76 = (id)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v119, 16);
          if (v76)
          {
            v73 = *(_QWORD *)v96;
            do
            {
              for (m = 0; m != v76; m = (char *)m + 1)
              {
                if (*(_QWORD *)v96 != v73)
                  objc_enumerationMutation(v72);
                v28 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)m);
                objc_msgSend(v78, "_touchesForResponder:withPhase:", v28, 4);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (v29)
                {
                  v74 = v28;
                  v31 = (void *)objc_msgSend(v29, "mutableCopy");
                  v91 = 0u;
                  v92 = 0u;
                  v93 = 0u;
                  v94 = 0u;
                  v32 = v30;
                  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v118, 16);
                  if (v33)
                  {
                    v34 = v33;
                    v35 = *(_QWORD *)v92;
                    do
                    {
                      for (n = 0; n != v34; ++n)
                      {
                        if (*(_QWORD *)v92 != v35)
                          objc_enumerationMutation(v32);
                        v37 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * n);
                        objc_getAssociatedObject(v37, &unk_1ECD788E9);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v38)
                          objc_msgSend(v31, "removeObject:", v37);
                      }
                      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v91, v118, 16);
                    }
                    while (v34);
                  }

                  if (v31)
                    objc_msgSend(v74, "touchesCancelled:withEvent:", v32, v78);

                }
              }
              v76 = (id)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v119, 16);
            }
            while (v76);
          }

          v25 = v71 + 1;
        }
        while (v71 + 1 != v70);
        v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
      }
      while (v70);
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v39 = obj;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v117, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v88;
      do
      {
        for (ii = 0; ii != v41; ++ii)
        {
          if (*(_QWORD *)v88 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_WORD **)(*((_QWORD *)&v87 + 1) + 8 * ii);
          objc_getAssociatedObject(v44, &_MergedGlobals_58);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v45)
            objc_msgSend(v44, "setPhase:", objc_msgSend(v45, "integerValue"));
          objc_setAssociatedObject(v44, &_MergedGlobals_58, 0, (void *)1);
          objc_setAssociatedObject(v44, &unk_1ECD788E9, 0, (void *)1);
          v47 = objc_msgSend(v44, "phase");
          if (v44)
            v48 = v47 <= 2;
          else
            v48 = 0;
          if (v48)
            v44[118] &= ~8u;

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v117, 16);
      }
      while (v41);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v77 = v39;
    v49 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v83, v116, 16);
    v50 = a2;
    if (v49)
    {
      v51 = v49;
      v52 = *(_QWORD *)v84;
      do
      {
        for (jj = 0; jj != v51; ++jj)
        {
          if (*(_QWORD *)v84 != v52)
            objc_enumerationMutation(v77);
          v54 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * jj);
          if (v50)
          {
            v55 = v50;
          }
          else
          {
            -[UITouch _rehitTest](*(void **)(*((_QWORD *)&v83 + 1) + 8 * jj));
            v55 = (id)objc_claimAutoreleasedReturnValue();
            if (!v55)
              continue;
          }
          objc_msgSend(v55, "_eventReceivingWindow");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "_exclusiveTouchWindows");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "removeObject:", v56);

          objc_msgSend(v56, "_setExclusiveTouchView:", 0);
          objc_msgSend(v54, "_setResponder:", v55);
          objc_msgSend(v55, "_eventReceivingWindow");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "window");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58 != v59)
          {
            objc_msgSend(v55, "_eventReceivingWindow");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setWindow:", v60);

          }
          objc_msgSend(v78, "_addGestureRecognizersForTouchContinuationFromContainer:toTouch:", v55, v54);
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          objc_msgSend(v54, "gestureRecognizers");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v79, v115, 16);
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v80;
            do
            {
              for (kk = 0; kk != v63; ++kk)
              {
                if (*(_QWORD *)v80 != v64)
                  objc_enumerationMutation(v61);
                objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * kk), "_addTouch:forEvent:", v54, v78);
              }
              v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v79, v115, 16);
            }
            while (v63);
          }

          v50 = a2;
        }
        v51 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v83, v116, 16);
      }
      while (v51);
    }

  }
}

- (void)_addPreUpdateAction:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    if (aBlock)
    {
      v2 = *(void **)(a1 + 72);
      v3 = _Block_copy(aBlock);
      objc_msgSend(v2, "addObject:", v3);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_preUpdateActions, 0);
  objc_storeStrong((id *)&self->_blockedResetStateCaptureToken, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersBlockedFromReset, 0);
  objc_storeStrong((id *)&self->_dirtyGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingRemoval, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingReset, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersNeedingUpdate, 0);
}

@end
