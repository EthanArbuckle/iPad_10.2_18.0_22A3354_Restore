@implementation OISFUZipEntry

- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4
{
  OISFUZipEntry *v6;

  v6 = -[OISFUZipEntry init](self, "init");
  if (v6)
  {
    v6->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a4;
    if ((*((_WORD *)a3 + 2) & 1) != 0)
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Encrypted files are not supported"));
    -[OISFUZipEntry setCompressionFlags:](v6, "setCompressionFlags:", *((unsigned __int16 *)a3 + 3));
    v6->mCrc = *((_DWORD *)a3 + 3);
    v6->mCompressedSize = *((unsigned int *)a3 + 4);
    v6->mUncompressedSize = *((unsigned int *)a3 + 5);
    if (*((_WORD *)a3 + 15))
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("No multi-disk support"));
    v6->mOffset = *(unsigned int *)(a3 + 38);
  }
  return v6;
}

- (OISFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8
{
  OISFUZipEntry *v14;

  v14 = -[OISFUZipEntry init](self, "init");
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
  v3.super_class = (Class)OISFUZipEntry;
  -[OISFUZipEntry dealloc](&v3, sel_dealloc);
}

- (BOOL)isReadable
{
  int v3;

  v3 = -[SFUZipArchiveDataRepresentation isReadable](self->mArchiveDataRepresentation, "isReadable");
  if (v3)
    LOBYTE(v3) = -[OISFUZipEntry dataOffset](self, "dataOffset") != 0;
  return v3;
}

- (int64_t)dataLength
{
  return self->mUncompressedSize;
}

- (id)inputStream
{
  char *v3;
  OISFUZipInflateInputStream *v4;
  OISFUZipInflateInputStream *v5;
  int mCompressionMethod;
  int v7;
  OISFUZipInflateInputStream *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[OISFUZipEntry dataOffset](self, "dataOffset");
  if (v3)
  {
    if (self->mCryptoKey)
    {
      v3 = (char *)-[SFUZipArchiveDataRepresentation inputStreamWithOffset:length:](self->mArchiveDataRepresentation, "inputStreamWithOffset:length:", v3, self->mCompressedSize);
      v4 = -[OISFUCryptoInputStream initForDecryptionWithInputStream:key:]([OISFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v3, self->mCryptoKey);
      v5 = v4;
      mCompressionMethod = self->mCompressionMethod;
      if (mCompressionMethod == 1)
      {
        v9 = -[OISFUZipInflateInputStream initWithInput:]([OISFUZipInflateInputStream alloc], "initWithInput:", v4);

        return v9;
      }
      if (!mCompressionMethod)
        return v4;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipEntry inputStream]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"), 145, 0, "Bad compression method.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");

    }
    else
    {
      v7 = self->mCompressionMethod;
      if (v7 == 1)
      {
        v4 = -[OISFUZipInflateInputStream initWithOffset:end:uncompressedSize:crc:dataRepresentation:]([OISFUZipInflateInputStream alloc], "initWithOffset:end:uncompressedSize:crc:dataRepresentation:", v3, &v3[self->mCompressedSize], self->mUncompressedSize, self->mCrc, self->mArchiveDataRepresentation);
        return v4;
      }
      if (!v7)
        return (id)-[SFUZipArchiveDataRepresentation inputStreamWithOffset:length:](self->mArchiveDataRepresentation, "inputStreamWithOffset:length:", v3, -[OISFUZipEntry dataLength](self, "dataLength"));
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipEntry inputStream]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"), 158, 0, "Bad compression method.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      return 0;
    }
  }
  return v3;
}

- (id)data
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[OISFUZipEntry dataLength](self, "dataLength");
  if (v3 < 0)
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't allocate NSMutableData with size: %qu"), v3);
  v4 = objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v3);
  v5 = (void *)v4;
  if (!v4)
    v4 = +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't allocate NSMutableData with size: %qu"), v3);
  v6 = (void *)MEMORY[0x22E2DDB58](v4);
  if (objc_msgSend(-[OISFUZipEntry inputStream](self, "inputStream"), "readToBuffer:size:", objc_msgSend(v5, "mutableBytes"), v3) != v3)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Couldn't read data with size: %qu"), v3);
  objc_autoreleasePoolPop(v6);
  return v5;
}

- (void)copyToFile:(id)a3
{
  void *v5;
  FILE *v6;
  id v7;
  size_t v8;
  void *__ptr;

  v5 = (void *)MEMORY[0x22E2DDB58](self, a2);
  unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
  v6 = SFUFileOpen(a3, "w");
  v7 = -[OISFUDataRepresentation bufferedInputStream](self, "bufferedInputStream");
  while (1)
  {
    __ptr = 0;
    v8 = objc_msgSend(v7, "readToOwnBuffer:size:", &__ptr, -1);
    if (!v8)
      break;
    if (fwrite(__ptr, 1uLL, v8, v6) != v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "sfu_errnoRaise:format:", CFSTR("SFUFileWriteError"), CFSTR("Could not write"));
  }
  objc_msgSend(v7, "close");
  fclose(v6);
  objc_autoreleasePoolPop(v5);
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
  uint64_t v4;

  if (-[OISFUZipEntry isBackedByFile](self, "isBackedByFile"))
    return (id)-[SFUZipArchiveDataRepresentation path](self->mArchiveDataRepresentation, "path");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipEntry backingFilePath]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"), 231, 0, "-[SFUZipEntry backingFilePath] called on an entry that is not backed by file.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (unint64_t)backingFileDataOffset
{
  uint64_t v4;

  if (-[OISFUZipEntry isBackedByFile](self, "isBackedByFile"))
    return -[OISFUZipEntry dataOffset](self, "dataOffset");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipEntry backingFileDataOffset]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"), 240, 0, "-[SFUZipEntry backingFileDataOffset] called on an entry that is not backed by file.");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 uncompressed size"));
    v7 = a3 + 8;
    self->mUncompressedSize = *(_QWORD *)a3;
  }
  v8 = &a3[a4];
  if (self->mCompressedSize == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8)
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 compressed size"));
    self->mCompressedSize = *(_QWORD *)v7;
    v7 += 8;
  }
  if (self->mOffset == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8)
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Not enough room for Zip64 offset"));
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
  +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipCentralFileHeaderError"), CFSTR("Unsupported compression method"));
}

- (void)setCryptoKey:(id)a3
{
  id v5;

  v5 = a3;

  self->mCryptoKey = (OISFUCryptoKey *)a3;
}

- (void)setDataLength:(int64_t)a3
{
  uint64_t v3;

  if (self->mCryptoKey)
  {
    self->mHasEncodedLength = 0;
    self->mUncompressedSize = a3;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipEntry setDataLength:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"), 298, 0, "Tried to call -setDataLength: on an unencrypted zip entry.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
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
        +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEntryError"), CFSTR("Could not read local header."));
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
        mUncompressedSize = +[OISFUCryptoOutputStream encodedLengthForDataLength:key:](OISFUCryptoOutputStream, "encodedLengthForDataLength:key:", self->mUncompressedSize);
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
