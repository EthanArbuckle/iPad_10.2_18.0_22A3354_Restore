@implementation PFXSvgTitleReader

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setOverriddenStorage:", objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "temporaryTableCellStorage"));
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = objc_msgSend(a3, "currentHtmlStackEntry");
  v4 = objc_msgSend(objc_msgSend(v3, "currentEntryMediaState"), "storage");
  v5 = objc_msgSend(v3, "parentHtmlStackEntry");
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"svg"))
    objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "setAltDesc:", objc_msgSend(v4, "string"));
  v6 = objc_msgSend(v4, "range");
  objc_msgSend(v4, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v6, v7, &stru_43D7D8, 0, 0);
}

@end
