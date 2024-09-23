@implementation NSRTFReader

- (NSRTFReader)initWithRTFD:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSRTFReader *v9;
  char v10;

  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3650]), "initWithSerializedRepresentation:", a3);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = objc_msgSend(v4, "isDirectory");
  if (v6)
  {
    v7 = rtfDataFromFileWrapper(v5);
  }
  else
  {
    if (!objc_msgSend(v5, "isRegularFile"))
    {
LABEL_12:

LABEL_13:
      return 0;
    }
    v7 = objc_msgSend(v5, "regularFileContents");
  }
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v9 = -[NSRTFReader initWithRTF:](self, "initWithRTF:", v8);
  self = v9;
  v10 = v6 ^ 1;
  if (!v9)
    v10 = 1;
  if ((v10 & 1) != 0)
  {

    if (self)
      return self;
    goto LABEL_13;
  }
  -[NSRTFReader _setRTFDFileWrapper:](v9, "_setRTFDFileWrapper:", v5);

  return self;
}

- (NSRTFReader)initWithPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSRTFReader *v8;
  uint64_t v9;
  char v11;

  v11 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v11))goto LABEL_8;
  if (v11)
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB3650]);
    v6 = objc_msgSend(v5, "initWithURL:options:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3), 0, 0);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[NSRTFReader initWithRTFDFileWrapper:](self, "initWithRTFDFileWrapper:", v6);
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", a3);
  if (!v9)
    goto LABEL_8;
  v7 = (void *)v9;
  v8 = -[NSRTFReader initWithRTF:](self, "initWithRTF:", v9);
LABEL_7:
  self = v8;

  if (!self)
    goto LABEL_8;
  return self;
}

- (NSRTFReader)initWithRTFDFileWrapper:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  NSRTFReader *v7;

  v3 = a3;
  if (objc_msgSend(a3, "isSymbolicLink"))
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", objc_msgSend(v3, "symbolicLinkDestinationURL"), 0, 0);
  if (objc_msgSend(v3, "isDirectory")
    && (v5 = rtfDataFromFileWrapper(v3)) != 0
    && (v6 = v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v7 = -[NSRTFReader initWithRTF:](self, "initWithRTF:", v6), (self = v7) != 0))
  {
    -[NSRTFReader _setRTFDFileWrapper:](v7, "_setRTFDFileWrapper:", v3);
  }
  else
  {

    return 0;
  }
  return self;
}

- (NSRTFReader)initWithRTF:(id)a3
{
  uint64_t v5;
  NSRTFReader *v6;
  NSRTFReader *v7;
  NSZone *v8;
  __int128 v9;
  NSMapTableValueCallBacks v11;
  NSMapTableKeyCallBacks keyCallBacks;
  objc_super v13;

  v5 = -[NSRTFReader zone](self, "zone");
  v13.receiver = self;
  v13.super_class = (Class)NSRTFReader;
  v6 = -[NSRTFReader init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    _NSRTFInit((uint64_t)&v6->_private);
    v7->_private.reader = v7;
    _NSRTFSetPanicProc((uint64_t)&v7->_private, (uint64_t)raiseRTFException);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 0, (uint64_t)unknownClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 2uLL, (uint64_t)textClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 3uLL, (uint64_t)controlClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 1uLL, (uint64_t)groupClass);
    v7->_cocoaVersion = -1;
    v7->_rtfData = (NSData *)objc_msgSend(a3, "copyWithZone:", v5);
    v7->_curAttributes = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributesStack = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributeInfoStack = (NSMutableData *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "allocWithZone:", v5), "initWithCapacity:", 192);
    v7->_topAttributedString = (NSMutableAttributedString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3778], "allocWithZone:", v5), "init");
    v7->_fontTable = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributeInfo.toUniCharEncoding = 2817;
    v7->_defaultToUniCharEncoding = 2817;
    v7->_explicitCharSetEncountered = 0;
    v7->_level = 0;
    v7->_paperSize.width = 612.0;
    v7->_viewSize = (CGSize)*MEMORY[0x1E0CB3440];
    *(_QWORD *)&v7->_viewScale = 100;
    v7->_tMargin = 72.0;
    *(_OWORD *)&v7->_paperSize.height = xmmword_18D6CC210;
    *(_OWORD *)&v7->_rMargin = xmmword_18D6CC220;
    *(_OWORD *)&v7->_hyphenationFactor = xmmword_18D6CC230;
    v8 = (NSZone *)-[NSRTFReader zone](v7, "zone");
    keyCallBacks = *(NSMapTableKeyCallBacks *)byte_1E2606370;
    v11 = *(NSMapTableValueCallBacks *)*(_QWORD *)&MEMORY[0x1E0CB2FB8];
    v7->_cachedRTFFontTable = NSCreateMapTableWithZone(&keyCallBacks, &v11, 0x14uLL, v8);
    *(_DWORD *)((char *)&v7->_attributeInfo + 42) = *(_DWORD *)((char *)&v7->_attributeInfo + 42) & 0xFFFFC07F | 0x80;
    v7->_attributeInfo.codePageEncoding = -1;
    v7->_currentDefinitionColumn = 0;
    *(_QWORD *)&v7->_currentRow = 0;
    v7->_colorTblColorSpace = -1;
    v7->_verticalOrientationLocation = 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)&v9 = -1;
    *((_QWORD *)&v9 + 1) = -1;
    *(_OWORD *)&v7->_cocoaTextScaling = v9;
    *(_OWORD *)&v7->_targetTextScaling = v9;
    v7->_finalTextScaling = -1;
    v7->_includesTextListMarkers = 1;
    _NSRTFSetInput(&v7->_private.reader, (uint64_t)-[NSData bytes](v7->_rtfData, "bytes"), -[NSData length](v7->_rtfData, "length"));
    if (_NSRTFGetToken(&v7->_private) == 1 && !v7->_private.major)
    {
      _NSRTFRouteToken((uint64_t)&v7->_private);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)_setRTFDFileWrapper:(id)a3
{
  NSFileWrapper *document;

  document = self->_document;
  if (document != a3)
  {

    self->_document = (NSFileWrapper *)a3;
  }
}

