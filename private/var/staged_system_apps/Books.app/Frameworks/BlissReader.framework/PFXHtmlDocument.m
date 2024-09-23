@implementation PFXHtmlDocument

+ (BOOL)readWithState:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PFXHtmlDocument;
  return objc_msgSendSuper2(&v4, "readWithState:", a3);
}

+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  const xmlChar *v7;
  NSString *v8;
  id v9;
  id v10;

  v7 = xmlTextReaderConstLocalName(a3);
  if (xmlStrEqual(v7, (const xmlChar *)xmlStylesheetPI)
    && (v8 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3)), v9 = +[PFXUtilities valueOfTypeAttributeInProcessingInstruction:](PFXUtilities, "valueOfTypeAttributeInProcessingInstruction:", v8), (v10 = +[PFXUtilities valueOfHrefAttributeInProcessingInstruction:](PFXUtilities, "valueOfHrefAttributeInProcessingInstruction:", v8)) != 0))
  {
    return objc_msgSend(a1, "handleStylesheetAt:ofType:withMediaType:readerState:", v10, v9, +[PFXUtilities valueOfMediaAttributeInProcessingInstruction:](PFXUtilities, "valueOfMediaAttributeInProcessingInstruction:", v8), a4);
  }
  else
  {
    return 1;
  }
}

+ (Class)textReaderClass
{
  return (Class)objc_opt_class(PFXCharacterRun, a2);
}

+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6
{
  if (objc_msgSend(PFXCommonCssMimeType, "isEqualToString:", a4)
    && +[PFXStylesheet isMediaTypeSupportedInAll:](PFXStylesheet, "isMediaTypeSupportedInAll:", a5))
  {
    return +[PFXStylesheet readStylesheetFromEntry:readerState:](PFXStylesheet, "readStylesheetFromEntry:readerState:", a3, a6);
  }
  else
  {
    return 1;
  }
}

@end
