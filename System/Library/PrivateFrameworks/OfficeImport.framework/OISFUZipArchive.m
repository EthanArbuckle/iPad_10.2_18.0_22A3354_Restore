@implementation OISFUZipArchive

+ (BOOL)isZipArchiveAtPath:(id)a3
{
  OISFUZipArchiveFileDataRepresentation *v3;
  id v4;
  BOOL v6;
  int v8;

  v3 = -[OISFUZipArchiveFileDataRepresentation initWithPath:]([OISFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
  v4 = -[OISFUZipArchiveFileDataRepresentation inputStream](v3, "inputStream");
  v6 = objc_msgSend(v4, "readToBuffer:size:", &v8, 4) == 4 && v8 == 67324752;
  objc_msgSend(v4, "close");

  return v6;
}

os_log_t __38__OISFUZipArchive_isZipArchiveAtPath___block_invoke()
{
  os_log_t result;

  result = TSULogCreateCategory("TSUErrorCat");
  TSUErrorCat_log_t = (uint64_t)result;
  return result;
}

- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return -[OISFUZipArchive initWithPath:collapseCommonRootDirectory:ignoreCase:](self, "initWithPath:collapseCommonRootDirectory:ignoreCase:", a3, a4, 0);
}

- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  OISFUZipArchive *v8;

  v5 = a5;
  v6 = a4;
  v8 = -[OISFUZipArchive init](self, "init");
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)-[OISFUZipArchiveFileDataRepresentation initWithPath:]([OISFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
    -[OISFUZipArchive readEntries](v8, "readEntries");
    if (v6)
      -[OISFUZipArchive collapseCommonRootDirectoryIgnoreCase:](v8, "collapseCommonRootDirectoryIgnoreCase:", v5);
  }
  return v8;
}

- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return -[OISFUZipArchive initWithData:collapseCommonRootDirectory:ignoreCase:](self, "initWithData:collapseCommonRootDirectory:ignoreCase:", a3, a4, 0);
}

- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  OISFUZipArchive *v8;

  v5 = a5;
  v6 = a4;
  v8 = -[OISFUZipArchive init](self, "init");
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)-[OISFUZipArchiveMemoryDataRepresentation initWithData:]([OISFUZipArchiveMemoryDataRepresentation alloc], "initWithData:", a3);
    -[OISFUZipArchive readEntries](v8, "readEntries");
    if (v6)
      -[OISFUZipArchive collapseCommonRootDirectoryIgnoreCase:](v8, "collapseCommonRootDirectoryIgnoreCase:", v5);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUZipArchive;
  -[OISFUZipArchive dealloc](&v3, sel_dealloc);
}

- (id)entryWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", a3);
}

- (id)entryWithName:(id)a3 dataLength:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = -[OISFUZipArchive entryWithName:](self, "entryWithName:", a3);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setDataLength:", a4);
  return v6;
}

- (id)allEntryNames
{
  return (id)-[NSMutableDictionary allKeys](self->mEntries, "allKeys");
}

- (BOOL)isEncrypted
{
  return self->mPassphraseVerifier != 0;
}

- (id)passphraseVerifier
{
  return self->mPassphraseVerifier;
}

- (id)passphraseHint
{
  return self->mPassphraseHint;
}

- (id)encryptedDocumentUuid
{
  return self->mEncryptedDocumentUuid;
}

- (void)setCryptoKey:(id)a3
{
  id v5;

  v5 = a3;

  self->mCryptoKey = (OISFUCryptoKey *)a3;
  objc_msgSend((id)-[NSMutableDictionary allValues](self->mEntries, "allValues"), "makeObjectsPerformSelector:withObject:", sel_setCryptoKey_, self->mCryptoKey);
}

- (BOOL)decompressAtPath:(id)a3
{
  return -[OISFUZipArchive decompressAtPath:wasEmpty:](self, "decompressAtPath:wasEmpty:", a3, 0);
}

- (BOOL)decompressAtPath:(id)a3 wasEmpty:(BOOL *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  char v18;
  BOOL *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v26 = 0;
  v20 = a4;
  if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", a3, &v26) & 1) != 0)
  {
    if (!v26)
    {
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchive decompressAtPath:wasEmpty:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"), 224, 0, "Can only decompress into a directory");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_19:
      v18 = 0;
      v16 = 0;
      goto LABEL_22;
    }
  }
  else if ((objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, 0, 0) & 1) == 0)
  {
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipArchive decompressAtPath:wasEmpty:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"), 221, 0, "Can't create output directory");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    goto LABEL_19;
  }
  v8 = (void *)objc_msgSend(-[OISFUZipArchive allEntryNames](self, "allEntryNames", a4), "sortedArrayUsingSelector:", sel_compare_);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = 0;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "length");
        v15 = (void *)objc_msgSend(a3, "stringByAppendingPathComponent:", v13);
        if (objc_msgSend(v13, "characterAtIndex:", v14 - 1) == 47)
        {
          v16 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);
        }
        else
        {
          v16 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v15, "stringByDeletingLastPathComponent"), 1, 0, 0);
          objc_msgSend(-[OISFUZipArchive entryWithName:](self, "entryWithName:", v13), "copyToFile:", v15);
          if ((v9 & 1) == 0 && !objc_msgSend(v13, "hasPrefix:", CFSTR(".")))
            v9 = 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }
  else
  {
    v16 = 1;
  }
  v18 = v9;
