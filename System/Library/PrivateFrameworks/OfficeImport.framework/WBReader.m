@implementation WBReader

- (BOOL)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  FILE *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = -[WBReader wrdReader](self, "wrdReader");
  v4 = -[WBReader wrdReader](self, "wrdReader");
  if (v4)
  {
    -[OCDReader fileName](self, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[OCDReader fileName](self, "fileName");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "rb");

      if (v7)
      {
        -[OCBReader setFile:](self, "setFile:", v7);
        (*(void (**)(void *, __sFILE *))(*(_QWORD *)v3 + 16))(v3, -[OCBReader file](self, "file"));
LABEL_7:
        LOBYTE(v4) = 1;
        return (char)v4;
      }
      v12 = TCUnknownProblemMessage;
      -[OCDReader fileName](self, "fileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[TCMessageException raise:](TCMessageException, "raise:", v12, v13);

    }
    else
    {
      -[OCDReader data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[OCDReader data](self, "data");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = objc_msgSend(v9, "bytes");
        -[OCDReader data](self, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)v3 + 120))(v3, v10, objc_msgSend(v11, "length"));

        goto LABEL_7;
      }
    }
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  OCCEncryptionInfoReader *v2;

  v2 = -[WBReader wrdReader](self, "wrdReader");
  if (v2)
    return v2 + 3;
  else
    return 0;
}

- (id)read
{
  void *v3;
  void *v5;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  -[WBReader initialize](self, "initialize");
  +[WBDocument readFrom:](WBDocument, "readFrom:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)initialize
{
  WrdParser **v3;
  WrdObject *v4;
  _DWORD *v5;
  _DWORD *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *mAnnotationOwners;
  WrdObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD *v17;
  uint64_t i;
  WrdFieldPositionTable *v19;
  _DWORD *v20;
  _DWORD *v21;
  _DWORD *v22;
  _DWORD *v23;
  void *v24;
  _BYTE *v25;
  WBOfficeArtReaderState *v26;
  WBOfficeArtReaderState *mOfficeArtState;
  _QWORD *v28;

  v3 = -[WBReader wrdReader](self, "wrdReader");
  v4 = +[WBObjectFactory create:](WBObjectFactory, "create:", 38, WrdBinaryReader::initForReading(v3));
  self->mFootnoteTable = v5;
  v5[2] = 0;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 34))(v3, v5);
  self->mEndnoteTable = v6;
  v6[2] = 1;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 34))(v3, v6);
  self->mAnnotationTable = v7;
  (*((void (**)(WrdParser **, void *))*v3 + 37))(v3, v7);
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mAnnotationOwners = self->mAnnotationOwners;
  self->mAnnotationOwners = v8;

  v10 = +[WBObjectFactory create:](WBObjectFactory, "create:", 53);
  if (v10)
  else
    v11 = 0;
  *((_DWORD *)v11 + 2) = 36;
  (*((void (**)(WrdParser **, void *))*v3 + 38))(v3, v11);
  v12 = (*(_QWORD *)(*((_QWORD *)v11 + 2) + 16) - *(_QWORD *)(*((_QWORD *)v11 + 2) + 8)) >> 3;
  if ((int)v12 >= 1)
  {
    v13 = 0;
    do
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", WrdEmbeddedTTFRecordTable::getEmbeddedFontReference(*((WrdEmbeddedTTFRecordTable **)v11 + 2), (unsigned __int16)v13));
      -[NSMutableArray addObject:](self->mAnnotationOwners, "addObject:", v14);

      ++v13;
    }
    while ((_DWORD)v12 != v13);
  }
  (*(void (**)(void *))(*(_QWORD *)v11 + 8))(v11);
  self->mTableHeaders = v15;
  (*((void (**)(WrdParser **, void *))*v3 + 43))(v3, v15);
  self->mBookmarkTable = v16;
  (*((void (**)(WrdParser **, void *))*v3 + 33))(v3, v16);
  self->mAnnotationBookmarkTable = v17;
  v17[2] = 4;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 33))(v3, v17);
  for (i = 0; i != 8; ++i)
  {
    if (i == 3)
    {
      self->mFieldPositionTables[3] = 0;
    }
    else
    {
      self->mFieldPositionTables[i] = v19;
      *((_DWORD *)v19 + 2) = i;
      (*((void (**)(WrdParser **, WrdFieldPositionTable *))*v3 + 40))(v3, v19);
    }
  }
  self->mStoryTable = v20;
  v20[2] = 6;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 42))(v3, v20);
  self->mHeaderStoryTable = v21;
  v21[2] = 7;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 42))(v3, v21);
  self->mFileShapeAddressTable = v22;
  v22[2] = 0;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 41))(v3, v22);
  self->mFileShapeAddressHeaderTable = v23;
  v23[2] = 2;
  (*((void (**)(WrdParser **, _DWORD *))*v3 + 41))(v3, v23);
  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = operator new(0x10uLL);
  v25[8] = 0;
  *(_QWORD *)v25 = &unk_24F3B30A0;
  objc_msgSend(v24, "setEshFactory:", v25);

  v26 = -[WBOfficeArtReaderState initWithClient:]([WBOfficeArtReaderState alloc], "initWithClient:", objc_opt_class());
  mOfficeArtState = self->mOfficeArtState;
  self->mOfficeArtState = v26;

  -[WBOfficeArtReaderState setReader:](self->mOfficeArtState, "setReader:", self);
  v28 = (_QWORD *)operator new();
  v28[1] = 0;
  v28[2] = 0;
  *v28 = 0;
  self->mTextBoxes = v28;
}

