@implementation TSPCryptoReadChannel

- (TSPCryptoReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4
{
  id v7;
  id v8;
  TSPCryptoReadChannel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *readChannelQueue;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TSPCryptoReadChannel;
  v9 = -[TSPCryptoReadChannel init](&v32, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 39, CFSTR("invalid nil value for '%s'"), "readChannel");

    }
    objc_storeStrong((id *)&v9->_readChannel, a3);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 42, CFSTR("invalid nil value for '%s'"), "decryptionKey");

    }
    objc_storeStrong((id *)&v9->_decryptionKey, a4);
    v16 = dispatch_queue_create("TSPCryptoReadChannel.Read", 0);
    readChannelQueue = v9->_readChannelQueue;
    v9->_readChannelQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(v8, "passphrase");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "cStringUsingEncoding:", 4);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 49, CFSTR("Invalid passphrase"));

    }
    v23 = (char *)malloc_type_malloc(0x10uLL, 0x383A422uLL);
    v9->_iv = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 59, CFSTR("Failed to allocate space for IV"));

    }
    v27 = (char *)malloc_type_malloc(0x200000uLL, 0xDD67014EuLL);
    v9->_buffer = v27;
    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 62, CFSTR("Failed to allocate space for decryption buffer"));

    }
    if (!v9->_readChannel || !v19 || !v9->_decryptionKey || !v9->_iv || !v9->_buffer)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  _CCCryptor *cryptor;
  char *iv;
  char *buffer;
  objc_super v6;

  -[TSPCryptoReadChannel close](self, "close");
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  iv = self->_iv;
  if (iv)
  {
    free(iv);
    self->_iv = 0;
  }
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSPCryptoReadChannel;
  -[TSPCryptoReadChannel dealloc](&v6, sel_dealloc);
}

- (void)close
{
  TSUStreamReadChannel *readChannel;

  -[TSUStreamReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  TSUStreamReadChannel *readChannel;
  void *v9;
  void *v10;
  void *v11;
  OS_dispatch_queue *readChannelQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  TSPCryptoReadChannel *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  readChannel = self->_readChannel;
  if (!readChannel)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 96, CFSTR("Read channel is already closed"));

    readChannel = self->_readChannel;
  }
  readChannelQueue = self->_readChannelQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke;
  v15[3] = &unk_24D82A2E8;
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = self;
  v18 = v14;
  -[TSUStreamReadChannel readWithQueue:handler:](readChannel, "readWithQueue:handler:", readChannelQueue, v15);

}

