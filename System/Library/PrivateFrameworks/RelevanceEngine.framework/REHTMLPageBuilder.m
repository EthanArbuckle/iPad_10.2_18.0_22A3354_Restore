@implementation REHTMLPageBuilder

+ (id)_docTypeElement
{
  if (_docTypeElement_onceToken != -1)
    dispatch_once(&_docTypeElement_onceToken, &__block_literal_global_17);
  return (id)_docTypeElement_Element;
}

void __36__REHTMLPageBuilder__docTypeElement__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", CFSTR("<!DOCTYPE html>"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_docTypeElement_Element;
  _docTypeElement_Element = v0;

}

+ (id)_htmlElement
{
  if (_htmlElement_onceToken != -1)
    dispatch_once(&_htmlElement_onceToken, &__block_literal_global_15);
  return (id)_htmlElement_Element;
}

void __33__REHTMLPageBuilder__htmlElement__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("html"), &stru_24CF92178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_htmlElement_Element;
  _htmlElement_Element = v0;

}

+ (id)_headElement
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__REHTMLPageBuilder__headElement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_headElement_onceToken != -1)
    dispatch_once(&_headElement_onceToken, block);
  return (id)_headElement_Element;
}

void __33__REHTMLPageBuilder__headElement__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("meta"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibute:value:", CFSTR("charset"), CFSTR("utf-8"));
  v30 = (id)objc_claimAutoreleasedReturnValue();

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("head"), &stru_24CF92178);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addChild:", v30);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_headElement_Element;
  _headElement_Element = v4;

  v6 = (void *)_headElement_Element;
  objc_msgSend(*(id *)(a1 + 32), "_viewportElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChild:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_headElement_Element;
  _headElement_Element = v8;

  v10 = (void *)_headElement_Element;
  objc_msgSend(*(id *)(a1 + 32), "_iosIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_headElement_Element;
  _headElement_Element = v12;

  v14 = (void *)_headElement_Element;
  objc_msgSend(*(id *)(a1 + 32), "_smallFavicon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addChild:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_headElement_Element;
  _headElement_Element = v16;

  v18 = (void *)_headElement_Element;
  objc_msgSend(*(id *)(a1 + 32), "_largeFavicon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addChild:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)_headElement_Element;
  _headElement_Element = v20;

  v22 = (void *)_headElement_Element;
  objc_msgSend(*(id *)(a1 + 32), "_safariIcon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addChild:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)_headElement_Element;
  _headElement_Element = v24;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("meta"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "elementByAddingAtttibutes:", &unk_24CFC1D60);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_headElement_Element, "addChild:", v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)_headElement_Element;
  _headElement_Element = v28;

}

+ (id)_stylesheetElementWithLocation:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _stylesheetElementWithLocation__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_stylesheetElementWithLocation__onceToken, &__block_literal_global_38_0);
  objc_msgSend((id)_stylesheetElementWithLocation__Element, "elementByAddingAtttibute:value:", CFSTR("href"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__REHTMLPageBuilder__stylesheetElementWithLocation___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("link"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_stylesheetElementWithLocation__Element;
  _stylesheetElementWithLocation__Element = v0;

  objc_msgSend((id)_stylesheetElementWithLocation__Element, "elementByAddingAtttibute:value:", CFSTR("rel"), CFSTR("stylesheet"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_stylesheetElementWithLocation__Element;
  _stylesheetElementWithLocation__Element = v2;

}

+ (id)_scriptElementWithLocation:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _scriptElementWithLocation__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_scriptElementWithLocation__onceToken, &__block_literal_global_47);
  objc_msgSend((id)_scriptElementWithLocation__Element, "elementByAddingAtttibute:value:", CFSTR("src"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__REHTMLPageBuilder__scriptElementWithLocation___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("script"), &stru_24CF92178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scriptElementWithLocation__Element;
  _scriptElementWithLocation__Element = v0;

}

+ (id)_bodyElement
{
  if (_bodyElement_onceToken != -1)
    dispatch_once(&_bodyElement_onceToken, &__block_literal_global_52);
  return (id)_bodyElement_Element;
}

void __33__REHTMLPageBuilder__bodyElement__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("body"), &stru_24CF92178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bodyElement_Element;
  _bodyElement_Element = v0;

  objc_msgSend((id)_bodyElement_Element, "elementByAddingAtttibute:value:", CFSTR("onload"), CFSTR("pageDidLoad();"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_bodyElement_Element;
  _bodyElement_Element = v2;

}

+ (id)_mainNavigationElement
{
  if (_mainNavigationElement_onceToken != -1)
    dispatch_once(&_mainNavigationElement_onceToken, &__block_literal_global_59);
  return (id)_mainNavigationElement_Element;
}

void __43__REHTMLPageBuilder__mainNavigationElement__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[REHTMLElement nav](REHTMLElement, "nav");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingClass:", CFSTR("main_nav"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_mainNavigationElement_Element;
  _mainNavigationElement_Element = v0;

}

+ (id)_viewportElement
{
  void *v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("meta"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibutes:", &unk_24CFC1D88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_iosIcon
{
  void *v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("link"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibutes:", &unk_24CFC1DB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_smallFavicon
{
  void *v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("link"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibutes:", &unk_24CFC1DD8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_largeFavicon
{
  void *v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("link"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibutes:", &unk_24CFC1E00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_safariIcon
{
  void *v2;
  void *v3;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("link"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementByAddingAtttibutes:", &unk_24CFC1E28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REHTMLPageBuilder)init
{
  REHTMLPageBuilder *v2;
  REHTMLPageBuilder *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLPageBuilder;
  v2 = -[REHTMLPageBuilder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[REHTMLPageBuilder setPageDescription:](v2, "setPageDescription:", &stru_24CF92178);
    v4 = MEMORY[0x24BDBD1A8];
    -[REHTMLPageBuilder setStylesheets:](v3, "setStylesheets:", MEMORY[0x24BDBD1A8]);
    -[REHTMLPageBuilder setLinks:](v3, "setLinks:", v4);
    -[REHTMLPageBuilder setLoadingScripts:](v3, "setLoadingScripts:", v4);
  }
  return v3;
}

- (void)setStylesheets:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  v6 = self->_stylesheets;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_stylesheets, a3);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v5;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v9);
            objc_msgSend((id)objc_opt_class(), "_stylesheetElementWithLocation:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v12)
            {
              objc_msgSend(v12, "append:", v15);
              v17 = objc_claimAutoreleasedReturnValue();

              v12 = (id)v17;
            }
            else
            {
              v12 = v15;
            }

          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);

        if (v12)
          goto LABEL_18;
      }
      else
      {

      }
      +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", &stru_24CF92178);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __36__REHTMLPageBuilder_setStylesheets___block_invoke;
      v19[3] = &unk_24CF8AB18;
      v19[4] = self;
      v20 = v12;
      v18 = v12;
      REHTMLElementAccessLock(v19);

    }
  }

}

void __36__REHTMLPageBuilder_setStylesheets___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)setLoadingScripts:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  v6 = self->_loadingScripts;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_loadingScripts, a3);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v5;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v9);
            objc_msgSend((id)objc_opt_class(), "_scriptElementWithLocation:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v12)
            {
              objc_msgSend(v12, "append:", v15);
              v17 = objc_claimAutoreleasedReturnValue();

              v12 = (id)v17;
            }
            else
            {
              v12 = v15;
            }

          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);

        if (v12)
          goto LABEL_18;
      }
      else
      {

      }
      +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", &stru_24CF92178);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __39__REHTMLPageBuilder_setLoadingScripts___block_invoke;
      v19[3] = &unk_24CF8AB18;
      v19[4] = self;
      v20 = v12;
      v18 = v12;
      REHTMLElementAccessLock(v19);

    }
  }

}

void __39__REHTMLPageBuilder_setLoadingScripts___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setPageDescription:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *pageDescription;
  NSString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  _QWORD v15[5];
  id v16;

  v4 = (NSString *)a3;
  v5 = self->_pageDescription;
  if (v5 == v4)
  {
    v14 = v4;
LABEL_7:

    goto LABEL_8;
  }
  v6 = v5;
  v14 = v4;
  v7 = -[NSString isEqual:](v14, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    pageDescription = self->_pageDescription;
    self->_pageDescription = v14;
    v9 = v14;

    v10 = &stru_24CF92178;
    if (v9)
      v10 = (__CFString *)v9;
    v14 = v10;

    +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("meta"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elementByAddingAtttibute:value:", CFSTR("name"), CFSTR("description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "elementByAddingAtttibute:value:", CFSTR("content"), v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__REHTMLPageBuilder_setPageDescription___block_invoke;
    v15[3] = &unk_24CF8AB18;
    v15[4] = self;
    v16 = v13;
    v4 = v13;
    REHTMLElementAccessLock(v15);

    goto LABEL_7;
  }
LABEL_8:

}

void __40__REHTMLPageBuilder_setPageDescription___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)setLinks:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  REHTMLPageBuilder *v24;
  NSArray *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  v6 = self->_links;
  if (v6 == v5)
  {

    goto LABEL_21;
  }
  v7 = v6;
  v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_links, a3);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v5;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v10)
    {

      goto LABEL_19;
    }
    v11 = v10;
    v24 = self;
    v25 = v5;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "location", v24, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[REHTMLElement link:title:](REHTMLElement, "link:title:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          if (v12)
            goto LABEL_10;
        }
        else
        {
          objc_msgSend(v18, "elementByAddingClass:", CFSTR("no-highlight"));
          v22 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v22;
          if (v12)
          {
LABEL_10:
            objc_msgSend(v12, "append:", v18);
            v21 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v21;
            goto LABEL_13;
          }
        }
        objc_msgSend(v18, "elementByAddingClass:", CFSTR("main"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v11)
      {

        self = v24;
        v5 = v25;
        if (!v12)
        {
LABEL_19:
          +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", &stru_24CF92178);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __30__REHTMLPageBuilder_setLinks___block_invoke;
        v26[3] = &unk_24CF8AB18;
        v26[4] = self;
        v27 = v12;
        v23 = v12;
        REHTMLElementAccessLock(v26);

        break;
      }
    }
  }
