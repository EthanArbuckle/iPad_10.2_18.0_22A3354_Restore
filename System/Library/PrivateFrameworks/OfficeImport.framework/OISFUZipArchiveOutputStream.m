@implementation OISFUZipArchiveOutputStream

+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3
{
  size_t v3;

  if (a3)
    v3 = strlen((const char *)objc_msgSend(a3, "UTF8String"));
  else
    v3 = 0;
  return v3 + 30;
}

- (OISFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  OISFUZipArchiveOutputStream *v8;
  char *v9;

  v8 = -[OISFUZipArchiveOutputStream init](self, "init");
  if (v8)
  {
    v8->mOutputStream = (OISFUMoveableFileOutputStream *)a3;
    v8->mCryptoKey = (OISFUCryptoKey *)a4;
    v8->mPassphraseHint = (NSData *)+[OISFUCryptoUtils encodePassphraseHint:](OISFUCryptoUtils, "encodePassphraseHint:", a5);
    v8->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8->mFreeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = (char *)malloc_type_malloc(*(size_t *)"8", 0x1BD1FD26uLL);
    v8->mBuffer = v9;
    if (!v9)
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Initialization error. Could not allocate record buffer of size: %zu"), *(_QWORD *)"8");
  }
  return v8;
}

- (OISFUZipArchiveOutputStream)initWithPath:(id)a3
{
  return -[OISFUZipArchiveOutputStream initWithPath:cryptoKey:passphraseHint:](self, "initWithPath:cryptoKey:passphraseHint:", a3, 0, 0);
}

- (OISFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  return -[OISFUZipArchiveOutputStream initWithOutputStream:cryptoKey:passphraseHint:](self, "initWithOutputStream:cryptoKey:passphraseHint:", -[OISFUMoveableFileOutputStream initWithPath:]([OISFUMoveableFileOutputStream alloc], "initWithPath:", a3), a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  free(self->mBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipArchiveOutputStream;
  -[OISFUZipArchiveOutputStream dealloc](&v3, sel_dealloc);
}

+ (BOOL)createZipWithItemsAtPath:(id)a3 zippedPath:(id)a4 rootPathComponentName:(id)a5
{
  OISFUZipArchiveOutputStream *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  OISFUFileDataRepresentation *v19;
  OISFUFileDataRepresentation *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  uint64_t v28;
  id obj;
  void *v30;
  uint64_t v31;
  char v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v7 = -[OISFUZipArchiveOutputStream initWithPath:]([OISFUZipArchiveOutputStream alloc], "initWithPath:", a4);
  v30 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", a3);
  v9 = *MEMORY[0x24BDBCCD8];
  v10 = *MEMORY[0x24BDBCC48];
  v40[0] = *MEMORY[0x24BDBCCD8];
  v40[1] = v10;
  v28 = v10;
  v11 = (void *)objc_msgSend(v30, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2), 0, 0);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v12)
  {
    LOBYTE(v16) = 1;
    goto LABEL_28;
  }
  obj = v11;
  v13 = *(_QWORD *)v36;
  v27 = a3;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v36 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
      v33 = 0;
      v34 = 0;
      if (objc_msgSend(v15, "getResourceValue:forKey:error:", &v34, v9, 0))
        v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v33, v28, 0);
      else
        v16 = 0;
      if (a5)
        v17 = objc_msgSend(a5, "stringByAppendingPathComponent:", objc_msgSend(v34, "tsu_stringWithPathRelativeTo:", a3));
      else
        v17 = objc_msgSend(v34, "tsu_stringWithPathRelativeTo:", objc_msgSend(a3, "stringByDeletingLastPathComponent"));
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        LOBYTE(v16) = 0;
        goto LABEL_28;
      }
      v32 = 0;
      if ((objc_msgSend(v30, "fileExistsAtPath:isDirectory:", v34, &v32) & 1) == 0)
      {
        v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OISFUZipArchiveOutputStream createZipWithItemsAtPath:zippedPath:rootPathComponentName:]");
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 181, 0, "Trying to add file that doesn't exist: %@", v34);
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_19:
        LOBYTE(v16) = 1;
        goto LABEL_20;
      }
      if (v32)
        goto LABEL_19;
      -[OISFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:](v7, "beginEntryWithName:isCompressed:uncompressedSize:", v18, 0, objc_msgSend(v33, "unsignedLongLongValue"));
      v19 = [OISFUFileDataRepresentation alloc];
      v20 = -[OISFUFileDataRepresentation initWithPath:](v19, "initWithPath:", v34);
      v21 = -[OISFUDataRepresentation bufferedInputStream](v20, "bufferedInputStream");
      while (1)
      {
        v31 = 0;
        v22 = objc_msgSend(v21, "readToOwnBuffer:size:", &v31, 0xFFFFFFFFLL);
        if (!v22)
          break;
        -[OISFUZipArchiveOutputStream writeBuffer:size:](v7, "writeBuffer:size:", v31, v22);
      }
      objc_msgSend(v21, "close");

      a3 = v27;
      if (!v16)
        goto LABEL_28;
