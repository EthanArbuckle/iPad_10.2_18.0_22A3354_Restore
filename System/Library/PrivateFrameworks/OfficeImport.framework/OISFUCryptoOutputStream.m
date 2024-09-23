@implementation OISFUCryptoOutputStream

+ (unint64_t)encodedLengthForDataLength:(unint64_t)a3 key:(id)a4
{
  unsigned int v6;
  int v7;
  uint64_t v8;

  v6 = 2 * +[OISFUCryptoUtils ivLengthForKey:](OISFUCryptoUtils, "ivLengthForKey:", a4);
  v7 = objc_msgSend(a4, "keyType");
  LODWORD(v8) = v6 - (a3 & 0xF) + 16;
  if (v7)
    v8 = v6;
  else
    v8 = v8;
  if (__CFADD__(v8, a3))
    v8 = 0;
  return v8 + a3;
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4
{
  return -[OISFUCryptoOutputStream initForEncryptionWithOutputStream:key:computeCrc32:](self, "initForEncryptionWithOutputStream:key:computeCrc32:", a3, a4, 0);
}

- (id)initForEncryptionWithOutputStream:(id)a3 key:(id)a4 computeCrc32:(BOOL)a5
{
  OISFUCryptoOutputStream *v8;
  uInt v9;
  const Bytef *v10;
  OISFUCryptor *v11;
  unsigned int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[OISFUCryptoOutputStream init](self, "init");
  if (v8)
  {
    v8->mBaseStream = (SFUOutputStream *)a3;
    v8->mComputeCrc32 = a5;
    v9 = +[OISFUCryptoUtils ivLengthForKey:](OISFUCryptoUtils, "ivLengthForKey:", a4);
    v10 = (const Bytef *)v14 - ((v9 + 15) & 0x1FFFFFFF0);
    if (!+[OISFUCryptoUtils generateRandomDataInBuffer:length:](OISFUCryptoUtils, "generateRandomDataInBuffer:length:", v10, v9))objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to generate IV"));
    v11 = -[OISFUCryptor initWithKey:operation:iv:ivLength:]([OISFUCryptor alloc], "initWithKey:operation:iv:ivLength:", a4, 0, v10, v9);
    v8->mCryptor = v11;
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to create SFUCryptor"));
    -[SFUOutputStream writeBuffer:size:](v8->mBaseStream, "writeBuffer:size:", v10, v9);
    if (v8->mComputeCrc32)
    {
      v12 = crc32(0, 0, 0);
      v8->mCrc32 = v12;
      v8->mCrc32 = crc32(v12, v10, v9);
    }
    if (v9)
    {
      if (!+[OISFUCryptoUtils generateRandomDataInBuffer:length:](OISFUCryptoUtils, "generateRandomDataInBuffer:length:", v10, v9))objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to generate initial plaintext"));
      -[OISFUCryptoOutputStream writeBuffer:size:](v8, "writeBuffer:size:", v10, v9);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->mIsClosed)
    -[OISFUCryptoOutputStream closeLocalStream](self, "closeLocalStream");

  v3.receiver = self;
  v3.super_class = (Class)OISFUCryptoOutputStream;
  -[OISFUCryptoOutputStream dealloc](&v3, sel_dealloc);
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  unsigned int *p_mCrc32;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (self->mIsClosed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Tried to write data to a closed SFUCryptoOutputStream."));
  v11 = 0;
  if (self->mComputeCrc32)
    p_mCrc32 = &self->mCrc32;
  else
    p_mCrc32 = 0;
  if (!-[OISFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:](self->mCryptor, "cryptDataFromBuffer:length:toStream:finished:crc32:error:", a3, a4, self->mBaseStream, 0, p_mCrc32, &v11))
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCA98];
    v10 = objc_msgSend(v11, "localizedDescription");
    objc_msgSend(v8, "raise:format:", v9, CFSTR("SFUCryptor failed. %@: %@"), v10, objc_msgSend(v11, "localizedFailureReason"));
  }
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3 whence:(int)a4
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUCryptoOutputStream seekToOffset:whence:]", *(_QWORD *)&a4);
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"), 121, 0, "SFUCryptoOutputStream cannot seek.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
}

- (int64_t)offset
{
  return -[SFUOutputStream offset](self->mBaseStream, "offset");
}

- (BOOL)canCreateInputStream
{
  return 0;
}

- (id)inputStream
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUCryptoOutputStream inputStream]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"), 133, 0, "SFUCryptoOutputStream cannot create an input stream.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (unsigned)crc32
{
  uint64_t v3;

  if (!self->mComputeCrc32 || !self->mIsClosed)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUCryptoOutputStream crc32]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoOutputStream.mm"), 138, 0, "Can't call -crc32 unless the stream is closed and was asked to compute the CRC32.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return self->mCrc32;
}

- (void)close
{
  -[OISFUCryptoOutputStream closeLocalStream](self, "closeLocalStream");
  -[SFUOutputStream close](self->mBaseStream, "close");
}

- (id)closeLocalStream
{
  OISFUCryptor *mCryptor;
  SFUOutputStream *mBaseStream;
  unsigned int *p_mCrc32;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  if (!self->mIsClosed)
  {
    self->mIsClosed = 1;
    v10 = 0;
    mBaseStream = self->mBaseStream;
    mCryptor = self->mCryptor;
    if (self->mComputeCrc32)
      p_mCrc32 = &self->mCrc32;
    else
      p_mCrc32 = 0;
    if (!-[OISFUCryptor cryptDataFromBuffer:length:toStream:finished:crc32:error:](mCryptor, "cryptDataFromBuffer:length:toStream:finished:crc32:error:", 0, 0, mBaseStream, 1, p_mCrc32, &v10))
    {
      v6 = (void *)MEMORY[0x24BDBCE88];
      v7 = *MEMORY[0x24BDBCA98];
      v8 = objc_msgSend(v10, "localizedDescription");
      objc_msgSend(v6, "raise:format:", v7, CFSTR("SFUCryptor failed. %@: %@"), v8, objc_msgSend(v10, "localizedFailureReason"));
    }
  }
  return self->mBaseStream;
}

@end