- (id)_RTFDFileWrapper
{
  return self->_document;
}

- (void)setReadLimit:(int64_t)a3
{
  self->_readLimit = a3;
}

- (void)setThumbnailLimit:(int64_t)a3
{
  self->_thumbnailLimit = a3;
}

- (void)setPaperSize:(CGSize)a3
{
  self->_paperSize = a3;
}

- (CGSize)paperSize
{
  double width;
  double height;
  CGSize result;

  width = self->_paperSize.width;
  height = self->_paperSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewKind:(int64_t)a3
{
  self->_viewKind = a3;
}

- (void)setViewScale:(int64_t)a3
{
  self->_viewScale = a3;
}

- (void)setLeftMargin:(double)a3
{
  self->_lMargin = a3;
}

- (void)setRightMargin:(double)a3
{
  self->_rMargin = a3;
}

- (void)setTopMargin:(double)a3
{
  self->_tMargin = a3;
}

- (void)setBottomMargin:(double)a3
{
  self->_bMargin = a3;
}

- (void)setHyphenationFactor:(float)a3
{
  self->_hyphenationFactor = a3;
}

- (void)setBackgroundColor:(id)a3
{
  NSColor *documentBackgroundColor;

  documentBackgroundColor = self->_documentBackgroundColor;
  if (documentBackgroundColor != a3)
  {

    self->_documentBackgroundColor = (NSColor *)objc_msgSend(a3, "copy");
  }
}

- (void)setDefaultTabInterval:(double)a3
{
  self->_defaultTabInterval = a3;
}

- (double)defaultTabInterval
{
  return self->_defaultTabInterval;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_isRTLDocument = a3 == 1;
}

- (int64_t)baseWritingDirection
{
  return self->_isRTLDocument;
}

- (void)setTextFlow:(unint64_t)a3
{
  if (self->_textFlow != a3)
  {
    *(_DWORD *)((char *)&self->_attributeInfo + 42) &= ~0x20u;
    self->_textFlow = a3;
  }
}

- (unint64_t)textFlow
{
  return self->_textFlow;
}

- (int64_t)cocoaPlatform
{
  return self->_cocoaPlatform;
}

- (int64_t)cocoaTextScaling
{
  return self->_cocoaTextScaling;
}

- (void)_setTargetTextScaling:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
    self->_targetTextScaling = a3;
}

- (void)_setSourceTextScaling:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
    self->_sourceTextScaling = a3;
}

- (uint64_t)_ensureTableCells
{
  uint64_t v1;
  id v2;
  NSTextTable *v3;
  unint64_t i;
  NSTextTableBlock *v5;

  if (result)
  {
    v1 = result;
    v2 = *(id *)(result + 2888);
    if (!v2)
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(v1 + 2888) = v2;
    }
    if (!*(_QWORD *)(v1 + 2872))
    {
      v3 = objc_alloc_init(NSTextTable);
      *(_QWORD *)(v1 + 2872) = v3;
      -[NSTextTable setNumberOfColumns:](v3, "setNumberOfColumns:", 1);
      objc_msgSend(*(id *)(v1 + 2872), "setLayoutAlgorithm:", 0);
      objc_msgSend(*(id *)(v1 + 2872), "setCollapsesBorders:", 1);
      objc_msgSend(*(id *)(v1 + 2872), "setHidesEmptyCells:", 0);
      *(_DWORD *)(v1 + 2904) = 0;
      v2 = *(id *)(v1 + 2888);
    }
    result = objc_msgSend(v2, "count");
    for (i = result; i <= *(int *)(v1 + 2908) || i <= *(int *)(v1 + 2912); i = result)
    {
      v5 = -[NSTextTableBlock initWithTable:startingRow:rowSpan:startingColumn:columnSpan:]([NSTextTableBlock alloc], "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", *(_QWORD *)(v1 + 2872), *(int *)(v1 + 2904), 1, i, 1);
      -[NSTextBlock setWidth:type:forLayer:](v5, "setWidth:type:forLayer:", 0, 0, 1.0);
      -[NSTextBlock setWidth:type:forLayer:edge:](v5, "setWidth:type:forLayer:edge:", 0, -1, 0, 5.0);
      -[NSTextBlock setWidth:type:forLayer:edge:](v5, "setWidth:type:forLayer:edge:", 0, -1, 2, 5.0);
      -[NSTextBlock setVerticalAlignment:](v5, "setVerticalAlignment:", 1);
      -[NSTextBlock setBorderColor:](v5, "setBorderColor:", objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedWhite:alpha:", 0.75, 1.0));
      objc_msgSend(*(id *)(v1 + 2888), "addObject:", v5);

      result = objc_msgSend(*(id *)(v1 + 2888), "count");
    }
  }
  return result;
}

- (uint64_t)_beginTableRow
{
  uint64_t v1;
  uint64_t v2;
  NSTextTable *v3;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 2888))
      *(_QWORD *)(result + 2888) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!*(_QWORD *)(v1 + 2872))
    {
      v2 = *(_QWORD *)(v1 + 2880);
      if (v2)
      {
        *(_QWORD *)(v1 + 2872) = v2;
        *(_QWORD *)(v1 + 2880) = 0;
      }
      else
      {
        v3 = objc_alloc_init(NSTextTable);
        *(_QWORD *)(v1 + 2872) = v3;
        -[NSTextTable setNumberOfColumns:](v3, "setNumberOfColumns:", 1);
        objc_msgSend(*(id *)(v1 + 2872), "setLayoutAlgorithm:", 0);
        objc_msgSend(*(id *)(v1 + 2872), "setCollapsesBorders:", 1);
        objc_msgSend(*(id *)(v1 + 2872), "setHidesEmptyCells:", 0);
        *(_DWORD *)(v1 + 2904) = 0;
      }
    }
    *(_QWORD *)(v1 + 2908) = 0;
    return -[NSRTFReader _ensureTableCells](v1);
  }
  return result;
}

- (id)_currentTable
{
  return self->_currentTable;
}

