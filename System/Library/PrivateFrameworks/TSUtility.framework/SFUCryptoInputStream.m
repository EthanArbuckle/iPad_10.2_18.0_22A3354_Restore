@implementation SFUCryptoInputStream

- (id)initForDecryptionWithInputStream:(id)a3 key:(id)a4
{
  SFUCryptoInputStream *v6;
  unsigned int v7;
  char *v8;
  SFUCryptor *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = -[SFUCryptoInputStream init](self, "init");
  if (v6)
  {
    v6->mBaseStream = (SFUInputStream *)a3;
    v7 = +[SFUCryptoUtils ivLengthForKey:](SFUCryptoUtils, "ivLengthForKey:", a4);
    v8 = (char *)v11 - ((v7 + 15) & 0x1FFFFFFF0);
    if (-[SFUInputStream readToBuffer:size:](v6->mBaseStream, "readToBuffer:size:", v8, v7) != v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to read IV"));
    v9 = -[SFUCryptor initWithKey:operation:iv:ivLength:]([SFUCryptor alloc], "initWithKey:operation:iv:ivLength:", a4, 1, v8, v7);
    v6->mCryptor = v9;
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to create SFUCryptor"));
    if (v7)
    {
      if (-[SFUCryptoInputStream readToBuffer:size:](v6, "readToBuffer:size:", v8, v7) != v7)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Failed to read initial ciphertext"));
      v6->mOffset = 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUCryptoInputStream;
  -[SFUCryptoInputStream dealloc](&v3, sel_dealloc);
}

- (int64_t)offset
{
  return self->mOffset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  id v10;

  v9 = 0;
  v10 = 0;
  if (!-[SFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:](self->mCryptor, "cryptDataFromStream:toBuffer:length:bytesRead:error:", self->mBaseStream, a3, a4, &v9, &v10))
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCA98];
    v7 = objc_msgSend(v10, "localizedDescription");
    objc_msgSend(v5, "raise:format:", v6, CFSTR("SFUCryptor failed. %@: %@"), v7, objc_msgSend(v10, "localizedFailureReason"));
  }
  result = v9;
  self->mOffset += v9;
  return result;
}

- (BOOL)canSeek
{
  return 0;
}

- (void)seekToOffset:(int64_t)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUCryptoInputStream seekToOffset:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptoInputStream.mm"), 96, CFSTR("SFUCryptoInputStream cannot seek."));
}

- (void)disableSystemCaching
{
  -[SFUInputStream disableSystemCaching](self->mBaseStream, "disableSystemCaching");
}

- (void)enableSystemCaching
{
  -[SFUInputStream enableSystemCaching](self->mBaseStream, "enableSystemCaching");
}

- (void)close
{
  -[SFUInputStream close](self->mBaseStream, "close");
}

- (id)closeLocalStream
{
  return self->mBaseStream;
}

@end
