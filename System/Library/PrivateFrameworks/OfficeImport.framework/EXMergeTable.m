@implementation EXMergeTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *Child;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  CXNamespace *v13;
  id v14;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v7, "mergeCell");

    if (Child)
    {
      v9 = 0;
      do
      {
        if (!v9)
        {
          objc_msgSend(v6, "currentSheet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mergedCells");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v14 = 0;
        CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"ref", &v14);
        v11 = v14;
        +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addOrEquivalentObject:", v12);

        objc_msgSend(v6, "EXSpreadsheetMLNamespace");
        v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v13, (xmlChar *)"mergeCell");

      }
      while (Child);

    }
  }

}

@end
