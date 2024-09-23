@implementation RUIObjectModelParser

- (RUIObjectModelParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RUIObjectModelParser *v14;
  RUIObjectModel *v15;
  RUIObjectModel *uiObjectModel;
  NSMutableArray *v17;
  NSMutableArray *pages;
  NSMutableArray *v19;
  NSMutableArray *currentPageStack;
  uint64_t v21;
  NSMutableString *accumulator;
  uint64_t v23;
  NSMutableArray *elementStack;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)RUIObjectModelParser;
  v14 = -[RUIObjectModelParser init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(RUIObjectModel);
    uiObjectModel = v14->_uiObjectModel;
    v14->_uiObjectModel = v15;

    -[RUIObjectModel setDecodingUserInfo:](v14->_uiObjectModel, "setDecodingUserInfo:", v13);
    -[RUIObjectModel setSourceURL:](v14->_uiObjectModel, "setSourceURL:", v10);
    -[RUIObjectModel setStyle:](v14->_uiObjectModel, "setStyle:", v11);
    -[RUIObjectModelParser setBaseURL:](v14, "setBaseURL:", v10);
    -[RUIObjectModelParser setDelegate:](v14, "setDelegate:", v12);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pages = v14->_pages;
    v14->_pages = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    currentPageStack = v14->_currentPageStack;
    v14->_currentPageStack = v19;

    v21 = objc_opt_new();
    accumulator = v14->_accumulator;
    v14->_accumulator = (NSMutableString *)v21;

    v23 = objc_opt_new();
    elementStack = v14->_elementStack;
    v14->_elementStack = (NSMutableArray *)v23;

  }
  return v14;
}

- (void)parseXMLElement:(id)a3
{
  void *v4;

  -[RUIObjectModelParser setXmlElement:](self, "setXmlElement:", a3);
  -[RUIObjectModelParser xmlElement](self, "xmlElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traverseWithDelegate:", self);

  -[RUIObjectModelParser _validateDocumentContent](self, "_validateDocumentContent");
  -[RUIObjectModel parseDidFinish](self->_uiObjectModel, "parseDidFinish");
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_pages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "setObjectModel:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_currentPageStack;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setObjectModel:", 0);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)RUIObjectModelParser;
  -[RUIObjectModelParser dealloc](&v13, sel_dealloc);
}

- (id)uiObjectModel
{
  return self->_uiObjectModel;
}

- (id)actionSignal
{
  return self->_actionSignal;
}

- (id)_createPageWithName:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  RUIPage *v11;
  RUIPageElement *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0
    || (v10 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v10, "objectModelParser:createPageWithName:attributes:", self, v6, v7),
        v11 = (RUIPage *)objc_claimAutoreleasedReturnValue(),
        v10,
        -[RUIPage setAttributes:](v11, "setAttributes:", v7),
        !v11))
  {
    v11 = -[RUIPage initWithAttributes:]([RUIPage alloc], "initWithAttributes:", v7);
  }
  v12 = -[RUIElement initWithAttributes:parent:]([RUIPageElement alloc], "initWithAttributes:parent:", v7, 0);
  -[RUIPage setPageElement:](v11, "setPageElement:", v12);
  -[RUIObjectModel style](self->_uiObjectModel, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIPage setStyle:](v11, "setStyle:", v13);

  -[RUIPage setObjectModel:](v11, "setObjectModel:", self->_uiObjectModel);
  -[NSMutableArray addObject:](self->_currentPageStack, "addObject:", v11);

  return v11;
}

- (id)_createAndAddPageWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModelParser _createPageWithName:attributes:](self, "_createPageWithName:attributes:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validationFunction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValidationFunction:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPageID:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v10);

    }
  }
  -[NSMutableArray addObject:](self->_pages, "addObject:", v6);

  return v6;
}

