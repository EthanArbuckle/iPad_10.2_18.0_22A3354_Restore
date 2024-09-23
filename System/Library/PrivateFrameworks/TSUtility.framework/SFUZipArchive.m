@implementation SFUZipArchive

+ (BOOL)isZipArchiveAtPath:(id)a3
{
  SFUZipArchiveFileDataRepresentation *v3;
  id v4;
  BOOL v6;
  int v8;

  v3 = -[SFUZipArchiveFileDataRepresentation initWithPath:]([SFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
  v4 = -[SFUZipArchiveFileDataRepresentation inputStream](v3, "inputStream");
  v6 = objc_msgSend(v4, "readToBuffer:size:", &v8, 4) == 4 && v8 == 67324752;
  objc_msgSend(v4, "close");

  return v6;
}

- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  _BOOL4 v4;
  SFUZipArchive *v6;

  v4 = a4;
  v6 = -[SFUZipArchive init](self, "init");
  if (v6)
  {
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->mDataRepresentation = (SFUZipArchiveDataRepresentation *)-[SFUZipArchiveFileDataRepresentation initWithPath:]([SFUZipArchiveFileDataRepresentation alloc], "initWithPath:", a3);
    -[SFUZipArchive readEntries](v6, "readEntries");
    if (v4)
      -[SFUZipArchive collapseCommonRootDirectory](v6, "collapseCommonRootDirectory");
  }
  return v6;
}

- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  _BOOL4 v4;
  SFUZipArchive *v6;

  v4 = a4;
  v6 = -[SFUZipArchive init](self, "init");
  if (v6)
  {
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->mDataRepresentation = (SFUZipArchiveDataRepresentation *)-[SFUZipArchiveMemoryDataRepresentation initWithData:]([SFUZipArchiveMemoryDataRepresentation alloc], "initWithData:", a3);
    -[SFUZipArchive readEntries](v6, "readEntries");
    if (v4)
      -[SFUZipArchive collapseCommonRootDirectory](v6, "collapseCommonRootDirectory");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchive;
  -[SFUZipArchive dealloc](&v3, sel_dealloc);
}

- (id)entryWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", a3);
}

- (id)entryWithName:(id)a3 dataLength:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = -[SFUZipArchive entryWithName:](self, "entryWithName:", a3);
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

  self->mCryptoKey = (SFUCryptoKey *)a3;
  objc_msgSend((id)-[NSMutableDictionary allValues](self->mEntries, "allValues"), "makeObjectsPerformSelector:withObject:", sel_setCryptoKey_, self->mCryptoKey);
}

- (BOOL)decompressAtPath:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v24 = 0;
  if ((objc_msgSend(v5, "fileExistsAtPath:isDirectory:", a3, &v24) & 1) != 0)
  {
    if (!v24)
    {
      v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchive decompressAtPath:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 231, CFSTR("Can only decompress into a directory"));
      return 0;
    }
  }
  else if ((objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, 0, 0) & 1) == 0)
  {
    v17 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipArchive decompressAtPath:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 226, CFSTR("Can't create output directory"));
    return 0;
  }
  v8 = (void *)objc_msgSend(-[SFUZipArchive allEntryNames](self, "allEntryNames"), "sortedArrayUsingSelector:", sel_compare_);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v9)
    return 1;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "length");
      v14 = (void *)objc_msgSend(a3, "stringByAppendingPathComponent:", v12);
      if (objc_msgSend(v12, "characterAtIndex:", v13 - 1) == 47)
      {
        v15 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);
      }
      else
      {
        v15 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v14, "stringByDeletingLastPathComponent"), 1, 0, 0);
        v16 = -[SFUZipArchive entryWithName:](self, "entryWithName:", v12);
        objc_msgSend(v16, "copyToFile:", v14);
        -[SFUZipArchiveDelegate zipArchiveDidDecompressEntry:](-[SFUZipArchive delegate](self, "delegate"), "zipArchiveDidDecompressEntry:", v16);
      }
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  }
  while (v9);
  return v15;
}

- (SFUZipArchiveDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFUZipArchiveDelegate *)a3;
}

- (void)readEntries
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
  -[SFUZipRecordInputStream initWithDataRepresentation:]([SFUZipRecordInputStream alloc], "initWithDataRepresentation:", self->mDataRepresentation);
  -[SFUZipArchive readEndOfCentralDirectoryFromInputStream:](self, "readEndOfCentralDirectoryFromInputStream:");

}