LABEL_20:
      ++v14;
    }
    while (v14 != v12);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v12 = v25;
  }
  while (v25);
LABEL_28:
  -[OISFUZipArchiveOutputStream close](v7, "close");

  return v16;
}

- (void)beginEntryWithName:(id)a3 isCompressed:(BOOL)a4 uncompressedSize:(unint64_t)a5
{
  _BOOL4 v6;
  uint64_t v9;
  OISFUZipOutputEntry *v10;
  OISFUZipOutputEntry *mCurrentEntry;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  OISFUZipOutputEntry *v22;
  OISFUMoveableFileOutputStream *v23;
  OISFUMoveableFileOutputStream *v24;

  v6 = a4;
  if (!self->mOutputStream)
  {
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 232, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OISFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  if (self->mCryptoKey)
    a5 = +[OISFUCryptoOutputStream encodedLengthForDataLength:key:](OISFUCryptoOutputStream, "encodedLengthForDataLength:key:", a5);
  v10 = objc_alloc_init(OISFUZipOutputEntry);
  self->mCurrentEntry = v10;
  -[NSMutableArray addObject:](self->mEntries, "addObject:", v10);

  self->mCurrentEntry->name = (NSString *)objc_msgSend(a3, "copy");
  self->mCurrentEntry->utf8NameLength = strlen((const char *)objc_msgSend(a3, "UTF8String"));
  self->mCurrentEntry->isCompressed = v6;
  self->mCurrentEntry->isEncrypted = self->mCryptoKey != 0;
  self->mCurrentEntry->time = SFUZipCurrentDosTime();
  self->mCurrentEntry->is64Bit = a5 > 0xFFC2F6FF;
  if (!v6 && -[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
  {
    mCurrentEntry = self->mCurrentEntry;
    v12 = mCurrentEntry->utf8NameLength + 30;
    v13 = mCurrentEntry->is64Bit ? 20 : 0;
    v14 = v12 + v13;
    if (!__CFADD__(a5, v12 + v13))
    {
      v15 = -[NSMutableArray count](self->mFreeList, "count");
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = 0;
        v19 = v14 + a5;
        do
        {
          v20 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", v17);
          v21 = *(_QWORD *)(v20 + 16);
          if (v21 == v19)
          {
            v18 = (_QWORD *)v20;
            goto LABEL_22;
          }
          if (v21 >= v19 + 47 && (!v18 || v21 < v18[2]))
            v18 = (_QWORD *)v20;
          ++v17;
        }
        while (v16 != v17);
        if (!v18)
          goto LABEL_23;
LABEL_22:
        -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v18[1], 0);
        self->mCurrentFreeSpace = (OISFUZipFreeSpaceEntry *)v18;
      }
    }
  }
LABEL_23:
  v22 = self->mCurrentEntry;
  if (!self->mCurrentFreeSpace)
    self->mLastEntryInFile = v22;
  self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                            + -[OISFUZipArchiveOutputStream writeLocalFileHeaderForEntry:](self, "writeLocalFileHeaderForEntry:", v22);
  self->mCurrentEntry->crc = crc32(0, 0, 0);
  if (self->mCurrentEntry->isEncrypted)
  {
    v23 = -[OISFUCryptoOutputStream initForEncryptionWithOutputStream:key:computeCrc32:]([OISFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:computeCrc32:", self->mOutputStream, self->mCryptoKey, 1);
    if (v6)
    {
LABEL_27:
      v24 = v23;
      self->mEntryOutputStream = (SFUOutputStream *)-[OISFUZipDeflateOutputStream initWithOutputStream:]([OISFUZipDeflateOutputStream alloc], "initWithOutputStream:", v23);

      return;
    }
  }
  else
  {
    v23 = self->mOutputStream;
    if (v6)
      goto LABEL_27;
  }
  self->mEntryOutputStream = (SFUOutputStream *)v23;
}

- (void)beginUnknownSizeEntryWithName:(id)a3 isCompressed:(BOOL)a4
{
  -[OISFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:](self, "beginEntryWithName:isCompressed:uncompressedSize:", a3, a4, -1);
}

- (id)beginUncompressedUnknownSizeEntryWithName:(id)a3
{
  OISFUOffsetOutputStream *v4;
  OISFUOffsetOutputStream *v5;

  -[OISFUZipArchiveOutputStream beginUnknownSizeEntryWithName:isCompressed:](self, "beginUnknownSizeEntryWithName:isCompressed:", a3, 0);
  self->mCurrentEntry->isWrittenDirectlyToFile = 1;
  v4 = -[OISFUOffsetOutputStream initWithOutputStream:]([OISFUOffsetOutputStream alloc], "initWithOutputStream:", self->mEntryOutputStream);
  if (self->mCurrentEntry->isEncrypted)
  {
    v5 = -[OISFUCryptoOutputStream initForEncryptionWithOutputStream:key:computeCrc32:]([OISFUCryptoOutputStream alloc], "initForEncryptionWithOutputStream:key:computeCrc32:", v4, self->mCryptoKey, 1);

    v4 = v5;
  }
  return v4;
}

- (void)setCrc32ForCurrentEntry:(unsigned int)a3
{
  OISFUZipOutputEntry *mCurrentEntry;

  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry)
  {
    if (mCurrentEntry->isWrittenDirectlyToFile)
      mCurrentEntry->crc = a3;
  }
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  uint64_t v7;
  OISFUZipOutputEntry *mCurrentEntry;
  uint64_t v9;

  if (self->mCurrentEntry)
  {
    if (!self->mOutputStream)
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream writeBuffer:size:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 355, 0, "Zip output stream is closed.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    -[SFUOutputStream writeBuffer:size:](self->mEntryOutputStream, "writeBuffer:size:", a3, a4);
    self->mCurrentEntry->uncompressedSize += a4;
    mCurrentEntry = self->mCurrentEntry;
    if (!mCurrentEntry->isEncrypted)
    {
      if (a4 >= 0xFFFFFFFF)
      {
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream writeBuffer:size:]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 365, 0, "overflow in writeBuffer:");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        mCurrentEntry = self->mCurrentEntry;
      }
      self->mCurrentEntry->crc = crc32(mCurrentEntry->crc, (const Bytef *)a3, a4);
    }
  }
  else
  {
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("-writeBuffer:size: called when current entry is nil"));
  }
}