- (id)_lastPageCreateIfNeeded
{
  void *v3;

  -[NSMutableArray lastObject](self->_currentPageStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[RUIObjectModelParser _createAndAddPageWithAttributes:](self, "_createAndAddPageWithAttributes:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_lastRow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableArray lastObject](self->_currentPageStack, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableViewOM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_addNavigationBarWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RUIObjectModelParser _lastPageCreateIfNeeded](self, "_lastPageCreateIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "setNavTitle:", v5);
  objc_msgSend(v9, "objectForKey:", CFSTR("subTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "setNavSubTitle:", v6);
  objc_msgSend(v9, "objectForKey:", CFSTR("backButtonTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setBackButtonTitle:", v7);
  objc_msgSend(v9, "objectForKey:", CFSTR("hidesBackButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", objc_msgSend(v8, "BOOLValue"));

}

- (void)_logDeprecation:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" = \"%@\"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24C29B280;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[RUIObjectModelParser baseURL](self, "baseURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](self->_elementStack, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated feature \"%@\"%@ in %@ element", buf, 0x2Au);

    }
  }

}

- (BOOL)parseActionSignalWithElementName:(id)a3
{
  id v4;
  void *v5;
  RUIActionSignal *actionSignal;
  void *v7;
  RUIActionSignal *v8;

  v4 = a3;
  +[RUIActionSignal signalWithString:](RUIActionSignal, "signalWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    actionSignal = self->_actionSignal;
    if (actionSignal)
    {
      -[RUIActionSignal subActions](actionSignal, "subActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v4);
    }
    else
    {
      v8 = v5;
      v7 = self->_actionSignal;
      self->_actionSignal = v8;
    }

  }
  return v5 != 0;
}

- (void)traversalDelegateDidStartElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  RUIActionSignal *v8;
  RUIActionSignal *actionSignal;
  void *v10;
  RUIObjectModel *uiObjectModel;
  void *v12;
  RUIObjectModel *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RUIObjectModel *v29;
  uint64_t v30;
  RUITopLevelElementParser *v31;
  void *v32;
  RUITopLevelElementParser *v33;
  RUIAlertView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  RUIAlertView *currentAlert;
  int v41;
  __objc2_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t v50[16];
  uint8_t buf[16];

  v4 = a3;
  -[NSMutableString setString:](self->_accumulator, "setString:", &stru_24C29B280);
  objc_msgSend(v4, "attributtes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentElementAttributes, v5);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("buddyFlowComplete")))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "Buddy Flow Complete!", buf, 2u);
      }

    }
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 1);
    v8 = (RUIActionSignal *)objc_claimAutoreleasedReturnValue();
    actionSignal = self->_actionSignal;
    self->_actionSignal = v8;

    *(_WORD *)&self->_foundXMLUI = 257;
    goto LABEL_55;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("xmlui")))
  {
    if (!self->_error && !-[NSMutableArray count](self->_elementStack, "count"))
      *(_WORD *)&self->_foundXMLUI = 257;
    objc_msgSend(v5, "objectForKey:", CFSTR("action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uiObjectModel = self->_uiObjectModel;
    objc_msgSend(v5, "objectForKey:", CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setIdentifier:](uiObjectModel, "setIdentifier:", v12);

    v13 = self->_uiObjectModel;
    objc_msgSend(v5, "objectForKey:", CFSTR("idOfOldestObjectModelToRemoveAfterPush"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setIdentifierMarkingStackRemovalAfterPush:](v13, "setIdentifierMarkingStackRemovalAfterPush:", v14);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("idOfObjectModelToReplace"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setIdOfObjectModelToReplace:](self->_uiObjectModel, "setIdOfObjectModelToReplace:", v15);

    +[RUIActionSignal signalWithString:](RUIActionSignal, "signalWithString:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_storeStrong((id *)&self->_actionSignal, v16);
    }
    else if (objc_msgSend(v10, "length"))
    {
      _RUILoggingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[RUIObjectModelParser traversalDelegateDidStartElement:].cold.1((uint64_t)v10, v21);

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("validationFunction"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setValidationFunction:](self->_uiObjectModel, "setValidationFunction:", v22);

    objc_msgSend(v5, "objectForKey:", CFSTR("refresh"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(";"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count") == 2)
    {
      objc_msgSend(v24, "objectAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel setRefreshDelay:](self->_uiObjectModel, "setRefreshDelay:", objc_msgSend(v25, "intValue"));

      objc_msgSend(v24, "objectAtIndex:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel setRefreshURL:](self->_uiObjectModel, "setRefreshURL:", v26);

    }
    -[RUIObjectModel style](self->_uiObjectModel, "style");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("style"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v10;
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("setupAssistant")))
      {
        v29 = self->_uiObjectModel;
        +[RUIStyle setupAssistantStyle](RUIStyle, "setupAssistantStyle");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v28, "isEqualToString:", CFSTR("setupAssistantModal")))
      {
        v29 = self->_uiObjectModel;
        +[RUIStyle setupAssistantModalStyle](RUIStyle, "setupAssistantModalStyle");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v28, "isEqualToString:", CFSTR("oslo")))
      {
        v29 = self->_uiObjectModel;
        +[RUIStyle osloStyle](RUIStyle, "osloStyle");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v28, "isEqualToString:", CFSTR("atv")))
      {
        v29 = self->_uiObjectModel;
        +[RUIStyle frontRowStyle](RUIStyle, "frontRowStyle");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = objc_msgSend(v28, "isEqualToString:", CFSTR("defaultStyle"));
        v29 = self->_uiObjectModel;
        if (v41)
          v42 = RUIDefaultAppearanceStyle;
        else
          v42 = RUIStyle;
        -[__objc2_class defaultStyle](v42, "defaultStyle");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v43 = (void *)v30;
      -[RUIObjectModel setStyle:](v29, "setStyle:", v30);

      v10 = v49;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tintColor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x24BEBD4B8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_remoteUI_colorWithString:defaultColor:", v46, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[RUIObjectModel style](self->_uiObjectModel, "style");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setTintColor:", v47);

    }
    goto LABEL_55;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("actions")))
  {
    if (!_isInternalInstall())
      goto LABEL_55;
    _RUILoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_209E87000, v17, OS_LOG_TYPE_DEFAULT, "Starting to parse actions", v50, 2u);
    }
LABEL_30:

    goto LABEL_55;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("script")))
  {
    v18 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "objectForKey:", CFSTR("src"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setScriptURL:](self->_uiObjectModel, "setScriptURL:", v20);

    self->_parserState = 1;
    goto LABEL_55;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("page")))
  {
    -[RUIObjectModelParser _createAndAddPageWithAttributes:](self, "_createAndAddPageWithAttributes:", v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v31 = [RUITopLevelElementParser alloc];
    -[NSObject elementProvider](v17, "elementProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[RUITopLevelElementParser initWithXMLElement:elementProvider:objectModel:delegate:](v31, "initWithXMLElement:elementProvider:objectModel:delegate:", v4, v32, self->_uiObjectModel, self);

    -[RUITopLevelElementParser parse](v33, "parse");
    goto LABEL_30;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("alert")))
  {
    self->_parserState = 2;
    v34 = -[RUIAlertView initWithAttributes:parent:]([RUIAlertView alloc], "initWithAttributes:parent:", v5, 0);
    -[RUIObjectModel style](self->_uiObjectModel, "style");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setStyle:](v34, "setStyle:", v35);

    objc_msgSend(v5, "objectForKey:", CFSTR("title"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIAlertView setTitle:](v34, "setTitle:", v36);

    objc_msgSend(v5, "objectForKey:", CFSTR("message"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIAlertView setMessage:](v34, "setMessage:", v37);

    objc_msgSend(v5, "objectForKey:", CFSTR("cancelButtonTitle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIAlertView addButtonWithTitle:URL:style:attributes:](v34, "addButtonWithTitle:URL:style:attributes:", v39, 0, 1, 0);

    }
    currentAlert = self->_currentAlert;
    self->_currentAlert = v34;

  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("clientInfo")))
  {
    -[RUIObjectModel setClientInfo:](self->_uiObjectModel, "setClientInfo:", v5);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("serverInfo")))
  {
    -[RUIObjectModel setServerInfo:](self->_uiObjectModel, "setServerInfo:", v5);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("updateInfo")))
  {
    -[RUIObjectModel setUpdateInfo:](self->_uiObjectModel, "setUpdateInfo:", v5);
  }
  else
  {
    -[RUIObjectModelParser parseActionSignalWithElementName:](self, "parseActionSignalWithElementName:", v6);
  }
