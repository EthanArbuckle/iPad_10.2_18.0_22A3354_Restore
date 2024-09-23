@implementation UITextSelectionWindowAveragedValue

- (UITextSelectionWindowAveragedValue)initWithDepth:(unint64_t)a3
{
  UITextSelectionWindowAveragedValue *v4;
  UITextSelectionWindowAveragedValue *v5;
  uint64_t v6;
  NSMutableArray *values;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextSelectionWindowAveragedValue;
  v4 = -[UITextSelectionWindowAveragedValue init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_depth = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4->_depth);
    values = v5->_values;
    v5->_values = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)flushValues
{
  -[NSMutableArray removeAllObjects](self->_values, "removeAllObjects");
}

- (void)addValue:(double)a3
{
  NSMutableArray *values;
  void *v5;

  values = self->_values;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](values, "insertObject:atIndex:", v5, 0);

  if (-[NSMutableArray count](self->_values, "count") > self->_depth)
    -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
}

- (double)windowAveragedValue
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_values;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue", (_QWORD)v11);
        v7 = v7 + v9;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  if (-[NSMutableArray count](self->_values, "count"))
    return v7 / (double)(unint64_t)-[NSMutableArray count](self->_values, "count");
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
