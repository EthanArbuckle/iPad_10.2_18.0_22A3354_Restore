@implementation CNVCardSelectorMap

- (CNVCardSelectorMap)init
{
  CNVCardSelectorMap *v2;
  NSMutableArray *v3;
  NSMutableArray *strings;
  NSMutableArray *v5;
  NSMutableArray *selectors;
  CNVCardSelectorMap *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNVCardSelectorMap;
  v2 = -[CNVCardSelectorMap init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    strings = v2->_strings;
    v2->_strings = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    selectors = v2->_selectors;
    v2->_selectors = v5;

    v7 = v2;
  }

  return v2;
}

- (void)setSelector:(SEL)a3 forString:(id)a4
{
  NSMutableArray *strings;
  id v7;
  uint64_t v8;
  NSMutableArray *selectors;
  id v10;

  strings = self->_strings;
  v7 = a4;
  v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](strings, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, -[NSMutableArray count](strings, "count"), 1024, &__block_literal_global_0);
  -[NSMutableArray insertObject:atIndex:](self->_strings, "insertObject:atIndex:", v7, v8);

  selectors = self->_selectors;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](selectors, "insertObject:atIndex:", v10, v8);

}

- (SEL)selectorForString:(id)a3
{
  NSMutableArray *strings;
  id v5;
  uint64_t v6;
  void *v8;
  const char *v9;

  strings = self->_strings;
  v5 = a3;
  v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](strings, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, -[NSMutableArray count](strings, "count"), 256, &__block_literal_global_0);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_selectors, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const char *)objc_msgSend(v8, "pointerValue");

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectors, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end
