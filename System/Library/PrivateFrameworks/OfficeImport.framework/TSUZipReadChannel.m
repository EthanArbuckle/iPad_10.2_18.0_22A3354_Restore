@implementation TSUZipReadChannel

- (TSUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9;
  id v10;
  TSUZipReadChannel *v11;
  TSUZipReadChannel *v12;
  uint64_t v13;
  TSUReadChannel *archiveReadChannel;
  void *v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TSUZipReadChannel;
  v11 = -[TSUZipReadChannel init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    v13 = objc_msgSend(v10, "newArchiveReadChannel");
    archiveReadChannel = v12->_archiveReadChannel;
    v12->_archiveReadChannel = (TSUReadChannel *)v13;

    if (!v12->_archiveReadChannel)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel initWithEntry:archive:validateCRC:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 38, 0, "Archive is closed");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUZipReadChannel close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSUZipReadChannel;
  -[TSUZipReadChannel dealloc](&v3, sel_dealloc);
}

- (void)readWithHandler:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  id v10;
  TSUReadChannel *archiveReadChannel;
  unint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];
  int v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  v5 = -[TSUZipEntry compressedSize](self->_entry, "compressedSize");
  v6 = -[TSUZipEntry fileHeaderLength](self->_entry, "fileHeaderLength");
  if (v6)
  {
    -[TSUZipReadChannel readWithFileHeaderLength:handler:](self, "readWithFileHeaderLength:handler:", v6, v4);
  }
  else
  {
    v7 = -[TSUZipEntry nameLength](self->_entry, "nameLength");
    v8 = -[TSUZipEntry extraFieldsLength](self->_entry, "extraFieldsLength");
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__16;
    v26[4] = __Block_byref_object_dispose__16;
    v9 = (void *)MEMORY[0x24BDAC990];
    v10 = MEMORY[0x24BDAC990];
    v27 = v9;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 1;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v21 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    v12 = -[TSUZipEntry offset](self->_entry, "offset");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__TSUZipReadChannel_readWithHandler___block_invoke_7;
    v13[3] = &unk_24F39C5F8;
    v15 = v22;
    v13[4] = self;
    v14 = v4;
    v16 = v26;
    v17 = v24;
    v18 = v20;
    v19 = v7 + (unint64_t)v8 + 30;
    -[TSUReadChannel readFromOffset:length:handler:](archiveReadChannel, "readFromOffset:length:handler:", v12, v19 + v5, v13);

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

  }
}

void __37__TSUZipReadChannel_readWithHandler___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  dispatch_data_t concat;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  size_t size;
  uint64_t v17;
  void *v18;
  size_t v19;
  size_t v20;
  dispatch_data_t subrange;
  size_t v22;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithHandler:error:", *(_QWORD *)(a1 + 40), v8);
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v10 && (v11 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) != 0)
  {
    if (v7)
    {
      concat = dispatch_data_create_concat(v11, v7);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = concat;

      v11 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    v15 = v11;

    size = dispatch_data_get_size(v15);
    if ((a2 & 1) != 0 || size >= 0x1E)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;

      v22 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "readFileHeaderFromData:headerLength:", v15, &v22);
      v19 = v22;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22 != *(_QWORD *)(a1 + 80);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 32), "readWithFileHeaderLength:handler:", v19, *(_QWORD *)(a1 + 40));
        }
        else
        {
          v20 = dispatch_data_get_size(v15);
          if (v20 >= v19)
          {
            subrange = dispatch_data_create_subrange(v15, v19, v20 - v19);

            v15 = subrange;
          }
          else
          {
            if (TSUDefaultCat_init_token != -1)
              dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          }
        }
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 32), "handleFailureWithHandler:error:", *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    v15 = v7;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "processData:CRC:isDone:handler:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24, a2, *(_QWORD *)(a1 + 40));
  }

}

void __37__TSUZipReadChannel_readWithHandler___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  TSUReadChannel *archiveReadChannel;
  unint64_t v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  unint64_t v16;

  v8 = a5;
  v9 = -[TSUZipEntry compressedSize](self->_entry, "compressedSize");
  if (a3 < 0 || v9 < a3)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_11_1);
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 1, MEMORY[0x24BDAC990], 0);
  }
  else
  {
    if (v9 - a3 < a4)
      a4 = v9 - a3;
    if (a3 || a4 != v9)
    {
      v10 = -[TSUZipEntry fileHeaderLength](self->_entry, "fileHeaderLength");
      if (v10)
      {
        -[TSUReadChannel readFromOffset:length:handler:](self->_archiveReadChannel, "readFromOffset:length:handler:", v10 + a3 + -[TSUZipEntry offset](self->_entry, "offset"), a4, v8);
      }
      else
      {
        archiveReadChannel = self->_archiveReadChannel;
        v12 = -[TSUZipEntry offset](self->_entry, "offset");
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_3;
        v13[3] = &unk_24F39C640;
        v13[4] = self;
        v15 = a3;
        v16 = a4;
        v14 = v8;
        +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", archiveReadChannel, v12, 30, v13);

      }
    }
    else
    {
      -[TSUZipReadChannel readWithHandler:](self, "readWithHandler:", v8);
    }
  }

}

