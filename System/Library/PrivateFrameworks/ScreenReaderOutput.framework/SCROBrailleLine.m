@implementation SCROBrailleLine

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const __int16 *v6;
  int16x8_t v7;
  UniChar v8[256];
  _WORD v9[4];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v9[0] = kSCROBrailleUnicodeCharacterSpace;
    v9[1] = kSCROBrailleUnicodeCharacterDot7;
    v9[2] = kSCROBrailleUnicodeCharacterDot8;
    v9[3] = kSCROBrailleUnicodeCharacterDot78;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", v9, 4);
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_WhitespaceSet;
    _WhitespaceSet = v3;

    v5 = 0;
    v6 = &kSCROBrailleUnicodeCharacterBase;
    v7 = vld1q_dup_s16(v6);
    do
    {
      *(int16x8_t *)&v8[v5] = v7;
      v5 += 8;
    }
    while (v5 != 256);
    _SpaceString = (uint64_t)CFStringCreateWithCharacters(0, v8, 256);

  }
}

- (SCROBrailleLine)initWithDriver:(id)a3 mainSize:(int64_t)a4 statusSize:(int64_t)a5
{
  id v9;
  SCROBrailleLine *v10;
  SCROBrailleLine *v11;
  NSMutableAttributedString *v12;
  NSMutableAttributedString *lineBuffer;
  uint64_t v14;
  NSMutableArray *pendingBrailleStringDictionaries;
  SCROBrailleLineVirtualStatus *v16;
  SCROBrailleLineVirtualStatus *virtualStatus;
  char v18;
  SCRO2DBraillePlane *v19;
  SCRO2DBraillePlane *braillePlane;
  NSLock *v21;
  NSLock *flushLock;
  void *v23;
  objc_super v25;

  v9 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SCROBrailleLine;
  v10 = -[SCROBrailleLine init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_brailleDriver, a3);
    v12 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x24BDD1688]);
    lineBuffer = v11->_lineBuffer;
    v11->_lineBuffer = v12;

    v11->_lineOffset = 0;
    v11->_displayMode = 0;
    v11->_focusRange = (_NSRange)xmmword_211601A30;
    v11->_selectionRange = (_NSRange)xmmword_211601A30;
    v11->_suggestionRange = (_NSRange)xmmword_211601A30;
    *(_OWORD *)&v11->_masterStatusCellIndex = xmmword_211601B40;
    v11->_showDotsSevenAndEight = 1;
    v11->_displayEnabled = 1;
    *(_WORD *)&v11->_wordWrapEnabled = 257;
    v11->_blinkEnabled = 1;
    v11->_isUIString = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    pendingBrailleStringDictionaries = v11->_pendingBrailleStringDictionaries;
    v11->_pendingBrailleStringDictionaries = (NSMutableArray *)v14;

    v16 = objc_alloc_init(SCROBrailleLineVirtualStatus);
    virtualStatus = v11->_virtualStatus;
    v11->_virtualStatus = v16;

    -[SCROBrailleLineVirtualStatus setAlignment:](v11->_virtualStatus, "setAlignment:", 0);
    -[SCROBrailleLineVirtualStatus setLength:](v11->_virtualStatus, "setLength:", 0);
    -[SCROBrailleLineVirtualStatus setCells:](v11->_virtualStatus, "setCells:", 0);
    v18 = objc_opt_respondsToSelector();
    v11->_supportsCanvas = v18 & 1;
    if ((v18 & 1) != 0)
    {
      v19 = -[SCRO2DBraillePlane initWithDriver:]([SCRO2DBraillePlane alloc], "initWithDriver:", v11->_brailleDriver);
      braillePlane = v11->_braillePlane;
      v11->_braillePlane = v19;

    }
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    flushLock = v11->_flushLock;
    v11->_flushLock = v21;

    -[SCROBrailleLine setMainSize:](v11, "setMainSize:", a4);
    -[SCROBrailleLine setStatusSize:](v11, "setStatusSize:", a5);
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", v11);

    v11->_inputMode = 1;
  }

  return v11;
}

