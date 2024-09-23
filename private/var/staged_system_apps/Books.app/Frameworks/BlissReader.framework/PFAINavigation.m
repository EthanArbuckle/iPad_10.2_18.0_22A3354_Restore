@implementation PFAINavigation

+ (void)initialize
{
  uint64_t v2;

  if ((id)objc_opt_class(PFAINavigation, a2) == a1)
    objc_opt_class(PFXConstants, v2);
}

+ (int)listNumberTypeForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("upper-roman")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lower-roman")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lower-alpha")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("upper-alpha")) & 1) != 0)
    return 9;
  objc_msgSend(a3, "isEqualToString:", CFSTR("decimal"));
  return 0;
}

+ (BOOL)updateDocumentWithState:(id)a3
{
  return objc_msgSend(a1, "loadDocumentStructureWithState:isUpdate:", a3, 1);
}

+ (BOOL)readDocumentWithState:(id)a3
{
  id v5;
  THModelContainerNode *v6;

  v5 = objc_msgSend(a3, "thDocumentRoot");
  if (!objc_msgSend(v5, "rootNode"))
  {
    v6 = -[THModelContainerNode initWithTitle:includeInTOC:context:]([THModelContainerNode alloc], "initWithTitle:includeInTOC:context:", 0, 0, objc_msgSend(v5, "context"));
    objc_msgSend(v5, "setRootNode:", v6);

  }
  return objc_msgSend(a1, "loadDocumentStructureWithState:isUpdate:", a3, 0);
}

+ (void)cacheAndTrimNode:(id)a3 inState:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = objc_opt_class(THModelContentNode);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
  {
    objc_msgSend(a4, "addContentNodeToCache:", a3);
  }
  else
  {
    v8 = objc_opt_class(THModelContainerNode);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = objc_msgSend(a3, "childNodes", 0);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(a1, "cacheAndTrimNode:inState:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), a4);
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }
    }
  }
  v14 = objc_msgSend(a3, "parent");
  if (v14)
    objc_msgSend(v14, "removeNode:", a3);
}

+ (BOOL)readHeadFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  const xmlChar *v11;
  const xmlChar *v12;
  const xmlChar *v13;
  xmlChar *Attribute;
  xmlChar *v15;
  NSString *v16;
  int i;
  const xmlChar *v18;
  NSString *v19;
  id v20;
  const __CFData *v21;
  const __CFData *v22;
  CFPropertyListRef v23;
  CFTypeID v24;
  CFPropertyListRef v25;
  objc_class *v26;
  NSDictionary *v27;
  id v29;
  CFErrorRef error;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;

  v6 = objc_msgSend(a4, "packageState");
  v7 = xmlTextReaderDepth(a3);
  v8 = xmlTextReaderRead(a3);
  if (v8 == 1)
  {
    while (1)
    {
      v9 = xmlTextReaderDepth(a3);
      v10 = xmlTextReaderNodeType(a3);
      if (v9 == v7 && v10 == 15)
        break;
      if (v7 + 1 == v9 && v10 == 1)
      {
        v11 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        v12 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v11, v12))
        {
          v13 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"meta", v13))
          {
            Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"name");
            if (Attribute)
            {
              v15 = Attribute;
              v16 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", Attribute);
              xmlFree(v15);
              if (v16)
              {
                for (i = xmlTextReaderMoveToFirstAttribute(a3); ; i = xmlTextReaderMoveToNextAttribute(a3))
                {
                  if (i != 1)
                  {
                    v19 = 0;
                    goto LABEL_16;
                  }
                  v18 = xmlTextReaderConstLocalName(a3);
                  if (xmlStrEqual(v18, (const xmlChar *)"content"))
                    break;
                }
                v19 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3));
LABEL_16:
                if (objc_msgSend(PFXCommonNcxAdditionsId, "isEqualToString:", v16))
                {
                  v20 = objc_msgSend(a4, "absoluteEntryForRelativeUri:", v19);
                  v31 = 0;
                  v21 = (const __CFData *)objc_msgSend(objc_msgSend(v6, "archive"), "createDataWithName:error:", v20, &v31);
                  if (v21)
                  {
                    v22 = v21;
                    v29 = v6;
                    error = 0;
                    v23 = CFPropertyListCreateWithData(kCFAllocatorDefault, v21, 0, 0, &error);

                    if (v23)
                    {
                      v24 = CFGetTypeID(v23);
                      if (v24 == CFDictionaryGetTypeID())
                        v25 = v23;
                      else
                        v25 = 0;
                      objc_msgSend(a4, "setNcxAdditions:", v25);
                      CFRelease(v23);
                    }
                    else
                    {
                      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("File is invalid."));
                    }
                    v6 = v29;
                  }
                  else
                  {
                    if (v31)
                    {
                      v26 = (objc_class *)objc_opt_class(NSError);
                      v32 = NSStringFromClass(v26);
                      v33 = v31;
                      v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
                    }
                    else
                    {
                      v27 = 0;
                    }
                    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, 0, v27), "raise");
                  }
                }
                objc_msgSend(a4, "setMetadataContents:forName:", v19, v16);
              }
            }
          }
        }
      }
      v8 = xmlTextReaderRead(a3);
      if (v8 != 1)
        return v8 >= 0;
    }
    v8 = 1;
  }
  return v8 >= 0;
}

