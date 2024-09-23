@implementation CLPCReportingReadResult

- (void)enumerate:(id)a3
{
  uint64_t v4;
  array<CLPCReportingRows *, 8UL> *p_rows_by_schema;
  CLPCReportingRows *v6;
  CLPCReportingRows *v7;
  void *v8;
  uint64_t v9;
  uint64_t (**v10)(id, _QWORD, void *);

  v10 = (uint64_t (**)(id, _QWORD, void *))a3;
  v4 = 0;
  p_rows_by_schema = &self->rows_by_schema;
  while (1)
  {
    v6 = p_rows_by_schema->__elems_[v4];
    v7 = v6;
    if (v6)
    {
      -[CLPCReportingRows rows](v6, "rows");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        if ((v10[2](v10, v4, v7) & 1) == 0)
          break;
      }
    }

    if (++v4 == 8)
      goto LABEL_8;
  }

LABEL_8:
}

- (void)setStatRows:(unsigned int)a3 forIndex:
{
  id v6;

  v6 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 8 * a3 + 8), a2);

}

- (CLPCReportingReadResult)init
{
  CLPCReportingReadResult *v2;
  CLPCReportingReadResult *v3;
  CLPCReportingReadResult *v4;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLPCReportingReadResult;
  v2 = -[CLPCReportingReadResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v6 = 0;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)&v2->rows_by_schema, &v6);

    v4 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 64;
  do
  {

    v3 -= 8;
  }
  while (v3);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (unint64_t)hasRowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  if (a3 >= 8)
  {
    return 0;
  }
  else if (self->rows_by_schema.__elems_[a3])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)rowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  CLPCReportingRows *v6;
  CLPCReportingRows *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a3 >= 8)
  {
    v7 = 0;
  }
  else
  {
    v6 = self->rows_by_schema.__elems_[a3];
    v7 = v6;
    if (!v6
      || (-[CLPCReportingRows rows](v6, "rows"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          !v9))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There are no rows for schema ID %lu."), a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *MEMORY[0x24BDD0BA0];
        v14[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870206, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v7;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__CLPCReportingReadResult_debugDescription__block_invoke;
  v7[3] = &unk_2514407A8;
  v4 = v3;
  v8 = v4;
  -[CLPCReportingReadResult enumerate:](self, "enumerate:", v7);
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__CLPCReportingReadResult_debugDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v5, "schema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "schema", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "columns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        -[CLPCReportingSchemaColumn dictionaryRepresentation](*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v12);
  }

  v16 = *(void **)(a1 + 32);
  v25[0] = CFSTR("SchemaID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = v9;
  v25[1] = CFSTR("Columns");
  v25[2] = CFSTR("Rows");
  objc_msgSend(v5, "rows");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v19);

  return 1;
}

@end