- (id)_currentTableCell
{
  if (!self->_currentTable)
    return 0;
  -[NSRTFReader _ensureTableCells]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_currentRowArray, "objectAtIndex:", self->_currentDefinitionColumn);
}

- (unint64_t)_currentBorderEdge
{
  return self->_currentBorderEdge;
}

- (BOOL)_currentBorderIsTable
{
  return self->_currentBorderIsTable;
}

- (BOOL)_currentTableCellIsPlaceholder
{
  NSTextTable *currentTable;
  uint64_t v4;
  int currentColumn;
  uint64_t v6;
  NSMutableArray *previousRowArray;

  currentTable = self->_currentTable;
  if (currentTable)
  {
    -[NSRTFReader _ensureTableCells]((uint64_t)self);
    v4 = -[NSMutableArray objectAtIndex:](self->_currentRowArray, "objectAtIndex:", self->_currentColumn);
    currentColumn = self->_currentColumn;
    v6 = (currentColumn - 1);
    if (currentColumn >= 1 && -[NSMutableArray objectAtIndex:](self->_currentRowArray, "objectAtIndex:", v6) == v4)
    {
      LOBYTE(currentTable) = 1;
    }
    else
    {
      previousRowArray = self->_previousRowArray;
      LOBYTE(currentTable) = previousRowArray
                          && -[NSMutableArray count](previousRowArray, "count", v6) > (unint64_t)self->_currentColumn
                          && -[NSMutableArray objectAtIndex:](self->_previousRowArray, "objectAtIndex:") == v4;
    }
  }
  if (self->_setTableCells)
    return (char)currentTable;
  else
    return 1;
}

- (void)_setCurrentBorderEdge:(unint64_t)a3 isTable:(BOOL)a4
{
  self->_currentBorderEdge = a3;
  self->_currentBorderIsTable = a4;
}

- (void)_pushTableState
{
  NSRTFReaderTableState *v2;
  id v3;
  NSRTFReaderTableState *v4;

  if (a1)
  {
    v4 = objc_alloc_init(NSRTFReaderTableState);
    -[NSRTFReader _ensureTableCells](a1);
    v2 = v4;
    v4->_currentTable = *(NSTextTable **)(a1 + 2872);
    v4->_previousTable = *(NSTextTable **)(a1 + 2880);
    v4->_currentRowArray = *(NSMutableArray **)(a1 + 2888);
    v4->_previousRowArray = *(NSMutableArray **)(a1 + 2896);
    v4->_currentRow = *(_DWORD *)(a1 + 2904);
    v4->_currentColumn = *(_DWORD *)(a1 + 2908);
    v4->_currentDefinitionColumn = *(_DWORD *)(a1 + 2912);
    v4->_currentRowIsLast = *(_BYTE *)(a1 + 2916);
    *(_OWORD *)(a1 + 2901) = 0u;
    *(_OWORD *)(a1 + 2872) = 0u;
    *(_OWORD *)(a1 + 2888) = 0u;
    v3 = *(id *)(a1 + 2864);
    if (!v3)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v2 = v4;
      *(_QWORD *)(a1 + 2864) = v3;
    }
    objc_msgSend(v3, "addObject:", v2);

  }
}

- (void)_popTableState
{
  uint64_t v2;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 2864), "lastObject");

    if (v2)
    {
      *(_QWORD *)(a1 + 2872) = *(id *)(v2 + 8);
      *(_QWORD *)(a1 + 2880) = *(id *)(v2 + 16);
      *(_QWORD *)(a1 + 2888) = *(id *)(v2 + 24);
      *(_QWORD *)(a1 + 2896) = *(id *)(v2 + 32);
      *(_DWORD *)(a1 + 2904) = *(_DWORD *)(v2 + 40);
      *(_DWORD *)(a1 + 2908) = *(_DWORD *)(v2 + 44);
      *(_DWORD *)(a1 + 2912) = *(_DWORD *)(v2 + 48);
      *(_BYTE *)(a1 + 2916) = *(_BYTE *)(v2 + 52);
    }
    else
    {
      *(_OWORD *)(a1 + 2872) = 0u;
      *(_OWORD *)(a1 + 2888) = 0u;
    }
    objc_msgSend(*(id *)(a1 + 2864), "removeLastObject");
    if (!objc_msgSend(*(id *)(a1 + 2864), "count"))
    {

      *(_QWORD *)(a1 + 2864) = 0;
    }
  }
}

- (uint64_t)_setTableCells
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t i;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 2864);
    if (v2)
    {
      v3 = objc_msgSend(v2, "count");

      if (v3)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        for (i = 0; i != v3; ++i)
        {
          v6 = objc_msgSend(*(id *)(v1 + 2864), "objectAtIndex:", i);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", *(int *)(v6 + 44)));
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(v1 + 2888), "objectAtIndex:", *(int *)(v1 + 2908)));
        goto LABEL_9;
      }
    }
    else
    {

    }
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(*(id *)(v1 + 2888), "objectAtIndex:", *(int *)(v1 + 2908)), 0);
LABEL_9:
    *(_QWORD *)(v1 + 2856) = v4;
    result = objc_msgSend((id)objc_msgSend((id)v1, "_mutableParagraphStyle"), "setTextBlocks:", *(_QWORD *)(v1 + 2856));
    *(_BYTE *)(v1 + 2917) = 1;
  }
  return result;
}

- (uint64_t)_clearTableCells
{
  uint64_t v1;

  if (result)
  {
    v1 = result;

    *(_QWORD *)(v1 + 2856) = 0;
    result = objc_msgSend((id)objc_msgSend((id)v1, "_mutableParagraphStyle"), "setTextBlocks:", *(_QWORD *)(v1 + 2856));
    *(_BYTE *)(v1 + 2917) = 0;
  }
  return result;
}

