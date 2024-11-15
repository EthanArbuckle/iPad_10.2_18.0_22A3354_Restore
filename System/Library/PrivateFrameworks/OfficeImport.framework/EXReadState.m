@implementation EXReadState

- (EXReadState)initWithWorkbookPart:(id)a3 cancelDelegate:(id)a4
{
  id v7;
  id v8;
  EXReadState *v9;
  EXReadState *v10;
  NSMutableArray *v11;
  NSMutableArray *mArrayedFormulas;
  EXOfficeArtState *v13;
  EXOfficeArtState *mOfficeArtState;
  EXOAVState *v15;
  EXOAVState *mOAVState;
  NSMutableDictionary *v17;
  NSMutableDictionary *mReferenceForCommentTextBox;
  NSMutableArray *v19;
  NSMutableArray *mLegacyDrawables;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EXReadState;
  v9 = -[OCXState init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWorkbookPart, a3);
    objc_storeStrong((id *)&v10->mCancelDelegate, a4);
    v10->mCurrentSheetIndex = 0;
    v10->mCellStyleXfsOffset = 0;
    v10->mDefaultColumnWidth = -1.0;
    v10->mDefaultRowHeight = -1.0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mArrayedFormulas = v10->mArrayedFormulas;
    v10->mArrayedFormulas = v11;

    v13 = -[EXOfficeArtState initWithExcelState:]([EXOfficeArtState alloc], "initWithExcelState:", v10);
    mOfficeArtState = v10->mOfficeArtState;
    v10->mOfficeArtState = v13;

    v15 = -[EXOAVState initWithEXReadState:packagePart:]([EXOAVState alloc], "initWithEXReadState:packagePart:", v10, 0);
    mOAVState = v10->mOAVState;
    v10->mOAVState = v15;

    -[OAXDrawingState setOavState:](v10->mOfficeArtState, "setOavState:", v10->mOAVState);
    -[OAVReadState setOaxState:](v10->mOAVState, "setOaxState:", v10->mOfficeArtState);
    v10->mMaxColumnsWarned = 0;
    v10->mMaxRowsWarned = 0;
    v10->mIsPredefinedTableStylesRead = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mReferenceForCommentTextBox = v10->mReferenceForCommentTextBox;
    v10->mReferenceForCommentTextBox = v17;

    v10->mIsPredefinedDxfsBeingRead = 0;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mLegacyDrawables = v10->mLegacyDrawables;
    v10->mLegacyDrawables = v19;

    v10->mCurrentRowMinColumnIndex = 0;
    v10->mCurrentRowMaxColumnIndex = 0;
  }

  return v10;
}

- (unsigned)currentSheetIndex
{
  return self->mCurrentSheetIndex;
}

- (void)setCurrentSheetIndex:(unsigned int)a3
{
  self->mCurrentSheetIndex = a3;
}

- (unsigned)currentRowMinColumnIndex
{
  return self->mCurrentRowMinColumnIndex;
}

- (void)setCurrentRowMinColumnIndex:(unsigned int)a3
{
  self->mCurrentRowMinColumnIndex = a3;
}

- (unsigned)currentRowMaxColumnIndex
{
  return self->mCurrentRowMaxColumnIndex;
}

- (void)setCurrentRowMaxColumnIndex:(unsigned int)a3
{
  self->mCurrentRowMaxColumnIndex = a3;
}

- (id)workbook
{
  return self->mWorkbook;
}

- (void)setWorkbook:(id)a3
{
  EXOfficeArtState *mOfficeArtState;
  void *v6;
  EXOfficeArtState *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->mWorkbook, a3);
  mOfficeArtState = self->mOfficeArtState;
  objc_msgSend(v9, "blips");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBlipCollection:](mOfficeArtState, "setTargetBlipCollection:", v6);

  v7 = self->mOfficeArtState;
  objc_msgSend(v9, "bulletBlips");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBulletBlipArray:](v7, "setTargetBulletBlipArray:", v8);

}

