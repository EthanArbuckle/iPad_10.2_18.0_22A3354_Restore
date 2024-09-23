@implementation RUITopLevelElementParser

+ (int64_t)textAlignmentForString:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  int64_t v6;
  CFRange v8;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    v8.length = -[__CFString length](v3, "length");
    v8.location = 0;
    v4 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v3, v8);
    v5 = objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v4);
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("right")))
    {
      v6 = 2 * (v5 != 2);
    }
    else
    {
      v6 = 2 * (v5 == 2);
      if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("left")) & 1) == 0
        && -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("center")))
      {
        v6 = 1;
      }
    }

  }
  else
  {
    v6 = 4;
  }

  return v6;
}

+ (id)textStyleForString:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void **v7;
  char v8;
  id v9;

  v3 = a3;
  v4 = (id)*MEMORY[0x24BEBE1D0];
  v5 = objc_msgSend(v3, "length");
  v6 = v4;
  if (v5)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("largeTitle")))
    {
      v7 = (void **)MEMORY[0x24BEBE210];
LABEL_21:
      v6 = *v7;
      goto LABEL_22;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("title1")))
    {
      v7 = (void **)MEMORY[0x24BEBE240];
      goto LABEL_21;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("title2")))
    {
      v7 = (void **)MEMORY[0x24BEBE248];
      goto LABEL_21;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("title3")))
    {
      v7 = (void **)MEMORY[0x24BEBE250];
      goto LABEL_21;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("headline")))
    {
      v7 = (void **)MEMORY[0x24BEBE200];
      goto LABEL_21;
    }
    v8 = objc_msgSend(v3, "isEqualToString:", CFSTR("body"));
    v6 = v4;
    if ((v8 & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("callout")))
      {
        v7 = (void **)MEMORY[0x24BEBE1D8];
        goto LABEL_21;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("subheadline")))
      {
        v7 = (void **)MEMORY[0x24BEBE220];
        goto LABEL_21;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("footnote")))
      {
        v7 = (void **)MEMORY[0x24BEBE1F0];
        goto LABEL_21;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("caption1")))
      {
        v7 = (void **)MEMORY[0x24BEBE1E0];
        goto LABEL_21;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("caption2")))
        v6 = (void *)*MEMORY[0x24BEBE1E8];
      else
        v6 = v4;
    }
  }
LABEL_22:
  v9 = v6;

  return v9;
}

+ (id)tableRowClassForElementName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Row")) & 1) != 0
    || objc_msgSend(v3, "hasSuffix:", CFSTR("row")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (RUITopLevelElementParser)initWithXMLElement:(id)a3 elementProvider:(id)a4 objectModel:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RUITopLevelElementParser *v15;
  RUITopLevelElementParser *v16;
  uint64_t v17;
  NSMutableString *accumulator;
  uint64_t v19;
  NSMutableArray *elementStack;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RUITopLevelElementParser;
  v15 = -[RUITopLevelElementParser init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xmlElement, a3);
    objc_storeStrong((id *)&v16->_objectModel, a5);
    objc_storeStrong((id *)&v16->_elementProvider, a4);
    v17 = objc_opt_new();
    accumulator = v16->_accumulator;
    v16->_accumulator = (NSMutableString *)v17;

    v19 = objc_opt_new();
    elementStack = v16->_elementStack;
    v16->_elementStack = (NSMutableArray *)v19;

    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (void)parse
{
  id v3;

  -[RUITopLevelElementParser xmlElement](self, "xmlElement");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traverseWithDelegate:", self);

}

- (id)baseURL
{
  void *v2;
  void *v3;

  -[RUITopLevelElementParser objectModel](self, "objectModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __objc2_class **v11;
  RUITableViewRow *v12;
  void *v13;
  void *v14;
  void *v15;
  RUITableViewRow *v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("class"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("customContent")) & 1) != 0)
  {
    v11 = off_24C292CD0;
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("swiftUI")))
  {
    v11 = &off_24C292CD8;
LABEL_5:
    v12 = (RUITableViewRow *)objc_msgSend(objc_alloc(*v11), "initWithAttributes:parent:", v7, v8);
    if (v12)
      goto LABEL_7;
  }
  v12 = -[RUIElement initWithAttributes:parent:]([RUITableViewRow alloc], "initWithAttributes:parent:", v7, v8);
LABEL_7:
  -[RUITableViewRow setDelegate:](v12, "setDelegate:", v9);

  objc_msgSend(v8, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement setStyle:](v12, "setStyle:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("checked"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITableViewRow setSelected:](v12, "setSelected:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("align"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("center")))
    {
      v16 = v12;
      v17 = 1;
LABEL_15:
      -[RUITableViewRow setAlignment:](v16, "setAlignment:", v17);
      goto LABEL_16;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("right")))
    {
      v16 = v12;
      v17 = 2;
      goto LABEL_15;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("left")))
    {
      v16 = v12;
      v17 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(v8, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableViewRow setAlignment:](v12, "setAlignment:", objc_msgSend(v18, "labelRowTextAlignment"));

  }
LABEL_16:

  return v12;
}

- (id)_newRowWithAttributeDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RUITopLevelElementParser elementProvider](self, "elementProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeTableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RUITopLevelElementParser _newRowWithAttributeDict:tableViewOM:](self, "_newRowWithAttributeDict:tableViewOM:", v4, v6);

  return v7;
}

- (id)_newRowWithAttributeDict:(id)a3 tableViewOM:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "rowWithAttributeDict:delegate:parent:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addRow:", v9);
  return v9;
}

- (id)page
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[RUITopLevelElementParser elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lastRow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[RUITopLevelElementParser elementProvider](self, "elementProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeTableViewOM");
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
  id v4;
  id v5;

  v4 = a3;
  -[RUITopLevelElementParser page](self, "page");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RUITopLevelElementParser _addNavigationBarWithAttributes:toPage:](self, "_addNavigationBarWithAttributes:toPage:", v4, v5);

}

