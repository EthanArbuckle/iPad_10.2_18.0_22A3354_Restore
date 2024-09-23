@implementation SiriTTSHTMLSAXParser

- (void)parse:(id)a3
{
  xmlSAXHandler v3;

  htmlSAXParseDoc((const xmlChar *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, SiriTTSHTMLSAXParserHandleDocumentStart, SiriTTSHTMLSAXParserHandleDocumentEnd, SiriTTSHTMLSAXParserHandleElementStart, SiriTTSHTMLSAXParserHandleElementEnd,
                       0,
                       SiriTTSHTMLSAXParserHandleCharacters,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0),
    "utf-8",
    &v3,
    self);
}

- (SiriTTSHTMLSAXParserDelegate)delegate
{
  return (SiriTTSHTMLSAXParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