- (id)resources
{
  return self->mResources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->mResources, a3);
}

- (id)currentSheet
{
  return self->mCurrentSheet;
}

- (void)setCurrentSheet:(id)a3
{
  EDSheet *v5;
  map<long, unsigned long, std::less<long>, std::allocator<std::pair<const long, unsigned long>>> *p_mSharedFormulasMap;
  EDSheet *v7;

  v5 = (EDSheet *)a3;
  if (self->mCurrentSheet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->mCurrentSheet, a3);
    p_mSharedFormulasMap = &self->mSharedFormulasMap;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)p_mSharedFormulasMap, (_QWORD *)p_mSharedFormulasMap->__tree_.__pair1_.__value_.__left_);
    v5 = v7;
    p_mSharedFormulasMap->__tree_.__begin_node_ = &p_mSharedFormulasMap->__tree_.__pair1_;
    p_mSharedFormulasMap->__tree_.__pair3_.__value_ = 0;
    p_mSharedFormulasMap->__tree_.__pair1_.__value_.__left_ = 0;
  }

}

- (unint64_t)cellStyleXfsOffset
{
  return self->mCellStyleXfsOffset;
}

- (void)setCellStyleXfsOffset:(unint64_t)a3
{
  self->mCellStyleXfsOffset = a3;
}

- (double)defaultColumnWidth
{
  return self->mDefaultColumnWidth;
}

- (void)setDefaultColumnWidth:(double)a3
{
  self->mDefaultColumnWidth = a3;
}

- (double)defaultRowHeight
{
  return self->mDefaultRowHeight;
}

- (void)setDefaultRowHeight:(double)a3
{
  self->mDefaultRowHeight = a3;
}

- (id)currentPart
{
  return self->mCurrentPart;
}

- (void)setCurrentPart:(id)a3
{
  OCPPackagePart *v5;
  OCPPackagePart *v6;

  v5 = (OCPPackagePart *)a3;
  if (self->mCurrentPart != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mCurrentPart, a3);
    v5 = v6;
  }

}

- (id)workbookPart
{
  return self->mWorkbookPart;
}

- (unint64_t)sharedBaseFormulaIndexWithIndex:(int64_t)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<long, unsigned long>, void *>>> *p_pair1;
  int64_t v5;
  BOOL v6;
  char **v7;

  left = (char *)self->mSharedFormulasMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return 0xFFFFFFFFLL;
  p_pair1 = &self->mSharedFormulasMap.__tree_.__pair1_;
  do
  {
    v5 = *((_QWORD *)left + 4);
    v6 = v5 < a3;
    if (v5 >= a3)
      v7 = (char **)left;
    else
      v7 = (char **)(left + 8);
    if (!v6)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<long, unsigned long>, void *>>> *)left;
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->mSharedFormulasMap.__tree_.__pair1_ && (uint64_t)p_pair1[4].__value_.__left_ <= a3)
    return (unint64_t)p_pair1[5].__value_.__left_;
  else
    return 0xFFFFFFFFLL;
}

- (void)addSharedBaseFormulaIndex:(unint64_t)a3 withIndex:(int64_t)a4
{
  uint64_t v4;
  uint64_t *v5;

  v4 = a4;
  v5 = &v4;
  std::__tree<std::__value_type<long,unsigned long>,std::__map_value_compare<long,std::__value_type<long,unsigned long>,std::less<long>,true>,std::allocator<std::__value_type<long,unsigned long>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->mSharedFormulasMap, &v4, (uint64_t)&std::piecewise_construct, &v5)[5] = a3;
}

- (id)arrayedFormulas
{
  return self->mArrayedFormulas;
}

- (id)sheetDimension
{
  return self->mSheetDimension;
}

