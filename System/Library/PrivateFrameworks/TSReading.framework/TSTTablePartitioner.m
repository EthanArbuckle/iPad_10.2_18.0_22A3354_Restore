@implementation TSTTablePartitioner

- (TSTTablePartitioner)initWithInfo:(id)a3
{
  TSTTableInfo *v4;
  void *v5;
  uint64_t v6;
  TSTTablePartitioner *v7;
  TSTTablePartitioner *v8;
  objc_super v15;

  objc_opt_class();
  v4 = (TSTTableInfo *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner initWithInfo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 56, CFSTR("Incorrect info class in the table partitioner!"));
  }
  v15.receiver = self;
  v15.super_class = (Class)TSTTablePartitioner;
  v7 = -[TSTTablePartitioner init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->mTableInfo = v4;
    v7->mFirstPartitionWidth = -1.0;
    if (-[TSDDrawableInfo isInlineWithText](v4, "isInlineWithText"))
      _Q0 = (CGSize)*MEMORY[0x24BDBF148];
    else
      __asm { FMOV            V0.2D, #1.0 }
    v8->mScaleToFit = _Q0;
    v8->mHintMatricesByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    v8->mPartitioningPassCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8->mScaledLayout = 0;
    -[TSTTablePartitioner setInfoGeometry:](v8, "setInfoGeometry:", -[TSDDrawableInfo geometry](v4, "geometry"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)-[TSUPointerKeyDictionary allValues](self->mHintMatricesByCanvas, "allValues"), "makeObjectsPerformSelector:", sel_removeAllObjects);
  -[TSUPointerKeyDictionary removeAllObjects](self->mHintMatricesByCanvas, "removeAllObjects");

  self->mHintMatricesByCanvas = 0;
  self->mPartitioningPassCache = 0;
  self->mTableInfo = 0;

  self->mScaledLayout = 0;
  self->mInfoGeometry = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTTablePartitioner;
  -[TSTTablePartitioner dealloc](&v3, sel_dealloc);
}

- (void)setScaleToFit:(CGSize)a3
{
  self->mScaleToFit = a3;
}

- (void)validateScaledLayout
{
  TSTMasterLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = -[TSTTableInfo masterLayout](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "masterLayout");
  -[TSTMasterLayout maximumPartitionSize](v3, "maximumPartitionSize");
  v5 = v4;
  v7 = v6;
  -[TSTMasterLayout setMaximumPartitionSize:](v3, "setMaximumPartitionSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[TSTLayout validate](-[TSTTablePartitioner scaledLayout](self, "scaledLayout"), "validate");
  -[TSTMasterLayout setMaximumPartitionSize:](v3, "setMaximumPartitionSize:", v5, v7);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)measureCellRangeForNextPartitionOfSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  TSTLayout *v10;
  TSTMasterLayout *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  double v18;
  double v19;
  unsigned int TableNumberOfRows;
  unsigned int TableNumberOfColumns;
  uint64_t TableNumberOfHeaderRows;
  unsigned int TableNumberOfHeaderColumns;
  _BOOL4 v24;
  _BOOL4 v25;
  uint64_t v26;
  double v27;
  _BOOL4 v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  int TableNameVisible;
  double v34;
  double v35;
  double CanvasStrokeFrameForRange;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  unsigned int CellIDHitByCanvasPoint;
  unsigned __int16 v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  unsigned __int16 v50;
  unsigned int v51;
  unsigned int v52;
  unsigned __int16 v54;
  unsigned __int8 v55;
  __int16 v56;
  __int16 v57;
  unsigned __int8 v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t Range;
  unsigned int v64;
  unsigned int TableNumberOfFooterRows;
  unsigned int range1;
  unint64_t range1_8;
  unint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  NSRange v72;
  NSRange v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v10 = -[TSTTablePartitioner scaledLayout](self, "scaledLayout");
  v11 = -[TSTTableInfo masterLayout](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "masterLayout");
  v69 = -[TSDDrawableInfo isInlineWithText](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "isInlineWithText");
  -[TSTTablePartitioner validateScaledLayout](self, "validateScaledLayout");
  if (!a4)
  {
    LODWORD(range1_8) = 0;
    LOWORD(v68) = 0;
    LOBYTE(v16) = 0;
    v17 = 0;
    goto LABEL_14;
  }
  v12 = objc_msgSend(a4, "cellRange");
  if ((_WORD)v12 == 0xFFFF || (v12 & 0xFF0000) == 0xFF0000 || !HIWORD(v12) || (v12 & 0xFFFF00000000) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 114, CFSTR("Partitioner can't continue from an invalid range."));
  }
  v15 = objc_msgSend(a4, "cellRange");
  if (!v5)
  {
    v17 = HIWORD(v15) + v15;
    v16 = (unint64_t)objc_msgSend(a4, "cellRange") >> 16;
    objc_msgSend(a4, "maximumSize");
    if (width == v19)
    {
      LODWORD(range1_8) = 0;
      v68 = (unint64_t)objc_msgSend(a4, "cellRange") >> 32;
      goto LABEL_14;
    }
LABEL_13:
    LODWORD(range1_8) = 0;
    LOWORD(v68) = 0;
    goto LABEL_14;
  }
  LODWORD(v16) = HIDWORD(v15) + WORD1(v15);
  v17 = objc_msgSend(a4, "cellRange");
  objc_msgSend(a4, "maximumSize");
  if (height != v18)
    goto LABEL_13;
  range1_8 = (unint64_t)objc_msgSend(a4, "cellRange") >> 48;
  LOWORD(v68) = 0;
LABEL_14:
  Range = TSTMasterLayoutGetRange((uint64_t)v11);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v11);
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)v11);
  TableNumberOfHeaderRows = TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)v11);
  TableNumberOfHeaderColumns = TSTMasterLayoutGetTableNumberOfHeaderColumns((unsigned __int16 *)v11);
  v64 = TableNumberOfRows;
  TableNumberOfFooterRows = TSTMasterLayoutGetTableNumberOfFooterRows((unsigned __int16 *)v11);
  v70 = TableNumberOfRows;
  v24 = -[TSTTableModel repeatingHeaderRowsEnabled](-[TSTTableInfo tableModel](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "tableModel"), "repeatingHeaderRowsEnabled");
  v25 = -[TSTTableModel repeatingHeaderColumnsEnabled](-[TSTTableInfo tableModel](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "tableModel"), "repeatingHeaderColumnsEnabled");
  if (v24 && (_WORD)v17)
  {
    if (TableNumberOfColumns >= 0xFF)
      v26 = 255;
    else
      v26 = TableNumberOfColumns;
    TSTLayoutGetStrokeFrameForRange(v10, (v26 << 32) | (TableNumberOfHeaderRows << 48));
    height = height - v27;
  }
  if ((_BYTE)v16)
    v28 = v25;
  else
    v28 = 0;
  if (v28)
  {
    if (TableNumberOfHeaderColumns >= 0xFF)
      v29 = 255;
    else
      v29 = TableNumberOfHeaderColumns;
    TSTLayoutGetStrokeFrameForRange(v10, (v70 << 48) | (v29 << 32));
    width = width - v30;
  }
  TSTLayoutGetTableNameHeight((uint64_t)v10);
  range1 = TableNumberOfHeaderRows;
  if (!(_WORD)v17)
  {
    v32 = v31;
    TableNameVisible = TSTLayoutGetTableNameVisible((uint64_t)v10);
    v34 = 0.0;
    if (TableNameVisible)
      v34 = v32;
    height = height - v34;
  }
  if (width > 0.0)
    v35 = width;
  else
    v35 = 0.0;
  if (height <= 0.0)
    height = 0.0;
  CanvasStrokeFrameForRange = TSTLayoutGetCanvasStrokeFrameForRange(v10, (unsigned __int16)v17 | (v16 << 16) | 0x1000100000000);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v43 = v35 + CanvasStrokeFrameForRange;
  v44 = height + v37;
  CellIDHitByCanvasPoint = TSTLayoutGetCellIDHitByCanvasPoint(v10, v43, v44);
  v46 = CellIDHitByCanvasPoint;
  v47 = HIWORD(CellIDHitByCanvasPoint);
  v74.origin.x = CanvasStrokeFrameForRange;
  v74.origin.y = v38;
  v74.size.width = v40;
  v74.size.height = v42;
  if (CGRectGetMinX(v74) <= v43)
  {
    v75.origin.x = CanvasStrokeFrameForRange;
    v75.origin.y = v38;
    v75.size.width = v40;
    v75.size.height = v42;
    if (CGRectGetMaxX(v75) >= v43)
      LOBYTE(v47) = v16;
  }
  v76.origin.x = CanvasStrokeFrameForRange;
  v76.origin.y = v38;
  v76.size.width = v40;
  v76.size.height = v42;
  if (CGRectGetMinY(v76) <= v44)
  {
    v77.origin.x = CanvasStrokeFrameForRange;
    v77.origin.y = v38;
    v77.size.width = v40;
    v77.size.height = v42;
    if (CGRectGetMaxY(v77) >= v44)
      v46 = v17;
  }
  v48 = v46;
  if ((unsigned __int16)v17 > v46)
    v48 = (unsigned __int16)v17;
  if (v16 <= v47)
    v47 = v47;
  else
    v47 = v16;
  if (v48 == 0xFFFF)
    v49 = (v70 - v17);
  else
    v49 = range1_8;
  if (v47 == 255)
    v50 = TableNumberOfColumns - v16;
  else
    v50 = v68;
  if (!(_WORD)v49)
  {
    v51 = v64 + ~TableNumberOfFooterRows;
    v52 = v48 - v17;
    if ((unsigned __int16)v17 >= v46)
      ++v52;
    if ((unsigned __int16)(v52 - 1) < range1 && (unsigned __int16)v17 == 0)
      v49 = range1 + 1;
    else
      v49 = v52;
    if ((unsigned __int16)(v17 + v49 - 1) >= (unsigned __int16)v51
      && (unsigned __int16)(Range + HIWORD(Range) - 1) != (unsigned __int16)(v17 + v49 - 1))
    {
      v72.location = range1;
      v72.length = v70 - (TableNumberOfFooterRows + (unint64_t)range1);
      v73.location = (unsigned __int16)v17;
      v73.length = (unsigned __int16)v49;
      if (NSIntersectionRange(v72, v73).length < 2)
        v49 = HIWORD(Range) - v17;
      else
        v49 = v51 - v17;
    }
  }
  if (v69)
  {
    v54 = -[TSTTableModel numberOfColumns](-[TSTTableInfo tableModel](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "tableModel"), "numberOfColumns");
    v55 = 0;
  }
  else
  {
    v56 = v47 - v16;
    if (!v56)
      v56 = 1;
    if (TableNumberOfHeaderColumns > (v56 - 1))
      v57 = TableNumberOfHeaderColumns + 1;
    else
      v57 = v56;
    if ((_BYTE)v16)
    {
      v58 = v16;
    }
    else
    {
      v56 = v57;
      v58 = 0;
    }
    if (v50)
      v54 = v50;
    else
      v54 = v56;
    if (v50)
      v55 = v16;
    else
      v55 = v58;
  }
  v59 = (unsigned __int16)v17 | ((unint64_t)v55 << 16) | (v49 << 48) | ((unint64_t)v54 << 32);
  if ((_WORD)v17 == 0xFFFF || v55 == 0xFF || !v54 || !HIWORD(v59))
  {
    v60 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v61 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:]");
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 262, CFSTR("Partitioner measured an invalid range."));
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v59;
}

- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  _BOOL8 v8;
  double height;
  CGFloat width;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TSTLayoutHint *v20;
  unsigned int v21;
  unsigned __int8 v22;
  unsigned __int16 v23;
  unsigned int v24;
  uint64_t v25;
  TSTMasterLayout *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unsigned int v49;
  TSTLayout *v50;
  $CA3468F20078D5D2DB35E78E73CA60DA v51;
  TSTLayout *v52;
  double StrokeFrame;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  $CA3468F20078D5D2DB35E78E73CA60DA v63;

  v8 = a6;
  height = a3.height;
  width = a3.width;
  objc_opt_class();
  v14 = TSUDynamicCast();
  v15 = (void *)v14;
  if (a5 && !v14)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 269, CFSTR("previousHint must be nil, or of type TSTLayoutHint."));
  }
  if (objc_msgSend(v15, "layout")
    && (TSTTableInfo *)objc_msgSend((id)objc_msgSend(v15, "layout"), "info") != self->mTableInfo)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:]");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 270, CFSTR("Hint is for the wrong table info."));
  }
  if (v15)
  {
    if (-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:](self, "p_didFinishPartitioningHint:horizontally:", v15, v8))
    {
      return 0;
    }
    v24 = objc_msgSend(v15, "cacheHintID");
    v21 = HIBYTE(v24);
    if (v8)
      v22 = BYTE2(v24) + 1;
    else
      v22 = BYTE2(v24);
    if (v8)
      v23 = v24;
    else
      v23 = v24 + 1;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rootLayout"), "layoutController"), "canvas");
  if (!v25)
    v25 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  if (!-[TSUPointerKeyDictionary objectForKey:](self->mHintMatricesByCanvas, "objectForKey:", v25))
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mHintMatricesByCanvas, "setObject:forUncopiedKey:", objc_alloc_init(MEMORY[0x24BDBCED8]), v25);
  v20 = objc_alloc_init(TSTLayoutHint);
  v26 = -[TSTTableInfo masterLayout](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "masterLayout");
  -[TSTMasterLayout maximumPartitionSize](v26, "maximumPartitionSize");
  -[TSTMasterLayout setMaximumPartitionSize:](v26, "setMaximumPartitionSize:", TSDSizeWithMaxArea(v27, v28, width, height));
  -[TSTTablePartitioner scaleToFit](self, "scaleToFit");
  v31 = *MEMORY[0x24BDBF148];
  v30 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (*MEMORY[0x24BDBF148] == v32
    && v30 == v29
    && !-[TSDDrawableInfo isInlineWithText](self->mTableInfo, "isInlineWithText"))
  {
    -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", 1.0, 1.0);
  }
  else if (-[TSDDrawableInfo isInlineWithText](self->mTableInfo, "isInlineWithText"))
  {
    if (self->mFirstPartitionWidth != width && !(v23 | ((unint64_t)v22 << 16))
      || (-[TSTTablePartitioner scaleToFit](self, "scaleToFit"), v34 == v31) && v33 == v30
      || (-[TSDInfoGeometry size](-[TSTTablePartitioner infoGeometry](self, "infoGeometry"), "size"),
          v36 = v35,
          v38 = v37,
          -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "geometry"), "size"), v36 != v40)|| v38 != v39)
    {
      -[TSTLayout scaleToFit](-[TSTTablePartitioner scaledLayout](self, "scaledLayout"), "scaleToFit");
      if (v42 != 1.0
        || v41 != 1.0
        || (-[TSDInfoGeometry size](-[TSTTablePartitioner infoGeometry](self, "infoGeometry"), "size"),
            v44 = v43,
            v46 = v45,
            -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "geometry"), "size"), v44 != v48)|| v46 != v47)
      {
        v49 = v21;
        v50 = -[TSTTablePartitioner scaledLayout](self, "scaledLayout");
        v51 = -[TSTTableModel range](-[TSTTableInfo tableModel](self->mTableInfo, "tableModel"), "range");
        v52 = v50;
        v21 = v49;
        ((void (*)(_QWORD, _QWORD))TSTLayoutInvalidateCellRange)(v52, v51);
      }
      -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", 1.0, 1.0);
      -[TSTTablePartitioner validateScaledLayout](self, "validateScaledLayout");
      -[TSTLayout computeLayoutGeometry](-[TSTTablePartitioner scaledLayout](self, "scaledLayout"), "computeLayoutGeometry");
      StrokeFrame = TSTLayoutGetStrokeFrame(-[TSTTablePartitioner scaledLayout](self, "scaledLayout"));
      v55 = v54;
      -[TSTLayout alignmentFrame](-[TSTTablePartitioner scaledLayout](self, "scaledLayout", StrokeFrame), "alignmentFrame");
      v57 = width - (v56 - v55);
      v58 = 1.0;
      if (v55 > v57)
        v58 = v57 / v55;
      -[TSTTablePartitioner setScaleToFit:](self, "setScaleToFit:", v58, 1.0);
      self->mFirstPartitionWidth = width;
      -[TSTTablePartitioner scaleToFit](self, "scaleToFit");
      -[TSTLayout setScaleToFit:](-[TSTTablePartitioner scaledLayout](self, "scaledLayout"), "setScaleToFit:", v59, v60);
      -[TSTTablePartitioner scaleToFit](self, "scaleToFit");
      if (v62 != 1.0 || v61 != 1.0)
      {
        -[TSTMasterLayout addChangeDescriptor:](v26, "addChangeDescriptor:", +[TSTChangeDescriptor changeDescriptorWithType:cellRange:](TSTChangeDescriptor, "changeDescriptorWithType:cellRange:", 33, -[TSTTableModel range](-[TSTTableInfo tableModel](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "tableModel"), "range")));
        TSTLayoutInvalidateCellRange(-[TSTTablePartitioner scaledLayout](self, "scaledLayout"), -[TSTTableModel range](-[TSTTableInfo tableModel](self->mTableInfo, "tableModel"), "range"));
      }
    }
  }
  v63 = -[TSTTablePartitioner measureCellRangeForNextPartitionOfSize:previousHint:horizontally:](self, "measureCellRangeForNextPartitionOfSize:previousHint:horizontally:", v15, v8, width, height);
  -[TSTTablePartitioner setInfoGeometry:](self, "setInfoGeometry:", -[TSDDrawableInfo geometry](self->mTableInfo, "geometry"));
  -[TSTLayoutHint setCacheHintID:](v20, "setCacheHintID:", ((unint64_t)v21 << 24) | ((unint64_t)v22 << 16) | v23);
  -[TSTLayoutHint setCellRange:](v20, "setCellRange:", v63);
  -[TSTLayoutHint setMaximumSize:](v20, "setMaximumSize:", width, height);
  -[TSTLayoutHint setHorizontal:](v20, "setHorizontal:", v8);
  -[TSTLayoutHint setPartitioningPass:](v20, "setPartitioningPass:", -[TSTTablePartitioner partitioningPassForHint:withPreviousHint:](self, "partitioningPassForHint:withPreviousHint:", v20, v15));
  if (a7)
    *a7 = -[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:](self, "p_didFinishPartitioningHint:horizontally:", v20, v8);
  return v20;
}

- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  id result;

  result = -[TSTTablePartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:](self, "nextHintForSize:parentLayout:previousHint:horizontally:outFinished:", a4, a5, a6, a7, a3.width, a3.height);
  if (result)
    return -[TSTTablePartitioner layoutForHint:parentLayout:](self, "layoutForHint:parentLayout:", result, a4);
  return result;
}

- (id)layoutForHint:(id)a3 parentLayout:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  _BOOL4 v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  objc_opt_class();
  v7 = TSUDynamicCast();
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rootLayout"), "layoutController"), "canvas");
  if (!v9)
    v9 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (id)-[TSUPointerKeyDictionary objectForKey:](self->mHintMatricesByCanvas, "objectForKey:", v9);
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mHintMatricesByCanvas, "setObject:forUncopiedKey:", v10, v9);
  }
  v11 = (void *)objc_msgSend(v10, "objectForKey:", -[TSTTablePartitioner hintCacheKeyForHint:](self, "hintCacheKeyForHint:", a3));
  v12 = objc_msgSend(v11, "layout");
  v13 = (id)v12;
  if (v11)
  {
    v14 = objc_msgSend(v11, "cellRange");
    v15 = objc_msgSend(v8, "cellRange");
    if (v13)
    {
      objc_msgSend(v13, "scaleToFit");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v8, "maximumSize");
      if (-[TSTTablePartitioner shouldReuseLayout:forSize:parentLayout:hint:](self, "shouldReuseLayout:forSize:parentLayout:hint:", v13, a4, v8))
      {
        v20 = 1;
        goto LABEL_18;
      }
      objc_msgSend(v8, "setLayout:", 0);
      goto LABEL_17;
    }
    v17 = 1.0;
  }
  else
  {
    v17 = 1.0;
    v15 = 0xFFFFFFLL;
    if (v12)
    {
      v20 = 0;
      v14 = 0xFFFFFFLL;
      v19 = 1.0;
      goto LABEL_18;
    }
    v14 = 0xFFFFFFLL;
  }
  v19 = 1.0;
