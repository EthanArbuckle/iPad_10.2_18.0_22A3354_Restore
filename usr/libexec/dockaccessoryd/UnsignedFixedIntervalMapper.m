@implementation UnsignedFixedIntervalMapper

- (UnsignedFixedIntervalMapper)initWithBins:(id)a3 intervalCreationBlock:(id)a4 valueComparisonBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  UnsignedFixedIntervalMapper *v11;
  id v12;
  id creationBlock;
  id v14;
  id comparisonBlock;
  id v16;
  unint64_t v17;
  _UNKNOWN **v18;
  uint64_t (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  uint64_t v21;
  void *v22;
  _UNKNOWN **v23;
  uint64_t (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  NSArray *intervals;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)UnsignedFixedIntervalMapper;
  v11 = -[UnsignedFixedIntervalMapper init](&v31, "init");
  if (v11)
  {
    v12 = objc_retainBlock(v9);
    creationBlock = v11->_creationBlock;
    v11->_creationBlock = v12;

    v14 = objc_retainBlock(v10);
    comparisonBlock = v11->_comparisonBlock;
    v11->_comparisonBlock = v14;

    v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v8, "count") + 1);
    if (objc_msgSend(v8, "count"))
    {
      v17 = 0;
      v18 = &off_1002457E0;
      do
      {
        v19 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper creationBlock](v11, "creationBlock"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v17));
        v21 = ((uint64_t (**)(_QWORD, _UNKNOWN **, void *))v19)[2](v19, v18, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        objc_msgSend(v16, "addObject:", v22);

        v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v17));
        ++v17;
        v18 = v23;
      }
      while ((unint64_t)objc_msgSend(v8, "count") > v17);
    }
    else
    {
      v23 = &off_1002457E0;
    }
    v24 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper creationBlock](v11, "creationBlock"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[DKMInterval positiveInfinityEnd](DKMInterval, "positiveInfinityEnd"));
    v26 = ((uint64_t (**)(_QWORD, _UNKNOWN **, void *))v24)[2](v24, v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v16, "addObject:", v27);

    v28 = (NSArray *)objc_msgSend(v16, "copy");
    intervals = v11->_intervals;
    v11->_intervals = v28;

  }
  return v11;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper intervals](self, "intervals"));
  v6 = objc_msgSend(v5, "count");

  if (v6 == (id)1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper comparisonBlock](self, "comparisonBlock"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper intervals](self, "intervals"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v7));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "end"));
      v12 = ((uint64_t (**)(_QWORD, unint64_t, void *))v8)[2](v8, a3, v11);

      if (v12)
        break;
      ++v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper intervals](self, "intervals"));
      v14 = (char *)objc_msgSend(v13, "count") - 1;

    }
    while (v7 < (unint64_t)v14);
  }
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7);
}

- (id)intervalForValue:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper intervals](self, "intervals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UnsignedFixedIntervalMapper intervalIndexForValue:](self, "intervalIndexForValue:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntValue")));

  return v7;
}

- (NSArray)intervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)creationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)comparisonBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparisonBlock, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

@end