- (void)setSheetDimension:(id)a3
{
  EDReference *v5;
  EDReference *v6;

  v5 = (EDReference *)a3;
  if (self->mSheetDimension != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mSheetDimension, a3);
    v5 = v6;
  }

}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (void)setOfficeArtState:(id)a3
{
  EXOfficeArtState *v5;
  EXOfficeArtState *v6;

  v5 = (EXOfficeArtState *)a3;
  if (self->mOfficeArtState != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mOfficeArtState, a3);
    v5 = v6;
  }

}

- (id)oavState
{
  return self->mOAVState;
}

- (void)setTextBox:(id)a3 author:(id)a4 forReference:(id)a5
{
  id v8;
  id v9;
  OITSUPair *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[OITSUPair initWithFirst:second:]([OITSUPair alloc], "initWithFirst:second:", v11, v8);
  -[NSMutableDictionary setObject:forKey:](self->mReferenceForCommentTextBox, "setObject:forKey:", v10, v9);

}

- (id)textBoxForReference:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->mReferenceForCommentTextBox, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authorForReference:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->mReferenceForCommentTextBox, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isPredefinedTableStylesRead
{
  return self->mIsPredefinedTableStylesRead;
}

- (void)setPredefinedTableStylesRead:(BOOL)a3
{
  self->mIsPredefinedTableStylesRead = a3;
}

- (void)resetForNewSheet
{
  -[NSMutableDictionary removeAllObjects](self->mReferenceForCommentTextBox, "removeAllObjects");
  -[OAXDrawingState resetForNewDrawing](self->mOfficeArtState, "resetForNewDrawing");
  -[OAVReadState resetForNewDrawing](self->mOAVState, "resetForNewDrawing");
  -[NSMutableArray removeAllObjects](self->mLegacyDrawables, "removeAllObjects");
}

- (BOOL)isPredefinedDxfsBeingRead
{
  return self->mIsPredefinedDxfsBeingRead;
}

- (void)setPredefinedDxfsBeingRead:(BOOL)a3
{
  self->mIsPredefinedDxfsBeingRead = a3;
}

- (_xmlNs)relationshipNameSpaceForWorkbook
{
  return self->mRelationshipNS;
}

- (void)relationshipNameSpaceForWorkbook:(_xmlNs *)a3
{
  self->mRelationshipNS = a3;
}