LABEL_17:
  v13 = (id)objc_msgSend(objc_alloc(-[TSTTableInfo layoutClass](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "layoutClass")), "initWithInfo:layoutHint:", self->mTableInfo, v8);
  v20 = 0;
LABEL_18:
  objc_msgSend(v8, "setLayout:", v13);
  objc_msgSend(v13, "setLayoutHint:", v8);
  TSTLayoutSetPartitionRange(v13);
  objc_msgSend(v8, "setIsValid:", 1);
  if (!v20)
    goto LABEL_35;
  v21 = -[TSDDrawableInfo isInlineWithText](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "isInlineWithText");
  -[TSTTablePartitioner scaleToFit](self, "scaleToFit");
  if (v23 == v17 && v22 == v19)
  {
    if (((v14 ^ v15) & 0xFFFFFFFF00FFFFFFLL) == 0)
      goto LABEL_33;
    if (BYTE2(v15) < BYTE2(v14))
    {
      TSTLayoutInvalidateColumns(v13);
      v21 = 1;
    }
    if ((BYTE4(v15) + BYTE2(v15) - 1) > (BYTE4(v14) + BYTE2(v14) - 1))
    {
      TSTLayoutInvalidateColumns(v13);
      v21 = 1;
    }
    if ((unsigned __int16)v15 < (unsigned __int16)v14)
    {
      TSTLayoutInvalidateRows(v13);
      v21 = 1;
    }
    if ((unsigned __int16)(v15 + HIWORD(v15) - 1) > (unsigned __int16)(v14 - 1 + HIWORD(v14)))
    {
      TSTLayoutInvalidateRows(v13);
      v21 = 1;
    }
    v24 = (void *)objc_msgSend(v13, "containedTextEditingLayout");
    if (v24)
    {
      v25 = v24;
      objc_msgSend(v24, "invalidateTextLayout");
      objc_msgSend(v13, "invalidateForAutosizingTextLayout:", v25);
    }
    else
    {
LABEL_33:
      if (!v21)
        goto LABEL_35;
    }
  }
  else
  {
    TSTLayoutInvalidateCellRange(v13, objc_msgSend(v8, "cellRange"));
  }
  TSTLayoutInvalidateLayoutSpaceCoordinates(v13);
  TSTLayoutInvalidateLayoutSpaceTableOffsets(v13);
  objc_msgSend(v13, "invalidateSize");
  objc_msgSend(v13, "setNeedsDisplay");
