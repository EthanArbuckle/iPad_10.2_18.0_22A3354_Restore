@implementation ODXState

- (ODXState)initWithOfficeArtState:(id)a3
{
  id v5;
  ODXState *v6;
  ODXState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ODXState;
  v6 = -[OCXState init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mOfficeArtState, a3);
    -[ODXState setupNSForXMLFormat:](v7, "setupNSForXMLFormat:", -[OCXState xmlFormat](v7->mOfficeArtState, "xmlFormat"));
  }

  return v7;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3;
  CXNamespace *v5;
  CXNamespace *v6;
  CXNamespace *v7;
  CXNamespace *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)ODXState;
  -[OCXState setupNSForXMLFormat:](&v9, sel_setupNSForXMLFormat_);
  v5 = [CXNamespace alloc];
  v6 = v5;
  if ((_DWORD)v3)
  {
    v7 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/diagram");
    v8 = -[CXNamespace initWithUri:fallbackNamespace:](v6, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/diagram", v7);
    -[ODXState setODXDiagramNamespace:](self, "setODXDiagramNamespace:", v8);

  }
  else
  {
    v7 = -[CXNamespace initWithUri:](v5, "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/diagram");
    -[ODXState setODXDiagramNamespace:](self, "setODXDiagramNamespace:", v7);
  }

  -[OAXDrawingState setupNSForXMLFormat:](self->mOfficeArtState, "setupNSForXMLFormat:", v3);
}

- (CXNamespace)ODXDiagramNamespace
{
  return self->mODXDiagramNamespace;
}

- (void)setODXDiagramNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mODXDiagramNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mODXDiagramNamespace, 0);
}

@end
