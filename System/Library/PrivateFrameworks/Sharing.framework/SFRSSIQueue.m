@implementation SFRSSIQueue

- (void)addSample:(double)a3 atTicks:(unint64_t)a4
{
  NSMutableArray *v7;
  NSMutableArray *rssiValues;
  NSMutableArray *v9;
  NSMutableArray *tickValues;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;

  if (a3 < 0.0)
  {
    if (!self->_rssiValues)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      rssiValues = self->_rssiValues;
      self->_rssiValues = v7;

    }
    if (!self->_tickValues)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      tickValues = self->_tickValues;
      self->_tickValues = v9;

    }
    v11 = self->_rssiValues;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v11, "insertObject:atIndex:", v12, 0);

    v13 = self->_tickValues;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v14, 0);

    if ((unint64_t)-[NSMutableArray count](self->_rssiValues, "count") >= 5)
      -[NSMutableArray removeLastObject](self->_rssiValues, "removeLastObject");
    if ((unint64_t)-[NSMutableArray count](self->_tickValues, "count") >= 5)
      -[NSMutableArray removeLastObject](self->_tickValues, "removeLastObject");
  }
}

- (double)velocity
{
  double result;

  -[SFRSSIQueue velocityFromA:toB:](self, "velocityFromA:toB:", 0, 1);
  return result;
}

- (double)velocitySmoothed
{
  double result;

  -[SFRSSIQueue velocityFromA:toB:](self, "velocityFromA:toB:", 0, 3);
  return result;
}

- (double)velocityFromA:(unint64_t)a3 toB:(unint64_t)a4
{
  double v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v7 = 0.0;
  if (-[NSMutableArray count](self->_rssiValues, "count") > a4)
  {
    v8 = -[NSMutableArray count](self->_tickValues, "count");
    if (a3 < a4 && v8 > a4)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_tickValues, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unsignedLongLongValue");

      -[NSMutableArray objectAtIndexedSubscript:](self->_tickValues, "objectAtIndexedSubscript:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unsignedLongLongValue");

      UpTicksToSecondsF();
      v12 = v11;
      -[NSMutableArray objectAtIndexedSubscript:](self->_rssiValues, "objectAtIndexedSubscript:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      -[NSMutableArray objectAtIndexedSubscript:](self->_rssiValues, "objectAtIndexedSubscript:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      return (v15 - v18) / v12;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickValues, 0);
  objc_storeStrong((id *)&self->_rssiValues, 0);
}

@end