- (BOOL)canRemoveEntryWithName:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  OISFUZipOutputEntry *v9;
  BOOL v10;
  uint64_t v12;

  v5 = -[NSMutableArray count](self->mEntries, "count");
  if (!v5)
    goto LABEL_14;
  v6 = v5;
  v7 = 0;
  do
  {
    v8 = -[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v7);
    if (objc_msgSend(*(id *)(v8 + 8), "isEqualToString:", a3))
      v9 = (OISFUZipOutputEntry *)v8;
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
  v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream canRemoveEntryWithName:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 382, 0, "Can't find entry named: %@", a3);
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (void)removeEntryWithName:(id)a3
{
  uint64_t v5;
  OISFUZipOutputEntry *mCurrentEntry;
  OISFUZipOutputEntry *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  OISFUZipOutputEntry *v12;
  OISFUZipFreeSpaceEntry *v13;
  OISFUZipFreeSpaceEntry *v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  OISFUZipOutputEntry *v20;
  char v21;

  if (!self->mOutputStream)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream removeEntryWithName:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 390, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry && -[NSString isEqualToString:](mCurrentEntry->name, "isEqualToString:", a3))
  {
    v7 = self->mCurrentEntry;
    -[OISFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  }
  else
  {
    v8 = -[NSMutableArray count](self->mEntries, "count");
    if (!v8)
    {
LABEL_19:
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream removeEntryWithName:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 407, 0, "Can't find entry named: %@", a3);
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      return;
    }
    v9 = v8;
    v10 = 0;
    do
    {
      v7 = (OISFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v10);
      if (!-[NSString isEqualToString:](v7->name, "isEqualToString:", a3))
        v7 = 0;
      ++v10;
      if (v7)
        v11 = 1;
      else
        v11 = v10 >= v9;
    }
    while (!v11);
  }
  if (!v7)
    goto LABEL_19;
  v12 = v7;
  -[NSMutableArray removeObject:](self->mEntries, "removeObject:", v7);
  if (v7 == self->mLastEntryInFile)
  {
    v17 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
    -[OISFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:", v7->offset);
    if (v17 < (int64_t)v7->offset)
      -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v17, 0);
    self->mLastEntryInFile = 0;
    v18 = -[NSMutableArray count](self->mEntries, "count");
    if (!self->mLastEntryInFile && v18)
    {
      v19 = v18 - 1;
      while (1)
      {
        v20 = (OISFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v19);
        if (v20->compressedSize + v20->compressedDataOffset == v7->offset)
          break;
        v11 = v19-- != 0;
        v21 = v11;
        if (self->mLastEntryInFile || (v21 & 1) == 0)
          return;
      }
      self->mLastEntryInFile = v20;
    }
  }
  else
  {
    v13 = objc_alloc_init(OISFUZipFreeSpaceEntry);
    v14 = v13;
    v13->offset = v7->offset;
    v15 = v7->compressedDataOffset - v7->offset + v7->compressedSize;
    v13->length = v15;
    if (v15 >= 0x2F)
    {
      -[NSMutableArray addObject:](self->mFreeList, "addObject:", v13);

      self->mFreeBytes += v14->length;
    }
    else
    {

      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Removing entry named %@ produced free space that is too small."), a3);
    }
  }
}

