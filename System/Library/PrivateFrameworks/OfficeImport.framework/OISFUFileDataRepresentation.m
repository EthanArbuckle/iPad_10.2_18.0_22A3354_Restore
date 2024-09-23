@implementation OISFUFileDataRepresentation

- (OISFUFileDataRepresentation)initWithPath:(id)a3
{
  return -[OISFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, 0xFFFFFFFFLL, 0, 0);
}

- (OISFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4
{
  return -[OISFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, *(_QWORD *)&a4, 0, 0);
}

- (OISFUFileDataRepresentation)initWithPath:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  return -[OISFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, 0xFFFFFFFFLL, a4, a5);
}

- (OISFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4 cryptoKey:(id)a5 dataLength:(int64_t)a6
{
  uint64_t v11;
  OISFUFileDataRepresentation *v12;
  OISFUCryptoKey *v13;

  if (!a3)
  {
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUFileDataRepresentation.m"), 48, 0, "Invalid parameter not satisfying: %{public}s", "path != nil");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v12 = -[OISFUFileDataRepresentation init](self, "init");
  if (v12)
  {
    v12->mPath = (NSString *)a3;
    v13 = (OISFUCryptoKey *)a5;
    v12->mCryptoKey = v13;
    if (v13)
      v12->mPlaintextDataLength = a6;
    v12->mSharedFd = a4;
    -[OISFUFileDataRepresentation path](v12, "path");
  }
  return v12;
}

- (OISFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4
{
  return -[OISFUFileDataRepresentation initWithCopyOfData:path:cryptoKey:](self, "initWithCopyOfData:path:cryptoKey:", a3, a4, 0);
}

- (OISFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4 cryptoKey:(id)a5
{
  void *v9;
  void *v10;
  OISFUFileOutputStream *v11;
  OISFUFileOutputStream *v12;
  OISFUFileOutputStream *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend((id)objc_msgSend(a3, "path"), "isEqualToString:", a4)
      || (objc_msgSend(a3, "isCryptoKeyIdenticalToKey:", a5) & 1) == 0)
    {
      v9 = (void *)MEMORY[0x22E2DDB58]();
      v10 = (void *)objc_msgSend(a3, "bufferedInputStream");
      unlink((const char *)objc_msgSend(a4, "fileSystemRepresentation"));
      v11 = -[OISFUFileOutputStream initWithPath:]([OISFUFileOutputStream alloc], "initWithPath:", a4);
      v12 = v11;
      if (a5)
      {
        v13 = -[OISFUCryptoOutputStream initForEncryptionWithOutputStream:key:]([OISFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:", v11, a5);

      }
      else
      {
        v13 = v11;
      }
      while (1)
      {
        v16 = 0;
        v15 = objc_msgSend(v10, "readToOwnBuffer:size:", &v16, -1);
        if (!v15)
          break;
        -[OISFUFileOutputStream writeBuffer:size:](v13, "writeBuffer:size:", v16, v15);
      }
      objc_msgSend(v10, "close");
      -[OISFUFileOutputStream close](v13, "close");

      objc_autoreleasePoolPop(v9);
    }
    return -[OISFUFileDataRepresentation initWithPath:cryptoKey:dataLength:](self, "initWithPath:cryptoKey:dataLength:", a4, a5, objc_msgSend(a3, "dataLength"));
  }
  else
  {

    return 0;
  }
}

- (OISFUFileDataRepresentation)initWithInputStream:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  OISFUFileDataRepresentation *v8;
  OISFUCryptoKey *v9;

  v8 = -[OISFUFileDataRepresentation init](self, "init");
  if (v8)
  {
    v9 = (OISFUCryptoKey *)a4;
    v8->mCryptoKey = v9;
    if (v9)
      v8->mPlaintextDataLength = a5;
    v8->mInputStream = (SFUInputStream *)a3;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mDeleteFileWhenDone && self->mPath)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", self->mPath, 0);

  v3.receiver = self;
  v3.super_class = (Class)OISFUFileDataRepresentation;
  -[OISFUFileDataRepresentation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<SFUFileDataRepresentation %p: path %@>"), self, self->mPath);
}

- (id)path
{
  return self->mPath;
}

- (unsigned)fileType
{
  -[OISFUFileDataRepresentation readFileAttributes](self, "readFileAttributes");
  return self->mFileType;
}

- (void)setFileType:(unsigned int)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[OISFUFileDataRepresentation path](self, "path");
  objc_sync_enter(self);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", a3);
    v7 = objc_alloc(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v6, *MEMORY[0x24BDD0C80], 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "setAttributes:ofItemAtPath:error:", v8, v5, 0);

  }
  self->mFileType = a3;
  objc_sync_exit(self);
}

- (BOOL)isReadable
{
  return -[OISFUFileDataRepresentation path](self, "path") != 0;
}

- (int64_t)dataLength
{
  if (self->mCryptoKey)
    return self->mPlaintextDataLength;
  else
    return -[OISFUFileDataRepresentation encodedLength](self, "encodedLength");
}

- (int64_t)encodedLength
{
  -[OISFUFileDataRepresentation readFileAttributes](self, "readFileAttributes");
  return self->mFileLength;
}

- (BOOL)isEncrypted
{
  return self->mCryptoKey != 0;
}

- (BOOL)isCryptoKeyIdenticalToKey:(id)a3
{
  OISFUCryptoKey *mCryptoKey;
  BOOL result;

  mCryptoKey = self->mCryptoKey;
  result = ((unint64_t)a3 | (unint64_t)mCryptoKey) == 0;
  if (a3)
  {
    if (mCryptoKey)
      return objc_msgSend(a3, "isEqual:", mCryptoKey);
  }
  return result;
}

- (id)inputStream
{
  int mSharedFd;
  OISFUFileInputStream *v4;
  OISFUFileInputStream *v5;
  BOOL v6;
  OISFUFileInputStream *v7;

  mSharedFd = self->mSharedFd;
  if (mSharedFd == -1 || pread(mSharedFd, 0, 0, 0) == -1)
    v4 = -[OISFUFileInputStream initWithPath:offset:length:]([OISFUFileInputStream alloc], "initWithPath:offset:length:", -[OISFUFileDataRepresentation path](self, "path"), 0, -[OISFUFileDataRepresentation encodedLength](self, "encodedLength"));
  else
    v4 = -[OISFUFileInputStream initWithFileDescriptor:offset:length:]([OISFUFileInputStream alloc], "initWithFileDescriptor:offset:length:", SFUDup(self->mSharedFd), 0, -[OISFUFileDataRepresentation encodedLength](self, "encodedLength"));
  v5 = v4;
  if (self->mCryptoKey)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = -[OISFUCryptoInputStream initForDecryptionWithInputStream:key:]([OISFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v4, self->mCryptoKey);

    v5 = v7;
  }
  return v5;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[OISFUFileDataRepresentation path](self, "path"), "isEqualToString:", objc_msgSend(a3, "path"));
  else
    return 0;
}

- (void)deleteFileWhenDone
{
  self->mDeleteFileWhenDone = 1;
}

- (void)readFileAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->mHasFileAttributes)
  {
    objc_sync_enter(self);
    if (!self->mHasFileAttributes)
    {
      v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", -[OISFUFileDataRepresentation path](self, "path"), 0);
      v4 = v3;
      if (v3)
      {
        v5 = (void *)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0D08]);
        if (v5)
          self->mFileLength = objc_msgSend(v5, "unsignedLongLongValue");
        v6 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD0C80]);
        if (v6)
          self->mFileType = objc_msgSend(v6, "unsignedIntValue");
        __dmb(0xBu);
        self->mHasFileAttributes = 1;
      }
    }
    objc_sync_exit(self);
  }
}

@end