LABEL_22:
  if (v20)
    *v20 = v18 ^ 1;
  return v16;
}

- (id)commonRootDirectoryIgnoringCase:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *context;

  v3 = a3;
  context = (void *)MEMORY[0x22E2DDB58](self, a2);
  v5 = -[OISFUZipArchive allEntryNames](self, "allEntryNames");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = v3 | 2;
    while (1)
    {
      v11 = (void *)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v9), "pathComponents");
      if ((unint64_t)objc_msgSend(v11, "count") < 2
        || (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", CFSTR("__MACOSX")) & 1) == 0)
      {
        if (v8)
        {
          v12 = 0;
          if (objc_msgSend(v8, "count"))
          {
            do
            {
              if (v12 >= objc_msgSend(v11, "count"))
                break;
              if (objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v12), "compare:options:", objc_msgSend(v11, "objectAtIndexedSubscript:", v12), v10))
              {
                break;
              }
              ++v12;
            }
            while (v12 < objc_msgSend(v8, "count"));
            if (v12 == 0x7FFFFFFFFFFFFFFFLL)
              break;
          }
          if (v12 != objc_msgSend(v8, "count") + 1)
            objc_msgSend(v8, "removeObjectsInRange:", v12, objc_msgSend(v8, "count") - v12);
        }
        else
        {
          v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
          objc_msgSend(v8, "removeLastObject");
        }
      }
      if (++v9 == v7)
        goto LABEL_17;
    }
  }
  v8 = 0;
LABEL_17:
  if (objc_msgSend(v8, "count"))
    v13 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v8);
  else
    v13 = 0;
  objc_autoreleasePoolPop(context);
  return v13;
}

- (void)readEntries
{
  void *context;

  context = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OISFUZipRecordInputStream initWithDataRepresentation:]([OISFUZipRecordInputStream alloc], "initWithDataRepresentation:", self->mDataRepresentation);
  -[OISFUZipArchive readEndOfCentralDirectoryFromInputStream:](self, "readEndOfCentralDirectoryFromInputStream:");
  objc_autoreleasePoolPop(context);
}

- (void)collapseCommonRootDirectoryIgnoreCase:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v5 = (void *)MEMORY[0x22E2DDB58](self, a2);
  v6 = -[OISFUZipArchive commonRootDirectoryIgnoringCase:](self, "commonRootDirectoryIgnoringCase:", v3);
  if (v6)
  {
    v7 = v6;
    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    v9 = objc_msgSend(v7, "length");
    v10 = -[OISFUZipArchive allEntryNames](self, "allEntryNames");
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = v9 + 1;
      do
      {
        v15 = (void *)objc_msgSend(v10, "objectAtIndex:", v13);
        if (objc_msgSend(v15, "length") != v14 && (objc_msgSend(v15, "hasPrefix:", CFSTR("__MACOSX")) & 1) == 0)
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", v15), objc_msgSend(v15, "substringFromIndex:", v14));
        ++v13;
      }
      while (v12 != v13);
    }

    self->mEntries = v8;
  }
  objc_autoreleasePoolPop(v5);
}

- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3
{
  SFUZipEndOfCentralDirectory *result;
  SFUZipEndOfCentralDirectory *v8;
  unint64_t var0_high;
  int64_t var1_low;
  int64_t var1_high;
  uint64_t v14;

  v14 = -[SFUZipArchiveDataRepresentation dataLength](self->mDataRepresentation, "dataLength") - 22;
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:");
  v8 = (SFUZipEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    result = -[OISFUZipArchive searchForEndOfCentralDirectoryFromInputStream:offset:](self, "searchForEndOfCentralDirectoryFromInputStream:offset:", a4, &v14);
    v8 = result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  if (LOWORD(v8->var0) | WORD1(v8->var0))
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  var0_high = HIWORD(v8->var0);
  retstr->var0 = var0_high;
  var1_low = LODWORD(v8->var1);
  retstr->var1 = var1_low;
  var1_high = HIDWORD(v8->var1);
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || (_DWORD)var1_low == -1 || (_DWORD)var1_high == -1)
    return -[OISFUZipArchive readZip64EndOfCentralDirectoryFromInputStream:eocdOffset:](self, "readZip64EndOfCentralDirectoryFromInputStream:eocdOffset:", a4, v14);
  return result;
}

