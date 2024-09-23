@implementation TextColumn

- (TextColumn)init
{
  TextColumn *v2;
  uint64_t v3;
  NSMutableArray *mutableRows;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TextColumn;
  v2 = -[TextColumn init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableRows = v2->_mutableRows;
    v2->_mutableRows = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRow:(id)a3
{
  NSMutableArray *mutableRows;

  mutableRows = self->_mutableRows;
  if (mutableRows)
    -[NSMutableArray addObject:](mutableRows, "addObject:", a3);
}

- (NSArray)rows
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_mutableRows);
}

- (unint64_t)rowCount
{
  return -[NSMutableArray count](self->_mutableRows, "count");
}

- (TextColumn)initWithRows:(id)a3
{
  id v4;
  TextColumn *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(TextColumn);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TextColumn setMutableRows:](v5, "setMutableRows:", v6);
  return v5;
}

- (void)sortRowsInAscendingOrder
{
  -[NSMutableArray sortUsingComparator:](self->_mutableRows, "sortUsingComparator:", &__block_literal_global_41);
}

uint64_t __38__TextColumn_sortRowsInAscendingOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "score");
    v11 = v10;
    objc_msgSend(v5, "score");
    if (v11 >= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (NSMutableArray)mutableRows
{
  return self->_mutableRows;
}

- (void)setMutableRows:(id)a3
{
  objc_storeStrong((id *)&self->_mutableRows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRows, 0);
}

@end
