@implementation SBHLocalizedIndexedCollationStrategy

+ (id)defaultSectionTitles
{
  return (id)__defaultSectionTitles;
}

+ (id)defaultSectionIndexTitles
{
  return (id)__defaultSectionIndexTitles;
}

+ (id)myCurrentCollation
{
  BSDispatchQueueAssertMain();
  if (myCurrentCollation_onceToken != -1)
    dispatch_once(&myCurrentCollation_onceToken, &__block_literal_global_61);
  return (id)myCurrentCollation_currentCollation;
}

void __58__SBHLocalizedIndexedCollationStrategy_myCurrentCollation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)myCurrentCollation_currentCollation;
  myCurrentCollation_currentCollation = v0;

}

+ (void)prewarm
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "myCurrentCollation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenizer");

  +[SBHLocalizedIndexedCollationStrategy myCurrentCollation](SBHLocalizedIndexedCollationStrategy, "myCurrentCollation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionTitles");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)__defaultSectionTitles;
  __defaultSectionTitles = v5;

  +[SBHLocalizedIndexedCollationStrategy myCurrentCollation](SBHLocalizedIndexedCollationStrategy, "myCurrentCollation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIndexTitles");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)__defaultSectionIndexTitles;
  __defaultSectionIndexTitles = v8;

  v10 = (id)objc_msgSend(a1, "dimSumCollationStrategy");
  v11 = (id)objc_msgSend(a1, "defaultCollationStrategy");
}

+ (id)dimSumCollationStrategy
{
  if (dimSumCollationStrategy_onceToken != -1)
    dispatch_once(&dimSumCollationStrategy_onceToken, &__block_literal_global_2_1);
  return (id)dimSumCollationStrategy_dimSumCollation;
}

void __63__SBHLocalizedIndexedCollationStrategy_dimSumCollationStrategy__block_invoke()
{
  SBHLocalizedIndexedCollationStrategy *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = [SBHLocalizedIndexedCollationStrategy alloc];
  v4[0] = *MEMORY[0x1E0DC53E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[SBHLocalizedIndexedCollationStrategy initWithAdditionalSections:](v0, "initWithAdditionalSections:", v1);
  v3 = (void *)dimSumCollationStrategy_dimSumCollation;
  dimSumCollationStrategy_dimSumCollation = v2;

}

+ (id)defaultCollationStrategy
{
  if (defaultCollationStrategy_onceToken != -1)
    dispatch_once(&defaultCollationStrategy_onceToken, &__block_literal_global_4_1);
  return (id)defaultCollationStrategy_defaultCollationStrategy;
}

void __64__SBHLocalizedIndexedCollationStrategy_defaultCollationStrategy__block_invoke()
{
  SBHLocalizedIndexedCollationStrategy *v0;
  void *v1;

  v0 = -[SBHLocalizedIndexedCollationStrategy initWithAdditionalSections:]([SBHLocalizedIndexedCollationStrategy alloc], "initWithAdditionalSections:", 0);
  v1 = (void *)defaultCollationStrategy_defaultCollationStrategy;
  defaultCollationStrategy_defaultCollationStrategy = (uint64_t)v0;

}

- (SBHLocalizedIndexedCollationStrategy)initWithAdditionalSections:(id)a3
{
  id v4;
  SBHLocalizedIndexedCollationStrategy *v5;
  uint64_t v6;
  UILocalizedIndexedCollation *currentCollation;
  uint64_t v8;
  NSArray *cachedSectionTitles;
  uint64_t v10;
  NSArray *cachedSectionIndexTitles;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  NSArray *appendedSections;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBHLocalizedIndexedCollationStrategy;
  v5 = -[SBHLocalizedIndexedCollationStrategy init](&v19, sel_init);
  if (v5)
  {
    +[SBHLocalizedIndexedCollationStrategy myCurrentCollation](SBHLocalizedIndexedCollationStrategy, "myCurrentCollation");
    v6 = objc_claimAutoreleasedReturnValue();
    currentCollation = v5->_currentCollation;
    v5->_currentCollation = (UILocalizedIndexedCollation *)v6;

    objc_msgSend((id)objc_opt_class(), "defaultSectionTitles");
    v8 = objc_claimAutoreleasedReturnValue();
    cachedSectionTitles = v5->_cachedSectionTitles;
    v5->_cachedSectionTitles = (NSArray *)v8;

    objc_msgSend((id)objc_opt_class(), "defaultSectionIndexTitles");
    v10 = objc_claimAutoreleasedReturnValue();
    cachedSectionIndexTitles = v5->_cachedSectionIndexTitles;
    v5->_cachedSectionIndexTitles = (NSArray *)v10;

    if (objc_msgSend(v4, "count"))
    {
      -[NSArray arrayByAddingObjectsFromArray:](v5->_cachedSectionTitles, "arrayByAddingObjectsFromArray:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_cachedSectionTitles;
      v5->_cachedSectionTitles = (NSArray *)v12;

      -[NSArray arrayByAddingObjectsFromArray:](v5->_cachedSectionIndexTitles, "arrayByAddingObjectsFromArray:", v4);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_cachedSectionIndexTitles;
      v5->_cachedSectionIndexTitles = (NSArray *)v14;

      v16 = objc_msgSend(v4, "copy");
      appendedSections = v5->_appendedSections;
      v5->_appendedSections = (NSArray *)v16;

    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBHLocalizedIndexedCollationStrategy *v4;
  char isKindOfClass;
  char v6;

  v4 = (SBHLocalizedIndexedCollationStrategy *)a3;
  BSDispatchQueueAssertMain();
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
      v6 = BSEqualObjects();
  }

  return v6;
}

- (id)appendedSectionTitles
{
  return self->_appendedSections;
}

- (BOOL)containsSection:(id)a3
{
  return -[NSArray containsObject:](self->_cachedSectionTitles, "containsObject:", a3);
}

- (NSArray)sectionTitles
{
  return self->_cachedSectionTitles;
}

- (NSArray)sectionIndexTitles
{
  return self->_cachedSectionIndexTitles;
}

- (int64_t)sectionForObject:(id)a3 collationStringSelector:(SEL)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  BSDispatchQueueAssertMain();
  v7 = -[UILocalizedIndexedCollation sectionForObject:collationStringSelector:](self->_currentCollation, "sectionForObject:collationStringSelector:", v6, a4);
  if (self->_appendedSections)
  {
    objc_msgSend(v6, "performSelector:", sel__sbhIconLibraryOverrideCollationSectionTitle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v7 = -[NSArray indexOfObject:](self->_cachedSectionIndexTitles, "indexOfObject:", v8);

  }
  return v7;
}

- (id)sortedArrayFromArray:(id)a3 collationStringSelector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  BSDispatchQueueAssertMain();
  -[UILocalizedIndexedCollation sortedArrayFromArray:collationStringSelector:](self->_currentCollation, "sortedArrayFromArray:collationStringSelector:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)sectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  return -[UILocalizedIndexedCollation sectionForSectionIndexTitleAtIndex:](self->_currentCollation, "sectionForSectionIndexTitleAtIndex:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCollation, 0);
  objc_storeStrong((id *)&self->_appendedSections, 0);
  objc_storeStrong((id *)&self->_cachedSectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_cachedSectionTitles, 0);
}

@end