LABEL_35:
  objc_msgSend(v10, "setObject:forKey:", v8, -[TSTTablePartitioner hintCacheKeyForHint:](self, "hintCacheKeyForHint:", v8));
  if (-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:](self, "p_didFinishPartitioningHint:horizontally:", v8, objc_msgSend(v8, "horizontal")))
  {
    -[TSTTablePartitioner p_flushCacheAfterPartitioningFinished:lastHint:horizontally:](self, "p_flushCacheAfterPartitioningFinished:lastHint:horizontally:", v10, v8, objc_msgSend(v8, "horizontal"));
  }
  return v13;
}

- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v6 = a5;
  objc_opt_class();
  v7 = (void *)TSUDynamicCast();
  objc_opt_class();
  v8 = TSUDynamicCast();
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
    return 0;
  v10 = (void *)v8;
  v11 = objc_msgSend((id)objc_msgSend(v7, "layout"), "tableInfo");
  if (v11 != objc_msgSend((id)objc_msgSend(v10, "layout"), "tableInfo"))
    return 0;
  v13 = objc_msgSend(v7, "cellRange");
  if (v6)
  {
    if ((BYTE4(v13) + BYTE2(v13) - 1) + 1 == (objc_msgSend(v10, "cellRange") >> 16))
    {
      v14 = (unsigned __int16)objc_msgSend(v7, "cellRange");
      if (v14 == (unsigned __int16)objc_msgSend(v10, "cellRange"))
      {
        v15 = objc_msgSend(v7, "cellRange");
        v16 = (unsigned __int16)(v15 + HIWORD(v15));
        v17 = objc_msgSend(v10, "cellRange");
        return v16 == (unsigned __int16)(v17 + HIWORD(v17));
      }
    }
    return 0;
  }
  if ((unsigned __int16)(v13 + HIWORD(v13) - 1) + 1 != (unsigned __int16)objc_msgSend(v10, "cellRange"))
    return 0;
  v19 = (objc_msgSend(v7, "cellRange") >> 16);
  if (v19 != (objc_msgSend(v10, "cellRange") >> 16))
    return 0;
  v20 = objc_msgSend(v7, "cellRange");
  v21 = (BYTE4(v20) + BYTE2(v20));
  v22 = objc_msgSend(v10, "cellRange");
  return v21 == (BYTE4(v22) + BYTE2(v22));
}

