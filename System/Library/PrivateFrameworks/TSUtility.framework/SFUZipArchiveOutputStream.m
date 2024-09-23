@implementation SFUZipArchiveOutputStream

+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3
{
  const char *v3;

  v3 = (const char *)objc_msgSend(a3, "UTF8String");
  if (v3)
    v3 = (const char *)strlen(v3);
  return (unint64_t)(v3 + 30);
}

- (SFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  SFUZipArchiveOutputStream *v8;
  char *v9;

  v8 = -[SFUZipArchiveOutputStream init](self, "init");
  if (v8)
  {
    v8->mOutputStream = (SFUMoveableFileOutputStream *)a3;
    v8->mCryptoKey = (SFUCryptoKey *)a4;
    v8->mPassphraseHint = (NSData *)+[SFUCryptoUtils encodePassphraseHint:](SFUCryptoUtils, "encodePassphraseHint:", a5);
    v8->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8->mFreeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = (char *)malloc_type_malloc(0x38uLL, 0xA9B0C0A4uLL);
    v8->mBuffer = v9;
    if (!v9)
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Initialization error. Could not allocate record buffer of size: %zu"), 56);
  }
  return v8;
}

- (SFUZipArchiveOutputStream)initWithPath:(id)a3
{
  return -[SFUZipArchiveOutputStream initWithPath:cryptoKey:passphraseHint:](self, "initWithPath:cryptoKey:passphraseHint:", a3, 0, 0);
}

- (SFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  return -[SFUZipArchiveOutputStream initWithOutputStream:cryptoKey:passphraseHint:](self, "initWithOutputStream:cryptoKey:passphraseHint:", -[SFUMoveableFileOutputStream initWithPath:]([SFUMoveableFileOutputStream alloc], "initWithPath:", a3), a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  free(self->mBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchiveOutputStream;
  -[SFUZipArchiveOutputStream dealloc](&v3, sel_dealloc);
}

- (void)beginEntryWithName:(id)a3 isCompressed:(BOOL)a4 uncompressedSize:(unint64_t)a5
{
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  SFUZipOutputEntry *v11;
  const char *v12;
  size_t v13;
  SFUZipOutputEntry *mCurrentEntry;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  SFUZipOutputEntry *v25;
  SFUMoveableFileOutputStream *v26;
  SFUMoveableFileOutputStream *v27;

  v6 = a4;
  if (!self->mOutputStream)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 177, CFSTR("Zip output stream is closed."));
  }
  -[SFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  if (self->mCryptoKey)
    a5 = +[SFUCryptoOutputStream encodedLengthForDataLength:key:](SFUCryptoOutputStream, "encodedLengthForDataLength:key:", a5);
  v11 = objc_alloc_init(SFUZipOutputEntry);
  self->mCurrentEntry = v11;
  -[NSMutableArray addObject:](self->mEntries, "addObject:", v11);

  v12 = (const char *)objc_msgSend(a3, "UTF8String");
  self->mCurrentEntry->name = (NSString *)objc_msgSend(a3, "copy");
  if (v12)
    v13 = strlen(v12);
  else
    v13 = 0;
  self->mCurrentEntry->utf8NameLength = v13;
  self->mCurrentEntry->isCompressed = v6;
  self->mCurrentEntry->isEncrypted = self->mCryptoKey != 0;
  self->mCurrentEntry->time = SFUZipCurrentDosTime();
  self->mCurrentEntry->is64Bit = a5 > 0xFFC2F6FF;
  if (!v6 && -[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
  {
    mCurrentEntry = self->mCurrentEntry;
    v15 = mCurrentEntry->utf8NameLength + 30;
    v16 = mCurrentEntry->is64Bit ? 20 : 0;
    v17 = v15 + v16;
    if (!__CFADD__(a5, v15 + v16))
    {
      v18 = -[NSMutableArray count](self->mFreeList, "count");
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = 0;
        v22 = v17 + a5;
        do
        {
          v23 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", v20);
          v24 = *(_QWORD *)(v23 + 16);
          if (v24 == v22)
          {
            v21 = (_QWORD *)v23;
            goto LABEL_25;
          }
          if (v24 >= v22 + 47 && (!v21 || v24 < v21[2]))
            v21 = (_QWORD *)v23;
          ++v20;
        }
        while (v19 != v20);
        if (!v21)
          goto LABEL_26;
LABEL_25:
        -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v21[1], 0);
        self->mCurrentFreeSpace = (SFUZipFreeSpaceEntry *)v21;
      }
    }
  }
LABEL_26:
  v25 = self->mCurrentEntry;
  if (!self->mCurrentFreeSpace)
    self->mLastEntryInFile = v25;
  self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                            + -[SFUZipArchiveOutputStream writeLocalFileHeaderForEntry:](self, "writeLocalFileHeaderForEntry:", v25);
  self->mCurrentEntry->crc = crc32(0, 0, 0);
  if (self->mCurrentEntry->isEncrypted)
  {
    v26 = -[SFUCryptoOutputStream initForEncryptionWithOutputStream:key:computeCrc32:]([SFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:computeCrc32:", self->mOutputStream, self->mCryptoKey, 1);
    if (v6)
    {
LABEL_30:
      v27 = v26;
      self->mEntryOutputStream = (SFUOutputStream *)-[SFUZipDeflateOutputStream initWithOutputStream:]([SFUZipDeflateOutputStream alloc], "initWithOutputStream:", v26);

      return;
    }
  }
  else
  {
    v26 = self->mOutputStream;
    if (v6)
      goto LABEL_30;
  }
  self->mEntryOutputStream = (SFUOutputStream *)v26;
}

- (void)beginUnknownSizeEntryWithName:(id)a3 isCompressed:(BOOL)a4
{
  -[SFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:](self, "beginEntryWithName:isCompressed:uncompressedSize:", a3, a4, -1);
}

- (id)beginUncompressedUnknownSizeEntryWithName:(id)a3
{
  SFUOffsetOutputStream *v4;
  SFUOffsetOutputStream *v5;

  -[SFUZipArchiveOutputStream beginUnknownSizeEntryWithName:isCompressed:](self, "beginUnknownSizeEntryWithName:isCompressed:", a3, 0);
  self->mCurrentEntry->isWrittenDirectlyToFile = 1;
  v4 = -[SFUOffsetOutputStream initWithOutputStream:]([SFUOffsetOutputStream alloc], "initWithOutputStream:", self->mEntryOutputStream);
  if (self->mCurrentEntry->isEncrypted)
  {
    v5 = -[SFUCryptoOutputStream initForEncryptionWithOutputStream:key:computeCrc32:]([SFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:computeCrc32:", v4, self->mCryptoKey, 1);

    v4 = v5;
  }
  return v4;
}

- (void)setCrc32ForCurrentEntry:(unsigned int)a3
{
  SFUZipOutputEntry *mCurrentEntry;

  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry)
  {
    if (mCurrentEntry->isWrittenDirectlyToFile)
      mCurrentEntry->crc = a3;
  }
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  SFUZipOutputEntry *mCurrentEntry;
  id v10;
  uint64_t v11;

  if (self->mCurrentEntry)
  {
    if (!self->mOutputStream)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream writeBuffer:size:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 326, CFSTR("Zip output stream is closed."));
    }
    -[SFUOutputStream writeBuffer:size:](self->mEntryOutputStream, "writeBuffer:size:", a3, a4);
    self->mCurrentEntry->uncompressedSize += a4;
    mCurrentEntry = self->mCurrentEntry;
    if (!mCurrentEntry->isEncrypted)
    {
      if (a4 >= 0xFFFFFFFF)
      {
        v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream writeBuffer:size:]");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 337, CFSTR("overflow in writeBuffer:"));
        mCurrentEntry = self->mCurrentEntry;
      }
      self->mCurrentEntry->crc = crc32(mCurrentEntry->crc, (const Bytef *)a3, a4);
    }
  }
  else
  {
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("-writeBuffer:size: called when current entry is nil"));
  }
}