- (void)collapseCommonRootDirectory
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v20 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v3 = -[SFUZipArchive allEntryNames](self, "allEntryNames");
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v7), "pathComponents");
      if ((unint64_t)objc_msgSend(v8, "count") < 2
        || (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "isEqualToString:", CFSTR("__MACOSX")) & 1) == 0)
      {
        if (v6)
        {
          v9 = 0;
          if (objc_msgSend(v6, "count"))
          {
            do
            {
              if (v9 >= objc_msgSend(v8, "count"))
                break;
              if (!objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", v9), "isEqualToString:", objc_msgSend(v8, "objectAtIndexedSubscript:", v9)))break;
              ++v9;
            }
            while (v9 < objc_msgSend(v6, "count"));
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
              break;
          }
          if (v9 != objc_msgSend(v6, "count") + 1)
            objc_msgSend(v6, "removeObjectsInRange:", v9, objc_msgSend(v6, "count") - v9);
        }
        else
        {
          v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v8);
          objc_msgSend(v6, "removeLastObject");
        }
      }
      if (++v7 == v5)
        goto LABEL_17;
    }
  }
  v6 = 0;
LABEL_17:
  if (objc_msgSend(v6, "count"))
    v10 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v6);
  else
    v10 = 0;

  v11 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (v10)
  {
    v21 = v11;
    v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    v13 = objc_msgSend(v10, "length");
    v14 = -[SFUZipArchive allEntryNames](self, "allEntryNames");
    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = v13 + 1;
      do
      {
        v19 = (void *)objc_msgSend(v14, "objectAtIndex:", v17);
        if (objc_msgSend(v19, "length") != v18 && (objc_msgSend(v19, "hasPrefix:", CFSTR("__MACOSX")) & 1) == 0)
          -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", -[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", v19), objc_msgSend(v19, "substringFromIndex:", v18));
        ++v17;
      }
      while (v16 != v17);
    }

    self->mEntries = v12;
    v11 = v21;
  }

}

- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3
{
  SFUZipEndOfCentralDirectory *result;
  SFUZipEndOfCentralDirectory *v8;
  unint64_t var0_high;
  int64_t var1_low;
  int64_t var1_high;
  __int128 v14;
  int64_t v15;
  uint64_t v16;

  v16 = -[SFUZipArchiveDataRepresentation dataLength](self->mDataRepresentation, "dataLength") - 22;
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:");
  v8 = (SFUZipEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    result = -[SFUZipArchive searchForEndOfCentralDirectoryFromInputStream:offset:](self, "searchForEndOfCentralDirectoryFromInputStream:offset:", a4, &v16);
    v8 = result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  if (LOWORD(v8->var0) | WORD1(v8->var0))
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  var0_high = HIWORD(v8->var0);
  var1_low = LODWORD(v8->var1);
  var1_high = HIDWORD(v8->var1);
  retstr->var0 = var0_high;
  retstr->var1 = var1_low;
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || (_DWORD)var1_low == -1 || (_DWORD)var1_high == -1)
  {
    v14 = 0uLL;
    v15 = 0;
    result = -[SFUZipArchive readZip64EndOfCentralDirectoryFromInputStream:eocdOffset:](self, "readZip64EndOfCentralDirectoryFromInputStream:eocdOffset:", a4, v16);
    if (*((_QWORD *)&v14 + 1))
    {
      *(_OWORD *)&retstr->var0 = v14;
      retstr->var2 = v15;
    }
  }
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
  +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Could not find the end of central directory record"));
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
    +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("File isn't long enough for Zip64 locator"));
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:", v8, 20, 0);
  v10 = result;
  if (LODWORD(result->var0) != 117853008)
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Zip64 end of central directory locator record signature not found"));
  if (HIDWORD(v10->var0))
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  var1 = v10->var1;
  if (LODWORD(v10->var2) != 1)
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  if (self)
    return -[SFUZipArchive readZip64EndOfCentralDirectoryFromInputStream:offset:](self, "readZip64EndOfCentralDirectoryFromInputStream:offset:", a4, var1);
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
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("Zip64 end of central directory record signature not found"));
  if (LODWORD(v7->var2))
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
  if (HIDWORD(v7->var2))
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipEndOfCentralDirectoryError"), CFSTR("No multi-disk support"));
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
      +[SFUZipException raise:format:](SFUZipException, "raise:format:", CFSTR("SFUZipFilenameError"), CFSTR("Could not read filename."));
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
            self->mPassphraseHint = (NSString *)+[SFUCryptoUtils decodePassphraseHint:](SFUCryptoUtils, "decodePassphraseHint:", v15);

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
