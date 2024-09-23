@implementation PKMultiKeyValueRow

- (id)initKeyValueSources:(id)a3
{
  id v5;
  PKMultiKeyValueRow *v6;
  PKMultiKeyValueRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMultiKeyValueRow;
  v6 = -[PKMultiKeyValueRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sources, a3);

  return v7;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_sources;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "appendString:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v12;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  NSString *axID;
  id v5;
  id v6;

  v6 = a3;
  -[PKMultiKeyValueRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    axID = self->_axID;
    v5 = v6;
    objc_msgSend(v5, "setAccessibilityIdentifier:", axID);
    objc_msgSend(v5, "setSources:", self->_sources);

  }
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sources);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKMultiKeyValueRow *v4;
  PKMultiKeyValueRow *v5;
  char v6;

  v4 = (PKMultiKeyValueRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = PKEqualObjects();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKMultiKeyValueRow *v5;
  uint64_t v6;
  NSArray *sources;

  v5 = +[PKMultiKeyValueRow allocWithZone:](PKMultiKeyValueRow, "allocWithZone:");
  v6 = -[NSArray copyWithZone:](self->_sources, "copyWithZone:", a3);
  sources = v5->_sources;
  v5->_sources = (NSArray *)v6;

  return v5;
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