- (void)_addNavigationBarWithAttributes:(id)a3 toPage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v10, "objectForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "setNavTitle:", v6);
  objc_msgSend(v10, "objectForKey:", CFSTR("subTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v5, "setNavSubTitle:", v7);
  objc_msgSend(v10, "objectForKey:", CFSTR("backButtonTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "setBackButtonTitle:", v8);
  objc_msgSend(v10, "objectForKey:", CFSTR("hidesBackButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v9, "BOOLValue"));

}

- (void)_addSectionWithAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RUITopLevelElementParser elementProvider](self, "elementProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeTableViewOM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITopLevelElementParser _addSectionWithAttributes:toTableViewOM:](self, "_addSectionWithAttributes:toTableViewOM:", v4, v5);

}

- (void)_addSectionWithAttributes:(id)a3 toTableViewOM:(id)a4
{
  id v6;
  RUITableViewSection *v7;
  void *v8;
  void *v9;
  RUIHeaderElement *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  RUIFooterElement *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = -[RUITableViewSection initWithAttributes:parent:]([RUITableViewSection alloc], "initWithAttributes:parent:", v19, v6);
  -[RUITableViewSection setAttributes:](v7, "setAttributes:", v19);
  -[RUIObjectModel style](self->_objectModel, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement setStyle:](v7, "setStyle:", v8);

  -[RUITableViewSection setTableElement:](v7, "setTableElement:", v6);
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("header"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", 0, v7);
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("header"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v10, "setBody:", v11);

    -[RUITableViewSection setHeader:](v7, "setHeader:", v10);
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("headerHeight"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("headerHeight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      -[RUITableViewSection setHeaderHeight:](v7, "setHeaderHeight:", v14);

    }
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("footer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", 0, v7);
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("footer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v16, "setBody:", v17);

    -[RUITableViewSection setFooter:](v7, "setFooter:", v16);
  }
  objc_msgSend(v6, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v7);

}

- (void)_logDeprecation:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      -[RUITopLevelElementParser objectModel](self, "objectModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sourceURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](self->_elementStack, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated feature \"%@\"%@ in %@ element", buf, 0x2Au);

    }
  }

}

- (void)_finalizePinView
{
  RUITopLevelElementParser *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  RUIFooterElement *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  RUIHeaderElement *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  RUIFooterElement *v45;
  RUITopLevelElementParser *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v2 = self;
  v55 = *MEMORY[0x24BDAC8D0];
  -[RUITopLevelElementParser page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "attributes");
  v7 = (RUIFooterElement *)objc_claimAutoreleasedReturnValue();
  -[RUIFooterElement objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("footer"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "footer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_25;
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[RUITopLevelElementParser baseURL](v2, "baseURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated pinView attribute 'footer'. Use <footer> instead.", buf, 0xCu);

      }
    }
    v7 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", 0, v4);
    objc_msgSend(v4, "setFooter:", v7);
    objc_msgSend(v4, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("footer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v7, "setBody:", v14);

    objc_msgSend(v4, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITopLevelElementParser _logDeprecation:value:](v2, "_logDeprecation:value:", CFSTR("footerLinkURL"), v18);

      objc_msgSend(v4, "footer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      v22 = v21;
      v46 = v2;
      v47 = v3;
      if (v21)
        v23 = v21;
      else
        v23 = (id)objc_opt_new();
      v24 = v23;
      v45 = v7;

      objc_msgSend(v4, "attributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("url"));

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v27 = objc_msgSend(&unk_24C2B1F18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v49 != v29)
              objc_enumerationMutation(&unk_24C2B1F18);
            v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v24, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v32)
            {
              objc_msgSend(v4, "attributes");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v34)
                continue;
              objc_msgSend(v4, "attributes");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v31);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, v31);

            }
          }
          v28 = objc_msgSend(&unk_24C2B1F18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v28);
      }
      objc_msgSend(v4, "footer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAttributes:", v24);

      v2 = v46;
      v3 = v47;
      v7 = v45;
    }
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("footer"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("footerLinkURL"));
  }

LABEL_25:
  objc_msgSend(v4, "attributes");
  v37 = (RUIHeaderElement *)objc_claimAutoreleasedReturnValue();
  -[RUIHeaderElement objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", CFSTR("label"));
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_32:

    goto LABEL_33;
  }
  v39 = (void *)v38;
  objc_msgSend(v4, "header");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        -[RUITopLevelElementParser baseURL](v2, "baseURL");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v42;
        _os_log_impl(&dword_209E87000, v41, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated pinView attribute 'label'. Use <header> instead.", buf, 0xCu);

      }
    }
    v37 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", &unk_24C2B1EC8, v4);
    objc_msgSend(v4, "setHeader:", v37);
    objc_msgSend(v4, "attributes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("label"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v37, "setBody:", v44);

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("label"));
    goto LABEL_32;
  }
LABEL_33:
  objc_msgSend(v4, "setAttributes:", v6);

}

