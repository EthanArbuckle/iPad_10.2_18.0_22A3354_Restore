@implementation TSPDataRepReadChannel

- (TSPDataRepReadChannel)initWithRepresentation:(id)a3
{
  id v5;
  TSPDataRepReadChannel *v6;
  TSPDataRepReadChannel *v7;
  id *p_representation;
  uint64_t v9;
  SFUInputStream *inputStream;
  uint64_t v11;
  SFUInputStream *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *readQueue;
  TSPDataRepReadChannel *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSPDataRepReadChannel;
  v6 = -[TSPDataRepReadChannel init](&v20, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  p_representation = (id *)&v6->_representation;
  objc_storeStrong((id *)&v6->_representation, a3);
  -[SFUDataRepresentation inputStream](v7->_representation, "inputStream");
  v9 = objc_claimAutoreleasedReturnValue();
  inputStream = v7->_inputStream;
  v7->_inputStream = (SFUInputStream *)v9;

  if ((-[SFUInputStream canSeek](v7->_inputStream, "canSeek") & 1) == 0)
  {
    -[SFUInputStream close](v7->_inputStream, "close");
    objc_msgSend(*p_representation, "bufferedInputStream");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v7->_inputStream;
    v7->_inputStream = (SFUInputStream *)v11;

    if (!v7->_inputStream)
    {
      if (objc_msgSend(*p_representation, "encodedLength"))
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataRepReadChannel initWithRepresentation:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataRepReadChannel.mm");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 35, CFSTR("Could not create the buffered input stream."));

      }
      goto LABEL_7;
    }
  }
  v13 = dispatch_queue_create("TSPDataRepReadChannel.Read", 0);
  readQueue = v7->_readQueue;
  v7->_readQueue = (OS_dispatch_queue *)v13;

  v15 = v7;
LABEL_8:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[SFUInputStream close](self->_inputStream, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSPDataRepReadChannel;
  -[TSPDataRepReadChannel dealloc](&v3, sel_dealloc);
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *readQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!self->_representation)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataRepReadChannel readWithQueue:handler:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataRepReadChannel.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 52, CFSTR("Stream is closed"));

  }
  readQueue = self->_readQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke;
  block[3] = &unk_24D82A0A8;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(readQueue, block);

}

void __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  size_t v6;
  void *v7;
  size_t v8;
  dispatch_data_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD block[4];
  dispatch_data_t v23;
  id v24;
  BOOL v25;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataLength");
  if (v2 < 1)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_4;
    v17[3] = &unk_24D8299B8;
    v13 = &v18;
    v14 = *(NSObject **)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    dispatch_async(v14, v17);
  }
  else
  {
    v3 = v2;
    v4 = 0;
    v5 = (void *)*MEMORY[0x24BDAC980];
    while (1)
    {
      v6 = v3 - v4 >= 0x20000 ? 0x20000 : v3 - v4;
      v7 = malloc_type_malloc(v6, 0x33CA86A1uLL);
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "readToBuffer:size:", v7, v6);
      if (!v8)
        break;
      v4 += v8;
      v9 = dispatch_data_create(v7, v8, 0, v5);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_2;
      block[3] = &unk_24D82A080;
      v10 = *(NSObject **)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      v25 = v4 == v3;
      v23 = v9;
      v24 = v11;
      v12 = v9;
      dispatch_async(v10, block);

      if (v4 >= v3)
        return;
    }
    free(v7);
    TSULogErrorInFunction();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_3;
    v19[3] = &unk_24D8297C8;
    v13 = &v21;
    v15 = *(NSObject **)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v20 = 0;
    v21 = v16;
    dispatch_async(v15, v19);

  }
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)close
{
  NSObject *readQueue;
  _QWORD block[5];

  readQueue = self->_readQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__TSPDataRepReadChannel_close__block_invoke;
  block[3] = &unk_24D829778;
  block[4] = self;
  dispatch_async(readQueue, block);
}

void __30__TSPDataRepReadChannel_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "close");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_representation, 0);
}

@end