- (id)imageCanvas
{
  void *v2;

  if (self->_supportsCanvas)
  {
    -[SCROBrailleDriverProtocol canvas](self->_brailleDriver, "canvas");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setImageData:(id)a3
{
  id v4;
  void *v5;

  if (self->_supportsCanvas)
  {
    v4 = a3;
    -[SCROBrailleLine imageCanvas](self, "imageCanvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageData:", v4);

    -[SCROBrailleDriverProtocol displayCanvas](self->_brailleDriver, "displayCanvas");
  }
}

- (NSData)imageData
{
  void *v2;
  void *v3;

  -[SCROBrailleLine imageCanvas](self, "imageCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setPlanarData:(id)a3
{
  if (self->_supportsCanvas)
    -[SCRO2DBraillePlane setBrailleData:](self->_braillePlane, "setBrailleData:", a3);
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  void *v2;
  void *v3;
  unint64_t v4;

  if (!self->_supportsCanvas)
    return 0;
  -[SCROBrailleLine imageCanvas](self, "imageCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfTextLinesAvailable");

  return v4;
}

- (void)dealloc
{
  char *displayBuffer;
  char *mainCellsBuffer;
  char *displayFilter;
  char *blinkerBuffer;
  char *statusFilter;
  objc_super v8;

  displayBuffer = self->_displayBuffer;
  if (displayBuffer)
    free(displayBuffer);
  mainCellsBuffer = self->_mainCellsBuffer;
  if (mainCellsBuffer)
    free(mainCellsBuffer);
  displayFilter = self->_displayFilter;
  if (displayFilter)
    free(displayFilter);
  blinkerBuffer = self->_blinkerBuffer;
  if (blinkerBuffer)
    free(blinkerBuffer);
  statusFilter = self->_statusFilter;
  if (statusFilter)
    free(statusFilter);
  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleLine;
  -[SCROBrailleLine dealloc](&v8, sel_dealloc);
}

- (void)setAppToken:(id)a3
{
  objc_storeStrong(&self->_appToken, a3);
}

- (id)appToken
{
  return self->_appToken;
}

- (void)setMainSize:(int64_t)a3
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;

  if (self->_size != a3)
  {
    self->_size = a3;
    v5 = (char *)malloc_type_realloc(self->_displayBuffer, a3, 0xF2A3ABBDuLL);
    self->_displayBuffer = v5;
    bzero(v5, self->_size);
    v6 = (char *)malloc_type_realloc(self->_mainCellsBuffer, a3, 0x43F3F790uLL);
    self->_mainCellsBuffer = v6;
    bzero(v6, self->_size);
    v7 = (char *)malloc_type_realloc(self->_displayFilter, a3, 0xA88713D3uLL);
    self->_displayFilter = v7;
    bzero(v7, self->_size);
    v8 = (char *)malloc_type_realloc(self->_blinkerBuffer, a3, 0xB3C574F3uLL);
    self->_blinkerBuffer = v8;
    bzero(v8, self->_size);
    -[SCROBrailleLine _updateOffsets](self, "_updateOffsets");
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
    self->_needsFocusFlush = 1;
  }
}

- (void)setStatusSize:(int64_t)a3
{
  char *v4;

  if (self->_statusSize != a3)
  {
    self->_statusSize = a3;
    v4 = (char *)malloc_type_realloc(self->_statusFilter, a3, 0x100004077774924uLL);
    self->_statusFilter = v4;
    bzero(v4, self->_statusSize);
    self->_needsStatusFlush = 1;
  }
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  void *v4;

  if (self->_masterStatusCellIndex != a3)
  {
    self->_masterStatusCellIndex = a3;
    -[SCROBrailleLineVirtualStatus data](self->_virtualStatus, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setVirtualStatus:alignment:](self, "setVirtualStatus:alignment:", v4, -[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment"));

    -[SCROBrailleLine setRealStatus:](self, "setRealStatus:", self->_statusData);
  }
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setRealStatus:(id)a3
{
  id v5;
  BOOL v6;
  unint64_t v7;
  int64_t statusSize;
  void *v9;

  v5 = a3;
  if (self->_statusSize >= 1)
  {
    v9 = v5;
    v6 = -[NSData isEqualToData:](self->_statusData, "isEqualToData:", v5);
    v5 = v9;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_statusData, a3);
      v7 = objc_msgSend(v9, "length");
      bzero(self->_statusFilter, self->_statusSize);
      if (v7 >= self->_statusSize)
        statusSize = self->_statusSize;
      else
        statusSize = v7;
      objc_msgSend(v9, "getBytes:length:", self->_statusFilter, statusSize);
      v5 = v9;
      self->_needsStatusFlush = 1;
    }
  }

}

- (void)setVirtualStatus:(id)a3 alignment:(int)a4
{
  void *v6;
  char v7;
  _BOOL4 v8;
  int64_t v9;
  void *v10;
  SCROBrailleLineVirtualStatus *virtualStatus;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  -[SCROBrailleLineVirtualStatus data](self->_virtualStatus, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToData:", v17);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length");
    -[SCROBrailleLineVirtualStatus setData:](self->_virtualStatus, "setData:", v17);
    -[SCROBrailleLineVirtualStatus data](self->_virtualStatus, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    virtualStatus = self->_virtualStatus;
    if (v10)
    {
      -[SCROBrailleLineVirtualStatus data](virtualStatus, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleLineVirtualStatus setLength:](self->_virtualStatus, "setLength:", objc_msgSend(v12, "length"));

      -[SCROBrailleLineVirtualStatus setCells:](self->_virtualStatus, "setCells:", malloc_type_realloc(-[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells"), -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length"), 0x100004077774924uLL));
      -[SCROBrailleLineVirtualStatus data](self->_virtualStatus, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getBytes:length:", -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells"), -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length"));

    }
    else
    {
      -[SCROBrailleLineVirtualStatus setLength:](virtualStatus, "setLength:", 0);
      if (-[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells"))
      {
        free(-[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells"));
        -[SCROBrailleLineVirtualStatus setCells:](self->_virtualStatus, "setCells:", 0);
      }
    }
    v8 = -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length") != v9;
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
  }
  v14 = -[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment");
  -[SCROBrailleLineVirtualStatus data](self->_virtualStatus, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = a4;
  else
    v16 = 0;
  -[SCROBrailleLineVirtualStatus setAlignment:](self->_virtualStatus, "setAlignment:", v16);

  if (-[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment") == v14)
  {
    if (!v8)
      goto LABEL_16;
  }
  else
  {
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
  }
  -[SCROBrailleLine _updateOffsets](self, "_updateOffsets");
  self->_needsFocusFlush = 1;
LABEL_16:

}

- (BOOL)_allowInset
{
  return self->_size > 11;
}

- (void)_updateOffsets
{
  int displayMode;
  uint64_t v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  self->_leftInset = 0;
  self->_rightInset = 0;
  self->_insetSize = self->_size;
  if (-[SCROBrailleLine _allowInset](self, "_allowInset"))
  {
    displayMode = self->_displayMode;
    if (!displayMode || displayMode == 5)
    {
      v5 = 1;
    }
    else
    {
      v5 = 0;
      *(int64x2_t *)&self->_leftInset = vaddq_s64(*(int64x2_t *)&self->_leftInset, vdupq_n_s64(1uLL));
      self->_insetSize -= 2;
    }
    if (-[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length") >= 1)
    {
      v6 = -[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment");
      v7 = -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length");
      v8 = 64;
      if (!v6)
        v8 = 56;
      *(Class *)((char *)&self->super.isa + v8) = (Class)(*(char **)((char *)&self->super.isa + v8) + v7 + v5);
      self->_insetSize = self->_insetSize - v5 - -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length");
    }
  }
}

- (BOOL)canPanLeft
{
  return self->_lineOffset != 0;
}

- (BOOL)panLeft
{
  _BOOL4 v3;

  v3 = -[SCROBrailleLine canPanLeft](self, "canPanLeft");
  if (v3)
  {
    self->_lineOffset = (self->_lineOffset - self->_insetSize) & ~((self->_lineOffset - self->_insetSize) >> 63);
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3;
}

- (BOOL)canPanRight
{
  int64_t lineOffset;
  int64_t insetSize;

  lineOffset = self->_lineOffset;
  insetSize = self->_insetSize;
  return insetSize + lineOffset < (unint64_t)-[NSMutableAttributedString length](self->_lineBuffer, "length");
}

- (BOOL)panRight
{
  _BOOL4 v3;

  v3 = -[SCROBrailleLine canPanRight](self, "canPanRight");
  if (v3)
  {
    self->_lineOffset += self->_insetSize;
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3;
}

- (BOOL)panBeginning
{
  self->_lineOffset = 0;
  self->_needsDisplayFlush = 1;
  self->_isPanning = 1;
  return 1;
}

- (BOOL)panEnd
{
  unint64_t v3;
  unint64_t insetSize;

  v3 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
  insetSize = self->_insetSize;
  if (v3 > insetSize)
  {
    self->_lineOffset = -[NSMutableAttributedString length](self->_lineBuffer, "length") - self->_insetSize;
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3 > insetSize;
}

- (void)planarPanLeft
{
  if (-[SCROBrailleLine _canPlanarPanLeft](self, "_canPlanarPanLeft"))
  {
    -[SCRO2DBraillePlane panLeft](self->_braillePlane, "panLeft");
    -[SCROBrailleDriverProtocol displayCanvas](self->_brailleDriver, "displayCanvas");
  }
  else
  {
    -[SCROBrailleLine handlePlanarPanFailedIsLeft:](self, "handlePlanarPanFailedIsLeft:", 1);
  }
}

- (void)planarPanRight
{
  if (-[SCROBrailleLine _canPlanarPanRight](self, "_canPlanarPanRight"))
  {
    -[SCRO2DBraillePlane panRight](self->_braillePlane, "panRight");
    -[SCROBrailleDriverProtocol displayCanvas](self->_brailleDriver, "displayCanvas");
  }
  else
  {
    -[SCROBrailleLine handlePlanarPanFailedIsLeft:](self, "handlePlanarPanFailedIsLeft:", 0);
  }
}

- (BOOL)_canPlanarPanLeft
{
  return self->_supportsCanvas && -[SCRO2DBraillePlane canPanLeft](self->_braillePlane, "canPanLeft");
}

- (BOOL)_canPlanarPanRight
{
  return self->_supportsCanvas && -[SCRO2DBraillePlane canPanRight](self->_braillePlane, "canPanRight");
}

- (void)setCurrentUnread:(BOOL)a3
{
  if (self->_currentUnread != a3)
  {
    self->_currentUnread = a3;
    if ((self->_masterStatusCellIndex & 0x8000000000000000) == 0)
      self->_needsStatusFlush = 1;
  }
}

- (BOOL)currentUnread
{
  return self->_currentUnread;
}

- (void)setAnyUnread:(BOOL)a3
{
  if (self->_anyUnread != a3)
  {
    self->_anyUnread = a3;
    if ((self->_masterStatusCellIndex & 0x8000000000000000) == 0)
      self->_needsStatusFlush = 1;
  }
}

- (BOOL)anyUnread
{
  return self->_anyUnread;
}

- (void)setFormatter:(id)a3
{
  id v5;
  char v6;
  void *v7;
  char v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *currentUIString;
  BRLTBrailleStateManager *v15;
  BRLTBrailleStateManager *stateManager;
  uint64_t v17;
  void *v18;
  NSString *inputTableIdentifier;
  void *v20;
  NSString *v21;
  NSString *v22;
  id v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  _BOOL4 editableFieldInterruptedByAlert;
  char v29;
  void *v30;
  char v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[BRLTBrailleStateManager editable](self->_stateManager, "editable");
  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "editable");
  }
  else
  {
    if (!SCROJapaneseBrailleSelected())
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEditing");
  }
  v6 = v8;

LABEL_6:
  if (self->_isUIString)
    self->_previousUILineOffset = self->_lineOffset;
  v9 = objc_msgSend(v5, "displayMode");
  self->_isUIString = v9 == 0;
  if (v9)
    v10 = v6;
  else
    v10 = 0;
  if (v10 || !v9)
    self->_editableFieldInterruptedByAlert = v10;
  self->_lineOffset = objc_msgSend(v5, "lineOffset");
  self->_iBeamLocation = -1;
  -[SCROBrailleLine setShowDotsSevenAndEight:](self, "setShowDotsSevenAndEight:", objc_msgSend(v5, "showDotsSevenAndEight"));
  -[SCROBrailleLine setCurrentUnread:](self, "setCurrentUnread:", objc_msgSend(v5, "currentUnread"));
  -[SCROBrailleLine setAnyUnread:](self, "setAnyUnread:", objc_msgSend(v5, "anyUnread"));
  -[SCROBrailleLine setDisplayMode:](self, "setDisplayMode:", objc_msgSend(v5, "displayMode"));
  objc_msgSend(v5, "appToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleLine setAppToken:](self, "setAppToken:", v11);

  -[SCROBrailleLine setLineFocus:](self, "setLineFocus:", objc_msgSend(v5, "lineFocus"));
  -[SCROBrailleLine setLineOffset:](self, "setLineOffset:", objc_msgSend(v5, "lineOffset"));
  -[SCROBrailleLine setGenerationID:](self, "setGenerationID:", objc_msgSend(v5, "generationID"));
  if (self->_isUIString)
  {
    objc_storeStrong((id *)&self->_previousUIString, self->_currentUIString);
    objc_msgSend(v5, "editString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentUIString = self->_currentUIString;
    self->_currentUIString = v13;

  }
  self->_firstToken = objc_msgSend(v5, "firstToken");
  self->_lastToken = objc_msgSend(v5, "lastToken");
  self->_needsDisplayFlush = 1;
  self->_brailleChunksAreDirty = 1;
  self->_needsFocusFlush = 1;
  objc_msgSend(v5, "stateManager");
  v15 = (BRLTBrailleStateManager *)objc_claimAutoreleasedReturnValue();
  stateManager = self->_stateManager;
  self->_stateManager = v15;

  objc_storeStrong((id *)&self->_brailleFormatter, a3);
  objc_msgSend(v5, "inputTableIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    inputTableIdentifier = self->_inputTableIdentifier;
    objc_msgSend(v5, "inputTableIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(inputTableIdentifier) = -[NSString isEqualToString:](inputTableIdentifier, "isEqualToString:", v20);

    if ((inputTableIdentifier & 1) == 0)
    {
      objc_msgSend(v5, "inputTableIdentifier");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = self->_inputTableIdentifier;
      self->_inputTableIdentifier = v21;

      v23 = objc_alloc(MEMORY[0x24BE0FC60]);
      objc_msgSend(v5, "inputTableIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithIdentifier:", v24);

      if (objc_msgSend(v25, "supportsTranslationMode8Dot"))
      {
        v26 = 2;
      }
      else if (objc_msgSend(v25, "supportsTranslationModeContracted"))
      {
        v26 = 3;
      }
      else
      {
        v26 = 1;
      }
      self->_inputMode = v26;

    }
  }
  objc_msgSend(v5, "addOutputDelegate:", self);
  -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "count"))
  {

    goto LABEL_48;
  }
  editableFieldInterruptedByAlert = self->_editableFieldInterruptedByAlert;

  if (!editableFieldInterruptedByAlert)
  {
    v29 = -[BRLTBrailleStateManager editable](self->_stateManager, "editable");
    if (SCROCustomBrailleEnabled())
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "editable");
    }
    else
    {
      if (!SCROJapaneseBrailleSelected())
      {
        if ((v29 & 1) != 0)
          goto LABEL_32;
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEditing");
    }
    v32 = v31;

    if ((v32 & 1) != 0)
    {
LABEL_32:
      v44 = v5;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v46 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v38;
              objc_msgSend(v39, "pendingBraille");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "modifiers");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[SCROBrailleLine _insertBrailleStringAtCursor:modifiers:silently:](self, "_insertBrailleStringAtCursor:modifiers:silently:", v40, v41, 1);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v38, "isForwardDelete"))
                  -[SCROBrailleLine _forwardDeleteAtCursorSilently:](self, "_forwardDeleteAtCursorSilently:", 1);
                else
                  -[SCROBrailleLine _deleteAtCursorSilently:](self, "_deleteAtCursorSilently:", 1);
              }
            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v35);
      }

      -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "removeAllObjects");

      v5 = v44;
      goto LABEL_48;
    }
LABEL_47:
    -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeAllObjects");

  }
LABEL_48:

}

- (int64_t)firstToken
{
  return self->_firstToken;
}

- (int64_t)lastToken
{
  return self->_lastToken;
}

- (BOOL)getStatusRouterIndex:(int64_t *)a3 forRawIndex:(int64_t)a4
{
  int64_t size;
  int64_t rightInset;
  BOOL result;

  if (!-[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment"))
  {
    if (self->_leftInset > a4)
      goto LABEL_5;
LABEL_6:
    result = 0;
    a4 = -1;
    goto LABEL_7;
  }
  size = self->_size;
  rightInset = self->_rightInset;
  if (size - rightInset > a4)
    goto LABEL_6;
  a4 += ~size + rightInset;
LABEL_5:
  result = 1;
LABEL_7:
  *a3 = a4;
  return result;
}

- (int64_t)tokenForRouterIndex:(int64_t *)a3 location:(int64_t *)a4 appToken:(id *)a5
{
  int64_t v5;
  NSMutableAttributedString *lineBuffer;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = *a3 - self->_leftInset + self->_lineOffset;
  if (v5 < 0 || v5 >= (unint64_t)-[NSMutableAttributedString length](self->_lineBuffer, "length"))
    return 0;
  lineBuffer = self->_lineBuffer;
  v11 = -[NSMutableAttributedString length](lineBuffer, "length");
  if (v5 + 1 < v11)
    v12 = v5 + 1;
  else
    v12 = v11;
  -[NSMutableAttributedString attributedSubstringFromRange:](lineBuffer, "attributedSubstringFromRange:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v14 = objc_msgSend(v13, "length");
  v15 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke;
  v37[3] = &unk_24CC1D970;
  v37[4] = &v42;
  v37[5] = &v38;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("padd"), 0, v14, 0, v37);
  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke_2;
  v36[3] = &unk_24CC1D4B0;
  v36[4] = &v42;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("sugg"), 0, objc_msgSend(v13, "length"), 0, v36);
  if (!*a3)
    v39[3] = 0;
  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "scriptLocationForBrailleLocation:", v5 - v43[3]);
LABEL_13:
    v19 = v17;

    goto LABEL_15;
  }
  if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "scriptLocationForBrailleLocation:", v5 - v43[3]);
    goto LABEL_13;
  }
  v19 = -[BRLTBrailleStateManager scriptLocationForBrailleLocation:](self->_stateManager, "scriptLocationForBrailleLocation:", v5 - v43[3]);
LABEL_15:
  if (!v39[3])
  {
    if (SCROCustomBrailleEnabled())
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayedScript");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "tokenForLocation:", v19);
    }
    else
    {
      if (!SCROJapaneseBrailleSelected())
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[BRLTBrailleStateManager outputScriptString](self->_stateManager, "outputScriptString", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "tokenRanges");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
        if (v18)
        {
          v25 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v33 != v25)
                objc_enumerationMutation(v20);
              v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v28 = objc_msgSend(v27, "range");
              if (v19 >= v28 && v19 - v28 < v29 && v19 != v28 + v29)
              {
                v18 = objc_msgSend(v27, "token");
                goto LABEL_22;
              }
            }
            v18 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
          }
          while (v18);
        }
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayedScript");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "tokenForLocation:", v19);
    }
    v18 = v22;

LABEL_22:
    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:
  if (a4)
    *a4 = v19;
  if (a5)
    *a5 = objc_retainAutorelease(self->_appToken);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v18;
}

uint64_t __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a4;
  else
    a4 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return result;
}

uint64_t __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a4;
  return result;
}

- (void)enumerateWordsBetweenCharacters:(id)a3 text:(id)a4 inRange:(_NSRange)a5 usingBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void (**v12)(id, void *, NSUInteger, NSUInteger, _BYTE *);
  NSUInteger v13;
  char v14;
  NSUInteger v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, NSUInteger, NSUInteger, _BYTE *))a6;
  v13 = location + length;
  if (location + length <= objc_msgSend(v11, "length") && location < v13)
  {
    v14 = 0;
    v15 = location;
    do
    {
      v21 = 0;
      v16 = objc_msgSend(v11, "characterAtIndex:", location);
      if ((objc_msgSend(v10, "characterIsMember:", v16) & 1) != 0)
      {
        if (objc_msgSend(v10, "characterIsMember:", v16))
        {
          if ((v14 & 1) != 0)
          {
            objc_msgSend(v11, "substringWithRange:", v15, location - v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v12[2](v12, v17, v15, location - v15, &v21);

            if (v21)
              goto LABEL_16;
          }
          objc_msgSend(v11, "substringWithRange:", location, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v18, location, 1, &v21);

          if (v21)
            goto LABEL_16;
          v14 = 0;
          v15 = location;
        }
      }
      else
      {
        if ((v14 & 1) == 0)
          v15 = location;
        v14 = 1;
      }
      ++location;
      --length;
    }
    while (length);
    if ((v14 & 1) != 0)
    {
      v20 = 0;
      objc_msgSend(v11, "substringWithRange:", v15, v13 - v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v19, v15, v13 - v15, &v20);

    }
  }
LABEL_16:

}