+ (id)getTextFromFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  NSMutableString *v5;
  int v6;
  int v7;
  int v8;

  v5 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0, a4);
  v6 = xmlTextReaderDepth(a3);
  if (!xmlTextReaderIsEmptyElement(a3) && xmlTextReaderRead(a3) == 1)
  {
    do
    {
      v7 = xmlTextReaderDepth(a3);
      v8 = xmlTextReaderNodeType(a3);
      if (v7 == v6 && v8 == 15)
        break;
      if (v6 + 1 == v7 && v8 == 3)
        -[NSMutableString appendString:](v5, "appendString:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3)));
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  return v5;
}

+ (id)getUrlFromContentFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  const xmlChar *v6;
  NSString *v8;

  if (xmlTextReaderMoveToFirstAttribute(a3) != 1)
    return 0;
  while (1)
  {
    v6 = xmlTextReaderConstLocalName(a3);
    if (xmlStrEqual(v6, (const xmlChar *)"src"))
      break;
    if (xmlTextReaderMoveToNextAttribute(a3) != 1)
      return 0;
  }
  v8 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3));
  return objc_msgSend(a4, "absoluteUrlForRelativeUri:", v8);
}

+ (id)getTextFromNavLabelFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  int v7;
  int v8;
  int v9;
  const xmlChar *v10;
  const xmlChar *v11;
  const xmlChar *v12;

  v7 = xmlTextReaderDepth(a3);
  while (xmlTextReaderRead(a3) == 1)
  {
    v8 = xmlTextReaderDepth(a3);
    v9 = xmlTextReaderNodeType(a3);
    if (v8 == v7 && v9 == 15)
      break;
    if (v7 + 1 == v8 && v9 == 1)
    {
      v10 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v11 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v10, v11))
      {
        v12 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"text", v12))
          return objc_msgSend(a1, "getTextFromFromStream:readerState:", a3, a4);
      }
    }
  }
  return 0;
}

+ (id)imageFromEntry:(id)a3 packageState:(id)a4
{
  return +[TSPData dataFromDocumentURI:context:](TSPData, "dataFromDocumentURI:context:", objc_msgSend(a3, "stringByRemovingPercentEncoding"), objc_msgSend(objc_msgSend(a4, "thDocumentRoot"), "context"));
}

+ (id)createContentNodeWithId:(id)a3 label:(id)a4 entry:(id)a5 readerState:(id)a6
{
  id v11;
  id v12;
  id v13;
  THModelContentNode *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  void *v36;
  double v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *j;
  id v54;
  id v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v11 = objc_msgSend(a6, "packageState");
  v12 = objc_msgSend(v11, "thDocumentRoot");
  v13 = objc_msgSend(v12, "context");
  v14 = -[THModelContentNode initWithTitle:includeInTOC:context:]([THModelContentNode alloc], "initWithTitle:includeInTOC:context:", a4, 1, v13);
  -[THModelNode setNodeGUID:](v14, "setNodeGUID:", a3);
  -[THModelContentNode setApplePubEntryID:](v14, "setApplePubEntryID:", a5);
  -[THModelContentNode setApplePubURLWithState:](v14, "setApplePubURLWithState:", v11);
  -[THModelContentNode setCfiBaseWithState:](v14, "setCfiBaseWithState:", v11);
  v15 = objc_msgSend(objc_msgSend(v12, "bookDescription"), "isEpub");
  v16 = objc_msgSend(a6, "additionalPropertiesForNavPointId:", a3);
  if (v16)
  {
    v17 = v16;
    v18 = objc_opt_class(NSNumber);
    *(_QWORD *)&v20 = TSUDynamicCast(v18, objc_msgSend(v17, "objectForKey:", PFXCommonTocIncludeInTOC[0])).n128_u64[0];
    if (v19)
      -[THModelNode setIncludeInTOC:](v14, "setIncludeInTOC:", objc_msgSend(v19, "BOOLValue", v20));
    v21 = objc_opt_class(NSNumber);
    *(_QWORD *)&v23 = TSUDynamicCast(v21, objc_msgSend(v17, "objectForKey:", PFXCommonTocNumberOfPages[0])).n128_u64[0];
    if (v22)
    {
      if ((v15 & 1) == 0)
        -[THModelNode setPageCount:forPresentationType:](v14, "setPageCount:forPresentationType:", objc_msgSend(v22, "unsignedIntegerValue", v23), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", v13));
      -[THModelNode setPageCount:forPresentationType:](v14, "setPageCount:forPresentationType:", 1, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", v13, v23));
    }
    v24 = objc_opt_class(NSNumber);
    *(_QWORD *)&v26 = TSUDynamicCast(v24, objc_msgSend(v17, "objectForKey:", PFXCommonTocDisplayStartPageNumber[0])).n128_u64[0];
    if (v25)
    {
      v27 = objc_msgSend(v25, "unsignedIntegerValue", v26);
      -[THModelContentNode setDisplayStartingPageNumber:presentationType:](v14, "setDisplayStartingPageNumber:presentationType:", v27, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", v13));
      -[THModelContentNode setDisplayStartingPageNumber:presentationType:](v14, "setDisplayStartingPageNumber:presentationType:", v27, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", v13));
    }
    v28 = objc_opt_class(NSString);
    *(_QWORD *)&v30 = TSUDynamicCast(v28, objc_msgSend(v17, "objectForKey:", PFXCommonTocDisplayPageNumberFormat[0])).n128_u64[0];
    if (v29)
    {
      v31 = +[PFAINavigation listNumberTypeForString:](PFAINavigation, "listNumberTypeForString:", v29, v30);
      -[THModelContentNode setDisplayStartingPageFormat:presentationType:](v14, "setDisplayStartingPageFormat:presentationType:", v31, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", v13));
      -[THModelContentNode setDisplayStartingPageFormat:presentationType:](v14, "setDisplayStartingPageFormat:presentationType:", v31, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", v13));
    }
    v32 = objc_opt_class(NSArray);
    *(_QWORD *)&v34 = TSUDynamicCast(v32, objc_msgSend(v17, "objectForKey:", PFXCommonTocGlossaryTermLink[0])).n128_u64[0];
    if (v33)
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a6, "packageState", v34), "thDocumentRoot"), "glossary"), "setGlossaryTermPaths:forContentNode:", v33, v14);
    v35 = objc_opt_class(NSNumber);
    *(_QWORD *)&v37 = TSUDynamicCast(v35, objc_msgSend(v17, "objectForKey:", PFXCommonTocGlossaryTermExists[0])).n128_u64[0];
    if (v36)
      -[THModelContentNode setGlossaryTermExists:](v14, "setGlossaryTermExists:", objc_msgSend(v36, "BOOLValue", v37));
    v38 = objc_msgSend(a6, "currentTocTile", v37);
    v39 = objc_opt_class(NSArray);
    TSUDynamicCast(v39, objc_msgSend(v17, "objectForKey:", CFSTR("tinyThumbs")));
    if (v40)
    {
      v41 = v40;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(_QWORD *)v62 != v44)
              objc_enumerationMutation(v41);
            v46 = objc_msgSend(a1, "imageFromEntry:packageState:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i), objc_msgSend(a6, "packageState"));
            if (v46)
              objc_msgSend(v38, "addTinyThumb:", v46);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v43);
      }
    }
    v47 = objc_opt_class(NSArray);
    TSUDynamicCast(v47, objc_msgSend(v17, "objectForKey:", CFSTR("largerThumbs")));
    if (v48)
    {
      v49 = v48;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v51; j = (char *)j + 1)
          {
            if (*(_QWORD *)v58 != v52)
              objc_enumerationMutation(v49);
            v54 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v54, "hasPrefix:", CFSTR("/")))
              v54 = objc_msgSend(v54, "substringFromIndex:", 1);
            v55 = objc_msgSend(a1, "imageFromEntry:packageState:", v54, objc_msgSend(a6, "packageState"));
            if (v55)
              objc_msgSend(v38, "addLargerThumb:", v55);
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v51);
      }
    }
  }
  return v14;
}