- (void)_finalizeSection
{
  void *v3;
  void *v4;
  void *v5;
  RUIHeaderElement *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RUIDetailHeaderElement *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RUISubHeaderElement *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  RUIFooterElement *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;

  -[RUITopLevelElementParser elementProvider](self, "elementProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeTableViewOM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v66 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "attributes");
  v6 = (RUIHeaderElement *)objc_claimAutoreleasedReturnValue();
  -[RUIHeaderElement objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("header"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v66, "header");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
    v6 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", 0, v66);
    objc_msgSend(v66, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("header"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v6, "setBody:", v11);

    objc_msgSend(v66, "setHeader:", v6);
  }

LABEL_5:
  objc_msgSend(v66, "attributes");
  v12 = (RUIDetailHeaderElement *)objc_claimAutoreleasedReturnValue();
  -[RUIDetailHeaderElement objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("detailHeader"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v66, "detailHeader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_9;
    v12 = -[RUIElement initWithAttributes:parent:]([RUIDetailHeaderElement alloc], "initWithAttributes:parent:", 0, v66);
    objc_msgSend(v66, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("detailHeader"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIDetailHeaderElement setBody:](v12, "setBody:", v17);

    objc_msgSend(v66, "setDetailHeader:", v12);
  }

LABEL_9:
  objc_msgSend(v66, "attributes");
  v18 = (RUISubHeaderElement *)objc_claimAutoreleasedReturnValue();
  -[RUISubHeaderElement objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("subHeader"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v66, "subHeader");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_13;
    v18 = -[RUIElement initWithAttributes:parent:]([RUISubHeaderElement alloc], "initWithAttributes:parent:", 0, v66);
    objc_msgSend(v66, "attributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("subHeader"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v18, "setBody:", v23);

    objc_msgSend(v66, "setSubHeader:", v18);
  }

LABEL_13:
  objc_msgSend(v66, "attributes");
  v24 = (RUIFooterElement *)objc_claimAutoreleasedReturnValue();
  -[RUIFooterElement objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("footer"));
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v66, "footer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_17;
    v24 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", 0, v66);
    objc_msgSend(v66, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("footer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v24, "setBody:", v29);

    objc_msgSend(v66, "setFooter:", v24);
  }

LABEL_17:
  objc_msgSend(v66, "header");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "attributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(v66, "attributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "header");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAttributes:", v32);

  }
  objc_msgSend(v66, "footer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "attributes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    objc_msgSend(v66, "attributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "footer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAttributes:", v36);

  }
  objc_msgSend(v66, "footer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "attributes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("url"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {

LABEL_34:
    goto LABEL_35;
  }
  objc_msgSend(v66, "attributes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v66, "attributes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITopLevelElementParser _logDeprecation:value:](self, "_logDeprecation:value:", CFSTR("footerLinkURL"), v44);

    objc_msgSend(v66, "footer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "attributes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");
    v48 = v47;
    if (v47)
      v49 = v47;
    else
      v49 = (id)objc_opt_new();
    v38 = v49;

    objc_msgSend(v66, "attributes");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v51, CFSTR("url"));

    objc_msgSend(v66, "attributes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("footerLinkURL"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v53, CFSTR("footerLinkURL"));

    objc_msgSend(v66, "attributes");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("httpMethod"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v66, "attributes");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("httpMethod"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v57, CFSTR("httpMethod"));

    }
    objc_msgSend(v66, "attributes");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("footerLinkIsModalHTMLView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v66, "attributes");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("footerLinkIsModalHTMLView"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v61, CFSTR("fetchLinksInModalWebView"));

    }
    objc_msgSend(v66, "attributes");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("shouldScaleHTMLPageToFit"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v66, "attributes");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("shouldScaleHTMLPageToFit"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v65, CFSTR("shouldScaleHTMLPageToFit"));

    }
    objc_msgSend(v66, "footer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAttributes:", v38);
    goto LABEL_34;
  }
LABEL_35:

}

- (void)_finalizeElement:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("section")))
  {
    -[RUITopLevelElementParser _finalizeSection](self, "_finalizeSection");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("pinView")))
  {
    -[RUITopLevelElementParser _finalizePinView](self, "_finalizePinView");
  }

}

- (BOOL)_isParsingTable
{
  return -[NSMutableArray containsObject:](self->_elementStack, "containsObject:", CFSTR("tableView"));
}

- (void)traversalDelegateDidStartElement:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  int v14;
  int v15;
  void *v16;
  NSMutableArray *swiftUIStack;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  RUIDetailButtonElement *v32;
  RUIDetailButtonElement *v33;
  void *v34;
  void *v35;
  RUIDetailButtonElement *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  RUIHeaderElement *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  char isKindOfClass;
  NSMutableArray *v87;
  NSMutableArray *v88;
  void *v89;
  RUISelectOption *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSMutableArray *v117;
  NSMutableArray *v118;
  void *v119;
  RUIXMLElement *v120;
  RUIXMLElement *swiftUIElement;
  void *v122;
  void *v123;
  void *v124;
  int parserState;
  RUIBarButtonItem *v126;
  void *v127;
  RUIBarButtonItem *v128;
  void *v129;
  void *v130;
  RUIBarButtonItem *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  uint8_t buf[16];
  __CFString *v146;
  const __CFString *v147;
  uint64_t v148;
  const __CFString *v149;
  const __CFString *v150;
  _QWORD v151[3];

  v151[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSMutableString setString:](self->_accumulator, "setString:", &stru_24C29B280);
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("choiceView"));

  if (v7)
  {
    objc_msgSend(v5, "attributtes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    -[RUITopLevelElementParser page](self, "page");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("navigationTitle"));

    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("isLegacyChoiceViewHeader"));
    objc_msgSend(v5, "setAttributtes:", v9);

  }
  objc_msgSend(v5, "attributtes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentElementAttributes, v12);
  v14 = -[NSMutableArray containsObject:](self->_elementStack, "containsObject:", CFSTR("tableView"));
  v15 = -[NSMutableArray containsObject:](self->_elementStack, "containsObject:", CFSTR("section"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("header"), CFSTR("footer"), CFSTR("subHeader"), CFSTR("detailHeader"), CFSTR("htmlHeader"), CFSTR("htmlFooter"), CFSTR("cancelButton"), CFSTR("button"), CFSTR("choice"), CFSTR("helpLink"), CFSTR("htmlSubLabel"), CFSTR("page"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RUITopLevelElementParser _isParsingSwiftUI](self, "_isParsingSwiftUI"))
  {
    swiftUIStack = self->_swiftUIStack;
LABEL_5:
    v18 = v13;
LABEL_6:
    -[NSMutableArray addObject:](swiftUIStack, "addObject:", v18);
    goto LABEL_21;
  }
  +[RUIContentRegistry sharedRegistry](_TtC8RemoteUI18RUIContentRegistry, "sharedRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "supportsViewNamed:", v13);

  if (v20)
  {
    v151[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v151, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSMutableArray *)objc_msgSend(v21, "mutableCopy");
    v23 = self->_swiftUIStack;
    self->_swiftUIStack = v22;

    objc_storeStrong((id *)&self->_swiftUIElement, a3);
    -[RUITopLevelElementParser delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "parser:setDefaultActionSignal:", self, v25);

    if (!-[RUITopLevelElementParser _isParsingTable](self, "_isParsingTable"))
    {
      self->_parserState = 2;
      goto LABEL_21;
    }
    v149 = CFSTR("class");
    v150 = CFSTR("customContent");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    self->_parserState = 5;
    swiftUIStack = self->_elementStack;
    v18 = CFSTR("customContentRow");
    goto LABEL_6;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("tableView")))
  {
    -[RUITopLevelElementParser delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "parser:setDefaultActionSignal:", self, v28);

    -[RUITopLevelElementParser elementProvider](self, "elementProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "makeTableViewOM");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAttributes:", v12);

    -[RUITopLevelElementParser objectModel](self, "objectModel");
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject style](v31, "style");
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    -[RUITopLevelElementParser elementProvider](self, "elementProvider");
    v33 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    -[RUIDetailButtonElement makeTableViewOM](v33, "makeTableViewOM");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v36 = v32;
LABEL_12:
    objc_msgSend(v34, "setStyle:", v36);

    goto LABEL_19;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("pinView")))
  {
    -[RUITopLevelElementParser delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "parser:setDefaultActionSignal:", self, v38);

    -[RUITopLevelElementParser page](self, "page");
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject passcodeViewOM](v31, "passcodeViewOM");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAttributes:", v12);

    -[RUITopLevelElementParser objectModel](self, "objectModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "style");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject passcodeViewOM](v31, "passcodeViewOM");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setStyle:", v41);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("numberOfFields"));
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    v43 = -[RUIDetailButtonElement integerValue](v32, "integerValue");
    if (v43)
      v44 = v43;
    else
      v44 = 4;
    -[NSObject passcodeViewOM](v31, "passcodeViewOM");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setNumberOfEntryFields:", v44);

    goto LABEL_19;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("spinnerView")))
  {
    -[RUITopLevelElementParser delegate](self, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "parser:setDefaultActionSignal:", self, v48);

    -[RUITopLevelElementParser page](self, "page");
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject spinnerViewOM](v31, "spinnerViewOM");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAttributes:", v12);

    -[RUITopLevelElementParser objectModel](self, "objectModel");
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    -[RUIElement style](v32, "style");
    v33 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    -[NSObject spinnerViewOM](v31, "spinnerViewOM");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v36 = v33;
    goto LABEL_12;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("section")))
  {
    -[RUITopLevelElementParser _addSectionWithAttributes:](self, "_addSectionWithAttributes:", v12);
    goto LABEL_21;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("headerView")))
  {
    -[RUITopLevelElementParser _logDeprecation:value:](self, "_logDeprecation:value:", CFSTR("<headerView>"), &stru_24C29B280);
    -[RUITopLevelElementParser elementProvider](self, "elementProvider");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "makeTableViewOM");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v51);
    objc_msgSend(v51, "setHeader:", v52);