void __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_data_t concat;
  NSObject *v12;
  size_t size;
  size_t v14;
  size_t v15;
  dispatch_data_t subrange;
  uint64_t v17;
  void *v18;
  size_t v19;
  _CCCryptor *v20;
  size_t OutputLength;
  dispatch_data_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  size_t *v31;
  size_t v32;
  size_t v33;
  size_t v34;
  size_t v35;
  char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_data_t v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  size_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  dispatch_data_t v61;
  NSObject *v62;
  NSObject *v63;
  dispatch_data_t v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  _CCCryptor *v68;
  NSObject *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  dispatch_data_t v73;
  id v74;
  _QWORD v75[4];
  NSObject *v76;
  id v77;
  size_t v78;
  size_t v79;
  size_t v80;
  _QWORD v81[4];
  dispatch_data_t v82;
  id v83;
  _QWORD applier[7];
  size_t dataOutMoved;
  size_t *p_dataOutMoved;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[4];
  dispatch_data_t v90;
  id v91;
  _QWORD block[4];
  id v93;
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  char v98;

  v7 = a3;
  v8 = a4;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 1;
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_2;
    block[3] = &unk_24D8297C8;
    v94 = *(id *)(a1 + 48);
    v93 = v8;
    dispatch_async(v9, block);
    *((_BYTE *)v96 + 24) = 0;

    goto LABEL_53;
  }
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  if (v10)
  {
    concat = dispatch_data_create_concat(v10, v7);

    v7 = concat;
  }
  v12 = v7;
  size = dispatch_data_get_size(v7);
  if (size >= 0x14)
    v14 = 20;
  else
    v14 = size;
  v15 = size - v14;
  subrange = dispatch_data_create_subrange(v12, size - v14, v14);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v17 + 32);
  *(_QWORD *)(v17 + 32) = subrange;

  v7 = dispatch_data_create_subrange(v12, 0, v15);
  v19 = dispatch_data_get_size(v7);
  if (a2 && !v19)
  {
    v20 = *(_CCCryptor **)(*(_QWORD *)(a1 + 40) + 56);
    if (v20)
    {
      OutputLength = CCCryptorGetOutputLength(v20, 0, 1);
      v22 = (dispatch_data_t)OutputLength;
      if (!OutputLength)
      {
LABEL_32:
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) != 16)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, v50, 154, CFSTR("Failed to read and discard the initial random block; only read %zu bytes"),
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));

        }
        v51 = *(NSObject **)(a1 + 32);
        v89[0] = MEMORY[0x24BDAC760];
        v89[1] = 3221225472;
        v89[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_3;
        v89[3] = &unk_24D8297C8;
        v52 = *(id *)(a1 + 48);
        v90 = v22;
        v91 = v52;
        v53 = v22;
        dispatch_async(v51, v89);

        goto LABEL_53;
      }
      v23 = malloc_type_malloc(OutputLength, 0x1AEB0013uLL);
      if (v23)
      {
        dataOutMoved = 0;
        v24 = CCCryptorFinal(*(CCCryptorRef *)(*(_QWORD *)(a1 + 40) + 56), v23, (size_t)v22, &dataOutMoved);
        if ((_DWORD)v24)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 138, CFSTR("Finalizing decryption failed: CCCryptorFinal status %i"), v24);

        }
        if (dataOutMoved)
          v22 = dispatch_data_create(v23, dataOutMoved, 0, 0);
        else
          v22 = 0;
        free(v23);
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, v47, 133, CFSTR("Failed to allocate buffer for finalizing decryption"));

    }
    v22 = 0;
    goto LABEL_32;
  }
  dataOutMoved = 0;
  p_dataOutMoved = &dataOutMoved;
  v87 = 0x2020000000;
  v88 = 0;
  v28 = MEMORY[0x24BDAC760];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_4;
  applier[3] = &unk_24D82A298;
  applier[4] = *(_QWORD *)(a1 + 40);
  applier[5] = &v95;
  applier[6] = &dataOutMoved;
  dispatch_data_apply(v7, applier);
  if (*((_BYTE *)v96 + 24))
  {
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(v29 + 72);
    v31 = p_dataOutMoved;
    v32 = 16 - v30 >= p_dataOutMoved[3] ? p_dataOutMoved[3] : 16 - v30;
    *(_QWORD *)(v29 + 72) = v32 + v30;
    v33 = v31[3];
    if (v33 != v32)
    {
      if ((a2 & 1) != 0)
      {
        v80 = 0;
        v34 = CCCryptorGetOutputLength(*(CCCryptorRef *)(*(_QWORD *)(a1 + 40) + 56), 0, 1);
        v35 = v34;
        if (v34)
        {
          v36 = (char *)malloc_type_malloc(v34, 0x4B64D27EuLL);
          if (!v36)
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, v40, 240, CFSTR("Failed to allocate buffer for finalizing decryption"));
            v36 = 0;
            goto LABEL_37;
          }
          v37 = CCCryptorFinal(*(CCCryptorRef *)(*(_QWORD *)(a1 + 40) + 56), v36, v35, &v80);
          if ((_DWORD)v37)
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, v40, 244, CFSTR("Finalizing decryption failed: CCCryptorFinal status %i"), v37);
LABEL_37:

          }
        }
        else
        {
          v36 = 0;
        }
        v54 = *(_QWORD *)(a1 + 40);
        v55 = *(_QWORD *)(v54 + 72);
        if (16 - v55 >= v80)
          v56 = v80;
        else
          v56 = 16 - v55;
        *(_QWORD *)(v54 + 72) = v56 + v55;
        v57 = *(_QWORD *)(a1 + 40);
        if (*(_QWORD *)(v57 + 72) != 16)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, v60, 249, CFSTR("Failed to read and discard the initial random block; only read %zu bytes"),
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));

          v57 = *(_QWORD *)(a1 + 40);
        }
        v61 = dispatch_data_create((const void *)(*(_QWORD *)(v57 + 64) + v32), p_dataOutMoved[3] - v32, 0, 0);
        v62 = *(NSObject **)(a1 + 32);
        v75[0] = v28;
        v75[1] = 3221225472;
        v75[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_6;
        v75[3] = &unk_24D82A2C0;
        v77 = *(id *)(a1 + 48);
        v78 = v80;
        v79 = v56;
        v63 = v61;
        v76 = v63;
        dispatch_async(v62, v75);
        if (v80 != v56)
        {
          v64 = dispatch_data_create(&v36[v56], v80 - v56, 0, 0);
          v65 = *(NSObject **)(a1 + 32);
          v72[0] = v28;
          v72[1] = 3221225472;
          v72[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_7;
          v72[3] = &unk_24D8297C8;
          v66 = *(id *)(a1 + 48);
          v73 = v64;
          v74 = v66;
          v67 = v64;
          dispatch_async(v65, v72);

        }
        if (v36)
          free(v36);
        v68 = *(_CCCryptor **)(*(_QWORD *)(a1 + 40) + 56);
        if (v68)
        {
          CCCryptorRelease(v68);
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = 0;
        }

        goto LABEL_50;
      }
      v41 = dispatch_data_create((const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + v32), v33 - v32, 0, 0);
      v42 = *(NSObject **)(a1 + 32);
      v81[0] = v28;
      v81[1] = 3221225472;
      v81[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_5;
      v81[3] = &unk_24D8297C8;
      v43 = *(id *)(a1 + 48);
      v82 = v41;
      v83 = v43;
      v44 = v41;
      dispatch_async(v42, v81);

    }
  }
