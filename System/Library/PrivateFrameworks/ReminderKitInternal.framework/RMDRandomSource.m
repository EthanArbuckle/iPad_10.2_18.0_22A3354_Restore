@implementation RMDRandomSource

- (RMDRandomSource)init
{
  uint64_t v3;
  RMDARC4RandomSource *v4;
  RMDRandomSource *p_super;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(RMDARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RMDRandomSource;
    v4 = -[RMDRandomSource init](&v7, sel_init);
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDRandomSource)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMDRandomSource;
  return -[RMDRandomSource init](&v4, sel_init, a3);
}

+ (id)sharedRandom
{
  if (sharedRandom_onceToken != -1)
    dispatch_once(&sharedRandom_onceToken, &__block_literal_global);
  return (id)sharedRandom_source;
}

void __31__RMDRandomSource_sharedRandom__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedRandom_source;
  sharedRandom_source = v0;

}

- (int64_t)nextInt
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define nextInt"));
  return 0;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define nextIntWithUpperBound:"));
  return 0;
}

- (float)nextUniform
{
  return (float)-[RMDRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 16777217) * 0.000000059605;
}

- (BOOL)nextBool
{
  return -[RMDRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 2) != 0;
}

- (id)arrayByShufflingObjectsInArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v14 = -[RMDRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", (v10 + i + 1));
          if (v14 == v10 + (_DWORD)i)
          {
            objc_msgSend(v6, "addObject:", v13);
          }
          else
          {
            v15 = v14;
            objc_msgSend(v6, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

            objc_msgSend(v6, "setObject:atIndexedSubscript:", v13, v15);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v10 += i;
      }
      while (v9);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    v4 = v18;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
  }

  return v5;
}

@end