+ (BOOL)readGlossaryNavPointFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  int v7;
  uint64_t v8;
  id v9;
  int v10;
  int v11;
  const xmlChar *v12;
  const xmlChar *v13;
  const xmlChar *v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  BOOL v19;
  const xmlChar *v20;
  const xmlChar *v21;
  const xmlChar *v22;
  id v24;

  v7 = xmlTextReaderDepth(a3);
  v8 = v7 + 1;
  if (xmlTextReaderRead(a3) == 1)
  {
    v9 = 0;
    do
    {
      v10 = xmlTextReaderDepth(a3);
      v11 = xmlTextReaderNodeType(a3);
      if (v10 == v7 && v11 == 15)
        break;
      if (v8 == v10 && v11 == 1)
      {
        v12 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        v13 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v12, v13))
        {
          v14 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"navLabel", v14))
          {
            v9 = objc_msgSend(a1, "getTextFromNavLabelFromStream:readerState:", a3, a4);
          }
          else if (xmlStrEqual((const xmlChar *)"content", v14))
          {
            v24 = objc_msgSend(a1, "getUrlFromContentFromStream:readerState:", a3, a4);
            if (v9 && v24)
              objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "packageState"), "thDocumentRoot"), "glossary"), "addEntryForPath:andTerm:", objc_msgSend(v24, "path"), v9), "setLoadedFromApplePub:", 1);
            break;
          }
        }
      }
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  v15 = xmlTextReaderRead(a3);
  if (v15 != 1)
    return v15 >= 0;
  while (1)
  {
    v16 = xmlTextReaderDepth(a3);
    v17 = xmlTextReaderNodeType(a3);
    v18 = v16 == v7 && v17 == 15;
    v19 = v18;
    if (v18)
      break;
    if (v8 == v16 && v17 == 1)
    {
      v20 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v21 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v20, v21))
      {
        v22 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"navPoint", v22))
        {
          if (!objc_msgSend(a1, "readGlossaryNavPointFromStream:readerState:", a3, a4))
            break;
        }
      }
    }
    v15 = xmlTextReaderRead(a3);
    if (v15 != 1)
      return v15 >= 0;
  }
  return v19;
}