LABEL_34:

    goto LABEL_21;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("footerView")))
  {
    -[RUITopLevelElementParser _logDeprecation:value:](self, "_logDeprecation:value:", CFSTR("<footerView>"), &stru_24C29B280);
    -[RUITopLevelElementParser elementProvider](self, "elementProvider");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "makeTableViewOM");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v51);
    objc_msgSend(v51, "setFooter:", v52);
    goto LABEL_34;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("row")))
  {
    v31 = -[RUITopLevelElementParser _newRowWithAttributeDict:](self, "_newRowWithAttributeDict:", v12);
    -[NSObject setSourceXMLElement:](v31, "setSourceXMLElement:", v5);
    self->_parserState = 4;
    if (!_isInternalInstall())
      goto LABEL_20;
    _RUILoggingFacility();
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v32->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, &v32->super.super, OS_LOG_TYPE_DEFAULT, "Warning : RemoteUI markup is specifying a deprecated 'row' element.", buf, 2u);
    }
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("searchTerms"))
    && self->_parserState == 4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v31 = objc_claimAutoreleasedReturnValue();
    -[RUITopLevelElementParser _lastRow](self, "_lastRow");
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    -[RUIDetailButtonElement setSearchTerms:](v32, "setSearchTerms:", v31);
    goto LABEL_19;
  }
  if (-[__CFString hasSuffix:](v13, "hasSuffix:", CFSTR("Row")))
  {
    objc_msgSend((id)objc_opt_class(), "tableRowClassForElementName:", v13);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v12);
    objc_msgSend(v55, "setObject:forKey:", v54, CFSTR("class"));
    self->_parserState = 4;
    v142 = v54;
    if (-[NSObject isEqualToString:](v54, "isEqualToString:", CFSTR("selectPage")))
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "UUIDString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("child-page-"), "stringByAppendingString:", v57);
      v58 = objc_claimAutoreleasedReturnValue();

      v59 = -[RUITopLevelElementParser _newRowWithAttributeDict:](self, "_newRowWithAttributeDict:", v55);
      -[RUITopLevelElementParser page](self, "page");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITopLevelElementParser _createPageWithName:attributes:](self, "_createPageWithName:attributes:", v58, v12);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setPageID:", v58);
      v137 = v60;
      objc_msgSend(v60, "_addChildPage:", v61);
      objc_msgSend(v59, "setLinkedPage:", v61);
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("linkedTitle"));
      v62 = objc_claimAutoreleasedReturnValue();
      v138 = v59;
      v136 = (void *)v62;
      if (v62)
      {
        v147 = CFSTR("title");
        v148 = v62;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
        v63 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = 0;
      }
      v135 = (void *)v63;
      -[RUITopLevelElementParser _addNavigationBarWithAttributes:toPage:](self, "_addNavigationBarWithAttributes:toPage:", v63, v61);
      v95 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v141 = (void *)v58;
      objc_msgSend(v95, "setObject:forKey:", v58, CFSTR("radioGroup"));
      objc_msgSend(v12, "objectForKey:", CFSTR("autoGoBack"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "BOOLValue");

      if (v97)
        objc_msgSend(v95, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("autoGoBack"));
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("value"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "length");

      if (v99)
      {
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("value"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setObject:forKey:", v100, CFSTR("value"));

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("header"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("header"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setObject:forKey:", v102, CFSTR("header"));

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("headerHeight"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (v103)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("headerHeight"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setObject:forKey:", v104, CFSTR("headerHeight"));

        }
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("footer"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      if (v105)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("footer"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setObject:forKey:", v106, CFSTR("footer"));

      }
      objc_msgSend(v61, "tableViewOM");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITopLevelElementParser _addSectionWithAttributes:toTableViewOM:](self, "_addSectionWithAttributes:toTableViewOM:", v95, v107);

    }
    else
    {
      v84 = -[RUITopLevelElementParser _newRowWithAttributeDict:](self, "_newRowWithAttributeDict:", v55);
      objc_msgSend(v84, "setSourceXMLElement:", v5);
      -[RUITopLevelElementParser _lastRow](self, "_lastRow");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v87 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v88 = self->_swiftUIStack;
        self->_swiftUIStack = v87;

        objc_storeStrong((id *)&self->_swiftUIElement, a3);
        self->_parserState = 5;
      }

    }
    v31 = v142;

    goto LABEL_20;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("detailButton"))
    && self->_parserState == 4)
  {
    -[RUITopLevelElementParser _lastRow](self, "_lastRow");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = -[RUIDetailButtonElement initWithAttributes:parent:]([RUIDetailButtonElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v31);
    -[NSObject setDetailButton:](v31, "setDetailButton:", v32);
    goto LABEL_19;
  }
  if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("option")) & 1) == 0
    && !-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("linkedOption")))
  {
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("linkDeleteAction")) & 1) != 0
      || -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("clientDeleteAction")))
    {
      -[RUITopLevelElementParser _lastRow](self, "_lastRow");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_20;
      v32 = (RUIDetailButtonElement *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v12);
      -[RUIDetailButtonElement setObject:forKey:](v32, "setObject:forKey:", v13, CFSTR("type"));
      -[NSObject setDeleteAction:](v31, "setDeleteAction:", v32);
      goto LABEL_19;
    }
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("html")))
    {
      v108 = (void *)objc_msgSend(v12, "copy");
      -[RUITopLevelElementParser elementProvider](self, "elementProvider");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "makeWebViewOM");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "setAttributes:", v108);

      -[RUITopLevelElementParser baseURL](self, "baseURL");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITopLevelElementParser elementProvider](self, "elementProvider");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "makeWebViewOM");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setBaseURL:", v111);

      -[RUITopLevelElementParser delegate](self, "delegate");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 2);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "parser:setDefaultActionSignal:", self, v115);

      self->_parserState = 1;
      goto LABEL_21;
    }
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("navigationBar")))
    {
      self->_parserState = 6;
      -[RUITopLevelElementParser _addNavigationBarWithAttributes:](self, "_addNavigationBarWithAttributes:", v12);
      goto LABEL_21;
    }
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("toolbar")))
    {
      self->_parserState = 7;
      -[RUITopLevelElementParser page](self, "page");
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject setHasToolbar](v31, "setHasToolbar");
      goto LABEL_20;
    }
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("header")) & v14 & v15) == 1)
    {
      v146 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v146, 1);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = (NSMutableArray *)objc_msgSend(v116, "mutableCopy");
      v118 = self->_swiftUIStack;
      self->_swiftUIStack = v117;

      objc_msgSend(v5, "children");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "firstObject");
      v120 = (RUIXMLElement *)objc_claimAutoreleasedReturnValue();
      swiftUIElement = self->_swiftUIElement;
      self->_swiftUIElement = v120;

      self->_parserState = 3;
      swiftUIStack = self->_elementStack;
      goto LABEL_5;
    }
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("buttonBarItem")) & 1) == 0
      && (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("linkBarItem")) & 1) == 0
      && (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("nextBarItem")) & 1) == 0
      && (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("editBarItem")) & 1) == 0
      && (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("titleBarItem")) & 1) == 0
      && (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("closeButtonBarItem")) & 1) == 0
      && !-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("backButtonBarItem")))
    {
      if ((objc_msgSend(v16, "containsObject:", v13) & 1) != 0)
        goto LABEL_21;
      _RUILoggingFacility();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[RUITopLevelElementParser traversalDelegateDidStartElement:].cold.1((uint64_t)v13, v31);
      goto LABEL_20;
    }
    -[RUITopLevelElementParser page](self, "page");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v12);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setObject:forKeyedSubscript:", v123, CFSTR("barButtonType"));

    objc_msgSend(v122, "setObject:forKey:", v13, CFSTR("type"));
    objc_msgSend(v122, "objectForKey:", CFSTR("position"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    parserState = self->_parserState;
    if (parserState == 7)
    {
      objc_msgSend(v122, "setObject:forKey:", CFSTR("toolbar"), CFSTR("parentBar"));
      v131 = [RUIBarButtonItem alloc];
      objc_msgSend(v144, "pageElement");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = -[RUIElement initWithAttributes:parent:](v131, "initWithAttributes:parent:", v122, v132);

      -[RUITopLevelElementParser objectModel](self, "objectModel");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "style");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElement setStyle:](v128, "setStyle:", v134);

      if (objc_msgSend(v124, "isEqualToString:", CFSTR("right")))
      {
        objc_msgSend(v144, "setRightToolbarButtonItem:", v128);
      }
      else if (objc_msgSend(v124, "isEqualToString:", CFSTR("left")))
      {
        objc_msgSend(v144, "setLeftToolbarButtonItem:", v128);
      }
      else if (objc_msgSend(v124, "isEqualToString:", CFSTR("center")))
      {
        objc_msgSend(v144, "setMiddleToolbarButtonItem:", v128);
      }
    }
    else
    {
      if (parserState != 6)
      {
LABEL_108:

        goto LABEL_21;
      }
      objc_msgSend(v122, "setObject:forKey:", CFSTR("navigationBar"), CFSTR("parentBar"));
      v126 = [RUIBarButtonItem alloc];
      objc_msgSend(v144, "pageElement");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = -[RUIElement initWithAttributes:parent:](v126, "initWithAttributes:parent:", v122, v127);

      -[RUITopLevelElementParser objectModel](self, "objectModel");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "style");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElement setStyle:](v128, "setStyle:", v130);

      if (objc_msgSend(v124, "isEqualToString:", CFSTR("right")))
      {
        objc_msgSend(v144, "setRightNavigationBarButtonItem:", v128);
      }
      else if (objc_msgSend(v124, "isEqualToString:", CFSTR("left")))
      {
        objc_msgSend(v144, "setLeftNavigationBarButtonItem:", v128);
      }
    }

    goto LABEL_108;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("linkedOption")))
  {
    v143 = (void *)objc_msgSend(v12, "mutableCopy");
    -[RUITopLevelElementParser elementProvider](self, "elementProvider");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "parentElement");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "pageElement");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "page");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "childPages");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "lastObject");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v140 = v68;
    objc_msgSend(v68, "tableViewOM");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "sections");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "lastObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v71, "attributes");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("radioGroup"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setObject:forKeyedSubscript:", v73, CFSTR("radioGroup"));

    objc_msgSend(v143, "setObject:forKeyedSubscript:", CFSTR("linkedOption"), CFSTR("class"));
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("value"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "attributes");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("value"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v74, "isEqualToString:", v76);

    if ((_DWORD)v65)
      objc_msgSend(v143, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("checked"));
    objc_msgSend(v140, "tableViewOM");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v140, "parentPage");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "tableViewOM");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "sections");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "lastObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v81, "rows");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "lastObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RUITopLevelElementParser _lastRow](self, "_lastRow");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v83)
  {
    objc_msgSend(v83, "selectOptions");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_alloc_init(RUISelectOption);
    objc_msgSend(v12, "objectForKey:", CFSTR("label"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUISelectOption setLabel:](v90, "setLabel:", v91);

    -[RUISelectOption label](v90, "label");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "length");

    if (!v93)
      -[RUISelectOption setLabel:](v90, "setLabel:", CFSTR(" "));
    objc_msgSend(v12, "objectForKey:", CFSTR("value"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUISelectOption setValue:](v90, "setValue:", v94);

    objc_msgSend(v89, "addObject:", v90);
  }

LABEL_21:
  v46 = self->_parserState;
  if ((v46 - 2) >= 2
    && (v46 != 5 || -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("swiftUIRow"))))
  {
    -[NSMutableArray addObject:](self->_elementStack, "addObject:", v13);
  }

}

