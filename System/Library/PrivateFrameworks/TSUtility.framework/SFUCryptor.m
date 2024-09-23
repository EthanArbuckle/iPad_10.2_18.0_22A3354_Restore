@implementation SFUCryptor

- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6
{
  return -[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:](self, "initWithKey:operation:iv:ivLength:usePKCS7Padding:", a3, *(_QWORD *)&a4, a5, a6, 1);
}

- (SFUCryptor)initWithKey:(id)a3 operation:(int)a4 iv:(const char *)a5 ivLength:(unint64_t)a6 usePKCS7Padding:(BOOL)a7
{
  CCOptions v7;
  SFUCryptor *v12;
  id v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  objc_super v28;

  v7 = a7;
  v28.receiver = self;
  v28.super_class = (Class)SFUCryptor;
  v12 = -[SFUCryptor init](&v28, sel_init);
  if (!v12)
    return v12;
  if (!a3)
  {
    v13 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 49, CFSTR("invalid nil value for '%s'"), "key");
  }
  if (!objc_msgSend(a3, "keyType"))
  {
    if (a6 != 16)
    {
      v16 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 66, CFSTR("Incorrect iv length (%lu, should be %d)"), a6, 16);
    }
    if (!a5)
    {
      v18 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 67, CFSTR("invalid nil value for '%s'"), "iv");
    }
    v20 = CCCryptorCreate(a4 == 1, 0, v7, (const void *)objc_msgSend(a3, "keyData"), objc_msgSend(a3, "keyLength"), a5, &v12->mCryptor);
    if ((_DWORD)v20)
    {
      v21 = v20;
      v22 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 72, CFSTR("CCCryptorCreate() failed: %d"), v21);
LABEL_15:

      return 0;
    }
    v12->mBlockSize = 16;
  }
  if (!v12->mCryptor)
  {
    v24 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]");
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 85, CFSTR("Failed to initialize SFUCommonCryptoCryptor."), v27);
    goto LABEL_15;
  }
  v12->mOperation = a4;
  v15 = (char *)malloc_type_malloc(0x20000uLL, 0x8E34A5F2uLL);
  v12->mOutputBuffer = v15;
  v12->mOutputBufferPos = v15;
  if (v12->mOperation == 1)
    v12->mDecryptionInputBuffer = (char *)malloc_type_malloc(0x20000uLL, 0x83D4E232uLL);
  return v12;
}

- (void)dealloc
{
  _CCCryptor *mCryptor;
  char *mDecryptionInputBuffer;
  objc_super v5;

  mCryptor = self->mCryptor;
  if (mCryptor)
  {
    CCCryptorRelease(mCryptor);
    self->mCryptor = 0;
  }
  free(self->mOutputBuffer);
  mDecryptionInputBuffer = self->mDecryptionInputBuffer;
  if (mDecryptionInputBuffer)
    free(mDecryptionInputBuffer);
  v5.receiver = self;
  v5.super_class = (Class)SFUCryptor;
  -[SFUCryptor dealloc](&v5, sel_dealloc);
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 error:(id *)a7
{
  return -[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:](self, "cryptDataFromBuffer:length:toStream:finished:crc32:error:", a3, a4, a5, a6, 0, a7);
}

- (BOOL)cryptDataFromBuffer:(const char *)a3 length:(unint64_t)a4 toStream:(id)a5 finished:(BOOL)a6 crc32:(unsigned int *)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v15;
  uint64_t v16;
  _CCCryptor *mCryptor;
  size_t v18;
  CCCryptorStatus v19;
  char *mOutputBuffer;
  size_t OutputLength;
  char *v22;
  CCCryptorStatus v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  size_t dataOutMoved;

  v10 = a6;
  if (self->mOperation)
  {
    v15 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 130, CFSTR("Decryption to stream not supported"));
  }
  if (a4)
  {
    while (1)
    {
      mCryptor = self->mCryptor;
      v18 = a4 >= 0x20000 - self->mBlockSize ? 0x20000 - self->mBlockSize : a4;
      dataOutMoved = 0;
      v19 = CCCryptorUpdate(mCryptor, a3, v18, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v19)
        break;
      if (dataOutMoved)
      {
        objc_msgSend(a5, "writeBuffer:size:", self->mOutputBuffer);
        if (a7)
        {
          if (HIDWORD(dataOutMoved))
          {
            v28 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]");
            v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm");
            v31 = v28;
            v32 = v29;
            v33 = 157;
            goto LABEL_31;
          }
          *a7 = crc32(*a7, (const Bytef *)self->mOutputBuffer, dataOutMoved);
        }
      }
      a3 += v18;
      a4 -= v18;
      if (!a4)
        goto LABEL_13;
    }
    if (!a8)
      return 0;
    v24 = *MEMORY[0x24BDD1100];
    v25 = v19;
    v26 = (void *)MEMORY[0x24BDD1540];
    goto LABEL_33;
  }
