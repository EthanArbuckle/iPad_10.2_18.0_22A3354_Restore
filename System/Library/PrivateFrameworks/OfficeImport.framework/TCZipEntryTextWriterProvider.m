@implementation TCZipEntryTextWriterProvider

- (TCZipEntryTextWriterProvider)initWithEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5
{
  id v8;
  OISFUZipArchiveOutputStream *v9;
  TCZipEntryTextWriterProvider *v10;
  uint64_t v11;
  NSString *entryName;
  objc_super v14;

  v8 = a3;
  v9 = (OISFUZipArchiveOutputStream *)a4;
  v14.receiver = self;
  v14.super_class = (Class)TCZipEntryTextWriterProvider;
  v10 = -[TCZipEntryTextWriterProvider init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    entryName = v10->_entryName;
    v10->_entryName = (NSString *)v11;

    v10->_outputStream = v9;
    v10->_isCompressed = a5;
  }

  return v10;
}

- (BOOL)setUp
{
  xmlOutputBuffer *IO;

  -[OISFUZipArchiveOutputStream beginUnknownSizeEntryWithName:isCompressed:](self->_outputStream, "beginUnknownSizeEntryWithName:isCompressed:", self->_entryName, self->_isCompressed);
  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)SFUSimpleXmlOutputCloseCallback, self->_outputStream, 0);
  return -[TCXmlTextWriterProvider setUpWithTextWriter:](self, "setUpWithTextWriter:", xmlNewTextWriter(IO));
}

- (NSString)entryName
{
  return self->_entryName;
}

- (OISFUZipArchiveOutputStream)outputStream
{
  return self->_outputStream;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryName, 0);
}

@end