- (BOOL)canRemoveEntryWithName:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  SFUZipOutputEntry *v9;
  BOOL v10;
  id v12;
  uint64_t v13;

  v5 = -[NSMutableArray count](self->mEntries, "count");
  if (!v5)
    goto LABEL_14;
  v6 = v5;
  v7 = 0;
  do
  {
    v8 = -[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v7);
    if (objc_msgSend(*(id *)(v8 + 8), "isEqualToString:", a3))
      v9 = (SFUZipOutputEntry *)v8;
    else
      v9 = 0;
    ++v7;
    if (v9)
      v10 = 1;
    else
      v10 = v7 >= v6;
  }
  while (!v10);
  if (v9)
    return v9 == self->mLastEntryInFile || v9->compressedSize + v9->utf8NameLength > 0x10;
LABEL_14:
  v12 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream canRemoveEntryWithName:]");
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 357, CFSTR("Can't find entry named: %@"), a3);
  return 0;
}

- (void)removeEntryWithName:(id)a3
{
  id v5;
  uint64_t v6;
  SFUZipOutputEntry *mCurrentEntry;
  SFUZipOutputEntry *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  SFUZipOutputEntry *v13;
  SFUZipFreeSpaceEntry *v14;
  SFUZipFreeSpaceEntry *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  SFUZipOutputEntry *v22;
  char v23;

  if (!self->mOutputStream)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream removeEntryWithName:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 366, CFSTR("Zip output stream is closed."));
  }
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry && -[NSString isEqualToString:](mCurrentEntry->name, "isEqualToString:", a3))
  {
    v8 = self->mCurrentEntry;
    -[SFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  }
  else
  {
    v9 = -[NSMutableArray count](self->mEntries, "count");
    if (!v9)
    {
LABEL_19:
      v17 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream removeEntryWithName:]");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 388, CFSTR("Can't find entry named: %@"), a3);
      return;
    }
    v10 = v9;
    v11 = 0;
    do
    {
      v8 = (SFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v11);
      if (!-[NSString isEqualToString:](v8->name, "isEqualToString:", a3))
        v8 = 0;
      ++v11;
      if (v8)
        v12 = 1;
      else
        v12 = v11 >= v10;
    }
    while (!v12);
  }
  if (!v8)
    goto LABEL_19;
  v13 = v8;
  -[NSMutableArray removeObject:](self->mEntries, "removeObject:", v8);
  if (v8 == self->mLastEntryInFile)
  {
    v19 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
    -[SFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:", v8->offset);
    if (v19 < (int64_t)v8->offset)
      -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v19, 0);
    self->mLastEntryInFile = 0;
    v20 = -[NSMutableArray count](self->mEntries, "count");
    if (!self->mLastEntryInFile && v20)
    {
      v21 = v20 - 1;
      while (1)
      {
        v22 = (SFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v21);
        if (v22->compressedSize + v22->compressedDataOffset == v8->offset)
          break;
        v12 = v21-- != 0;
        v23 = v12;
        if (self->mLastEntryInFile || (v23 & 1) == 0)
          return;
      }
      self->mLastEntryInFile = v22;
    }
  }
  else
  {
    v14 = objc_alloc_init(SFUZipFreeSpaceEntry);
    v15 = v14;
    v14->offset = v8->offset;
    v16 = v8->compressedDataOffset - v8->offset + v8->compressedSize;
    v14->length = v16;
    if (v16 >= 0x2F)
    {
      -[NSMutableArray addObject:](self->mFreeList, "addObject:", v14);

      self->mFreeBytes += v15->length;
    }
    else
    {

      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Removing entry named %@ produced free space that is too small."), a3);
    }
  }
}

