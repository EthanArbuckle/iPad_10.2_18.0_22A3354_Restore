@implementation TSUZipReadChannel

- (TSUZipReadChannel)initWithEntry:(id)a3 archiveReadChannel:(id)a4
{
  id v7;
  id v8;
  TSUZipReadChannel *v9;
  TSUZipReadChannel *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *readQueue;
  TSUZipReadChannel *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSUZipReadChannel;
  v9 = -[TSUZipReadChannel init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entry, a3);
    objc_storeStrong((id *)&v10->_archiveReadChannel, a4);
    v11 = dispatch_queue_create("TSUZipReadChannel.Read", 0);
    readQueue = v10->_readQueue;
    v10->_readQueue = (OS_dispatch_queue *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  TSUReadChannel *archiveReadChannel;
  unint64_t v15;
  unint64_t v16;
  OS_dispatch_queue *readQueue;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v29[3];
  int v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;
  _QWORD v35[3];
  char v36;

  v6 = a3;
  v7 = a4;
  if (self->_archiveReadChannel)
  {
    if (-[TSUZipEntry compressedSize](self->_entry, "compressedSize") >= 0xFFFFFFFF)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel readWithQueue:handler:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 51, CFSTR("No support for Zip 64"));

    }
    v11 = -[TSUZipEntry nameLength](self->_entry, "nameLength");
    v12 = -[TSUZipEntry extraFieldLength](self->_entry, "extraFieldLength");
    v13 = -[TSUZipEntry compressedSize](self->_entry, "compressedSize");
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 1;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v30 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    v15 = -[TSUZipEntry offset](self->_entry, "offset");
    v16 = v11 + (unint64_t)v12 + 30;
    readQueue = self->_readQueue;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __43__TSUZipReadChannel_readWithQueue_handler___block_invoke;
    v21[3] = &unk_24D61B810;
    v24 = v31;
    v21[4] = self;
    v22 = v6;
    v23 = v7;
    v25 = v35;
    v26 = v33;
    v27 = v29;
    v28 = v16;
    -[TSUReadChannel readFromOffset:length:queue:handler:](archiveReadChannel, "readFromOffset:length:queue:handler:", v15, v16 + v13, readQueue, v21);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel readWithQueue:handler:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 45, CFSTR("Already closed"));

    -[TSUZipReadChannel handleFailureWithQueue:handler:error:](self, "handleFailureWithQueue:handler:error:", v6, v7, 0);
  }

}

void __43__TSUZipReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  size_t v12;
  size_t size;
  size_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_data_t subrange;
  size_t v21;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithQueue:handler:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v11 + 24))
      goto LABEL_19;
    *(_BYTE *)(v11 + 24) = 1;
    v21 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "readFileHeaderFromData:headerLength:", v7, &v21);
    v12 = v21;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v21 != *(_QWORD *)(a1 + 88);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "readWithHeaderLength:queue:handler:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      else
      {
        size = dispatch_data_get_size(v7);
        v14 = size - v12;
        if (size >= v12)
        {
          subrange = dispatch_data_create_subrange(v7, v12, v14);

          v7 = subrange;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "name", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readWithQueue:handler:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 100, (uint64_t)CFSTR("Read was less than file header size for entry %@"), v16, v17, v18, v19, (uint64_t)v15);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      || (objc_msgSend(*(id *)(a1 + 32), "handleFailureWithQueue:handler:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)))
    {
LABEL_19:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "processData:CRC:isDone:queue:handler:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }

}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  NSObject *subrange;
  dispatch_data_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t size_ptr;
  void *buffer_ptr;

  if (dispatch_data_get_size((dispatch_data_t)a3) > 0x1D)
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 0x1EuLL);
    size_ptr = 0;
    buffer_ptr = 0;
    v14 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &size_ptr);
    v15 = (char *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      v16 = *(_DWORD *)((char *)buffer_ptr + 14);
      if (v16 == -[TSUZipEntry CRC](self->_entry, "CRC"))
      {
        v17 = *(unsigned int *)(v15 + 18);
        if (-[TSUZipEntry compressedSize](self->_entry, "compressedSize") == v17)
        {
          v18 = *(unsigned int *)(v15 + 22);
          if (-[TSUZipEntry size](self->_entry, "size") == v18)
          {
            *a4 = *((unsigned __int16 *)v15 + 13) + (unint64_t)*((unsigned __int16 *)v15 + 14) + 30;
            v12 = 1;
LABEL_11:

            return v12;
          }
        }
      }
      -[TSUZipEntry name](self->_entry, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 153, (uint64_t)CFSTR("Local file header doesn't match central directory file header for entry %@"), v24, v25, v26, v27, (uint64_t)v19);
    }
    else
    {
      -[TSUZipEntry name](self->_entry, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 147, (uint64_t)CFSTR("Local file header has bad signature for entry %@"), v20, v21, v22, v23, (uint64_t)v19);
    }

    v12 = 0;
    goto LABEL_11;
  }
  -[TSUZipEntry name](self->_entry, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 124, (uint64_t)CFSTR("Read was less than record size for entry %@"), v8, v9, v10, v11, (uint64_t)v7);

  return 0;
}

