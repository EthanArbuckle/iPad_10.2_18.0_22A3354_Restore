@implementation PFEIFigure

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3;
  id v4;
  const xmlChar *v5;
  id v6;

  v3 = objc_msgSend(a3, "currentHtmlStackEntry");
  v4 = objc_msgSend(v3, "currentEntryMediaState");
  v5 = (const xmlChar *)objc_msgSend(v3, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
  if (!xmlStrEqual(v5, (const xmlChar *)PFXWidgetConstantGalleryObjectValueItem[0])
    || !objc_msgSend(v4, "childResultCount"))
  {
    if (!objc_msgSend(v4, "childResultCount"))
      return;
    v6 = objc_msgSend(v4, "childResults");
    goto LABEL_7;
  }
  v6 = +[PFEIGallery galleryItemFromEntry:](PFEIGallery, "galleryItemFromEntry:", v3);
  if (v6)
LABEL_7:
    objc_msgSend(v4, "setResult:", v6);
}

@end
