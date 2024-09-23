@implementation SHDataStreamOutput

- (void)dealloc
{
  objc_super v3;

  -[NSOutputStream close](self->_outputStream, "close");
  v3.receiver = self;
  v3.super_class = (Class)SHDataStreamOutput;
  -[SHDataStreamOutput dealloc](&v3, sel_dealloc);
}

- (SHDataStreamOutput)initWithDestination:(id)a3
{
  id v4;
  SHDataStreamOutput *v5;
  uint64_t v6;
  NSOutputStream *outputStream;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHDataStreamOutput;
  v5 = -[SHDataStreamOutput init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamWithURL:append:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    outputStream = v5->_outputStream;
    v5->_outputStream = (NSOutputStream *)v6;

    -[NSOutputStream open](v5->_outputStream, "open");
  }

  return v5;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;

  -[NSOutputStream close](self->_outputStream, "close");
  -[SHDataStreamOutput next](self, "next");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SHDataStreamOutput next](self, "next");
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
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SHDataStreamOutput outputStream](self, "outputStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = objc_msgSend(v7, "write:maxLength:", v9, v10);
  if (v11 <= 0)
  {
    -[SHDataStreamOutput outputStream](self, "outputStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHCoreError annotateError:withError:](SHCoreError, "annotateError:withError:", a4, v13);

  }
  return v11 > 0;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_outputStream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

@end
