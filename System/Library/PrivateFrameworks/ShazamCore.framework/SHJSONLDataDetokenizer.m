@implementation SHJSONLDataDetokenizer

- (SHJSONLDataDetokenizer)init
{
  SHJSONLDataDetokenizer *v2;
  uint64_t v3;
  NSMutableData *currentData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHJSONLDataDetokenizer;
  v2 = -[SHJSONLDataDetokenizer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    currentData = v2->_currentData;
    v2->_currentData = (NSMutableData *)v3;

  }
  return v2;
}

- (BOOL)writeDataToDelegate:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 1, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  if (v7)
  {
    -[SHJSONLDataDetokenizer next](self, "next");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (-[SHJSONLDataDetokenizer next](self, "next"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = 0,
          v11 = objc_msgSend(v10, "processData:error:", v6, &v19),
          v9 = v19,
          v10,
          v12 = v9,
          v11))
    {
      -[SHJSONLDataDetokenizer delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v16 = 1;
        goto LABEL_12;
      }
      -[SHJSONLDataDetokenizer delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v15 = objc_msgSend(v14, "parsedJSONObject:error:", v7, &v18);
      v12 = v18;

      if ((v15 & 1) != 0)
      {
        v16 = 1;
        v9 = v12;
LABEL_12:

        goto LABEL_13;
      }
      v9 = v12;
    }
    +[SHCoreError annotateError:withError:](SHCoreError, "annotateError:withError:", a4, v12);
    v16 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    +[SHCoreError errorWithCode:underlyingError:](SHCoreError, "errorWithCode:underlyingError:", 300, v8);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "sh_rangeOfData:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SHJSONLDataDetokenizer currentData](self, "currentData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v6);
    v11 = 1;
  }
  else
  {
    v12 = v8;
    v13 = v8 + v9;
    objc_msgSend(v6, "subdataWithRange:", 0, v8 + v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[SHJSONLDataDetokenizer currentData](self, "currentData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendData:", v10);

    }
    -[SHJSONLDataDetokenizer currentData](self, "currentData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
      goto LABEL_7;
    -[SHJSONLDataDetokenizer currentData](self, "currentData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHJSONLDataDetokenizer setCurrentData:](self, "setCurrentData:", v18);

    LODWORD(v18) = -[SHJSONLDataDetokenizer writeDataToDelegate:withError:](self, "writeDataToDelegate:withError:", v17, a4);
    if (!(_DWORD)v18)
    {
      v11 = 0;
    }
    else
    {
LABEL_7:
      v19 = (void *)MEMORY[0x24BDBCEC8];
      objc_msgSend(v6, "subdataWithRange:", v13, objc_msgSend(v6, "length") - v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataWithData:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[SHJSONLDataDetokenizer processData:error:](self, "processData:error:", v21, a4);
    }
  }

  return v11;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v9;
  char v10;

  -[SHJSONLDataDetokenizer currentData](self, "currentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[SHJSONLDataDetokenizer currentData](self, "currentData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SHJSONLDataDetokenizer writeDataToDelegate:withError:](self, "writeDataToDelegate:withError:", v6, a3);

    if (!v7)
      return 0;
  }
  else
  {

  }
  -[SHJSONLDataDetokenizer next](self, "next");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "closeWithError:", a3);

  return v10;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (SHJSONLDataDetokenizerDelegate)delegate
{
  return (SHJSONLDataDetokenizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableData)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
  objc_storeStrong((id *)&self->_currentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_next, 0);
}

@end