- (id)newLineDescriptor
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t statusSize;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int64_t v33;
  char *statusFilter;
  char *v35;
  int64_t v36;
  __int16 v37;
  void *v38;
  int64_t v39;
  char *v40;
  void *v41;
  id v42;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  SCROBrailleLine *v55;
  id v56;
  id v57;
  _QWORD *v58;
  SEL v59;
  _QWORD v60[4];
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[NSMutableAttributedString mutableCopy](self->_lineBuffer, "mutableCopy");
  v5 = (void *)objc_msgSend(v4, "copy");
  if (!SCROCustomBrailleEnabled())
  {
    if (!SCROJapaneseBrailleSelected())
    {
      if (-[BRLTBrailleStateManager outputTranslationMode](self->_stateManager, "outputTranslationMode") == 4)
      {
        objc_msgSend(v5, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SCROBrailleTranslationUtility translatedTextInIsolationForBraille:translationMode:](SCROBrailleTranslationUtility, "translatedTextInIsolationForBraille:translationMode:", v8, 4);
      }
      else
      {
        -[BRLTBrailleStateManager outputScriptString](self->_stateManager, "outputScriptString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "string");
      }
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayedScript");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (void *)v11;

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "technicalMode");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayedScript");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleTranslationUtility translatedTextInIsolationForBraille:translationMode:](SCROBrailleTranslationUtility, "translatedTextInIsolationForBraille:translationMode:", v8, 4);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v12 = (void *)v9;
LABEL_13:

  v61 = 683681792;
  v13 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v61, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "characterSetWithCharactersInString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __36__SCROBrailleLine_newLineDescriptor__block_invoke;
  v53[3] = &unk_24CC1D9C0;
  v59 = a2;
  v50 = v5;
  v54 = v50;
  v55 = self;
  v16 = v4;
  v56 = v16;
  v58 = v60;
  v17 = v15;
  v57 = v17;
  v52 = (id)MEMORY[0x212BDDEB8](v53);
  -[SCROBrailleLine enumerateWordsBetweenCharacters:text:inRange:usingBlock:](self, "enumerateWordsBetweenCharacters:text:inRange:usingBlock:", v51, v12, 0, objc_msgSend(v12, "length"), v52);
  v18 = objc_msgSend(v16, "length");
  if (v18)
  {
    v49 = v18;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
    -[BRLTBrailleStateManager outputScriptString](self->_stateManager, "outputScriptString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textFormattingRanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "boldRanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v19, "setObject:forKey:", v22, kSCROBrailleDisplayBoldRangesAttribute[0]);
    v48 = v22;
    objc_msgSend(v21, "underlineRanges");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v19, "setObject:forKey:", v23, kSCROBrailleDisplayUnderlineRangesAttribute[0]);
    v47 = v23;
    objc_msgSend(v21, "italicRanges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v19, "setObject:forKey:", v24, kSCROBrailleDisplayItalicRangesAttribute[0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayMode);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v25, kSCROBrailleDisplayModeAttribute[0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_insetSize);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v26, kSCROBrailleSizeAttribute[0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_lineOffset);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v27, kSCROBrailleOffsetAttribute[0]);

    if ((self->_iBeamLocation & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v28, kSCROBrailleIBeamLocationAttribute[0]);

    }
    statusSize = self->_statusSize;
    v30 = -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length") + statusSize;
    if (v30 < 1)
    {
      v38 = 0;
    }
    else
    {
      -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length");
      v44 = (uint64_t)&v44;
      MEMORY[0x24BDAC7A8]();
      v32 = (char *)&v44 - v31;
      v33 = self->_statusSize;
      v46 = v12;
      v45 = v17;
      if (v33 <= 0)
      {
        v33 = 0;
      }
      else
      {
        statusFilter = self->_statusFilter;
        v35 = v32;
        v36 = v33;
        do
        {
          v37 = *statusFilter++;
          *(_WORD *)v35 = v37;
          v35 += 2;
          --v36;
        }
        while (v36);
      }
      v39 = 0;
      v40 = &v32[2 * v33];
      while (v39 < -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length"))
      {
        *(_WORD *)&v40[2 * v39] = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells")[v39];
        ++v39;
      }
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", v32, v30);
      objc_msgSend(v19, "setObject:forKey:", v38, kSCROBrailleStatusAttribute[0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v41, kSCROBrailleStatusAlignmentAttribute[0]);

      v12 = v46;
      v17 = v45;
    }
    objc_msgSend(v16, "addAttributes:range:", v19, 0, v49);

  }
  v42 = v16;

  _Block_object_dispose(v60, 8);
  return v42;
}

void __36__SCROBrailleLine_newLineDescriptor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __36__SCROBrailleLine_newLineDescriptor__block_invoke_2;
  v15 = &unk_24CC1D998;
  v4 = *(id *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v19 = v3;
  v20 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v8 = (void *)MEMORY[0x212BDDEB8](&v12);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "string", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateWordsBetweenCharacters:text:inRange:usingBlock:", v9, v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "length") - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v8);

}

void __36__SCROBrailleLine_newLineDescriptor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("SCROBrailleLine.m"), 959, CFSTR("Error: newLineDescriptor range out of bounds"));

  }
  if (v9 > objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("SCROBrailleLine.m"), 960, CFSTR("Error: newLineDescriptor range out of bounds"));

  }
  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", CFSTR("padd"), 0, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v15, "BOOLValue");
  v12 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROBrailleOriginalStringAttribute[0], CFSTR(" "), a3, a4);
  }
  else
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROBrailleOriginalStringAttribute[0], *(_QWORD *)(a1 + 56), a3, a4);
    *a5 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9;

}

