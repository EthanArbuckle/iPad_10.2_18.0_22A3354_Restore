@implementation TCMemoryBufferTextWriterProvider

- (TCMemoryBufferTextWriterProvider)initWithMemoryBuffer:(id)a3
{
  id v5;
  TCMemoryBufferTextWriterProvider *v6;
  TCMemoryBufferTextWriterProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCMemoryBufferTextWriterProvider;
  v6 = -[TCMemoryBufferTextWriterProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_memoryBuffer, a3);

  return v7;
}

- (BOOL)setUp
{
  xmlOutputBuffer *IO;

  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, self->_memoryBuffer, 0);
  if (IO)
    LOBYTE(IO) = -[TCXmlTextWriterProvider setUpWithTextWriter:](self, "setUpWithTextWriter:", xmlNewTextWriter(IO));
  return (char)IO;
}

- (NSMutableData)memoryBuffer
{
  return self->_memoryBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryBuffer, 0);
}

@end
