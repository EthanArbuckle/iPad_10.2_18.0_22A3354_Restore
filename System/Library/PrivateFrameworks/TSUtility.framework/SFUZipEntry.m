@implementation SFUZipEntry

- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4
{
  SFUZipEntry *v6;

  v6 = -[SFUZipEntry init](self, "init");
  if (v6)
  {
    v6->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a4;
    if ((*((_WORD *)a3 + 2) & 1) != 0)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Encrypted files are not supported"));
    -[SFUZipEntry setCompressionFlags:](v6, "setCompressionFlags:", *((unsigned __int16 *)a3 + 3));
    v6->mCrc = *((_DWORD *)a3 + 3);
    v6->mCompressedSize = *((unsigned int *)a3 + 4);
    v6->mUncompressedSize = *((unsigned int *)a3 + 5);
    if (*((_WORD *)a3 + 15))
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("No multi-disk support"));
    v6->mOffset = *(unsigned int *)(a3 + 38);
  }
  return v6;
}

- (SFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8
{
  SFUZipEntry *v14;

  v14 = -[SFUZipEntry init](self, "init");
  if (v14)
  {
    v14->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a3;
    v14->mCompressionMethod = a4;
    v14->mCompressedSize = a5;
    v14->mUncompressedSize = a6;
    v14->mOffset = a7;
    v14->mCrc = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUZipEntry;
  -[SFUZipEntry dealloc](&v3, sel_dealloc);
}

- (BOOL)isReadable
{
  int v3;

  v3 = -[SFUZipArchiveDataRepresentation isReadable](self->mArchiveDataRepresentation, "isReadable");
  if (v3)
    LOBYTE(v3) = -[SFUZipEntry dataOffset](self, "dataOffset") != 0;
  return v3;
}

- (int64_t)dataLength
{
  return self->mUncompressedSize;
}

- (id)inputStream
{
  char *v3;
  SFUZipInflateInputStream *v4;
  SFUZipInflateInputStream *v5;
  int mCompressionMethod;
  int v7;
  SFUZipInflateInputStream *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = -[SFUZipEntry dataOffset](self, "dataOffset");
  if (v3)
  {
    if (self->mCryptoKey)
    {
      v3 = (char *)-[SFUZipArchiveDataRepresentation inputStreamWithOffset:length:](self->mArchiveDataRepresentation, "inputStreamWithOffset:length:", v3, self->mCompressedSize);
      v4 = -[SFUCryptoInputStream initForDecryptionWithInputStream:key:]([SFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v3, self->mCryptoKey);
      v5 = v4;
      mCompressionMethod = self->mCompressionMethod;
      if (mCompressionMethod == 1)
      {
        v9 = -[SFUZipInflateInputStream initWithInput:]([SFUZipInflateInputStream alloc], "initWithInput:", v4);

        return v9;
      }
      if (!mCompressionMethod)
        return v4;
      v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipEntry inputStream]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 162, CFSTR("Bad compression method."));
    }
    else
    {
      v7 = self->mCompressionMethod;
      if (v7 == 1)
      {
        v4 = -[SFUZipInflateInputStream initWithOffset:end:uncompressedSize:crc:dataRepresentation:]([SFUZipInflateInputStream alloc], "initWithOffset:end:uncompressedSize:crc:dataRepresentation:", v3, &v3[self->mCompressedSize], self->mUncompressedSize, self->mCrc, self->mArchiveDataRepresentation);
        return v4;
      }
      if (!v7)
        return (id)-[SFUZipArchiveDataRepresentation inputStreamWithOffset:length:](self->mArchiveDataRepresentation, "inputStreamWithOffset:length:", v3, -[SFUZipEntry dataLength](self, "dataLength"));
      v12 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipEntry inputStream]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 178, CFSTR("Bad compression method."));
      return 0;
    }
  }
  return v3;
}

- (id)data
{
  int64_t v3;
  void *v4;
  id v5;

  v3 = -[SFUZipEntry dataLength](self, "dataLength");
  if (v3 < 0)
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't allocate NSMutableData with size: %qu"), v3);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v3);
  if (!v4)
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't allocate NSMutableData with size: %qu"), v3);
  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (objc_msgSend(-[SFUZipEntry inputStream](self, "inputStream"), "readToBuffer:size:", objc_msgSend(v4, "mutableBytes"), v3) != v3)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't read data with size: %qu"), v3);

  return v4;
}

- (void)copyToFile:(id)a3
{
  id v5;
  FILE *v6;
  id v7;
  size_t v8;
  void *__ptr;

  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
  v6 = SFUFileOpen(a3, "w");
  v7 = -[SFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  while (1)
  {
    __ptr = 0;
    v8 = objc_msgSend(v7, "readToOwnBuffer:size:", &__ptr, -1);
    if (!v8)
      break;
    if (fwrite(__ptr, 1uLL, v8, v6) != v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not write"));
  }
  objc_msgSend(v7, "close");
  fclose(v6);

}

- (BOOL)isCompressed
{
  return self->mCompressionMethod != 0;
}

- (BOOL)isEncrypted
{
  return self->mCryptoKey != 0;
}

- (BOOL)isBackedByFile
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)backingFilePath
{
  id v4;
  uint64_t v5;

  if (-[SFUZipEntry isBackedByFile](self, "isBackedByFile"))
    return (id)-[SFUZipArchiveDataRepresentation path](self->mArchiveDataRepresentation, "path");
  v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipEntry backingFilePath]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 269, CFSTR("-[SFUZipEntry backingFilePath] called on an entry that is not backed by file."));
  return 0;
}