- (id)newLineDescriptorWithoutPadding
{
  id v2;
  void *v3;
  __int128 v5;

  v2 = -[SCROBrailleLine newLineDescriptor](self, "newLineDescriptor");
  v5 = xmmword_211601A30;
  if (!objc_msgSend(v2, "getRange:ofAttribute:", &v5, kSCROEditableTextPaddingAttribute[0]))
    return v2;
  do
  {
    objc_msgSend(v2, "attributedSubstringFromRange:", 0, (_QWORD)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v3;
  }
  while ((objc_msgSend(v3, "getRange:ofAttribute:", &v5, kSCROEditableTextPaddingAttribute[0]) & 1) != 0);
  return v3;
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  if (self->_showDotsSevenAndEight != a3)
  {
    self->_needsDisplayFlush = 1;
    self->_showDotsSevenAndEight = a3;
  }
}

- (BOOL)showDotsSevenAndEight
{
  return self->_showDotsSevenAndEight;
}

- (void)setLineFocus:(int)a3
{
  if (self->_lineFocus != a3)
  {
    self->_needsDisplayFlush = 1;
    self->_needsFocusFlush = 1;
    self->_lineFocus = a3;
  }
}

- (int)lineFocus
{
  return self->_lineFocus;
}

- (void)setDisplayMode:(int)a3
{
  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
    self->_needsFocusFlush = 1;
    -[SCROBrailleLine _updateOffsets](self, "_updateOffsets");
  }
}

- (int)displayMode
{
  return self->_displayMode;
}

- (int64_t)_indexOfWhitespaceBeforeIBeam:(int64_t)a3 inLine:(id)a4
{
  id v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", _WhitespaceSet, 4, 0, v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v8;
}

- (int64_t)_indexOfWhitespaceAfterIBeam:(int64_t)a3 inLine:(id)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "length");
  if (objc_msgSend(v5, "length") > (unint64_t)a3 && v6 != a3)
  {
    v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", _WhitespaceSet, 0, a3, v6 - a3);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      v6 = v7;
  }

  return v6;
}

- (_NSRange)textRangeForBrailleRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  if (SCROCustomBrailleEnabled())
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "scriptLocationForBrailleLocation:", location);

      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v8;
      v11 = objc_msgSend(v8, "scriptLocationForBrailleLocation:", location + length);

      length = v11 - v6;
    }
  }
  else
  {
    if (!SCROJapaneseBrailleSelected())
    {
      v6 = -[BRLTBrailleStateManager scriptRangeForBrailleRange:](self->_stateManager, "scriptRangeForBrailleRange:", location, length);
      length = v12;
      goto LABEL_9;
    }
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "scriptLocationForBrailleLocation:", location);

      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_9:
  v13 = v6;
  v14 = length;
  result.length = v14;
  result.location = v13;
  return result;
}

- (void)blinker
{
  _BOOL8 v3;

  if (self->_needsDisplayFlush)
  {
    -[SCROBrailleLine _flush](self, "_flush");
    self->_needsDisplayFlush = 0;
    self->_needsFocusFlush = 0;
  }
  if ((self->_iBeamLocation & 0x8000000000000000) == 0)
  {
    v3 = !self->_blinkEnabled || self->_blink;
    -[SCROBrailleLine _blink:](self, "_blink:", v3);
    self->_blink ^= 1u;
  }
}

- (BOOL)_blink:(BOOL)a3
{
  uint64_t v3;

  if (!self->_displayEnabled)
    return 1;
  v3 = 192;
  if (a3)
    v3 = 168;
  return -[SCROBrailleLine _setMainCells:length:](self, "_setMainCells:length:", *(Class *)((char *)&self->super.isa + v3), self->_size);
}

- (BOOL)_setMainCells:(const char *)a3 length:(int64_t)a4
{
  char *mainCellsBuffer;

  mainCellsBuffer = self->_mainCellsBuffer;
  if (!memcmp(mainCellsBuffer, a3, a4))
    return 1;
  memcpy(mainCellsBuffer, a3, a4);
  return -[SCROBrailleDriverProtocol setMainCells:length:](self->_brailleDriver, "setMainCells:length:", a3, a4);
}

- (void)setDisplayEnabled:(BOOL)a3
{
  if (self->_displayEnabled != a3)
  {
    self->_displayEnabled = a3;
    if (a3)
    {
      *(_WORD *)&self->_needsDisplayFlush = 257;
      self->_brailleChunksAreDirty = 1;
    }
  }
}

