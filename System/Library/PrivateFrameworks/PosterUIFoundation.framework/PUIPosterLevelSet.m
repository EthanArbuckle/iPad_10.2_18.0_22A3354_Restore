@implementation PUIPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1)
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_22);
  return (id)defaultLevelSet_defaultLevelSet;
}

void __36__PUIPosterLevelSet_defaultLevelSet__block_invoke()
{
  PUIPosterLevelSet *v0;
  void *v1;

  v0 = -[PUIPosterLevelSet initWithNumberOfLevels:]([PUIPosterLevelSet alloc], "initWithNumberOfLevels:", 3, -1000, 1000, -2000);
  v1 = (void *)defaultLevelSet_defaultLevelSet;
  defaultLevelSet_defaultLevelSet = (uint64_t)v0;

}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1)
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_19);
  return (id)compositeLevelSet_compositeLevelSet;
}

void __38__PUIPosterLevelSet_compositeLevelSet__block_invoke()
{
  PUIPosterLevelSet *v0;
  void *v1;

  v0 = -[PUIPosterLevelSet initWithNumberOfLevels:]([PUIPosterLevelSet alloc], "initWithNumberOfLevels:", 8, -3000, -2000, -1000, -500, 0, 1000, 2000, 3000);
  v1 = (void *)compositeLevelSet_compositeLevelSet;
  compositeLevelSet_compositeLevelSet = (uint64_t)v0;

}

+ (id)allLevelsExceptFloating
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allLevelsExceptFloating_onceToken != -1)
    dispatch_once(&allLevelsExceptFloating_onceToken, block);
  return (id)allLevelsExceptFloating_allLevelsExceptFloating;
}

void __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "compositeLevelSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = v2;

  objc_msgSend(*(id *)(allLevelsExceptFloating_allLevelsExceptFloating + 8), "bs_filter:", &__block_literal_global_21_0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(allLevelsExceptFloating_allLevelsExceptFloating + 8);
  *(_QWORD *)(allLevelsExceptFloating_allLevelsExceptFloating + 8) = v4;

}

uint64_t __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToNumber:", &unk_25156AE88) ^ 1;
}

+ (id)floatingLevelSet
{
  if (floatingLevelSet_onceToken != -1)
    dispatch_once(&floatingLevelSet_onceToken, &__block_literal_global_23);
  return (id)floatingLevelSet_floatingLevelSet;
}

void __37__PUIPosterLevelSet_floatingLevelSet__block_invoke()
{
  PUIPosterLevelSet *v0;
  void *v1;

  v0 = -[PUIPosterLevelSet initWithLevel:]([PUIPosterLevelSet alloc], "initWithLevel:", 1000);
  v1 = (void *)floatingLevelSet_floatingLevelSet;
  floatingLevelSet_floatingLevelSet = (uint64_t)v0;

}

+ (id)levelSetForLevel:(int64_t)a3
{
  return -[PUIPosterLevelSet initWithLevel:]([PUIPosterLevelSet alloc], "initWithLevel:", a3);
}

- (PUIPosterLevelSet)initWithSet:(id)a3
{
  id v4;
  PUIPosterLevelSet *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *levels;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIPosterLevelSet;
  v5 = -[PUIPosterLevelSet init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    levels = v5->_levels;
    v5->_levels = v8;

  }
  return v5;
}

- (PUIPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  PUIPosterLevelSet *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  NSSet *levels;
  uint64_t *i;
  objc_super v12;
  uint64_t v13;

  v12.receiver = self;
  v12.super_class = (Class)PUIPosterLevelSet;
  v4 = -[PUIPosterLevelSet init](&v12, sel_init);
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
    v8 = objc_msgSend(v5, "copy");
    levels = v4->_levels;
    v4->_levels = (NSSet *)v8;

  }
  return v4;
}

