@implementation TCFileTextWriterProvider

- (TCFileTextWriterProvider)initWithFilePath:(id)a3
{
  id v4;
  TCFileTextWriterProvider *v5;
  uint64_t v6;
  NSString *filePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCFileTextWriterProvider;
  v5 = -[TCFileTextWriterProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;

  }
  return v5;
}

- (BOOL)setUp
{
  return -[TCXmlTextWriterProvider setUpWithTextWriter:](self, "setUpWithTextWriter:", xmlNewTextWriterFilename(-[NSString UTF8String](self->_filePath, "UTF8String"), 0));
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
