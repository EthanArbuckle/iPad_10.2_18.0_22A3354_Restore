@implementation WXCitation

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  uint64_t v9;
  CXNamespace *v10;
  uint64_t v11;
  CXNamespace *v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  id v16;
  CXNamespace *v17;
  uint64_t v18;
  CXNamespace *v19;
  _xmlNode *v20;
  CXNamespace *v21;
  _xmlNode *Child;
  CXNamespace *v23;
  _xmlNode *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  CXNamespace *v27;
  uint64_t v28;
  CXNamespace *v29;
  uint64_t v30;
  WDCitationAuthor *v31;
  CXNamespace *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;

  v38 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXChildDefaultStringContent(a3, v8, (xmlChar *)"SourceType", 0);
  v9 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v9;
  if (v9)
    objc_msgSend(v38, "setSourceType:", v9);
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXChildDefaultStringContent(a3, v10, (xmlChar *)"Year", 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v11;
  if (v11)
    objc_msgSend(v38, "setYear:", v11);
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXChildDefaultStringContent(a3, v12, (xmlChar *)"Pages", 0);
  v13 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v13;
  if (v13)
    objc_msgSend(v38, "setPages:", v13);
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXChildDefaultStringContent(a3, v14, (xmlChar *)"Title", 0);
  v15 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v15;
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v16, "addObject:", v15);
    objc_msgSend(v38, "setTitles:", v16);

  }
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXChildDefaultStringContent(a3, v17, (xmlChar *)"Volume", 0);
  v18 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v18;
  if (v18)
    objc_msgSend(v38, "setVolume:", v18);
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "Author");

  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(v20, v21, "Author");

  objc_msgSend(v38, "authors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  while (Child)
  {
    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = (_xmlNode *)OCXFindChild(Child, v23, "NameList");

    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v26 = (_xmlNode *)OCXFindChild(v24, v25, "Person");

    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXChildDefaultStringContent(v26, v27, (xmlChar *)"Last", 0);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXChildDefaultStringContent(v26, v29, (xmlChar *)"First", 0);
    v30 = objc_claimAutoreleasedReturnValue();

    if (v28 | v30)
    {
      v31 = -[WDCitationAuthor initWithFirst:last:]([WDCitationAuthor alloc], "initWithFirst:last:", v30, v28);
      objc_msgSend(v39, "addObject:", v31);

    }
    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v32, (xmlChar *)"Author");

  }
}

@end
