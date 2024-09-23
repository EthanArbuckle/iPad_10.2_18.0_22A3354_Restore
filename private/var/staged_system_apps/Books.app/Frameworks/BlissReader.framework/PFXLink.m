@implementation PFXLink

- (id)supportedCssMediaTypes
{
  return +[PFXStylesheet basicMediaTypes](PFXStylesheet, "basicMediaTypes");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;

  v5 = objc_msgSend(a3, "currentXmlStackEntry");
  v6 = objc_msgSend(v5, "valueForAttribute:", "type");
  v7 = objc_msgSend(v5, "valueForAttribute:", "href");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = v7;
    if ((objc_msgSend(PFXCommonSvgMimeType, "isEqualToString:", v6) & 1) != 0
      || objc_msgSend(PFXCommonSvgImageMimeType, "isEqualToString:", v6))
    {
      if (!+[PFXSvgDefs readSvgDefinitionsFromEntry:readerState:](PFXSvgDefs, "readSvgDefinitionsFromEntry:readerState:", v9, a3))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXLink mapStartElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXLink.mm"), 36, CFSTR("Failed to read SVG definitions '%@'."), v9);
    }
    else
    {
      v10 = -[PFXLink supportedCssMediaTypes](self, "supportedCssMediaTypes");
      v11 = objc_msgSend(v5, "valueForAttribute:", "media");
      if ((!v11 || objc_msgSend(v10, "containsObject:", v11))
        && !+[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", v9, a3))
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXLink mapStartElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXLink.mm"), 47, CFSTR("Failed to read CSS stylesheet '%@'"), v9);
      }
    }
  }
  return 0;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXLink mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXLink.mm"), 60, CFSTR("Bad call."));
}

@end