- (BOOL)p_didFinishPartitioningHint:(id)a3 horizontally:(BOOL)a4
{
  _BOOL4 v4;
  TSTMasterLayout *v6;
  uint64_t v7;
  uint64_t Range;
  unint64_t RangeForHint;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v16;
  int v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v6 = -[TSTTableInfo masterLayout](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "masterLayout");
  if (!a3)
    return 0;
  v7 = (uint64_t)v6;
  Range = TSTMasterLayoutGetRange((uint64_t)v6);
  RangeForHint = TSTMasterLayoutGetRangeForHint(v7, a3);
  if (v4)
  {
    v10 = (BYTE4(Range) + BYTE2(Range) - 1);
    v11 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1);
    if (v10 < v11)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 548, CFSTR("Horizontal partitioning went beyond the table bounds!"));
    }
    v14 = v10 > v11;
  }
  else
  {
    v16 = (unsigned __int16)(Range + HIWORD(Range) - 1);
    v17 = RangeForHint + HIWORD(RangeForHint) - 1;
    if (v16 < (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1))
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner p_didFinishPartitioningHint:horizontally:]");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 551, CFSTR("Vertical partitioning went beyond the table bounds!"));
    }
    v14 = v16 > (unsigned __int16)v17;
  }
  return !v14;
}

