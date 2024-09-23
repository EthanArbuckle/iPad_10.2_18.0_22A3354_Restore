@implementation PFXStyle

- (id)supportedMediaTypes
{
  return +[PFXStylesheet basicMediaTypes](PFXStylesheet, "basicMediaTypes");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSMutableString *v9;
  xmlTextReader *v10;
  int v11;

  v5 = objc_msgSend(a3, "currentXmlStackEntry");
  v6 = objc_msgSend(v5, "valueForAttribute:", "type");
  if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", v6))
  {
    v7 = -[PFXStyle supportedMediaTypes](self, "supportedMediaTypes");
    v8 = objc_msgSend(v5, "valueForAttribute:", "media");
    if (!v8 || objc_msgSend(v7, "containsObject:", v8))
    {
      v9 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
      v10 = (xmlTextReader *)objc_msgSend(a3, "streamAPI");
      v11 = xmlTextReaderDepth(v10);
      while (xmlTextReaderRead(v10) == 1)
      {
        if (xmlTextReaderDepth(v10) == v11 && xmlTextReaderNodeType(v10) == 15)
          break;
        if (xmlTextReaderNodeType(v10) == 3)
          -[NSMutableString appendFormat:](v9, "appendFormat:", CFSTR("%@ %s"), v9, xmlTextReaderConstValue(v10));
      }
      if (-[NSMutableString length](v9, "length")
        && !+[PFXStylesheet readStylesheetFromStyleNodeContents:sourceURL:readerState:](PFXStylesheet, "readStylesheetFromStyleNodeContents:sourceURL:readerState:", v9, objc_msgSend(a3, "entryNSURL"), a3))
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXStyle mapStartElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXStyle.mm"), 58, CFSTR("Failed to read CSS from style element"));
      }
    }
  }
  return 0;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXStyle mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXStyle.mm"), 72, CFSTR("Bad call."));
}

@end
