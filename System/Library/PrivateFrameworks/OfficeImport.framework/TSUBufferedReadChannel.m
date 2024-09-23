@implementation TSUBufferedReadChannel

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return -[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:](self, "initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:", a3, 0x200000, a4, a5);
}

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  uint64_t v17;
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

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TSUBufferedReadChannel;
  v14 = -[TSUBufferedReadChannel init](&v28, sel_init);
  if (v14)
  {
    if (v11)
    {
      if (v13)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 60, 0, "invalid nil value for '%{public}s'", "sourceReadChannel");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      if (v13)
      {
LABEL_4:
        if (a4)
        {
LABEL_5:
          if (v11 && v13)
          {
            v15 = dispatch_queue_create("TSUBufferedReadChannel.Read", 0);
            v16 = (void *)*((_QWORD *)v14 + 1);
            *((_QWORD *)v14 + 1) = v15;

            dispatch_queue_set_specific(*((dispatch_queue_t *)v14 + 1), (const void *)TSUBufferedReadChannelReadQueueSpecific, (void *)TSUBufferedReadChannelReadQueueSpecific, 0);
            objc_storeStrong((id *)v14 + 2, a3);
            *((_QWORD *)v14 + 3) = a4;
            *((_QWORD *)v14 + 4) = 0x7FFFFFFFFFFFFFFFLL;
            v17 = objc_msgSend(v12, "copy");
            v18 = (void *)*((_QWORD *)v14 + 7);
            *((_QWORD *)v14 + 7) = v17;

            v19 = _Block_copy(v13);
            v20 = (void *)*((_QWORD *)v14 + 8);
            *((_QWORD *)v14 + 8) = v19;

            *((_QWORD *)v14 + 12) = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_12;
          }
LABEL_11:

          v14 = 0;
          goto LABEL_12;
        }
LABEL_10:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 62, 0, "Buffer size too small: %zu", 0);

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 61, 0, "invalid nil value for '%{public}s'", "streamReadChannelBlock");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (a4)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_12:

  return (TSUBufferedReadChannel *)v14;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUBufferedReadChannel _close](self, "_close");
  v3.receiver = self;
  v3.super_class = (Class)TSUBufferedReadChannel;
  -[TSUBufferedReadChannel dealloc](&v3, sel_dealloc);
}

- (void)close
{
  void *v3;
  NSObject *readQueue;
  _QWORD block[5];

  v3 = (void *)TSUBufferedReadChannelReadQueueSpecific;
  if (dispatch_get_specific((const void *)TSUBufferedReadChannelReadQueueSpecific) == v3)
  {
    -[TSUBufferedReadChannel _close](self, "_close");
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__TSUBufferedReadChannel_close__block_invoke;
    block[3] = &unk_24F39B528;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

uint64_t __31__TSUBufferedReadChannel_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)_close
{
  TSUReadChannel *sourceReadChannel;
  id streamReadChannelSourceHandler;

  -[TSUBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  -[TSUReadChannel close](self->_sourceReadChannel, "close");
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

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

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5;
  int64_t streamOutputOffset;
  unint64_t streamOutputOutstandingLength;
  unint64_t v9;
  NSUInteger v11;
  NSUInteger v12;
  NSArray *v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  OS_dispatch_data *currentStreamOutputData;
  id streamReadChannelSourceHandler;
  void (**streamReadChannelBlock)(id, TSUBufferedReadChannelHelper *, void *);
  TSUBufferedReadChannelHelper *v29;
  TSUStreamReadChannel *v30;
  TSUStreamReadChannel *streamReadChannel;
  TSUStreamReadChannel *v32;
  NSArray *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v5 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3)
      return;
  }
  -[TSUBufferedReadChannel _closeStreamReadChannel](self, "_closeStreamReadChannel");
  *(_OWORD *)&self->_sourceOffset = xmmword_22A4BD4B0;
  *(_OWORD *)&self->_streamOutputOffset = xmmword_22A4BD4B0;
  self->_streamOutputLength = 0;
  v11 = -[NSArray count](self->_blockInfos, "count");
  if (!v11)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v12 = v11;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = self->_blockInfos;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v36)
  {
    v16 = 0;
    goto LABEL_28;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v35 = *(_QWORD *)v39;
  v33 = v13;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v39 != v35)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
      v14 += objc_msgSend(v18, "decodedLength");
      if (v15)
      {
        objc_msgSend(v16, "addObject:", v18);
        self->_sourceLength += objc_msgSend(v18, "encodedLength");
        v15 += objc_msgSend(v18, "decodedLength");
        v19 = self->_streamOutputOutstandingLength + objc_msgSend(v18, "decodedLength");
      }
      else
      {
        if (v14 <= v5)
        {
          self->_sourceOffset += objc_msgSend(v18, "encodedLength");
          v15 = 0;
          self->_streamOutputOffset += objc_msgSend(v18, "decodedLength");
          goto LABEL_19;
        }
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]");
          v34 = v16;
          v20 = v5;
          v21 = a4;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 138, 0, "expected nil value for '%{public}s'", "blockInfos");

          a4 = v21;
          v5 = v20;
          v16 = v34;
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        }
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v12);

        objc_msgSend(v24, "addObject:", v18);
        self->_sourceLength = objc_msgSend(v18, "encodedLength");
        v15 = objc_msgSend(v18, "decodedLength");
        v19 = objc_msgSend(v18, "decodedLength");
        v16 = v24;
        v13 = v33;
      }
      self->_streamOutputOutstandingLength = v19;
      if (v15 > a4)
        goto LABEL_28;
