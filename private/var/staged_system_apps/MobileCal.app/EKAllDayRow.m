@implementation EKAllDayRow

- (EKAllDayRow)init
{
  EKAllDayRow *v2;
  NSMutableArray *v3;
  NSMutableArray *blocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKAllDayRow;
  v2 = -[EKAllDayRow init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    blocks = v2->_blocks;
    v2->_blocks = v3;

  }
  return v2;
}

- (void)addOccurrenceBlock:(id)a3
{
  -[NSMutableArray addObject:](self->_blocks, "addObject:", a3);
}

- (unint64_t)spaceGapFor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_blocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "gapBetweenBlock:", v4, (_QWORD)v13);
        if (v11 == (id)-1)
        {
          v8 = -1;
          goto LABEL_14;
        }
        if ((unint64_t)v11 > v8)
          v8 = (unint64_t)v11;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)occurrenceBlocks
{
  return self->_blocks;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("<%@: %p>(\n"), objc_opt_class(self), self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKAllDayRow occurrenceBlocks](self, "occurrenceBlocks"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "description"));
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
