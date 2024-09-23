@implementation OISpotlightImporter

- (OISpotlightImporter)init
{
  objc_super v4;

  if (-[OISpotlightImporter init]::once != -1)
    dispatch_once(&-[OISpotlightImporter init]::once, &__block_literal_global_108);
  v4.receiver = self;
  v4.super_class = (Class)OISpotlightImporter;
  return -[OISpotlightImporter init](&v4, sel_init);
}

uint64_t __27__OISpotlightImporter_init__block_invoke()
{
  objc_opt_class();
  return objc_opt_class();
}

- (void)addPackagePropertiesFromReader:(id)a3 toSearchableAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "zipPackage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v8, "creator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAuthorNames:", v12);

  }
  objc_msgSend(v8, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length") == 0;

  if (!v14)
  {
    objc_msgSend(v8, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentDescription:", v15);

  }
  objc_msgSend(v8, "keywords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length") == 0;

  if (!v17)
  {
    objc_msgSend(v8, "keywords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKeywords:", v19);

  }
  objc_msgSend(v8, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length") == 0;

  if (!v21)
  {
    objc_msgSend(v8, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v22);

  }
  objc_msgSend(v8, "company");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length") == 0;

  if (!v24)
  {
    objc_msgSend(v8, "company");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrganizations:", v26);

  }
  objc_msgSend(v8, "subject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length") == 0;

  if (!v28)
  {
    objc_msgSend(v8, "subject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubject:", v29);

  }
}

- (id)textFromElementsNamed:(const char *)a3 skippingElementsNamed:(const char *)a4 insertingNewlinesOnElementsNamed:(const char *)a5 tabulationsOnElementsNamed:(const char *)a6 inNamespaces:(const char *)a7 inPackagePart:(id)a8
{
  id v13;
  id v14;
  xmlTextReader *v15;
  BOOL v16;
  const xmlChar *v17;
  const xmlNode *v18;
  xmlChar *Content;
  void *v20;

  v13 = a8;
  v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v15 = (xmlTextReader *)objc_msgSend(v13, "xmlReader");
  v16 = 0;
  while (xmlTextReaderRead(v15) == 1)
  {
    if (xmlTextReaderNodeType(v15) == 1)
    {
      v17 = xmlTextReaderConstLocalName(v15);
      if (xmlStrcmp(v17, (const xmlChar *)a3))
      {
        if (a4
          && !xmlStrcmp(v17, (const xmlChar *)a4)
          && isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
        {
          while (xmlTextReaderRead(v15) == 1
               && (xmlTextReaderNodeType(v15) != 15
                || xmlStrcmp(v17, (const xmlChar *)a4)
                || !isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7)))
            ;
        }
        else if (a5 == 0
               || !v16
               || xmlStrcmp(v17, (const xmlChar *)a5)
               || !isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
        {
          if (a6 != 0 && v16)
          {
            v16 = 1;
            if (!xmlStrcmp(v17, (const xmlChar *)a6)
              && isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
            {
              objc_msgSend(v14, "appendString:", CFSTR("\t"));
            }
          }
        }
        else
        {
          objc_msgSend(v14, "appendString:", CFSTR("\n"));
          v16 = 0;
        }
      }
      else if (isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
      {
        v18 = xmlTextReaderExpand(v15);
        Content = xmlNodeGetContent(v18);
        if (Content)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Content);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "appendString:", v20);

          if (!a5)
            objc_msgSend(v14, "appendString:", CFSTR("\n"));
          ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Content);
          v16 = a5 != 0;
        }
      }
    }
  }
  xmlFreeTextReader(v15);

  return v14;
}

- (id)textContentFromPowerPointReader:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "zipPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainDocumentPart");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "relationshipsByType:", CFSTR("http://purl.oclc.org/ooxml/officeDocument/relationships/slide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v23 = v5;
  }
  else
  {
    objc_msgSend(v22, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  v41[0] = "http://schemas.openxmlformats.org/drawingml/2006/main";
  v41[1] = "http://purl.oclc.org/ooxml/drawingml/main";
  v41[2] = 0;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v23;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v7 = 0;
    v25 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "targetLocation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "partForLocation:", v8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, "p", 0, v41, v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "length"))
        {
          if ((v7 & 1) != 0)
            objc_msgSend(v30, "addObject:", CFSTR("\n"));
          objc_msgSend(v30, "addObject:", v27);
          v7 = 1;
        }
        objc_msgSend(v29, "relationshipsByType:", CFSTR("http://purl.oclc.org/ooxml/officeDocument/relationships/notesSlide"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(v29, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/notesSlide"));
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "targetLocation");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "partForLocation:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", "fld", "p", 0, v41, v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "length"))
              {
                objc_msgSend(v30, "addObject:", v19);
                v7 = 1;
              }

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v14);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v26);
  }

  objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)textContentFromWordReader:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  id obja;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[7];

  v37[5] = *MEMORY[0x24BDAC8D0];
  v37[0] = "http://purl.oclc.org/ooxml/wordprocessingml/main";
  v37[1] = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
  v37[2] = "http://schemas.microsoft.com/office/word/2012/wordml";
  v37[3] = "http://schemas.microsoft.com/office/word/2010/wordml";
  v37[4] = 0;
  objc_msgSend(a3, "zipPackage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mainDocumentPart");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v23, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/header"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "targetLocation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "partForLocation:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, "p", "tab", v37, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }

  -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, "p", "tab", v37, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v11);

  objc_msgSend(v23, "firstPartWithRelationshipOfType:", CFSTR("http://purl.oclc.org/ooxml/officeDocument/relationships/footnotes"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v23, "firstPartWithRelationshipOfType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes")), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, "p", "tab", v37, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v13);

  }
  else
  {
    v21 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v23, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer"), v21);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obja);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "targetLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "partForLocation:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, "p", "tab", v37, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v19);

      }
      v14 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v14);
  }

  return v4;
}

