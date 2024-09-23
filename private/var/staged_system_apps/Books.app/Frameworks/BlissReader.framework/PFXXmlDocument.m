@implementation PFXXmlDocument

+ (void)initialize
{
  uint64_t v2;

  if ((id)objc_opt_class(PFXXmlDocument, a2) == a1)
    objc_opt_class(PFXConstants, v2);
}

+ (BOOL)readWithState:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "streamAPI");
  if (v5)
    LOBYTE(v5) = +[PFXStreamReader readWithElementReaders:textReader:piReader:readerState:](PFXStreamReader, "readWithElementReaders:textReader:piReader:readerState:", objc_msgSend(a1, "elementReaders"), objc_msgSend(a1, "textReaderClass"), objc_msgSend(a1, "processingInstructionReaderClass"), a3);
  return (char)v5;
}

+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  return 1;
}

+ (id)elementReaders
{
  return 0;
}

+ (Class)textReaderClass
{
  return 0;
}

@end
