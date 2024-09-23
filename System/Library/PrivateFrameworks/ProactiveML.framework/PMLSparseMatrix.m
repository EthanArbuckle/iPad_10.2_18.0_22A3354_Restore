@implementation PMLSparseMatrix

- (PMLSparseMatrix)initWithSparseMatrix:(sparse_m_float *)a3
{
  PMLSparseMatrix *result;
  void *v7;
  objc_super v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseMatrix.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matrix"));

  }
  v8.receiver = self;
  v8.super_class = (Class)PMLSparseMatrix;
  result = -[PMLSparseMatrix init](&v8, sel_init);
  if (result)
    result->_matrix = a3;
  return result;
}

- (unint64_t)numberOfRows
{
  return sparse_get_matrix_number_of_rows(self->_matrix);
}

- (unint64_t)numberOfColumns
{
  return sparse_get_matrix_number_of_columns(self->_matrix);
}

- (void)setMatrix:(sparse_m_float *)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseMatrix.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matrix"));

  }
  sparse_matrix_destroy(self->_matrix);
  self->_matrix = a3;
}

- (void)setIsSymmetric:(BOOL)a3
{
  unint64_t v6;
  void *v7;

  v6 = -[PMLSparseMatrix numberOfRows](self, "numberOfRows");
  if (v6 != -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseMatrix.m"), 50, CFSTR("Can not mark %lu x %lu matrix as symmetric"), -[PMLSparseMatrix numberOfRows](self, "numberOfRows"), -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"));

  }
  self->_isSymmetric = a3;
}

- (void)dealloc
{
  objc_super v3;

  sparse_matrix_destroy(self->_matrix);
  v3.receiver = self;
  v3.super_class = (Class)PMLSparseMatrix;
  -[PMLSparseMatrix dealloc](&v3, sel_dealloc);
}

- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  sparse_index *v7;
  sparse_index *v8;
  float *v9;
  float *v10;
  sparse_status v11;
  float v12;
  uint64_t v13;
  id v15;
  sparse_index column_end;

  v7 = (sparse_index *)malloc_type_malloc(8 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004000313F17uLL);
  if (!v7
    || (v8 = v7,
        (v9 = (float *)malloc_type_malloc(4 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004052888210uLL)) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v10 = v9;
  column_end = 0;
  v11 = sparse_extract_sparse_row_float(self->_matrix, a3, 0, &column_end, -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), v9, v8);
  v12 = 0.0;
  if (v11 >= 1)
  {
    v13 = 0;
    while (v8[v13] != a4)
    {
      if (v11 == ++v13)
        goto LABEL_9;
    }
    v12 = v10[v13];
  }
LABEL_9:
  free(v10);
  free(v8);
  return v12;
}

- (void)_enumerateSparseRowsWithBlock:(id)a3
{
  void (**v4)(id, sparse_index, _QWORD, float *, sparse_index *);
  float *v5;
  sparse_index *v6;
  unint64_t v7;
  __int128 v8;
  unint64_t v9;
  sparse_index v10;
  NSObject *v11;
  sparse_status v12;
  sparse_status v13;
  uint64_t v14;
  __int128 v15;
  sparse_index column_end;
  uint8_t buf[4];
  sparse_status v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, sparse_index, _QWORD, float *, sparse_index *))a3;
  v5 = (float *)malloc_type_malloc(4 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004052888210uLL);
  v6 = (sparse_index *)malloc_type_malloc(8 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004000313F17uLL);
  v7 = -[PMLSparseMatrix numberOfRows](self, "numberOfRows");
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 67109120;
    v15 = v8;
    do
    {
      column_end = 0;
      v12 = sparse_extract_sparse_row_float(self->_matrix, v10, 0, &column_end, -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns", v15), v5, v6);
      v13 = v12;
      if (v12 < 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v15;
          v18 = v13;
          _os_log_error_impl(&dword_2159BB000, v11, OS_LOG_TYPE_ERROR, "Error extracting floats from sparse rows, status: %d", buf, 8u);
        }
        v14 = 0;
      }
      else
      {
        v14 = v12;
      }
      v4[2](v4, v10++, v14, v5, v6);
    }
    while (v9 != v10);
  }
  free(v5);
  free(v6);

}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__PMLSparseMatrix_enumerateNonZeroValuesWithBlock___block_invoke;
  v6[3] = &unk_24D3DB900;
  v7 = v4;
  v5 = v4;
  -[PMLSparseMatrix _enumerateSparseRowsWithBlock:](self, "_enumerateSparseRowsWithBlock:", v6);

}