void __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  v10 = 0;
  if (v6 || !objc_msgSend(*(id *)(a1 + 32), "readFileHeaderFromData:headerLength:", v5, &v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithHandler:error:", *(_QWORD *)(a1 + 40), v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    v9 = objc_msgSend(*(id *)(v7 + 8), "offset");
    objc_msgSend(v8, "readFromOffset:length:handler:", v10 + *(_QWORD *)(a1 + 48) + v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  NSObject *v6;
  size_t size;
  NSObject *subrange;
  NSObject *v9;
  dispatch_data_t v10;
  unsigned __int16 *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  void *v16;
  size_t v17;
  void *buffer_ptr;

  v6 = a3;
  size = dispatch_data_get_size(v6);
  if (size == 30)
  {
    subrange = v6;
    goto LABEL_5;
  }
  if (size >= 0x1F)
  {
    subrange = dispatch_data_create_subrange(v6, 0, 0x1EuLL);
LABEL_5:
    v9 = subrange;
    v17 = 0;
    buffer_ptr = 0;
    v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v17);
    v11 = (unsigned __int16 *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      v12 = *((unsigned __int16 *)buffer_ptr + 4);
      if (*((_WORD *)buffer_ptr + 4))
        v13 = v12 == (unsigned __int16)TSUZipDeflateCompressionMethod;
      else
        v13 = 1;
      if (v13
        && (((v12 != (unsigned __int16)TSUZipDeflateCompressionMethod) ^ -[TSUZipEntry isCompressed](self->_entry, "isCompressed")) & 1) != 0)
      {
        *a4 = v11[13] + (unint64_t)v11[14] + 30;
        -[TSUZipEntry setFileHeaderLength:](self->_entry, "setFileHeaderLength:");
        v14 = 1;
LABEL_17:

        goto LABEL_21;
      }
      if (TSUDefaultCat_init_token == -1)
      {
        v14 = 0;
        goto LABEL_17;
      }
      v16 = &__block_literal_global_16_0;
    }
    else
    {
      if (TSUDefaultCat_init_token == -1)
      {
        v14 = 0;
        goto LABEL_17;
      }
      v16 = &__block_literal_global_15;
    }
    dispatch_once(&TSUDefaultCat_init_token, v16);
    v14 = 0;
    goto LABEL_17;
  }
  if (TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_14_0);
  v14 = 0;
LABEL_21:

  return v14;
}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6;
  TSUReadChannel *archiveReadChannel;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  char v18;

  v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v16 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  v8 = -[TSUZipEntry offset](self->_entry, "offset");
  v9 = -[TSUZipEntry compressedSize](self->_entry, "compressedSize");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__TSUZipReadChannel_readWithFileHeaderLength_handler___block_invoke;
  v11[3] = &unk_24F39C6C8;
  v13 = v17;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v14 = v15;
  -[TSUReadChannel readFromOffset:length:handler:](archiveReadChannel, "readFromOffset:length:handler:", v8 + a3, v9, v11);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

void __54__TSUZipReadChannel_readWithFileHeaderLength_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithHandler:error:", *(_QWORD *)(a1 + 40), v7);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v9)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "processData:CRC:isDone:handler:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2, *(_QWORD *)(a1 + 40));

}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  void (**v11)(id, _BOOL8, NSObject *, _QWORD);
  BOOL v12;
  _QWORD applier[5];

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(id, _BOOL8, NSObject *, _QWORD))a6;
  if (a4
    && self->_validateCRC
    && (applier[0] = MEMORY[0x24BDAC760],
        applier[1] = 3221225472,
        applier[2] = __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke,
        applier[3] = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l,
        applier[4] = a4,
        dispatch_data_apply(v10, applier),
        v7)
    && -[TSUZipEntry CRC](self->_entry, "CRC") != *a4)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_20_0);
    -[TSUZipReadChannel handleFailureWithHandler:error:](self, "handleFailureWithHandler:error:", v11, 0);
    v12 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    v12 = 1;
  }

  return v12;
}

uint64_t __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t len)
{
  uLong v7;
  uInt v8;
  void *v10;
  void *v11;

  v7 = **(unsigned int **)(a1 + 32);
  if (HIDWORD(len))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel processData:CRC:isDone:handler:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 241, 0, "Out-of-bounds type assignment was clamped to max");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v8 = -1;
  }
  else
  {
    v8 = len;
  }
  **(_DWORD **)(a1 + 32) = crc32(v7, buf, v8);
  return 1;
}

void __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (*v5)(void);
  void *v6;
  id v7;
  id v8;

  if (a4)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v8 = a3;
    v5();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = a3;
    objc_msgSend(v6, "tsu_fileReadCorruptedFileErrorWithUserInfo:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v7, 1, 0);

  }
}

- (void)close
{
  TSUReadChannel *archiveReadChannel;
  TSUZipEntry *entry;
  TSUZipArchive *archive;

  -[TSUReadChannel close](self->_archiveReadChannel, "close");
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;

}

- (void)setLowWater:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_archiveReadChannel)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel setLowWater:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 274, 0, "Already closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (a3 <= 0x1D)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel setLowWater:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 275, 0, "Low water is too small");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[TSUReadChannel setLowWater:](self->_archiveReadChannel, "setLowWater:", a3);
}

- (void)addBarrier:(id)a3
{
  id v4;
  TSUReadChannel *archiveReadChannel;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  archiveReadChannel = self->_archiveReadChannel;
  v8 = v4;
  if (!archiveReadChannel)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipReadChannel addBarrier:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 281, 0, "Already closed");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v4 = v8;
    archiveReadChannel = self->_archiveReadChannel;
  }
  -[TSUReadChannel addBarrier:](archiveReadChannel, "addBarrier:", v4);

}

- (BOOL)isValid
{
  return -[TSUReadChannel isValid](self->_archiveReadChannel, "isValid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