- (BOOL)display
{
  _BOOL4 v3;

  if (self->_needsDisplayFlush)
  {
    -[SCROBrailleLine _flush](self, "_flush");
    self->_needsDisplayFlush = 0;
    *(_WORD *)&self->_needsFocusFlush = 256;
    v3 = !self->_displayEnabled
      || -[SCROBrailleLine _setMainCells:length:](self, "_setMainCells:length:", self->_displayBuffer, self->_size);
  }
  else
  {
    v3 = 0;
  }
  if (self->_needsStatusFlush)
  {
    -[SCROBrailleLine _flushRealStatus](self, "_flushRealStatus");
    self->_needsStatusFlush = 0;
    if (self->_displayEnabled)
      return v3 | -[SCROBrailleDriverProtocol setStatusCells:length:](self->_brailleDriver, "setStatusCells:length:", self->_statusFilter, self->_statusSize);
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_flushRealStatus
{
  int64_t v3;
  char v4;
  char v5;

  if (self->_statusSize >= 1)
  {
    v3 = 0;
    do
    {
      if (v3 == self->_masterStatusCellIndex)
      {
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xFE | self->_anyUnread;
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xFD | (2 * self->_currentUnread);
        if (-[SCROBrailleLine canPanLeft](self, "canPanLeft"))
          v4 = 64;
        else
          v4 = 0;
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xBF | v4;
        if (-[SCROBrailleLine canPanRight](self, "canPanRight"))
          v5 = 0x80;
        else
          v5 = 0;
        self->_statusFilter[v3] = v5 & 0x80 | self->_statusFilter[v3] & 0x7F;
      }
      ++v3;
    }
    while (v3 < self->_statusSize);
  }
}

- (void)_flush
{
  NSMutableAttributedString **p_lineBuffer;
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  BRLTBrailleStateManager *stateManager;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  id v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  const __CFString *v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  NSUInteger location;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSUInteger v40;
  unint64_t v41;
  int64_t insetSize;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint32_t *p_cb;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t i;
  CFStringRef v70;
  void *v71;
  NSUInteger v72;
  int64_t iBeamLocation;
  NSUInteger v74;
  _NSRange *v75;
  NSUInteger v76;
  NSUInteger v77;
  void *v78;
  void *v79;
  uint64_t v80;
  int v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  NSMutableAttributedString *v87;
  NSMutableAttributedString *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  NSMutableAttributedString *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  NSMutableAttributedString *v100;
  uint64_t lineOffset;
  int64_t v102;
  unint64_t v103;
  int v104;
  void *v105;
  int v106;
  int v107;
  int v108;
  int64_t v109;
  int64_t v110;
  int64_t v111;
  int64_t v112;
  int lineFocus;
  size_t v114;
  int displayMode;
  BOOL v116;
  int64_t v117;
  int64_t v118;
  int64_t v119;
  char v120;
  _BOOL4 v121;
  char v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  int64_t v126;
  int64_t v127;
  SCROBrailleLine *v128;
  int64_t v129;
  uint64_t v130;
  int64_t masterStatusCellIndex;
  int64_t statusSize;
  int64_t v133;
  BOOL anyUnread;
  char *v135;
  BOOL currentUnread;
  char *v137;
  _BOOL4 v138;
  char *v139;
  char v140;
  _BOOL4 v141;
  char *v142;
  char v143;
  int64_t v144;
  __CFString *v145;
  __CFString *v146;
  void *TranslatePrintBrailleToBrailleCode;
  char *v148;
  id v149;
  int64_t v150;
  uint64_t v151;
  int64_t v152;
  int64_t v153;
  char *displayBuffer;
  int64_t v155;
  int64_t v156;
  int v157;
  char *v158;
  char *blinkerBuffer;
  char *v160;
  char v161;
  char *v162;
  int64_t leftInset;
  char *v164;
  NSUInteger v165;
  NSUInteger *p_length;
  NSMutableAttributedString **v167;
  _NSRange *p_focusRange;
  void *v169;
  int v170;
  _BYTE v171[12];
  _QWORD v173[4];
  id v174;
  _QWORD v175[4];
  id v176;
  UniChar chars[256];
  uint64_t v178;
  CFRange v179;
  CFRange v180;

  v178 = *MEMORY[0x24BDAC8D0];
  if (self->_size >= 1)
  {
    -[NSLock lock](self->_flushLock, "lock");
    if (!self->_brailleChunksAreDirty)
      goto LABEL_101;
    p_lineBuffer = &self->_lineBuffer;
    -[NSMutableAttributedString deleteCharactersInRange:](self->_lineBuffer, "deleteCharactersInRange:", 0, -[NSMutableAttributedString length](self->_lineBuffer, "length"));
    self->_iBeamLocation = -1;
    if (SCROCustomBrailleEnabled())
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayedBraille");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      self->_focusRange.location = objc_msgSend(v4, "focus");
      self->_focusRange.length = v5;
      self->_selectionRange.location = objc_msgSend(v4, "selection");
      self->_selectionRange.length = v6;
      self->_suggestionRange.location = objc_msgSend(v4, "suggestion");
      self->_suggestionRange.length = v7;

    }
    else if (SCROJapaneseBrailleSelected())
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayedBraille");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_focusRange.location = objc_msgSend(v9, "NSFocus");
      self->_focusRange.length = v10;

      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayedBraille");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_selectionRange.location = objc_msgSend(v12, "NSSelection");
      self->_selectionRange.length = v13;

      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayedBraille");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_suggestionRange.location = objc_msgSend(v15, "NSSuggestion");
      self->_suggestionRange.length = v16;

    }
    else
    {
      stateManager = self->_stateManager;
      if (stateManager)
      {
        self->_focusRange.location = -[BRLTBrailleStateManager brailleFocus](stateManager, "brailleFocus");
        self->_focusRange.length = v18;
        self->_selectionRange.location = -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection");
        self->_selectionRange.length = v19;
        self->_suggestionRange.location = -[BRLTBrailleStateManager brailleSuggestion](self->_stateManager, "brailleSuggestion");
        self->_suggestionRange.length = v20;
      }
    }
    if (SCROCustomBrailleEnabled())
    {
      v21 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayedBraille");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "string");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      v26 = v24;
    }
    else
    {
      v27 = SCROJapaneseBrailleSelected();
      v28 = objc_alloc(MEMORY[0x24BDD1458]);
      if (!v27)
      {
        -[BRLTBrailleStateManager brailleDisplayString](self->_stateManager, "brailleDisplayString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unicode");
        v31 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v31;
        if (v31)
          v32 = (const __CFString *)v31;
        else
          v32 = &stru_24CC1DB88;
        v30 = (void *)objc_msgSend(v28, "initWithString:", v32);
LABEL_21:

        location = self->_suggestionRange.location;
        if (location == 0x7FFFFFFFFFFFFFFFLL)
        {
          v34 = v30;
        }
        else
        {
          v35 = self->_suggestionRange.length + location;
          v34 = v30;
          if (v35 <= objc_msgSend(v30, "length"))
          {
            -[SCROBrailleLine _applySuggestionCellsToPrintBraille:](self, "_applySuggestionCellsToPrintBraille:", v30);
            v36 = objc_claimAutoreleasedReturnValue();

            v34 = (void *)v36;
          }
        }
        v37 = -[NSMutableAttributedString length](*p_lineBuffer, "length");
        if (SCROCustomBrailleEnabled())
        {
          objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "editable");
        }
        else
        {
          if (!SCROJapaneseBrailleSelected())
          {
            v170 = -[BRLTBrailleStateManager editable](self->_stateManager, "editable");
            goto LABEL_31;
          }
          objc_msgSend(MEMORY[0x24BE0FC50], "manager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEditing");
        }
        v170 = v39;

LABEL_31:
        v40 = self->_selectionRange.location;
        if (v40 != 0x7FFFFFFFFFFFFFFFLL && !self->_selectionRange.length)
          self->_iBeamLocation = v40 + v37;
        v41 = objc_msgSend(v34, "length");
        v169 = v34;
        if (!-[SCROBrailleLine wordWrapEnabled](self, "wordWrapEnabled"))
        {
          -[NSMutableAttributedString appendAttributedString:](*p_lineBuffer, "appendAttributedString:", v34);
          goto LABEL_93;
        }
        v167 = &self->_lineBuffer;
        insetSize = self->_insetSize;
        v43 = v37 / insetSize * insetSize;
        v44 = objc_msgSend(v34, "length");
        v45 = self->_insetSize;
        v46 = 0;
        v47 = (uint64_t)((v44 + v37) / v45 * insetSize) > v43 && v41 > v45;
        if (v47)
        {
          *(_DWORD *)&v171[8] = 0;
          *(_QWORD *)v171 = v170 ^ 1u;
          p_focusRange = &self->_focusRange;
          p_length = &self->_focusRange.length;
          p_cb = &OBJC_PROTOCOL___SCROBrailleDisplayDelegate.cb;
          do
          {
            objc_msgSend(v34, "string");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "substringWithRange:", v46, v41);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = objc_msgSend(v50, "characterAtIndex:", v45 - 1);
            v52 = objc_msgSend(v50, "characterAtIndex:", v45);
            LOBYTE(v51) = objc_msgSend(*((id *)p_cb + 244), "characterIsMember:", v51);
            v53 = objc_msgSend(*((id *)p_cb + 244), "characterIsMember:", v52);
            v54 = v45;
            if ((v51 & 1) == 0)
            {
              v54 = v45;
              if ((v53 & 1) == 0)
              {
                v55 = v45 - 2;
                if ((uint64_t)v45 >= 2)
                {
                  while ((objc_msgSend(*((id *)p_cb + 244), "characterIsMember:", objc_msgSend(v50, "characterAtIndex:", v55)) & 1) == 0)
                  {
                    v47 = v55-- <= 0;
                    if (v47)
                    {
                      v55 = -1;
                      break;
                    }
                  }
                }
                v54 = v55 + 1;
              }
            }
            if (v54)
              v56 = v54;
            else
              v56 = v45;
            v57 = objc_msgSend(v50, "length");
            if (v56 >= 1 && v34)
            {
              v58 = (void *)MEMORY[0x212BDDCF0]();
              v59 = v46;
              objc_msgSend(v34, "attributedSubstringFromRange:", v46, v56);
              v60 = v57;
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[SCROBrailleLine addAttributedStringToLineBuffer:brailleOffset:](self, "addAttributedStringToLineBuffer:brailleOffset:", v61, *(_QWORD *)&v171[4]);
              *(_QWORD *)&v171[4] += v56;

              v57 = v60;
              objc_autoreleasePoolPop(v58);
            }
            else
            {
              v59 = v46;
            }
            v62 = (void *)MEMORY[0x212BDDCF0]();
            v63 = -[SCROBrailleLine panWithTextCursorEnabled](self, "panWithTextCursorEnabled");
            if (((v63 | *(_DWORD *)v171) & 1) == 0)
              v63 = (unint64_t)-[NSMutableAttributedString length](self->_lineBuffer, "length") < self->_insetSize;
            v64 = v45 - v56;
            v65 = v59;
            if (v64 >= 1 && v63)
            {
              if (v170)
              {
                v66 = v57;
                -[NSMutableAttributedString attributesAtIndex:effectiveRange:](*v167, "attributesAtIndex:effectiveRange:", -[NSMutableAttributedString length](*v167, "length") - 1, 0);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                _createAttributedPaddingStringWithLength(v64, v67);
                v68 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v66 = v57;
                if ((unint64_t)v64 < 0x101)
                {
                  v179.location = 0;
                  v179.length = v64;
                  v70 = CFStringCreateWithSubstring(0, (CFStringRef)_SpaceString, v179);
                }
                else
                {
                  for (i = 0; i != v64; ++i)
                    chars[i] = kSCROBrailleUnicodeCharacterBase;
                  v70 = CFStringCreateWithCharacters(0, chars, v64);
                }
                v67 = (void *)v70;
                v68 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v70);
              }
              v71 = (void *)v68;

              -[SCROBrailleLine addAttributedPaddingToLineBuffer:](self, "addAttributedPaddingToLineBuffer:", v71);
              v72 = v56 + v43;
              iBeamLocation = self->_iBeamLocation;
              if (v56 + v43 <= iBeamLocation)
                self->_iBeamLocation = iBeamLocation + v64;
              v57 = v66;
              if (self->_showDotsSevenAndEight)
              {
                v74 = p_focusRange->location;
                if (p_focusRange->location != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (*p_length)
                  {
                    v75 = &self->_focusRange;
                    if (v72 <= v74
                      || (v76 = *p_length + v74, v74 = *p_length, v75 = (_NSRange *)&self->_focusRange.length, v72 < v76))
                    {
                      v75->location = v74 + v64;
                    }
                  }
                }
              }
              v77 = self->_selectionRange.location;
              if (v77 != 0x7FFFFFFFFFFFFFFFLL && v72 <= v77)
                self->_selectionRange.location = v77 + v64;

              v34 = v169;
            }
            v46 = v56 + v65;
            v41 = v57 - v56;
            objc_autoreleasePoolPop(v62);
            v45 = self->_insetSize;
            v43 += v45;

            p_cb = (_DWORD *)(&OBJC_PROTOCOL___SCROBrailleDisplayDelegate + 64);
          }
          while (v41 > v45);
        }
        else
        {
          *(_QWORD *)&v171[4] = 0;
        }
        v78 = (void *)MEMORY[0x212BDDCF0]();
        objc_msgSend(v34, "attributedSubstringFromRange:", v46, v41);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCROBrailleLine addAttributedStringToLineBuffer:brailleOffset:](self, "addAttributedStringToLineBuffer:brailleOffset:", v79, *(_QWORD *)&v171[4]);

        objc_autoreleasePoolPop(v78);
        if ((int64_t)v41 >= self->_insetSize)
          v80 = 0;
        else
          v80 = v41;
        if (v80 > 0)
          v81 = v170;
        else
          v81 = 0;
        p_lineBuffer = &self->_lineBuffer;
        if (v81 != 1)
          goto LABEL_93;
        if (-[SCROBrailleLine panWithTextCursorEnabled](self, "panWithTextCursorEnabled"))
        {
          v82 = self->_insetSize;
        }
        else
        {
          v83 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
          v82 = self->_insetSize;
          if (v83 >= v82)
            goto LABEL_93;
        }
        v84 = v82 - v80;
        -[NSMutableAttributedString attributesAtIndex:effectiveRange:](*v167, "attributesAtIndex:effectiveRange:", -[NSMutableAttributedString length](*v167, "length") - 1, 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        _createAttributedPaddingStringWithLength(v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableAttributedString appendAttributedString:](*v167, "appendAttributedString:", v86);

LABEL_93:
        v87 = self->_lineBuffer;
        v88 = v87;
        if (self->_selectionRange.location != 0x7FFFFFFFFFFFFFFFLL && self->_selectionRange.length)
        {
          -[NSMutableAttributedString string](v87, "string");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          _applyDots7And8FocusFilterToPrintBraille(v89, self->_selectionRange.location, self->_selectionRange.length);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v90);
          v92 = -[NSMutableAttributedString length](v88, "length");
          v175[0] = MEMORY[0x24BDAC760];
          v175[1] = 3221225472;
          v175[2] = __25__SCROBrailleLine__flush__block_invoke;
          v175[3] = &unk_24CC1D9E8;
          v93 = v91;
          v176 = v93;
          -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](v88, "enumerateAttributesInRange:options:usingBlock:", 0, v92, 0, v175);
          v94 = (NSMutableAttributedString *)v93;

          v34 = v169;
          v88 = v94;
        }
        if (self->_showDotsSevenAndEight
          && self->_focusRange.location != 0x7FFFFFFFFFFFFFFFLL
          && self->_focusRange.length)
        {
          -[NSMutableAttributedString string](v88, "string");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          _applyDots7And8FocusFilterToPrintBraille(v95, self->_focusRange.location, self->_focusRange.length);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v96);
          v98 = -[NSMutableAttributedString length](v88, "length");
          v173[0] = MEMORY[0x24BDAC760];
          v173[1] = 3221225472;
          v173[2] = __25__SCROBrailleLine__flush__block_invoke_2;
          v173[3] = &unk_24CC1D9E8;
          v99 = v97;
          v174 = v99;
          -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](v88, "enumerateAttributesInRange:options:usingBlock:", 0, v98, 0, v173);
          v100 = (NSMutableAttributedString *)v99;

          v34 = v169;
          v88 = v100;
        }
        objc_storeStrong((id *)p_lineBuffer, v88);
        self->_brailleChunksAreDirty = 0;