LABEL_55:
  -[NSMutableArray addObject:](self->_elementStack, "addObject:", v6);

}

- (void)traversalDelegateDidEndlement:(id)a3
{
  NSMutableString *accumulator;
  id v5;
  void *v6;
  int parserState;
  void *v8;
  uint64_t v9;
  void *v10;
  RUIAlertView *currentAlert;
  void *v12;
  void *v13;
  RUIAlertView *v14;
  id v15;

  accumulator = self->_accumulator;
  v5 = a3;
  v15 = (id)-[NSMutableString copy](accumulator, "copy");
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  parserState = self->_parserState;
  if (parserState)
  {
    if (parserState == 2)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("cancelButton")))
      {
        -[RUIAlertView addButtonWithTitle:URL:style:attributes:](self->_currentAlert, "addButtonWithTitle:URL:style:attributes:", v15, 0, 1, self->_currentElementAttributes);
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("button")))
      {
        -[NSDictionary objectForKeyedSubscript:](self->_currentElementAttributes, "objectForKeyedSubscript:", CFSTR("destructive"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "BOOLValue"))
          v9 = 2;
        else
          v9 = 0;

        v10 = (void *)MEMORY[0x24BDBCF48];
        currentAlert = self->_currentAlert;
        -[NSDictionary objectForKeyedSubscript:](self->_currentElementAttributes, "objectForKeyedSubscript:", CFSTR("url"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLWithString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIAlertView addButtonWithTitle:URL:style:attributes:](currentAlert, "addButtonWithTitle:URL:style:attributes:", v15, v13, v9, self->_currentElementAttributes);

      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("alert")))
      {
        -[RUIObjectModel addAlertElement:](self->_uiObjectModel, "addAlertElement:", self->_currentAlert);
        self->_parserState = 0;
        v14 = self->_currentAlert;
        self->_currentAlert = 0;

      }
    }
    else if (parserState == 1 && objc_msgSend(v6, "isEqualToString:", CFSTR("script")))
    {
      self->_parserState = 0;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("xmlui")))
  {
    -[RUIObjectModel setPages:](self->_uiObjectModel, "setPages:", self->_pages);
    -[NSMutableArray removeAllObjects](self->_currentPageStack, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_pages, "removeAllObjects");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("page")))
  {
    -[NSMutableArray removeLastObject](self->_currentPageStack, "removeLastObject");
  }
  -[NSMutableString setString:](self->_accumulator, "setString:", &stru_24C29B280);

}