+ (BOOL)readNavPointFromStream:(_xmlTextReader *)a3 landscapeEntries:(id)a4 portraitEntries:(id)a5 depth:(int64_t)a6 readerState:(id)a7
{
  int v11;
  const xmlChar *v12;
  uint64_t v13;
  id v14;
  int v15;
  int v16;
  const xmlChar *v17;
  const xmlChar *v18;
  const xmlChar *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  void *v38;
  double v39;
  id v40;
  id v41;
  unsigned int v42;
  THTOCTileModelEntry *v43;
  void *v44;
  THTOCTileModelEntry *v45;
  int v46;
  int v47;
  int v48;
  BOOL v49;
  BOOL v50;
  const xmlChar *v51;
  const xmlChar *v52;
  const xmlChar *v53;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unsigned int v60;
  NSString *v61;

  v11 = xmlTextReaderDepth(a3);
  if (xmlTextReaderMoveToFirstAttribute(a3) == 1)
  {
    while (1)
    {
      v12 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v12, (const xmlChar *)"id"))
        break;
      if (xmlTextReaderMoveToNextAttribute(a3) != 1)
        goto LABEL_4;
    }
    v61 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3));
  }
  else
  {
LABEL_4:
    v61 = 0;
  }
  v13 = v11 + 1;
  if (xmlTextReaderRead(a3) == 1)
  {
    v14 = 0;
    do
    {
      v15 = xmlTextReaderDepth(a3);
      v16 = xmlTextReaderNodeType(a3);
      if (v15 == v11 && v16 == 15)
        break;
      if (v13 == v15 && v16 == 1)
      {
        v17 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        v18 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v17, v18))
        {
          v19 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"navLabel", v19))
          {
            v14 = objc_msgSend(a1, "getTextFromNavLabelFromStream:readerState:", a3, a7);
          }
          else if (xmlStrEqual((const xmlChar *)"content", v19))
          {
            v20 = objc_msgSend(a1, "getUrlFromContentFromStream:readerState:", a3, a7);
            goto LABEL_20;
          }
        }
      }
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  else
  {
    v14 = 0;
  }
  v20 = 0;
LABEL_20:
  v55 = a4;
  v56 = a1;
  v59 = v20;
  v21 = objc_msgSend(v20, "path");
  v22 = objc_msgSend(a7, "additionalPropertiesForNavPointId:", v61);
  if (v22)
  {
    v23 = v22;
    v24 = objc_opt_class(NSString);
    TSUDynamicCast(v24, objc_msgSend(v23, "objectForKey:", PFXCommonTocSectionIdentifier[0]));
    v58 = v25;
    v26 = objc_opt_class(NSNumber);
    *(_QWORD *)&v28 = TSUDynamicCast(v26, objc_msgSend(v23, "objectForKey:", PFXCommonTocIncludeInTOC[0])).n128_u64[0];
    if (v27)
      v60 = objc_msgSend(v27, "BOOLValue", v28);
    else
      v60 = 1;
    v31 = objc_opt_class(NSNumber);
    *(_QWORD *)&v33 = TSUDynamicCast(v31, objc_msgSend(v23, "objectForKey:", PFXCommonTocDisplayStartPageNumber[0])).n128_u64[0];
    if (v32)
      v57 = (uint64_t)objc_msgSend(v32, "integerValue", v33);
    else
      v57 = 0x7FFFFFFFFFFFFFFFLL;
    v34 = objc_opt_class(NSString);
    *(_QWORD *)&v36 = TSUDynamicCast(v34, objc_msgSend(v23, "objectForKey:", PFXCommonTocDisplayPageNumberFormat[0])).n128_u64[0];
    if (v35)
      v29 = +[PFAINavigation listNumberTypeForString:](PFAINavigation, "listNumberTypeForString:", v35, v36);
    else
      v29 = 0;
    v37 = objc_opt_class(NSNumber);
    *(_QWORD *)&v39 = TSUDynamicCast(v37, objc_msgSend(v23, "objectForKey:", PFXCommonTocNumberOfPages[0])).n128_u64[0];
    if (v38)
      v30 = (uint64_t)objc_msgSend(v38, "unsignedIntegerValue", v39);
    else
      v30 = 1;
  }
  else
  {
    v29 = 0;
    v30 = 1;
    v57 = 0x7FFFFFFFFFFFFFFFLL;
    v58 = 0;
    v60 = 1;
  }
  v40 = objc_msgSend(a7, "contentNodeForEntry:", v21);
  if (v40)
  {
    v41 = v40;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v41 = objc_msgSend(v56, "createContentNodeWithId:label:entry:readerState:", v61, v14, v21, a7);
    objc_msgSend(objc_msgSend(a7, "currentContainerNode"), "addNode:", v41);
    objc_msgSend(a7, "setContentNode:forEntry:", v41, v21);
    v42 = v60;
    if (!v41)
      v42 = 0;
    if (v42 == 1)
    {
      v43 = objc_alloc_init(THTOCTileModelEntry);
      -[THTOCTileModelEntry setNodeGUID:](v43, "setNodeGUID:", objc_msgSend(v41, "nodeGUID"));
      -[THTOCTileModelEntry setIndentLevel:](v43, "setIndentLevel:", a6);
      -[THTOCTileModelEntry setTitle:](v43, "setTitle:", v14);
      -[THTOCTileModelEntry setModelLink:](v43, "setModelLink:", objc_msgSend(v41, "modelLinkWithFragment:", objc_msgSend(v59, "fragment")));
      -[THTOCTileModelEntry setSectionIdentifier:](v43, "setSectionIdentifier:", v58);
      -[THTOCTileModelEntry setPageCount:](v43, "setPageCount:", v30);
      -[THTOCTileModelEntry setDisplayPageNumberFormat:](v43, "setDisplayPageNumberFormat:", v29);
      -[THTOCTileModelEntry setDisplayPageNumberValue:](v43, "setDisplayPageNumberValue:", v57);
      -[THTOCTileModelEntry setIncludeInTOC:](v43, "setIncludeInTOC:", 1);
      objc_msgSend(v55, "addObject:", v43);

    }
    else
    {
      v55 = 0;
      v44 = 0;
      if (!v41)
        goto LABEL_42;
    }
  }
  v45 = objc_alloc_init(THTOCTileModelEntry);
  -[THTOCTileModelEntry setNodeGUID:](v45, "setNodeGUID:", objc_msgSend(v41, "nodeGUID"));
  -[THTOCTileModelEntry setIndentLevel:](v45, "setIndentLevel:", a6);
  -[THTOCTileModelEntry setTitle:](v45, "setTitle:", v14);
  -[THTOCTileModelEntry setModelLink:](v45, "setModelLink:", objc_msgSend(v41, "modelLinkWithFragment:", objc_msgSend(v59, "fragment")));
  -[THTOCTileModelEntry setSectionIdentifier:](v45, "setSectionIdentifier:", v58);
  -[THTOCTileModelEntry setPageCount:](v45, "setPageCount:", v30);
  -[THTOCTileModelEntry setDisplayPageNumberFormat:](v45, "setDisplayPageNumberFormat:", v29);
  -[THTOCTileModelEntry setDisplayPageNumberValue:](v45, "setDisplayPageNumberValue:", v57);
  -[THTOCTileModelEntry setIncludeInTOC:](v45, "setIncludeInTOC:", v60);
  objc_msgSend(a5, "addObject:", v45);

  v44 = v41;