LABEL_21:

}

void __30__REHTMLPageBuilder_setLinks___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (id)pageWithTitle:(id)a3 content:(id)a4 backLocation:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[9];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v45 = a4;
  v9 = a5;
  if (!-[__CFString length](v8, "length"))
  {

    v8 = 0;
  }
  v44 = v9;
  if (!v45)
  {
    +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", &stru_24CF92178);
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__6;
  v69 = __Block_byref_object_dispose__6;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__6;
  v63 = __Block_byref_object_dispose__6;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__6;
  v57 = __Block_byref_object_dispose__6;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  v52 = 0;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __56__REHTMLPageBuilder_pageWithTitle_content_backLocation___block_invoke;
  v46[3] = &unk_24CF8C3B8;
  v46[4] = self;
  v46[5] = &v65;
  v46[6] = &v59;
  v46[7] = &v53;
  v46[8] = &v47;
  REHTMLElementAccessLock(v46);
  objc_msgSend((id)objc_opt_class(), "_headElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v66[5];
  v71[0] = v54[5];
  v71[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChildren:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v14 = v8;
  else
    v14 = CFSTR("Relevance Engine");
  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("title"), v14);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addChild:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v15;

  objc_msgSend((id)objc_opt_class(), "_htmlElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addChild:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addChild:", v60[5]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_bodyElement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_mainNavigationElement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addChild:", v48[5]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addChild:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[REHTMLElement div](REHTMLElement, "div");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "elementByAddingClass:", CFSTR("content"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "elementByAddingAtttibute:value:", CFSTR("id"), CFSTR("main-content"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[REHTMLElement div](REHTMLElement, "div", v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "elementByAddingClass:", CFSTR("header"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "elementByAddingAtttibute:value:", CFSTR("id"), CFSTR("main-header"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      +[REHTMLElement link:title:](REHTMLElement, "link:title:", v44, CFSTR("‹"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "elementByAddingClass:", CFSTR("chevron-back"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "addChild:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v32;
    }
    +[REHTMLElement h1:](REHTMLElement, "h1:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addChild:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addChild:", v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v35;
  }
  objc_msgSend(v26, "addChild:", v45, v42);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "addChild:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addChild:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_docTypeElement");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "append:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v40;
}

void __56__REHTMLPageBuilder_pageWithTitle_content_backLocation___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 32));
}

- (NSArray)stylesheets
{
  return self->_stylesheets;
}

- (NSArray)loadingScripts
{
  return self->_loadingScripts;
}

- (NSString)pageDescription
{
  return self->_pageDescription;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_pageDescription, 0);
  objc_storeStrong((id *)&self->_loadingScripts, 0);
  objc_storeStrong((id *)&self->_stylesheets, 0);
  objc_storeStrong((id *)&self->_navigationLinksElement, 0);
  objc_storeStrong((id *)&self->_pageDescriptionElement, 0);
  objc_storeStrong((id *)&self->_scriptsElement, 0);
  objc_storeStrong((id *)&self->_stylesheetsElement, 0);
}

@end