- (void)setEncryptedDocumentUuid:(id)a3
{
  id v5;

  if (!self->mOutputStream)
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Tried to set encrypted document UUID after writing finished."));
  v5 = a3;

  self->mEncryptedDocumentUuid = (NSData *)a3;
}

- (void)close
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  OISFUZipOutputEntry *v9;
  void *v10;
  unint64_t i;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->mOutputStream)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream close]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 470, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OISFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  v4 = -[NSMutableArray count](self->mFreeList, "count");
  if (v4)
  {
    v5 = v4;
    v6 = malloc_type_calloc(1uLL, 0x40000uLL, 0x47BEBE3DuLL);
    v7 = 0;
    do
    {
      v8 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", v7);
      -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", *(_QWORD *)(v8 + 8), 0);
      v9 = objc_alloc_init(OISFUZipOutputEntry);
      self->mCurrentEntry = v9;
      -[NSMutableArray addObject:](self->mEntries, "addObject:", v9);

      v10 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".iWTrash/%08X"), ++v7);
      self->mCurrentEntry->name = (NSString *)objc_msgSend(v10, "copy");
      self->mCurrentEntry->utf8NameLength = strlen((const char *)objc_msgSend(v10, "UTF8String"));
      self->mCurrentEntry->isCompressed = 0;
      self->mCurrentEntry->isEncrypted = 0;
      self->mCurrentEntry->time = SFUZipCurrentDosTime();
      self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                                + -[OISFUZipArchiveOutputStream writeLocalFileHeaderForEntry:](self, "writeLocalFileHeaderForEntry:", self->mCurrentEntry);
      self->mCurrentEntry->crc = crc32(0, 0, 0);
      self->mEntryOutputStream = (SFUOutputStream *)self->mOutputStream;
      for (i = *(_QWORD *)(v8 + 16) - self->mCurrentEntry->compressedDataOffset + self->mCurrentEntry->offset; i; i -= v12)
      {
        if (i >= 0x40000)
          v12 = 0x40000;
        else
          v12 = i;
        -[OISFUZipArchiveOutputStream writeBuffer:size:](self, "writeBuffer:size:", v6, v12);
      }
      -[OISFUZipArchiveOutputStream finishEntry](self, "finishEntry");
    }
    while (v7 != v5);
    if (v6)
      free(v6);
  }
  v13 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
  -[NSMutableArray sortUsingSelector:](self->mEntries, "sortUsingSelector:", sel_compareByOffset_);
  v14 = (void *)-[NSMutableArray objectEnumerator](self->mEntries, "objectEnumerator");
  v15 = objc_msgSend(v14, "nextObject");
  if (v15)
    -[OISFUZipArchiveOutputStream writeCentralFileHeaderUsingEntry:isFirstEntry:](self, "writeCentralFileHeaderUsingEntry:isFirstEntry:", v15, 1);
  v16 = objc_msgSend(v14, "nextObject");
  if (v16)
  {
    v17 = v16;
    do
    {
      -[OISFUZipArchiveOutputStream writeCentralFileHeaderUsingEntry:isFirstEntry:](self, "writeCentralFileHeaderUsingEntry:isFirstEntry:", v17, 0);
      v17 = objc_msgSend(v14, "nextObject");
    }
    while (v17);
  }
  -[OISFUZipArchiveOutputStream writeEndOfCentralDirectoryWithOffset:](self, "writeEndOfCentralDirectoryWithOffset:", v13);

  self->mOutputStream = 0;
}

