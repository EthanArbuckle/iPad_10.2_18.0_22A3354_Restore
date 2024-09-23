@implementation _UIDynamicAnimationGroup

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationGroup;
  -[_UIDynamicAnimation dealloc](&v3, sel_dealloc);
}

- (void)_stopAnimation
{
  objc_super v3;

  self->_applier = 0;
  self->_runningAnimations = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationGroup;
  -[_UIDynamicAnimation _stopAnimation](&v3, sel__stopAnimation);
}

- (BOOL)_animateForInterval:(double)a3
{
  NSMutableArray *runningAnimations;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  runningAnimations = self->_runningAnimations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningAnimations, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(runningAnimations);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v11, "_animateForInterval:", a3))
        {
          if (!v8)
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](runningAnimations, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  -[NSMutableArray removeObjectsInArray:](self->_runningAnimations, "removeObjectsInArray:", v8);
  v12 = -[NSMutableArray count](self->_runningAnimations, "count");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48___UIDynamicAnimationGroup__animateForInterval___block_invoke;
  v22[3] = &unk_1E16B4190;
  v22[4] = self;
  -[_UIDynamicAnimation _callAppliers:additionalEndAppliers:done:](self, "_callAppliers:additionalEndAppliers:done:", v22, 0, v12 == 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "_stopAnimation");
      }
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v14);
  }

  return v12 == 0;
}

- (void)setAnimations:(id)a3
{
  NSMutableArray *animations;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  _QWORD v17[5];
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
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  animations = self->_animations;
  if (animations != a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(animations);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "_setGrouped:", 0);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v13 = *MEMORY[0x1E0C99778];
      v14 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(a3);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          if (objc_msgSend(v16, "_isGrouped"))
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v13, CFSTR("%@ is already in a dynamic animation group. It must be removed before being added to another."), v16);
          v17[0] = v14;
          v17[1] = 3221225472;
          v17[2] = __42___UIDynamicAnimationGroup_setAnimations___block_invoke;
          v17[3] = &unk_1E16B41B8;
          v17[4] = self;
          objc_msgSend(v16, "_cancelWithAppliers:", v17);
          objc_msgSend(v16, "_setGrouped:", 1);
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v11);
    }

    self->_animations = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
}

- (void)addAnimation:(id)a3
{
  NSMutableArray *animations;
  _QWORD v6[5];

  if (a3 && (-[NSMutableArray containsObject:](self->_animations, "containsObject:") & 1) == 0)
  {
    if (objc_msgSend(a3, "_isGrouped"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is already in a dynamic animation group. It must be removed before being added to another."), a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41___UIDynamicAnimationGroup_addAnimation___block_invoke;
    v6[3] = &unk_1E16B41B8;
    v6[4] = self;
    objc_msgSend(a3, "_cancelWithAppliers:", v6);
    animations = self->_animations;
    if (!animations)
    {
      animations = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      self->_animations = animations;
    }
    -[NSMutableArray addObject:](animations, "addObject:", a3);
    objc_msgSend(a3, "_setGrouped:", 1);
    if ((*((_BYTE *)&self->super + 20) & 2) != 0)
      -[NSMutableArray addObject:](self->_runningAnimations, "addObject:", a3);
  }
}

- (void)removeAnimation:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_animations, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_animations, "removeObject:", a3);
    if ((*((_BYTE *)&self->super + 20) & 2) != 0)
      -[NSMutableArray removeObject:](self->_runningAnimations, "removeObject:", a3);
    if (!-[NSMutableArray count](self->_animations, "count"))

    if (!-[NSMutableArray count](self->_runningAnimations, "count"))
    objc_msgSend(a3, "_setGrouped:", 0);
  }
}

- (void)runWithGroupApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6
{
  objc_super v11;

  if (!a3 && !self->_applier)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("groupApplier must be non-nil"));
  if (-[NSMutableArray count](self->_animations, "count"))
  {
    if ((*((_BYTE *)&self->super + 20) & 2) == 0)
    {
      if (a3)
      {

        self->_applier = (id)objc_msgSend(a3, "copy");
      }

      self->_runningAnimations = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_animations, "mutableCopy");
      v11.receiver = self;
      v11.super_class = (Class)_UIDynamicAnimationGroup;
      -[_UIDynamicAnimation runWithCompletion:forScreen:runLoopMode:](&v11, sel_runWithCompletion_forScreen_runLoopMode_, a4, a5, a6);
    }
  }
  else if (a4)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)runWithGroupApplier:(id)a3 completion:(id)a4
{
  -[_UIDynamicAnimationGroup runWithGroupApplier:completion:forScreen:runLoopMode:](self, "runWithGroupApplier:completion:forScreen:runLoopMode:", a3, a4, 0, 0);
}

- (void)runWithCompletion:(id)a3
{
  if (!self->_applier)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Dynamic animations without pre-set appliers must be run with an explicit applier. Use runWithValueApplier:completion:"));
  -[_UIDynamicAnimationGroup runWithGroupApplier:completion:](self, "runWithGroupApplier:completion:", 0, a3);
}

- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4
{
  NSMutableArray *animations;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_animations, "count"))
  {
    objc_msgSend(a3, "appendString:", CFSTR("; animations = {"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    animations = self->_animations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(animations);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((v11 & 1) == 0)
            objc_msgSend(a3, "appendString:", CFSTR(","));
          objc_msgSend(v13, "_appendDescriptionToString:atLevel:", a3, (a4 + 1));
          v11 = 0;
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v11 = 0;
      }
      while (v9);
    }
    objc_msgSend(a3, "appendString:", CFSTR("\n"));
    if (a4)
    {
      v14 = 1;
      do
      {
        objc_msgSend(a3, "appendString:", CFSTR("    "));
        ++v14;
      }
      while (v14 <= a4);
    }
    objc_msgSend(a3, "appendString:", CFSTR("}"));
  }
}

- (NSArray)animations
{
  return &self->_animations->super;
}

@end
