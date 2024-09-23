@implementation PMLDenseMatrix

- (PMLDenseMatrix)initWithData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5
{
  id v9;
  PMLDenseMatrix *v10;
  PMLDenseMatrix *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseMatrix;
  v10 = -[PMLDenseMatrix init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_numberOfRows = a4;
    v10->_numberOfColumns = a5;
    objc_storeStrong((id *)&v10->_data, a3);
  }

  return v11;
}

- (const)values
{
  return -[PMLDenseVector ptr](self->_data, "ptr");
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  const float *v4;
  unint64_t numberOfRows;
  const float *v6;
  unint64_t v7;
  unint64_t numberOfColumns;
  unint64_t v9;
  unint64_t v10;
  void (**v11)(id, unint64_t, unint64_t);

  v11 = (void (**)(id, unint64_t, unint64_t))a3;
  v4 = -[PMLDenseVector ptr](self->_data, "ptr");
  numberOfRows = self->_numberOfRows;
  if (numberOfRows)
  {
    v6 = v4;
    v7 = 0;
    numberOfColumns = self->_numberOfColumns;
    v9 = numberOfColumns;
    do
    {
      if (v9)
      {
        v10 = 0;
        do
        {
          if (v6[v10 + v7 * v9] != 0.0)
          {
            v11[2](v11, v7, v10);
            numberOfColumns = self->_numberOfColumns;
          }
          ++v10;
          v9 = numberOfColumns;
        }
        while (v10 < numberOfColumns);
        numberOfRows = self->_numberOfRows;
        v9 = numberOfColumns;
      }
      ++v7;
    }
    while (v7 < numberOfRows);
  }

}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)denseMatrixFromData:(id)a3 numberOfRows:(unint64_t)a4 numberOfColumns:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:numberOfRows:numberOfColumns:", v8, a4, a5);

  return v9;
}

+ (id)denseMatrixFromNumbers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  char *v10;
  void *v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  PMLMutableDenseVector *v16;
  void *v17;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (char *)malloc_type_calloc(objc_msgSend(v4, "count") * v6, 4uLL, 0x100004052888210uLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v8 = v7;
  if (objc_msgSend(v4, "count"))
  {
    v9 = 0;
    v10 = v8;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == v6)
      {
        if (v6)
          goto LABEL_6;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLDenseMatrix.m"), 59, CFSTR("Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)"), v9, objc_msgSend(v11, "count"), v6);

        if (v6)
        {
LABEL_6:
          for (i = 0; i != v6; ++i)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "floatValue");
            *(_DWORD *)&v10[4 * i] = v14;

          }
        }
      }

      ++v9;
      v10 += 4 * v6;
    }
    while (v9 < objc_msgSend(v4, "count"));
  }
  v16 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLMutableDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v8, objc_msgSend(v4, "count") * v6, 1);
  objc_msgSend(a1, "denseMatrixFromData:numberOfRows:numberOfColumns:", v16, objc_msgSend(v4, "count"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
