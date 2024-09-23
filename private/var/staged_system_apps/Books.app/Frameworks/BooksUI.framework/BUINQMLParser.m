@implementation BUINQMLParser

+ (void)initialize
{
  objc_super v3;

  if ((id)objc_opt_class(BUINQMLParser, a2) == a1)
    xmlInitParser();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BUINQMLParser;
  objc_msgSendSuper2(&v3, "initialize");
}

- (BUINQMLParser)initWithString:(id)a3
{
  id v4;
  BUINQMLParser *v5;
  NSString *v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUINQMLParser;
  v5 = -[BUINQMLParser init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = v6;

  }
  return v5;
}

- (BUINQMLParser)init
{
  -[BUINQMLParser doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BooksUI.NQMLParser.errorDomain"), a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BUINQMLParser delegate](self, "delegate"));
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
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("BooksUI.NQMLParser.errorLineNumber"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->int2));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("BooksUI.NQMLParser.errorColumn"));

    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a3->message);
    if (v7)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, NSLocalizedDescriptionKey);
    -[BUINQMLParser reportErrorWithCode:userInfo:](self, "reportErrorWithCode:userInfo:", a3->code, v8);

  }
}

- (void)parse
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  unint64_t v7;
  BUINQMLParser *v8;
  uint64_t v9;
  htmlParserCtxtPtr MemoryParserCtxt;
  xmlParserCtxt *v11;
  int v12;
  xmlDoc *myDoc;
  xmlErrorPtr LastError;
  _OWORD v15[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BUINQMLParser delegate](self, "delegate"));

  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BUINQMLParser string](self, "string")));
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    if (!v5
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[BUINQMLParser string](self, "string")),
          v7 = (unint64_t)objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4),
          v6,
          v7 >> 31))
    {
      v8 = self;
      v9 = -101;
LABEL_5:
      -[BUINQMLParser reportErrorWithCode:userInfo:](v8, "reportErrorWithCode:userInfo:", v9, 0);
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
    v15[6] = *(_OWORD *)off_248FB0;
    v15[7] = *(_OWORD *)off_248FC0;
    v15[11] = *(_OWORD *)&off_249000;
    v15[8] = unk_248FD0;
    memset(&v15[9], 0, 32);
    memset(&v15[12], 0, 64);
    memset(v15, 0, 96);
    MemoryParserCtxt->sax = (_xmlSAXHandler *)v15;
    MemoryParserCtxt->userData = self;
    MemoryParserCtxt->encoding = (const xmlChar *)"UTF-8";
    MemoryParserCtxt->charset = 1;
    htmlCtxtUseOptions(MemoryParserCtxt, 10305);
    -[BUINQMLParser set_parserContext:](self, "set_parserContext:", v11);
    v12 = htmlParseDocument(v11);
    myDoc = v11->myDoc;
    if (myDoc)
      xmlFreeDoc(myDoc);
    v11->encoding = 0;
    v11->charset = 0;
    v11->sax = 0;
    v11->userData = 0;
    xmlFreeParserCtxt(v11);
    -[BUINQMLParser set_parserContext:](self, "set_parserContext:", 0);
    if (v12)
    {
      LastError = xmlCtxtGetLastError(-[BUINQMLParser _parserContext](self, "_parserContext"));
      if (LastError)
        -[BUINQMLParser reportParseError:](self, "reportParseError:", LastError);
    }
  }
}

- (NSString)string
{
  return self->_string;
}

- (BUINQMLParser)delegate
{
  return (BUINQMLParser *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  self->__parserContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
