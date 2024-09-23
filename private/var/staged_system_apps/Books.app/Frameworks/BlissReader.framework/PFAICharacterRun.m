@implementation PFAICharacterRun

+ (void)readTextRange:(_NSRange)a3 fromText:(const char *)a4 readerState:(id)a5
{
  xmlChar *v7;
  id v8;

  v7 = xmlStrsub((const xmlChar *)a4, a3.location, a3.length);
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", v7);
  xmlFree(v7);
  objc_msgSend(a1, "readTextToCurrentOrientation:readerState:", v8, a5);

}

+ (void)readText:(const char *)a3 readerState:(id)a4
{
  id v7;
  id v8;
  id v9;
  int v10;
  char *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;

  v7 = objc_msgSend(a4, "currentStackEntry");
  v8 = objc_msgSend(a4, "currentDocOrientationState");
  if (!objc_msgSend(v8, "hasHints") || (objc_msgSend(a4, "inTable") & 1) != 0)
  {
    objc_msgSend(a1, "readTextToCurrentOrientation:readerState:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", a3), a4);
    return;
  }
  v9 = objc_msgSend(a4, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(v7, "currentEntryMediaState"), "storage"));
  v10 = xmlStrlen((const xmlChar *)a3);
  v11 = (char *)objc_msgSend(a4, "totalTextRead");
  if (v10)
  {
    v12 = v11;
    v13 = 0;
    v14 = v10;
    v18 = v10;
    v19 = &v11[v10];
    while (1)
    {
      if (!objc_msgSend(v8, "hasHints", v18))
      {
        objc_msgSend(a1, "readTextRange:fromText:readerState:", v13, v14, a3, a4);
        objc_msgSend(v8, "invalidateLineHints");
        return;
      }
      v15 = (char *)objc_msgSend(v8, "nextHintLocation");
      v16 = (char *)(v15 - v12);
      if (v15 == v12)
        goto LABEL_11;
      if ((uint64_t)v15 >= (uint64_t)v12)
        break;
LABEL_12:
      objc_msgSend(v8, "popHint");
      if (!v14)
        return;
    }
    v17 = v15;
    if (v15 >= v19)
    {
      objc_msgSend(a1, "readTextRange:fromText:readerState:", v13, v14, a3, a4);
      return;
    }
    objc_msgSend(a1, "readTextRange:fromText:readerState:", v13, v16, a3, a4);
    v13 += (uint64_t)v16;
    v14 = v18 - v13;
    v12 = v17;
LABEL_11:
    objc_msgSend(v9, "addLineBreakHintWithPresentationId:", CFSTR("p"));
    goto LABEL_12;
  }
}

+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5
{
  const xmlChar *v8;
  const xmlChar *v9;

  v8 = xmlTextReaderConstValue(a3);
  if (v8)
  {
    v9 = v8;
    if (xmlStrlen(v8) >= 1)
    {
      if (objc_msgSend(a5, "setFlowAsCurrent"))
        objc_msgSend(a1, "readText:readerState:", v9, a5);
      if (objc_msgSend(a5, "setPaginatedAsCurrent"))
      {
        if (objc_msgSend(a5, "inBody"))
          objc_msgSend(a5, "setCfiPathForTextRun:", a4);
        objc_msgSend(a1, "readText:readerState:", v9, a5);
      }
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v9;
  objc_super v10;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAICharacterRun;
    v6 = (id)-[PFXCharacterRun mapStartElementWithState:](&v10, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAICharacterRun;
    v7 = (id)-[PFXCharacterRun mapStartElementWithState:](&v9, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v7);
    LOBYTE(v6) = v6 | v7;
  }
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return (char)v6;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;
  objc_super v6;

  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAICharacterRun;
    -[PFXCharacterRun mapEndElementWithState:](&v6, "mapEndElementWithState:", a3);
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAICharacterRun;
    -[PFXCharacterRun mapEndElementWithState:](&v5, "mapEndElementWithState:", a3);
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
  +[PFAIReferenceAnchor startReferenceAnchorWithStackEntry:contentState:](PFAIReferenceAnchor, "startReferenceAnchorWithStackEntry:contentState:", a3, a4);
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
  +[PFAIReferenceAnchor endCurrentReferenceAnchorForEntryOrientation:contentState:](PFAIReferenceAnchor, "endCurrentReferenceAnchorForEntryOrientation:contentState:", a3, a4);
}

@end