- (void)_validateDocumentContent
{
  void *v3;
  void *v4;
  NSObject *v5;
  RUIObjectModel *uiObjectModel;
  NSError *v7;
  NSError *error;
  id v9;
  uint8_t buf[16];

  -[RUIObjectModel allPages](self->_uiObjectModel, "allPages");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") || self->_actionSignal)
    goto LABEL_8;
  -[RUIObjectModel primaryAlert](self->_uiObjectModel, "primaryAlert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[RUIObjectModel scriptURL](self->_uiObjectModel, "scriptURL"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[RUIObjectModel inlineScript](self->_uiObjectModel, "inlineScript"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[RUIObjectModel clientInfo](self->_uiObjectModel, "clientInfo"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    return;
  }
  -[RUIObjectModel serverInfo](self->_uiObjectModel, "serverInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && !self->_foundXMLUI)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v5, OS_LOG_TYPE_DEFAULT, "No usable content in document!", buf, 2u);
      }

    }
    uiObjectModel = self->_uiObjectModel;
    self->_uiObjectModel = 0;

    self->_succeeded = 0;
    +[RUIHTTPRequest errorWithCode:](RUIHTTPRequest, "errorWithCode:", 4);
    v7 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v7;

  }
}

- (void)traversalDelegateFoundCData:(id)a3
{
  NSMutableString *accumulator;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  accumulator = self->_accumulator;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  -[NSMutableString appendString:](accumulator, "appendString:", v5);

  if (self->_parserState == 1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    -[RUIObjectModel setInlineScript:](self->_uiObjectModel, "setInlineScript:", v6);

  }
}

- (void)parser:(id)a3 setDefaultActionSignal:(id)a4
{
  id v6;
  RUIActionSignal **p_actionSignal;
  RUIActionSignal *actionSignal;
  id v9;

  v6 = a4;
  actionSignal = self->_actionSignal;
  p_actionSignal = &self->_actionSignal;
  if (!actionSignal)
  {
    v9 = v6;
    objc_storeStrong((id *)p_actionSignal, a4);
    v6 = v9;
  }

}

- (id)topLevelElementParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  return -[RUIObjectModelParser _createPageWithName:attributes:](self, "_createPageWithName:attributes:", a4, a5);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (RUIXMLElement)xmlElement
{
  return self->_xmlElement;
}

- (void)setXmlElement:(id)a3
{
  objc_storeStrong((id *)&self->_xmlElement, a3);
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (RUIObjectModelParserDelegate)delegate
{
  return (RUIObjectModelParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_xmlElement, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_actionSignal, 0);
  objc_storeStrong((id *)&self->_currentPageStack, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_uiObjectModel, 0);
  objc_storeStrong((id *)&self->_currentAlert, 0);
  objc_storeStrong((id *)&self->_currentElementAttributes, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

- (void)traversalDelegateDidStartElement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_209E87000, a2, OS_LOG_TYPE_ERROR, "warning: unknown action signal '%@'", (uint8_t *)&v2, 0xCu);
}

@end