LABEL_101:
        if (self->_isPanning)
          goto LABEL_102;
        lineFocus = self->_lineFocus;
        switch(lineFocus)
        {
          case 3:
            if (!self->_needsFocusFlush)
              break;
            if (!self->_isUIString
              || !-[NSString isEqualToString:](self->_currentUIString, "isEqualToString:", self->_previousUIString))
            {
              goto LABEL_152;
            }
            self->_lineOffset = self->_previousUILineOffset;
            v123 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
            if (self->_lineOffset - v123 + self->_insetSize >= 1)
              self->_lineOffset = (v123 - self->_insetSize) & ~((v123 - self->_insetSize) >> 63);
            break;
          case 2:
            if (self->_needsFocusFlush)
            {
              v124 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
              v125 = self->_insetSize;
              v47 = v124 > v125;
              v126 = v124 / v125 * v125;
              if (!v47)
                v126 = 0;
              self->_lineOffset = v126;
            }
            break;
          case 1:
            if (!self->_needsFocusFlush)
              break;
LABEL_152:
            self->_lineOffset = 0;
            break;
          default:
            v127 = self->_iBeamLocation;
            if ((v127 & 0x8000000000000000) == 0)
            {
              v128 = self;
              v129 = self->_insetSize;
              v130 = v127 / v129;
LABEL_203:
              v128->_lineOffset = v130 * v129;
              break;
            }
            if (self->_selectionRange.length && (v165 = self->_selectionRange.location, v165 != 0x7FFFFFFFFFFFFFFFLL)
              || (v165 = self->_focusRange.location, v165 != 0x7FFFFFFFFFFFFFFFLL))
            {
              v128 = self;
              v129 = self->_insetSize;
              v130 = v165 / v129;
              goto LABEL_203;
            }
            break;
        }
LABEL_102:
        self->_isPanning = 0;
        lineOffset = self->_lineOffset;
        v102 = self->_insetSize;
        if (lineOffset % v102)
        {
          lineOffset -= lineOffset % v102;
          self->_lineOffset = lineOffset;
        }
        v103 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
        v104 = -[BRLTBrailleStateManager editable](self->_stateManager, "editable");
        if (SCROCustomBrailleEnabled())
        {
          objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "editable");
        }
        else
        {
          if (!SCROJapaneseBrailleSelected())
            goto LABEL_109;
          objc_msgSend(MEMORY[0x24BE0FC50], "manager");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "isEditing");
        }
        v104 = v106;

LABEL_109:
        v107 = v104 & !-[SCROBrailleLine panWithTextCursorEnabled](self, "panWithTextCursorEnabled");
        if (lineOffset)
        {
          while (lineOffset != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v102 + lineOffset > v103)
              v108 = v107;
            else
              v108 = 0;
            if (v108 == 1)
            {
              v109 = self->_insetSize;
              if ((uint64_t)(v103 - v109) >= 0)
              {
                self->_lineOffset = v103 - v109;
                lineOffset = v103 - v109;
                v102 = v109;
                break;
              }
            }
            if (lineOffset >= v103)
            {
              v110 = self->_insetSize;
              v111 = self->_lineOffset;
              v47 = v111 < v110;
              v112 = v111 - v110;
              if (!v47)
              {
                self->_lineOffset = v112;
                lineOffset = v112;
                v102 = v110;
                if (v112)
                  continue;
              }
            }
            break;
          }
        }
        if (v102 + lineOffset <= v103)
          v114 = v102;
        else
          v114 = v103 - lineOffset;
        bzero(self->_displayFilter, self->_size);
        displayMode = self->_displayMode;
        v116 = displayMode == 5 || displayMode == 0;
        if (v116 && -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length") < 1
          || !-[SCROBrailleLine _allowInset](self, "_allowInset"))
        {
LABEL_173:
          memcpy(self->_displayBuffer, self->_displayFilter, self->_size);
          -[NSMutableAttributedString string](self->_lineBuffer, "string");
          v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v145)
          {
            v180.location = lineOffset;
            v180.length = v114;
            v146 = (id)CFStringCreateWithSubstring(0, v145, v180);

          }
          else
          {
            v146 = 0;
          }
          TranslatePrintBrailleToBrailleCode = (void *)SCROBrailleCreateTranslatePrintBrailleToBrailleCode(v146);
          v148 = &self->_displayBuffer[self->_leftInset];
          v149 = objc_retainAutorelease(TranslatePrintBrailleToBrailleCode);
          memcpy(v148, (const void *)objc_msgSend(v149, "bytes"), v114);
          memcpy(self->_blinkerBuffer, self->_displayBuffer, self->_size);
          v150 = self->_iBeamLocation;
          if (v150 >= 0)
            v151 = lineOffset;
          else
            v151 = 0;
          v152 = v150 - v151;
          if (!v152 && !self->_leftInset)
          {
            *self->_displayBuffer |= 0x40u;
            blinkerBuffer = self->_blinkerBuffer;
LABEL_195:
            v161 = -65;
            goto LABEL_196;
          }
          v153 = self->_insetSize;
          if (v152 == v153 && !self->_rightInset)
          {
            v160 = &self->_displayBuffer[self->_size];
            *(v160 - 1) |= 0x80u;
            v158 = &self->_blinkerBuffer[self->_size];
            goto LABEL_190;
          }
          if (v152 < 0 || v152 >= v153)
            goto LABEL_197;
          displayBuffer = self->_displayBuffer;
          v155 = self->_leftInset + v152;
          v156 = v155 - 1;
          v157 = displayBuffer[v155 - 1];
          if (v157 < 0)
          {
            if ((displayBuffer[v155] & 0x40) == 0)
            {
              displayBuffer[v155] |= 0x40u;
              v162 = self->_blinkerBuffer;
              leftInset = self->_leftInset;
LABEL_194:
              blinkerBuffer = &v162[leftInset + v152];
              goto LABEL_195;
            }
          }
          else if ((displayBuffer[v155] & 0x40) != 0)
          {
            displayBuffer[v156] = v157 | 0x80;
            v158 = &self->_blinkerBuffer[self->_leftInset + v152];
LABEL_190:
            blinkerBuffer = v158 - 1;
            v161 = 127;
LABEL_196:
            *blinkerBuffer &= v161;
LABEL_197:
            -[NSLock unlock](self->_flushLock, "unlock");

            return;
          }
          displayBuffer[v156] = v157 | 0x80;
          self->_displayBuffer[self->_leftInset + v152] |= 0x40u;
          v164 = &self->_blinkerBuffer[self->_leftInset + v152];
          *(v164 - 1) &= ~0x80u;
          v162 = self->_blinkerBuffer;
          leftInset = self->_leftInset;
          goto LABEL_194;
        }
        if (-[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment"))
        {
          v117 = 0;
          v118 = self->_size - self->_rightInset;
          v119 = v118 + 1;
          if (!displayMode)
          {
LABEL_161:
            masterStatusCellIndex = self->_masterStatusCellIndex;
            statusSize = self->_statusSize;
            if (masterStatusCellIndex >= statusSize
              && masterStatusCellIndex < -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length")
                                       + statusSize)
            {
              v133 = self->_masterStatusCellIndex - self->_statusSize;
              anyUnread = self->_anyUnread;
              v135 = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells");
              v135[v133] = v135[v133] & 0xFE | anyUnread;
              currentUnread = self->_currentUnread;
              v137 = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells");
              v137[v133] = v137[v133] & 0xFD | (2 * currentUnread);
              v138 = -[SCROBrailleLine canPanLeft](self, "canPanLeft");
              v139 = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells");
              if (v138)
                v140 = 64;
              else
                v140 = 0;
              v139[v133] = v139[v133] & 0xBF | v140;
              v141 = -[SCROBrailleLine canPanRight](self, "canPanRight");
              v142 = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells");
              if (v141)
                v143 = 0x80;
              else
                v143 = 0;
              v142[v133] = v143 & 0x80 | v142[v133] & 0x7F;
            }
            if (-[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length") >= 1)
            {
              v144 = 0;
              do
              {
                self->_displayFilter[v119 + v144] = -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells")[v144];
                ++v144;
              }
              while (v144 < -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length"));
            }
            goto LABEL_173;
          }
        }
        else
        {
          v117 = -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length");
          v119 = 0;
          v118 = self->_size - 1;
          if (!displayMode)
            goto LABEL_161;
        }
        if (displayMode != 5)
        {
          if (self->_displayMode == 4)
          {
            if (-[SCROBrailleLine canPanLeft](self, "canPanLeft"))
              v120 = 127;
            else
              v120 = 63;
            v121 = -[SCROBrailleLine canPanRight](self, "canPanRight");
            v122 = v120 | 0x80;
            if (!v121)
              v122 = v120;
          }
          else
          {
            v122 = -1;
          }
          self->_displayFilter[v117] = v122;
          self->_displayFilter[v118] = v122;
        }
        goto LABEL_161;
      }
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayedBraille");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stageSignalledString");
      v29 = objc_claimAutoreleasedReturnValue();
      v24 = (__CFString *)v29;
      if (v29)
        v26 = (const __CFString *)v29;
      else
        v26 = &stru_24CC1DB88;
      v25 = v28;
    }
    v30 = (void *)objc_msgSend(v25, "initWithString:", v26);

    goto LABEL_21;
  }
}