- (void)_setTableNestingLevel:(int64_t)a3
{
  unint64_t nestedTables;
  unint64_t v6;
  unint64_t i;
  uint64_t v8;

  nestedTables = (unint64_t)self->_nestedTables;
  if (nestedTables)
    nestedTables = objc_msgSend((id)nestedTables, "count");
  if (a3 <= 1)
    v6 = 1;
  else
    v6 = a3;
  if (nestedTables + 1 >= v6)
  {
    if (nestedTables + 1 > v6)
    {
      if (nestedTables + 1 - v6 <= 1)
        v8 = 1;
      else
        v8 = nestedTables + 1 - v6;
      do
      {
        -[NSRTFReader _popTableState]((uint64_t)self);
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    for (i = v6 + ~nestedTables; i; --i)
      -[NSRTFReader _pushTableState]((uint64_t)self);
  }
  if (a3 < 1)
  {
    -[NSRTFReader _clearTableCells]((uint64_t)self);

    *(_OWORD *)((char *)&self->_previousRowArray + 5) = 0u;
    *(_OWORD *)&self->_currentTable = 0u;
    *(_OWORD *)&self->_currentRowArray = 0u;
  }
  else
  {
    if (!self->_currentTable)
      -[NSRTFReader _beginTableRow]((uint64_t)self);
    -[NSRTFReader _ensureTableCells]((uint64_t)self);
    -[NSRTFReader _setTableCells]((uint64_t)self);
  }
}

- (void)_endTableCellDefinition
{
  if (!self->_currentTable)
    -[NSRTFReader _beginTableRow]((uint64_t)self);
  ++self->_currentDefinitionColumn;
  -[NSRTFReader _ensureTableCells]((uint64_t)self);
}

- (void)_paragraphInTable
{
  if (!self->_currentTable)
    -[NSRTFReader _beginTableRow]((uint64_t)self);
  -[NSRTFReader _ensureTableCells]((uint64_t)self);
  -[NSRTFReader _setTableCells]((uint64_t)self);
}

- (void)_endTableCell
{
  NSTextTable *currentTable;

  currentTable = self->_currentTable;
  if (!currentTable)
  {
    -[NSRTFReader _beginTableRow]((uint64_t)self);
    currentTable = self->_currentTable;
  }
  ++self->_currentColumn;
  if (-[NSTextTable numberOfColumns](currentTable, "numberOfColumns") < self->_currentColumn)
    -[NSTextTable setNumberOfColumns:](self->_currentTable, "setNumberOfColumns:");
  -[NSRTFReader _ensureTableCells]((uint64_t)self);
  -[NSRTFReader _setTableCells]((uint64_t)self);
}

- (void)_lastTableRow
{
  self->_currentRowIsLast = 1;
}

- (void)_endTableRow
{
  NSTextTable *currentTable;

  -[NSRTFReader _clearTableCells]((uint64_t)self);
  ++self->_currentRow;
  *(_QWORD *)&self->_currentColumn = 0;

  currentTable = self->_currentTable;
  if (self->_currentRowIsLast)
  {

    self->_currentRow = 0;
    *(_OWORD *)&self->_currentTable = 0u;
    *(_OWORD *)&self->_currentRowArray = 0u;
    if (-[NSMutableArray count](self->_nestedTables, "count"))
      -[NSRTFReader _popTableState]((uint64_t)self);
  }
  else
  {
    self->_previousTable = currentTable;
    self->_previousRowArray = self->_currentRowArray;
    self->_currentTable = 0;
    self->_currentRowArray = 0;
  }
  self->_currentRowIsLast = 0;
}

- (void)_mergeTableCellsHorizontally
{
  int currentDefinitionColumn;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  currentDefinitionColumn = self->_currentDefinitionColumn;
  if (currentDefinitionColumn >= 1)
  {
    v4 = (void *)-[NSMutableArray objectAtIndex:](self->_currentRowArray, "objectAtIndex:", (currentDefinitionColumn - 1));
    v5 = objc_msgSend(v4, "startingColumn");
    v6 = objc_msgSend(v4, "columnSpan");
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_currentRowArray, "replaceObjectAtIndex:withObject:", self->_currentDefinitionColumn, v4);
    v7 = self->_currentDefinitionColumn;
    if (v6 + v5 <= v7)
      objc_msgSend(v4, "_setColumnSpan:", v7 - v5 + 1);
  }
}

- (void)_mergeTableCellsVertically
{
  NSMutableArray *previousRowArray;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t currentRow;

  if (self->_currentRow >= 1)
  {
    previousRowArray = self->_previousRowArray;
    if (previousRowArray)
    {
      if (-[NSMutableArray count](previousRowArray, "count") > (unint64_t)self->_currentDefinitionColumn)
      {
        v4 = (void *)-[NSMutableArray objectAtIndex:](self->_previousRowArray, "objectAtIndex:");
        v5 = objc_msgSend(v4, "startingRow");
        v6 = objc_msgSend(v4, "rowSpan");
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_currentRowArray, "replaceObjectAtIndex:withObject:", self->_currentDefinitionColumn, v4);
        currentRow = self->_currentRow;
        if (v6 + v5 <= currentRow)
          objc_msgSend(v4, "_setRowSpan:", currentRow - v5 + 1);
      }
    }
  }
}

