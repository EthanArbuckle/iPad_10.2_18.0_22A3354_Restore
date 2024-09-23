@implementation EXFontTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *Child;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  EDFont *v16;
  void *v17;
  EDFont *v18;
  CXNamespace *v19;
  EDFont *v20;
  void *v21;
  EDFont *v22;
  id v23;

  v5 = a4;
  if (a3)
  {
    v23 = v5;
    objc_msgSend(v5, "resources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fonts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v8, "font");

    v10 = 0;
    if (Child)
    {
      v11 = 1;
      do
      {
        +[EXFont edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:](EXFont, "edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:", Child, 0, 0, v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if ((objc_msgSend(v12, "isHeightOverridden") & 1) == 0 && v10)
          {
            objc_msgSend(v10, "height");
            objc_msgSend(v13, "setHeight:");
          }
          if ((objc_msgSend(v13, "isNameOverridden") & 1) == 0 && v10)
          {
            objc_msgSend(v10, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setName:", v14);

          }
          if ((v11 & 1) != 0)
          {
            v15 = v13;

            v10 = v15;
          }
          objc_msgSend(v7, "addObject:", v13);
        }
        else if (v10)
        {
          objc_msgSend(v7, "addObject:", v10);
        }
        else
        {
          v16 = [EDFont alloc];
          objc_msgSend(v23, "resources");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[EDFont initWithResources:](v16, "initWithResources:", v17);
          objc_msgSend(v7, "addObject:", v18);

          v10 = 0;
        }
        objc_msgSend(v23, "EXSpreadsheetMLNamespace");
        v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v19, (xmlChar *)"font");

        v11 = 0;
      }
      while (Child);
    }
    if (!objc_msgSend(v7, "count"))
    {
      v20 = [EDFont alloc];
      objc_msgSend(v23, "resources");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[EDFont initWithResources:](v20, "initWithResources:", v21);

      objc_msgSend(v7, "addObject:", v22);
    }

    v5 = v23;
  }

}

+ (void)setDefaultWithState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDFont fontWithResources:](EDFont, "fontWithResources:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHeight:", 240.0);
  objc_msgSend(v7, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fonts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v4);
}

@end
