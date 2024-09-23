@implementation TSUBufferedReadChannel

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 streamReadChannelBlock:(id)a4
{
  return -[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:](self, "initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:", a3, 0x200000, a4);
}

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 streamReadChannelBlock:(id)a5
{
  id v9;
  id v10;
  TSUBufferedReadChannel *v11;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *readSemaphore;
  dispatch_queue_t v14;
  OS_dispatch_queue *sourceReadQueue;
  void *v16;
  id streamReadChannelBlock;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v9 = a3;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)TSUBufferedReadChannel;
  v11 = -[TSUBufferedReadChannel init](&v28, sel_init);
  if (v11)
  {
    if (v9)
    {
      if (v10)
        goto LABEL_4;
    }
    else
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 60, CFSTR("invalid nil value for '%s'"), "sourceReadChannel");

      if (v10)
      {
LABEL_4:
        if (a4)
        {
LABEL_5:
          if (v9 && v10)
          {
            v12 = dispatch_semaphore_create(1);
            readSemaphore = v11->_readSemaphore;
            v11->_readSemaphore = (OS_dispatch_semaphore *)v12;

            objc_storeStrong((id *)&v11->_sourceReadChannel, a3);
            v11->_sourceReadBufferSize = a4;
            v14 = dispatch_queue_create("com.apple.iwork.TSUBufferedReadChannel.SourceRead", 0);
            sourceReadQueue = v11->_sourceReadQueue;
            v11->_sourceReadQueue = (OS_dispatch_queue *)v14;

            v16 = _Block_copy(v10);
            streamReadChannelBlock = v11->_streamReadChannelBlock;
            v11->_streamReadChannelBlock = v16;

            -[TSUBufferedReadChannel _resetStreamReadChannel](v11, "_resetStreamReadChannel");
            goto LABEL_12;
          }
LABEL_11:

          v11 = 0;
          goto LABEL_12;
        }
LABEL_10:
        +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 62, CFSTR("Buffer size too small: %zu"), 0);

        goto LABEL_11;
      }
    }
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 61, CFSTR("invalid nil value for '%s'"), "streamReadChannelBlock");

    if (a4)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_12:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUBufferedReadChannel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSUBufferedReadChannel;
  -[TSUBufferedReadChannel dealloc](&v3, sel_dealloc);
}

- (void)close
{
  TSUReadChannel *sourceReadChannel;
  OS_dispatch_queue *streamReadChannelSourceQueue;
  id streamReadChannelSourceHandler;

  -[TSUBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  -[TSUReadChannel close](self->_sourceReadChannel, "close");
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  streamReadChannelSourceQueue = self->_streamReadChannelSourceQueue;
  self->_streamReadChannelSourceQueue = 0;

  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

}

- (void)_closeStreamReadChannel
{
  TSUStreamReadChannel *streamReadChannel;

  -[TSUStreamReadChannel close](self->_streamReadChannel, "close");
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;

}

- (void)_resetStreamReadChannel
{
  OS_dispatch_data *currentStreamOutputData;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *streamReadChannelOutputQueue;
  OS_dispatch_queue *streamReadChannelSourceQueue;
  id streamReadChannelSourceHandler;
  void (**streamReadChannelBlock)(id, TSUBufferedReadChannelHelper *);
  TSUBufferedReadChannelHelper *v9;
  TSUStreamReadChannel *v10;
  TSUStreamReadChannel *streamReadChannel;
  TSUStreamReadChannel *v12;
  OS_dispatch_queue *v13;
  _QWORD v14[5];

  -[TSUBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  self->_sourceOffset = 0;
  self->_streamOutputOffset = 0;
  self->_streamOutputLength = 0;
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.TSUBufferedReadChannel.StreamOutput", 0);
  streamReadChannelOutputQueue = self->_streamReadChannelOutputQueue;
  self->_streamReadChannelOutputQueue = v4;

  streamReadChannelSourceQueue = self->_streamReadChannelSourceQueue;
  self->_streamReadChannelSourceQueue = 0;

  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, TSUBufferedReadChannelHelper *))self->_streamReadChannelBlock;
  v9 = -[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]([TSUBufferedReadChannelHelper alloc], "initWithBufferedReadChannel:", self);
  streamReadChannelBlock[2](streamReadChannelBlock, v9);
  v10 = (TSUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v10;

  v12 = self->_streamReadChannel;
  v13 = self->_streamReadChannelOutputQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__TSUBufferedReadChannel__resetStreamReadChannel__block_invoke;
  v14[3] = &unk_24D61B970;
  v14[4] = self;
  -[TSUStreamReadChannel readWithQueue:handler:](v12, "readWithQueue:handler:", v13, v14);
}

void __49__TSUBufferedReadChannel__resetStreamReadChannel__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_data_t concat;
  uint64_t v16;
  NSObject *v17;
  NSObject *data;

  data = a3;
  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v9 + 96))
  {
    if (v7)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _resetStreamReadChannel]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 129, CFSTR("Error reading from filter TSUStreamReadChannel: %@"), v8);

      a2 = 1;
    }
    else
    {
      if (!data)
        goto LABEL_5;
      *(_QWORD *)(v9 + 112) += dispatch_data_get_size(data);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(NSObject **)(v13 + 120);
      if (v14)
      {
        concat = dispatch_data_create_concat(v14, data);
        v16 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v16 + 120);
        *(_QWORD *)(v16 + 120) = concat;
      }
      else
      {
        v17 = data;
        v10 = *(void **)(v13 + 120);
        *(_QWORD *)(v13 + 120) = v17;
      }
    }