- (void)setTargetDocument:(id)a3
{
  objc_storeWeak((id *)&self->mTargetDocument, a3);
}

- (void)addFont:(id)a3 index:(int)a4
{
  uint64_t v4;
  id v6;
  OITSUNoCopyDictionary *mIndexToFonts;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    v9 = v6;
    mIndexToFonts = self->mIndexToFonts;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUNoCopyDictionary setObject:forKey:](mIndexToFonts, "setObject:forKey:", v9, v8);

    v6 = v9;
  }

}

- (void)addStyle:(id)a3 index:(int)a4
{
  uint64_t v4;
  OITSUNoCopyDictionary *mIndexToStyles;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  mIndexToStyles = self->mIndexToStyles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary setObject:forKey:](mIndexToStyles, "setObject:forKey:", v8, v7);

}

- (id)styleAtIndex:(int)a3
{
  OITSUNoCopyDictionary *mIndexToStyles;
  void *v4;
  void *v5;

  mIndexToStyles = self->mIndexToStyles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary objectForKeyedSubscript:](mIndexToStyles, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fontAtIndex:(int)a3
{
  OITSUNoCopyDictionary *mIndexToFonts;
  void *v4;
  void *v5;

  mIndexToFonts = self->mIndexToFonts;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary objectForKey:](mIndexToFonts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)bookmarkTable
{
  return self->mBookmarkTable;
}

- (void)setReportProgress:(BOOL)a3
{
  self->mReportProgress = a3;
}

- (BOOL)reportProgress
{
  return self->mReportProgress;
}

- (void)footnoteTable
{
  return self->mFootnoteTable;
}

- (void)endnoteTable
{
  return self->mEndnoteTable;
}

- (void)annotationTable
{
  return self->mAnnotationTable;
}

- (void)annotationBookmarkTable
{
  return self->mAnnotationBookmarkTable;
}

- (void)fieldPositionTableForTextType:(int)a3
{
  return self->mFieldPositionTables[a3];
}

- (id)readCharactersForTextRun:(WrdTextRun *)a3
{
  return -[WBReader readCharactersFrom:to:textType:](self, "readCharactersFrom:to:textType:", a3->var2, a3->var3 + a3->var2, a3->var1);
}

- (id)readCharactersFrom:(unsigned int)a3 to:(unsigned int)a4 textType:(int)a5
{
  void *v9;
  void *v10;
  void *v11;
  void (**v13)(WrdText *__hidden);
  OcText v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  while (a3 < a4)
  {
    WrdText::WrdText((uint64_t)&v13, a5, a3, a4 - a3);
    v10 = -[WBReader wrdReader](self, "wrdReader");
    (*(void (**)(void *, void (***)(WrdText *__hidden)))(*(_QWORD *)v10 + 176))(v10, &v13);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithOcText:", &v14);
    if (v11)
      objc_msgSend(v9, "appendString:", v11);
    a3 += v14.var3;

    v13 = &off_24F3B40E8;
    OcText::~OcText(&v14);
  }
  return v9;
}

- (id)annotationRangeStart
{
  return self->mAnnotationRangeStart;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (void)setOfficeArtState:(id)a3
{
  objc_storeStrong((id *)&self->mOfficeArtState, a3);
}

- (void)setLastRowParagraphProperties:(void *)a3
{
  void *mLastRowParagraphProperties;

  mLastRowParagraphProperties = self->mLastRowParagraphProperties;
  if (mLastRowParagraphProperties)
    (*(void (**)(void *, SEL))(*(_QWORD *)mLastRowParagraphProperties + 8))(mLastRowParagraphProperties, a2);
  self->mLastRowParagraphProperties = a3;
}

- (void)lastRowParagraphProperties
{
  return self->mLastRowParagraphProperties;
}

- (void)tableHeaders
{
  return self->mTableHeaders;
}

- (unint64_t)textBoxCount
{
  return (uint64_t)(*((_QWORD *)self->mTextBoxes + 1) - *(_QWORD *)self->mTextBoxes) >> 4;
}

- (void)dealloc
{
  void *v3;
  void *mFootnoteTable;
  void *mEndnoteTable;
  void *mAnnotationTable;
  void *mTableHeaders;
  void *mBookmarkTable;
  void *mAnnotationBookmarkTable;
  void *mStoryTable;
  void *mHeaderStoryTable;
  void *mFileShapeAddressTable;
  void *mFileShapeAddressHeaderTable;
  WrdEshObjectFactory *mEshObjectFactory;
  void *mLastRowParagraphProperties;
  uint64_t i;
  WrdFieldPositionTable *v17;
  void *mTextBoxes;
  objc_super v19;
  void **v20;

  v3 = -[WBReader wrdReader](self, "wrdReader");
  if (v3)
    (*(void (**)(void *))(*(_QWORD *)v3 + 24))(v3);
  mFootnoteTable = self->mFootnoteTable;
  if (mFootnoteTable)
    (*(void (**)(void *))(*(_QWORD *)mFootnoteTable + 8))(mFootnoteTable);
  mEndnoteTable = self->mEndnoteTable;
  if (mEndnoteTable)
    (*(void (**)(void *))(*(_QWORD *)mEndnoteTable + 8))(mEndnoteTable);
  mAnnotationTable = self->mAnnotationTable;
  if (mAnnotationTable)
    (*(void (**)(void *))(*(_QWORD *)mAnnotationTable + 8))(mAnnotationTable);
  mTableHeaders = self->mTableHeaders;
  if (mTableHeaders)
    (*(void (**)(void *))(*(_QWORD *)mTableHeaders + 8))(mTableHeaders);
  mBookmarkTable = self->mBookmarkTable;
  if (mBookmarkTable)
    (*(void (**)(void *))(*(_QWORD *)mBookmarkTable + 8))(mBookmarkTable);
  mAnnotationBookmarkTable = self->mAnnotationBookmarkTable;
  if (mAnnotationBookmarkTable)
    (*(void (**)(void *))(*(_QWORD *)mAnnotationBookmarkTable + 8))(mAnnotationBookmarkTable);
  mStoryTable = self->mStoryTable;
  if (mStoryTable)
    (*(void (**)(void *))(*(_QWORD *)mStoryTable + 8))(mStoryTable);
  mHeaderStoryTable = self->mHeaderStoryTable;
  if (mHeaderStoryTable)
    (*(void (**)(void *))(*(_QWORD *)mHeaderStoryTable + 8))(mHeaderStoryTable);
  mFileShapeAddressTable = self->mFileShapeAddressTable;
  if (mFileShapeAddressTable)
    (*(void (**)(void *))(*(_QWORD *)mFileShapeAddressTable + 8))(mFileShapeAddressTable);
  mFileShapeAddressHeaderTable = self->mFileShapeAddressHeaderTable;
  if (mFileShapeAddressHeaderTable)
    (*(void (**)(void *))(*(_QWORD *)mFileShapeAddressHeaderTable + 8))(mFileShapeAddressHeaderTable);
  mEshObjectFactory = self->mEshObjectFactory;
  if (mEshObjectFactory)
    (*((void (**)(WrdEshObjectFactory *))mEshObjectFactory->var0 + 1))(mEshObjectFactory);
  mLastRowParagraphProperties = self->mLastRowParagraphProperties;
  if (mLastRowParagraphProperties)
    (*(void (**)(void *))(*(_QWORD *)mLastRowParagraphProperties + 8))(mLastRowParagraphProperties);
  for (i = 0; i != 8; ++i)
  {
    v17 = self->mFieldPositionTables[i];
    if (v17)
      (*(void (**)(WrdFieldPositionTable *))(*(_QWORD *)v17 + 8))(v17);
  }
  mTextBoxes = self->mTextBoxes;
  if (mTextBoxes)
  {
    v20 = (void **)self->mTextBoxes;
    std::vector<WBTextBoxReaderInfo>::__destroy_vector::operator()[abi:ne180100](&v20);
    MEMORY[0x22E2DD408](mTextBoxes, 0x20C40960023A9);
  }
  v19.receiver = self;
  v19.super_class = (Class)WBReader;
  -[OCBReader dealloc](&v19, sel_dealloc);
}

- (WDDocument)targetDocument
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mTargetDocument);
}