- (void)moveToPath:(id)a3
{
  uint64_t v5;
  id v6;

  if (!self->mOutputStream)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream moveToPath:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 545, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OISFUZipArchiveOutputStream finishEntry](self, "finishEntry");
  v6 = -[OISFUMoveableFileOutputStream path](self->mOutputStream, "path");
  if (!-[OISFUMoveableFileOutputStream moveToPath:](self->mOutputStream, "moveToPath:", a3))
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Could not move output stream from %@ to %@"), v6, a3);

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
  OISFUZipArchiveFileDataRepresentation *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  OISFUZipEntry *v10;
  OISFUZipEntry *v11;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableArray count](self->mEntries, "count"));
  v6 = -[OISFUZipArchiveFileDataRepresentation initWithPath:]([OISFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
  v7 = (void *)-[NSMutableArray objectEnumerator](self->mEntries, "objectEnumerator");
  v8 = objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = v8;
    do
    {
      v10 = -[OISFUZipEntry initWithDataRepresentation:compressionMethod:compressedSize:uncompressedSize:offset:crc:]([OISFUZipEntry alloc], "initWithDataRepresentation:compressionMethod:compressedSize:uncompressedSize:offset:crc:", v6, *(unsigned __int8 *)(v9 + 24), *(_QWORD *)(v9 + 32), *(_QWORD *)(v9 + 40), *(_QWORD *)(v9 + 48), *(unsigned int *)(v9 + 64));
      v11 = v10;
      if (*(_BYTE *)(v9 + 25))
        -[OISFUZipEntry setCryptoKey:](v10, "setCryptoKey:", self->mCryptoKey);
      objc_msgSend(v5, "setObject:forKey:", v11, *(_QWORD *)(v9 + 8));

      v9 = objc_msgSend(v7, "nextObject");
    }
    while (v9);
  }

  return v5;
}