- (void)enumerateNonZeroValuesForRow:(unint64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, unint64_t, _QWORD, float);
  float *v7;
  sparse_index *v8;
  sparse_status v9;
  sparse_status v10;
  uint64_t v11;
  float *v12;
  sparse_index *v13;
  float v14;
  float v15;
  uint64_t v16;
  sparse_index column_end;
  uint8_t buf[4];
  sparse_status v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, unint64_t, _QWORD, float))a4;
  v7 = (float *)malloc_type_malloc(4 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004052888210uLL);
  v8 = (sparse_index *)malloc_type_malloc(8 * -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), 0x100004000313F17uLL);
  column_end = 0;
  v9 = sparse_extract_sparse_row_float(self->_matrix, a3, 0, &column_end, -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"), v7, v8);
  v10 = v9;
  if (v9 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v10;
      _os_log_error_impl(&dword_2159BB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error extracting floats from sparse rows, status: %d", buf, 8u);
    }
  }
  else if (v9)
  {
    v11 = v9;
    v12 = v7;
    v13 = v8;
    do
    {
      v14 = *v12++;
      v15 = v14;
      v16 = *v13++;
      v6[2](v6, a3, v16, v15);
      --v11;
    }
    while (v11);
  }
  free(v7);
  free(v8);

}

- (PMLSparseMatrix)matrixWithConstantColumn
{
  sparse_m_float *v3;
  unint64_t v4;
  unint64_t v5;
  sparse_index i;
  _QWORD v8[5];

  v3 = sparse_matrix_create_float(-[PMLSparseMatrix numberOfRows](self, "numberOfRows"), -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns") + 1);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__PMLSparseMatrix_matrixWithConstantColumn__block_invoke;
  v8[3] = &__block_descriptor_40_e21_v40__0Q8Q16r_f24r_q32l;
  v8[4] = v3;
  -[PMLSparseMatrix _enumerateSparseRowsWithBlock:](self, "_enumerateSparseRowsWithBlock:", v8);
  v4 = -[PMLSparseMatrix numberOfRows](self, "numberOfRows");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      sparse_insert_entry_float(v3, 1.0, i, -[PMLSparseMatrix numberOfColumns](self, "numberOfColumns"));
  }
  sparse_commit(v3);
  return -[PMLSparseMatrix initWithSparseMatrix:]([PMLSparseMatrix alloc], "initWithSparseMatrix:", v3);
}

- (float)minValue
{
  float v2;
  _QWORD v4[5];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 2139095039;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__PMLSparseMatrix_minValue__block_invoke;
  v4[3] = &unk_24D3DB948;
  v4[4] = &v5;
  -[PMLSparseMatrix enumerateNonZeroValuesWithBlock:](self, "enumerateNonZeroValuesWithBlock:", v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (float)maxValue
{
  float v2;
  _QWORD v4[5];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 0x800000;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__PMLSparseMatrix_maxValue__block_invoke;
  v4[3] = &unk_24D3DB948;
  v4[4] = &v5;
  -[PMLSparseMatrix enumerateNonZeroValuesWithBlock:](self, "enumerateNonZeroValuesWithBlock:", v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isSymmetric
{
  return self->_isSymmetric;
}

- (sparse_m_float)matrix
{
  return self->_matrix;
}

uint64_t __27__PMLSparseMatrix_maxValue__block_invoke(uint64_t result, float a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(float *)(v2 + 24) >= a2)
    a2 = *(float *)(v2 + 24);
  *(float *)(v2 + 24) = a2;
  return result;
}

uint64_t __27__PMLSparseMatrix_minValue__block_invoke(uint64_t result, float a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(float *)(v2 + 24) < a2)
    a2 = *(float *)(v2 + 24);
  *(float *)(v2 + 24) = a2;
  return result;
}

uint64_t __43__PMLSparseMatrix_matrixWithConstantColumn__block_invoke(uint64_t a1, sparse_index a2, sparse_dimension a3, const float *a4, const sparse_index *a5)
{
  return sparse_insert_row_float(*(sparse_matrix_float *)(a1 + 32), a2, a3, a4, a5);
}

uint64_t __51__PMLSparseMatrix_enumerateNonZeroValuesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, float *a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  float v9;

  if (a3)
  {
    v7 = a3;
    v8 = result;
    do
    {
      v9 = *a4++;
      a5 += 8;
      result = (*(uint64_t (**)(float))(*(_QWORD *)(v8 + 32) + 16))(v9);
      --v7;
    }
    while (v7);
  }
  return result;
}

+ (PMLSparseMatrix)sparseMatrixWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4
{
  return (PMLSparseMatrix *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSparseMatrix:", sparse_matrix_create_float(a3, a4));
}

+ (id)sparseMatrixFromNumbers:(id)a3
{
  id v3;
  sparse_dimension v4;
  void *v5;
  sparse_dimension v6;
  sparse_m_float *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v20 = v3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = sparse_matrix_create_float(v4, v6);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == v6)
      {
        if (v6)
          goto LABEL_5;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLSparseMatrix.m"), 69, CFSTR("Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)"), i, objc_msgSend(v9, "count"), v6);

        if (v6)
        {
LABEL_5:
          v10 = 0;
          for (j = 0; j != v6; ++j)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", j);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "floatValue");
            v14 = v13;

            if (v14 != 0.0)
              sparse_insert_entry_float(v7, v14, (int)i, v10 >> 32);
            v10 += 0x100000000;
          }
        }
      }

    }
  }
  sparse_commit(v7);
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSparseMatrix:", v7);

  return v16;
}

@end