uint64_t __25__SCROBrailleLine__flush__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

uint64_t __25__SCROBrailleLine__flush__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

- (id)_applySuggestionCellsToPrintBraille:(id)a3
{
  id v4;
  NSUInteger v5;
  id v6;
  __int16 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSUInteger location;
  NSUInteger v13;
  NSUInteger v14;
  __int16 v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = self->_suggestionRange.length + self->_suggestionRange.location, v5 <= objc_msgSend(v4, "length")))
  {
    if (self->_showDotsSevenAndEight)
      v7 = 255;
    else
      v7 = 63;
    v6 = (id)objc_msgSend(v4, "mutableCopy");
    v16 = kSCROBrailleUnicodeCharacterBase + v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v16, 1);
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    v17 = CFSTR("sugg");
    v18[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v10);

    objc_msgSend(v6, "insertAttributedString:atIndex:", v11, self->_suggestionRange.location);
    objc_msgSend(v6, "insertAttributedString:atIndex:", v11, self->_suggestionRange.location + self->_suggestionRange.length + 1);
    location = self->_focusRange.location;
    v13 = self->_suggestionRange.location;
    if (location > v13)
      self->_focusRange.location = location + 2;
    v14 = self->_selectionRange.location;
    if (v14 > v13)
      self->_selectionRange.location = v14 + 2;

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)addAttributedStringToLineBuffer:(id)a3 brailleOffset:(unint64_t)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
    -[NSMutableAttributedString appendAttributedString:](self->_lineBuffer, "appendAttributedString:", v5);

}

- (void)addAttributedPaddingToLineBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableAttributedString appendAttributedString:](self->_lineBuffer, "appendAttributedString:", v4);
    v5 = -[NSMutableAttributedString length](self->_lineBuffer, "length");
    v6 = v5 - objc_msgSend(v4, "length");
    v7 = objc_msgSend(v4, "length");
    v9 = CFSTR("padd");
    v10[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString addAttributes:range:](self->_lineBuffer, "addAttributes:range:", v8, v6, v7);

  }
}

- (unint64_t)bufferIndexForRouterIndex:(unint64_t)a3
{
  return self->_lineOffset + a3 - self->_leftInset;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleLine;
  -[SCROBrailleLine description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16A8];
  -[NSMutableAttributedString string](self->_lineBuffer, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ \"%@\"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSAttributedString)editingString
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  if (SCROCustomBrailleEnabled())
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1458]);
  }
  else
  {
    v4 = SCROJapaneseBrailleSelected();
    v5 = objc_alloc(MEMORY[0x24BDD1458]);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayedBraille");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stageString");
    }
    else
    {
      -[BRLTBrailleStateManager brailleBuffer](self->_stateManager, "brailleBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "brailleString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unicode");
    }
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_24CC1DB88;
    v3 = (id)objc_msgSend(v5, "initWithString:", v10);

  }
  return (NSAttributedString *)v3;
}

- (BOOL)hasEdits
{
  void *v3;
  int v4;
  void *v5;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v3, "brailleStringDirty");
  }
  else
  {
    if (SCROJapaneseBrailleSelected())
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayedBraille");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isStageEmpty") ^ 1;
    }
    else
    {
      -[BRLTBrailleStateManager brailleBuffer](self->_stateManager, "brailleBuffer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "brailleString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v5, "length") != 0;
    }

  }
  return v4;
}

- (BOOL)wantsEdits
{
  void *v3;
  char v4;
  int v6;
  BOOL v7;
  void *v8;
  BOOL v9;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "editable");

    return v4;
  }
  v6 = SCROJapaneseBrailleSelected();
  v7 = -[SCROBrailleLine isSingleLetterInputOn](self, "isSingleLetterInputOn");
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_msgSend(v8, "isEditing") & 1) != 0 || self->_editableFieldInterruptedByAlert;

      return v9;
    }
  }
  else if (!v7)
  {
    return (-[BRLTBrailleStateManager editable](self->_stateManager, "editable") & 1) != 0
        || self->_editableFieldInterruptedByAlert;
  }
  return 0;
}

- (void)translate
{
  id v3;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceTranslate");

  }
  else if ((SCROJapaneseBrailleSelected() & 1) == 0)
  {
    -[BRLTBrailleStateManager translate](self->_stateManager, "translate");
  }
}

- (void)discardEdits
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    while (1)
    {
      -[BRLTBrailleStateManager brailleBuffer](self->_stateManager, "brailleBuffer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "brailleString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      if (!v5)
        break;
      -[BRLTBrailleStateManager brailleBuffer](self->_stateManager, "brailleBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteBrailleChar");

    }
  }
}

- (BOOL)deleteAtCursor
{
  return -[SCROBrailleLine _deleteAtCursorSilently:](self, "_deleteAtCursorSilently:", 0);
}

- (BOOL)_deleteAtCursorSilently:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  BOOL v11;
  SCROPendingBrailleDelete *v12;
  void *v13;
  void *v14;
  int v15;
  BRLTBrailleStateManager *stateManager;

  v3 = a3;
  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = objc_msgSend(v5, "handleDeleteSilently");
    else
      v7 = objc_msgSend(v5, "handleDelete");
    v11 = v7;

    return v11;
  }
  else if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "delete");

    return v9;
  }
  else if (self->_editableFieldInterruptedByAlert)
  {
    v12 = objc_alloc_init(SCROPendingBrailleDelete);
    -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

    return 1;
  }
  else
  {
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "primaryTableSupportsRoundTripping");

    if (v15)
    {
      stateManager = self->_stateManager;
      if (v3)
        return -[BRLTBrailleStateManager deleteBrailleCharSilently](stateManager, "deleteBrailleCharSilently");
      else
        return -[BRLTBrailleStateManager deleteBrailleChar](stateManager, "deleteBrailleChar");
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)forwardDeleteAtCursor
{
  return -[SCROBrailleLine _forwardDeleteAtCursorSilently:](self, "_forwardDeleteAtCursorSilently:", 0);
}

- (BOOL)_forwardDeleteAtCursorSilently:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  SCROPendingBrailleDelete *v7;
  void *v8;
  void *v9;
  NSUInteger length;
  BRLTBrailleStateManager *stateManager;

  v3 = a3;
  if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "forwardDelete");

    return v6;
  }
  if (self->_editableFieldInterruptedByAlert)
  {
    v7 = objc_alloc_init(SCROPendingBrailleDelete);
    v6 = 1;
    -[SCROPendingBrailleDelete setIsForwardDelete:](v7, "setIsForwardDelete:", 1);
    -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

    return v6;
  }
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "primaryTableSupportsRoundTripping"))
  {

    return 0;
  }
  length = self->_selectionRange.length;

  if (length)
    return 0;
  stateManager = self->_stateManager;
  if (v3)
    return -[BRLTBrailleStateManager forwardDeleteBrailleCharSilently](stateManager, "forwardDeleteBrailleCharSilently");
  else
    return -[BRLTBrailleStateManager forwardDeleteBrailleChar](stateManager, "forwardDeleteBrailleChar");
}

- (BOOL)moveCursorLeft
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayedBraille");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "selection");

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleBrailleSelection:", v5 - 1, 0);

LABEL_10:
      LOBYTE(v14) = 1;
      return v14;
    }
LABEL_7:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayedBraille");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "NSSelection");

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayedBraille");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "NSSelection") - 1;

      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBrailleSelection:", v12, 0);

      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v14 = -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection");
  if (v14)
  {
    -[BRLTBrailleStateManager setBrailleSelection:](self->_stateManager, "setBrailleSelection:", -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection") - 1, 0);
    goto LABEL_10;
  }
  return v14;
}

- (BOOL)moveCursorRight
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayedBraille");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "selection");

    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayedBraille");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v5 < v9)
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleBrailleSelection:", v5 + 1, 0);

      return 1;
    }
  }
  else if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedBraille");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "NSSelection");
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayedBraille");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v13 < v17)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayedBraille");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "NSSelection") + 1;

      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBrailleSelection:", v20, 0);

      return 1;
    }
  }
  else
  {
    v22 = -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection");
    -[BRLTBrailleStateManager brailleDisplayString](self->_stateManager, "brailleDisplayString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v22 < v24)
    {
      -[BRLTBrailleStateManager setBrailleSelection:](self->_stateManager, "setBrailleSelection:", -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection") + 1, 0);
      return 1;
    }
  }
  return 0;
}

- (BOOL)moveCursorToRouterIndex:(unint64_t)a3 forwardToScreenReader:(BOOL *)a4 updateRouterLocation:(int64_t *)a5
{
  int64_t v9;
  NSMutableAttributedString *lineBuffer;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  BOOL result;
  void *v27;
  void *v28;
  uint64_t v29;
  int64_t v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  if ((SCROCustomBrailleEnabled() & 1) != 0 || (SCROJapaneseBrailleSelected() & 1) != 0)
    goto LABEL_3;
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "primaryTableSupportsRoundTripping")
    || !-[NSMutableAttributedString length](self->_lineBuffer, "length"))
  {

LABEL_23:
    if (a4)
    {
      result = 0;
      *a4 = 1;
      return result;
    }
    return 0;
  }
  v25 = -[BRLTBrailleStateManager editable](self->_stateManager, "editable");

  if ((v25 & 1) == 0)
    goto LABEL_23;
  if (a4)
    *a4 = 0;
