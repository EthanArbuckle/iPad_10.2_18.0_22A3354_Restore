@implementation PRUISPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1)
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_14);
  return (id)defaultLevelSet_defaultLevelSet;
}

void __38__PRUISPosterLevelSet_defaultLevelSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE74EB8], "defaultLevelSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:](PRUISPosterLevelSet, "PRUISPosterLevelSetForPUIPosterLevelSet:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultLevelSet_defaultLevelSet;
  defaultLevelSet_defaultLevelSet = v0;

}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1)
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_20);
  return (id)compositeLevelSet_compositeLevelSet;
}

void __40__PRUISPosterLevelSet_compositeLevelSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE74EB8], "compositeLevelSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:](PRUISPosterLevelSet, "PRUISPosterLevelSetForPUIPosterLevelSet:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)compositeLevelSet_compositeLevelSet;
  compositeLevelSet_compositeLevelSet = v0;

}

+ (id)allLevelsExceptFloating
{
  if (allLevelsExceptFloating_onceToken != -1)
    dispatch_once(&allLevelsExceptFloating_onceToken, &__block_literal_global_21);
  return (id)allLevelsExceptFloating_allLevelsExceptFloating;
}

void __46__PRUISPosterLevelSet_allLevelsExceptFloating__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE74EB8], "allLevelsExceptFloating");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:](PRUISPosterLevelSet, "PRUISPosterLevelSetForPUIPosterLevelSet:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = v0;

}

+ (id)levelSetForLevel:(int64_t)a3
{
  return -[PRUISPosterLevelSet initWithLevel:]([PRUISPosterLevelSet alloc], "initWithLevel:", a3);
}

+ (id)PRUISPosterLevelSetForPUIPosterLevelSet:(id)a3
{
  PUIPosterLevelSet *v3;
  PRUISPosterLevelSet *v4;
  PUIPosterLevelSet *underlyingLevelSet;

  v3 = (PUIPosterLevelSet *)a3;
  v4 = objc_alloc_init(PRUISPosterLevelSet);
  underlyingLevelSet = v4->_underlyingLevelSet;
  v4->_underlyingLevelSet = v3;

  return v4;
}

- (PRUISPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  PRUISPosterLevelSet *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  PUIPosterLevelSet *underlyingLevelSet;
  uint64_t *i;
  objc_super v12;
  uint64_t v13;

  v12.receiver = self;
  v12.super_class = (Class)PRUISPosterLevelSet;
  v4 = -[PRUISPosterLevelSet init](&v12, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    for (i = &v13; a3; --a3)
    {
      v6 = i++;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE74EB8]), "initWithSet:", v5);
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v8;

  }
  return v4;
}

- (PRUISPosterLevelSet)initWithLevel:(int64_t)a3
{
  PRUISPosterLevelSet *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRUISPosterLevelSet;
  v4 = -[PRUISPosterLevelSet init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE74EB8]);
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "initWithSet:", v8);
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v9;

  }
  return v4;
}

- (PRUISPosterLevelSet)initWithLevels:(id)a3
{
  id v4;
  PRUISPosterLevelSet *v5;
  uint64_t v6;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterLevelSet;
  v5 = -[PRUISPosterLevelSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE74EB8]), "initWithSet:", v4);
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v6;

  }
  return v5;
}

- (PRUISPosterLevelSet)init
{
  PRUISPosterLevelSet *v2;
  PUIPosterLevelSet *v3;
  PUIPosterLevelSet *underlyingLevelSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterLevelSet;
  v2 = -[PRUISPosterLevelSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (PUIPosterLevelSet *)objc_alloc_init(MEMORY[0x24BE74EB8]);
    underlyingLevelSet = v2->_underlyingLevelSet;
    v2->_underlyingLevelSet = v3;

  }
  return v2;
}

- (PRUISPosterLevelSet)initWithCoder:(id)a3
{
  id v4;
  PRUISPosterLevelSet *v5;
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
  v14.super_class = (Class)PRUISPosterLevelSet;
  v5 = -[PRUISPosterLevelSet init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("levels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE74EB8]), "initWithSet:", v10);
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
  PRUISPosterLevelSet *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PRUISPosterLevelSet *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[PRUISPosterLevelSet isEqualToLevelSet:](self, "isEqualToLevelSet:", v4);
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  PRUISPosterLevelSet *v4;
  id *p_isa;
  void *v6;
  void *v7;
  char v8;

  v4 = (PRUISPosterLevelSet *)a3;
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
  PRUISPosterLevelSet *v4;
  uint64_t v5;
  PUIPosterLevelSet *underlyingLevelSet;

  v4 = -[PRUISPosterLevelSet init](+[PRUISPosterLevelSet allocWithZone:](PRUISPosterLevelSet, "allocWithZone:", a3), "init");
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

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterLevelSet sortedLevels](self, "sortedLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("levels"), 1);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__CFString *__34__PRUISPosterLevelSet_description__block_invoke(uint64_t a1, void *a2)
{
  return ShortNSStringFromPRUISPosterLevel(objc_msgSend(a2, "integerValue"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLevelSet, 0);
}

@end