- (void)setEncryptedDocumentUuid:(id)a3
{
  id v5;

  if (!self->mOutputStream)
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Tried to set encrypted document UUID after writing finished."));
  v5 = a3;

  self->mEncryptedDocumentUuid = (NSData *)a3;
}

- (void)close
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  SFUZipOutputEntry *v10;
  void *v11;
  const char *v12;
  size_t v13;
  unint64_t i;
  uint64_t v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!self->mOutputStream)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream close]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 462, CFSTR("Zip output stream is closed."));
  }
  -[SFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  v5 = -[NSMutableArray count](self->mFreeList, "count");
  if (v5)
  {
    v6 = v5;
    v7 = malloc_type_calloc(1uLL, 0x40000uLL, 0x8D123391uLL);
    v8 = 0;
    do
    {
      v9 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", v8);
      -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", *(_QWORD *)(v9 + 8), 0);
      v10 = objc_alloc_init(SFUZipOutputEntry);
      self->mCurrentEntry = v10;
      -[NSMutableArray addObject:](self->mEntries, "addObject:", v10);

      v11 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".iWTrash/%08X"), ++v8);
      v12 = (const char *)objc_msgSend(v11, "UTF8String");
      self->mCurrentEntry->name = (NSString *)objc_msgSend(v11, "copy");
      if (v12)
        v13 = strlen(v12);
      else
        v13 = 0;
      self->mCurrentEntry->utf8NameLength = v13;
      self->mCurrentEntry->isCompressed = 0;
      self->mCurrentEntry->isEncrypted = 0;
      self->mCurrentEntry->time = SFUZipCurrentDosTime();
      self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                                + -[SFUZipArchiveOutputStream writeLocalFileHeaderForEntry:](self, "writeLocalFileHeaderForEntry:", self->mCurrentEntry);
      self->mCurrentEntry->crc = crc32(0, 0, 0);
      self->mEntryOutputStream = (SFUOutputStream *)self->mOutputStream;
      for (i = *(_QWORD *)(v9 + 16) - self->mCurrentEntry->compressedDataOffset + self->mCurrentEntry->offset; i; i -= v15)
      {
        if (i >= 0x40000)
          v15 = 0x40000;
        else
          v15 = i;
        -[SFUZipArchiveOutputStream writeBuffer:size:](self, "writeBuffer:size:", v7, v15);
      }
      -[SFUZipArchiveOutputStream finishEntry](self, "finishEntry");
    }
    while (v8 != v6);
    if (v7)
      free(v7);
  }
  v16 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
  -[NSMutableArray sortUsingSelector:](self->mEntries, "sortUsingSelector:", sel_compareByOffset_);
  v17 = (void *)-[NSMutableArray objectEnumerator](self->mEntries, "objectEnumerator");
  v18 = objc_msgSend(v17, "nextObject");
  if (v18)
    -[SFUZipArchiveOutputStream writeCentralFileHeaderUsingEntry:isFirstEntry:](self, "writeCentralFileHeaderUsingEntry:isFirstEntry:", v18, 1);
  v19 = objc_msgSend(v17, "nextObject");
  if (v19)
  {
    v20 = v19;
    do
    {
      -[SFUZipArchiveOutputStream writeCentralFileHeaderUsingEntry:isFirstEntry:](self, "writeCentralFileHeaderUsingEntry:isFirstEntry:", v20, 0);
      v20 = objc_msgSend(v17, "nextObject");
    }
    while (v20);
  }
  -[SFUZipArchiveOutputStream writeEndOfCentralDirectoryWithOffset:](self, "writeEndOfCentralDirectoryWithOffset:", v16);

  self->mOutputStream = 0;
}

