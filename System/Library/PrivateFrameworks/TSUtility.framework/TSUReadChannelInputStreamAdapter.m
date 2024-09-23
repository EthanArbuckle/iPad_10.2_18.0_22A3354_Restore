@implementation TSUReadChannelInputStreamAdapter

- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3
{
  TSUReadChannelInputStreamAdapter *v3;
  TSUReadChannelInputStreamAdapter *v4;
  TSUReadChannelInputStreamAdapter *v5;

  v3 = self;
  if (a3)
  {
    v3 = -[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:](self, "_initWithReadChannel:streamReadChannel:", a3, 0);
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (TSUReadChannelInputStreamAdapter)initWithStreamReadChannel:(id)a3
{
  TSUReadChannelInputStreamAdapter *v3;
  TSUReadChannelInputStreamAdapter *v4;
  TSUReadChannelInputStreamAdapter *v5;

  v3 = self;
  if (a3)
  {
    v3 = -[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:](self, "_initWithReadChannel:streamReadChannel:", 0, a3);
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)_initWithReadChannel:(id)a3 streamReadChannel:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TSUReadChannelInputStreamAdapter *v16;
  TSUReadChannelInputStreamAdapter *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *readQueue;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 33, CFSTR("Can't have both a TSUReadChannel and a TSUStreamReadChannel be provided"));

    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 35, CFSTR("Can't have both a TSUReadChannel and a TSUStreamReadChannel be provided"));

  }
  v21.receiver = self;
  v21.super_class = (Class)TSUReadChannelInputStreamAdapter;
  v16 = -[TSUReadChannelInputStreamAdapter init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_streamReadChannel, a4);
    objc_storeStrong((id *)&v17->_readChannel, a3);
    v18 = dispatch_queue_create("TSUReadChannelInputStreamAdapter.Read", 0);
    readQueue = v17->_readQueue;
    v17->_readQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_leftoverData, MEMORY[0x24BDAC990]);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUReadChannelInputStreamAdapter close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSUReadChannelInputStreamAdapter;
  -[TSUReadChannelInputStreamAdapter dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  NSObject *leftoverData;
  size_t size;
  uint64_t v8;
  unint64_t v9;
  OS_dispatch_data *subrange;
  id v11;
  NSObject *v12;
  size_t v13;
  OS_dispatch_data *v14;
  NSObject *v15;
  void *v16;
  TSUReadChannel *readChannel;
  TSUStreamReadChannel *streamReadChannel;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int, void *, void *);
  void *v27;
  TSUReadChannelInputStreamAdapter *v28;
  NSObject *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD applier[7];
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = a3;
  leftoverData = self->_leftoverData;
  size = dispatch_data_get_size(leftoverData);
  v8 = MEMORY[0x24BDAC760];
  v9 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke;
    applier[3] = &unk_24D61BAF0;
    applier[5] = &v41;
    applier[6] = v40;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v42[3])
    {
      subrange = (OS_dispatch_data *)MEMORY[0x24BDAC990];
      v11 = MEMORY[0x24BDAC990];
    }
    else
    {
      v12 = self->_leftoverData;
      v13 = dispatch_data_get_size(v12);
      subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v12, a4, v13 - a4);
    }
    v14 = self->_leftoverData;
    self->_leftoverData = subrange;

    v9 = v42[3];
  }
  if (v9 && self->_readChannel)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__5;
    v38 = 0;
    v24 = v8;
    v25 = 3221225472;
    v26 = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_7;
    v27 = &unk_24D61BB40;
    v30 = &v41;
    v31 = v40;
    v28 = self;
    v32 = &v33;
    v15 = dispatch_semaphore_create(0);
    v29 = v15;
    v16 = _Block_copy(&v24);
    readChannel = self->_readChannel;
    if (readChannel)
    {
      -[TSUReadChannel readFromOffset:length:queue:handler:](readChannel, "readFromOffset:length:queue:handler:", self->_offset, v42[3], self->_readQueue, v16, v24, v25, v26, v27, v28);
    }
    else
    {
      streamReadChannel = self->_streamReadChannel;
      if (streamReadChannel)
      {
        -[TSUStreamReadChannel readWithQueue:handler:](streamReadChannel, "readWithQueue:handler:", self->_readQueue, v16, v24, v25, v26, v27, v28);
      }
      else
      {
        +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v24, v25, v26, v27, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter readToBuffer:size:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v21, 141, CFSTR("nil read channels"));

        dispatch_semaphore_signal(v15);
      }
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (v34[5])
      objc_msgSend(MEMORY[0x24BDBCE88], "tsu_raiseWithError:");

    _Block_object_dispose(&v33, 8);
    v9 = v42[3];
  }
  v22 = a4 - v9;
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
  return v22;
}

BOOL __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke(_QWORD *a1, int a2, int a3, void *__src, size_t a5)
{
  size_t v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a5)
    v6 = a5;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  memcpy(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), __src, v6);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v6;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v6;
  *(_QWORD *)(a1[4] + 40) += v6;
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

void __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_7(uint64_t a1, int a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  void *v9;
  size_t size;
  size_t v11;
  NSObject *v12;
  NSObject *subrange;
  dispatch_data_t concat;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
LABEL_11:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_12;
    }
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2;
    v17[3] = &unk_24D61BB18;
    v18 = *(_OWORD *)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 32);
    v19 = &v20;
    dispatch_data_apply(v7, v17);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      size = dispatch_data_get_size(v7);
      v11 = v21[3];
      if (size > v11)
      {
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        subrange = dispatch_data_create_subrange(v7, v11, size - v11);
        concat = dispatch_data_create_concat(v12, subrange);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 24);
        *(_QWORD *)(v15 + 24) = concat;

      }
    }
    _Block_object_dispose(&v20, 8);
  }
  if (v9 || a2)
    goto LABEL_11;
LABEL_12:

}

BOOL __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2(_QWORD *a1, int a2, uint64_t a3, void *__src, size_t a5)
{
  size_t v7;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a5)
    v7 = a5;
  else
    v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  memcpy(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), __src, v7);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v7;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v7;
  *(_QWORD *)(a1[4] + 40) += v7;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v7 + a3;
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

- (void)close
{
  TSUReadChannel *readChannel;
  TSUStreamReadChannel *streamReadChannel;

  -[TSUReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

  -[TSUStreamReadChannel close](self->_streamReadChannel, "close");
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;

}

- (BOOL)canSeek
{
  return self->_readChannel != 0;
}

- (void)seekToOffset:(int64_t)a3
{
  OS_dispatch_data *v4;
  id v5;
  OS_dispatch_data *leftoverData;
  void *v7;
  void *v8;
  id v9;

  if (self->_readChannel)
  {
    self->_offset = a3;
    v4 = (OS_dispatch_data *)MEMORY[0x24BDAC990];
    v5 = MEMORY[0x24BDAC990];
    leftoverData = self->_leftoverData;
    self->_leftoverData = v4;
  }
  else
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter seekToOffset:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 183, CFSTR("Not a seekable stream"));

    leftoverData = (OS_dispatch_data *)v9;
  }

}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