LABEL_19:
      if (!--v12)
      {
        self->_sourceLength = -1;
        self->_streamOutputOutstandingLength = -1;
      }
      ++v17;
    }
    while (v36 != v17);
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    v36 = v25;
  }
  while (v25);
LABEL_28:

LABEL_29:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, TSUBufferedReadChannelHelper *, void *))self->_streamReadChannelBlock;
  v29 = -[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]([TSUBufferedReadChannelHelper alloc], "initWithBufferedReadChannel:", self);
  streamReadChannelBlock[2](streamReadChannelBlock, v29, v16);
  v30 = (TSUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v30;

  v32 = self->_streamReadChannel;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __74__TSUBufferedReadChannel__resetStreamReadChannelIfNeededForOffset_length___block_invoke;
  v37[3] = &unk_24F39BEA0;
  v37[4] = self;
  -[TSUStreamReadChannel readWithHandler:](v32, "readWithHandler:", v37);

}

void __74__TSUBufferedReadChannel__resetStreamReadChannelIfNeededForOffset_length___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_data_t concat;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *data;

  data = a3;
  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v9 + 88))
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "code");
      objc_msgSend(v8, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 185, 0, "Error reading from filter TSUStreamReadChannel: %zd %{public}@ %@", v12, v13, v8);

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      a2 = 1;
    }
    else if (data)
    {
      *(_QWORD *)(v9 + 112) += dispatch_data_get_size(data);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(NSObject **)(v14 + 120);
      if (v15)
      {
        concat = dispatch_data_create_concat(v15, data);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 120);
        *(_QWORD *)(v17 + 120) = concat;
      }
      else
      {
        v19 = data;
        v18 = *(void **)(v14 + 120);
        *(_QWORD *)(v14 + 120) = v19;
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = a2;
  }

}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  void *v4;
  id streamReadChannelSourceHandler;

  v4 = _Block_copy(a3);
  streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_streamReadChannelSourceHandler = v4;

}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *readQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__TSUBufferedReadChannel_readFromOffset_length_handler___block_invoke;
  v11[3] = &unk_24F39BEC8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(readQueue, v11);

}

uint64_t __56__TSUBufferedReadChannel_readFromOffset_length_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_suspend(*(dispatch_object_t *)(v2 + 8));
  return objc_msgSend(*(id *)(a1 + 32), "_readFromOffset:length:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)readWithHandler:(id)a3
{
  -[TSUBufferedReadChannel readFromOffset:length:handler:](self, "readFromOffset:length:handler:", 0, -1, a3);
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  void (**v8)(id, _BOOL8, void *, _QWORD);
  unint64_t v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  size_t size;
  _BOOL8 v14;
  OS_dispatch_data *currentStreamOutputData;
  unint64_t streamOutputLength;
  unint64_t streamOutputOutstandingLength;
  TSUReadChannel *sourceReadChannel;
  int64_t sourceOffset;
  unint64_t sourceReadBufferSize;
  _QWORD v21[5];
  void (**v22)(id, _BOOL8, void *, _QWORD);
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  _QWORD v27[4];
  char v28;

  v8 = (void (**)(id, _BOOL8, void *, _QWORD))a5;
  v9 = (a3 & (a3 >> 63)) + a4;
  v10 = a3 & ~(a3 >> 63);
  -[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:](self, "_resetStreamReadChannelIfNeededForOffset:length:", v10, v9);
  v28 = 0;
  -[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:](self, "_currentDataIntersectionWithOffset:length:isReadDone:", v10, v9, &v28);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    size = dispatch_data_get_size(v11);
    v10 += size;
    v9 -= size;
    v14 = v28 != 0;
  }
  else
  {
    if (!v28)
      goto LABEL_7;
    v14 = 1;
  }
  v8[2](v8, v14, v12, 0);
  if (v28)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_13;
  }
