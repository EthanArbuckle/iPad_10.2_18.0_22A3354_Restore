@implementation TSUReadChannelInputStreamAdapter

- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3
{
  id v5;
  TSUReadChannelInputStreamAdapter *v6;
  TSUReadChannelInputStreamAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUReadChannelInputStreamAdapter;
  v6 = -[TSUReadChannelInputStreamAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readChannel, a3);
    objc_storeStrong((id *)&v7->_leftoverData, MEMORY[0x24BDAC990]);
  }

  return v7;
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
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD aBlock[5];
  NSObject *v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD applier[7];
  _QWORD v37[4];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = a3;
  leftoverData = self->_leftoverData;
  size = dispatch_data_get_size(leftoverData);
  v8 = MEMORY[0x24BDAC760];
  v9 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke;
    applier[3] = &unk_24F39C730;
    applier[5] = &v38;
    applier[6] = v37;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v39[3])
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

    v9 = v39[3];
  }
  if (v9 && self->_readChannel)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__17;
    v34 = __Block_byref_object_dispose__17;
    v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_3;
    aBlock[3] = &unk_24F39C780;
    v24 = &v38;
    v25 = v37;
    aBlock[4] = self;
    v26 = &v30;
    v27 = v28;
    v15 = dispatch_semaphore_create(0);
    v23 = v15;
    v16 = _Block_copy(aBlock);
    readChannel = self->_readChannel;
    if (readChannel)
    {
      -[TSUReadChannel readFromOffset:length:handler:](readChannel, "readFromOffset:length:handler:", self->_offset, v39[3], v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter readToBuffer:size:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUReadChannelInputStreamAdapter.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 105, 0, "nil read channels");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      dispatch_semaphore_signal(v15);
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (v31[5])
      objc_msgSend(MEMORY[0x24BDBCE88], "tsu_raiseWithError:");

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

    v9 = v39[3];
  }
  v20 = a4 - v9;
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v38, 8);
  return v20;
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
  *(_QWORD *)(a1[4] + 24) += v6;
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

void __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
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
  char v17;
  _QWORD v18[5];
  __int128 v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    if (v8)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2;
    v18[3] = &unk_24F39C758;
    v19 = *(_OWORD *)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 32);
    v20 = &v21;
    dispatch_data_apply(v7, v18);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      size = dispatch_data_get_size(v7);
      v11 = v22[3];
      if (size > v11)
      {
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        subrange = dispatch_data_create_subrange(v7, v11, size - v11);
        concat = dispatch_data_create_concat(v12, subrange);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 16);
        *(_QWORD *)(v15 + 16) = concat;

      }
    }
    _Block_object_dispose(&v21, 8);
  }
  v17 = a2 ^ 1;
  if (v9)
    v17 = 0;
  if ((v17 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

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
  *(_QWORD *)(a1[4] + 24) += v7;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v7 + a3;
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

- (void)close
{
  TSUReadChannel *readChannel;

  -[TSUReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (BOOL)canSeek
{
  return self->_readChannel != 0;
}

- (void)seekToOffset:(int64_t)a3
{
  void *v3;
  void *v4;

  if (self->_readChannel)
  {
    self->_offset = a3;
    objc_storeStrong((id *)&self->_leftoverData, MEMORY[0x24BDAC990]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter seekToOffset:]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUReadChannelInputStreamAdapter.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 137, 0, "Not a seekable stream");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