LABEL_42:

  v46 = xmlTextReaderRead(a3);
  if (v46 != 1)
    return v46 >= 0;
  while (1)
  {
    v47 = xmlTextReaderDepth(a3);
    v48 = xmlTextReaderNodeType(a3);
    v49 = v47 == v11 && v48 == 15;
    v50 = v49;
    if (v49)
      break;
    if (v13 == v47 && v48 == 1)
    {
      v51 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v52 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v51, v52))
      {
        v53 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"navPoint", v53))
        {
          if (!objc_msgSend(v56, "readNavPointFromStream:landscapeEntries:portraitEntries:depth:readerState:", a3, v55, a5, a6 + 1, a7))break;
        }
      }
    }
    v46 = xmlTextReaderRead(a3);
    if (v46 != 1)
      return v46 >= 0;
  }
  return v50;
}

+ (BOOL)readNavMapFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  int v9;
  THModelContainerNode *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  const xmlChar *v15;
  const xmlChar *v16;
  const xmlChar *v17;
  int i;
  const xmlChar *v19;
  NSString *v20;
  const __CFString *v21;
  int v22;
  int v23;
  const xmlChar *v24;
  const xmlChar *v25;
  const xmlChar *v26;
  id v27;
  id v28;
  int v29;
  int v30;
  const xmlChar *v31;
  const xmlChar *v32;
  const xmlChar *v33;
  id v34;
  uint64_t v35;
  void *v36;
  double v37;
  unsigned int v38;
  THModelContainerNode *v39;
  unsigned int v40;
  void *v41;
  THTOCTileModel *v42;
  THTOCTileModel *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  THModelContentNode *v49;
  THTOCTileModelEntry *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  double v56;
  uint64_t v57;
  void *v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  id v70;
  int v71;
  int v72;
  const xmlChar *v73;
  const xmlChar *v74;
  const xmlChar *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *j;
  void *v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  void *k;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  id v92;
  void *v93;
  double v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  double v98;
  id v99;
  unsigned int v102;
  void *v103;
  NSString *v104;
  id v105;
  id v106;
  id v107;
  THTOCTileModel *v108;
  THModelContainerNode *v109;
  void *v110;
  void *v111;
  id v112;
  THModelContainerNode *v113;
  id v114;
  void *v115;
  uint64_t v117;
  int v118;
  int v119;
  void *v120;
  id obj;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];

  v4 = a4;
  v6 = objc_msgSend(a4, "packageState");
  v7 = objc_msgSend(v6, "thDocumentRoot");
  v8 = objc_msgSend(v7, "context");
  v112 = objc_msgSend(v7, "tocModel");
  v115 = v6;
  v114 = objc_msgSend(v6, "glossaryEntryUri");
  v9 = xmlTextReaderDepth(a3);
  v10 = -[THModelContainerNode initWithTitle:includeInTOC:context:]([THModelContainerNode alloc], "initWithTitle:includeInTOC:context:", objc_msgSend(v4, "title"), 0, v8);
  -[THModelNode setNodeGUID:](v10, "setNodeGUID:", +[NSString stringWithUUID](NSString, "stringWithUUID"));
  v110 = v7;
  v113 = v10;
  objc_msgSend(v7, "setRootNode:", v10);
  obj = objc_alloc_init((Class)NSMutableArray);
  v11 = xmlTextReaderRead(a3);
  if (v11 == 1)
  {
    v106 = v8;
    v117 = v9 + 1;
    v119 = v9;
    v12 = v9 + 2;
    while (1)
    {
      v13 = xmlTextReaderDepth(a3);
      v14 = xmlTextReaderNodeType(a3);
      if (v13 == v119 && v14 == 15)
        break;
      if (v117 == v13 && v14 == 1)
      {
        v15 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        v16 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v15, v16))
        {
          v17 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual(v17, (const xmlChar *)"navPoint"))
          {
            for (i = xmlTextReaderMoveToFirstAttribute(a3); ; i = xmlTextReaderMoveToNextAttribute(a3))
            {
              if (i != 1)
              {
                v20 = 0;
                goto LABEL_15;
              }
              v19 = xmlTextReaderConstLocalName(a3);
              if (xmlStrEqual(v19, (const xmlChar *)"id"))
                break;
            }
            v20 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3));
