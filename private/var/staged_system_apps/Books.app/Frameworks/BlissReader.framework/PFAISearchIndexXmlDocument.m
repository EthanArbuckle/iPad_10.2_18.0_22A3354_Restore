@implementation PFAISearchIndexXmlDocument

+ (BOOL)readWithState:(id)a3
{
  id v3;
  xmlTextReader *v4;
  xmlTextReader *v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  const xmlChar *v12;
  const xmlChar *v13;
  int v14;
  int v15;
  const xmlChar *v16;
  const xmlChar *v17;
  id v18;
  id v19;
  int v20;
  int v21;
  const xmlChar *v22;
  const xmlChar *v23;
  id v24;
  int v25;
  int v26;
  const xmlChar *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const xmlChar *v33;
  const xmlChar *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  id v38;
  id v39;
  const xmlChar *v40;
  double v41;
  const xmlChar *v42;
  const xmlChar *v43;
  const char *v44;
  const char *v45;
  int v46;
  int v47;
  const xmlChar *v48;
  id v49;
  id v50;
  const xmlChar *v51;
  BOOL v52;
  id v53;
  char v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;

  v3 = a3;
  v4 = (xmlTextReader *)objc_msgSend(a3, "streamAPI");
  if (!v4)
    return (char)v4;
  v5 = v4;
  v62 = xmlTextReaderDepth(v4) + 1;
  v60 = objc_msgSend(objc_msgSend(v3, "thDocumentRoot"), "searchIndex");
  v58 = +[NSMutableSet set](NSMutableSet, "set");
  v64 = 0;
  v6 = 0;
  do
  {
    if (xmlTextReaderRead(v5) != 1 || (v6 & v64 & HIDWORD(v64) & 1) != 0)
      break;
    v7 = xmlTextReaderDepth(v5);
    v8 = xmlTextReaderNodeType(v5);
    if (v7)
      v9 = 0;
    else
      v9 = v8 == 1;
    v10 = !v9;
    if (((v10 | v64) & 1) == 0)
    {
      v40 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v40, (const xmlChar *)"index"))
      {
        if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
        {
          v41 = 0.0;
          do
          {
            v42 = xmlTextReaderConstLocalName(v5);
            v43 = v42;
            if (v41 == 0.0 && xmlStrEqual(v42, (const xmlChar *)"currentVersion"))
            {
              v67 = 0;
              v44 = (const char *)xmlTextReaderConstValue(v5);
              if (sscanf(v44, "%lf", &v67))
                v41 = *(double *)&v67;
              else
                v41 = 0.0;
            }
            else if (xmlStrEqual(v43, (const xmlChar *)"requiredVersion"))
            {
              v67 = 0;
              v45 = (const char *)xmlTextReaderConstValue(v5);
              if (sscanf(v45, "%lf", &v67))
                v41 = *(double *)&v67;
            }
          }
          while (xmlTextReaderMoveToNextAttribute(v5) == 1);
          if (v41 < 0.0)
            objc_msgSend(objc_msgSend(v3, "loadDelegate"), "cancel");
        }
        v11 = 0;
        LODWORD(v64) = 1;
        continue;
      }
      LODWORD(v64) = 0;
LABEL_125:
      v11 = 0;
      continue;
    }
    v11 = 0;
    v65 = v7;
    if (v62 != v7 || v8 != 1 || (v6 & HIDWORD(v64) & 1) != 0)
      continue;
    v12 = xmlTextReaderConstLocalName(v5);
    v13 = v12;
    v63 = v65 + 1;
    if ((v6 & 1) != 0 || !xmlStrEqual(v12, (const xmlChar *)"ts"))
    {
      if ((v64 & 0x100000000) != 0)
      {
LABEL_127:
        v11 = 0;
        HIDWORD(v64) = 1;
        continue;
      }
      if (!xmlStrEqual(v13, (const xmlChar *)"rs"))
      {
        HIDWORD(v64) = 0;
        goto LABEL_125;
      }
      while (1)
      {
        if (xmlTextReaderRead(v5) != 1)
          goto LABEL_127;
        v46 = xmlTextReaderDepth(v5);
        v47 = xmlTextReaderNodeType(v5);
        if (v46 == (_DWORD)v65 && v47 == 15)
          goto LABEL_127;
        if (v63 != v46)
          goto LABEL_160;
        if (v47 != 1)
          goto LABEL_160;
        v48 = xmlTextReaderConstLocalName(v5);
        if (!xmlStrEqual(v48, (const xmlChar *)"r"))
          goto LABEL_160;
        if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
        {
          v49 = 0;
          v50 = 0;
          do
          {
            if (v50 && v49)
              break;
            v51 = xmlTextReaderConstLocalName(v5);
            if (xmlStrEqual(v51, (const xmlChar *)"ri"))
            {

              v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", xmlTextReaderConstValue(v5));
            }
            else if (xmlStrEqual(v51, (const xmlChar *)"fi"))
            {

              v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", xmlTextReaderConstValue(v5));
            }
          }
          while (xmlTextReaderMoveToNextAttribute(v5) == 1);
          v52 = v49 != 0;
          if (v50 && v49)
          {
            v53 = objc_msgSend(v58, "member:", v50);
            if (v53)
              objc_msgSend(v60, "addReference:cfi:", v53, v49);
            else
              NSLog(CFSTR("CFI with refID='%@' is not referenced in search index. Dropping CFI '%@'."), v50, v49);
            goto LABEL_159;
          }
          if (v50)
          {
            if (v49)
              goto LABEL_154;
LABEL_153:
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAISearchIndexXmlDocument readWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAISearchIndexDocument.mm"), 420, CFSTR("No CFI for ri='%@'"), v50);
            goto LABEL_154;
          }
        }
        else
        {
          v49 = 0;
          v52 = 0;
        }
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAISearchIndexXmlDocument readWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAISearchIndexDocument.mm"), 419, CFSTR("No ri for CFI='%@'"), v49);
        v50 = 0;
        if (!v52)
          goto LABEL_153;
LABEL_154:
        NSLog(CFSTR("Unable to parse CFI/refID combination '%@'/'%@'."), v49, v50);
LABEL_159:

LABEL_160:
        if (objc_msgSend(v3, "isCancelled"))
        {
          HIDWORD(v64) = 1;
          goto LABEL_125;
        }
      }
    }
    v61 = objc_alloc_init((Class)NSMutableSet);
    do
    {
      if (xmlTextReaderRead(v5) != 1)
        break;
      v14 = xmlTextReaderDepth(v5);
      v15 = xmlTextReaderNodeType(v5);
      v66 = v14;
      if (v14 == (_DWORD)v65 && v15 == 15)
        break;
      if (v63 == v14 && v15 == 1)
      {
        v16 = xmlTextReaderConstLocalName(v5);
        if (xmlStrEqual(v16, (const xmlChar *)"t"))
        {
          if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
          {
            do
            {
              v17 = xmlTextReaderConstLocalName(v5);
              if (xmlStrEqual(v17, (const xmlChar *)"s"))
                v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", xmlTextReaderConstValue(v5));
              else
                v18 = 0;
            }
            while (xmlTextReaderMoveToNextAttribute(v5) == 1 && !v18);
            if (v18)
            {
              v19 = objc_msgSend(v60, "addTermWithStem:", v18);
              if (xmlTextReaderRead(v5) == 1)
              {
                v56 = v3;
                v57 = v19;
                v55 = 0;
                do
                {
                  v20 = xmlTextReaderDepth(v5);
                  v21 = xmlTextReaderNodeType(v5);
                  if (v20 == v66 && v21 == 15)
                    break;
                  if (v65 + 2 == v20 && v21 == 1)
                  {
                    v22 = xmlTextReaderConstLocalName(v5);
                    if (xmlStrEqual(v22, (const xmlChar *)"i"))
                    {
                      if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
                      {
                        do
                        {
                          v23 = xmlTextReaderConstLocalName(v5);
                          if (xmlStrEqual(v23, (const xmlChar *)"sr"))
                            v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", xmlTextReaderConstValue(v5));
                          else
                            v24 = 0;
                        }
                        while (xmlTextReaderMoveToNextAttribute(v5) == 1 && !v24);
                        if (v57 && v24)
                        {
                          v59 = objc_msgSend(v57, "addInflection:", v24);
                          while (xmlTextReaderRead(v5) == 1)
                          {
                            v25 = xmlTextReaderDepth(v5);
                            v26 = xmlTextReaderNodeType(v5);
                            if (v25 == v20 && v26 == 15)
                              break;
                            if (v65 + 3 == v25 && v26 == 1)
                            {
                              v27 = xmlTextReaderConstLocalName(v5);
                              if (xmlStrEqual(v27, (const xmlChar *)"o"))
                              {
                                if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
                                {
                                  v28 = 0;
                                  v29 = 0;
                                  v30 = -1;
                                  v31 = -1;
                                  v32 = -1;
                                  do
                                  {
                                    if (v32 != -1 && v29 && v31 != -1 && v30 != -1 && v28)
                                      break;
                                    v33 = xmlTextReaderConstLocalName(v5);
                                    v34 = v33;
                                    if (v32 == -1 && xmlStrEqual(v33, (const xmlChar *)"rk"))
                                    {
                                      v67 = 0;
                                      v35 = (const char *)xmlTextReaderConstValue(v5);
                                      v32 = sscanf(v35, "%ld", &v67) ? v67 : -1;
                                    }
                                    else if (v29 || !xmlStrEqual(v34, (const xmlChar *)"ri"))
                                    {
                                      if (v31 == -1 && xmlStrEqual(v34, (const xmlChar *)"oi"))
                                      {
                                        v67 = 0;
                                        v36 = (const char *)xmlTextReaderConstValue(v5);
                                        v31 = sscanf(v36, "%ld", &v67) ? v67 : -1;
                                      }
                                      else if (v30 == -1 && xmlStrEqual(v34, (const xmlChar *)"pn"))
                                      {
                                        v67 = 0;
                                        v37 = (const char *)xmlTextReaderConstValue(v5);
                                        v30 = sscanf(v37, "%ld", &v67) ? v67 : -1;
                                      }
                                      else if (!v28)
                                      {
                                        if (xmlStrEqual(v34, (const xmlChar *)"dpn"))
                                          v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", xmlTextReaderConstValue(v5));
                                        else
                                          v28 = 0;
                                      }
                                    }
                                    else
                                    {
                                      v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", xmlTextReaderConstValue(v5), 1);
                                    }
                                  }
                                  while (xmlTextReaderMoveToNextAttribute(v5) == 1);
                                  if (v59 && v32 >= 1 && v29 && v31 >= 1)
                                  {
                                    if (v28)
                                    {
                                      v38 = objc_msgSend(v61, "member:", v28);
                                      if (!v38)
                                      {
                                        objc_msgSend(v61, "addObject:", v28);
                                        v38 = v28;
                                      }
                                    }
                                    else
                                    {
                                      v38 = 0;
                                    }
                                    v39 = objc_msgSend(v58, "member:", v29);
                                    if (!v39)
                                    {
                                      objc_msgSend(v58, "addObject:", v29);
                                      v39 = v29;
                                    }
                                    objc_msgSend(v59, "addOccurrence:rank:paragraphIndex:pageNumber:displayPageNumber:", v39, v32, v31, v30, v38);
                                  }
                                  v3 = v56;
                                }
                                else
                                {
                                  v28 = 0;
                                  v29 = 0;
                                }

                              }
                            }
                            if (objc_msgSend(v3, "isCancelled"))
                            {
                              v55 = 1;
                              break;
                            }
                          }
                        }
                      }
                      else
                      {
                        v24 = 0;
                      }

                    }
                  }
                }
                while (xmlTextReaderRead(v5) == 1);

                if ((v55 & 1) != 0)
                {
                  v11 = 1;
                  goto LABEL_108;
                }
                continue;
              }
            }
          }
          else
          {
            v18 = 0;
          }

        }
      }
    }
    while (!objc_msgSend(v3, "isCancelled"));
    v11 = 0;
LABEL_108:

    v6 = 1;
  }
  while ((objc_msgSend(v3, "isCancelled") & 1) == 0 && !v11);
  LOBYTE(v4) = 0;
  if ((v6 & 1) != 0 && (v64 & 1) != 0 && (v64 & 0x100000000) != 0)
    LOBYTE(v4) = objc_msgSend(v3, "isCancelled") ^ 1;
  return (char)v4;
}

@end
