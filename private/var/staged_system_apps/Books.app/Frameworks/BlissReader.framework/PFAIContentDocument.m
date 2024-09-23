@implementation PFAIContentDocument

+ (BOOL)readWithState:(id)a3
{
  objc_super v6;

  +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", (double)((uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(a3, "archive"), "decryptEntryWithName:error:", objc_msgSend(a3, "entryURI"), 0), "dataLength")+ 1), 100.0);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PFAIContentDocument;
  return objc_msgSendSuper2(&v6, "readWithState:", a3);
}

+ (Class)textReaderClass
{
  return (Class)objc_opt_class(PFAICharacterRun, a2);
}

+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6
{
  _BOOL4 v9;

  if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", a4))
  {
    if (+[PFXStylesheet isMediaTypeSupportedInPaginated:](PFXStylesheet, "isMediaTypeSupportedInPaginated:", a5))
    {
      objc_msgSend(a6, "setPaginatedAsCurrent");
      v9 = +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", a3, a6);
    }
    else
    {
      v9 = 1;
    }
    if (+[PFXStylesheet isMediaTypeSupportedInFlow:](PFXStylesheet, "isMediaTypeSupportedInFlow:", a5))
    {
      objc_msgSend(a6, "setFlowAsCurrent");
      if (v9)
        return +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", a3, a6);
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

+ (id)elementReaders
{
  id result;
  PFXElementReaderDictionary *v4;

  result = (id)qword_5436D8;
  if (!qword_5436D8)
  {
    objc_sync_enter(a1);
    if (!qword_5436D8)
    {
      v4 = -[PFXElementReaderDictionary initWithFallThroughAllowed:]([PFXElementReaderDictionary alloc], "initWithFallThroughAllowed:", 1);
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "html", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "head", PFXCommonXhtmlNS[0], objc_opt_class(PFAIHead));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "style", PFXCommonXhtmlNS[0], objc_opt_class(PFAIHeadStyle));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "link", PFXCommonXhtmlNS[0], objc_opt_class(PFAIHeadLink));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "meta", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "title", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "body", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualBody));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "section", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "article", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "hgroup", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "nav", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "header", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "footer", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "b", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "strong", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "i", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "em", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "span", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "br", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBreak));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "pre", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "a", PFXCommonXhtmlNS[0], objc_opt_class(PFAIAnchor));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "small", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "cite", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dfn", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "abbr", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "sup", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "sub", PFXCommonXhtmlNS[0], objc_opt_class(PFAICharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "p", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dl", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "div", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDiv));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "blockquote", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "table", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualTable));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "caption", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "colgroup", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "col", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualTableColumn));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tbody", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tfoot", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "thead", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tr", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualTableRow));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "td", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualTableCell));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "th", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualTableCell));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "address", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "figure", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "figcaption", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "aside", PFXCommonXhtmlNS[0], objc_opt_class(PFAIAside));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h1", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h2", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h3", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h4", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h5", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h6", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "ol", PFXCommonXhtmlNS[0], objc_opt_class(PFAIList));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "ul", PFXCommonXhtmlNS[0], objc_opt_class(PFAIList));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "li", PFXCommonXhtmlNS[0], objc_opt_class(PFAIBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dt", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dd", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "svg", PFXCommonSvgNS[0], objc_opt_class(PFAIDualSvg));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "a", PFXCommonSvgNS[0], objc_opt_class(PFXSvgAnchor));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "image", PFXCommonSvgNS[0], objc_opt_class(PFAIDualImage));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "path", PFXCommonSvgNS[0], objc_opt_class(PFAIDualShape));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "rect", PFXCommonSvgNS[0], objc_opt_class(PFAIDualShape));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "g", PFXCommonSvgNS[0], objc_opt_class(PFAIDualGroup));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "video", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualMedia));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "audio", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualMedia));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "img", PFXCommonXhtmlNS[0], objc_opt_class(PFAIDualImage));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "title", PFXCommonSvgNS[0], objc_opt_class(PFAIDualSvgTitleReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "desc", PFXCommonSvgNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "math", PFXCommonMathMLNS, objc_opt_class(PFAIMath));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "object", PFXCommonXhtmlNS[0], objc_opt_class(PFAIObject));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "lp", PFXCommonHintNS[0], objc_opt_class(PFAIHint));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "sp", PFXCommonHintNS[0], objc_opt_class(PFAIHint));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "switch", PFXCommonEpubOpsNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "default", PFXCommonEpubOpsNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "case", PFXCommonEpubOpsNS[0], objc_opt_class(PFXStopReadingReader));
      __dmb(0xBu);
      qword_5436D8 = (uint64_t)v4;
    }
    objc_sync_exit(a1);
    return (id)qword_5436D8;
  }
  return result;
}

@end