- (void)moveToPath:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  if (!self->mOutputStream)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream moveToPath:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 545, CFSTR("Zip output stream is closed."));
  }
  -[SFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  v7 = -[SFUMoveableFileOutputStream path](self->mOutputStream, "path");
  if (!-[SFUMoveableFileOutputStream moveToPath:](self->mOutputStream, "moveToPath:", a3))
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Could not move output stream from %@ to %@"), v7, a3);

}

- (id)entryNames
{
  uint64_t v3;
  void *v4;
  uint64_t i;

  v3 = -[NSMutableArray count](self->mEntries, "count");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
      objc_msgSend(v4, "addObject:", *(_QWORD *)(-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", i) + 8));
  }
  return v4;
}

- (id)entriesAtPath:(id)a3
{
  void *v5;
  SFUZipArchiveFileDataRepresentation *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  SFUZipEntry *v10;
  SFUZipEntry *v11;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableArray count](self->mEntries, "count"));
  v6 = -[SFUZipArchiveFileDataRepresentation initWithPath:]([SFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
  v7 = (void *)-[NSMutableArray objectEnumerator](self->mEntries, "objectEnumerator");
  v8 = objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = v8;
    do
    {
      v10 = -[SFUZipEntry initWithDataRepresentation:compressionMethod:compressedSize:uncompressedSize:offset:crc:]([SFUZipEntry alloc], "initWithDataRepresentation:compressionMethod:compressedSize:uncompressedSize:offset:crc:", v6, *(unsigned __int8 *)(v9 + 24), *(_QWORD *)(v9 + 32), *(_QWORD *)(v9 + 40), *(_QWORD *)(v9 + 48), *(unsigned int *)(v9 + 64));
      v11 = v10;
      if (*(_BYTE *)(v9 + 25))
        -[SFUZipEntry setCryptoKey:](v10, "setCryptoKey:", self->mCryptoKey);
      objc_msgSend(v5, "setObject:forKey:", v11, *(_QWORD *)(v9 + 8));

      v9 = objc_msgSend(v7, "nextObject");
    }
    while (v9);
  }

  return v5;
}

- (void)flush
{
  -[SFUMoveableFileOutputStream flush](self->mOutputStream, "flush");
}

- (unint64_t)freeBytes
{
  return self->mFreeBytes;
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->mEntries, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->mFreeList, "removeAllObjects");
  self->mCurrentEntry = 0;
  self->mLastEntryInFile = 0;
  self->mCurrentFreeSpace = 0;
  self->mFreeBytes = 0;

  self->mEntryOutputStream = 0;
  -[SFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:", 0);
}