- (void)traversalDelegateDidEndlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  const __CFString *v9;
  RUIXMLElement *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC8RemoteUI26RUISwiftUIContainerElement *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  _TtC8RemoteUI26RUISwiftUIContainerElement *v21;
  RUIXMLElement *swiftUIElement;
  void *v23;
  _TtC8RemoteUI26RUISwiftUIContainerElement *v24;
  NSMutableArray *swiftUIStack;
  RUIXMLElement *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  RUISubHeaderElement *v37;
  void *v38;
  void *v39;
  RUIHeaderElement *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  RUIXMLElement *v66;
  void *v67;
  void *v68;
  void *v69;
  RUIXMLElement *v70;
  NSMutableArray *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  id v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSMutableString copy](self->_accumulator, "copy");
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RUITopLevelElementParser _isParsingSwiftUI](self, "_isParsingSwiftUI");
  v8 = 32;
  if (v7)
    v8 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "removeLastObject");
  switch(self->_parserState)
  {
    case 1:
      v9 = CFSTR("html");
      goto LABEL_20;
    case 2:
      if (!-[NSMutableArray count](self->_swiftUIStack, "count"))
      {
        -[RUITopLevelElementParser page](self, "page");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = [_TtC8RemoteUI26RUISwiftUIContainerElement alloc];
        swiftUIElement = self->_swiftUIElement;
        objc_msgSend(v20, "pageElement");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[RUISwiftUIContainerElement initWithElement:parent:](v21, "initWithElement:parent:", swiftUIElement, v23);

        if (v24)
        {
          -[RUITopLevelElementProvider setPrimaryElement:](self->_elementProvider, "setPrimaryElement:", v24);
          swiftUIStack = self->_swiftUIStack;
          self->_swiftUIStack = 0;

          v26 = self->_swiftUIElement;
          self->_swiftUIElement = 0;

        }
        -[RUISwiftUIContainerElement prepareToPreload](v24, "prepareToPreload");
        self->_parserState = 0;

      }
      goto LABEL_84;
    case 3:
      if (!-[NSMutableArray count](self->_swiftUIStack, "count"))
      {
        v10 = self->_swiftUIElement;
        -[RUITopLevelElementParser elementProvider](self, "elementProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "makeTableViewOM");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v15 = -[RUISwiftUIContainerElement initWithElement:parent:]([_TtC8RemoteUI26RUISwiftUIContainerElement alloc], "initWithElement:parent:", self->_swiftUIElement, v14);
          if (v15)
            objc_msgSend(v14, "setHeader:", v15);
          -[RUISwiftUIContainerElement prepareToPreload](v15, "prepareToPreload");
        }
        else
        {
          v15 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v14);
          -[RUIElement setBody:](v15, "setBody:", self->_accumulator);
          objc_msgSend(v14, "setHeader:", v15);
        }

        v70 = self->_swiftUIElement;
        self->_swiftUIElement = 0;

        v71 = self->_swiftUIStack;
        self->_swiftUIStack = 0;

        self->_parserState = 0;
        -[NSMutableArray lastObject](self->_elementStack, "lastObject");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "isEqualToString:", v6);

        if (v73)
          -[NSMutableArray removeLastObject](self->_elementStack, "removeLastObject");

      }
      goto LABEL_84;
    case 4:
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("searchTerm")))
      {
        -[RUITopLevelElementParser _lastRow](self, "_lastRow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "searchTerms");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)-[NSMutableString copy](self->_accumulator, "copy");
        objc_msgSend(v17, "addObject:", v18);

      }
      else if ((objc_msgSend(v6, "hasSuffix:", CFSTR("Row")) & 1) != 0
             || objc_msgSend(v6, "isEqualToString:", CFSTR("row")))
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("selectPageRow")))
        {
          v75 = v6;
          -[RUITopLevelElementParser elementProvider](self, "elementProvider");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "parentElement");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "pageElement");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "page");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "childPages");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "lastObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v74 = v46;
          objc_msgSend(v46, "tableViewOM");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "sections");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v48;
          v79 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
          v76 = v4;
          v49 = 0;
          if (v79)
          {
            v78 = *(_QWORD *)v86;
            do
            {
              v50 = 0;
              do
              {
                if (*(_QWORD *)v86 != v78)
                  objc_enumerationMutation(obj);
                v80 = v50;
                v51 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v50);
                v81 = 0u;
                v82 = 0u;
                v83 = 0u;
                v84 = 0u;
                objc_msgSend(v51, "rows");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                if (v53)
                {
                  v54 = v53;
                  v55 = *(_QWORD *)v82;
                  do
                  {
                    for (i = 0; i != v54; ++i)
                    {
                      if (*(_QWORD *)v82 != v55)
                        objc_enumerationMutation(v52);
                      objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "attributes");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("checked"));
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      v59 = objc_msgSend(v58, "BOOLValue");

                      if (v59)
                      {
                        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("label"));
                        v60 = objc_claimAutoreleasedReturnValue();

                        v49 = (void *)v60;
                      }

                    }
                    v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                  }
                  while (v54);
                }

                v50 = v80 + 1;
              }
              while (v80 + 1 != v79);
              v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
            }
            while (v79);
          }

          v4 = v76;
          v6 = v75;
          if (objc_msgSend(v49, "length"))
          {
            -[RUITopLevelElementParser _lastRow](self, "_lastRow");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "mutableAttributes");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:forKey:", v49, CFSTR("detailLabel"));

          }
        }