- (id)documentAttributes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int viewScale;
  int cocoaVersion;
  NSColor *documentBackgroundColor;
  NSMutableArray *layoutOrientationSections;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0C99E08];
  v15 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", self->_paperSize.width, self->_paperSize.height);
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lMargin);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rMargin);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tMargin);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bMargin);
  v5 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", self->_tMargin, self->_lMargin, self->_bMargin, self->_rMargin);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_hyphenationFactor);
  v7 = (void *)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v15, CFSTR("PaperSize"), v14, CFSTR("LeftMargin"), v13, CFSTR("RightMargin"), v3, CFSTR("TopMargin"), v4, CFSTR("BottomMargin"), v5, CFSTR("PaperMargin"), v6, CFSTR("HyphenationFactor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultTabInterval), CFSTR("DefaultTabInterval"), 0);
  if (!NSEqualSizes(self->_viewSize, *MEMORY[0x1E0CB3440]))
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", self->_viewSize.width, self->_viewSize.height), CFSTR("ViewSize"));
  viewScale = self->_viewScale;
  if (viewScale != 100)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)viewScale), CFSTR("ViewZoom"));
  if (self->_viewKind)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("ViewMode"));
  cocoaVersion = self->_cocoaVersion;
  if (cocoaVersion == -1 || cocoaVersion >= 1)
  {
    if (cocoaVersion == -1)
      cocoaVersion = 80;
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_cocoaSubVersion / 1000.0 + (double)cocoaVersion), 0x1E26138B0);
  }
  if (self->_readOnly)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("ReadOnly"));
  documentBackgroundColor = self->_documentBackgroundColor;
  if (documentBackgroundColor)
    objc_msgSend(v7, "setObject:forKey:", documentBackgroundColor, CFSTR("BackgroundColor"));
  if (self->_isRTLDocument)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("RightToLeftDocument"));
  if (self->_readLimit >= 1 && self->_private.rtfHeaderEndLocation)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), CFSTR("NSRTFHeaderEndLocation"));
  if (self->_documentInfoDictionary)
    objc_msgSend(v7, "addEntriesFromDictionary:");
  layoutOrientationSections = self->_layoutOrientationSections;
  if (layoutOrientationSections)
    objc_msgSend(v7, "setObject:forKey:", layoutOrientationSections, CFSTR("NSTextLayoutSectionsAttribute"));
  if ((self->_cocoaTextScaling & 0x8000000000000000) == 0)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), CFSTR("TextScaling"));
  return v7;
}

- (void)setMutableAttributedString:(id)a3
{
  NSMutableAttributedString *topAttributedString;
  uint64_t v6;
  NSMutableAttributedString *v7;

  topAttributedString = self->_topAttributedString;
  if (topAttributedString != a3)
  {
    if (topAttributedString)
    {
      v6 = -[NSMutableAttributedString length](topAttributedString, "length");
      v7 = self->_topAttributedString;
      if (v6)
      {
        objc_msgSend(a3, "setAttributedString:", v7);
        v7 = self->_topAttributedString;
      }
    }
    else
    {
      v7 = 0;
    }

    self->_topAttributedString = (NSMutableAttributedString *)a3;
  }
}

- (id)mutableAttributedString
{
  return self->_topAttributedString;
}

- (id)mutableAttributes
{
  _NSAttributeInfo *v3;
  int v4;
  id result;

  v3 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  *(_DWORD *)((char *)&self->_attributeInfo + 42) = v4 & 0xFFFFFFDF;
  result = self->_curAttributes;
  if ((v4 & 0x4000) != 0)
  {
    result = (id)objc_msgSend(result, "mutableCopy");
    self->_curAttributes = (NSMutableDictionary *)result;
    v3->toUniCharEncoding &= ~0x4000u;
  }
  return result;
}

- (id)defaultParagraphStyle
{
  id result;
  id v3;
  NSMutableParagraphStyle *v4;

  result = (id)defaultParagraphStyle_defaultParagraphStyle;
  if (!defaultParagraphStyle_defaultParagraphStyle)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v4 = objc_alloc_init(NSMutableParagraphStyle);
    -[NSMutableParagraphStyle setTabStops:](v4, "setTabStops:", v3);
    -[NSMutableParagraphStyle setBaseWritingDirection:](v4, "setBaseWritingDirection:", 0);
    -[NSMutableParagraphStyle setAlignment:](v4, "setAlignment:", 0);
    while (!__ldaxr((unint64_t *)&defaultParagraphStyle_defaultParagraphStyle))
    {
      if (!__stlxr((unint64_t)v4, (unint64_t *)&defaultParagraphStyle_defaultParagraphStyle))
        goto LABEL_7;
    }
    __clrex();

LABEL_7:
    return (id)defaultParagraphStyle_defaultParagraphStyle;
  }
  return result;
}

- (id)_mutableParagraphStyle
{
  id result;
  unsigned int v4;
  NSMutableParagraphStyle *v5;

  result = self->_attributeInfo.paraStyle;
  if (result)
  {
    v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
    if ((v4 & 0x8000) != 0)
    {
      result = (id)objc_msgSend(result, "mutableCopy");
      self->_attributeInfo.paraStyle = (NSMutableParagraphStyle *)result;
      v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42) & 0xFFFF7FFF;
    }
  }
  else
  {
    v5 = (NSMutableParagraphStyle *)objc_msgSend(-[NSRTFReader defaultParagraphStyle](self, "defaultParagraphStyle"), "mutableCopyWithZone:", -[NSRTFReader zone](self, "zone"));
    self->_attributeInfo.paraStyle = v5;
    -[NSMutableParagraphStyle setDefaultTabInterval:](v5, "setDefaultTabInterval:", self->_defaultTabInterval);
    if (self->_isRTLDocument)
      -[NSMutableParagraphStyle setBaseWritingDirection:](self->_attributeInfo.paraStyle, "setBaseWritingDirection:", 1);
    v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42) & 0xFFFF7FFF;
    result = self->_attributeInfo.paraStyle;
  }
  *(_DWORD *)((char *)&self->_attributeInfo + 42) = v4 & 0xFFFFFFF7;
  return result;
}

- (id)attributedStringToEndOfGroup
{
  unsigned int level;
  NSMutableAttributedString *curAttributedString;
  NSMutableAttributedString *v5;

  level = self->_level;
  curAttributedString = self->_curAttributedString;
  v5 = (NSMutableAttributedString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3778], "allocWithZone:", -[NSRTFReader zone](self, "zone")), "init");
  self->_curAttributedString = v5;
  do
  {
    if (_NSRTFGetToken(&self->_private) == 4)
      break;
    _NSRTFRouteToken((uint64_t)&self->_private);
    if (self->_level < level)
      break;
  }
  while (!self->_limitReached);
  self->_curAttributedString = curAttributedString;
  return v5;
}