- (unsigned)crc32ForEntry:(id)a3
{
  NSMutableArray *mEntries;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SFUZipOutputEntry *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mEntries = self->mEntries;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEntries, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mEntries);
        v10 = *(SFUZipOutputEntry **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (-[NSString isEqualToString:](v10->name, "isEqualToString:", a3))
        {
          if (v10 == self->mCurrentEntry)
            LODWORD(v6) = 0;
          else
            LODWORD(v6) = v10->crc;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEntries, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (void)finishEntry
{
  SFUZipOutputEntry *mCurrentEntry;
  SFUOutputStream *mEntryOutputStream;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  SFUZipOutputEntry *v9;
  SFUBufferedInputStream *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  SFUZipOutputEntry *v14;
  unint64_t v15;
  SFUZipFreeSpaceEntry *mCurrentFreeSpace;
  unint64_t length;
  unint64_t v18;
  char *mBuffer;
  SFUZipOutputEntry *v20;
  _BOOL4 is64Bit;
  unint64_t compressedSize;
  uint64_t v23;
  SFUZipFreeSpaceEntry *v24;
  char *v25;
  SFUZipOutputEntry *v26;
  unint64_t uncompressedSize;
  unint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  SFUZipOutputEntry *v32;
  id v33;
  uint64_t v34;
  char *v35;
  Bytef *buf;

  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry)
  {
    mEntryOutputStream = self->mEntryOutputStream;
    if (mCurrentEntry->isCompressed)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream(Private) finishEntry]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 676, CFSTR("Wrong output stream for compressed entry."));
      }
      mEntryOutputStream = (SFUOutputStream *)-[SFUOutputStream closeLocalStream](self->mEntryOutputStream, "closeLocalStream");
      mCurrentEntry = self->mCurrentEntry;
    }
    if (mCurrentEntry->isEncrypted)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream(Private) finishEntry]");
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 687, CFSTR("Wrong output stream type for encrypted entry."));
      }
      -[SFUOutputStream closeLocalStream](mEntryOutputStream, "closeLocalStream");
      self->mCurrentEntry->crc = -[SFUOutputStream crc32](mEntryOutputStream, "crc32");
    }

    self->mEntryOutputStream = 0;
    self->mCurrentEntry->compressedSize = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset")
                                        - self->mCurrentEntry->compressedDataOffset;
    v9 = self->mCurrentEntry;
    if (v9->isWrittenDirectlyToFile)
    {
      v9->uncompressedSize = v9->compressedSize;
      if (!self->mCurrentEntry->crc)
      {
        if (!-[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
          +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but output stream cannot be seeked for CRC calculation."));
        if (!-[SFUMoveableFileOutputStream canCreateInputStream](self->mOutputStream, "canCreateInputStream"))
          +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but output stream cannot be read for CRC calculation."));
        v10 = -[SFUBufferedInputStream initWithStream:]([SFUBufferedInputStream alloc], "initWithStream:", -[SFUMoveableFileOutputStream inputStream](self->mOutputStream, "inputStream"));
        if (!-[SFUBufferedInputStream canSeek](v10, "canSeek"))
        {
          -[SFUBufferedInputStream close](v10, "close");

          +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but input stream cannot be seeked for CRC calculation."));
          v10 = 0;
        }
        -[SFUBufferedInputStream seekToOffset:](v10, "seekToOffset:", self->mCurrentEntry->compressedDataOffset);
        buf = 0;
        v11 = -[SFUBufferedInputStream readToOwnBuffer:size:](v10, "readToOwnBuffer:size:", &buf, 0xFFFFFFFFLL);
        if (v11)
        {
          LODWORD(v12) = v11;
          do
          {
            self->mCurrentEntry->crc = crc32(self->mCurrentEntry->crc, buf, v12);
            buf = 0;
            v12 = -[SFUBufferedInputStream readToOwnBuffer:size:](v10, "readToOwnBuffer:size:", &buf, 0xFFFFFFFFLL);
          }
          while (v12);
        }
        -[SFUBufferedInputStream close](v10, "close", v12);

      }
    }
    if (!-[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
    {
      mBuffer = self->mBuffer;
      *(_DWORD *)mBuffer = *(_DWORD *)"PK\a\b";
      *((_DWORD *)mBuffer + 1) = self->mCurrentEntry->crc;
      v20 = self->mCurrentEntry;
      is64Bit = v20->is64Bit;
      compressedSize = v20->compressedSize;
      if (is64Bit)
      {
        *((_QWORD *)mBuffer + 1) = compressedSize;
        *((_QWORD *)mBuffer + 2) = self->mCurrentEntry->uncompressedSize;
        v23 = 24;
      }
      else
      {
        *((_DWORD *)mBuffer + 2) = compressedSize;
        *((_DWORD *)mBuffer + 3) = self->mCurrentEntry->uncompressedSize;
        v23 = 16;
      }
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, &mBuffer[v23] - self->mBuffer);
      goto LABEL_50;
    }
    if (self->mCurrentFreeSpace)
    {
      v13 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
      v14 = self->mCurrentEntry;
      v15 = v13 - v14->offset;
      mCurrentFreeSpace = self->mCurrentFreeSpace;
      length = mCurrentFreeSpace->length;
      if (v15 > length)
      {
        +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Wrote more bytes than we had allocated for file %@"), v14->name);
        mCurrentFreeSpace = self->mCurrentFreeSpace;
        length = mCurrentFreeSpace->length;
      }
      v18 = length - v15;
      if ((uint64_t)(length - v15) < 1)
      {
        -[NSMutableArray removeObject:](self->mFreeList, "removeObject:");
      }
      else
      {
        if (v18 < 0x2F)
        {
          +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Wrote more bytes than we had allocated for file %@"), self->mCurrentEntry->name);
          mCurrentFreeSpace = self->mCurrentFreeSpace;
        }
        mCurrentFreeSpace->offset += v15;
        self->mCurrentFreeSpace->length = v18;
      }
      v24 = self->mCurrentFreeSpace;
      self->mFreeBytes -= v15;

      self->mCurrentFreeSpace = 0;
    }
    v25 = self->mBuffer;
    v26 = self->mCurrentEntry;
    v28 = v26->compressedSize;
    uncompressedSize = v26->uncompressedSize;
    *(_DWORD *)v25 = v26->crc;
    v29 = HIDWORD(v28);
    if (HIDWORD(v28))
      v30 = -1;
    else
      v30 = self->mCurrentEntry->compressedSize;
    *((_DWORD *)v25 + 1) = v30;
    v31 = HIDWORD(uncompressedSize);
    if (HIDWORD(uncompressedSize))
    {
      *((_DWORD *)v25 + 2) = -1;
      -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", self->mCurrentEntry->offset + 14, 0);
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 12);
    }
    else
    {
      *((_DWORD *)v25 + 2) = self->mCurrentEntry->uncompressedSize;
      -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", self->mCurrentEntry->offset + 14, 0);
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 12);
      if (!v29)
      {
LABEL_49:
        -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", 0, 2);
LABEL_50:
        self->mCurrentEntry = 0;
        -[SFUZipArchiveOutputStream coalesceAndTruncateFreeSpace](self, "coalesceAndTruncateFreeSpace");
        return;
      }
    }
    v32 = self->mCurrentEntry;
    if (!v32->is64Bit)
    {
      v33 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream(Private) finishEntry]");
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 810, CFSTR("Wrote a zip entry that needs 64 bit sizes, but didn't create 64 bit field."));
      v32 = self->mCurrentEntry;
    }
    v35 = self->mBuffer;
    if (v31)
    {
      *(_QWORD *)v35 = v32->uncompressedSize;
      v35 += 8;
      v32 = self->mCurrentEntry;
    }
    if (v29)
    {
      *(_QWORD *)v35 = v32->compressedSize;
      v35 += 8;
      v32 = self->mCurrentEntry;
    }
    -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v32->offset + v32->utf8NameLength + 34, 0);
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, v35 - self->mBuffer);
    goto LABEL_49;
  }
}

