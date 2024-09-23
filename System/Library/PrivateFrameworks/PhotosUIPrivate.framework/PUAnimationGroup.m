@implementation PUAnimationGroup

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)-[NSMutableArray copy](self->_subAnimationGroups, "copy");
  if (objc_msgSend(v3, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PUAnimationGroup_dealloc__block_invoke;
    block[3] = &unk_1E58ABD10;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v4.receiver = self;
  v4.super_class = (Class)PUAnimationGroup;
  -[PUAnimationGroup dealloc](&v4, sel_dealloc);
}

- (double)elapsedTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "elapsedTime");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setElapsedTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setElapsedTime:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    if (a3)
      -[PUAnimationGroup pauseAnimations](self, "pauseAnimations");
    else
      -[PUAnimationGroup resumeAnimations](self, "resumeAnimations");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setPaused:", v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addSubAnimationGroup:(id)a3
{
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *subAnimationGroups;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[PUAnimationGroup isPaused](self, "isPaused"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAnimationGroup.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self isPaused]"));

  }
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    subAnimationGroups = self->_subAnimationGroups;
    self->_subAnimationGroups = v6;

  }
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  objc_msgSend(v10, "setSuperAnimationGroup:", self);
}

- (void)setSuperAnimationGroup:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_superAnimationGroup);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_superAnimationGroup, obj);

    v5 = obj;
    if (!obj)
    {
      -[PUAnimationGroup completeIfNeeded](self, "completeIfNeeded");
      v5 = 0;
    }
  }

}

- (BOOL)isReadyToComplete
{
  BOOL v3;
  char v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PUAnimationGroup isPaused](self, "isPaused");
  if (v3)
    return 0;
  v5 = v3;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v4 = !v5;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isReadyToComplete"))
        {
          v4 = 0;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }
LABEL_14:

  return v4;
}

- (void)completeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PUAnimationGroup superAnimationGroup](self, "superAnimationGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "completeIfNeeded");
  }
  else if (-[PUAnimationGroup isReadyToComplete](self, "isReadyToComplete"))
  {
    -[PUAnimationGroup complete](self, "complete");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "complete");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id completionHandler;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__PUAnimationGroup_setCompletionHandler___block_invoke;
    v9[3] = &unk_1E58AB968;
    v9[4] = self;
    v10 = v4;
    v6 = (void *)objc_msgSend(v9, "copy");
    completionHandler = self->_completionHandler;
    self->_completionHandler = v6;

    v8 = v10;
  }
  else
  {
    v8 = self->_completionHandler;
    self->_completionHandler = 0;
  }

}

- (void)complete
{
  void (**v3)(void);

  -[PUAnimationGroup completionHandler](self, "completionHandler");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAnimationGroup setCompletionHandler:](self, "setCompletionHandler:", 0);
    v3[2]();
  }

}

- (void)finishImmediately
{
  void *v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finishImmediately");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v26.receiver = self;
  v26.super_class = (Class)PUAnimationGroup;
  -[PUAnimationGroup description](&v26, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v5, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (PUAnimationGroup)superAnimationGroup
{
  return (PUAnimationGroup *)objc_loadWeakRetained((id *)&self->_superAnimationGroup);
}

- (NSMutableArray)subAnimationGroups
{
  return self->_subAnimationGroups;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_subAnimationGroups, 0);
  objc_destroyWeak((id *)&self->_superAnimationGroup);
}

uint64_t __41__PUAnimationGroup_setCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __27__PUAnimationGroup_dealloc__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "setSuperAnimationGroup:", 0, (_QWORD)v7);
        objc_msgSend(v6, "completeIfNeeded");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

+ (id)animationGroupWithAnimations:(id)a3
{
  void (**v5)(_QWORD);
  PUAnimationGroup *v6;
  void *v8;

  v5 = (void (**)(_QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animations != NULL"));

  }
  v6 = objc_alloc_init(PUAnimationGroup);
  +[PUAnimationGroup pushAnimationGroup:](PUAnimationGroup, "pushAnimationGroup:", v6);
  v5[2](v5);
  +[PUAnimationGroup popAnimationGroup:](PUAnimationGroup, "popAnimationGroup:", v6);

  return v6;
}

+ (void)pushAnimationGroup:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animationGroup != nil"));

  }
  if (__rootAnimationGroup)
  {
    v7 = (void *)__currentAnimationGroup;
    if (!__currentAnimationGroup)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("__currentAnimationGroup != nil"));

      v7 = (void *)__currentAnimationGroup;
    }
    objc_msgSend(v7, "addSubAnimationGroup:", v6);
  }
  else
  {
    objc_storeStrong((id *)&__rootAnimationGroup, a3);
  }
  v8 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = (uint64_t)v6;

}

+ (void)popAnimationGroup:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((id)__currentAnimationGroup != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("__currentAnimationGroup == animationGroup"));

  }
  objc_msgSend(v9, "superAnimationGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)__currentAnimationGroup;
  __currentAnimationGroup = v5;

  v7 = v9;
  if ((id)__rootAnimationGroup == v9)
  {
    __rootAnimationGroup = 0;

    v7 = v9;
  }

}

@end
