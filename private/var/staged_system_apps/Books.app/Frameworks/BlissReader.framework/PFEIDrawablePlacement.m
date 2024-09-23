@implementation PFEIDrawablePlacement

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  if (objc_msgSend(a3, "ancestorEntryWithReaderClass:", objc_opt_class(PFXBlock))
    || (-[PFXDrawablePlacement setMode:](self, "setMode:", 3),
        xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "xmlElementName"), (const xmlChar *)"table")))
  {
    -[PFXDrawablePlacement setMode:](self, "setMode:", 2);
  }
}

- (id)wrapPropertyValueWithState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFEIDrawablePlacement;
  return -[PFXDrawablePlacement wrapPropertyValueWithState:](&v4, "wrapPropertyValueWithState:", a3);
}

@end