LABEL_13:
  if (v10)
  {
    dataOutMoved = 0;
    mOutputBuffer = self->mOutputBuffer;
    if (CCCryptorFinal(self->mCryptor, mOutputBuffer, 0x20000uLL, &dataOutMoved) == -4301)
    {
      OutputLength = CCCryptorGetOutputLength(self->mCryptor, 0, 1);
      v22 = (char *)malloc_type_malloc(OutputLength, 0xE51D72ECuLL);
      if (!v22)
      {
        if (!a8)
          return 0;
        v26 = (void *)MEMORY[0x24BDD1540];
        v24 = *MEMORY[0x24BDD1100];
        v25 = -4301;
LABEL_33:
        *a8 = (id)objc_msgSend(v26, "errorWithDomain:code:userInfo:", v24, v25, 0);
        return 0;
      }
      mOutputBuffer = v22;
      v23 = CCCryptorFinal(self->mCryptor, v22, OutputLength, &dataOutMoved);
      if (v23)
      {
        if (a8)
          *a8 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v23, 0);
        free(mOutputBuffer);
        return 0;
      }
      v27 = mOutputBuffer;
    }
    else
    {
      v27 = 0;
    }
    if (dataOutMoved)
    {
      objc_msgSend(a5, "writeBuffer:size:", mOutputBuffer);
      if (a7)
      {
        if (HIDWORD(dataOutMoved))
        {
          v34 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:]");
          v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm");
          v31 = v34;
          v32 = v35;
          v33 = 206;
LABEL_31:
          objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, v30, v33, CFSTR("overflow in cryptDataFromBuffer:length:toStream:finished:crc32:error:"));
          if (!a8)
            return 0;
          v26 = (void *)MEMORY[0x24BDD1540];
          v24 = *MEMORY[0x24BDD1100];
          v25 = -4302;
          goto LABEL_33;
        }
        *a7 = crc32(*a7, (const Bytef *)mOutputBuffer, dataOutMoved);
      }
    }
    if (v27)
      free(v27);
  }
  return 1;
}

- (BOOL)cryptDataFromStream:(id)a3 toBuffer:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  id v13;
  uint64_t v14;
  unint64_t mOutputBufferAvailable;
  size_t v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  size_t v21;
  CCCryptorStatus v22;
  size_t v23;
  size_t v24;
  _BOOL4 v25;
  size_t v26;
  unint64_t v27;
  id *v28;
  size_t dataOutMoved;

  if (self->mOperation != 1)
  {
    v13 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptor.mm"), 229, CFSTR("Encryption from stream not supported"));
  }
  mOutputBufferAvailable = self->mOutputBufferAvailable;
  if (mOutputBufferAvailable)
  {
    if (mOutputBufferAvailable >= a5)
      v16 = a5;
    else
      v16 = self->mOutputBufferAvailable;
    memcpy(a4, self->mOutputBufferPos, v16);
    v17 = self->mOutputBufferAvailable - v16;
    self->mOutputBufferPos += v16;
    self->mOutputBufferAvailable = v17;
    v18 = &a4[v16];
    a5 -= v16;
  }
  else
  {
    v18 = a4;
  }
  if (self->mFinished)
  {
    v19 = v18 - a4;
LABEL_11:
    *a6 = v19;
    return 1;
  }
  if (a5)
  {
    v28 = a7;
    while (1)
    {
      v21 = objc_msgSend(a3, "readToBuffer:size:", self->mDecryptionInputBuffer, 0x20000 - self->mBlockSize, v28);
      if (!v21)
        break;
      dataOutMoved = 0;
      v22 = CCCryptorUpdate(self->mCryptor, self->mDecryptionInputBuffer, v21, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
      if (v22)
      {
        a7 = v28;
        goto LABEL_36;
      }
      v23 = dataOutMoved;
      if (a5 >= dataOutMoved)
        v24 = dataOutMoved;
      else
        v24 = a5;
      memcpy(v18, self->mOutputBuffer, v24);
      v18 += v24;
      a5 -= v24;
      self->mOutputBufferPos = &self->mOutputBuffer[v24];
      self->mOutputBufferAvailable = v23 - v24;
      v25 = a5 != 0;
      if (!a5)
        goto LABEL_24;
    }
    v25 = 1;
LABEL_24:
    if (v21)
      v25 = 0;
    a7 = v28;
  }
  else
  {
    v25 = 0;
  }
  if (v18 != a4 && !v25)
  {
    *a6 = v18 - a4;
    return 1;
  }
  self->mFinished = 1;
  dataOutMoved = 0;
  v22 = CCCryptorFinal(self->mCryptor, self->mOutputBuffer, 0x20000uLL, &dataOutMoved);
  if (!v22)
  {
    if (a5 >= dataOutMoved)
      v26 = dataOutMoved;
    else
      v26 = a5;
    memcpy(v18, self->mOutputBuffer, v26);
    v27 = dataOutMoved - v26;
    self->mOutputBufferPos = &self->mOutputBuffer[v26];
    self->mOutputBufferAvailable = v27;
    v19 = &v18[v26] - a4;
    goto LABEL_11;
  }
LABEL_36:
  if (a7)
    *a7 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v22, 0);
  return 0;
}

@end
