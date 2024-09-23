@implementation SHJSONLFileWriter

- (SHJSONLFileWriter)initWithDestination:(id)a3 compression:(int)a4
{
  uint64_t v4;
  id v7;
  SHJSONLFileWriter *v8;
  SHJSONLFileWriter *v9;
  uint64_t v10;
  SHDataStream *outputStream;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHJSONLFileWriter;
  v8 = -[SHJSONLFileWriter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destination, a3);
    -[SHJSONLFileWriter streamForWritingToURL:withCompression:](v9, "streamForWritingToURL:withCompression:", v9->_destination, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    outputStream = v9->_outputStream;
    v9->_outputStream = (SHDataStream *)v10;

  }
  return v9;
}

- (BOOL)writeObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "dataForJSONObject:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SHJSONLFileWriter outputStream](self, "outputStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processData:error:", v7, a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v4;

  -[SHJSONLFileWriter outputStream](self, "outputStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "closeWithError:", a3);

  return (char)a3;
}

+ (int64_t)dataCompressionFromAlgorithm:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 <= 773)
  {
    if ((a3 - 256) < 2)
      return 1;
    if (a3 == 517)
      return 3;
LABEL_10:
    v14 = v4;
    v15 = v3;
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDBCAB0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The compression type is unsupported"), v6, v5, v14, v15, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  if (a3 != 2049)
  {
    if (a3 == 774)
      return 2;
    goto LABEL_10;
  }
  return 0;
}

+ (id)dataForJSONObjects:(id)a3 compression:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "dataForJSONObject:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), a5, (_QWORD)v19);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {

          goto LABEL_12;
        }
        v16 = (void *)v15;
        objc_msgSend(v9, "appendData:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (objc_msgSend(v9, "compressUsingAlgorithm:error:", objc_msgSend(a1, "dataCompressionFromAlgorithm:", v6), a5))v17 = v9;
  else
LABEL_12:
    v17 = 0;

  return v17;
}

+ (id)dataForJSONObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 8, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "appendData:", v7);
    objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v8);

    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)streamForWritingToURL:(id)a3 withCompression:(int)a4
{
  uint64_t v4;
  id v6;
  SHDataStreamOutput *v7;
  SHDataStreamOutput *v8;
  void *v9;
  _QWORD v11[3];

  v4 = *(_QWORD *)&a4;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[SHDataStreamOutput initWithDestination:]([SHDataStreamOutput alloc], "initWithDestination:", v6);

  if ((_DWORD)v4)
  {
    v8 = -[SHDataCompression initForCompressionWithAlgorithm:]([SHDataCompression alloc], "initForCompressionWithAlgorithm:", v4);
    v11[0] = v8;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHJSONLFileWriter linkDataStream:](self, "linkDataStream:", v9);

  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (void)linkDataStream:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v3 = 0;
    do
    {
      if (v3 == objc_msgSend(v7, "count") - 1)
        break;
      v4 = v3 + 1;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v3 + 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNext:", v5);

      v3 = v4;
    }
    while (objc_msgSend(v7, "count") > v4);
  }

}

- (NSURL)destination
{
  return self->_destination;
}

- (SHDataStream)outputStream
{
  return self->_outputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
