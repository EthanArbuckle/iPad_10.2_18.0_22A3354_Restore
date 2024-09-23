@implementation PFTTMLParser

- (PFTTMLParser)initWithData:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PFTTMLParser *v8;
  PFTTMLParser *v9;
  uint64_t v10;
  NSXMLParser *parser;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = -[PFTTMLParser init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v6);
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;

  }
  return v9;
}

- (PFTTMLParser)initWithStream:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PFTTMLParser *v8;
  PFTTMLParser *v9;
  uint64_t v10;
  NSXMLParser *parser;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = -[PFTTMLParser init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithStream:", v6);
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;

  }
  return v9;
}

- (PFTTMLParser)initWithContentsOfURL:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PFTTMLParser *v8;
  PFTTMLParser *v9;
  uint64_t v10;
  NSXMLParser *parser;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = -[PFTTMLParser init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithContentsOfURL:", v6);
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;

  }
  return v9;
}

- (void)parse
{
  void *v3;
  id v4;

  -[PFTTMLParser parser](self, "parser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[PFTTMLParser parser](self, "parser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parse");

}

- (void)abortParsing
{
  id v2;

  -[PFTTMLParser parser](self, "parser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "abortParsing");

}

- (int64_t)unitForCurrentSpan
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_currentElementAttributes, "objectForKeyedSubscript:", CFSTR("podcasts:unit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("sentence")) & 1) != 0)
  {
    v3 = 0;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("word")))
  {
    v3 = 1;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

- (id)stringForElementAttribute:(int64_t)a3
{
  NSDictionary *currentElementAttributes;
  void *v4;
  void *v5;

  currentElementAttributes = self->_currentElementAttributes;
  PFTTMLDictionaryKeyForStringAttribute(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](currentElementAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)timeForElementAttribute:(int64_t)a3
{
  NSDictionary *currentElementAttributes;
  void *v4;
  void *v5;
  double v6;
  double v7;

  currentElementAttributes = self->_currentElementAttributes;
  PFTTMLDictionaryKeyForTimeAttribute(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](currentElementAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalFromTimecode");
  v7 = v6;

  return v7;
}

- (void)parserDidStartDocument:(id)a3
{
  id v4;

  -[PFTTMLParser delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parserDidStartDocument:", self);

}

- (void)parserDidEndDocument:(id)a3
{
  id v4;

  -[PFTTMLParser delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parserDidEndDocument:", self);

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9;
  uint64_t v10;
  void *v11;

  v9 = a4;
  -[PFTTMLParser setCurrentElementAttributes:](self, "setCurrentElementAttributes:", a7);
  v10 = PFTTMLTypeForName(v9);

  -[PFTTMLParser delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parser:didStartElementType:", self, v10);

  -[PFTTMLParser setCurrentElementAttributes:](self, "setCurrentElementAttributes:", 0);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v7;
  id v8;

  v7 = PFTTMLTypeForName(a4);
  -[PFTTMLParser delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parser:didEndElementType:", self, v7);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PFTTMLParser delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parser:foundCharacters:", self, v5);

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PFTTMLParser delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parser:parseErrorOccurred:", self, v5);

}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PFTTMLParser delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parser:validationErrorOccurred:", self, v5);

}

- (PFTTMLParserDelegate)delegate
{
  return (PFTTMLParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXMLParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (NSDictionary)currentElementAttributes
{
  return self->_currentElementAttributes;
}

- (void)setCurrentElementAttributes:(id)a3
{
  self->_currentElementAttributes = (NSDictionary *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
