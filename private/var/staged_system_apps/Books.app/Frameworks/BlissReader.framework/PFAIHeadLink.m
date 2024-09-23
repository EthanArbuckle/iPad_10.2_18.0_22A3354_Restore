@implementation PFAIHeadLink

- (void)loadHintsFrom:(id)a3 contentState:(id)a4
{
  const __CFData *v5;
  const __CFData *v6;
  CFPropertyListRef v7;
  const void *v8;
  CFTypeID v9;
  const void *v10;
  CFPropertyListFormat format;

  if (a3)
  {
    v5 = (const __CFData *)objc_msgSend(objc_msgSend(a4, "archive"), "createDataWithName:error:", a3, 0);
    if (v5)
    {
      v6 = v5;
      format = kCFPropertyListBinaryFormat_v1_0;
      v7 = CFPropertyListCreateWithData(kCFAllocatorDefault, v5, 0, &format, 0);
      if (v7)
      {
        v8 = v7;
        v9 = CFGetTypeID(v7);
        if (v9 == CFDictionaryGetTypeID())
          v10 = v8;
        else
          v10 = 0;
        objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "setLineHints:", v10);
        CFRelease(v8);
      }

    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  id v18;
  id v19;

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
      +[PFXSvgDefs readSvgDefinitionsFromEntry:readerState:](PFXSvgDefs, "readSvgDefinitionsFromEntry:readerState:", v9, a3);
    }
    else if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", v6))
    {
      v11 = objc_msgSend(v5, "valueForAttribute:", "media");
      v12 = +[PFXStylesheet isMediaTypeSupportedInFlow:](PFXStylesheet, "isMediaTypeSupportedInFlow:", v11);
      v13 = +[PFXStylesheet isMediaTypeSupportedInPaginated:](PFXStylesheet, "isMediaTypeSupportedInPaginated:", v11);
      if (v12)
      {
        objc_msgSend(a3, "setFlowAsCurrent");
        +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", v9, a3);
      }
      if (v13)
      {
        objc_msgSend(a3, "setPaginatedAsCurrent");
        +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", v9, a3);
      }
    }
    else if (objc_msgSend(PFXCommonLineHintsMimeType, "isEqualToString:", v6))
    {
      v14 = objc_msgSend(v5, "valueForAttribute:", "media");
      v15 = +[PFXStylesheet isMediaTypeSupportedInFlow:](PFXStylesheet, "isMediaTypeSupportedInFlow:", v14);
      v16 = +[PFXStylesheet isMediaTypeSupportedInPaginated:](PFXStylesheet, "isMediaTypeSupportedInPaginated:", v14);
      v17 = objc_msgSend(v5, "valueForAttribute:", "href");
      if (v17)
      {
        v18 = objc_msgSend(a3, "absoluteEntryForRelativeUri:", v17);
        if (v18)
        {
          v19 = v18;
          if (v15)
          {
            objc_msgSend(a3, "setFlowAsCurrent");
            -[PFAIHeadLink loadHintsFrom:contentState:](self, "loadHintsFrom:contentState:", v19, a3);
          }
          if (v16)
          {
            objc_msgSend(a3, "setPaginatedAsCurrent");
            -[PFAIHeadLink loadHintsFrom:contentState:](self, "loadHintsFrom:contentState:", v19, a3);
          }
        }
      }
    }
  }
  return 0;
}

@end
