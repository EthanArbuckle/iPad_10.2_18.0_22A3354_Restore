@implementation SHJSONLFileReader

- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = -[SHJSONLFileReader loadDataFromURL:withCompression:error:](self, "loadDataFromURL:withCompression:error:", v6, +[SHDataCompression supportedCompressionTypeFromFileURL:](SHDataCompression, "supportedCompressionTypeFromFileURL:", v6), a4);

  return (char)a4;
}

- (BOOL)loadData:(id)a3 withCompression:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[SHJSONLFileReader inputForAlgorithm:error:](self, "inputForAlgorithm:error:", v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "processData:error:", v8, a5);

  objc_msgSend(v9, "closeWithError:", 0);
  return (char)a5;
}

- (BOOL)loadDataFromURL:(id)a3 withCompression:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[SHJSONLFileReader inputForAlgorithm:error:](self, "inputForAlgorithm:error:", v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "loadDataFromURL:error:", v8, a5);

  objc_msgSend(v9, "closeWithError:", 0);
  return (char)a5;
}

- (id)inputForAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v4;
  SHDataStreamInput *v6;
  SHJSONLDataDetokenizer *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v6 = objc_alloc_init(SHDataStreamInput);
  v7 = objc_alloc_init(SHJSONLDataDetokenizer);
  -[SHJSONLFileReader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHJSONLDataDetokenizer setDelegate:](v7, "setDelegate:", v8);

  if ((_DWORD)v4)
  {
    v9 = -[SHDataCompression initForDecompressionWithAlgorithm:]([SHDataCompression alloc], "initForDecompressionWithAlgorithm:", v4);
    objc_msgSend(v9, "setNext:", v7);
    -[SHDataStreamInput setNext:](v6, "setNext:", v9);

  }
  else
  {
    -[SHDataStreamInput setNext:](v6, "setNext:", v7);
  }

  return v6;
}

- (SHJSONLDataDetokenizerDelegate)delegate
{
  return (SHJSONLDataDetokenizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