- (id)columnWidthConvertor
{
  ECColumnWidthConvertor *mColumnWidthConvertor;
  ECColumnWidthConvertor *v4;
  ECColumnWidthConvertor *v5;
  ECColumnWidthConvertor *v6;
  void *v7;
  void *v8;
  void *v9;

  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    v4 = objc_alloc_init(ECColumnWidthConvertor);
    v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    v6 = self->mColumnWidthConvertor;
    -[EDResources styles](self->mResources, "styles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultWorkbookStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECColumnWidthConvertor setupWithEDFont:state:](v6, "setupWithEDFont:state:", v9, 0);

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (id)legacyDrawables
{
  return self->mLegacyDrawables;
}

- (void)reportWarning:(id)a3
{
  EDSheet *mCurrentSheet;
  void *v5;
  id v6;

  v6 = a3;
  mCurrentSheet = self->mCurrentSheet;
  if (mCurrentSheet)
    -[EDSheet warnings](mCurrentSheet, "warnings");
  else
    -[EDWorkbook warnings](self->mWorkbook, "warnings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addWarning:", v6);

}

- (void)reportWorksheetWarning:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->mCurrentSheet && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[EDSheet worksheetWarnings](self->mCurrentSheet, "worksheetWarnings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EDWorkbook warnings](self->mWorkbook, "warnings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "addWarning:", v6);

}

- (BOOL)isCancelled
{
  return -[TCCancelDelegate isCancelled](self->mCancelDelegate, "isCancelled");
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3;
  CXNamespace *v5;
  CXNamespace *v6;
  CXNamespace *v7;
  CXNamespace *v8;
  CXNamespace *v9;
  CXNamespace *v10;
  CXNamespace *v11;
  CXNamespace *v12;
  CXNamespace *v13;
  CXNamespace *v14;
  CXNamespace *v15;
  CXNamespace *v16;
  objc_super v17;

  v3 = *(_QWORD *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)EXReadState;
  -[OCXState setupNSForXMLFormat:](&v17, sel_setupNSForXMLFormat_);
  v5 = [CXNamespace alloc];
  if ((_DWORD)v3)
  {
    v6 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/spreadsheetml/2006/main");
    v7 = -[CXNamespace initWithUri:fallbackNamespace:](v5, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/spreadsheetml/main", v6);
    -[EXReadState setEXSpreadsheetMLNamespace:](self, "setEXSpreadsheetMLNamespace:", v7);

    v8 = [CXNamespace alloc];
    v9 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing");
    v10 = -[CXNamespace initWithUri:fallbackNamespace:](v8, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/spreadsheetDrawing", v9);
    -[EXReadState setEXSpreadsheetDrawingNamespace:](self, "setEXSpreadsheetDrawingNamespace:", v10);

    v11 = [CXNamespace alloc];
    v12 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    v13 = -[CXNamespace initWithUri:fallbackNamespace:](v11, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/officeDocument/relationships", v12);
    -[EXReadState setEXSpreadsheetRelationsNamespace:](self, "setEXSpreadsheetRelationsNamespace:", v13);

  }
  else
  {
    v14 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/spreadsheetml/2006/7/main");
    v15 = -[CXNamespace initWithUri:fallbackNamespace:](v5, "initWithUri:fallbackNamespace:", "http://schemas.openxmlformats.org/spreadsheetml/2006/main", v14);
    -[EXReadState setEXSpreadsheetMLNamespace:](self, "setEXSpreadsheetMLNamespace:", v15);

    v16 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing");
    -[EXReadState setEXSpreadsheetDrawingNamespace:](self, "setEXSpreadsheetDrawingNamespace:", v16);

    v12 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    -[EXReadState setEXSpreadsheetRelationsNamespace:](self, "setEXSpreadsheetRelationsNamespace:", v12);
  }

  -[OAXDrawingState setupNSForXMLFormat:](self->mOfficeArtState, "setupNSForXMLFormat:", v3);
  -[OCXState setupNSForXMLFormat:](self->mOAVState, "setupNSForXMLFormat:", v3);
}

- (CXNamespace)EXSpreadsheetMLNamespace
{
  return self->mEXSpreadsheetMLNamespace;
}

- (void)setEXSpreadsheetMLNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mEXSpreadsheetMLNamespace, a3);
}

- (CXNamespace)EXSpreadsheetDrawingNamespace
{
  return self->mEXSpreadsheetDrawingNamespace;
}

- (void)setEXSpreadsheetDrawingNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mEXSpreadsheetDrawingNamespace, a3);
}

- (CXNamespace)EXSpreadsheetRelationsNamespace
{
  return self->mEXSpreadsheetRelationsNamespace;
}

- (void)setEXSpreadsheetRelationsNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mEXSpreadsheetRelationsNamespace, a3);
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEXSpreadsheetRelationsNamespace, 0);
  objc_storeStrong((id *)&self->mEXSpreadsheetDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mEXSpreadsheetMLNamespace, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
  objc_storeStrong((id *)&self->mLegacyDrawables, 0);
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
  objc_storeStrong((id *)&self->mReferenceForCommentTextBox, 0);
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mSheetDimension, 0);
  objc_storeStrong((id *)&self->mArrayedFormulas, 0);
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mSharedFormulasMap, (_QWORD *)self->mSharedFormulasMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->mWorkbookPart, 0);
  objc_storeStrong((id *)&self->mCurrentPart, 0);
  objc_storeStrong((id *)&self->mCurrentSheet, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = (char *)self + 96;
  return self;
}

@end