LABEL_15:
            if (xmlTextReaderRead(a3) == 1)
            {
              v21 = &stru_43D7D8;
              while (1)
              {
                v22 = xmlTextReaderDepth(a3);
                v23 = xmlTextReaderNodeType(a3);
                if (v22 == v13 && v23 == 15)
                {
LABEL_26:
                  v27 = 0;
                  goto LABEL_28;
                }
                if (v12 == v22 && v23 == 1)
                {
                  v24 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  v25 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v24, v25))
                  {
                    v26 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navLabel", v26))
                    {
                      v21 = (const __CFString *)objc_msgSend(a1, "getTextFromNavLabelFromStream:readerState:", a3, v4);
                    }
                    else if (xmlStrEqual((const xmlChar *)"content", v26))
                    {
                      v27 = objc_msgSend(a1, "getUrlFromContentFromStream:readerState:", a3, v4);
                      goto LABEL_28;
                    }
                  }
                }
                if (xmlTextReaderRead(a3) != 1)
                  goto LABEL_26;
              }
            }
            v27 = 0;
            v21 = &stru_43D7D8;
LABEL_28:
            v28 = objc_msgSend(v27, "path");
            if (objc_msgSend(v28, "isEqualToString:", v114))
            {
              objc_msgSend(objc_msgSend(v110, "glossary"), "setApplePubURLWithState:", v115);
              while (xmlTextReaderRead(a3) == 1)
              {
                v29 = xmlTextReaderDepth(a3);
                v30 = xmlTextReaderNodeType(a3);
                if (v29 == v13 && v30 == 15)
                  break;
                if (v12 == v29 && v30 == 1)
                {
                  v31 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  v32 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v31, v32))
                  {
                    v33 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navPoint", v33))
                      objc_msgSend(a1, "readGlossaryNavPointFromStream:readerState:", a3, v4);
                  }
                }
              }
            }
            else if (v27)
            {
              v103 = v27;
              v34 = objc_msgSend(v4, "additionalPropertiesForNavPointId:", v20);
              v35 = objc_opt_class(NSNumber);
              v111 = v34;
              *(_QWORD *)&v37 = TSUDynamicCast(v35, objc_msgSend(v34, "objectForKey:", PFXCommonTocIncludeInTOC[0])).n128_u64[0];
              if (v36)
                v38 = objc_msgSend(v36, "BOOLValue", v37);
              else
                v38 = 1;
              v39 = -[THModelContainerNode initWithTitle:includeInTOC:context:]([THModelContainerNode alloc], "initWithTitle:includeInTOC:context:", v21, 1, v106);
              -[THModelNode setNodeGUID:](v39, "setNodeGUID:", +[NSString stringWithUUID](NSString, "stringWithUUID"));
              -[THModelContainerNode addNode:](v113, "addNode:", v39);
              v109 = v39;
              objc_msgSend(v4, "setCurrentContainerNode:", v39);
              v40 = v38;
              v104 = v20;
              if (v38)
              {
                v102 = v38;
                v105 = objc_alloc_init((Class)NSMutableArray);
                v107 = objc_alloc_init((Class)NSMutableArray);
                v41 = v4;
                v42 = -[THTOCTileModel initWithTOCModel:]([THTOCTileModel alloc], "initWithTOCModel:", v112);
                -[THTOCTileModel setFrontOrdinalText:](v42, "setFrontOrdinalText:", CFSTR(" "));
                -[THTOCTileModel setFrontTitleText:](v42, "setFrontTitleText:", v21);
                v40 = v102;
                -[THTOCTileModel setBackOrdinalText:](v42, "setBackOrdinalText:", CFSTR(" "));
                -[THTOCTileModel setBackTitleText:](v42, "setBackTitleText:", v21);
                v108 = v42;
                v43 = v42;
                v4 = v41;
                objc_msgSend(v41, "setCurrentTocTile:", v43);
              }
              else
              {
                v107 = 0;
                v108 = 0;
                v105 = 0;
              }
              v44 = objc_msgSend(a1, "createContentNodeWithId:label:entry:readerState:", v20, v21, v28, v4);
              -[THModelContainerNode addNode:](v109, "addNode:", v44);
              objc_msgSend(v4, "setContentNode:forEntry:", v44, v28);
              v45 = v107;
              if (v40)
              {
                if ((objc_msgSend(objc_msgSend(objc_msgSend(v115, "thDocumentRoot"), "bookDescription"), "isEpub") & 1) == 0)
                {
                  v46 = objc_msgSend(v103, "absoluteString");
                  v47 = objc_opt_class(NSString);
                  TSUDynamicCast(v47, objc_msgSend(v111, "objectForKey:", PFXCommonTocConfig[0]));
                  if (v48)
                    v46 = v48;
                  v49 = -[THModelContentNode initWithTitle:includeInTOC:context:]([THModelContentNode alloc], "initWithTitle:includeInTOC:context:", v21, 0, objc_msgSend(objc_msgSend(objc_msgSend(v4, "packageState"), "thDocumentRoot"), "context"));
                  -[THModelNode setNodeGUID:](v49, "setNodeGUID:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-browserPage"), v104));
                  -[THModelContentNode setApplePubEntryID:](v49, "setApplePubEntryID:", v46);
                  -[THModelContentNode setApplePubURLWithState:](v49, "setApplePubURLWithState:", v115);
                  -[THModelContentNode setNavigationPageNode:](v49, "setNavigationPageNode:", 1);
                  -[THTOCTileModel setBrowserPageNode:](v108, "setBrowserPageNode:", v49);

                  v45 = v107;
                }
                v50 = objc_alloc_init(THTOCTileModelEntry);
                -[THTOCTileModelEntry setNodeGUID:](v50, "setNodeGUID:", objc_msgSend(v44, "nodeGUID"));
                -[THTOCTileModelEntry setIndentLevel:](v50, "setIndentLevel:", 0);
                -[THTOCTileModelEntry setTitle:](v50, "setTitle:", v21);
                -[THTOCTileModelEntry setModelLink:](v50, "setModelLink:", objc_msgSend(v44, "modelLinkWithFragment:", objc_msgSend(v103, "fragment")));
                v51 = objc_opt_class(NSString);
                *(_QWORD *)&v52 = TSUDynamicCast(v51, objc_msgSend(v111, "objectForKey:", PFXCommonTocSectionIdentifier[0])).n128_u64[0];
                -[THTOCTileModelEntry setSectionIdentifier:](v50, "setSectionIdentifier:", v53, v52);
                -[THTOCTileModelEntry setPageCount:](v50, "setPageCount:", 1);
                -[THTOCTileModelEntry setIncludeInTOC:](v50, "setIncludeInTOC:", 1);
                v54 = objc_opt_class(NSNumber);
                *(_QWORD *)&v56 = TSUDynamicCast(v54, objc_msgSend(v111, "objectForKey:", PFXCommonTocNumberOfPages[0])).n128_u64[0];
                if (v55)
                  -[THTOCTileModelEntry setPageCount:](v50, "setPageCount:", objc_msgSend(v55, "unsignedIntegerValue", v56));
                v57 = objc_opt_class(NSNumber);
                *(_QWORD *)&v59 = TSUDynamicCast(v57, objc_msgSend(v111, "objectForKey:", PFXCommonTocDisplayStartPageNumber[0])).n128_u64[0];
                if (v58)
                  -[THTOCTileModelEntry setDisplayPageNumberValue:](v50, "setDisplayPageNumberValue:", objc_msgSend(v58, "integerValue", v59));
                v60 = objc_opt_class(NSString);
                *(_QWORD *)&v62 = TSUDynamicCast(v60, objc_msgSend(v111, "objectForKey:", PFXCommonTocDisplayPageNumberFormat[0])).n128_u64[0];
                if (v61)
                  -[THTOCTileModelEntry setDisplayPageNumberFormat:](v50, "setDisplayPageNumberFormat:", +[PFAINavigation listNumberTypeForString:](PFAINavigation, "listNumberTypeForString:", v61, v62));
                v63 = objc_opt_class(NSString);
                *(_QWORD *)&v65 = TSUDynamicCast(v63, objc_msgSend(v111, "objectForKey:", PFXCommonTocThumb[0])).n128_u64[0];
                if (v64)
                {
                  v66 = objc_msgSend(a1, "imageFromEntry:packageState:", v64, objc_msgSend(v4, "packageState", v65));
                  if (v66)
                    -[THTOCTileModel setTocThumb:](v108, "setTocThumb:", v66);
                }
                v67 = objc_opt_class(NSString);
                *(_QWORD *)&v69 = TSUDynamicCast(v67, objc_msgSend(v111, "objectForKey:", PFXCommonTocNotesThumb[0])).n128_u64[0];
                if (v68)
                {
                  v70 = objc_msgSend(a1, "imageFromEntry:packageState:", v68, objc_msgSend(v4, "packageState", v69));
                  if (v70)
                    -[THTOCTileModel setNotesThumb:](v108, "setNotesThumb:", v70);
                }
                objc_msgSend(v45, "addObject:", v50, v69);

              }
              while (xmlTextReaderRead(a3) == 1)
              {
                v71 = xmlTextReaderDepth(a3);
                v72 = xmlTextReaderNodeType(a3);
                if (v71 == v13 && v72 == 15)
                  break;
                if (v12 == v71 && v72 == 1)
                {
                  v73 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  v74 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v73, v74))
                  {
                    v75 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navPoint", v75))
                      objc_msgSend(a1, "readNavPointFromStream:landscapeEntries:portraitEntries:depth:readerState:", a3, v105, v45, 1, v4);
                  }
                }
              }
              if (v108)
              {
                -[THTOCTileModel setLandscapeEntries:](v108, "setLandscapeEntries:", v105);
                -[THTOCTileModel setPortraitEntries:](v108, "setPortraitEntries:", v45);

                objc_msgSend(obj, "addObject:", v108);
              }
              objc_msgSend(v4, "clearNodesByEntry");

              objc_msgSend(v4, "setCurrentContainerNode:", 0);
              objc_msgSend(v4, "setCurrentTocTile:", 0);
            }
          }
        }
      }
      v11 = xmlTextReaderRead(a3);
      if (v11 != 1)
        goto LABEL_79;
    }
    v11 = 1;
  }
