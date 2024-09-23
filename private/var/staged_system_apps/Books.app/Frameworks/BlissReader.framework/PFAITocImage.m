@implementation PFAITocImage

- (void)mapEndElementWithState:(id)a3
{
  const xmlChar *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAITocImage;
  -[PFXImage mapEndElementWithState:](&v6, "mapEndElementWithState:");
  v4 = (const xmlChar *)dataTocConfigBackgroundImage;
  v5 = objc_msgSend(a3, "currentXmlStackEntry");
  xmlStrEqual(v4, (const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", dataTocConfigAttribute));
}

@end
