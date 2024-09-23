@implementation SFUZipInputBundle

- (SFUZipInputBundle)initWithZipArchive:(id)a3
{
  SFUZipInputBundle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUZipInputBundle;
  v4 = -[SFUZipInputBundle init](&v6, sel_init);
  if (v4)
    v4->_zipArchive = (SFUZipArchive *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUZipInputBundle;
  -[SFUZipInputBundle dealloc](&v3, sel_dealloc);
}

- (BOOL)hasEntryWithName:(id)a3
{
  return -[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3) != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  return (id)objc_msgSend(-[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "inputStream");
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  return (id)objc_msgSend(-[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "bufferedInputStream");
}

- (int64_t)lengthOfEntry:(id)a3
{
  return objc_msgSend(-[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "dataLength");
}

- (unsigned)crc32ForEntry:(id)a3
{
  return objc_msgSend(-[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:", a3), "crc");
}

- (void)copyEntry:(id)a3 toFile:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = -[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:");
  if (!v6)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipInputBundle copyEntry:toFile:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUInputBundle.m"), 70, CFSTR("Asked to copy missing entry %@"), a3);
  }

}

@end