- (id)hintForLayout:(id)a3
{
  id result;

  objc_opt_class();
  result = (id)TSUDynamicCast();
  if (result)
    return (id)objc_msgSend(result, "layoutHint");
  return result;
}

- (BOOL)shouldReuseLayout:(id)a3 forSize:(CGSize)a4 parentLayout:(id)a5 hint:(id)a6
{
  return !a5 || !objc_msgSend(a3, "parent", a4.width, a4.height) || (id)objc_msgSend(a3, "parent") == a5;
}

- (BOOL)scaleIsValid
{
  double v2;
  double v3;

  -[TSTTablePartitioner scaleToFit](self, "scaleToFit");
  return v3 != *(double *)(MEMORY[0x24BDBF148] + 8) || v2 != *MEMORY[0x24BDBF148];
}

- (TSTLayout)scaledLayout
{
  TSTLayout *result;

  result = self->mScaledLayout;
  if (!result)
  {
    result = (TSTLayout *)objc_msgSend(objc_alloc(-[TSTTableInfo layoutClass](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "layoutClass")), "initWithInfo:", self->mTableInfo);
    self->mScaledLayout = result;
  }
  return result;
}

- (id)partitioningPassForFirstPartitionSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v7;
  uint64_t v8;
  void *v9;
  CGSize v11;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner partitioningPassForFirstPartitionSize:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 599, CFSTR("partitioningPassForFirstPartitionSize: Invalid partition size"));
  }
  v11.width = width;
  v11.height = height;
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->mPartitioningPassCache, "objectForKey:", NSStringFromCGSize(v11));
  if (!v9)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", random());
    v12.width = width;
    v12.height = height;
    -[NSMutableDictionary setObject:forKey:](self->mPartitioningPassCache, "setObject:forKey:", v9, NSStringFromCGSize(v12));
  }
  return v9;
}