LABEL_21:
        self->_parserState = 0;
      }
LABEL_22:
      -[NSMutableArray lastObject](self->_elementStack, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("tableView"));

      -[NSMutableArray lastObject](self->_elementStack, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("section"));

      -[NSMutableArray containsObject:](self->_elementStack, "containsObject:", CFSTR("multiChoiceView"));
      -[RUITopLevelElementParser page](self, "page");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "hasSpinnerView");

      if (!v30)
      {
        if (v28)
        {
          -[RUITopLevelElementParser elementProvider](self, "elementProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "makeTableViewOM");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("header")))
          {
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("subHeader")))
              goto LABEL_82;
LABEL_36:
            v37 = -[RUIElement initWithAttributes:parent:]([RUISubHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
            -[RUIElement setBody:](v37, "setBody:", v5);
            objc_msgSend(v36, "setSubHeader:", v37);
            goto LABEL_81;
          }
        }
        else
        {
          if (!-[NSMutableArray containsObject:](self->_elementStack, "containsObject:", CFSTR("pinView")))
          {
            if (!v32)
              goto LABEL_83;
            -[RUITopLevelElementParser page](self, "page");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "spinnerViewOM");
            v37 = (RUISubHeaderElement *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("header")))
            {
              v40 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v37);
              -[RUIElement setBody:](v40, "setBody:", v5);
              -[RUISubHeaderElement setHeader:](v37, "setHeader:", v40);
            }
            else
            {
              if (!objc_msgSend(v6, "isEqualToString:", CFSTR("footer")))
                goto LABEL_81;
              v40 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v37);
              -[RUIElement setBody:](v40, "setBody:", v5);
              -[RUISubHeaderElement setFooter:](v37, "setFooter:", v40);
            }
            if (v40)
            {
              -[RUIElement attributes](v40, "attributes");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "objectForKey:", CFSTR("color"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              if (!objc_msgSend(v68, "length"))
              {
                -[RUIElement attributes](v40, "attributes");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "setValue:forKey:", CFSTR("labelColor"), CFSTR("color"));

              }
            }
            goto LABEL_81;
          }
          -[RUITopLevelElementParser page](self, "page");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "passcodeViewOM");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("header")))
          {
            if (objc_msgSend(v6, "isEqualToString:", CFSTR("htmlHeader")))
            {
              v37 = -[RUIElement initWithAttributes:parent:]([RUIHTMLHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
              -[RUISubHeaderElement setHTMLContent:](v37, "setHTMLContent:", v5);
              objc_msgSend(v36, "setHTMLHeader:", v37);
              goto LABEL_81;
            }
            goto LABEL_70;
          }
        }
        v37 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
        -[RUIElement setBody:](v37, "setBody:", v5);
        goto LABEL_34;
      }
      -[RUITopLevelElementParser elementProvider](self, "elementProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "makeTableViewOM");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sections");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "isEqualToString:", CFSTR("htmlHeader")))
      {
        v37 = -[RUIElement initWithAttributes:parent:]([RUIHTMLHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
        -[RUISubHeaderElement setHTMLContent:](v37, "setHTMLContent:", v5);
LABEL_34:
        objc_msgSend(v36, "setHeader:", v37);
        goto LABEL_81;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("detailHeader")))
      {
        v37 = -[RUIElement initWithAttributes:parent:]([RUIDetailHeaderElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
        -[RUIElement setBody:](v37, "setBody:", v5);
        objc_msgSend(v36, "setDetailHeader:", v37);
        goto LABEL_81;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("subHeader")))
        goto LABEL_36;
LABEL_70:
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("footer")))
      {
        v37 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
        -[RUIElement setBody:](v37, "setBody:", v5);
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("htmlFooter")))
          goto LABEL_82;
        v37 = -[RUIElement initWithAttributes:parent:]([RUIHTMLFooterElement alloc], "initWithAttributes:parent:", self->_currentElementAttributes, v36);
        -[RUISubHeaderElement setHTMLContent:](v37, "setHTMLContent:", v5);
      }
      objc_msgSend(v36, "setFooter:", v37);
