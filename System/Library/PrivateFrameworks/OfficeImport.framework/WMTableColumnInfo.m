@implementation WMTableColumnInfo

- (WMTableColumnInfo)initWithStopArray:(id)a3
{
  id v4;
  WMTableColumnInfo *v5;
  uint64_t v6;
  NSMutableArray *mStopArray;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WMTableColumnInfo;
  v5 = -[WMTableColumnInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v4);
    mStopArray = v5->mStopArray;
    v5->mStopArray = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)mergeStopArray:(id)a3
{
  float v4;
  float v5;
  uint64_t v6;
  unsigned int i;
  void *v8;
  float v9;
  float v10;
  float v12;
  NSMutableArray *v13;
  void *v14;
  float v15;
  NSMutableArray *mStopArray;
  void *v17;
  id v18;

  v18 = a3;
  if (v18)
  {
    -[WMTableColumnInfo stopAt:](self, "stopAt:", 0);
    v5 = v4;
    LODWORD(v6) = 0;
    for (i = 0; ; ++i)
    {
      if (objc_msgSend(v18, "count") <= (unint64_t)i)
        goto LABEL_20;
      objc_msgSend(v18, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

      while (-[NSMutableArray count](self->mStopArray, "count") && v5 < v10)
      {
        if (-[NSMutableArray count](self->mStopArray, "count") - 1 <= (unint64_t)v6)
          goto LABEL_13;
        v6 = (v6 + 1);
        -[WMTableColumnInfo stopAt:](self, "stopAt:", v6);
        v5 = v12;
      }
      if (v5 < v10)
        break;
      if (v10 >= v5)
      {
        if (v10 == v5)
        {
          v6 = (v6 + 1);
          -[WMTableColumnInfo stopAt:](self, "stopAt:", v6);
          goto LABEL_14;
        }
      }
      else
      {
        mStopArray = self->mStopArray;
        objc_msgSend(v18, "objectAtIndex:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray insertObject:atIndex:](mStopArray, "insertObject:atIndex:", v17, v6);

        LODWORD(v6) = v6 + 1;
      }
LABEL_15:
      ;
    }
LABEL_13:
    v13 = self->mStopArray;
    objc_msgSend(v18, "objectAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v14);

    v6 = (v6 + 1);
    -[WMTableColumnInfo stopAt:](self, "stopAt:", v6);
LABEL_14:
    v5 = v15;
    goto LABEL_15;
  }
LABEL_20:

}

- (float)stopAt:(unsigned int)a3
{
  float v5;
  void *v6;
  float v7;

  v5 = -1.0;
  if (-[NSMutableArray count](self->mStopArray, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndex:](self->mStopArray, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v5 = v7;

  }
  return v5;
}

- (unsigned)columnSpan:(float)a3 at:(unsigned int)a4
{
  unint64_t v4;
  float v7;
  float v8;
  unint64_t v9;
  float v10;
  float v11;

  v4 = *(_QWORD *)&a4;
  if (a4)
  {
    -[WMTableColumnInfo stopAt:](self, "stopAt:", a4 - 1);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }
  LODWORD(v9) = v4;
  if (-[NSMutableArray count](self->mStopArray, "count") > (unint64_t)v4)
  {
    v10 = v8 + a3;
    v9 = v4;
    do
    {
      -[WMTableColumnInfo stopAt:](self, "stopAt:", v9);
      if (v10 <= v11)
        break;
      v9 = (v9 + 1);
    }
    while (-[NSMutableArray count](self->mStopArray, "count") > v9);
  }
  return v9 - v4 + 1;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->mStopArray, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStopArray, 0);
}

@end
