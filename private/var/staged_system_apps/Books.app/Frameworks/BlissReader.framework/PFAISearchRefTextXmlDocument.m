@implementation PFAISearchRefTextXmlDocument

+ (char)getString:(id)a3
{
  if (a3)
    return (char *)objc_msgSend(a3, "cStringUsingEncoding:", 1);
  else
    return 0;
}

+ (BOOL)readWithState:(id)a3
{
  xmlTextReader *v5;
  xmlTextReader *v6;
  int v7;
  const xmlChar *v8;
  const xmlChar *v9;
  int v10;
  int v11;
  int v12;
  const xmlChar *v13;
  uint64_t v14;
  double v15;
  const xmlChar *v16;
  const xmlChar *v17;
  const char *v18;
  const char *v19;
  const xmlChar *v20;
  int v21;
  int v22;
  int v23;
  const xmlChar *v24;
  const xmlChar *v25;
  const xmlChar *v26;
  _BOOL4 v27;
  id v28;
  int v29;
  int v30;
  int v31;
  NSString *v32;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int IsEmptyElement;
  int v39;
  uint64_t v40;
  id v41;
  double v42;

  v5 = (xmlTextReader *)objc_msgSend(a3, "streamAPI");
  if (!v5)
    return (char)v5;
  v6 = v5;
  v7 = xmlTextReaderDepth(v5);
  v41 = a3;
  v35 = objc_msgSend(a3, "currentRID");
  v8 = (const xmlChar *)objc_msgSend(a1, "getString:");
  if (!v8)
    goto LABEL_67;
  v9 = v8;
  v36 = v7 + 1;
  v40 = v7 + 2;
  v37 = v7 + 3;
  while (1)
  {
    v10 = xmlTextReaderRead(v6);
    if (v10 != 1)
      break;
    v11 = xmlTextReaderDepth(v6);
    v12 = xmlTextReaderNodeType(v6);
    if (!v11 && v12 == 1)
    {
      v13 = xmlTextReaderConstLocalName(v6);
      if (!xmlStrEqual(v13, (const xmlChar *)"reftext"))
        goto LABEL_63;
      LODWORD(v14) = xmlTextReaderMoveToFirstAttribute(v6);
      v15 = 0.0;
      do
      {
        v16 = xmlTextReaderConstLocalName(v6);
        v17 = v16;
        if (v15 == 0.0 && xmlStrEqual(v16, (const xmlChar *)"currentVersion"))
        {
          v42 = 0.0;
          v18 = (const char *)xmlTextReaderConstValue(v6);
          if (sscanf(v18, "%lf", &v42))
            v15 = v42;
          else
            v15 = 0.0;
        }
        else if (xmlStrEqual(v17, (const xmlChar *)"requiredVersion"))
        {
          v42 = 0.0;
          v19 = (const char *)xmlTextReaderConstValue(v6);
          if (sscanf(v19, "%lf", &v42))
            v15 = v42;
        }
      }
      while (xmlTextReaderMoveToNextAttribute(v6) == 1);
      v14 = (int)v14;
      if (v15 < 0.0)
        objc_msgSend(objc_msgSend(v41, "loadDelegate"), "cancel");
      goto LABEL_64;
    }
    if (v36 != v11)
      goto LABEL_63;
    if (v12 != 1)
      goto LABEL_63;
    v20 = xmlTextReaderConstLocalName(v6);
    if (!xmlStrEqual(v20, (const xmlChar *)"rs"))
      goto LABEL_63;
    while (1)
    {
      v21 = xmlTextReaderRead(v6);
      if (v21 != 1)
      {
        v14 = v21;
        goto LABEL_64;
      }
      v22 = xmlTextReaderDepth(v6);
      v23 = xmlTextReaderNodeType(v6);
      if (v22 == v11 && v23 == 15)
        goto LABEL_63;
      if (v40 != v22 || v23 != 1 || (v24 = xmlTextReaderConstLocalName(v6), !xmlStrEqual(v24, (const xmlChar *)"r")))
      {
        v14 = 1;
        goto LABEL_42;
      }
      IsEmptyElement = xmlTextReaderIsEmptyElement(v6);
      LODWORD(v14) = xmlTextReaderMoveToFirstAttribute(v6);
      do
      {
        v25 = xmlTextReaderConstLocalName(v6);
        if (xmlStrEqual(v25, (const xmlChar *)"ri"))
          v26 = xmlTextReaderConstValue(v6);
        else
          v26 = 0;
      }
      while (xmlTextReaderMoveToNextAttribute(v6) == 1 && !v26);
      v14 = (int)v14;
      if (!v26 || !xmlStrEqual(v9, v26))
        goto LABEL_42;
      if (!IsEmptyElement)
        break;
      v27 = 0;
      v28 = objc_msgSend(v41, "addRefText:forRID:", &stru_43D7D8, v35);
LABEL_39:
      v35 = v28;
      v9 = (const xmlChar *)objc_msgSend(a1, "getString:");
      if (v27)
        goto LABEL_64;
LABEL_42:
      if ((objc_msgSend(v41, "isCancelled") & 1) != 0)
        goto LABEL_64;
    }
    while (1)
    {
      v29 = xmlTextReaderRead(v6);
      if (v29 != 1)
      {
        v14 = v29;
        v9 = (const xmlChar *)objc_msgSend(a1, "getString:", v35);
        goto LABEL_42;
      }
      v30 = xmlTextReaderDepth(v6);
      v31 = xmlTextReaderNodeType(v6);
      if (v37 != v30 || v31 != 3)
      {
        v27 = v30 == v11 && v31 == 15;
        v14 = 1;
        v28 = v35;
        goto LABEL_39;
      }
      v32 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(v6));
      if ((objc_msgSend(v41, "isCancelled") & 1) != 0)
        break;
      if (v32)
      {
        v39 = 0;
LABEL_60:
        v28 = objc_msgSend(v41, "addRefText:forRID:", v32, v35);
        v14 = 1;
        v27 = v39;
        goto LABEL_39;
      }
    }
    if (v32)
    {
      v39 = 1;
      goto LABEL_60;
    }
    v9 = (const xmlChar *)objc_msgSend(a1, "getString:", v35);
LABEL_63:
    v14 = 1;
LABEL_64:
    if ((objc_msgSend(v41, "isCancelled") & 1) != 0 || !v9)
    {
      if ((v14 & 0x8000000000000000) == 0)
        goto LABEL_67;
LABEL_69:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
  }
  if ((v10 & 0x8000000000000000) != 0)
    goto LABEL_69;
LABEL_67:
  LOBYTE(v5) = objc_msgSend(v41, "isCancelled") ^ 1;
  return (char)v5;
}

@end