- (void)coalesceAndTruncateFreeSpace
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SFUZipOutputEntry *v20;
  BOOL v22;

  if (!self->mCurrentEntry
    || (v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"),
        v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchiveOutputStream(Private) coalesceAndTruncateFreeSpace]"), objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 863, CFSTR("-coalesceAndTruncateFreeSpace should not be called while an entry is being written to")), !self->mCurrentEntry))
  {
    if (-[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek")
      && -[NSMutableArray count](self->mFreeList, "count"))
    {
      -[NSMutableArray sortUsingSelector:](self->mFreeList, "sortUsingSelector:", sel_compareByOffset_);
      v5 = -[NSMutableArray count](self->mFreeList, "count");
      if (v5 >= 2)
      {
        v6 = v5;
        v7 = 0;
        for (i = 1; i != v6; ++i)
        {
          v9 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", i);
          if (v7
            && (v10 = -[NSMutableArray lastObject](v7, "lastObject")) != 0
            && (v11 = *(_QWORD *)(v10 + 16), *(_QWORD *)(v9 + 8) - v11 == *(_QWORD *)(v10 + 8)))
          {
            *(_QWORD *)(v10 + 16) = *(_QWORD *)(v9 + 16) + v11;
          }
          else
          {
            v12 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", i - 1);
            v13 = *(_QWORD *)(v12 + 16);
            if (*(_QWORD *)(v9 + 8) - v13 == *(_QWORD *)(v12 + 8))
            {
              v14 = v12;
              if (!v7)
              {
                v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v13 = *(_QWORD *)(v14 + 16);
              }
              *(_QWORD *)(v14 + 16) = v13 + *(_QWORD *)(v9 + 16);
              -[NSMutableArray addObject:](v7, "addObject:", v14);
            }
          }
        }
        if (v7)
        {

          self->mFreeList = v7;
        }
      }
      -[SFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", 0, 2);
      v15 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
      v16 = -[NSMutableArray lastObject](self->mFreeList, "lastObject");
      if (v15 - *(_QWORD *)(v16 + 16) == *(_QWORD *)(v16 + 8))
      {
        v17 = v16;
        -[SFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:");
        self->mFreeBytes -= *(_QWORD *)(v17 + 16);
        -[NSMutableArray removeLastObject](self->mFreeList, "removeLastObject");
        if (!self->mLastEntryInFile)
        {
          v18 = -[NSMutableArray count](self->mEntries, "count");
          if (!self->mLastEntryInFile)
          {
            if (v18)
            {
              v19 = v18 - 1;
              while (1)
              {
                v20 = (SFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v19);
                if (v20->compressedSize + v20->compressedDataOffset == *(_QWORD *)(v17 + 8))
                  break;
                v22 = v19-- != 0;
                if (self->mLastEntryInFile || !v22)
                  return;
              }
              self->mLastEntryInFile = v20;
            }
          }
        }
      }
    }
  }
}

- (unint64_t)writeLocalFileHeaderForEntry:(id)a3
{
  char *mBuffer;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  unint64_t v9;
  unsigned __int16 v10;
  char *v11;

  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 67324752;
  *((_WORD *)mBuffer + 2) = 20;
  if (-[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
    v6 = 0;
  else
    v6 = 8;
  *((_WORD *)mBuffer + 3) = v6;
  if (*((_BYTE *)a3 + 24))
    v7 = 25452;
  else
    v7 = 25451;
  if (*((_BYTE *)a3 + 25))
    v8 = v7;
  else
    v8 = 8 * *((unsigned __int8 *)a3 + 24);
  *((_WORD *)mBuffer + 4) = v8;
  *(_DWORD *)(mBuffer + 10) = *((_DWORD *)a3 + 7);
  *(_QWORD *)(mBuffer + 14) = 0;
  *(_DWORD *)(mBuffer + 22) = 0;
  v9 = *((_QWORD *)a3 + 2);
  if (v9 >= 0x10000)
  {
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("File name %@ is too long"), *((_QWORD *)a3 + 1));
    v9 = *((_QWORD *)a3 + 2);
  }
  if (v9 >= 0xFFFF)
    LOWORD(v9) = -1;
  *((_WORD *)mBuffer + 13) = v9;
  if (*((_BYTE *)a3 + 69))
    v10 = 20;
  else
    v10 = 0;
  *((_WORD *)mBuffer + 14) = v10;
  *((_QWORD *)a3 + 6) = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 30);
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(*((id *)a3 + 1), "UTF8String"), *((_QWORD *)a3 + 2));
  if (*((_BYTE *)a3 + 69))
  {
    v11 = self->mBuffer;
    *(_DWORD *)v11 = 1048577;
    *(_QWORD *)(v11 + 12) = 0;
    *(_QWORD *)(v11 + 4) = 0;
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 20);
  }
  return v10 + 30 + *((_QWORD *)a3 + 2);
}

- (void)writeCentralFileHeaderUsingEntry:(id)a3 isFirstEntry:(BOOL)a4
{
  char *mBuffer;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  __int16 v18;
  unint64_t v19;
  _BOOL4 v20;
  unint64_t v21;
  int v22;
  int v23;
  __int16 v24;
  id v25;
  NSData *mPassphraseHint;
  NSData *mEncryptedDocumentUuid;
  NSData *v28;
  int v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  NSData *v35;
  void *v36;
  __int16 v37;
  _BOOL4 v38;

  v38 = a4;
  mBuffer = self->mBuffer;
  v7 = *((_QWORD *)a3 + 4);
  v8 = *((_QWORD *)a3 + 5);
  v9 = *((_QWORD *)a3 + 2);
  v10 = *((_QWORD *)a3 + 6);
  *(_DWORD *)mBuffer = 33639248;
  *((_DWORD *)mBuffer + 1) = 1310782;
  if (-[SFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
    v11 = 0;
  else
    v11 = 8;
  *((_WORD *)mBuffer + 4) = v11;
  if (*((_BYTE *)a3 + 24))
    v12 = 25452;
  else
    v12 = 25451;
  if (*((_BYTE *)a3 + 25))
    v13 = v12;
  else
    v13 = 8 * *((unsigned __int8 *)a3 + 24);
  *((_WORD *)mBuffer + 5) = v13;
  *((_DWORD *)mBuffer + 3) = *((_DWORD *)a3 + 7);
  *((_DWORD *)mBuffer + 4) = *((_DWORD *)a3 + 16);
  v14 = HIDWORD(v7);
  if (HIDWORD(v7))
    v15 = -1;
  else
    v15 = *((_DWORD *)a3 + 8);
  *((_DWORD *)mBuffer + 5) = v15;
  v16 = HIDWORD(v8);
  if (HIDWORD(v8))
    v17 = -1;
  else
    v17 = *((_DWORD *)a3 + 10);
  *((_DWORD *)mBuffer + 6) = v17;
  if (v9 >> 16)
    v18 = -1;
  else
    v18 = *((_WORD *)a3 + 8);
  *((_WORD *)mBuffer + 14) = v18;
  v19 = (v8 | v7 | v10) >> 32;
  v20 = v19 != 0;
  v21 = HIDWORD(v10);
  v22 = 8 * (v16 != 0);
  if (v14)
    v22 += 8;
  if (v21)
    v22 += 8;
  if (v19)
    v23 = v22 | 4;
  else
    v23 = 0;
  if (v19)
    v24 = v22;
  else
    v24 = 0;
  v37 = v24;
  if (self->mCryptoKey && v38)
  {
    v25 = +[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:](SFUCryptoUtils, "generatePassphraseVerifierForKey:verifierVersion:");
    v23 += objc_msgSend(v25, "length") + 8;
    mPassphraseHint = self->mPassphraseHint;
    v35 = mPassphraseHint;
    if (mPassphraseHint)
      v23 += -[NSData length](mPassphraseHint, "length") + 8;
    mEncryptedDocumentUuid = self->mEncryptedDocumentUuid;
    if (mEncryptedDocumentUuid)
    {
      v28 = self->mEncryptedDocumentUuid;
      LOWORD(v23) = v23 + -[NSData length](mEncryptedDocumentUuid, "length") + 8;
      goto LABEL_37;
    }
  }
  else
  {
    v25 = 0;
    v35 = 0;
  }
  v28 = 0;
LABEL_37:
  *((_WORD *)mBuffer + 15) = v23;
  *((_DWORD *)mBuffer + 8) = 0;
  *((_WORD *)mBuffer + 18) = 0;
  *(_DWORD *)(mBuffer + 38) = 0;
  if (v21)
    v29 = -1;
  else
    v29 = *((_DWORD *)a3 + 12);
  *(_DWORD *)(mBuffer + 42) = v29;
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 46, v35);
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(*((id *)a3 + 1), "UTF8String"), *((_QWORD *)a3 + 2));
  if (!v20)
    goto LABEL_49;
  v30 = self->mBuffer;
  *(_WORD *)v30 = 1;
  *((_WORD *)v30 + 1) = v37;
  if (v16)
  {
    *(_QWORD *)(v30 + 4) = *((_QWORD *)a3 + 5);
    v31 = v30 + 12;
    if (!v14)
      goto LABEL_46;
    goto LABEL_45;
  }
  v31 = v30 + 4;
  if (v14)
  {
LABEL_45:
    *(_QWORD *)v31 = *((_QWORD *)a3 + 4);
    v31 += 8;
  }
LABEL_46:
  if (v21)
  {
    *(_QWORD *)v31 = *((_QWORD *)a3 + 6);
    v31 += 8;
  }
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, v31 - self->mBuffer);
LABEL_49:
  if (self->mCryptoKey && v38)
  {
    v32 = self->mBuffer;
    *(_WORD *)v32 = 25453;
    *((_WORD *)v32 + 1) = objc_msgSend(v25, "length") + 4;
    *((_DWORD *)v32 + 1) = 1987082089;
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"));
    if (v36)
    {
      v33 = self->mBuffer;
      *(_WORD *)v33 = 25454;
      *((_WORD *)v33 + 1) = objc_msgSend(v36, "length") + 4;
      *((_DWORD *)v33 + 1) = 1752201065;
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"));
    }
    if (v28)
    {
      v34 = self->mBuffer;
      *(_WORD *)v34 = 25455;
      *((_WORD *)v34 + 1) = -[NSData length](v28, "length") + 4;
      *((_DWORD *)v34 + 1) = *(_DWORD *)"iwuu";
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", -[NSData bytes](v28, "bytes"), -[NSData length](v28, "length"));
    }
  }
}