- (void)readWithHeaderLength:(unint64_t)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TSUReadChannel *archiveReadChannel;
  unint64_t v17;
  uint64_t v18;
  OS_dispatch_queue *readQueue;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[3];
  int v28;
  _QWORD v29[3];
  char v30;

  v8 = a4;
  v9 = a5;
  if (!self->_archiveReadChannel)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel readWithHeaderLength:queue:handler:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 171, CFSTR("Already closed"));

  }
  if (-[TSUZipEntry compressedSize](self->_entry, "compressedSize") >= 0xFFFFFFFF)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel readWithHeaderLength:queue:handler:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 174, CFSTR("No support for Zip 64"));

  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v28 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  v17 = -[TSUZipEntry offset](self->_entry, "offset") + a3;
  v18 = -[TSUZipEntry compressedSize](self->_entry, "compressedSize");
  readQueue = self->_readQueue;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__TSUZipReadChannel_readWithHeaderLength_queue_handler___block_invoke;
  v22[3] = &unk_24D61B838;
  v25 = v29;
  v22[4] = self;
  v20 = v8;
  v23 = v20;
  v21 = v9;
  v24 = v21;
  v26 = v27;
  -[TSUReadChannel readFromOffset:length:queue:handler:](archiveReadChannel, "readFromOffset:length:queue:handler:", v17, v18, readQueue, v22);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

void __56__TSUZipReadChannel_readWithHeaderLength_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithQueue:handler:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (v9)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "processData:CRC:isDone:queue:handler:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  _BOOL4 v9;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  BOOL v26;
  _QWORD applier[5];

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x24BDAC760];
  if (a4
    && (applier[0] = MEMORY[0x24BDAC760],
        applier[1] = 3221225472,
        applier[2] = __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke,
        applier[3] = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l,
        applier[4] = a4,
        dispatch_data_apply(v12, applier),
        v9)
    && -[TSUZipEntry CRC](self->_entry, "CRC") != *a4)
  {
    -[TSUZipEntry name](self->_entry, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel processData:CRC:isDone:queue:handler:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 208, (uint64_t)CFSTR("CRC does not match for entry %@"), v19, v20, v21, v22, (uint64_t)v18);

    -[TSUZipReadChannel handleFailureWithQueue:handler:error:](self, "handleFailureWithQueue:handler:error:", v13, v14, 0);
    v16 = 0;
  }
  else
  {
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke_2;
    block[3] = &unk_24D61B880;
    v25 = v14;
    v26 = v9;
    v24 = v12;
    dispatch_async(v13, block);

    v16 = 1;
  }

  return v16;
}

uint64_t __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t len)
{
  uLong v7;
  uInt v8;
  void *v10;
  void *v11;
  void *v12;

  v7 = **(unsigned int **)(a1 + 32);
  if (HIDWORD(len))
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel processData:CRC:isDone:queue:handler:]_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 202, CFSTR("Out-of-bounds type assignment was clamped to max"));

    v8 = -1;
  }
  else
  {
    v8 = len;
  }
  **(_DWORD **)(a1 + 32) = crc32(v7, buf, v8);
  return 1;
}

uint64_t __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), 0);
}

- (void)handleFailureWithQueue:(id)a3 handler:(id)a4 error:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__TSUZipReadChannel_handleFailureWithQueue_handler_error___block_invoke;
  v12[3] = &unk_24D61B4B0;
  v13 = v9;
  v14 = v8;
  v10 = v9;
  v11 = v8;
  dispatch_async(v7, v12);

}

uint64_t __58__TSUZipReadChannel_handleFailureWithQueue_handler_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

- (void)close
{
  TSUReadChannel *archiveReadChannel;

  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
