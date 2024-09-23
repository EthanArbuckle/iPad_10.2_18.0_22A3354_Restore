@implementation PFXWidgetStyleType

- (void)mapParagraphStyleWithState:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = objc_msgSend(a3, "currentHtmlStackEntry");
  v4 = objc_msgSend(v3, "currentEntryMediaState");
  v5 = 0;
  +[PFXParagraphStyle map:stackEntry:](PFXParagraphStyle, "map:stackEntry:", &v5, v3);
  objc_msgSend(v4, "setResult:", v5);
}

- (void)mapGraphicStyleWithState:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  objc_msgSend(v4, "setResult:", +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", objc_msgSend(v4, "propertySet"), a3));
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  const xmlChar *v6;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetStyleType[0]);
  if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueParagraphStyle[0]))
  {
    -[PFXWidgetStyleType mapParagraphStyleWithState:](self, "mapParagraphStyleWithState:", a3);
  }
  else if (xmlStrEqual(v6, (const xmlChar *)PFXWidgetConstantObjectValueGraphicStyle[0]))
  {
    -[PFXWidgetStyleType mapGraphicStyleWithState:](self, "mapGraphicStyleWithState:", a3);
  }
}

@end