LABEL_79:
  v118 = v11;
  v120 = v4;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v131, 16);
  if (v76)
  {
    v77 = v76;
    v78 = 0;
    v79 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v77; j = (char *)j + 1)
      {
        if (*(_QWORD *)v127 != v79)
          objc_enumerationMutation(obj);
        v81 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)j);
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v82 = objc_msgSend(v81, "portraitEntries");
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
        if (v83)
        {
          v84 = v83;
          v85 = *(_QWORD *)v123;
          do
          {
            for (k = 0; k != v84; k = (char *)k + 1)
            {
              if (*(_QWORD *)v123 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)k);
              if (objc_msgSend(v87, "pageCount") == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v87, "setPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
              }
              else
              {
                objc_msgSend(v87, "setPageIndex:", v78);
                v78 += (uint64_t)objc_msgSend(v87, "pageCount");
              }
            }
            v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
          }
          while (v84);
        }
      }
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v131, 16);
    }
    while (v77);
  }
  objc_msgSend(v112, "setBookTitle:", objc_msgSend(v120, "title"));
  objc_msgSend(v112, "setBookSubtitle:", objc_msgSend(v120, "subtitle"));
  objc_msgSend(v112, "setTiles:", obj);
  v88 = objc_opt_class(NSString);
  *(_QWORD *)&v90 = TSUDynamicCast(v88, objc_msgSend(objc_msgSend(v120, "ncxAdditions"), "objectForKey:", CFSTR("tocHeaderImage"))).n128_u64[0];
  if (v89)
    objc_msgSend(v112, "setTocHeaderImageData:", objc_msgSend(a1, "imageFromEntry:packageState:", v89, v115, v90));
  v91 = objc_opt_class(NSNumber);
  v92 = objc_msgSend(v120, "ncxAdditions");
  *(_QWORD *)&v94 = TSUDynamicCast(v91, objc_msgSend(v92, "objectForKey:", PFXCommonTocShowPageNumbers[0])).n128_u64[0];
  if (v93)
    objc_msgSend(v112, "setShowPageNumbers:", objc_msgSend(v93, "BOOLValue", v94));
  v95 = objc_opt_class(NSDictionary);
  v96 = objc_msgSend(v120, "ncxAdditions");
  *(_QWORD *)&v98 = TSUDynamicCast(v95, objc_msgSend(v96, "objectForKey:", PFXCommonTocFigureReference[0])).n128_u64[0];
  if (v97)
    objc_msgSend(v112, "setFigureReference:", v97, v98);
  v99 = objc_msgSend(obj, "count", v98);

  return v118 >= 0 && v99 != 0;
}