LABEL_81:

LABEL_82:
LABEL_83:
      -[RUITopLevelElementParser _finalizeElement:](self, "_finalizeElement:", v6);
LABEL_84:
      -[NSMutableString setString:](self->_accumulator, "setString:", &stru_24C29B280);
LABEL_85:

      return;
    case 5:
      if (-[NSMutableArray count](self->_swiftUIStack, "count"))
      {
        v19 = 0;
      }
      else
      {
        +[RUIContentRegistry sharedRegistry](_TtC8RemoteUI18RUIContentRegistry, "sharedRegistry");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v63, "supportsViewNamed:", v6);

      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("swiftUIRow")) & 1) != 0 || v19)
      {
        -[RUITopLevelElementParser _lastRow](self, "_lastRow");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v64, "setXmlElement:", self->_swiftUIElement);
          objc_msgSend(v64, "prepareToPreload");
          v65 = self->_swiftUIStack;
          self->_swiftUIStack = 0;

          v66 = self->_swiftUIElement;
          self->_swiftUIElement = 0;

        }
        self->_parserState = 0;
        -[NSMutableArray removeLastObject](self->_elementStack, "removeLastObject");

      }
      goto LABEL_85;
    case 6:
      v9 = CFSTR("navigationBar");
      goto LABEL_20;
    case 7:
      v9 = CFSTR("toolbar");