LABEL_5:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = a2;
  }

}

- (void)setStreamReadChannelSourceQueue:(id)a3 handler:(id)a4
{
  id v7;
  void *v8;
  id streamReadChannelSourceHandler;
  id v10;

  objc_storeStrong((id *)&self->_streamReadChannelSourceQueue, a3);
  v10 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);

  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = v8;

}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *readSemaphore;
  _QWORD v15[5];
  id v16;

  v10 = a6;
  v11 = v10;
  if (self->_sourceReadChannelError)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__TSUBufferedReadChannel_readFromOffset_length_queue_handler___block_invoke;
    v15[3] = &unk_24D61B4B0;
    v15[4] = self;
    v16 = v10;
    v12 = a5;
    dispatch_async(v12, v15);

    v13 = v16;
  }
  else
  {
    readSemaphore = self->_readSemaphore;
    v13 = a5;
    dispatch_semaphore_wait(readSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[TSUBufferedReadChannel _readFromOffset:length:queue:handler:](self, "_readFromOffset:length:queue:handler:", a3, a4, v13, v11);
  }

}

uint64_t __62__TSUBufferedReadChannel_readFromOffset_length_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  size_t size;
  OS_dispatch_data *currentStreamOutputData;
  uint64_t v19;
  TSUReadChannel *sourceReadChannel;
  unint64_t sourceReadBufferSize;
  int64_t sourceOffset;
  OS_dispatch_queue *sourceReadQueue;
  _QWORD v24[5];
  NSObject *v25;
  id v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  _QWORD v30[4];
  _QWORD block[4];
  NSObject *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38[16];

  v10 = a5;
  v11 = a6;
  v12 = (a3 & (a3 >> 63)) + a4;
  v13 = a3 & ~(a3 >> 63);
  if (v13 < self->_streamOutputOffset)
    -[TSUBufferedReadChannel _resetStreamReadChannel](self, "_resetStreamReadChannel");
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38[0] = 0;
  -[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:](self, "_currentDataIntersectionWithOffset:length:isReadDone:", v13, v12, v38);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x24BDAC760];
  if (v14)
  {
    size = dispatch_data_get_size(v14);
    v13 += size;
    v12 -= size;
  }
  else if (!*((_BYTE *)v36 + 24))
  {
LABEL_8:
    currentStreamOutputData = self->_currentStreamOutputData;
    self->_currentStreamOutputData = 0;

    self->_streamOutputOffset += self->_streamOutputLength;
    self->_streamOutputLength = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v19 = v16;
    sourceReadChannel = self->_sourceReadChannel;
    sourceReadBufferSize = self->_sourceReadBufferSize;
    sourceReadQueue = self->_sourceReadQueue;
    sourceOffset = self->_sourceOffset;
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_2;
    v24[3] = &unk_24D61BBE0;
    v24[4] = self;
    v25 = v10;
    v26 = v11;
    v27 = v30;
    v28 = v13;
    v29 = v12;
    -[TSUReadChannel readFromOffset:length:queue:handler:](sourceReadChannel, "readFromOffset:length:queue:handler:", sourceOffset, sourceReadBufferSize, sourceReadQueue, v24);

    _Block_object_dispose(v30, 8);
    goto LABEL_9;
  }
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke;
  block[3] = &unk_24D61BB68;
  v33 = v11;
  v34 = &v35;
  v32 = v15;
  dispatch_async(v10, block);

  if (!*((_BYTE *)v36 + 24))
    goto LABEL_8;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_readSemaphore);
