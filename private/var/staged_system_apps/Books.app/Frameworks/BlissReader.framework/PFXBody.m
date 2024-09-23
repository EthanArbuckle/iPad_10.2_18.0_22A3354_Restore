@implementation PFXBody

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;

  objc_msgSend(a3, "setInBody:", 1);
  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "defaultParagraphStyle");
  v6 = objc_msgSend(v4, "storage");
  objc_msgSend(v6, "stylesheet");
  objc_msgSend(v5, "stylesheet");
  v7 = objc_msgSend(v6, "length");
  if (!v7)
    objc_msgSend(v6, "setParagraphStyle:forCharRange:undoTransaction:", v5, 0, 0, 0);
  objc_msgSend(v4, "setParagraphStyle:", v5);
  objc_msgSend(v4, "setStartCharIndex:", v7);
  objc_msgSend(v5, "floatValueForProperty:", 17);
  objc_msgSend(v4, "setFontSize:", v8);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(objc_msgSend(a3, "popoversByIdentifier"), "allKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v4, "sourceDrawableInfoForIdentifier:", v10);
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(a3, "targetDrawableInfoForIdentifier:", v10);
          if (!objc_msgSend(v12, "popUpInfo") && v13 != 0)
          {
            objc_msgSend(v13, "setProgressKitID:", v10);
            objc_msgSend(v13, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));
            objc_msgSend(v12, "setPopUpInfo:", v13);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  if (xmlStrEqual((const xmlChar *)"html", (const xmlChar *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "parentEntry"), "xmlElementName")))
  {
    objc_msgSend(a3, "setInBody:", 0);
  }
}

@end