- (id)attributedString
{
  unsigned int level;
  NSMutableAttributedString *topAttributedString;
  NSMutableArray *layoutOrientationSections;
  void *v6;
  uint64_t v7;

  level = self->_level;
  topAttributedString = self->_topAttributedString;
  self->_curAttributedString = topAttributedString;
  -[NSMutableAttributedString beginEditing](topAttributedString, "beginEditing");
  do
  {
    if (_NSRTFGetToken(&self->_private) == 4)
      break;
    _NSRTFRouteToken((uint64_t)&self->_private);
    if (self->_level < level)
      break;
  }
  while (!self->_limitReached);
  -[NSMutableAttributedString endEditing](self->_topAttributedString, "endEditing");
  if (self->_verticalOrientationLocation != 0x7FFFFFFFFFFFFFFFLL)
  {
    layoutOrientationSections = self->_layoutOrientationSections;
    if (!layoutOrientationSections)
    {
      layoutOrientationSections = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      self->_layoutOrientationSections = layoutOrientationSections;
    }
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    -[NSMutableArray addObject:](layoutOrientationSections, "addObject:", objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("NSTextLayoutSectionOrientation"), objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_verticalOrientationLocation, -[NSMutableAttributedString length](self->_curAttributedString, "length") - self->_verticalOrientationLocation), CFSTR("NSTextLayoutSectionRange"), 0));
  }
  if (self->_private.class == 4)
    return 0;
  else
    return self->_topAttributedString;
}

- (id)attributesAtEndOfGroup
{
  id v3;
  unsigned int level;
  _NSRTFPriv *p_private;

  v3 = 0;
  level = self->_level;
  p_private = &self->_private;
  do
  {
    if (_NSRTFGetToken(p_private) == 4)
      break;
    if (self->_private.class == 1 && self->_private.major == 1 && self->_level == level)
    {
      -[NSRTFReader _updateAttributes](self, "_updateAttributes");
      v3 = (id)objc_msgSend(-[NSRTFReader mutableAttributes](self, "mutableAttributes"), "copyWithZone:", -[NSRTFReader zone](self, "zone"));
    }
    _NSRTFRouteToken((uint64_t)p_private);
  }
  while (self->_level >= level);
  return v3;
}

- (uint64_t)_documentInfoDictionary
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 472);
    if (!result)
    {
      result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
      *(_QWORD *)(v1 + 472) = result;
    }
  }
  return result;
}

- (uint64_t)_determineSourceTextScalingType
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  double v4;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 2968);
    if ((result & 0x8000000000000000) == 0)
      goto LABEL_14;
    v2 = *(_QWORD *)(v1 + 2984);
    result = *(_QWORD *)(v1 + 2992);
    if ((result & 0x8000000000000000) == 0 && (v2 & 0x8000000000000000) == 0)
      goto LABEL_14;
    v3 = *(_DWORD *)(v1 + 340);
    if (v3 == -1)
      v3 = 80;
    v4 = (double)*(int *)(v1 + 344) / 1000.0 + (double)v3;
    if (v4 <= 80.0)
    {
      if (!v2)
      {
        result = 1;
        goto LABEL_14;
      }
    }
    else
    {
      if (v4 < 2466.0)
      {
        result = dyld_program_sdk_at_least() ^ 1;
LABEL_14:
        *(_QWORD *)(v1 + 2992) = result;
        return result;
      }
      result = *(_QWORD *)(v1 + 2984);
      if ((v2 & 0x8000000000000000) == 0)
        goto LABEL_14;
    }
    result = _NSTextScalingTypeForCurrentEnvironment();
    goto LABEL_14;
  }
  return result;
}

- (uint64_t)_determineFinalTextScalingType
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = (_QWORD *)result;
    result = _NSTextScalingTypeForCurrentEnvironment();
    v2 = result;
    if (result < 0)
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__determineFinalTextScalingType, v1, CFSTR("NSRTFReader.m"), 1173, CFSTR("Scaling type for current environment must be >= 0"));
    v3 = v1[373];
    if (v3 < 2 || (v3 = v2, v2 <= 1))
    {
      v1[371] = v3;
      v2 = v3;
    }
    v1[375] = v2;
  }
  return result;
}

- (double)_updateFontSizeForTextScalingIfNeeded:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0.0;
  if ((*(_QWORD *)(a1 + 2992) & 0x8000000000000000) != 0)
    -[NSRTFReader _determineSourceTextScalingType](a1);
  v4 = *(_QWORD *)(a1 + 3000);
  if (v4 < 0)
  {
    -[NSRTFReader _determineFinalTextScalingType](a1);
    v4 = *(_QWORD *)(a1 + 3000);
  }
  v5 = *(_QWORD *)(a1 + 2992);
  if (v5 == v4)
    return a2;
  return _NSTextScalingConvertFontPointSize(v5, v4, a2);
}

