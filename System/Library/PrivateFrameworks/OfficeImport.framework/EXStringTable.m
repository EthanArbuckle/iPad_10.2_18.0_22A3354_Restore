@implementation EXStringTable

+ (void)readFromState:(id)a3
{
  void *v4;
  _xmlDoc *v5;
  xmlNodePtr v6;
  xmlNodePtr v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "currentPart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_xmlDoc *)objc_msgSend(v4, "xmlDocument");
  if (!v5)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v6 = OCXGetRootElement(v5);
  v7 = v6;
  if (!v6
    || !xmlStrEqual(v6->name, (const xmlChar *)"sst")
    || (objc_msgSend(v10, "EXSpreadsheetMLNamespace"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsNode:", v7),
        v8,
        (v9 & 1) == 0))
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  objc_msgSend(a1, "readStringsFrom:state:", v7, v10);

}

+ (void)readStringsFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *Child;
  void *v9;
  uint64_t v10;
  CXNamespace *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "EXSpreadsheetMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v7, "si");

  while (Child)
  {
    +[EXString edTextFromXmlStringElement:state:](EXString, "edTextFromXmlStringElement:state:", Child, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "addObject:", v9);
    }
    else
    {
      +[EXString edStringWithRunsFromXmlStringElement:state:](EXString, "edStringWithRunsFromXmlStringElement:state:", Child, v12);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v9 = (void *)v10;
        objc_msgSend(v6, "addObject:");
      }
      else
      {
        v9 = 0;
      }
    }

    objc_msgSend(v12, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"si");

  }
}

@end