- (void)flush
{
  -[OISFUMoveableFileOutputStream flush](self->mOutputStream, "flush");
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
  -[OISFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:", 0);
}

- (unsigned)crc32ForEntry:(id)a3
{
  NSMutableArray *mEntries;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OISFUZipOutputEntry *v10;
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
        v10 = *(OISFUZipOutputEntry **)(*((_QWORD *)&v12 + 1) + 8 * v9);
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
  OISFUZipOutputEntry *mCurrentEntry;
  SFUOutputStream *mEntryOutputStream;
  uint64_t v5;
  uint64_t v6;
  OISFUZipOutputEntry *v7;
  OISFUBufferedInputStream *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  OISFUZipOutputEntry *v12;
  unint64_t v13;
  OISFUZipFreeSpaceEntry *mCurrentFreeSpace;
  unint64_t length;
  unint64_t v16;
  char *mBuffer;
  OISFUZipOutputEntry *v18;
  _BOOL4 is64Bit;
  unint64_t compressedSize;
  uint64_t v21;
  OISFUZipFreeSpaceEntry *v22;
  char *v23;
  OISFUZipOutputEntry *v24;
  unint64_t uncompressedSize;
  unint64_t v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  OISFUZipOutputEntry *v30;
  uint64_t v31;
  char *v32;
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
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream(Private) finishEntry]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 659, 0, "Wrong output stream for compressed entry.");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      mEntryOutputStream = (SFUOutputStream *)-[SFUOutputStream closeLocalStream](self->mEntryOutputStream, "closeLocalStream");
      mCurrentEntry = self->mCurrentEntry;
    }
    if (mCurrentEntry->isEncrypted)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream(Private) finishEntry]");
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 667, 0, "Wrong output stream type for encrypted entry.");
        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      -[SFUOutputStream closeLocalStream](mEntryOutputStream, "closeLocalStream");
      self->mCurrentEntry->crc = -[SFUOutputStream crc32](mEntryOutputStream, "crc32");
    }

    self->mEntryOutputStream = 0;
    self->mCurrentEntry->compressedSize = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset")
                                        - self->mCurrentEntry->compressedDataOffset;
    v7 = self->mCurrentEntry;
    if (v7->isWrittenDirectlyToFile)
    {
      v7->uncompressedSize = v7->compressedSize;
      if (!self->mCurrentEntry->crc)
      {
        if (!-[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
          +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but output stream cannot be seeked for CRC calculation."));
        if (!-[OISFUMoveableFileOutputStream canCreateInputStream](self->mOutputStream, "canCreateInputStream"))
          +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but output stream cannot be read for CRC calculation."));
        v8 = -[OISFUBufferedInputStream initWithStream:]([OISFUBufferedInputStream alloc], "initWithStream:", -[OISFUMoveableFileOutputStream inputStream](self->mOutputStream, "inputStream"));
        if (!-[OISFUBufferedInputStream canSeek](v8, "canSeek"))
        {
          -[OISFUBufferedInputStream close](v8, "close");

          +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Entry written directly to seekable output stream, but input stream cannot be seeked for CRC calculation."));
          v8 = 0;
        }
        -[OISFUBufferedInputStream seekToOffset:](v8, "seekToOffset:", self->mCurrentEntry->compressedDataOffset);
        buf = 0;
        v9 = -[OISFUBufferedInputStream readToOwnBuffer:size:](v8, "readToOwnBuffer:size:", &buf, 0xFFFFFFFFLL);
        if (v9)
        {
          LODWORD(v10) = v9;
          do
          {
            self->mCurrentEntry->crc = crc32(self->mCurrentEntry->crc, buf, v10);
            buf = 0;
            v10 = -[OISFUBufferedInputStream readToOwnBuffer:size:](v8, "readToOwnBuffer:size:", &buf, 0xFFFFFFFFLL);
          }
          while (v10);
        }
        -[OISFUBufferedInputStream close](v8, "close", v10);

      }
    }
    if (!-[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
    {
      mBuffer = self->mBuffer;
      *(_DWORD *)mBuffer = *(_DWORD *)"PK\a\b";
      *((_DWORD *)mBuffer + 1) = self->mCurrentEntry->crc;
      v18 = self->mCurrentEntry;
      is64Bit = v18->is64Bit;
      compressedSize = v18->compressedSize;
      if (is64Bit)
      {
        *((_QWORD *)mBuffer + 1) = compressedSize;
        *((_QWORD *)mBuffer + 2) = self->mCurrentEntry->uncompressedSize;
        v21 = 24;
      }
      else
      {
        *((_DWORD *)mBuffer + 2) = compressedSize;
        *((_DWORD *)mBuffer + 3) = self->mCurrentEntry->uncompressedSize;
        v21 = 16;
      }
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, &mBuffer[v21] - self->mBuffer);
      goto LABEL_50;
    }
    if (self->mCurrentFreeSpace)
    {
      v11 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
      v12 = self->mCurrentEntry;
      v13 = v11 - v12->offset;
      mCurrentFreeSpace = self->mCurrentFreeSpace;
      length = mCurrentFreeSpace->length;
      if (v13 > length)
      {
        +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Wrote more bytes than we had allocated for file %@"), v12->name);
        mCurrentFreeSpace = self->mCurrentFreeSpace;
        length = mCurrentFreeSpace->length;
      }
      v16 = length - v13;
      if ((uint64_t)(length - v13) < 1)
      {
        -[NSMutableArray removeObject:](self->mFreeList, "removeObject:");
      }
      else
      {
        if (v16 < 0x2F)
        {
          +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("Wrote more bytes than we had allocated for file %@"), self->mCurrentEntry->name);
          mCurrentFreeSpace = self->mCurrentFreeSpace;
        }
        mCurrentFreeSpace->offset += v13;
        self->mCurrentFreeSpace->length = v16;
      }
      v22 = self->mCurrentFreeSpace;
      self->mFreeBytes -= v13;

      self->mCurrentFreeSpace = 0;
    }
    v23 = self->mBuffer;
    v24 = self->mCurrentEntry;
    v26 = v24->compressedSize;
    uncompressedSize = v24->uncompressedSize;
    *(_DWORD *)v23 = v24->crc;
    v27 = HIDWORD(v26);
    if (HIDWORD(v26))
      v28 = -1;
    else
      v28 = self->mCurrentEntry->compressedSize;
    *((_DWORD *)v23 + 1) = v28;
    v29 = HIDWORD(uncompressedSize);
    if (HIDWORD(uncompressedSize))
    {
      *((_DWORD *)v23 + 2) = -1;
      -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", self->mCurrentEntry->offset + 14, 0);
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 12);
    }
    else
    {
      *((_DWORD *)v23 + 2) = self->mCurrentEntry->uncompressedSize;
      -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", self->mCurrentEntry->offset + 14, 0);
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 12);
      if (!v27)
      {
LABEL_49:
        -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", 0, 2);
LABEL_50:
        self->mCurrentEntry = 0;
        -[OISFUZipArchiveOutputStream coalesceAndTruncateFreeSpace](self, "coalesceAndTruncateFreeSpace");
        return;
      }
    }
    v30 = self->mCurrentEntry;
    if (!v30->is64Bit)
    {
      v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream(Private) finishEntry]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 776, 0, "Wrote a zip entry that needs 64 bit sizes, but didn't create 64 bit field.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v30 = self->mCurrentEntry;
    }
    v32 = self->mBuffer;
    if (v29)
    {
      *(_QWORD *)v32 = v30->uncompressedSize;
      v32 += 8;
      v30 = self->mCurrentEntry;
    }
    if (v27)
    {
      *(_QWORD *)v32 = v30->compressedSize;
      v32 += 8;
      v30 = self->mCurrentEntry;
    }
    -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", v30->offset + v30->utf8NameLength + 34, 0);
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, v32 - self->mBuffer);
    goto LABEL_49;
  }
}