- (void)_updateAttributes
{
  unsigned int *v3;
  int v4;
  double v5;
  NSFont *font;
  unsigned int v7;
  NSMutableDictionary *curAttributes;
  NSMutableParagraphStyle *paraStyle;
  NSArray *v10;
  id v11;
  unsigned int v12;
  NSMutableDictionary *v13;
  double kern;
  unsigned int v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  double v19;
  unsigned int v20;
  int fontPalette;
  UIFontDescriptor *v22;
  UIFontDescriptorSymbolicTraits v23;
  unsigned int v24;
  double v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = (unsigned int *)((char *)&self->_attributeInfo + 42);
  v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((v4 & 4) != 0)
  {
    if ((v4 & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    if (self->_readLimit <= 0
      && (v5 = -[NSRTFReader _updateFontSizeForTextScalingIfNeeded:]((uint64_t)self, self->_attributeInfo.fontSize),
          self->_readLimit < 1))
    {
      v19 = v5;
      font = self->_attributeInfo.font;
      v20 = *v3;
      fontPalette = (unsigned __int16)self->_attributeInfo.fontPalette;
      v22 = -[UIFont fontDescriptor](font, "fontDescriptor");
      v23 = -[UIFontDescriptor symbolicTraits](v22, "symbolicTraits");
      v24 = __rbit32(v20) >> 30;
      if (fontPalette)
      {
        v26 = *MEMORY[0x1E0CA83A8];
        v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)fontPalette);
        v22 = -[UIFontDescriptor fontDescriptorByAddingAttributes:](v22, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
      }
      if ((v24 & ~v23) != 0)
        v22 = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v22, "fontDescriptorWithSymbolicTraits:", v23 & 0xF0000000 | v24);
      if (!-[UIFontDescriptor isEqual:](-[UIFont fontDescriptor](font, "fontDescriptor"), "isEqual:", v22)|| (-[UIFont pointSize](font, "pointSize"), v25 != v19))
      {
        font = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v22, v19);
      }
    }
    else
    {
      font = self->_attributeInfo.font;
    }
    v7 = *v3;
    if (font)
    {
      *v3 = v7 & 0xFFFFFFDF;
      curAttributes = self->_curAttributes;
      if ((v7 & 0x4000) != 0)
      {
        curAttributes = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](curAttributes, "mutableCopy");
        self->_curAttributes = curAttributes;
        *v3 &= ~0x4000u;
      }
      -[NSMutableDictionary setObject:forKey:](curAttributes, "setObject:forKey:", font, CFSTR("NSFont"));
      v7 = *v3;
    }
    v4 = v7 | 4;
    *v3 = v4;
    if ((v4 & 8) != 0)
    {
LABEL_3:
      if ((v4 & 0x10) != 0)
        return;
      goto LABEL_22;
    }
  }
  paraStyle = self->_attributeInfo.paraStyle;
  if (paraStyle)
  {
    v10 = -[NSParagraphStyle textBlocks](self->_attributeInfo.paraStyle, "textBlocks");
    if (v10 == self->_textBlocks || (-[NSArray isEqual:](v10, "isEqual:") & 1) != 0)
    {
      v11 = -[NSMutableParagraphStyle copyWithZone:](paraStyle, "copyWithZone:", -[NSRTFReader zone](self, "zone"));
    }
    else
    {
      v11 = -[NSParagraphStyle mutableCopyWithZone:](paraStyle, "mutableCopyWithZone:", -[NSRTFReader zone](self, "zone"));
      objc_msgSend(v11, "setTextBlocks:", self->_textBlocks);
    }
    v12 = *v3;
    *v3 &= ~0x20u;
    v13 = self->_curAttributes;
    if ((v12 & 0x4000) != 0)
    {
      v13 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v13, "mutableCopy");
      self->_curAttributes = v13;
      *v3 &= ~0x4000u;
    }
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v11, CFSTR("NSParagraphStyle"));

    v4 = *v3;
  }
  v4 |= 8u;
  *v3 = v4;
  if ((v4 & 0x10) == 0)
  {
LABEL_22:
    kern = self->_attributeInfo.kern;
    v15 = v4 & 0xFFFFFFDF;
    if (kern == 0.0)
    {
      *v3 = v15;
      v16 = self->_curAttributes;
      if ((v4 & 0x4000) != 0)
      {
        v16 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v16, "mutableCopy");
        self->_curAttributes = v16;
        *v3 &= ~0x4000u;
      }
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", CFSTR("NSKern"));
    }
    else
    {
      *v3 = v15;
      v17 = self->_curAttributes;
      if (kern == -100000.0)
      {
        if ((v4 & 0x4000) != 0)
        {
          v17 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_curAttributes, "mutableCopy");
          self->_curAttributes = v17;
          *v3 &= ~0x4000u;
        }
        v18 = (void *)MEMORY[0x1E0CB37E8];
        kern = 0.0;
      }
      else
      {
        if ((v4 & 0x4000) != 0)
        {
          v17 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_curAttributes, "mutableCopy");
          self->_curAttributes = v17;
          *v3 &= ~0x4000u;
          kern = self->_attributeInfo.kern;
        }
        v18 = (void *)MEMORY[0x1E0CB37E8];
      }
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", objc_msgSend(v18, "numberWithDouble:", kern), CFSTR("NSKern"));
    }
    *v3 |= 0x10u;
  }
}

- (int64_t)_currentListNumber
{
  return self->_currentListNumber;
}

- (void)_setCurrentListNumber:(int64_t)a3
{
  self->_currentListNumber = a3;
}

- (int64_t)_currentListLevel
{
  return self->_currentListLevel;
}

- (void)_setCurrentListLevel:(int64_t)a3
{
  self->_currentListLevel = a3;
}

- (id)_listDefinitions
{
  return self->_listDefinitions;
}

- (void)_addListDefinition:(id)a3 forKey:(int64_t)a4
{
  NSMutableDictionary *listDefinitions;
  uint64_t v8;

  listDefinitions = self->_listDefinitions;
  if (!listDefinitions)
  {
    listDefinitions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_listDefinitions = listDefinitions;
  }
  v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a3);
  -[NSMutableDictionary setObject:forKey:](listDefinitions, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
}

- (void)_addOverride:(int64_t)a3 forKey:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_listDefinitions, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
  v7 = objc_msgSend(v6, "count");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = v7;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0;
    do
    {
      v12 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v11), "copy");
      objc_msgSend(v10, "addObject:", v12);

      ++v11;
    }
    while (v9 != v11);
    -[NSRTFReader _addListDefinition:forKey:](self, "_addListDefinition:forKey:", v10, a3);
  }
}

