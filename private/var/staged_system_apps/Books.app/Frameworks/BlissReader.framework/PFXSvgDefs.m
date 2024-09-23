@implementation PFXSvgDefs

+ (BOOL)readSvgDefinitionsFromEntry:(id)a3 readerState:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  PFXSvgDefsDocument *v15;
  id v16;
  xmlTextReader *v17;
  int v18;
  int v19;
  NSString *v20;
  objc_class *v21;
  id v22;
  int i;
  const xmlChar *v24;
  PFXString *v25;
  int v26;
  uint64_t v28;
  id v29;

  if (!qword_5433F8)
  {
    objc_sync_enter(a1);
    if (!qword_5433F8)
    {
      v29 = objc_alloc((Class)NSDictionary);
      v28 = objc_opt_class(PFXLinearGradient);
      v7 = objc_opt_class(PFXRadialGradient);
      v8 = objc_opt_class(PFXStop);
      v9 = objc_opt_class(PFXPattern);
      v10 = objc_opt_class(PFXDefImage);
      v11 = objc_opt_class(PFXMarker);
      v12 = objc_opt_class(PFXDefPath);
      v13 = objc_msgSend(v29, "initWithObjectsAndKeys:", v28, CFSTR("linearGradient"), v7, CFSTR("radialGradient"), v8, CFSTR("stop"), v9, CFSTR("pattern"), v10, CFSTR("image"), v11, CFSTR("marker"), v12, CFSTR("path"), objc_opt_class(PFXClipPath), CFSTR("clipPath"), 0);
      __dmb(0xBu);
      qword_5433F8 = (uint64_t)v13;
    }
    objc_sync_exit(a1);
  }
  v14 = objc_msgSend(a4, "absoluteEntryForRelativeUri:", a3);
  v15 = -[PFXSvgDefsDocument initWithReaderState:entryPath:definitionMap:]([PFXSvgDefsDocument alloc], "initWithReaderState:entryPath:definitionMap:", a4, v14, objc_msgSend(a4, "svgDefinitionCache"));
  v16 = objc_msgSend(objc_msgSend(a4, "archive"), "decryptEntryWithName:error:", v14, 0);
  if (!v16)
    return (char)v16;
  v16 = objc_msgSend(v16, "xmlReader");
  if (!v16)
    return (char)v16;
  v17 = (xmlTextReader *)v16;
  v18 = xmlTextReaderRead((xmlTextReaderPtr)v16);
  if (v18 != 1)
    goto LABEL_20;
  do
  {
    v19 = xmlTextReaderNodeType(v17);
    if (v19 == 15)
    {
      if (!-[PFXSvgDefsDocument innermostElement](v15, "innermostElement"))
        goto LABEL_16;
LABEL_15:
      objc_msgSend(-[PFXSvgDefsDocument innermostElement](v15, "innermostElement"), "end");
      -[PFXSvgDefsDocument popElement](v15, "popElement");
      goto LABEL_16;
    }
    if (v19 == 1)
    {
      v20 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstLocalName(v17));
      v21 = (objc_class *)objc_msgSend((id)qword_5433F8, "objectForKey:", v20);
      if (v21)
      {
        v22 = objc_msgSend([v21 alloc], "initWithDocument:name:", v15, v20);
        for (i = xmlTextReaderMoveToFirstAttribute(v17); i == 1; i = xmlTextReaderMoveToNextAttribute(v17))
        {
          v24 = xmlTextReaderConstLocalName(v17);
          v25 = -[PFXString initWithXmlString:]([PFXString alloc], "initWithXmlString:", xmlTextReaderConstValue(v17));
          objc_msgSend(v22, "setAttribute:withValue:", v24, v25);

        }
        xmlTextReaderMoveToElement(v17);
        -[PFXSvgDefsDocument pushElement:](v15, "pushElement:", v22);

        objc_msgSend(v22, "start");
        if (xmlTextReaderIsEmptyElement(v17))
          goto LABEL_15;
      }
    }
LABEL_16:
    v26 = xmlTextReaderRead(v17);
  }
  while (v26 == 1);
  v18 = v26;
LABEL_20:
  xmlFreeTextReader(v17);
  LOBYTE(v16) = v18 >= 0;
  return (char)v16;
}

@end
