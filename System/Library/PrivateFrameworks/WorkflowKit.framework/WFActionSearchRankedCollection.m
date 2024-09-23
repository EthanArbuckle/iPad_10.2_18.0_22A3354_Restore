@implementation WFActionSearchRankedCollection

- (WFActionSearchRankedCollection)init
{
  WFActionSearchRankedCollection *v2;
  uint64_t v3;
  NSMutableOrderedSet *itemsWithExactNameMatch;
  uint64_t v5;
  NSMutableOrderedSet *itemsWithNameMatch;
  uint64_t v7;
  NSMutableOrderedSet *itemsWithCategoryMatch;
  uint64_t v9;
  NSMutableOrderedSet *itemsWithKeywordMatch;
  WFActionSearchRankedCollection *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFActionSearchRankedCollection;
  v2 = -[WFActionSearchRankedCollection init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemsWithExactNameMatch = v2->_itemsWithExactNameMatch;
    v2->_itemsWithExactNameMatch = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    itemsWithNameMatch = v2->_itemsWithNameMatch;
    v2->_itemsWithNameMatch = (NSMutableOrderedSet *)v5;

    v7 = objc_opt_new();
    itemsWithCategoryMatch = v2->_itemsWithCategoryMatch;
    v2->_itemsWithCategoryMatch = (NSMutableOrderedSet *)v7;

    v9 = objc_opt_new();
    itemsWithKeywordMatch = v2->_itemsWithKeywordMatch;
    v2->_itemsWithKeywordMatch = (NSMutableOrderedSet *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)orderedSetForType:(unint64_t)a3
{
  if (a3 <= 3)
    a2 = (SEL)*(id *)((char *)&self->super.isa + *(_QWORD *)&asc_1C1B47DA0[8 * a3]);
  return (id)(id)a2;
}

- (void)addItem:(id)a3 forType:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[WFActionSearchRankedCollection orderedSetForType:](self, "orderedSetForType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)prioritizeItem:(id)a3 type:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  -[WFActionSearchRankedCollection orderedSetForType:](self, "orderedSetForType:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "indexOfObject:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "moveObjectsAtIndexes:toIndex:", v8, 0);

  }
}

- (id)rankedItems
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "unionOrderedSet:", self->_itemsWithExactNameMatch);
  objc_msgSend(v3, "unionOrderedSet:", self->_itemsWithNameMatch);
  objc_msgSend(v3, "unionOrderedSet:", self->_itemsWithKeywordMatch);
  objc_msgSend(v3, "unionOrderedSet:", self->_itemsWithCategoryMatch);
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsWithKeywordMatch, 0);
  objc_storeStrong((id *)&self->_itemsWithCategoryMatch, 0);
  objc_storeStrong((id *)&self->_itemsWithNameMatch, 0);
  objc_storeStrong((id *)&self->_itemsWithExactNameMatch, 0);
}

@end
