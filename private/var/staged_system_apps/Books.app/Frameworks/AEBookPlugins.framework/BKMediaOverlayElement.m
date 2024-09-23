@implementation BKMediaOverlayElement

+ (id)newMediaOverlayElement:(id)a3 withParserInfo:(__CFDictionary *)a4
{
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  uint64_t v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  void *v24;
  id v25;

  v5 = a3;
  v7 = ITEpubMediaOverlayParser::audioStartForElement(a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = ITEpubMediaOverlayParser::audioEndForElement(a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "doubleValue");
  v13 = v12;
  objc_msgSend(v11, "doubleValue");
  if (v13 <= v14)
  {
    *(_QWORD *)&v16 = objc_opt_class(BKMediaOverlayElement).n128_u64[0];
    v15 = objc_msgSend(v5, "newByClass:", v17, v16);
    objc_msgSend(v15, "setAudioHref:", ITEpubMediaOverlayParser::audioHrefForElement(a4, v18));
    objc_msgSend(v15, "setAudioStart:", v8);
    objc_msgSend(v15, "setAudioEnd:", v11);
    objc_msgSend(v15, "setIndentationLevel:", ITEpubMediaOverlayParser::indentationLevelForElement(a4, v19));
    objc_msgSend(v15, "setCategory:", ITEpubMediaOverlayParser::categoryForElement(a4, v20));
    objc_msgSend(v15, "setElementId:", ITEpubMediaOverlayParser::textElementIdForElement(a4, v21));
    objc_msgSend(v15, "setDocumentHref:", ITEpubMediaOverlayParser::textHrefForElement(a4, v22));
    objc_msgSend(v15, "setSequenceSource:", ITEpubMediaOverlayParser::sequenceSourceForElement(a4, v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indentationLevel"));

    if (!v24)
    {
      v25 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
      objc_msgSend(v15, "setIndentationLevel:", v25);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (int)parseSMIL:(id)a3 contentSubpath:(id)a4 bookBasePath:(id)a5 bookDatabaseKey:(id)a6 managedObjectContext:(id)a7
{
  id v11;
  id v12;

  a3;
  v11 = a4;
  v12 = a5;
  a6;
  a7;
  operator new();
}

@end
