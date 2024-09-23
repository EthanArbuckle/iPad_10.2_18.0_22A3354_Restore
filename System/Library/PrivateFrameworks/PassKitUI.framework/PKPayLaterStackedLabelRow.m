@implementation PKPayLaterStackedLabelRow

- (PKPayLaterStackedLabelRow)initWithSources:(id)a3
{
  id v5;
  PKPayLaterStackedLabelRow *v6;
  PKPayLaterStackedLabelRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterStackedLabelRow;
  v6 = -[PKPayLaterStackedLabelRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sources, a3);

  return v7;
}

- (NSCopying)identifier
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sources;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  NSArray *sources;
  id v5;
  id v6;

  v6 = a3;
  -[PKPayLaterStackedLabelRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sources = self->_sources;
    v5 = v6;
    objc_msgSend(v5, "setSources:", sources);
    objc_msgSend(v5, "setPaddingBetweenRows:", self->_paddingBetweenRows);

  }
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sources);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterStackedLabelRow *v4;
  PKPayLaterStackedLabelRow *v5;
  double *v6;
  BOOL v7;

  v4 = (PKPayLaterStackedLabelRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
      v7 = self->_paddingBetweenRows == v6[2];
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)paddingBetweenRows
{
  return self->_paddingBetweenRows;
}

- (void)setPaddingBetweenRows:(double)a3
{
  self->_paddingBetweenRows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
