@implementation SKUIItemList

- (void)addItem:(id)a3
{
  -[NSMutableArray addObject:](self->_items, "addObject:", a3);
}

- (void)addItems:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_items, "addObjectsFromArray:", a3);
}

- (BOOL)isUnavailableItemIdentifier:(id)a3
{
  return -[NSSet containsObject:](self->_unavailableItemIdentifiers, "containsObject:", a3);
}

- (void)removeItemsAtIndexes:(id)a3
{
  -[NSMutableArray removeObjectsAtIndexes:](self->_items, "removeObjectsAtIndexes:", a3);
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

- (SKUIItemList)initWithCacheRepresentation:(id)a3
{
  id v4;
  SKUIItemList *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *seeAllTitle;
  void *v12;
  uint64_t v13;
  NSString *seeAllURLString;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  NSMutableArray *items;
  uint64_t v19;
  NSSet *unavailableItemIdentifiers;
  objc_super v22;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemList initWithCacheRepresentation:].cold.1();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIItemList;
  v5 = -[SKUIItemList init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("seeallt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      seeAllTitle = v5->_seeAllTitle;
      v5->_seeAllTitle = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("seeall"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      seeAllURLString = v5->_seeAllURLString;
      v5->_seeAllURLString = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("items"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (objc_class *)objc_opt_class();
      SKUICacheCodingDecodeArray(v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      items = v5->_items;
      v5->_items = (NSMutableArray *)v17;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("unavail"));
    self = (SKUIItemList *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self);
      unavailableItemIdentifiers = v5->_unavailableItemIdentifiers;
      v5->_unavailableItemIdentifiers = (NSSet *)v19;

    }
    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  NSMutableArray *items;
  void *v5;
  NSString *seeAllTitle;
  NSString *seeAllURLString;
  NSString *title;
  NSSet *unavailableItemIdentifiers;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  if (items)
  {
    SKUICacheCodingEncodeArray(items);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("items"));

  }
  seeAllTitle = self->_seeAllTitle;
  if (seeAllTitle)
    objc_msgSend(v3, "setObject:forKey:", seeAllTitle, CFSTR("seeallt"));
  seeAllURLString = self->_seeAllURLString;
  if (seeAllURLString)
    objc_msgSend(v3, "setObject:forKey:", seeAllURLString, CFSTR("seeall"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  unavailableItemIdentifiers = self->_unavailableItemIdentifiers;
  if (unavailableItemIdentifiers)
  {
    -[NSSet allObjects](unavailableItemIdentifiers, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("unavail"));

  }
  return (NSMutableDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableArray mutableCopyWithZone:](self->_items, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_seeAllTitle, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_seeAllURLString, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSSet copyWithZone:](self->_unavailableItemIdentifiers, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSString)seeAllTitle
{
  return self->_seeAllTitle;
}

- (void)setSeeAllTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)seeAllURLString
{
  return self->_seeAllURLString;
}

- (void)setSeeAllURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)unavailableItemIdentifiers
{
  return self->_unavailableItemIdentifiers;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seeAllURLString, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)initWithCacheRepresentation:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemList initWithCacheRepresentation:]";
}

@end
