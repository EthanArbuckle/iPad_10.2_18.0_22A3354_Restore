@implementation VKARWalkingFeatureSet

- (VKARWalkingFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  VKARWalkingFeatureSet *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  VKARWalkingFeatureSet *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKARWalkingFeatureSet;
  v5 = -[VKARWalkingFeatureSet init](&v16, sel_init);
  if (v5)
  {
    v6 = v4;
    v7 = v6;
    if (v6)
      v8 = v6;
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v7;

    do
    {
      v10 = __ldaxr(&nextIdentifier(void)::key);
      v11 = v10 + 1;
    }
    while (__stlxr(v11, &nextIdentifier(void)::key));
    *((_QWORD *)v5 + 4) = v11;
    *((_QWORD *)v5 + 5) = 0;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v12;

    v14 = v5;
  }

  return v5;
}

- (int64_t)state
{
  std::mutex *v3;
  int64_t v4;

  v3 = (std::mutex *)((char *)self + 72);
  std::mutex::lock((std::mutex *)((char *)self + 72));
  v4 = *((_QWORD *)self + 5);
  std::mutex::unlock(v3);
  return v4;
}

- (void)setState:(int64_t)a3
{
  std::mutex *v5;
  uint64_t v6;

  v5 = (std::mutex *)((char *)self + 72);
  std::mutex::lock((std::mutex *)((char *)self + 72));
  v6 = *((_QWORD *)self + 5);
  if (v6 != a3)
  {
    -[VKARWalkingFeatureSet _stateWillChangeFromState:nextState:](self, "_stateWillChangeFromState:nextState:", v6, a3);
    *((_QWORD *)self + 5) = a3;
  }
  std::mutex::unlock(v5);
}

- (void)_stateWillChangeFromState:(int64_t)a3 nextState:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  _QWORD block[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *((id *)self + 7);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C809B0];
    v10 = MEMORY[0x1E0C80D38];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __61__VKARWalkingFeatureSet__stateWillChangeFromState_nextState___block_invoke;
        block[3] = &unk_1E42F2F70;
        block[4] = v12;
        block[5] = self;
        block[6] = a3;
        block[7] = a4;
        dispatch_async(v10, block);
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (NSArray)features
{
  return (NSArray *)*((id *)self + 2);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 72));
  objc_msgSend(*((id *)self + 7), "addObject:", v4);
  std::mutex::unlock((std::mutex *)((char *)self + 72));

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 72));
  objc_msgSend(*((id *)self + 7), "removeObject:", v4);
  std::mutex::unlock((std::mutex *)((char *)self + 72));

}

- (BOOL)isEqual:(id)a3
{
  VKARWalkingFeatureSet *v4;
  uint64_t v5;
  char v6;
  VKARWalkingFeatureSet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (VKARWalkingFeatureSet *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[VKARWalkingFeatureSet features](self, "features");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKARWalkingFeatureSet features](v7, "features");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v9)
      {
        v6 = 1;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C99E60];
        -[VKARWalkingFeatureSet features](self, "features");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0C99E60];
        -[VKARWalkingFeatureSet features](v7, "features");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = objc_msgSend(v12, "isEqualToSet:", v15);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = *((_QWORD *)self + 5) - 1;
  if (v7 > 4)
    v8 = CFSTR("VKARWalkingFeatureSetStateNone");
  else
    v8 = (const __CFString *)*((_QWORD *)&off_1E42F2F90 + v7);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p uniqueIdentifier:%llu state:%@ features:%@>"), v5, self, *((_QWORD *)self + 4), v8, *((_QWORD *)self + 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)uniqueIdentifier
{
  return *((_QWORD *)self + 4);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 72));
  *((_QWORD *)self + 6) = &off_1E42B4AD0;

  *((_QWORD *)self + 1) = &off_1E42B5370;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = &off_1E42B5370;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 6) = &off_1E42B4AD0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = 850045863;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_QWORD *)self + 16) = 0;
  return self;
}

uint64_t __61__VKARWalkingFeatureSet__stateWillChangeFromState_nextState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "featureSetStateDidChange:previous:current:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
