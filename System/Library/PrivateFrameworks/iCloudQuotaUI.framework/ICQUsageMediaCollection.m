@implementation ICQUsageMediaCollection

- (void)removeItemAtIndex:(unint64_t)a3
{
  void *v5;
  float v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_itemSizes, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  self->_totalSize = self->_totalSize - v6;

  -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->_itemSizes, "removeObjectAtIndex:", a3);
}

- (void)sortItemsByMediaKey:(id)a3
{
  void *v4;
  NSMutableArray *items;
  id v6;
  _QWORD v7[4];
  id v8;

  if (-[ICQUsageMediaCollection isGrouped](self, "isGrouped", a3))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", self->_itemSizes, self->_items);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    items = self->_items;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke;
    v7[3] = &unk_24E3F3E38;
    v8 = v4;
    v6 = v4;
    -[NSMutableArray sortUsingComparator:](items, "sortUsingComparator:", v7);
    -[NSMutableArray sortUsingComparator:](self->_itemSizes, "sortUsingComparator:", &__block_literal_global_17);

  }
  else
  {
    -[NSMutableArray sortUsingComparator:](self->_items, "sortUsingComparator:", &__block_literal_global_46);
  }
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v4 = *MEMORY[0x24BDDBB70];
  v5 = a2;
  objc_msgSend(a3, "valueForProperty:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_24E435F38;
  v9 = v8;

  objc_msgSend(v5, "valueForProperty:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = &unk_24E435F38;
  v12 = v11;

  v13 = objc_msgSend(v9, "compare:", v12);
  return v13;
}

- (void)setItems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *items;

  if (self->_items != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    items = self->_items;
    self->_items = v4;

  }
}

- (void)setItemSizes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *itemSizes;

  if (self->_itemSizes != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    itemSizes = self->_itemSizes;
    self->_itemSizes = v4;

  }
}

- (BOOL)isGrouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSArray)itemSizes
{
  return &self->_itemSizes->super;
}

- (float)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(float)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSizes, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