- (PUIPosterLevelSet)initWithLevel:(int64_t)a3
{
  PUIPosterLevelSet *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *levels;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUIPosterLevelSet;
  v4 = -[PUIPosterLevelSet init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    levels = v4->_levels;
    v4->_levels = (NSSet *)v7;

  }
  return v4;
}

- (PUIPosterLevelSet)init
{
  PUIPosterLevelSet *v2;
  uint64_t v3;
  NSSet *levels;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUIPosterLevelSet;
  v2 = -[PUIPosterLevelSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    levels = v2->_levels;
    v2->_levels = (NSSet *)v3;

  }
  return v2;
}

- (PUIPosterLevelSet)initWithCoder:(id)a3
{
  id v4;
  PUIPosterLevelSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *levels;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIPosterLevelSet;
  v5 = -[PUIPosterLevelSet init](&v13, sel_init);
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
    v10 = objc_claimAutoreleasedReturnValue();
    levels = v5->_levels;
    v5->_levels = (NSSet *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_levels, CFSTR("levels"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfLevels
{
  return -[NSSet count](self->_levels, "count");
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_levels, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PUIPosterLevelSet *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PUIPosterLevelSet *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[PUIPosterLevelSet isEqualToLevelSet:](self, "isEqualToLevelSet:", v4);
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  PUIPosterLevelSet *v4;
  PUIPosterLevelSet *v5;
  char v6;

  v4 = (PUIPosterLevelSet *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
      v6 = 1;
    else
      v6 = -[NSSet isEqual:](self->_levels, "isEqual:", v4->_levels);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUIPosterLevelSet *v4;
  uint64_t v5;
  NSSet *levels;

  v4 = -[PUIPosterLevelSet init](+[PUIPosterLevelSet allocWithZone:](PUIPosterLevelSet, "allocWithZone:", a3), "init");
  v5 = -[NSSet copy](self->_levels, "copy");
  levels = v4->_levels;
  v4->_levels = (NSSet *)v5;

  return v4;
}

- (BOOL)containsLevel:(int64_t)a3
{
  NSSet *levels;
  void *v4;

  levels = self->_levels;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(levels) = -[NSSet containsObject:](levels, "containsObject:", v4);

  return (char)levels;
}

- (void)enumerateLevels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if (v7)
  {
    v4 = (void *)MEMORY[0x24BDBCEB8];
    -[NSSet allObjects](self->_levels, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sortUsingSelector:", sel_compare_);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__PUIPosterLevelSet_enumerateLevels___block_invoke;
    v8[3] = &unk_25154C9E0;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

uint64_t __37__PUIPosterLevelSet_enumerateLevels___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"), a4);
}

- (NSOrderedSet)sortedLevels
{
  NSOrderedSet *sortedLevels;
  NSOrderedSet *v3;
  void *v5;
  void *v6;
  void *v7;
  NSOrderedSet *v8;
  NSOrderedSet *v9;

  sortedLevels = self->_sortedLevels;
  if (sortedLevels)
  {
    v3 = sortedLevels;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    -[NSSet allObjects](self->_levels, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sortUsingSelector:", sel_compare_);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v7);
    v8 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sortedLevels;
    self->_sortedLevels = v8;

    v3 = self->_sortedLevels;
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_34);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterLevelSet sortedLevels](self, "sortedLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("levels"), 1);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __32__PUIPosterLevelSet_description__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_opt_new();
  v1 = (void *)description_posixNumberFormatter;
  description_posixNumberFormatter = v0;

  v2 = (void *)description_posixNumberFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

uint64_t __32__PUIPosterLevelSet_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)description_posixNumberFormatter, "stringFromNumber:", a2);
}

- (BOOL)isCompositeLevelSet
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "compositeLevelSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PUIPosterLevelSet isEqualToLevelSet:](self, "isEqualToLevelSet:", v3);

  return (char)self;
}

- (NSSet)levels
{
  return self->_levels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedLevels, 0);
  objc_storeStrong((id *)&self->_levels, 0);
}

@end
