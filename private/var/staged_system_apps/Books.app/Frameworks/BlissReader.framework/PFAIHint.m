@implementation PFAIHint

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = objc_msgSend(a3, "currentStackEntry");
  v5 = objc_msgSend(objc_msgSend(v4, "paginatedState"), "storage");
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v4, "xmlElementName"), (const xmlChar *)"lp"))
  {
    v6 = objc_msgSend(a3, "hintCollectorForStorage:", v5);
    objc_msgSend(v6, "addLineBreakHintWithPresentationId:", paginatedPresentationId);
  }
  else if (xmlStrEqual((const xmlChar *)objc_msgSend(v4, "xmlElementName"), (const xmlChar *)"sp"))
  {
    v7 = objc_msgSend(v4, "valueForAttribute:", "idref");
    v8 = objc_msgSend(a3, "hintCollectorForStorage:", v5);
    objc_msgSend(v8, "addStartHintWithIdref:presentationId:", v7, paginatedPresentationId);
  }
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return 1;
}

@end
