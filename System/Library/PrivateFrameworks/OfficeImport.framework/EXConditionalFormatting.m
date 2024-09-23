@implementation EXConditionalFormatting

+ (void)readConditionalFormattingsFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _xmlNode *i;
  id v12;

  v5 = a4;
  v8 = a5;
  v12 = v8;
  if (v5)
  {
    v9 = (id)EXXL2010Namespace;
  }
  else
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && objc_msgSend(v10, "containsNode:", i))
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"conditionalFormatting"))
        objc_msgSend(a1, "readFrom:x14:state:", i, v5, v12);
    }
  }

}

+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 state:(id)a5
{
  _BOOL8 v5;
  CXNamespace *v7;
  CXNamespace *v8;
  EDConditionalFormatting *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _xmlNode *j;
  void *v19;
  void *v20;
  _xmlNode *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v23 = a5;
  if (a3)
  {
    if (v5)
    {
      v7 = (CXNamespace *)(id)EXXL2010Namespace;
    }
    else
    {
      objc_msgSend(v23, "EXSpreadsheetMLNamespace");
      v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    v9 = objc_alloc_init(EDConditionalFormatting);
    if (v5)
    {
      v10 = OCXFindChild(a3, (CXNamespace *)EXMainNamespace, "sqref");
      if (!v10)
        goto LABEL_21;
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v10);
    }
    else
    {
      v28 = 0;
      CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"sqref", &v28);
      v11 = v28;
    }
    if (v11)
    {
      v22 = v11;
      +[EXReference edDiscontinousReferencesFromXmlRanges:](EXReference, "edDiscontinousReferencesFromXmlRanges:");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v21 = a3;
      v14 = 0;
      if (v13)
      {
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (v14)
            {
              objc_msgSend(v14, "unionWithReference:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            }
            else
            {
              +[EDReference referenceWithReference:](EDReference, "referenceWithReference:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[EDConditionalFormatting addRange:](v9, "addRange:", v17);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v13);
      }

      a3 = v21;
      goto LABEL_22;
    }
LABEL_21:
    v22 = 0;
    v14 = 0;
LABEL_22:
    for (j = (_xmlNode *)OCXFindChild(a3, v8, "cfRule"); j; j = OCXFindNextChild(j, v8, (xmlChar *)"cfRule"))
      +[EXConditionalFormattingRule readFrom:x14:edConditionalFormatting:edReference:state:](EXConditionalFormattingRule, "readFrom:x14:edConditionalFormatting:edReference:state:", j, v5, v9, v14, v23);
    objc_msgSend(v23, "currentSheet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "conditionalFormattings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v9);
  }

}

@end