- (const)searchForEndOfCentralDirectoryFromInputStream:(id)a3 offset:(int64_t *)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  _BYTE *v17;
  _BYTE *v18;

  v6 = -[SFUZipArchiveDataRepresentation dataLength](self->mDataRepresentation, "dataLength");
  if (v6 <= 0x10015)
    v7 = v6;
  else
    v7 = 65557;
  v8 = v6 - v7;
  v9 = objc_msgSend(a3, "dataAtOffset:size:end:", v6 - v7, v7, v6);
  v10 = v7 & 0x3FF | 0x400;
  if (v10 >= v7)
    v10 = v7;
  v11 = (char *)(v9 + v7 - v10);
  if ((unint64_t)v11 >= v9)
  {
    v13 = v9;
    v14 = v10 - 21;
    do
    {
      if (v14 >= 1)
      {
        v15 = (unint64_t)&v11[v14];
        v16 = v11;
        do
        {
          v17 = memchr(v16, 80, v15 - (_QWORD)v16);
          v18 = (_BYTE *)v15;
          if (v17)
          {
            if (v17[1] == 75 && v17[2] == 5)
            {
              v18 = v17;
              if (v17[3] == 6)
              {
                v12 = v17 + 4;
                *a4 = (int64_t)&v17[v8 - v13];
                return v12;
              }
            }
            else
            {
              v18 = v17;
            }
          }
          v16 = v18 + 4;
        }
        while ((unint64_t)(v18 + 4) < v15);
      }
      v11 -= 1024;
      v14 = 1024;
    }
    while ((unint64_t)v11 >= v13);
  }
  +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Could not find the end of central directory record"));
  return 0;
}

- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 eocdOffset:(id)a4
{
  int64_t v8;
  SFUZipEndOfCentralDirectory *result;
  SFUZipEndOfCentralDirectory *v10;
  int64_t var1;

  v8 = a5 - 20;
  if ((unint64_t)a5 < 0x14)
    +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("File isn't long enough for Zip64 locator"));
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:", v8, 20, 0);
  v10 = result;
  if (LODWORD(result->var0) != 117853008)
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Zip64 end of central directory locator record signature not found"));
  if (HIDWORD(v10->var0))
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  var1 = v10->var1;
  if (LODWORD(v10->var2) != 1)
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  if (self)
    return -[OISFUZipArchive readZip64EndOfCentralDirectoryFromInputStream:offset:](self, "readZip64EndOfCentralDirectoryFromInputStream:offset:", a4, var1);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 offset:(id)a4
{
  SFUZipEndOfCentralDirectory *result;
  SFUZipEndOfCentralDirectory *v7;

  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:", a5, 56, 0);
  v7 = result;
  if (LODWORD(result->var0) != 101075792)
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Zip64 end of central directory record signature not found"));
  if (LODWORD(v7->var2))
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  if (HIDWORD(v7->var2))
    result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v7[1].var1;
  retstr->var2 = v7[2].var0;
  return result;
}

- (id)readFilenameFromBuffer:(const char *)a3 size:(unint64_t)a4
{
  id result;
  CFStringEncoding SystemEncoding;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, 4);
  if (!result)
  {
    SystemEncoding = CFStringGetSystemEncoding();
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, CFStringConvertEncodingToNSStringEncoding(SystemEncoding));
    if (!result)
    {
      +[OISFUZipException raise:format:](OISFUZipException, "raise:format:", CFSTR("SFUZipFilenameError"), CFSTR("Could not read filename."));
      return 0;
    }
  }
  return result;
}

- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  unsigned int v13;
  BOOL v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  if ((uint64_t)a4 >= 4)
  {
    v17 = v5;
    v18 = v6;
    v9 = &a3[a4];
    qmemcpy(v16, "iwphiwuu", sizeof(v16));
    do
    {
      v10 = *((unsigned __int16 *)a3 + 1);
      v11 = a3 + 4;
      v12 = &a3[v10 + 4];
      if (v12 > v9)
        break;
      v13 = *(unsigned __int16 *)a3;
      if (v13 > 0x636D)
      {
        if (v13 == 25454)
        {
          v14 = v10 >= 4 && self->mPassphraseHint == 0;
          if (v14 && *(_DWORD *)v11 == v16[0])
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 8, (v10 - 4));
            self->mPassphraseHint = (NSString *)+[OISFUCryptoUtils decodePassphraseHint:](OISFUCryptoUtils, "decodePassphraseHint:", v15);

          }
        }
        else if (v13 == 25455 && v10 >= 4 && !self->mEncryptedDocumentUuid && *(_DWORD *)v11 == v16[1])
        {
          self->mEncryptedDocumentUuid = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 8, (v10 - 4));
        }
      }
      else if (v13 == 1)
      {
        objc_msgSend(a5, "readZip64ExtraField:size:", a3 + 4);
      }
      else if (v13 == 25453 && v10 >= 4 && !self->mPassphraseVerifier && *(_DWORD *)v11 == 1987082089)
      {
        self->mPassphraseVerifier = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 8, (v10 - 4));
      }
      a3 = v12;
    }
    while (v12 + 4 <= v9);
  }
}

@end