LABEL_20:
      if (objc_msgSend(v6, "isEqualToString:", v9))
        goto LABEL_21;
      goto LABEL_22;
    default:
      goto LABEL_22;
  }
}

- (BOOL)_isParsingSwiftUI
{
  return (self->_parserState < 6u) & (0x2Cu >> self->_parserState);
}

- (void)traversalDelegateFoundCData:(id)a3
{
  int parserState;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  NSMutableString *accumulator;
  id v14;

  v14 = a3;
  parserState = self->_parserState;
  if (parserState != 4)
  {
    if (parserState == 1)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
      -[RUITopLevelElementParser elementProvider](self, "elementProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "makeWebViewOM");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHtml:", v5);

      goto LABEL_11;
    }
LABEL_10:
    accumulator = self->_accumulator;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
    -[NSMutableString appendString:](accumulator, "appendString:", v5);
    goto LABEL_11;
  }
  -[NSMutableArray lastObject](self->_elementStack, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("htmlSubLabel"));

  if (v9)
  {
    -[RUITopLevelElementParser _lastRow](self, "_lastRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHtmlSubLabelData:", v14);
    goto LABEL_11;
  }
  if (self->_parserState != 4)
    goto LABEL_10;
  -[NSMutableArray lastObject](self->_elementStack, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("Row"));

  if (!v11)
    goto LABEL_10;
  -[RUITopLevelElementParser _lastRow](self, "_lastRow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v12)
    objc_msgSend(v12, "setData:", v14);
LABEL_11:

}

- (id)_createPageWithName:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "topLevelElementParser:createPageWithName:attributes:", self, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (RUIXMLElement)xmlElement
{
  return self->_xmlElement;
}

- (void)setXmlElement:(id)a3
{
  objc_storeStrong((id *)&self->_xmlElement, a3);
}

- (RUITopLevelElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
  objc_storeStrong((id *)&self->_elementProvider, a3);
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (RUITopLevelPageElement)primaryElement
{
  return self->_primaryElement;
}

- (void)setPrimaryElement:(id)a3
{
  objc_storeStrong((id *)&self->_primaryElement, a3);
}

- (RUITopLevelElementParserDelegate)delegate
{
  return (RUITopLevelElementParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryElement, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_xmlElement, 0);
  objc_storeStrong((id *)&self->_swiftUIElement, 0);
  objc_storeStrong((id *)&self->_swiftUIStack, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
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
  _os_log_error_impl(&dword_209E87000, a2, OS_LOG_TYPE_ERROR, "Unknown tag in markup, being ignored: '%@'", (uint8_t *)&v2, 0xCu);
}

@end