- (void)processString:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  _NSAttributeInfo *v7;
  unsigned int toUniCharEncoding;
  NSTextTable *previousTable;
  int64_t readLimit;
  int64_t thumbnailLimit;
  void *v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  NSMutableAttributedString *curAttributedString;
  uint64_t v19;
  uint64_t v20;
  int textFlow;
  NSMutableArray *layoutOrientationSections;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = -[NSMutableAttributedString length](self->_curAttributedString, "length");
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_curAttributedString, "replaceCharactersInRange:withString:", v5, 0, a3);
  v6 = -[NSMutableAttributedString length](self->_curAttributedString, "length");
  v7 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  toUniCharEncoding = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((~toUniCharEncoding & 0x1C) != 0)
  {
    -[NSRTFReader _updateAttributes](self, "_updateAttributes");
    toUniCharEncoding = v7->toUniCharEncoding;
  }
  if ((toUniCharEncoding & 0x20) == 0)
  {
    if (self->_readLimit > 0)
      goto LABEL_5;
    -[NSMutableAttributedString setAttributes:range:](self->_curAttributedString, "setAttributes:range:", self->_curAttributes, v5, v6 - v5);
    if (!v5
      || ((v25 = (void *)-[NSMutableAttributedString string](self->_curAttributedString, "string"),
           v12 = (void *)-[NSMutableDictionary objectForKey:](self->_curAttributes, "objectForKey:", CFSTR("NSParagraphStyle")), v13 = -[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_curAttributedString, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v5 - 1, 0), v12)? (v14 = v13 == 0): (v14 = 1), !v14 ? (v15 = v6 > v5) : (v15 = 0), !v15))
    {
LABEL_35:
      textFlow = self->_textFlow;
      if (textFlow == 4)
        goto LABEL_38;
      if (textFlow == 1)
      {
        if (self->_verticalOrientationLocation == 0x7FFFFFFFFFFFFFFFLL)
          self->_verticalOrientationLocation = v5;
        goto LABEL_5;
      }
      if (!self->_textFlow)
      {
LABEL_38:
        if (self->_verticalOrientationLocation != 0x7FFFFFFFFFFFFFFFLL)
        {
          layoutOrientationSections = self->_layoutOrientationSections;
          if (!layoutOrientationSections)
          {
            layoutOrientationSections = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
            self->_layoutOrientationSections = layoutOrientationSections;
          }
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          -[NSMutableArray addObject:](layoutOrientationSections, "addObject:", objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, CFSTR("NSTextLayoutSectionOrientation"), objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_verticalOrientationLocation, v5 - self->_verticalOrientationLocation), CFSTR("NSTextLayoutSectionRange"), 0));
          self->_verticalOrientationLocation = 0x7FFFFFFFFFFFFFFFLL;
          textFlow = self->_textFlow;
        }
        if (textFlow == 4)
          -[NSMutableAttributedString addAttribute:value:range:](self->_curAttributedString, "addAttribute:value:range:", CFSTR("CTVerticalForms"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0), v5, objc_msgSend(a3, "length"));
      }
LABEL_5:
      v7->toUniCharEncoding |= 0x20u;
      goto LABEL_6;
    }
    v16 = v13;
    v17 = objc_msgSend(v25, "characterAtIndex:", v5 - 1);
    if (v17 > 132)
    {
      if ((v17 - 8232) < 2 || v17 == 133)
        goto LABEL_35;
    }
    else if (v17 == 10
           || v17 == 12
           || v17 == 13
           && (v5 >= objc_msgSend(v25, "length") || objc_msgSend(v25, "characterAtIndex:", v5) != 10))
    {
      goto LABEL_35;
    }
    if ((objc_msgSend(v12, "isEqual:", v16) & 1) == 0)
    {
      curAttributedString = self->_curAttributedString;
      v19 = objc_msgSend(v25, "paragraphRangeForRange:", v5, v6 - v5);
      -[NSMutableAttributedString addAttribute:value:range:](curAttributedString, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v12, v19, v20);
    }
    goto LABEL_35;
  }
LABEL_6:
  previousTable = self->_previousTable;
  if (previousTable)
  {

    self->_previousTable = 0;
    self->_currentRow = 0;
  }
  readLimit = self->_readLimit;
  if (readLimit >= 1 && v6 > readLimit)
    self->_limitReached = 1;
  thumbnailLimit = self->_thumbnailLimit;
  if (thumbnailLimit >= 1 && v6 > thumbnailLimit)
    self->_limitReached = 1;
}

- (void)_pushState
{
  ++self->_level;
  -[NSMutableArray addObject:](self->_attributesStack, "addObject:", self->_curAttributes);
  -[NSMutableData appendBytes:length:](self->_attributeInfoStack, "appendBytes:length:", &self->_attributeInfo, 48);
  *(_DWORD *)((char *)&self->_attributeInfo + 42) |= 0xC000u;
}

- (void)_popState
{
  _NSAttributeInfo *v3;
  unsigned int toUniCharEncoding;

  --self->_level;
  v3 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  toUniCharEncoding = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((toUniCharEncoding & 0x4000) == 0)
  {

    toUniCharEncoding = v3->toUniCharEncoding;
  }
  if ((toUniCharEncoding & 0x8000) == 0)

  self->_curAttributes = (NSMutableDictionary *)-[NSMutableArray lastObject](self->_attributesStack, "lastObject");
  -[NSMutableArray removeLastObject](self->_attributesStack, "removeLastObject");
  -[NSMutableData getBytes:range:](self->_attributeInfoStack, "getBytes:range:", &self->_attributeInfo, 48 * self->_level, 48);
  -[NSMutableData setLength:](self->_attributeInfoStack, "setLength:", 48 * self->_level);
  v3->toUniCharEncoding &= ~0x20u;
}

- (void)dealloc
{
  NSMapTable *cachedRTFFontTable;
  objc_super v4;

  _NSRTFDealloc(&self->_private, a2);

  cachedRTFFontTable = self->_cachedRTFFontTable;
  if (cachedRTFFontTable)
    NSFreeMapTable(cachedRTFFontTable);
  v4.receiver = self;
  v4.super_class = (Class)NSRTFReader;
  -[NSRTFReader dealloc](&v4, sel_dealloc);
}

- (void)finalize
{
  NSMapTable *cachedRTFFontTable;
  objc_super v4;

  _NSRTFDealloc(&self->_private, a2);

  cachedRTFFontTable = self->_cachedRTFFontTable;
  if (cachedRTFFontTable)
    NSFreeMapTable(cachedRTFFontTable);
  v4.receiver = self;
  v4.super_class = (Class)NSRTFReader;
  -[NSRTFReader finalize](&v4, sel_finalize);
}

+ (NSArray)defaultTextHighlightStyles
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("NSTextHighlightStyleDefault");
  v3[1] = CFSTR("NSTextHighlightStyleOutlined");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
}

+ (NSArray)defaultTextHighlightColorSchemes
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("NSTextHighlightColorSchemePurple");
  v3[1] = CFSTR("NSTextHighlightColorSchemePink");
  v3[2] = CFSTR("NSTextHighlightColorSchemeOrange");
  v3[3] = CFSTR("NSTextHighlightColorSchemeMint");
  v3[4] = CFSTR("NSTextHighlightColorSchemeBlue");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

@end
