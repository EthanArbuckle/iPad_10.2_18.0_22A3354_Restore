@implementation BEWebViewFactoryStylesheetSet

- (BEWebViewFactoryStylesheetSet)init
{
  return -[BEWebViewFactoryStylesheetSet initWithAllFrameStylesheets:](self, "initWithAllFrameStylesheets:", &__NSArray0__struct);
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3
{
  return -[BEWebViewFactoryStylesheetSet initWithMainframeOnlyStylesheets:allFrameStylesheets:](self, "initWithMainframeOnlyStylesheets:allFrameStylesheets:", a3, &__NSArray0__struct);
}

- (BEWebViewFactoryStylesheetSet)initWithAllFrameStylesheets:(id)a3
{
  return -[BEWebViewFactoryStylesheetSet initWithMainframeOnlyStylesheets:allFrameStylesheets:](self, "initWithMainframeOnlyStylesheets:allFrameStylesheets:", &__NSArray0__struct, a3);
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4
{
  return -[BEWebViewFactoryStylesheetSet initWithMainframeOnlyStylesheets:allFrameStylesheets:variableStylesheets:documentAttributes:](self, "initWithMainframeOnlyStylesheets:allFrameStylesheets:variableStylesheets:documentAttributes:", a3, a4, &__NSArray0__struct, &__NSDictionary0__struct);
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4 variableStylesheets:(id)a5 documentAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BEWebViewFactoryStylesheetSet *v14;
  NSArray *v15;
  NSArray *mainframeOnlyStylesheets;
  NSArray *v17;
  NSArray *allFrameStylesheets;
  NSArray *v19;
  NSArray *variableStylesheets;
  NSDictionary *v21;
  NSDictionary *documentAttributes;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BEWebViewFactoryStylesheetSet;
  v14 = -[BEWebViewFactoryStylesheetSet init](&v24, "init");
  if (v14)
  {
    v15 = (NSArray *)objc_msgSend(v10, "copy");
    mainframeOnlyStylesheets = v14->_mainframeOnlyStylesheets;
    v14->_mainframeOnlyStylesheets = v15;

    v17 = (NSArray *)objc_msgSend(v11, "copy");
    allFrameStylesheets = v14->_allFrameStylesheets;
    v14->_allFrameStylesheets = v17;

    v19 = (NSArray *)objc_msgSend(v12, "copy");
    variableStylesheets = v14->_variableStylesheets;
    v14->_variableStylesheets = v19;

    v21 = (NSDictionary *)objc_msgSend(v13, "copy");
    documentAttributes = v14->_documentAttributes;
    v14->_documentAttributes = v21;

  }
  return v14;
}

- (NSString)unifedAllFrameStylesheet
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet allFrameStylesheets](self, "allFrameStylesheets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n")));

  return (NSString *)v3;
}

- (void)applyToWebView:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userContentController"));
  -[BEWebViewFactoryStylesheetSet _addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:](self, "_addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:", v4, 1, 1, 1);

}

- (void)applyToUserContentController:(id)a3
{
  -[BEWebViewFactoryStylesheetSet _addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:](self, "_addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:", a3, 1, 1, 1);
}

- (void)applyVariableStylesheetsToWebView:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userContentController"));
  -[BEWebViewFactoryStylesheetSet _addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:](self, "_addStylesheetSetToUserContentController:includeMainframe:includeAllFrame:includeVariable:", v4, 0, 0, 1);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  if (a3 == self)
    return 1;
  v4 = a3;
  v5 = objc_opt_class(BEWebViewFactoryStylesheetSet);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet mainframeOnlyStylesheets](self, "mainframeOnlyStylesheets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainframeOnlyStylesheets"));
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet allFrameStylesheets](self, "allFrameStylesheets"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allFrameStylesheets"));
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet variableStylesheets](self, "variableStylesheets"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "variableStylesheets"));
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet documentAttributes](self, "documentAttributes"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentAttributes"));
          v16 = objc_msgSend(v14, "isEqual:", v15);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet mainframeOnlyStylesheets](self, "mainframeOnlyStylesheets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet allFrameStylesheets](self, "allFrameStylesheets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet variableStylesheets](self, "variableStylesheets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet documentAttributes](self, "documentAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p mainframeOnlyStylesheets=[%@ items] allFrameStylesheets=[%@ items] variableStylesheets=[%@ items] documentAttributes=[%@ items]>"), v5, self, v7, v9, v11, v13));

  return v14;
}

- (WKContentWorld)mainframeContentWorld
{
  WKContentWorld *mainframeContentWorld;
  WKContentWorld *v4;
  WKContentWorld *v5;

  mainframeContentWorld = self->_mainframeContentWorld;
  if (!mainframeContentWorld)
  {
    v4 = (WKContentWorld *)objc_claimAutoreleasedReturnValue(+[WKContentWorld worldWithName:](WKContentWorld, "worldWithName:", CFSTR("BEWebViewFactoryStylesheetSet.mainframe")));
    v5 = self->_mainframeContentWorld;
    self->_mainframeContentWorld = v4;

    mainframeContentWorld = self->_mainframeContentWorld;
  }
  return mainframeContentWorld;
}