- (id)sheetNamesFromWorkbookPart:(id)a3
{
  id v3;
  id v4;
  xmlTextReader *v5;
  char v6;
  const xmlChar *v7;
  const xmlChar *v8;
  xmlNodePtr v9;
  _xmlAttr *properties;
  const xmlChar *name;
  id v12;
  void *v13;
  void *v14;
  const unsigned __int8 *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (xmlTextReader *)objc_msgSend(v3, "xmlReader");
  v6 = 0;
  v16 = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
  v17 = "http://purl.oclc.org/ooxml/spreadsheetml/main";
  v18 = 0;
  while (xmlTextReaderRead(v5) == 1)
  {
    if ((v6 & 1) != 0 && xmlTextReaderNodeType(v5) == 15)
    {
      v7 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v7, (const xmlChar *)"sheets"))
      {
        if (isCurrentTextReaderElementInNamespaces(v5, &v16))
          break;
      }
    }
    if (xmlTextReaderNodeType(v5) == 1)
    {
      v8 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v8, (const xmlChar *)"sheet"))
      {
        if (isCurrentTextReaderElementInNamespaces(v5, &v16))
        {
          v9 = xmlTextReaderExpand(v5);
          if (v9)
          {
            properties = v9->properties;
            v6 = 1;
            if (properties)
            {
              while (1)
              {
                name = properties->name;
                if (name)
                {
                  if (xmlStrEqual(name, (const xmlChar *)"name"))
                    break;
                }
                properties = properties->next;
                if (!properties)
                  goto LABEL_17;
              }
              v12 = objc_alloc(MEMORY[0x24BDD17C8]);
              v13 = (void *)objc_msgSend(v12, "tc_initWithValueOfXmlAttribute:", properties, v16, v17, v18, v19);
              objc_msgSend(v4, "addObject:", v13);

LABEL_17:
              v6 = 1;
            }
          }
        }
      }
    }
  }
  xmlFreeTextReader(v5);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"), v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)textContentFromExcelReader:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v15[0] = "http://purl.oclc.org/ooxml/spreadsheetml/main";
  v15[1] = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
  v15[2] = "http://schemas.openxmlformats.org/spreadsheetml/2006/7/main";
  v15[3] = 0;
  objc_msgSend(a3, "zipPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainDocumentPart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OISpotlightImporter sheetNamesFromWorkbookPart:](self, "sheetNamesFromWorkbookPart:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartWithRelationshipOfType:", CFSTR("http://purl.oclc.org/ooxml/officeDocument/relationships/sharedStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "firstPartWithRelationshipOfType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[OISpotlightImporter textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:](self, "textFromElementsNamed:skippingElementsNamed:insertingNewlinesOnElementsNamed:tabulationsOnElementsNamed:inNamespaces:inPackagePart:", "t", 0, 0, 0, v15, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)textContentForReader:(id)a3 withType:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  switch(a4)
  {
    case 2uLL:
      -[OISpotlightImporter textContentFromWordReader:](self, "textContentFromWordReader:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      -[OISpotlightImporter textContentFromPowerPointReader:](self, "textContentFromPowerPointReader:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[OISpotlightImporter textContentFromExcelReader:](self, "textContentFromExcelReader:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OISpotlightImporter.mm"), 387, CFSTR("Unknown file type"));

      v9 = 0;
      goto LABEL_9;
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (id)searchableAttributesForXMLOfficeFileOfType:(unint64_t)a3 atURL:(id)a4 error:(id *)a5
{
  id v7;
  OCXReader *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = -[OCDReader initWithCancelDelegate:]([OCXReader alloc], "initWithCancelDelegate:", 0);
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader setFileName:](v8, "setFileName:", v9);

  if (-[OCXReader start](v8, "start"))
  {
    v10 = objc_alloc_init(MEMORY[0x24BDC2480]);
    -[OISpotlightImporter addPackagePropertiesFromReader:toSearchableAttributes:](self, "addPackagePropertiesFromReader:toSearchableAttributes:", v8, v10);
    -[OISpotlightImporter textContentForReader:withType:](self, "textContentForReader:withType:", v8, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextContent:", v11);

    v12 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)searchableAttributesForOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CMFileManager getFileTypeFromPath:](CMFileManager, "getFileTypeFromPath:", v7);

  if (v8 <= 6)
  {
    if (((1 << v8) & 0x2A) != 0)
    {
      +[QLTop searchableAttributesForBinaryOfficeFileAtURL:error:](QLTop, "searchableAttributesForBinaryOfficeFileAtURL:error:", v6, a4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (((1 << v8) & 0x54) != 0)
    {
      -[OISpotlightImporter searchableAttributesForXMLOfficeFileOfType:atURL:error:](self, "searchableAttributesForXMLOfficeFileOfType:atURL:error:", v8, v6, a4);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      goto LABEL_7;
    }
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("OIErrorDomain"), 2, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_7:

  return v10;
}

@end
