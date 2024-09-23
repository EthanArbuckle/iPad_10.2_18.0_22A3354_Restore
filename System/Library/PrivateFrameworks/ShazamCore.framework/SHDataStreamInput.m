@implementation SHDataStreamInput

- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  unsigned __int8 v15;

  v6 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v15);
  v10 = v15;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v12 = -[SHDataStreamInput readFromURL:error:](self, "readFromURL:error:", v6, a4);
    -[SHDataStreamInput next](self, "next");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "closeWithError:", 0);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 260, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  id v15;
  id *v17;
  id v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "open");
  if (objc_msgSend(v7, "hasBytesAvailable"))
  {
    v17 = a4;
    v8 = 0;
    while (1)
    {
      v9 = (void *)MEMORY[0x220751AAC]();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 2048);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLength:", 2048);
      v11 = objc_retainAutorelease(v10);
      v12 = objc_msgSend(v7, "read:maxLength:", objc_msgSend(v11, "mutableBytes"), 2048);
      v13 = v12 == 0;
      if (!v12)
        break;
      v18 = v8;
      v14 = -[SHDataStreamInput processData:error:](self, "processData:error:", v11, &v18);
      v15 = v18;

      if (!v14)
        goto LABEL_9;

      objc_autoreleasePoolPop(v9);
      v8 = v15;
      if ((objc_msgSend(v7, "hasBytesAvailable") & 1) == 0)
      {
        v13 = 1;
        goto LABEL_10;
      }
    }
    v15 = v8;
LABEL_9:

    objc_autoreleasePoolPop(v9);
LABEL_10:
    if (v17 && v15)
    {
      v15 = objc_retainAutorelease(v15);
      *v17 = v15;
    }
  }
  else
  {
    v15 = 0;
    v13 = 1;
  }
  objc_msgSend(v7, "close", v17);

  return v13;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;

  -[SHDataStreamInput next](self, "next");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SHDataStreamInput next](self, "next");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "closeWithError:", a3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SHDataStreamInput next](self, "next");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "processData:error:", v6, a4);

  return (char)a4;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
}

@end
