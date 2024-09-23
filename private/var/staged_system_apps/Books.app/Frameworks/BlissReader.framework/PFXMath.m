@implementation PFXMath

- (BOOL)mapStartElementWithState:(id)a3
{
  xmlNodePtr v4;
  xmlDocPtr v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = xmlTextReaderExpand((xmlTextReaderPtr)objc_msgSend(a3, "streamAPI"));
  v5 = xmlTextReaderCurrentDoc((xmlTextReaderPtr)objc_msgSend(a3, "streamAPI"));
  v6 = objc_msgSend(a3, "currentHtmlStackEntry");
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v8 = objc_msgSend(objc_msgSend(v6, "currentEntryMediaState"), "storage");
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
  if (objc_msgSend(v7, "hasHints"))
  {
    if ((objc_msgSend(a3, "inTable") & 1) == 0)
    {
      v10 = objc_msgSend(a3, "totalTextRead");
      if (v10 == objc_msgSend(v7, "nextHintLocation") && !objc_msgSend(v7, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", v8), "addLineBreakHintWithPresentationId:", CFSTR("p"));
        objc_msgSend(v7, "popHint");
      }
    }
  }
  v11 = objc_msgSend(objc_alloc((Class)TSWPEquationInfo), "initWithContext:mathMLNode:fromXMLDoc:", objc_msgSend(a3, "tspContext"), v4, v5);
  v12 = objc_msgSend(objc_alloc((Class)TSDExteriorTextWrap), "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", 0, 0, 2, 0, 0.0, 0.5);
  objc_msgSend(v11, "setExteriorTextWrap:", v12);
  v13 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(a3, "tspContext"), v11);
  objc_msgSend(v13, "setHOffsetType:", 0);
  objc_msgSend(v13, "setHOffset:", 0.0);
  objc_msgSend(v13, "setVOffsetType:", 0);
  objc_msgSend(v13, "setVOffset:", 0.0);
  v14 = objc_msgSend(v8, "length");
  objc_msgSend(v8, "insertAttachmentOrFootnote:range:", v13, v14, 0);
  objc_msgSend(v8, "setCharacterStyle:range:undoTransaction:", v9, v14, 1, 0);

  return 0;
}

@end