+ (BOOL)readNavigationFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  int v7;
  int v8;
  const xmlChar *v9;
  const xmlChar *v10;
  const xmlChar *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  BOOL v17;
  const xmlChar *v18;
  const xmlChar *v19;
  const xmlChar *v20;
  id v21;

  while (xmlTextReaderRead(a3) == 1)
  {
    v7 = xmlTextReaderDepth(a3);
    v8 = xmlTextReaderNodeType(a3);
    if (!v7 && v8 == 1)
    {
      v9 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual((const xmlChar *)"ncx", v9))
      {
        v10 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        v11 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v10, v11))
          break;
      }
    }
  }
  v12 = xmlTextReaderDepth(a3);
  v13 = xmlTextReaderRead(a3);
  if (v13 != 1)
    return v13 >= 0;
  while (1)
  {
    v14 = xmlTextReaderDepth(a3);
    v15 = xmlTextReaderNodeType(a3);
    v16 = v14 == v12 && v15 == 15;
    v17 = v16;
    if (v16)
      break;
    if (v12 + 1 == v14 && v15 == 1)
    {
      v18 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v19 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v18, v19))
      {
        v20 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"head", v20))
        {
          if ((objc_msgSend(a1, "readHeadFromStream:readerState:", a3, a4) & 1) == 0)
            return v17;
        }
        else if (xmlStrEqual((const xmlChar *)"docTitle", v20))
        {
          v21 = objc_msgSend(a1, "getTextFromNavLabelFromStream:readerState:", a3, a4);
          if (v21)
            objc_msgSend(a4, "setTitle:", v21);
        }
        else if (xmlStrEqual((const xmlChar *)"navMap", v20)
               && !objc_msgSend(a1, "readNavMapFromStream:readerState:", a3, a4))
        {
          return v17;
        }
      }
    }
    v13 = xmlTextReaderRead(a3);
    if (v13 != 1)
      return v13 >= 0;
  }
  return v17;
}

+ (BOOL)loadDocumentStructureWithState:(id)a3 isUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  id v10;
  PFAINavigationState *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unsigned __int8 v15;

  v4 = a4;
  v7 = objc_msgSend(a3, "thDocumentRoot");
  v8 = objc_msgSend(a3, "ncxEntryUri");
  v9 = objc_msgSend(a3, "archive");
  v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = -[PFAINavigationState initWithEntry:inArchive:]([PFAINavigationState alloc], "initWithEntry:inArchive:", v8, v9);
  -[PFAINavigationState setPackageState:](v11, "setPackageState:", a3);
  v12 = objc_opt_class(NSString);
  *(_QWORD *)&v13 = TSUDynamicCast(v12, objc_msgSend(objc_msgSend(a3, "metadata"), "objectForKey:", CFSTR("dc:title"))).n128_u64[0];
  -[PFAINavigationState setTitle:](v11, "setTitle:", v14, v13);
  if (-[PFXXmlStreamReaderState streamAPI](v11, "streamAPI"))
  {
    if (v4)
      objc_msgSend(a1, "cacheAndTrimNode:inState:", objc_msgSend(v7, "rootNode"), v11);
    v15 = objc_msgSend(a1, "readNavigationFromStream:readerState:", -[PFXXmlStreamReaderState streamAPI](v11, "streamAPI"), v11);
  }
  else
  {
    v15 = 0;
  }
  if (v11)

  return v15;
}

@end