LABEL_50:
  if (!*((_BYTE *)v96 + 24))
  {
    v69 = *(NSObject **)(a1 + 32);
    v70[0] = v28;
    v70[1] = 3221225472;
    v70[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_8;
    v70[3] = &unk_24D8299B8;
    v71 = *(id *)(a1 + 48);
    dispatch_async(v69, v70);

  }
  _Block_object_dispose(&dataOutMoved, 8);
LABEL_53:
  _Block_object_dispose(&v95, 8);

}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3, char *a4, unint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _CCCryptor *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v28;
  size_t dataOutMoved;

  v28 = a2;
  while (a5)
  {
    v8 = a1[4];
    if (!*(_QWORD *)(v8 + 56))
    {
      v11 = v8 + 40;
      v9 = *(_QWORD *)(v8 + 40);
      v10 = *(_QWORD *)(v11 + 8);
      v12 = 16 - v10 >= a5 ? a5 : 16 - v10;
      memcpy((void *)(v9 + v10), a4, v12);
      *(_QWORD *)(a1[4] + 48) += v12;
      a4 += v12;
      a5 -= v12;
      v13 = a1[4];
      if (*(_QWORD *)(v13 + 48) == 16)
      {
        v14 = CCCryptorCreate(1u, 0, 1u, (const void *)objc_msgSend(*(id *)(v13 + 24), "keyData"), objc_msgSend(*(id *)(a1[4] + 24), "keyLength"), *(const void **)(a1[4] + 40), (CCCryptorRef *)(a1[4] + 56));
        if ((_DWORD)v14 || !*(_QWORD *)(a1[4] + 56))
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke_4");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 183, CFSTR("CCCryptorCreate() failed: %d"), v14);

          *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      if (a5)
      {
        v18 = a1[4];
        v19 = *(_CCCryptor **)(v18 + 56);
        if (v19)
        {
          dataOutMoved = 0;
          if (a5 >= 0x1FFFF0)
            v20 = 2097136;
          else
            v20 = a5;
          v21 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          v22 = CCCryptorUpdate(v19, a4, v20, (void *)(*(_QWORD *)(v18 + 64) + v21), 0x200000 - v21, &dataOutMoved);
          if ((_DWORD)v22)
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke_4");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 198, CFSTR("CCCryptorUpdate() failed: %d"), v22);

            *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
          }
          a4 += v20;
          a5 -= v20;
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += dataOutMoved;
        }
      }
    }
  }
  v26 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);

  return v26;
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6] == a1[7], a1[4], 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32), 0);
}

void __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsp_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdData, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_readChannelQueue, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
