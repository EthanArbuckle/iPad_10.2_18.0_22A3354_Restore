@implementation TSPCryptoComponentWriteChannel

- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionKey:(id)a4
{
  id v7;
  id v8;
  char *v9;
  TSPCryptoComponentWriteChannel *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_data_t p_super;
  id v33;
  const char *v34;
  size_t v35;
  void *v36;
  void *v37;
  dispatch_data_t v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)TSPCryptoComponentWriteChannel;
  v9 = -[TSPCryptoComponentWriteChannel init](&v39, sel_init);
  v10 = (TSPCryptoComponentWriteChannel *)v9;
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 30, CFSTR("invalid nil value for '%s'"), "writeChannel");

    }
    v14 = (void **)(v9 + 8);
    objc_storeStrong((id *)v9 + 1, a3);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 33, CFSTR("invalid nil value for '%s'"), "encryptionKey");

    }
    v18 = malloc_type_malloc(0x20000uLL, 0x270AD37BuLL);
    *((_QWORD *)v9 + 3) = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v21, 36, CFSTR("Failed to allocate space for encryption buffer"));

    }
    v22 = malloc_type_malloc(0x10uLL, 0xE2E4F584uLL);
    if (v22 && (objc_msgSend(MEMORY[0x24BEB3C10], "generateRandomDataInBuffer:length:", v22, 16) & 1) != 0)
    {
      v23 = CCCryptorCreate(0, 0, 1u, (const void *)objc_msgSend(v8, "keyData"), objc_msgSend(v8, "keyLength"), v22, (CCCryptorRef *)v9 + 2);
      if ((_DWORD)v23 || !*((_QWORD *)v9 + 2))
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 48, CFSTR("CCCryptorCreate() failed: %d"), v23);
      }
      else
      {
        objc_msgSend(v8, "passphrase");
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = (const char *)objc_msgSend(v33, "cStringUsingEncoding:", 4);

        if (v34)
        {
          v35 = strlen(v34);
          CCHmacInit((CCHmacContext *)(v9 + 32), 0, v34, v35);
          v36 = *v14;
          v37 = (void *)*MEMORY[0x24BDAC980];
          v38 = dispatch_data_create(v22, 0x10uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
          objc_msgSend(v36, "writeData:", v38);

          v22 = malloc_type_malloc(0x10uLL, 0xB7DDFBADuLL);
          if (v22 && (objc_msgSend(MEMORY[0x24BEB3C10], "generateRandomDataInBuffer:length:", v22, 16) & 1) != 0)
          {
            p_super = dispatch_data_create(v22, 0x10uLL, 0, v37);
            -[TSPCryptoComponentWriteChannel _writeData:updateHmac:](v10, "_writeData:updateHmac:", p_super, 0);
            goto LABEL_17;
          }
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 72, CFSTR("Failed to generate initial block of random plaintext"));
LABEL_14:

          if (!v22)
          {
LABEL_16:
            v30 = *v14;
            *v14 = 0;

            p_super = &v10->super;
            v10 = 0;
LABEL_17:

            goto LABEL_18;
          }
LABEL_15:
          free(v22);
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 56, CFSTR("Invalid passphrase"));
      }

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 41, CFSTR("Failed to generate IV"));
    goto LABEL_14;
  }
LABEL_18:

  return v10;
}

- (void)dealloc
{
  _CCCryptor *cryptor;
  char *buffer;
  objc_super v5;

  -[TSPCryptoComponentWriteChannel close](self, "close");
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSPCryptoComponentWriteChannel;
  -[TSPCryptoComponentWriteChannel dealloc](&v5, sel_dealloc);
}

- (void)writeData:(id)a3
{
  -[TSPCryptoComponentWriteChannel _writeData:updateHmac:](self, "_writeData:updateHmac:", a3, 1);
}

- (void)_writeData:(id)a3 updateHmac:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__TSPCryptoComponentWriteChannel__writeData_updateHmac___block_invoke;
  v4[3] = &unk_24D82A270;
  v4[4] = self;
  v5 = a4;
  dispatch_data_apply((dispatch_data_t)a3, v4);
}

uint64_t __56__TSPCryptoComponentWriteChannel__writeData_updateHmac___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4, size_t a5)
{
  id v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  dispatch_data_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  size_t dataOutMoved;

  v8 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 8))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _writeData:updateHmac:]_block_invoke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 124, CFSTR("Tried to write data when already closed."));
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 40))
    CCHmacUpdate((CCHmacContext *)(v9 + 32), a4, a5);
  if (a5)
  {
    while (1)
    {
      v10 = a5 >= 0x1FFF0 ? 131056 : a5;
      dataOutMoved = 0;
      v11 = CCCryptorUpdate(*(CCCryptorRef *)(*(_QWORD *)(a1 + 32) + 16), a4, v10, *(void **)(*(_QWORD *)(a1 + 32) + 24), 0x20000uLL, &dataOutMoved);
      if ((_DWORD)v11)
        break;
      if (dataOutMoved)
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        v14 = dispatch_data_create(*(const void **)(v12 + 24), dataOutMoved, 0, 0);
        objc_msgSend(v13, "writeData:", v14);

      }
      a4 += v10;
      a5 -= v10;
      if (!a5)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel _writeData:updateHmac:]_block_invoke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 145, CFSTR("Encryption failed: CCCryptorUpdate result %d"), v11);
    goto LABEL_15;
  }
LABEL_12:
  v15 = 1;
LABEL_16:

  return v15;
}

- (void)close
{
  TSPCryptoComponentWriteChannel *v2;
  void *buffer;
  size_t OutputLength;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TSPComponentWriteChannel *writeChannel;
  dispatch_data_t v11;
  TSPComponentWriteChannel *v12;
  dispatch_data_t v13;
  TSPComponentWriteChannel *v14;
  size_t dataOutMoved;
  _BYTE macOut[20];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_writeChannel)
    goto LABEL_15;
  dataOutMoved = 0;
  buffer = v2->_buffer;
  if (CCCryptorFinal(v2->_cryptor, buffer, 0x20000uLL, &dataOutMoved) == -4301)
  {
    OutputLength = CCCryptorGetOutputLength(v2->_cryptor, 0, 1);
    buffer = malloc_type_malloc(OutputLength, 0x9E89D6E1uLL);
    if (buffer)
    {
      v5 = CCCryptorFinal(v2->_cryptor, buffer, OutputLength, &dataOutMoved);
      if (!(_DWORD)v5)
      {
LABEL_9:
        v9 = buffer;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel close]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 194, CFSTR("Finalizing encryption failed: CCCryptorFinal status %i"), v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoComponentWriteChannel close]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 188, CFSTR("Failed to allocate buffer for finalizing encryption"));
      buffer = 0;
    }

    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:
  if (dataOutMoved)
  {
    writeChannel = v2->_writeChannel;
    v11 = dispatch_data_create(buffer, dataOutMoved, 0, 0);
    -[TSPComponentWriteChannel writeData:](writeChannel, "writeData:", v11);

  }
  if (v9)
    free(v9);
  CCHmacFinal((CCHmacContext *)&v2->_ccHmacContext, macOut);
  v12 = v2->_writeChannel;
  v13 = dispatch_data_create(macOut, 0x14uLL, 0, 0);
  -[TSPComponentWriteChannel writeData:](v12, "writeData:", v13);

  -[TSPComponentWriteChannel close](v2->_writeChannel, "close");
  v14 = v2->_writeChannel;
  v2->_writeChannel = 0;

LABEL_15:
  objc_sync_exit(v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end
