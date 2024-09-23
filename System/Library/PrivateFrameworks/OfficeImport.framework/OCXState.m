@implementation OCXState

- (OCXState)init
{
  OCXState *v2;
  OCXState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OCXState;
  v2 = -[OCXState init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[OCXState setupNSForXMLFormat:](v2, "setupNSForXMLFormat:", 0);
  return v3;
}

- (void)setupNSForXMLFormat:(int)a3
{
  CXNamespace *v4;
  CXNamespace *v5;
  CXNamespace *v6;

  if (a3)
  {
    self->mXMLFormat = 1;
    v4 = [CXNamespace alloc];
    v5 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    v6 = -[CXNamespace initWithUri:fallbackNamespace:](v4, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/officeDocument/relationships", v5);
    -[OCXState setOCXRelationshipsNamespace:](self, "setOCXRelationshipsNamespace:", v6);

  }
  else
  {
    self->mXMLFormat = 0;
    v5 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    -[OCXState setOCXRelationshipsNamespace:](self, "setOCXRelationshipsNamespace:", v5);
  }

  -[OCXState setOCXDrawingNamespace:](self, "setOCXDrawingNamespace:", OCXDrawingNamespace);
}

- (id)OCXStylesRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipStyles;
  else
    v2 = (id *)&OCXRelationshipStyles;
  return *v2;
}

- (id)OCXSharedStringsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipSharedStrings;
  else
    v2 = (id *)&OCXRelationshipSharedStrings;
  return *v2;
}

- (id)OCXDrawingRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipDrawing;
  else
    v2 = (id *)&OCXRelationshipDrawing;
  return *v2;
}

- (id)OCXEndnotesRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipEndnotes;
  else
    v2 = (id *)&OCXRelationshipEndnotes;
  return *v2;
}

- (id)OCXFontTableRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipFontTable;
  else
    v2 = (id *)&OCXRelationshipFontTable;
  return *v2;
}

- (id)OCXFootnotesRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipFootnotes;
  else
    v2 = (id *)&OCXRelationshipFootnotes;
  return *v2;
}

- (id)OCXCommentsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipComments;
  else
    v2 = (id *)&OCXRelationshipComments;
  return *v2;
}

- (id)OCXCommentsExtendedRelationshipType
{
  return CFSTR("http://schemas.microsoft.com/office/2011/relationships/commentsExtended");
}

- (id)OCXPivotTableRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipPivotTable;
  else
    v2 = (id *)&OCXRelationshipPivotTable;
  return *v2;
}

- (id)OCXTableRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipTable;
  else
    v2 = (id *)&OCXRelationshipTable;
  return *v2;
}

- (id)OCXSlideMasterRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipSlideMaster;
  else
    v2 = (id *)&OCXRelationshipSlideMaster;
  return *v2;
}

- (id)OCXSlideLayoutRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipSlideLayout;
  else
    v2 = (id *)&OCXRelationshipSlideLayout;
  return *v2;
}

- (id)OCXSlideRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipSlide;
  else
    v2 = (id *)&OCXRelationshipSlide;
  return *v2;
}

- (id)OCXNotesSlideRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipNotesSlide;
  else
    v2 = (id *)&OCXRelationshipNotesSlide;
  return *v2;
}

- (id)OCXCommentAuthorsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipCommentAuthors;
  else
    v2 = (id *)&OCXRelationshipCommentAuthors;
  return *v2;
}

- (id)OCXCustomXmlRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipCustomXML;
  else
    v2 = (id *)&OCXRelationshipCustomXML;
  return *v2;
}

- (id)OCXLegacyDocTextInfoRelationshipType
{
  return CFSTR("http://schemas.microsoft.com/office/2006/relationships/legacyDocTextInfo");
}

- (id)OCXThemeRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipTheme;
  else
    v2 = (id *)&OCXRelationshipTheme;
  return *v2;
}

- (id)OCXThemeOverrideRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipThemeOverride;
  else
    v2 = (id *)&OCXRelationshipThemeOverride;
  return *v2;
}

- (id)OCXVmlDrawingRelationshipType
{
  return CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/vmlDrawing");
}

- (id)OCXNotesMasterRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipNotesMaster;
  else
    v2 = (id *)&OCXRelationshipNotesMaster;
  return *v2;
}

- (id)OCXNumberingRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipNumbering;
  else
    v2 = (id *)&OCXRelationshipNumbering;
  return *v2;
}

- (id)OCXPackagePresPropsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipPackagePresProps;
  else
    v2 = (id *)&OCXRelationshipPackagePresProps;
  return *v2;
}

- (id)OCXPackageViewPropsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipPackageViewProps;
  else
    v2 = (id *)&OCXRelationshipPackageViewProps;
  return *v2;
}

- (id)OCXTableStylesRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipTableStyles;
  else
    v2 = (id *)&OCXRelationshipTableStyles;
  return *v2;
}

- (id)OCXSettingsRelationshipType
{
  id *v2;

  if (self->mXMLFormat == 1)
    v2 = (id *)&OCXStrictRelationshipSettings;
  else
    v2 = (id *)&OCXRelationshipSettings;
  return *v2;
}

- (int)xmlFormat
{
  return self->mXMLFormat;
}

- (CXNamespace)OCXRelationshipsNamespace
{
  return self->mOCXRelationshipsNamespace;
}

- (void)setOCXRelationshipsNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOCXRelationshipsNamespace, a3);
}

- (CXNamespace)OCXDrawingNamespace
{
  return self->mOCXDrawingNamespace;
}

- (void)setOCXDrawingNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOCXDrawingNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOCXDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mOCXRelationshipsNamespace, 0);
}

- (void)setXmlFormat:(int)a3
{
  self->mXMLFormat = a3;
}

@end
