@implementation OADTableRow

- (OADTableRow)init
{
  OADTableRow *v2;
  NSMutableArray *v3;
  NSMutableArray *mCells;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADTableRow;
  v2 = -[OADTableRow init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mCells = v2->mCells;
    v2->mCells = v3;

  }
  return v2;
}

- (void)setHeight:(float)a3
{
  self->mHeight = a3;
}

- (id)addCell
{
  OADTableCell *v3;

  v3 = objc_alloc_init(OADTableCell);
  -[NSMutableArray addObject:](self->mCells, "addObject:", v3);
  return v3;
}

- (unint64_t)cellCount
{
  return -[NSMutableArray count](self->mCells, "count");
}

- (id)cellAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mCells, "objectAtIndex:", a3);
}

- (float)height
{
  return self->mHeight;
}

- (void)flipCellsRTL
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = -[NSMutableArray count](self->mCells, "count");
  v4 = v3 - 1;
  if (v3 == 1)
    goto LABEL_6;
  v5 = 1;
  do
    -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->mCells, "exchangeObjectAtIndex:withObjectAtIndex:", v5 - 1, v4--);
  while (v5++ < v4);
  if (v3)
  {
LABEL_6:
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->mCells, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 + 1;
      if (objc_msgSend(v8, "horzMerge"))
      {
        if (v9 >= v3)
        {
LABEL_11:
          v9 = v7;
        }
        else
        {
          while (1)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->mCells, "objectAtIndexedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v10, "horzMerge") & 1) == 0)
              break;

            if (v3 == ++v9)
              goto LABEL_11;
          }
          -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->mCells, "exchangeObjectAtIndex:withObjectAtIndex:", v7, v9++);

        }
      }

      v7 = v9;
    }
    while (v9 < v3);
    v11 = 0;
    do
    {
      -[OADTableRow cellAtIndex:](self, "cellAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leftStroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rightStroke");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLeftStroke:", v15);

      objc_msgSend(v13, "setRightStroke:", v14);
      ++v11;
    }
    while (v3 != v11);
  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableRow;
  -[OADTableRow description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCells, 0);
}

@end