LABEL_7:
  -[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:](self, "_resetStreamReadChannelIfNeededForOffset:length:", v10, v9);
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1)
    self->_streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  self->_streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize)
    sourceReadBufferSize = self->_sourceReadBufferSize;
  else
    sourceReadBufferSize = self->_sourceLength;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __57__TSUBufferedReadChannel__readFromOffset_length_handler___block_invoke;
  v21[3] = &unk_24F39BEF0;
  v21[4] = self;
  v22 = v8;
  v23 = v27;
  v24 = sourceReadBufferSize;
  v25 = v10;
  v26 = v9;
  -[TSUReadChannel readFromOffset:length:handler:](sourceReadChannel, "readFromOffset:length:handler:", sourceOffset, sourceReadBufferSize, v21);

  _Block_object_dispose(v27, 8);
LABEL_13:

}

void __57__TSUBufferedReadChannel__readFromOffset_length_handler___block_invoke(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  size_t size;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  NSObject *data;

  data = a3;
  v7 = a4;
  v8 = v7;
  v9 = a1[4];
  if (*(_QWORD *)(v9 + 48))
    goto LABEL_22;
  if (!*(_QWORD *)(v9 + 80))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 264, 0, "The source handler for the stream read channel should not be nil");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_4;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "code");
    objc_msgSend(v8, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 272, 0, "Error reading from source TSUReadChannel: %zd %{public}@ %@", v18, v19, v8);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    (*(void (**)(void))(a1[5] + 16))();
    objc_storeStrong((id *)(a1[4] + 48), v8);
    dispatch_resume(*(dispatch_object_t *)(a1[4] + 8));
    goto LABEL_22;
  }
  if (v7)
    goto LABEL_12;
LABEL_4:
  size = (size_t)data;
  if (data)
    size = dispatch_data_get_size(data);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += size;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) > a1[7])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 281, 0, "Received more data than requested: %zu instead of %zu", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a1[7]);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (a2)
    v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) < a1[7];
  else
    v13 = 0;
  if (data || v13)
    (*(void (**)(void))(*(_QWORD *)(a1[4] + 80) + 16))();
  if (a2)
  {
    *(_QWORD *)(a1[4] + 32) += *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v20 = (_QWORD *)a1[4];
    v21 = v20[5];
    if (v21 != -1)
    {
      v20[5] = v21 - *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v20 = (_QWORD *)a1[4];
    }
    objc_msgSend(v20, "_readFromOffset:length:handler:", a1[8], a1[9], a1[5]);
  }
  v8 = 0;
LABEL_22:

}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  unint64_t v8;
  int64_t streamOutputOffset;
  unint64_t streamOutputLength;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  dispatch_data_t subrange;
  BOOL v18;

  if (__CFADD__(a3, a4))
    v8 = -1;
  else
    v8 = a3 + a4;
  streamOutputOffset = self->_streamOutputOffset;
  streamOutputLength = self->_streamOutputLength;
  if (streamOutputLength >= ~streamOutputOffset)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 312, 0, "Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    streamOutputOffset = self->_streamOutputOffset;
    streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3)
    v13 = a3;
  else
    v13 = streamOutputOffset;
  v14 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset)
    v15 = streamOutputLength + streamOutputOffset;
  else
    v15 = v8;
  if (v15 <= v13)
  {
    subrange = 0;
    if (!a5)
      return subrange;
  }
  else
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v13 - streamOutputOffset, v15 - v13);
    if (!a5)
      return subrange;
  }
  v18 = self->_isStreamOutputDone || v8 <= v14;
  *a5 = v18;
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

- (BOOL)isValid
{
  return -[TSUReadChannel isValid](self->_sourceReadChannel, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end