- (void)cacheTextBox:(id)a3 withChainIndex:(unsigned __int16)a4
{
  id v6;
  uint64_t *mTextBoxes;
  id v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];

  v6 = a3;
  mTextBoxes = (uint64_t *)self->mTextBoxes;
  v8 = v6;
  v9 = mTextBoxes[1];
  v10 = mTextBoxes[2];
  if (v9 >= v10)
  {
    v12 = (uint64_t)(v9 - *mTextBoxes) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v14 = v10 - *mTextBoxes;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v25[4] = mTextBoxes + 2;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(mTextBoxes + 2), v15);
    v18 = &v16[16 * v12];
    *(_QWORD *)v18 = v8;
    *((_WORD *)v18 + 4) = a4;
    v19 = *mTextBoxes;
    v20 = mTextBoxes[1];
    v21 = v18;
    if (v20 != *mTextBoxes)
    {
      v22 = mTextBoxes[1];
      do
      {
        v23 = *(_QWORD *)(v22 - 16);
        v22 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v21 - 2) = v23;
        v21 -= 16;
        *((_WORD *)v21 + 4) = *(_WORD *)(v22 + 8);
      }
      while (v22 != v19);
    }
    v11 = v18 + 16;
    *mTextBoxes = (uint64_t)v21;
    v25[0] = v19;
    v25[1] = v19;
    mTextBoxes[1] = (uint64_t)(v18 + 16);
    v25[2] = v20;
    v24 = mTextBoxes[2];
    mTextBoxes[2] = (uint64_t)&v16[16 * v17];
    v25[3] = v24;
    std::__split_buffer<WBTextBoxReaderInfo>::~__split_buffer((uint64_t)v25);
  }
  else
  {
    *(_QWORD *)v9 = v8;
    *(_WORD *)(v9 + 8) = a4;
    v11 = (char *)(v9 + 16);
  }
  mTextBoxes[1] = (uint64_t)v11;

}