- (WKContentWorld)allFrameContentWorld
{
  WKContentWorld *allFrameContentWorld;
  WKContentWorld *v4;
  WKContentWorld *v5;

  allFrameContentWorld = self->_allFrameContentWorld;
  if (!allFrameContentWorld)
  {
    v4 = (WKContentWorld *)objc_claimAutoreleasedReturnValue(+[WKContentWorld worldWithName:](WKContentWorld, "worldWithName:", CFSTR("BEWebViewFactoryStylesheetSet.allFrame")));
    v5 = self->_allFrameContentWorld;
    self->_allFrameContentWorld = v4;

    allFrameContentWorld = self->_allFrameContentWorld;
  }
  return allFrameContentWorld;
}

- (WKContentWorld)variableContentWorld
{
  WKContentWorld *variableContentWorld;
  WKContentWorld *v4;
  WKContentWorld *v5;

  variableContentWorld = self->_variableContentWorld;
  if (!variableContentWorld)
  {
    v4 = (WKContentWorld *)objc_claimAutoreleasedReturnValue(+[WKContentWorld worldWithName:](WKContentWorld, "worldWithName:", CFSTR("BEWebViewFactoryStylesheetSet.variable")));
    v5 = self->_variableContentWorld;
    self->_variableContentWorld = v4;

    variableContentWorld = self->_variableContentWorld;
  }
  return variableContentWorld;
}

- (void)_addStylesheetSetToUserContentController:(id)a3 includeMainframe:(BOOL)a4 includeAllFrame:(BOOL)a5 includeVariable:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  _BOOL4 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v40 = a6;
  v6 = a5;
  v7 = a4;
  v9 = a3;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet mainframeContentWorld](self, "mainframeContentWorld"));
    objc_msgSend(v9, "_removeAllUserStyleSheetsAssociatedWithContentWorld:", v10);

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v11 = self->_mainframeOnlyStylesheets;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          v17 = objc_alloc((Class)_WKUserStyleSheet);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet mainframeContentWorld](self, "mainframeContentWorld"));
          v19 = objc_msgSend(v17, "initWithSource:forWKWebView:forMainFrameOnly:includeMatchPatternStrings:excludeMatchPatternStrings:baseURL:level:contentWorld:", v16, 0, 1, 0, 0, 0, 0, v18);

          objc_msgSend(v9, "_addUserStyleSheet:", v19);
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v13);
    }

  }
  if (v6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet allFrameContentWorld](self, "allFrameContentWorld"));
    objc_msgSend(v9, "_removeAllUserStyleSheetsAssociatedWithContentWorld:", v20);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = self->_allFrameStylesheets;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
          v27 = objc_alloc((Class)_WKUserStyleSheet);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet allFrameContentWorld](self, "allFrameContentWorld"));
          v29 = objc_msgSend(v27, "initWithSource:forWKWebView:forMainFrameOnly:includeMatchPatternStrings:excludeMatchPatternStrings:baseURL:level:contentWorld:", v26, 0, 0, 0, 0, 0, 0, v28);

          objc_msgSend(v9, "_addUserStyleSheet:", v29);
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v23);
    }

  }
  if (v40)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet variableContentWorld](self, "variableContentWorld"));
    objc_msgSend(v9, "_removeAllUserStyleSheetsAssociatedWithContentWorld:", v30);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = self->_variableStylesheets;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k);
          v37 = objc_alloc((Class)_WKUserStyleSheet);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryStylesheetSet variableContentWorld](self, "variableContentWorld"));
          v39 = objc_msgSend(v37, "initWithSource:forWKWebView:forMainFrameOnly:includeMatchPatternStrings:excludeMatchPatternStrings:baseURL:level:contentWorld:", v36, 0, 0, 0, 0, 0, 0, v38);

          objc_msgSend(v9, "_addUserStyleSheet:", v39);
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v33);
    }

  }
}

- (NSArray)mainframeOnlyStylesheets
{
  return self->_mainframeOnlyStylesheets;
}

- (NSArray)allFrameStylesheets
{
  return self->_allFrameStylesheets;
}

- (NSArray)variableStylesheets
{
  return self->_variableStylesheets;
}

- (NSDictionary)documentAttributes
{
  return self->_documentAttributes;
}

- (void)setMainframeContentWorld:(id)a3
{
  objc_storeStrong((id *)&self->_mainframeContentWorld, a3);
}

- (void)setAllFrameContentWorld:(id)a3
{
  objc_storeStrong((id *)&self->_allFrameContentWorld, a3);
}

- (void)setVariableContentWorld:(id)a3
{
  objc_storeStrong((id *)&self->_variableContentWorld, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableContentWorld, 0);
  objc_storeStrong((id *)&self->_allFrameContentWorld, 0);
  objc_storeStrong((id *)&self->_mainframeContentWorld, 0);
  objc_storeStrong((id *)&self->_documentAttributes, 0);
  objc_storeStrong((id *)&self->_variableStylesheets, 0);
  objc_storeStrong((id *)&self->_allFrameStylesheets, 0);
  objc_storeStrong((id *)&self->_mainframeOnlyStylesheets, 0);
}

@end