- (void)coalesceAndTruncateFreeSpace
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSMutableArray *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OISFUZipOutputEntry *v19;
  BOOL v21;

  if (!self->mCurrentEntry
    || (v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchiveOutputStream(Private) coalesceAndTruncateFreeSpace]"), +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 820, 0, "-coalesceAndTruncateFreeSpace should not be called while an entry is being written to"), +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled"), !self->mCurrentEntry))
  {
    if (-[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek")
      && -[NSMutableArray count](self->mFreeList, "count"))
    {
      -[NSMutableArray sortUsingSelector:](self->mFreeList, "sortUsingSelector:", sel_compareByOffset_);
      v4 = -[NSMutableArray count](self->mFreeList, "count");
      if (v4 >= 2)
      {
        v5 = v4;
        v6 = 0;
        for (i = 1; i != v5; ++i)
        {
          v8 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", i);
          if (v6
            && (v9 = -[NSMutableArray lastObject](v6, "lastObject")) != 0
            && (v10 = *(_QWORD *)(v9 + 16), *(_QWORD *)(v8 + 8) - v10 == *(_QWORD *)(v9 + 8)))
          {
            *(_QWORD *)(v9 + 16) = *(_QWORD *)(v8 + 16) + v10;
          }
          else
          {
            v11 = -[NSMutableArray objectAtIndex:](self->mFreeList, "objectAtIndex:", i - 1);
            v12 = *(_QWORD *)(v11 + 16);
            if (*(_QWORD *)(v8 + 8) - v12 == *(_QWORD *)(v11 + 8))
            {
              v13 = v11;
              if (!v6)
              {
                v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v12 = *(_QWORD *)(v13 + 16);
              }
              *(_QWORD *)(v13 + 16) = v12 + *(_QWORD *)(v8 + 16);
              -[NSMutableArray addObject:](v6, "addObject:", v13);
            }
          }
        }
        if (v6)
        {

          self->mFreeList = v6;
        }
      }
      -[OISFUMoveableFileOutputStream seekToOffset:whence:](self->mOutputStream, "seekToOffset:whence:", 0, 2);
      v14 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
      v15 = -[NSMutableArray lastObject](self->mFreeList, "lastObject");
      if (v14 - *(_QWORD *)(v15 + 16) == *(_QWORD *)(v15 + 8))
      {
        v16 = v15;
        -[OISFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:");
        self->mFreeBytes -= *(_QWORD *)(v16 + 16);
        -[NSMutableArray removeLastObject](self->mFreeList, "removeLastObject");
        if (!self->mLastEntryInFile)
        {
          v17 = -[NSMutableArray count](self->mEntries, "count");
          if (!self->mLastEntryInFile)
          {
            if (v17)
            {
              v18 = v17 - 1;
              while (1)
              {
                v19 = (OISFUZipOutputEntry *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v18);
                if (v19->compressedSize + v19->compressedDataOffset == *(_QWORD *)(v16 + 8))
                  break;
                v21 = v18-- != 0;
                if (self->mLastEntryInFile || !v21)
                  return;
              }
              self->mLastEntryInFile = v19;
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
  if (-[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
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
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipOutputError"), CFSTR("File name %@ is too long"), *((_QWORD *)a3 + 1));
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
  *((_QWORD *)a3 + 6) = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 30);
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(*((id *)a3 + 1), "UTF8String"), *((_QWORD *)a3 + 2));
  if (*((_BYTE *)a3 + 69))
  {
    v11 = self->mBuffer;
    *(_DWORD *)v11 = 1048577;
    *(_QWORD *)(v11 + 12) = 0;
    *(_QWORD *)(v11 + 4) = 0;
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 20);
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
  if (-[OISFUMoveableFileOutputStream canSeek](self->mOutputStream, "canSeek"))
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
    v25 = +[OISFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:](OISFUCryptoUtils, "generatePassphraseVerifierForKey:verifierVersion:");
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
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 46, v35);
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(*((id *)a3 + 1), "UTF8String"), *((_QWORD *)a3 + 2));
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
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, v31 - self->mBuffer);
LABEL_49:
  if (self->mCryptoKey && v38)
  {
    v32 = self->mBuffer;
    *(_WORD *)v32 = 25453;
    *((_WORD *)v32 + 1) = objc_msgSend(v25, "length") + 4;
    *((_DWORD *)v32 + 1) = 1987082089;
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"));
    if (v36)
    {
      v33 = self->mBuffer;
      *(_WORD *)v33 = 25454;
      *((_WORD *)v33 + 1) = objc_msgSend(v36, "length") + 4;
      *((_DWORD *)v33 + 1) = 1752201065;
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"));
    }
    if (v28)
    {
      v34 = self->mBuffer;
      *(_WORD *)v34 = 25455;
      *((_WORD *)v34 + 1) = -[NSData length](v28, "length") + 4;
      *((_DWORD *)v34 + 1) = *(_DWORD *)"iwuu";
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", -[NSData bytes](v28, "bytes"), -[NSData length](v28, "length"));
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

  v5 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset") - a3;
  v6 = -[NSMutableArray count](self->mEntries, "count");
  v7 = v6;
  if (a3 > 0xFFFFFFFFLL || (!(v6 >> 16) ? (v8 = HIDWORD(v5) == 0) : (v8 = 0), !v8))
  {
    v9 = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset");
    -[OISFUZipArchiveOutputStream writeZip64EndOfCentralDirectoryWithOffset:](self, "writeZip64EndOfCentralDirectoryWithOffset:", a3);
    -[OISFUZipArchiveOutputStream writeZip64EndOfCentralDirectoryLocatorWithOffset:](self, "writeZip64EndOfCentralDirectoryLocatorWithOffset:", v9);
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
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 22);
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
  *((_QWORD *)mBuffer + 5) = -[OISFUMoveableFileOutputStream offset](self->mOutputStream, "offset") - a3;
  *((_QWORD *)mBuffer + 6) = a3;
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 56);
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  char *mBuffer;

  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 117853008;
  *((_DWORD *)mBuffer + 1) = 0;
  *((_QWORD *)mBuffer + 1) = a3;
  *((_DWORD *)mBuffer + 4) = 1;
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 20);
}

@end
