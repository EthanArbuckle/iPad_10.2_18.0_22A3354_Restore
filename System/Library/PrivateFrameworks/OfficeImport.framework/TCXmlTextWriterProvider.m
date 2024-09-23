@implementation TCXmlTextWriterProvider

- (void)dealloc
{
  objc_super v3;

  -[TCXmlTextWriterProvider tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)TCXmlTextWriterProvider;
  -[TCXmlTextWriterProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)setUp
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TCXmlTextWriterProvider setUp]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCXmlStreamWriter.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 33, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "-[TCXmlTextWriterProvider setUp]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (BOOL)setUpWithTextWriter:(_xmlTextWriter *)a3
{
  self->_textWriter = a3;
  return a3 != 0;
}

- (BOOL)tearDown
{
  _xmlTextWriter *textWriter;

  textWriter = self->_textWriter;
  if (textWriter)
  {
    xmlFreeTextWriter(self->_textWriter);
    self->_textWriter = 0;
  }
  return textWriter != 0;
}

- (_xmlTextWriter)textWriter
{
  return self->_textWriter;
}

@end