LABEL_9:

  _Block_object_dispose(&v35, 8);
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), a1[4], 0);
}

void __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  size_t size;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  _QWORD v29[5];
  NSObject *v30;
  BOOL v31;
  _QWORD block[4];
  id v33;
  id v34;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    goto LABEL_18;
  if (v8)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _readFromOffset:length:queue:handler:]_block_invoke_2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 211, CFSTR("Error reading from source TSUReadChannel: %@"), v9);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_3;
    block[3] = &unk_24D61B4B0;
    v13 = *(NSObject **)(a1 + 40);
    v34 = *(id *)(a1 + 48);
    v33 = v9;
    dispatch_async(v13, block);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a4);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));

    v14 = v34;
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
    size = dispatch_data_get_size(v7);
  else
    size = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += size;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _readFromOffset:length:queue:handler:]_block_invoke_2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 221, CFSTR("Received more data than requested: %zu instead of %zu"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  }
  if (a2)
  {
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    if (v7)
      goto LABEL_14;
LABEL_13:
    if (!v19)
      goto LABEL_15;
    goto LABEL_14;
  }
  v19 = 0;
  if (!v7)
    goto LABEL_13;
LABEL_14:
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 72);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_4;
  v29[3] = &unk_24D61BB90;
  v29[4] = v20;
  v31 = v19;
  v30 = v7;
  dispatch_async(v21, v29);

LABEL_15:
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v25[0] = MEMORY[0x24BDAC760];
    v25[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_5;
    v25[3] = &unk_24D61BBB8;
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v24 = *(NSObject **)(v22 + 72);
    v25[1] = 3221225472;
    v25[4] = v22;
    v28 = *(_OWORD *)(a1 + 64);
    v26 = v23;
    v27 = *(id *)(a1 + 48);
    dispatch_async(v24, v25);

    v14 = v26;
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

void __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;
  __int128 v8;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_6;
  block[3] = &unk_24D61BBB8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 88);
  block[1] = 3221225472;
  block[4] = v2;
  v8 = *(_OWORD *)(a1 + 56);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readFromOffset:length:queue:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  unint64_t v8;
  int64_t streamOutputOffset;
  unint64_t streamOutputLength;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  dispatch_data_t subrange;
  BOOL v19;

  if (__CFADD__(a3, a4))
    v8 = -1;
  else
    v8 = a3 + a4;
  streamOutputOffset = self->_streamOutputOffset;
  streamOutputLength = self->_streamOutputLength;
  if (streamOutputLength >= ~streamOutputOffset)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 258, CFSTR("Overflow in the output stream: data offset %lli data length %zu"), self->_streamOutputOffset, self->_streamOutputLength);

    streamOutputOffset = self->_streamOutputOffset;
    streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3)
    v14 = a3;
  else
    v14 = streamOutputOffset;
  v15 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset)
    v16 = streamOutputLength + streamOutputOffset;
  else
    v16 = v8;
  if (v16 <= v14)
  {
    subrange = 0;
    if (!a5)
      return subrange;
  }
  else
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v14 - streamOutputOffset, v16 - v14);
    if (!a5)
      return subrange;
  }
  v19 = v8 <= v15 || self->_isStreamOutputDone;
  *a5 = v19;
  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
  -[TSUReadChannel setLowWater:](self->_sourceReadChannel, "setLowWater:", a3);
}

- (void)addBarrier:(id)a3
{
  -[TSUReadChannel addBarrier:](self->_sourceReadChannel, "addBarrier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong((id *)&self->_streamReadChannelOutputQueue, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannelSourceQueue, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadQueue, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readSemaphore, 0);
}

@end
