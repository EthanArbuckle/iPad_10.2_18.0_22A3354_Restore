@implementation SFUFileDataRepresentation

- (SFUFileDataRepresentation)initWithPath:(id)a3
{
  return -[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, 0xFFFFFFFFLL, 0, 0);
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4
{
  return -[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, *(_QWORD *)&a4, 0, 0);
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  return -[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:](self, "initWithPath:sharedFileDescriptor:cryptoKey:dataLength:", a3, 0xFFFFFFFFLL, a4, a5);
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4 cryptoKey:(id)a5 dataLength:(int64_t)a6
{
  id v11;
  uint64_t v12;
  SFUFileDataRepresentation *v13;
  SFUCryptoKey *v14;

  if (!a3)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUFileDataRepresentation.m"), 50, CFSTR("Invalid parameter not satisfying: %s"), "path != nil");
  }
  v13 = -[SFUFileDataRepresentation init](self, "init");
  if (v13)
  {
    v13->mPath = (NSString *)a3;
    v14 = (SFUCryptoKey *)a5;
    v13->mCryptoKey = v14;
    if (v14)
      v13->mPlaintextDataLength = a6;
    v13->mSharedFd = a4;
    -[SFUFileDataRepresentation path](v13, "path");
  }
  return v13;
}

- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4
{
  return -[SFUFileDataRepresentation initWithCopyOfData:path:cryptoKey:](self, "initWithCopyOfData:path:cryptoKey:", a3, a4, 0);
}

- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4 cryptoKey:(id)a5
{
  id v9;
  void *v10;
  SFUFileOutputStream *v11;
  SFUFileOutputStream *v12;
  SFUFileOutputStream *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend((id)objc_msgSend(a3, "path"), "isEqualToString:", a4)
      || (objc_msgSend(a3, "isCryptoKeyIdenticalToKey:", a5) & 1) == 0)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD1460]);
      v10 = (void *)objc_msgSend(a3, "bufferedInputStream");
      unlink((const char *)objc_msgSend(a4, "fileSystemRepresentation"));
      v11 = -[SFUFileOutputStream initWithPath:]([SFUFileOutputStream alloc], "initWithPath:", a4);
      v12 = v11;
      if (a5)
      {
        v13 = -[SFUCryptoOutputStream initForEncryptionWithOutputStream:key:]([SFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:", v11, a5);

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
        -[SFUFileOutputStream writeBuffer:size:](v13, "writeBuffer:size:", v16, v15);
      }
      objc_msgSend(v10, "close");
      -[SFUFileOutputStream close](v13, "close");

    }
    return -[SFUFileDataRepresentation initWithPath:cryptoKey:dataLength:](self, "initWithPath:cryptoKey:dataLength:", a4, a5, objc_msgSend(a3, "dataLength"));
  }
  else
  {

    return 0;
  }
}

- (SFUFileDataRepresentation)initWithInputStream:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  SFUFileDataRepresentation *v8;
  SFUCryptoKey *v9;

  v8 = -[SFUFileDataRepresentation init](self, "init");
  if (v8)
  {
    v9 = (SFUCryptoKey *)a4;
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
  v3.super_class = (Class)SFUFileDataRepresentation;
  -[SFUFileDataRepresentation dealloc](&v3, sel_dealloc);
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
  -[SFUFileDataRepresentation readFileAttributes](self, "readFileAttributes");
  return self->mFileType;
}

- (void)setFileType:(unsigned int)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[SFUFileDataRepresentation path](self, "path");
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
  return -[SFUFileDataRepresentation path](self, "path") != 0;
}

- (int64_t)dataLength
{
  if (self->mCryptoKey)
    return self->mPlaintextDataLength;
  else
    return -[SFUFileDataRepresentation encodedLength](self, "encodedLength");
}

- (int64_t)encodedLength
{
  -[SFUFileDataRepresentation readFileAttributes](self, "readFileAttributes");
  return self->mFileLength;
}

- (BOOL)isEncrypted
{
  return self->mCryptoKey != 0;
}

- (BOOL)isCryptoKeyIdenticalToKey:(id)a3
{
  SFUCryptoKey *mCryptoKey;
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
  SFUFileInputStream *v4;
  SFUFileInputStream *v5;
  BOOL v6;
  SFUFileInputStream *v7;

  mSharedFd = self->mSharedFd;
  if (mSharedFd == -1 || pread(mSharedFd, 0, 0, 0) == -1)
    v4 = -[SFUFileInputStream initWithPath:offset:length:]([SFUFileInputStream alloc], "initWithPath:offset:length:", -[SFUFileDataRepresentation path](self, "path"), 0, -[SFUFileDataRepresentation encodedLength](self, "encodedLength"));
  else
    v4 = -[SFUFileInputStream initWithFileDescriptor:offset:length:]([SFUFileInputStream alloc], "initWithFileDescriptor:offset:length:", SFUDup(self->mSharedFd), 0, -[SFUFileDataRepresentation encodedLength](self, "encodedLength"));
  v5 = v4;
  if (self->mCryptoKey)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = -[SFUCryptoInputStream initForDecryptionWithInputStream:key:]([SFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v4, self->mCryptoKey);

    v5 = v7;
  }
  return v5;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[SFUFileDataRepresentation path](self, "path"), "isEqualToString:", objc_msgSend(a3, "path"));
  else
    return 0;
}

- (void)deleteFileWhenDone
{
  self->mDeleteFileWhenDone = 1;
}

- (CGDataProvider)cgDataProvider
{
  objc_super v3;

  if (!self->mCryptoKey)
    return CGDataProviderCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[SFUFileDataRepresentation path](self, "path")));
  v3.receiver = self;
  v3.super_class = (Class)SFUFileDataRepresentation;
  return -[SFUDataRepresentation cgDataProvider](&v3, sel_cgDataProvider);
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
      v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", -[SFUFileDataRepresentation path](self, "path"), 0);
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
