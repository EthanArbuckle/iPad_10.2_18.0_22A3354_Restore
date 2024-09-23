@implementation PFAIHeadStyle

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  NSMutableString *v10;
  xmlTextReader *v11;
  int v12;

  v4 = objc_msgSend(a3, "currentXmlStackEntry");
  v5 = objc_msgSend(v4, "valueForAttribute:", "type");
  if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", v5))
  {
    v6 = objc_msgSend(v4, "valueForAttribute:", "media");
    v7 = +[PFXStylesheet isMediaTypeSupportedInFlow:](PFXStylesheet, "isMediaTypeSupportedInFlow:", v6);
    v8 = +[PFXStylesheet isMediaTypeSupportedInPaginated:](PFXStylesheet, "isMediaTypeSupportedInPaginated:", v6);
    v9 = v8;
    if ((v7 & 1) != 0 || v8)
    {
      v10 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
      v11 = (xmlTextReader *)objc_msgSend(a3, "streamAPI");
      v12 = xmlTextReaderDepth(v11);
      while (xmlTextReaderRead(v11) == 1)
      {
        if (xmlTextReaderDepth(v11) == v12 && xmlTextReaderNodeType(v11) == 15)
          break;
        if (xmlTextReaderNodeType(v11) == 3)
          -[NSMutableString appendFormat:](v10, "appendFormat:", CFSTR("%@ %s"), v10, xmlTextReaderConstValue(v11));
      }
      if (-[NSMutableString length](v10, "length"))
      {
        if (v7)
        {
          objc_msgSend(a3, "setFlowAsCurrent");
          +[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v10, objc_msgSend(a3, "entryNSURL"), a3);
        }
        if (v9)
        {
          objc_msgSend(a3, "setPaginatedAsCurrent");
          +[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v10, objc_msgSend(a3, "entryNSURL"), a3);
        }
      }
    }
  }
  return 0;
}

@end
