@implementation TSPCryptoTranscodeReadChannel

- (TSPCryptoTranscodeReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4 encryptionKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  TSPCryptoTranscodeReadChannel *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *readQueue;
  TSPCryptoReadChannel *v14;
  TSUStreamReadChannel *readChannel;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSPCryptoTranscodeReadChannel;
  v11 = -[TSPCryptoTranscodeReadChannel init](&v17, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("TSPCryptoTranscodeReadChannel.Read", 0);
    readQueue = v11->_readQueue;
    v11->_readQueue = (OS_dispatch_queue *)v12;

    if (v9)
      v14 = -[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]([TSPCryptoReadChannel alloc], "initWithReadChannel:decryptionKey:", v8, v9);
    else
      v14 = (TSPCryptoReadChannel *)v8;
    readChannel = v11->_readChannel;
    v11->_readChannel = (TSUStreamReadChannel *)v14;

    objc_storeStrong((id *)&v11->_encryptionKey, a5);
    if (!v11->_readChannel)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  TSPIOHandlerWriteChannelAdapter *v8;
  TSPCryptoComponentWriteChannel *v9;
  TSUStreamReadChannel *readChannel;
  OS_dispatch_queue *readQueue;
  TSPIOHandlerWriteChannelAdapter *v12;
  TSPCryptoComponentWriteChannel *v13;
  TSUStreamReadChannel *v14;
  OS_dispatch_queue *v15;
  _QWORD v16[4];
  TSPIOHandlerWriteChannelAdapter *v17;
  id v18;
  _QWORD v19[4];
  TSPIOHandlerWriteChannelAdapter *v20;
  TSPCryptoComponentWriteChannel *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v6 = a3;
  v7 = a4;
  if (self->_encryptionKey)
  {
    v8 = -[TSPIOHandlerWriteChannelAdapter initWithQueue:handler:]([TSPIOHandlerWriteChannelAdapter alloc], "initWithQueue:handler:", v6, v7);
    v9 = -[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]([TSPCryptoComponentWriteChannel alloc], "initWithWriteChannel:encryptionKey:", v8, self->_encryptionKey);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    readChannel = self->_readChannel;
    readQueue = self->_readQueue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke;
    v19[3] = &unk_24D829FB8;
    v22 = v23;
    v12 = v8;
    v20 = v12;
    v21 = v9;
    v13 = v9;
    -[TSUStreamReadChannel readWithQueue:handler:](readChannel, "readWithQueue:handler:", readQueue, v19);

    _Block_object_dispose(v23, 8);
  }
  else
  {
    v14 = self->_readChannel;
    v15 = self->_readQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_2;
    v16[3] = &unk_24D82A338;
    v17 = (TSPIOHandlerWriteChannelAdapter *)v6;
    v18 = v7;
    -[TSUStreamReadChannel readWithQueue:handler:](v14, "readWithQueue:handler:", v15, v16);

    v12 = v17;
  }

}

void __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  int v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v9 && !v8)
    objc_msgSend(*(id *)(a1 + 40), "writeData:", v9);
  if (a2)
    objc_msgSend(*(id *)(a1 + 40), "close");

}

void __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_3;
  v13[3] = &unk_24D82A310;
  v9 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v17 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)close
{
  TSUStreamReadChannel *readChannel;

  -[TSUStreamReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
