@implementation TSPDatabaseInputStream

- (TSPDatabaseInputStream)initWithBlob:(sqlite3_blob *)a3
{
  TSPDatabaseInputStream *v4;
  TSPDatabaseInputStream *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSPDatabaseInputStream;
  v4 = -[TSPDatabaseInputStream init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_blob = a3;
    v4->_length = sqlite3_blob_bytes(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSPDatabaseInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSPDatabaseInputStream;
  -[TSPDatabaseInputStream dealloc](&v3, sel_dealloc);
}

- (void)close
{
  sqlite3_blob *blob;

  blob = self->_blob;
  if (blob)
  {
    sqlite3_blob_close(blob);
    self->_blob = 0;
  }
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t length;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  dispatch_data_t v14;
  NSObject *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD block[4];
  dispatch_data_t v20;
  id v21;
  unint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  length = self->_length;
  if ((_DWORD)length)
  {
    v9 = 0;
    v10 = (void *)*MEMORY[0x24BDAC980];
    while (1)
    {
      v11 = length >= 0x2000 ? 0x2000 : length;
      v12 = malloc_type_malloc(v11, 0xE5D21517uLL);
      if (!v12)
        break;
      v13 = v12;
      if (sqlite3_blob_read(self->_blob, v12, v11, v9))
      {
        free(v13);
        break;
      }
      v9 += v11;
      length -= v11;
      v14 = dispatch_data_create(v13, v11, v6, v10);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_2;
      block[3] = &unk_24D82A0F8;
      v21 = v7;
      v22 = length;
      v20 = v14;
      v15 = v14;
      dispatch_sync(v6, block);

      if (!length)
        goto LABEL_14;
    }
    v18 = MEMORY[0x24BDAC760];
    v16 = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_3;
    v17 = &v18;
  }
  else
  {
    v23 = MEMORY[0x24BDAC760];
    v16 = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke;
    v17 = &v23;
  }
  v17[1] = 3221225472;
  v17[2] = (uint64_t)v16;
  v17[3] = (uint64_t)&unk_24D82A0D0;
  v17[4] = (uint64_t)v7;
  dispatch_async(v6, v17);

LABEL_14:
}

uint64_t __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6] == 0, a1[4], 0);
}

void __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsp_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v1 + 16))(v1, 1, MEMORY[0x24BDAC990], v2);

}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int v6;
  void *v8;
  void *v9;
  void *v10;

  if (a4 >> 31)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDatabaseInputStream readToBuffer:size:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDatabaseInputStream.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 97, CFSTR("Out-of-bounds type assignment was clamped to max"));

    LODWORD(a4) = 0x7FFFFFFF;
  }
  if ((int)a4 >= self->_length - self->_offset)
    v6 = self->_length - self->_offset;
  else
    v6 = a4;
  if (sqlite3_blob_read(self->_blob, a3, v6, self->_offset))
    return 0;
  self->_offset += v6;
  return v6;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (a3 > 0x7FFFFFFF || self->_length < a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDatabaseInputStream seekToOffset:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDatabaseInputStream.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 124, CFSTR("Requested seek to offset past end of stream"));

    LODWORD(a3) = self->_length;
  }
  self->_offset = a3;
}

- (id)closeLocalStream
{
  return 0;
}

@end
