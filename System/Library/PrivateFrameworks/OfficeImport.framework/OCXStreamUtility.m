@implementation OCXStreamUtility

+ (BOOL)readStream:(_xmlTextReader *)a3 streamState:(id)a4
{
  id v5;
  int v6;
  int v7;
  const xmlChar *v8;
  uint64_t v9;
  BOOL v10;

  v5 = a4;
  while (1)
  {
    do
    {
      while (1)
      {
        if (!objc_msgSend(v5, "hasLevels") || xmlTextReaderRead(a3) != 1)
        {
          v10 = 0;
          goto LABEL_13;
        }
        v6 = xmlTextReaderNodeType(a3);
        v7 = xmlTextReaderDepth(a3);
        if (v7 != objc_msgSend(v5, "currentContextDepth") || v6 != 15)
          break;
        objc_msgSend(v5, "popLevel");
      }
    }
    while (v7 != objc_msgSend(v5, "currentContextChildDepth") || v6 != 1);
    v8 = xmlTextReaderConstLocalName(a3);
    if (!xmlStrEqual(v8, (const xmlChar *)"AlternateContent"))
      break;
    if (+[OCXStreamUtility pScanStreamForwardToApplicableContentInAlternateContent:](OCXStreamUtility, "pScanStreamForwardToApplicableContentInAlternateContent:", a3))
    {
      v9 = xmlTextReaderDepth(a3);
      objc_msgSend(v5, "pushLevel:name:", v9, xmlTextReaderConstLocalName(a3));
    }
  }
  v10 = 1;
LABEL_13:

  return v10;
}

+ (BOOL)pScanStreamForwardToApplicableContentInAlternateContent:(_xmlTextReader *)a3
{
  int v4;
  const xmlChar *v5;
  int v6;
  int v7;

  v4 = xmlTextReaderDepth(a3);
  while (xmlTextReaderRead(a3) == 1)
  {
    v5 = xmlTextReaderConstLocalName(a3);
    v6 = xmlTextReaderNodeType(a3);
    v7 = xmlTextReaderDepth(a3);
    if (v7 == v4 && v6 == 15)
      break;
    if (v7 == v4 + 1
      && v6 == 1
      && (!xmlStrEqual(v5, (const xmlChar *)"Choice") || xmlTextReaderHasAttributes(a3))
      && (xmlStrEqual(v5, (const xmlChar *)"Choice")
       && +[CXNamespace isPrefixSupportedFromStream:prefix:](CXNamespace, "isPrefixSupportedFromStream:prefix:", a3, xmlTextReaderGetAttribute(a3, (const xmlChar *)"Requires"))|| xmlStrEqual(v5, (const xmlChar *)"Fallback")))
    {
      return 1;
    }
  }
  return 0;
}

@end
