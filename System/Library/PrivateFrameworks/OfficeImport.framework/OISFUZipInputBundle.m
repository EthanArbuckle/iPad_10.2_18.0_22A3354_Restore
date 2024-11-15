@implementation OISFUZipInputBundle

- (OISFUZipInputBundle)initWithZipArchive:(id)a3
{
  OISFUZipInputBundle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OISFUZipInputBundle;
  v4 = -[OISFUZipInputBundle init](&v6, sel_init);
  if (v4)
    v4->_zipArchive = (OISFUZipArchive *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUZipInputBundle;
  -[OISFUZipInputBundle dealloc](&v3, sel_dealloc);
}

- (BOOL)hasEntryWithName:(id)a3
{
  return -[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3) != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  return (id)objc_msgSend(-[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "inputStream");
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  return (id)objc_msgSend(-[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "bufferedInputStream");
}

- (int64_t)lengthOfEntry:(id)a3
{
  return objc_msgSend(-[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "dataLength");
}

- (unsigned)crc32ForEntry:(id)a3
{
  return objc_msgSend(-[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "crc");
}

- (void)copyEntry:(id)a3 toFile:(id)a4
{
  id v6;
  uint64_t v7;

  v6 = -[OISFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:");
  if (!v6)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipInputBundle copyEntry:toFile:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUInputBundle.m"), 66, 0, "Asked to copy missing entry %@", a3);
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }

}

@end
