@implementation PRPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1)
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_7);
  return (id)defaultLevelSet_defaultLevelSet;
}

void __35__PRPosterLevelSet_defaultLevelSet__block_invoke()
{
  PRPosterLevelSet *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)defaultLevelSet_defaultLevelSet;
  defaultLevelSet_defaultLevelSet = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D7FCF8], "defaultLevelSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(defaultLevelSet_defaultLevelSet + 8);
  *(_QWORD *)(defaultLevelSet_defaultLevelSet + 8) = v2;

}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1)
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_38_1);
  return (id)compositeLevelSet_compositeLevelSet;
}

void __37__PRPosterLevelSet_compositeLevelSet__block_invoke()
{
  PRPosterLevelSet *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)compositeLevelSet_compositeLevelSet;
  compositeLevelSet_compositeLevelSet = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D7FCF8], "compositeLevelSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(compositeLevelSet_compositeLevelSet + 8);
  *(_QWORD *)(compositeLevelSet_compositeLevelSet + 8) = v2;

}

+ (id)allLevelsExceptFloating
{
  if (allLevelsExceptFloating_onceToken != -1)
    dispatch_once(&allLevelsExceptFloating_onceToken, &__block_literal_global_39);
  return (id)allLevelsExceptFloating_allLevelsExceptFloating;
}

void __43__PRPosterLevelSet_allLevelsExceptFloating__block_invoke()
{
  PRPosterLevelSet *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D7FCF8], "allLevelsExceptFloating");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(allLevelsExceptFloating_allLevelsExceptFloating + 8);
  *(_QWORD *)(allLevelsExceptFloating_allLevelsExceptFloating + 8) = v2;

}

+ (id)backgroundLevelSet
{
  if (backgroundLevelSet_onceToken != -1)
    dispatch_once(&backgroundLevelSet_onceToken, &__block_literal_global_40);
  return (id)backgroundLevelSet_backgroundLevelSet;
}

void __38__PRPosterLevelSet_backgroundLevelSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -2000);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)backgroundLevelSet_backgroundLevelSet;
  backgroundLevelSet_backgroundLevelSet = v0;

}

+ (id)foregroundLevelSet
{
  if (foregroundLevelSet_onceToken != -1)
    dispatch_once(&foregroundLevelSet_onceToken, &__block_literal_global_41);
  return (id)foregroundLevelSet_foregroundLevelSet;
}

void __38__PRPosterLevelSet_foregroundLevelSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -1000);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)foregroundLevelSet_foregroundLevelSet;
  foregroundLevelSet_foregroundLevelSet = v0;

}

+ (id)floatingLevelSet
{
  if (floatingLevelSet_onceToken != -1)
    dispatch_once(&floatingLevelSet_onceToken, &__block_literal_global_42_0);
  return (id)floatingLevelSet_floatingLevelSet;
}

void __36__PRPosterLevelSet_floatingLevelSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", 1000);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)floatingLevelSet_floatingLevelSet;
  floatingLevelSet_floatingLevelSet = v0;

}

+ (id)levelSetForLevel:(int64_t)a3
{
  return -[PRPosterLevelSet initWithLevel:]([PRPosterLevelSet alloc], "initWithLevel:", a3);
}

- (PRPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  PRPosterLevelSet *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  PUIPosterLevelSet *underlyingLevelSet;
  uint64_t *i;
  objc_super v12;
  uint64_t v13;

  v12.receiver = self;
  v12.super_class = (Class)PRPosterLevelSet;
  v4 = -[PRPosterLevelSet init](&v12, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    for (i = &v13; a3; --a3)
    {
      v6 = i++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCF8]), "initWithSet:", v5);
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v8;

  }
  return v4;
}

- (PRPosterLevelSet)initWithLevel:(int64_t)a3
{
  PRPosterLevelSet *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRPosterLevelSet;
  v4 = -[PRPosterLevelSet init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7FCF8]);
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "initWithSet:", v8);
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v9;

  }
  return v4;
}

- (PRPosterLevelSet)initWithLevels:(id)a3
{
  id v4;
  PRPosterLevelSet *v5;
  uint64_t v6;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterLevelSet;
  v5 = -[PRPosterLevelSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCF8]), "initWithSet:", v4);
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v6;

  }
  return v5;
}

- (PRPosterLevelSet)init
{
  PRPosterLevelSet *v2;
  PUIPosterLevelSet *v3;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRPosterLevelSet;
  v2 = -[PRPosterLevelSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (PUIPosterLevelSet *)objc_alloc_init(MEMORY[0x1E0D7FCF8]);
    underlyingLevelSet = v2->_underlyingLevelSet;
    v2->_underlyingLevelSet = v3;

  }
  return v2;
}

- (PRPosterLevelSet)initWithCoder:(id)a3
{
  id v4;
  PRPosterLevelSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterLevelSet;
  v5 = -[PRPosterLevelSet init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("levels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCF8]), "initWithSet:", v10);
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PUIPosterLevelSet *underlyingLevelSet;
  id v4;
  id v5;

  underlyingLevelSet = self->_underlyingLevelSet;
  v4 = a3;
  -[PUIPosterLevelSet levels](underlyingLevelSet, "levels");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("levels"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfLevels
{
  return -[PUIPosterLevelSet numberOfLevels](self->_underlyingLevelSet, "numberOfLevels");
}

- (unint64_t)hash
{
  return -[PUIPosterLevelSet hash](self->_underlyingLevelSet, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PRPosterLevelSet *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PRPosterLevelSet *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[PRPosterLevelSet isEqualToLevelSet:](self, "isEqualToLevelSet:", v4);
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  PRPosterLevelSet *v4;
  id *p_isa;
  void *v6;
  void *v7;
  char v8;

  v4 = (PRPosterLevelSet *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    if (self == v4)
    {
      v8 = 1;
    }
    else
    {
      -[PUIPosterLevelSet levels](self->_underlyingLevelSet, "levels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[1], "levels");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToSet:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterLevelSet *v4;
  uint64_t v5;
  PUIPosterLevelSet *underlyingLevelSet;

  v4 = -[PRPosterLevelSet init](+[PRPosterLevelSet allocWithZone:](PRPosterLevelSet, "allocWithZone:", a3), "init");
  v5 = -[PUIPosterLevelSet copy](self->_underlyingLevelSet, "copy");
  underlyingLevelSet = v4->_underlyingLevelSet;
  v4->_underlyingLevelSet = (PUIPosterLevelSet *)v5;

  return v4;
}

- (BOOL)containsLevel:(int64_t)a3
{
  return -[PUIPosterLevelSet containsLevel:](self->_underlyingLevelSet, "containsLevel:", a3);
}

- (void)enumerateLevels:(id)a3
{
  -[PUIPosterLevelSet enumerateLevels:](self->_underlyingLevelSet, "enumerateLevels:", a3);
}

- (id)sortedLevels
{
  void *v2;
  void *v3;

  -[PUIPosterLevelSet sortedLevels](self->_underlyingLevelSet, "sortedLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)levels
{
  return (NSSet *)-[PUIPosterLevelSet levels](self->_underlyingLevelSet, "levels");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterLevelSet sortedLevels](self, "sortedLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("levels"), 1);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__CFString *__31__PRPosterLevelSet_description__block_invoke(uint64_t a1, void *a2)
{
  return ShortNSStringFromPRPosterLevel(objc_msgSend(a2, "integerValue"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLevelSet, 0);
}

@end
