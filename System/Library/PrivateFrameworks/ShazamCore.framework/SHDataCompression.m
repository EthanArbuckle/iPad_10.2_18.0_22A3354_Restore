@implementation SHDataCompression

- (void)dealloc
{
  objc_super v3;

  compression_stream_destroy((compression_stream *)&self->_stream);
  v3.receiver = self;
  v3.super_class = (Class)SHDataCompression;
  -[SHDataCompression dealloc](&v3, sel_dealloc);
}

- (id)initForCompressionWithAlgorithm:(int)a3
{
  return -[SHDataCompression initWithOperation:algorithm:](self, "initWithOperation:algorithm:", 0, *(_QWORD *)&a3);
}

- (id)initForDecompressionWithAlgorithm:(int)a3
{
  return -[SHDataCompression initWithOperation:algorithm:](self, "initWithOperation:algorithm:", 1, *(_QWORD *)&a3);
}

- (SHDataCompression)initWithOperation:(int)a3 algorithm:(int)a4
{
  SHDataCompression *v6;
  SHDataCompression *v7;
  SHDataCompression *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SHDataCompression;
  v6 = -[SHDataCompression init](&v10, sel_init);
  v7 = v6;
  if (v6 && (v6->_operation = a3, v6->_algorithm = a4, !-[SHDataCompression setup](v6, "setup")))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = -[SHDataCompression performOperation:withData:algorithm:flags:error:](self, "performOperation:withData:algorithm:flags:error:", -[SHDataCompression operation](self, "operation"), v6, -[SHDataCompression algorithm](self, "algorithm"), 0, a4);

  return (char)a4;
}

- (BOOL)setup
{
  return compression_stream_init((compression_stream *)&self->_stream, (compression_stream_operation)-[SHDataCompression operation](self, "operation"), (compression_algorithm)-[SHDataCompression algorithm](self, "algorithm")) == COMPRESSION_STATUS_OK;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = -[SHDataCompression operation](self, "operation");
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  -[SHDataCompression performOperation:withData:algorithm:flags:error:](self, "performOperation:withData:algorithm:flags:error:", v5, v6, -[SHDataCompression algorithm](self, "algorithm"), 1, 0);

  compression_stream_destroy((compression_stream *)&self->_stream);
  *(_OWORD *)&self->_stream.dst_ptr = 0u;
  *(_OWORD *)&self->_stream.src_ptr = 0u;
  self->_stream.state = 0;
  -[SHDataCompression next](self, "next");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SHDataCompression next](self, "next");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "closeWithError:", a3);

  }
  return v7;
}

- (BOOL)performOperation:(int)a3 withData:(id)a4 algorithm:(int)a5 flags:(int)a6 error:(id *)a7
{
  id v9;
  $5EDF551D13777AE05B17EA2C6AA46974 *p_stream;
  compression_status v11;
  compression_status v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v29[2048];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = objc_retainAutorelease(a4);
  p_stream = &self->_stream;
  self->_stream.src_ptr = (char *)objc_msgSend(v9, "bytes");
  self->_stream.src_size = objc_msgSend(v9, "length");
  while (1)
  {
    self->_stream.dst_ptr = v29;
    self->_stream.dst_size = 2048;
    v11 = compression_stream_process((compression_stream *)&self->_stream, a6);
    v12 = v11;
    if (v11 == COMPRESSION_STATUS_END)
      goto LABEL_6;
    if (v11)
    {
      +[SHCoreError errorWithCode:underlyingError:](SHCoreError, "errorWithCode:underlyingError:", 301, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHCoreError annotateError:withError:](SHCoreError, "annotateError:withError:", a7, v22);

      compression_stream_destroy((compression_stream *)p_stream);
LABEL_15:
      LOBYTE(v21) = 0;
      goto LABEL_16;
    }
    if (self->_stream.dst_size)
      break;
    -[SHDataCompression next](self, "next");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_12;
    v14 = (void *)v18;
    -[SHDataCompression next](self, "next");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDBCE50];
    v17 = 2048;
LABEL_11:
    objc_msgSend(v16, "dataWithBytes:length:", v29, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "processData:error:", v19, a7);

    if ((v20 & 1) == 0)
      goto LABEL_15;
LABEL_12:
    if (v12)
    {
      LOBYTE(v21) = 1;
      goto LABEL_16;
    }
  }
  if (self->_stream.src_size)
  {
LABEL_6:
    if (p_stream->dst_ptr <= v29)
      goto LABEL_12;
    -[SHDataCompression next](self, "next");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_12;
    v14 = (void *)v13;
    -[SHDataCompression next](self, "next");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDBCE50];
    v17 = self->_stream.dst_ptr - v29;
    goto LABEL_11;
  }
  if (p_stream->dst_ptr <= v29)
    goto LABEL_20;
  -[SHDataCompression next](self, "next");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_20;
  v25 = (void *)v24;
  -[SHDataCompression next](self, "next");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v29, self->_stream.dst_ptr - v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v26, "processData:error:", v27, a7);

  if (v21)
LABEL_20:
    LOBYTE(v21) = 1;
LABEL_16:

  return v21;
}

+ (int)supportedCompressionTypeFromFileURL:(id)a3
{
  void *v4;

  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "supportedCompressionTypeFromFilePathExtension:", v4);

  return (int)a1;
}

+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  int v8;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithFilenameExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFilenameExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("lzma"));

  if ((v5 & 1) != 0)
  {
    v6 = 774;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.shazamcatalog"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "conformsToType:", v7);

    if (v8)
      v6 = 517;
    else
      v6 = 0;
  }

  return v6;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[1].var2;
  return self;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int)a3
{
  self->_algorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
}

@end