- (id)partitioningPassForHint:(id)a3 withPreviousHint:(id)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "cacheHintID");
  if (a4 && (v7 & 0xFFFFFF) != 0)
  {
    if (objc_msgSend(a4, "partitioningPass"))
      return (id)objc_msgSend(a4, "partitioningPass");
    else
      return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
  }
  else
  {
    objc_msgSend(a3, "maximumSize");
    return -[TSTTablePartitioner partitioningPassForFirstPartitionSize:](self, "partitioningPassForFirstPartitionSize:");
  }
}

- (id)hintCacheKeyForPartitioningPass:(id)a3 andHintID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@,%@)"), a3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), a4.var1, a4.var0));
}

- (id)hintCacheKeyForHint:(id)a3
{
  return -[TSTTablePartitioner hintCacheKeyForPartitioningPass:andHintID:](self, "hintCacheKeyForPartitioningPass:andHintID:", objc_msgSend(a3, "partitioningPass"), objc_msgSend(a3, "cacheHintID"));
}

- (void)p_flushCacheAfterPartitioningFinished:(id)a3 lastHint:(id)a4 horizontally:(BOOL)a5
{
  unint64_t v5;
  int v6;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  id v16;
  unint64_t v17;

  v6 = a5;
  if (!a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTablePartitioner p_flushCacheAfterPartitioningFinished:lastHint:horizontally:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTablePartitioner.m"), 636, CFSTR("invalid nil value for '%s'"), "cache");
  }
  v11 = objc_msgSend(a4, "cacheHintID");
  v12 = v11 & 0xFF000000;
  v13 = objc_msgSend(a4, "partitioningPass");
  if (v6)
    v14 = HIWORD(v11) + 1;
  else
    v14 = 0;
  if (v6)
    v15 = 0;
  else
    v15 = v11 + 1;
  v16 = -[TSTTablePartitioner hintCacheKeyForPartitioningPass:andHintID:](self, "hintCacheKeyForPartitioningPass:andHintID:", v13, (unsigned __int16)v15 | (v14 << 16) | v12);
  if (objc_msgSend(a3, "objectForKey:", v16))
  {
    while (1)
    {
      if ((~-[TSTTableInfo editingCellID](-[TSTTablePartitioner tableInfo](self, "tableInfo"), "editingCellID") & 0xFFFFFF) == 0)objc_msgSend(a3, "removeObjectForKey:", v16);
      v14 += v6 ^ 1;
      v15 += v6;
      v5 = v5 & 0xFFFFFFFF00000000 | (unsigned __int16)v15 | (v14 << 16) | v12;
      v16 = -[TSTTablePartitioner hintCacheKeyForPartitioningPass:andHintID:](self, "hintCacheKeyForPartitioningPass:andHintID:", v13, v5);
      if (!objc_msgSend(a3, "objectForKey:", v16))
      {
        if (v6)
          ++v14;
        else
          v14 = 0;
        if (v6)
          v15 = 0;
        else
          ++v15;
        v17 = v17 & 0xFFFFFFFF00000000 | (unsigned __int16)v15 | (v14 << 16) | v12;
        v16 = -[TSTTablePartitioner hintCacheKeyForPartitioningPass:andHintID:](self, "hintCacheKeyForPartitioningPass:andHintID:", v13);
        if (!objc_msgSend(a3, "objectForKey:", v16))
          break;
      }
    }
  }
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (double)inlineTableWidth
{
  return self->mFirstPartitionWidth;
}

- (CGSize)scaleToFit
{
  double width;
  double height;
  CGSize result;

  width = self->mScaleToFit.width;
  height = self->mScaleToFit.height;
  result.height = height;
  result.width = width;
  return result;
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