LABEL_3:
  v9 = a3 - self->_leftInset + self->_lineOffset;
  if (v9 < 0 || v9 >= (unint64_t)-[NSMutableAttributedString length](self->_lineBuffer, "length"))
    return 0;
  lineBuffer = self->_lineBuffer;
  v11 = -[NSMutableAttributedString length](lineBuffer, "length");
  if (v9 + 1 < v11)
    v12 = v9 + 1;
  else
    v12 = v11;
  -[NSMutableAttributedString attributedSubstringFromRange:](lineBuffer, "attributedSubstringFromRange:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v14 = objc_msgSend(v13, "length");
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __86__SCROBrailleLine_moveCursorToRouterIndex_forwardToScreenReader_updateRouterLocation___block_invoke;
  v31[3] = &unk_24CC1D4B0;
  v31[4] = &v32;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("padd"), 0, v14, 0, v31);
  v15 = v9 - v33[3];
  if ((SCROCustomBrailleEnabled() & 1) == 0
    && (SCROJapaneseBrailleSelected() & 1) == 0
    && -[BRLTBrailleStateManager brailleSelection](self->_stateManager, "brailleSelection") == v15
    && !v16)
  {
    -[BRLTBrailleStateManager brailleDisplayString](self->_stateManager, "brailleDisplayString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15 <= objc_msgSend(v17, "length");

    v15 += v18;
  }
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "handleBrailleSelection:", v15, 0);

    if (a4)
      *a4 = v20;
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel", v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayedScript");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "selection");
  }
  else
  {
    if (!SCROJapaneseBrailleSelected())
    {
      -[BRLTBrailleStateManager setBrailleSelection:needsForwardToScreenReader:newScriptLocation:](self->_stateManager, "setBrailleSelection:needsForwardToScreenReader:newScriptLocation:", v15, 0, a4, &v30);
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBrailleSelection:", v15, 0);

    if (a4)
      *a4 = 1;
    objc_msgSend(MEMORY[0x24BE0FC50], "manager", v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayedScript");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "NSSelection");
  }
  v30 = v23;

LABEL_32:
  if (!a4 || !*a4)
    goto LABEL_43;
  if (v30 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (SCROCustomBrailleEnabled())
    {
      objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "scriptLocationForBrailleLocation:", v15);
LABEL_39:
      v30 = v29;

      goto LABEL_41;
    }
    if (SCROJapaneseBrailleSelected())
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "scriptLocationForBrailleLocation:", v15);
      goto LABEL_39;
    }
    v30 = -[BRLTBrailleStateManager scriptLocationForBrailleLocation:](self->_stateManager, "scriptLocationForBrailleLocation:", v15);
  }
LABEL_41:
  if (*a5 != v30)
    *a5 = v30;
LABEL_43:
  self->_brailleChunksAreDirty = 1;
  -[SCROBrailleLine _flush](self, "_flush", v30);
  _Block_object_dispose(&v32, 8);

  return 1;
}

uint64_t __86__SCROBrailleLine_moveCursorToRouterIndex_forwardToScreenReader_updateRouterLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a4;
  return result;
}

- (BOOL)insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[SCROBrailleFormatter hasPlaceholderText](self->_brailleFormatter, "hasPlaceholderText"))
    -[SCROBrailleFormatter clearPlaceholderForEditing](self->_brailleFormatter, "clearPlaceholderForEditing");
  v8 = -[SCROBrailleLine _insertBrailleStringAtCursor:modifiers:silently:](self, "_insertBrailleStringAtCursor:modifiers:silently:", v6, v7, 0);

  return v8;
}

- (BOOL)_insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4 silently:(BOOL)a5
{
  id v7;
  id v8;
  SCROPendingBrailleModifierPair *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v27 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((SCROCustomBrailleEnabled() & 1) != 0
    || (SCROJapaneseBrailleSelected() & 1) != 0
    || !self->_editableFieldInterruptedByAlert)
  {
    v26 = v7;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC40]), "initWithUnicode:", v7);
    objc_msgSend(v25, "brailleChars");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v13)
      goto LABEL_22;
    v14 = v13;
    v15 = *(_QWORD *)v29;
    v16 = *MEMORY[0x24BE0FCB0];
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (SCROCustomBrailleEnabled())
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v8, "containsObject:", v19);

          if (v20)
          {
            if (self->_inputMode == 2)
            {
              objc_msgSend(v18, "setDot7:", 1);
            }
            else
            {
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC28]), "initWithUnicode:", CFSTR("⠠"));
              objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleBrailleDotPress:", v22);

            }
          }
          objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleBrailleDotPress:", v18);
        }
        else
        {
          if (!SCROJapaneseBrailleSelected())
          {
            -[BRLTBrailleStateManager insertBrailleChar:modifiers:silently:](self->_stateManager, "insertBrailleChar:modifiers:silently:", v18, v8, v27);
            continue;
          }
          objc_msgSend(MEMORY[0x24BE0FC50], "manager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "insertBrailleChar:", v18);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v14)
      {
LABEL_22:

        v11 = 1;
        v7 = v26;
        goto LABEL_23;
      }
    }
  }
  v9 = -[SCROPendingBrailleModifierPair initWithPendingBraille:modifiers:]([SCROPendingBrailleModifierPair alloc], "initWithPendingBraille:modifiers:", v7, v8);
  -[SCROBrailleLine pendingBrailleStringDictionaries](self, "pendingBrailleStringDictionaries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  v11 = 0;
LABEL_23:

  return v11;
}

- (id)translatedBrailleForTableIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedBraille");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textForPrintBraille:language:mode:locations:", v6, 0, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = SCROJapaneseBrailleSelected();
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayedBraille");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textForPrintBraille:language:mode:locations:", v11, 0, 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BRLTBrailleStateManager brailleDisplayString](self->_stateManager, "brailleDisplayString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unicode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textForPrintBraille:language:mode:locations:", v10, 0, 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  length = a6.length;
  location = a6.location;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v16, v15, a5, location, length, a7, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textForPrintBraille:language:mode:locations:", v10, v9, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id v11;

  length = a4.length;
  location = a4.location;
  self->_brailleChunksAreDirty = 1;
  self->_needsDisplayFlush = 1;
  v9 = a5;
  v10 = a3;
  -[SCROBrailleLine display](self, "display");
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v10, location, length, v9);

}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replaceScriptStringRange:withScriptString:cursorLocation:", location, length, v9, a5);

}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scriptSelectionDidChange:", location, length);

}

- (void)didInsertScriptString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didInsertScriptString:", v4);

}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brailleDisplayInsertedCharacter:modifiers:", v7, v6);

}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brailleDisplayDeletedCharacter:", v4);

}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SCROBrailleLine translationDelegate](self, "translationDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlePlanarPanFailedIsLeft:", v3);

}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v7;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v7 = (objc_class *)MEMORY[0x24BE0FC40];
  v8 = a3;
  v9 = (id)objc_msgSend([v7 alloc], "initWithUnicode:", v8);

  -[SCROBrailleLine brailleDisplayStringDidChange:brailleSelection:modifiers:](self, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v9, location, length, 0);
}

- (BOOL)needsDisplayFlush
{
  return self->_needsDisplayFlush;
}

- (BOOL)displayEnabled
{
  return self->_displayEnabled;
}

- (int64_t)lineOffset
{
  return self->_lineOffset;
}

- (void)setLineOffset:(int64_t)a3
{
  self->_lineOffset = a3;
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_wordWrapEnabled = a3;
}

- (BOOL)panWithTextCursorEnabled
{
  return self->_panWithTextCursorEnabled;
}

- (void)setPanWithTextCursorEnabled:(BOOL)a3
{
  self->_panWithTextCursorEnabled = a3;
}

- (BOOL)blinkEnabled
{
  return self->_blinkEnabled;
}

- (void)setBlinkEnabled:(BOOL)a3
{
  self->_blinkEnabled = a3;
}

- (BOOL)isSingleLetterInputOn
{
  return self->_isSingleLetterInputOn;
}

- (void)setIsSingleLetterInputOn:(BOOL)a3
{
  self->_isSingleLetterInputOn = a3;
}

- (BOOL)isTextSearchModeOn
{
  return self->_isTextSearchModeOn;
}

- (void)setIsTextSearchModeOn:(BOOL)a3
{
  self->_isTextSearchModeOn = a3;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_generationID = a3;
}

- (BRLTBrailleStateManagerDelegate)translationDelegate
{
  return (BRLTBrailleStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_translationDelegate);
}

- (void)setTranslationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_translationDelegate, a3);
}

- (NSMutableArray)pendingBrailleStringDictionaries
{
  return self->_pendingBrailleStringDictionaries;
}

- (void)setPendingBrailleStringDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBrailleStringDictionaries, a3);
}

- (BOOL)editableFieldInterruptedByAlert
{
  return self->_editableFieldInterruptedByAlert;
}

- (void)setEditableFieldInterruptedByAlert:(BOOL)a3
{
  self->_editableFieldInterruptedByAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBrailleStringDictionaries, 0);
  objc_destroyWeak((id *)&self->_translationDelegate);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_flushLock, 0);
  objc_storeStrong((id *)&self->_braillePlane, 0);
  objc_storeStrong((id *)&self->_brailleFormatter, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_virtualStatus, 0);
  objc_storeStrong((id *)&self->_previousUIString, 0);
  objc_storeStrong((id *)&self->_currentUIString, 0);
  objc_storeStrong(&self->_appToken, 0);
  objc_storeStrong((id *)&self->_lineBuffer, 0);
  objc_storeStrong((id *)&self->_statusData, 0);
  objc_storeStrong((id *)&self->_brailleDriver, 0);
}

- (BRLTBrailleStateManager)stateManager
{
  return self->_stateManager;
}

@end
