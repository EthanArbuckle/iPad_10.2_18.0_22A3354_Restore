@implementation THWAnchoredWidgetRep

- (id)_controlHostRep
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___THWControlHosting, objc_msgSend(-[THWAnchoredWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWAnchoredWidgetRep layout](self, "layout"), "widgetLayout")));
}

- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4
{
  if (protocol_isEqual((Protocol *)a3, (Protocol *)&OBJC_PROTOCOL___THWControlHosting))
    return -[THWAnchoredWidgetRep _controlHostRep](self, "_controlHostRep");
  else
    return 0;
}

@end
