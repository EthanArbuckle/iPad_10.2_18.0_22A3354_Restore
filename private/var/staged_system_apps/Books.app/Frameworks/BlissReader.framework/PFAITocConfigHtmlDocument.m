@implementation PFAITocConfigHtmlDocument

+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6
{
  if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", a4)
    && +[PFXStylesheet isMediaTypeSupportedInPaginated:](PFXStylesheet, "isMediaTypeSupportedInPaginated:", a5))
  {
    return +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", a3, a6);
  }
  else
  {
    return 1;
  }
}

+ (id)elementReaders
{
  id result;
  PFXElementReaderDictionary *v4;

  result = (id)qword_5436E8;
  if (!qword_5436E8)
  {
    objc_sync_enter(a1);
    if (!qword_5436E8)
    {
      v4 = -[PFXElementReaderDictionary initWithFallThroughAllowed:]([PFXElementReaderDictionary alloc], "initWithFallThroughAllowed:", 1);
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "html", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "head", PFXCommonXhtmlNS[0], objc_opt_class(PFAITocConfigHead));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "style", PFXCommonXhtmlNS[0], objc_opt_class(PFXPaginatedStyleReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "link", PFXCommonXhtmlNS[0], objc_opt_class(PFXPaginatedLinkReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "meta", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "title", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "body", PFXCommonXhtmlNS[0], objc_opt_class(PFAITocConfigBody));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "section", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "article", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "hgroup", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "nav", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "header", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "footer", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "b", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "strong", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "i", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "em", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "span", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "br", PFXCommonXhtmlNS[0], objc_opt_class(PFXBreak));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "pre", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "a", PFXCommonXhtmlNS[0], objc_opt_class(PFXAnchor));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "small", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "cite", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dfn", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "abbr", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "sup", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "sub", PFXCommonXhtmlNS[0], objc_opt_class(PFXCharacterRun));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "p", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dl", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "div", PFXCommonXhtmlNS[0], objc_opt_class(PFXDiv));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "blockquote", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "table", PFXCommonXhtmlNS[0], objc_opt_class(PFXTable));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "caption", PFXCommonXhtmlNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "colgroup", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "col", PFXCommonXhtmlNS[0], objc_opt_class(PFXTableColumn));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tbody", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tfoot", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "thead", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "tr", PFXCommonXhtmlNS[0], objc_opt_class(PFXTableRow));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "td", PFXCommonXhtmlNS[0], objc_opt_class(PFXTableCell));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "th", PFXCommonXhtmlNS[0], objc_opt_class(PFXTableCell));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "address", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "figure", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "figcaption", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "aside", PFXCommonXhtmlNS[0], objc_opt_class(PFXAside));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h1", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h2", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h3", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h4", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h5", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "h6", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "ol", PFXCommonXhtmlNS[0], objc_opt_class(PFXList));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "ul", PFXCommonXhtmlNS[0], objc_opt_class(PFXList));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "li", PFXCommonXhtmlNS[0], objc_opt_class(PFXBlock));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dt", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "dd", PFXCommonXhtmlNS[0], objc_opt_class(PFXFallthroughReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "svg", PFXCommonSvgNS[0], objc_opt_class(PFXSvg));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "a", PFXCommonSvgNS[0], objc_opt_class(PFXSvgAnchor));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "image", PFXCommonSvgNS[0], objc_opt_class(PFAITocImage));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "path", PFXCommonSvgNS[0], objc_opt_class(PFXShape));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "rect", PFXCommonSvgNS[0], objc_opt_class(PFXShape));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "g", PFXCommonSvgNS[0], objc_opt_class(PFXGroup));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "title", PFXCommonSvgNS[0], objc_opt_class(PFXSvgTitleReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "desc", PFXCommonSvgNS[0], objc_opt_class(PFXStopReadingReader));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "video", PFXCommonXhtmlNS[0], objc_opt_class(PFXMedia));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "audio", PFXCommonXhtmlNS[0], objc_opt_class(PFXMedia));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "img", PFXCommonXhtmlNS[0], objc_opt_class(PFXImage));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "math", PFXCommonMathMLNS, objc_opt_class(PFXMath));
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](v4, "addEntryWithElementName:elementNamespace:mappingClass:", "object", PFXCommonXhtmlNS[0], objc_opt_class(PFAITocObjectHandler));
      __dmb(0xBu);
      qword_5436E8 = (uint64_t)v4;
    }
    objc_sync_exit(a1);
    return (id)qword_5436E8;
  }
  return result;
}

@end