- (void)writeEndOfCentralDirectoryWithOffset:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  int64_t v9;
  char *mBuffer;
  __int16 v11;
  int v12;
  int v13;

  v5 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset") - a3;
  v6 = -[NSMutableArray count](self->mEntries, "count");
  v7 = v6;
  if (a3 > 0xFFFFFFFFLL || (!(v6 >> 16) ? (v8 = HIDWORD(v5) == 0) : (v8 = 0), !v8))
  {
    v9 = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
    -[SFUZipArchiveOutputStream writeZip64EndOfCentralDirectoryWithOffset:](self, "writeZip64EndOfCentralDirectoryWithOffset:", a3);
    -[SFUZipArchiveOutputStream writeZip64EndOfCentralDirectoryLocatorWithOffset:](self, "writeZip64EndOfCentralDirectoryLocatorWithOffset:", v9);
  }
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 101010256;
  *((_DWORD *)mBuffer + 1) = 0;
  v11 = -1;
  if (v7 < 0xFFFF)
    v11 = v7;
  *((_WORD *)mBuffer + 4) = v11;
  *((_WORD *)mBuffer + 5) = v11;
  v12 = -1;
  if (a3 > 0xFFFFFFFFLL)
    v13 = -1;
  else
    v13 = v5;
  if (a3 < 0xFFFFFFFFLL)
    v12 = a3;
  *((_DWORD *)mBuffer + 3) = v13;
  *((_DWORD *)mBuffer + 4) = v12;
  *((_WORD *)mBuffer + 10) = 0;
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 22);
}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3
{
  char *mBuffer;
  uint64_t v6;

  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 101075792;
  *(_QWORD *)(mBuffer + 4) = 44;
  *((_QWORD *)mBuffer + 2) = 0;
  *((_DWORD *)mBuffer + 3) = 1310782;
  v6 = -[NSMutableArray count](self->mEntries, "count");
  *((_QWORD *)mBuffer + 3) = v6;
  *((_QWORD *)mBuffer + 4) = v6;
  *((_QWORD *)mBuffer + 5) = -[SFUMoveableFileOutputStream offset](self->mOutputStream, "offset") - a3;
  *((_QWORD *)mBuffer + 6) = a3;
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 56);
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  char *mBuffer;

  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 117853008;
  *((_DWORD *)mBuffer + 1) = 0;
  *((_QWORD *)mBuffer + 1) = a3;
  *((_DWORD *)mBuffer + 4) = 1;
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 20);
}

@end