- (unint64_t)backingFileDataOffset
{
  id v4;
  uint64_t v5;

  if (-[SFUZipEntry isBackedByFile](self, "isBackedByFile"))
    return -[SFUZipEntry dataOffset](self, "dataOffset");
  v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipEntry backingFileDataOffset]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 280, CFSTR("-[SFUZipEntry backingFileDataOffset] called on an entry that is not backed by file."));
  return 0;
}

- (unsigned)crc
{
  return self->mCrc;
}

- (void)readZip64ExtraField:(const char *)a3 size:(unint64_t)a4
{
  const char *v7;
  const char *v8;

  v7 = a3;
  if (self->mUncompressedSize == 0xFFFFFFFF)
  {
    if ((uint64_t)a4 <= 7)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 uncompressed size"));
    v7 = a3 + 8;
    self->mUncompressedSize = *(_QWORD *)a3;
  }
  v8 = &a3[a4];
  if (self->mCompressedSize == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 compressed size"));
    self->mCompressedSize = *(_QWORD *)v7;
    v7 += 8;
  }
  if (self->mOffset == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 offset"));
    self->mOffset = *(_QWORD *)v7;
  }
}

- (void)setCompressionFlags:(unsigned __int16)a3
{
  if ((int)a3 <= 25450)
  {
    if (a3)
    {
      if (a3 != 8)
        goto LABEL_9;
LABEL_8:
      self->mCompressionMethod = 1;
      return;
    }
    goto LABEL_7;
  }
  if (a3 == 25452)
    goto LABEL_8;
  if (a3 == 25451)
  {
LABEL_7:
    self->mCompressionMethod = 0;
    return;
  }
LABEL_9:
  +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Unsupported compression method"));
}

- (void)setCryptoKey:(id)a3
{
  id v5;

  v5 = a3;

  self->mCryptoKey = (SFUCryptoKey *)a3;
}

- (void)setDataLength:(int64_t)a3
{
  id v3;
  uint64_t v4;

  if (self->mCryptoKey)
  {
    self->mHasEncodedLength = 0;
    self->mUncompressedSize = a3;
  }
  else
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipEntry setDataLength:]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 355, CFSTR("Tried to call -setDataLength: on an unencrypted zip entry."));
  }
}

- (BOOL)hasSameLocationAs:(id)a3
{
  int v5;
  unint64_t v6;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v5 = -[SFUZipArchiveDataRepresentation hasSameLocationAs:](self->mArchiveDataRepresentation, "hasSameLocationAs:", *((_QWORD *)a3 + 4));
    if (!v5)
      return v5;
    v6 = -[SFUZipEntry dataOffset](self, "dataOffset");
    if (v6 != objc_msgSend(a3, "dataOffset"))
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = self->mUncompressedSize == *((_QWORD *)a3 + 7);
  }
  return v5;
}

- (unint64_t)dataOffset
{
  void *v3;
  int *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t mOffset;
  int *v10;

  if (!self->mHasDataOffset)
  {
    objc_sync_enter(self);
    if (!self->mHasDataOffset)
    {
      v3 = (void *)-[SFUZipArchiveDataRepresentation bufferedInputStreamWithOffset:length:](self->mArchiveDataRepresentation, "bufferedInputStreamWithOffset:length:", self->mOffset, 30);
      v10 = 0;
      if (objc_msgSend(v3, "readToOwnBuffer:size:", &v10, 30) != 30)
        +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Could not read local header."));
      v4 = v10;
      v5 = *v10++;
      if (v5 != 67324752)
      {
        __dmb(0xBu);
        self->mHasDataOffset = 1;
        objc_msgSend(v3, "close");
        objc_sync_exit(self);
        return 0;
      }
      v6 = *((unsigned __int16 *)v4 + 13);
      v7 = *((unsigned __int16 *)v4 + 14);
      mOffset = self->mOffset;
      v10 = (int *)((char *)v4 + 30);
      self->mDataOffset = v6 + v7 + 30 + mOffset;
      __dmb(0xBu);
      self->mHasDataOffset = 1;
      objc_msgSend(v3, "close");
    }
    objc_sync_exit(self);
  }
  return self->mDataOffset;
}

- (unint64_t)calculateEncodedLength
{
  unint64_t mUncompressedSize;

  if (!self->mHasEncodedLength)
  {
    objc_sync_enter(self);
    if (!self->mHasEncodedLength)
    {
      if (self->mCryptoKey)
        mUncompressedSize = +[SFUCryptoOutputStream encodedLengthForDataLength:key:](SFUCryptoOutputStream, "encodedLengthForDataLength:key:", self->mUncompressedSize);
      else
        mUncompressedSize = self->mUncompressedSize;
      self->mEncodedLength = mUncompressedSize;
      __dmb(0xBu);
      self->mHasEncodedLength = 1;
    }
    objc_sync_exit(self);
  }
  return self->mEncodedLength;
}

@end
