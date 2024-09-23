@implementation ASKNQMLParser

+ (void)initialize
{
  objc_super v3;

  if ((id)objc_opt_class(ASKNQMLParser, a2) == a1)
    xmlInitParser();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ASKNQMLParser;
  objc_msgSendSuper2(&v3, "initialize");
}

- (ASKNQMLParser)initWithString:(id)a3
{
  id v4;
  ASKNQMLParser *v5;
  NSString *v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKNQMLParser;
  v5 = -[ASKNQMLParser init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = v6;

  }
  return v5;
}

- (ASKNQMLParser)init
{
  -[ASKNQMLParser doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ShelfKit.NqmlParser.errorDomain"), a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKNQMLParser delegate](self, "delegate"));
  objc_msgSend(v5, "parser:parseErrorOccurred:", self, v6);

}

- (void)reportParseError:(_xmlError *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (a3->level == XML_ERR_FATAL)
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->line));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("ShelfKit.NqmlParser.errorLineNumber"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->int2));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("ShelfKit.NqmlParser.errorColumn"));

    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a3->message);
    if (v7)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, NSLocalizedDescriptionKey);
    -[ASKNQMLParser reportErrorWithCode:userInfo:](self, "reportErrorWithCode:userInfo:", a3->code, v8);

  }
}

- (void)parse
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  unint64_t v7;
  ASKNQMLParser *v8;
  uint64_t v9;
  htmlParserCtxtPtr MemoryParserCtxt;
  xmlParserCtxt *v11;
  _xmlSAXHandler *sax;
  xmlErrorPtr LastError;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKNQMLParser delegate](self, "delegate"));

  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASKNQMLParser string](self, "string")));
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    if (!v5
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKNQMLParser string](self, "string")),
          v7 = (unint64_t)objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4),
          v6,
          v7 >> 31))
    {
      v8 = self;
      v9 = -101;
LABEL_5:
      -[ASKNQMLParser reportErrorWithCode:userInfo:](v8, "reportErrorWithCode:userInfo:", v9, 0);
      return;
    }
    MemoryParserCtxt = htmlCreateMemoryParserCtxt(v5, v7);
    if (!MemoryParserCtxt)
    {
      v8 = self;
      v9 = -100;
      goto LABEL_5;
    }
    v11 = MemoryParserCtxt;
    sax = MemoryParserCtxt->sax;
    sax->startDocument = (startDocumentSAXFunc)ASKNQMLParserStartDocument;
    sax->endDocument = (endDocumentSAXFunc)ASKNQMLParserEndDocument;
    sax->error = (errorSAXFunc)ASKNQMLParserError;
    sax->startElement = (startElementSAXFunc)ASKNQMLParserStartElement;
    sax->endElement = (endElementSAXFunc)ASKNQMLParserEndElement;
    sax->characters = (charactersSAXFunc)ASKNQMLParserCharacters;
    MemoryParserCtxt->userData = self;
    MemoryParserCtxt->encoding = (const xmlChar *)"UTF-8";
    MemoryParserCtxt->charset = 1;
    htmlCtxtUseOptions(MemoryParserCtxt, 10305);
    -[ASKNQMLParser set_parserContext:](self, "set_parserContext:", v11);
    if (htmlParseDocument(v11))
    {
      LastError = xmlCtxtGetLastError(-[ASKNQMLParser _parserContext](self, "_parserContext"));
      if (LastError)
        -[ASKNQMLParser reportParseError:](self, "reportParseError:", LastError);
    }
    -[ASKNQMLParser set_parserContext:](self, "set_parserContext:", 0);
  }
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  _xmlParserCtxt *parserContext;
  xmlDoc *myDoc;

  parserContext = self->__parserContext;
  if (parserContext)
  {
    myDoc = parserContext->myDoc;
    if (myDoc)
    {
      xmlFreeDoc(myDoc);
      parserContext->myDoc = 0;
    }
    parserContext->encoding = 0;
    parserContext->userData = 0;
    htmlFreeParserCtxt(parserContext);
  }
  self->__parserContext = a3;
}

- (NSString)string
{
  return self->_string;
}

- (ASKNQMLParser)delegate
{
  return (ASKNQMLParser *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
