@implementation RUIParser

+ (int64_t)textAlignmentForString:(id)a3
{
  return +[RUITopLevelElementParser textAlignmentForString:](RUITopLevelElementParser, "textAlignmentForString:", a3);
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RUIParser *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[RUIParser initWithXML:baseURL:style:delegate:decodingUserInfo:](self, "initWithXML:baseURL:style:delegate:decodingUserInfo:", v13, v12, v11, v10, v14);

  return v15;
}

- (RUIParser)initWithDelegate:(id)a3
{
  id v4;
  RUIParser *v5;
  RUIParser *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIParser;
  v5 = -[RUIParser init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (RUIParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RUIParser *v14;
  RUIParser *v15;
  RUIObjectModelParser *v16;
  RUIObjectModelParser *objectModelParser;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RUIParser;
  v14 = -[RUIParser init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v12);
    v16 = -[RUIObjectModelParser initWithBaseURL:style:delegate:decodingUserInfo:]([RUIObjectModelParser alloc], "initWithBaseURL:style:delegate:decodingUserInfo:", v10, v11, v15, v13);
    objectModelParser = v15->_objectModelParser;
    v15->_objectModelParser = v16;

  }
  return v15;
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6 decodingUserInfo:(id)a7
{
  id v12;
  RUIParser *v13;
  RUIParser *v14;
  void *v15;

  v12 = a3;
  v13 = -[RUIParser initWithBaseURL:style:delegate:decodingUserInfo:](self, "initWithBaseURL:style:delegate:decodingUserInfo:", a4, a5, a6, a7);
  v14 = v13;
  if (v13)
  {
    -[RUIParser parseXML:](v13, "parseXML:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIParser parseObjectModelWithXMLElement:](v14, "parseObjectModelWithXMLElement:", v15);

  }
  return v14;
}

- (void)parseObjectModelWithXMLElement:(id)a3
{
  void *v4;
  NSError *v5;
  NSError **p_error;
  NSError *error;
  NSError *v8;
  NSError *v9;

  -[RUIObjectModelParser parseXMLElement:](self->_objectModelParser, "parseXMLElement:", a3);
  -[RUIObjectModelParser error](self->_objectModelParser, "error");
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModelParser uiObjectModel](self->_objectModelParser, "uiObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  p_error = &self->_error;
  v5 = error;
  if (error)
    v8 = v5;
  else
    v8 = v9;
  objc_storeStrong((id *)p_error, v8);
  *((_BYTE *)p_error - 24) = *p_error == 0;
  objc_msgSend(v4, "parseDidFinish");

}

- (id)parseXML:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  RUIXMLSanitizer *v10;
  void *v11;
  NSError *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSError *v16;
  NSError **p_error;
  NSError *error;
  NSError *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "Treating empty document as valid", buf, 2u);
      }

    }
    objc_msgSend(CFSTR("<xmlui action=\"push\"/>"), "dataUsingEncoding:", 4);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
  }
  v10 = objc_alloc_init(RUIXMLSanitizer);
  v22 = 0;
  -[RUIXMLSanitizer sanitizedXMLElementWithData:error:](v10, "sanitizedXMLElementWithData:error:", v4, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSError *)v22;
  v21 = 0;
  -[RUIXMLSanitizer logStringWithXMLString:error:](v10, "logStringWithXMLString:error:", v5, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v14)
  {
    _RUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RUIParser parseXML:].cold.1((uint64_t)v14, v15);
LABEL_10:

    goto LABEL_11;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_209E87000, v15, OS_LOG_TYPE_DEFAULT, "RUIParser processing document:\n%@", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
  if (v12)
  {
    error = self->_error;
    p_error = &self->_error;
    v16 = error;
    if (error)
      v19 = v16;
    else
      v19 = v12;
    objc_storeStrong((id *)p_error, v19);
    *((_BYTE *)p_error - 24) = 0;
  }

  return v11;
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 delegate:(id)a5
{
  return -[RUIParser initWithXML:baseURL:style:delegate:](self, "initWithXML:baseURL:style:delegate:", a3, a4, 0, a5);
}

- (RUIParser)initWithXML:(id)a3
{
  return -[RUIParser initWithXML:baseURL:delegate:](self, "initWithXML:baseURL:delegate:", a3, 0, 0);
}

- (id)actionSignal
{
  return -[RUIObjectModelParser actionSignal](self->_objectModelParser, "actionSignal");
}

- (id)uiObjectModel
{
  return -[RUIObjectModelParser uiObjectModel](self->_objectModelParser, "uiObjectModel");
}

+ (id)textStyleForString:(id)a3
{
  return +[RUITopLevelElementParser textStyleForString:](RUITopLevelElementParser, "textStyleForString:", a3);
}

- (id)objectModelParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "parser:createPageWithName:attributes:", self, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)tableRowClassForElementName:(id)a3
{
  return +[RUITopLevelElementParser tableRowClassForElementName:](RUITopLevelElementParser, "tableRowClassForElementName:", a3);
}

+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5
{
  return +[RUITopLevelElementParser rowWithAttributeDict:delegate:parent:](RUITopLevelElementParser, "rowWithAttributeDict:delegate:parent:", a3, a4, a5);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSData)xmlData
{
  return self->_xmlData;
}

- (void)setXmlData:(id)a3
{
  objc_storeStrong((id *)&self->_xmlData, a3);
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (RUIParserDelegate)delegate
{
  return (RUIParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_xmlData, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_objectModelParser, 0);
}

- (void)parseXML:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_209E87000, a2, OS_LOG_TYPE_ERROR, "RUIParser failed to decode string with error:%@", (uint8_t *)&v2, 0xCu);
}

@end