- (void)fileShapeAddressTable
{
  return self->mFileShapeAddressTable;
}

- (id)drawableForShapeId:(unsigned int)a3
{
  return -[OABReaderState drawableForShapeId:](self->mOfficeArtState, "drawableForShapeId:", *(_QWORD *)&a3);
}

- (void)fileShapeAddressHeaderTable
{
  return self->mFileShapeAddressHeaderTable;
}

- (WBTextBoxReaderInfo)textBoxInfoAtIndex:(unint64_t)a3
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  WBTextBoxReaderInfo result;

  v3 = *(_QWORD *)self->mTextBoxes + 16 * a3;
  v4 = *(id *)v3;
  v5 = *(unsigned __int16 *)(v3 + 8);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)storyTable
{
  return self->mStoryTable;
}

- (void)headerStoryTable
{
  return self->mHeaderStoryTable;
}

- (id)annotationOwner:(int)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mAnnotationOwners, "objectAtIndex:", a3);
}

- (void)setAnnotationRangeStart:(id)a3
{
  objc_storeStrong(&self->mAnnotationRangeStart, a3);
}

- (WBReader)initWithCancelDelegate:(id)a3
{
  id v4;
  WBReader *v5;
  WrdBinaryReader *v6;
  OITSUNoCopyDictionary *v7;
  OITSUNoCopyDictionary *mIndexToStyles;
  OITSUNoCopyDictionary *v9;
  OITSUNoCopyDictionary *mIndexToFonts;
  NSMutableDictionary *v11;
  NSMutableDictionary *mBookmarkIndexToAnnotationRangeStartMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *mPreviousFlowElement;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBReader;
  v5 = -[OCBReader initWithCancelDelegate:](&v16, sel_initWithCancelDelegate_, v4);
  if (v5)
  {
    v6 = (WrdBinaryReader *)operator new(0x2C0uLL);
    WrdBinaryReader::WrdBinaryReader(v6);
    -[OCBReader setBinaryReader:](v5, "setBinaryReader:", v6);
    v7 = objc_alloc_init(OITSUNoCopyDictionary);
    mIndexToStyles = v5->mIndexToStyles;
    v5->mIndexToStyles = v7;

    v9 = objc_alloc_init(OITSUNoCopyDictionary);
    mIndexToFonts = v5->mIndexToFonts;
    v5->mIndexToFonts = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mBookmarkIndexToAnnotationRangeStartMap = v5->mBookmarkIndexToAnnotationRangeStartMap;
    v5->mBookmarkIndexToAnnotationRangeStartMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mPreviousFlowElement = v5->mPreviousFlowElement;
    v5->mPreviousFlowElement = v13;

  }
  return v5;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
  WrdStreamer *v7;

  v7 = (WrdStreamer *)operator new();
  WrdStreamer::WrdStreamer(v7, (WrdBinaryReader *)-[WBReader wrdReader](self, "wrdReader"), a3, a4);
  return (OCCBinaryStreamer *)v7;
}

