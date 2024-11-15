@implementation PFAIDisplayOptions

+ (BOOL)readWithArchive:(id)a3 toProperties:(id)a4
{
  xmlTextReader *v5;
  xmlTextReader *v6;
  int v7;
  int v8;
  int v9;
  const xmlChar *v10;
  int i;
  const xmlChar *v12;
  const xmlChar *v13;
  int v14;
  int v15;
  const xmlChar *v16;
  int j;
  const xmlChar *v18;
  const xmlChar *v19;
  int v20;
  int v21;
  NSString *v22;
  id v24;
  id v25;
  id v26;

  v26 = objc_msgSend(a3, "entryWithName:", CFSTR("/META-INF/com.apple.ibooks.display-options.xml"));
  if (v26)
  {
    v25 = objc_alloc_init((Class)NSAutoreleasePool);
    v5 = (xmlTextReader *)objc_msgSend(v26, "xmlReader");
    v6 = v5;
    if (v5)
    {
      v24 = a4;
      v7 = xmlTextReaderDepth(v5);
      while (xmlTextReaderRead(v6) == 1)
      {
        v8 = xmlTextReaderDepth(v6);
        v9 = xmlTextReaderNodeType(v6);
        if (v8 == v7 && v9 == 15)
          break;
        if (v7 + 1 == v8 && v9 == 1)
        {
          v10 = xmlTextReaderConstLocalName(v6);
          if (xmlStrEqual(v10, (const xmlChar *)"platform"))
          {
            for (i = xmlTextReaderMoveToFirstAttribute(v6); i == 1; i = xmlTextReaderMoveToNextAttribute(v6))
            {
              v12 = xmlTextReaderConstLocalName(v6);
              v13 = xmlTextReaderConstValue(v6);
              if (xmlStrEqual(v12, (const xmlChar *)"name"))
                goto LABEL_15;
            }
            v13 = 0;
LABEL_15:
            if (xmlStrEqual(v13, (const xmlChar *)"*") || xmlStrEqual(v13, (const xmlChar *)"ipad"))
            {
LABEL_17:
              while (xmlTextReaderRead(v6) == 1)
              {
                v14 = xmlTextReaderDepth(v6);
                v15 = xmlTextReaderNodeType(v6);
                if (v14 == v8 && v15 == 15)
                  break;
                if (v7 + 2 == v14 && v15 == 1)
                {
                  v16 = xmlTextReaderConstLocalName(v6);
                  if (xmlStrEqual(v16, (const xmlChar *)"option"))
                  {
                    for (j = xmlTextReaderMoveToFirstAttribute(v6); j == 1; j = xmlTextReaderMoveToNextAttribute(v6))
                    {
                      v18 = xmlTextReaderConstLocalName(v6);
                      v19 = xmlTextReaderConstValue(v6);
                      if (xmlStrEqual(v18, (const xmlChar *)"name"))
                        goto LABEL_28;
                    }
                    v19 = 0;
LABEL_28:
                    if (xmlStrEqual(v19, (const xmlChar *)"orientation-lock") && !xmlTextReaderIsEmptyElement(v6))
                    {
                      while (xmlTextReaderRead(v6) == 1)
                      {
                        v20 = xmlTextReaderDepth(v6);
                        v21 = xmlTextReaderNodeType(v6);
                        if (v20 == v14 && v21 == 15)
                          break;
                        if (v7 + 3 == v20 && v21 == 3)
                        {
                          v22 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(v6));
                          if (v22)
                          {
                            objc_msgSend(v24, "setValue:forKey:", v22, kTHBookInfoOrientationLockKey);
                            goto LABEL_17;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      if (v6)
        xmlFreeTextReader(v6);
    }

  }
  return v26 != 0;
}

@end