- (WrdEshObjectFactory)eshObjectFactory
{
  return self->mEshObjectFactory;
}

- (id)styleAtIndex:(int)a3 expectedType:(int)a4
{
  void *v5;
  void *v6;

  -[WBReader styleAtIndex:](self, "styleAtIndex:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "type") != a4)
  {

    v6 = 0;
  }
  return v6;
}

- (NSMutableDictionary)previousFlowElement
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTargetDocument);
  objc_storeStrong((id *)&self->mBookmarkIndexToAnnotationRangeStartMap, 0);
  objc_storeStrong(&self->mAnnotationRangeStart, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mPreviousFlowElement, 0);
  objc_storeStrong((id *)&self->mIndexToFonts, 0);
  objc_storeStrong((id *)&self->mIndexToStyles, 0);
  objc_storeStrong((id *)&self->mAnnotationOwners, 0);
}

- (id)annotationRangeStartForBookmarkIndex:(unint64_t)a3
{
  NSMutableDictionary *mBookmarkIndexToAnnotationRangeStartMap;
  void *v4;
  void *v5;

  mBookmarkIndexToAnnotationRangeStartMap = self->mBookmarkIndexToAnnotationRangeStartMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mBookmarkIndexToAnnotationRangeStartMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAnnotationRangeStart:(id)a3 forBookmarkIndex:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *mBookmarkIndexToAnnotationRangeStartMap;
  void *v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    v9 = v6;
    mBookmarkIndexToAnnotationRangeStartMap = self->mBookmarkIndexToAnnotationRangeStartMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](mBookmarkIndexToAnnotationRangeStartMap, "setObject:forKeyedSubscript:", v9, v8);

    v6 = v9;
  }

}

@end
