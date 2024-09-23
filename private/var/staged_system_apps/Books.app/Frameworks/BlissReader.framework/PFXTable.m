@implementation PFXTable

+ (void)initialize
{
  if (!qword_5437B8)
  {
    qword_5437B8 = (uint64_t)+[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
    qword_5437C0 = (uint64_t)CFSTR("UndefinedStroke");
    qword_5437C8 = (uint64_t)CFSTR("ContinuationStroke");
    qword_5437D0 = (uint64_t)CFSTR("InsideCellStroke");
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  id v19;
  THTableInfo *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  id v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  id v28;
  id v29;
  objc_super v30;

  objc_msgSend(a3, "setInTable:", 1);
  v5 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v29 = objc_msgSend(a3, "currentHtmlStackEntry");
  v28 = objc_msgSend(v29, "currentEntryMediaState");
  v6 = objc_msgSend(v28, "propertySet");
  v30.receiver = self;
  v30.super_class = (Class)PFXTable;
  -[PFXDrawable mapStartElementWithState:](&v30, "mapStartElementWithState:", a3);
  -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
  self->mWidth = v7;
  -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
  self->mHeight = v8;
  v9 = objc_msgSend(v5, "stylesheet");
  v10 = +[TSTTableStyleNetwork networkFromStylesheet:presetIndex:](TSTTableStyleNetwork, "networkFromStylesheet:presetIndex:", v9, 0);
  if (!v10)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXTable mapStartElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXTable.mm"), 108, CFSTR("invalid nil value for '%s'"), "styles");
  v11 = objc_msgSend(v10, "tableStyle");
  v12 = objc_alloc_init((Class)TSSPropertyMap);
  v13 = +[TSTTableStyle properties](TSTTableStyle, "properties");
  if (objc_msgSend(v13, "containsProperty:", 520))
  {
    v14 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", v6, a3);
    if (v14)
      objc_msgSend(v12, "setObject:forProperty:", v14, 520);
  }
  if (objc_msgSend(v13, "containsProperty:", 516))
  {
    v15 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", v6, a3);
    if (v15)
      objc_msgSend(v12, "setObject:forProperty:", v15, 516);
  }
  if (objc_msgSend(v13, "containsProperty:", 519))
  {
    v16 = +[PFXGraphicStyle mapReflectionFromStyleProperties:](PFXGraphicStyle, "mapReflectionFromStyleProperties:", v6);
    if (v16)
      objc_msgSend(v12, "setObject:forProperty:", v16, 519);
  }
  if (objc_msgSend(v13, "containsProperty:", 518))
  {
    v17 = +[PFXGraphicStyle mapOpacityFromStyleProperties:](PFXGraphicStyle, "mapOpacityFromStyleProperties:", v6);
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      *(float *)&v18 = v18;
      objc_msgSend(v12, "setFloatValue:forProperty:", 518, v18);
    }
  }
  objc_msgSend(v12, "setIntValue:forProperty:", 0, 799);
  objc_msgSend(v12, "setIntValue:forProperty:", 0, 768);
  objc_msgSend(v12, "minusPropertyMap:", objc_msgSend(v11, "propertyMap"));
  v19 = objc_msgSend(v9, "variationOfStyle:propertyMap:", v11, v12);

  objc_msgSend(v10, "setTableStyle:", v19);
  v20 = -[THTableInfo initWithContext:geometry:rows:columns:styles:]([THTableInfo alloc], "initWithContext:geometry:rows:columns:styles:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), 1, 1, v10);
  self->mTableInfo = v20;
  self->mTableModel = (TSTTableModel *)-[THTableInfo tableModel](v20, "tableModel");
  objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", self->mTableInfo, v29);
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mHorizontalStrokes = v21;
  -[NSMutableArray addObject:](v21, "addObject:", +[NSMutableArray array](NSMutableArray, "array"));
  v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mVerticalStrokes = v22;
  -[NSMutableArray addObject:](v22, "addObject:", +[NSMutableArray array](NSMutableArray, "array"));
  if (-[PFXDrawablePlacement mode](self->super.mPlacement, "mode") == 2)
  {
    objc_msgSend(v28, "setCurrentBreakStateSameAsParent");
    v23 = objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v28, "storage"));
    objc_msgSend(a3, "setInTable:", 0);
    v24 = +[PFXBreak breakCharacterFromPropertySet:](PFXBreak, "breakCharacterFromPropertySet:", objc_msgSend(v28, "propertySet"));
    v25 = 10;
    if (v24)
    {
      v26 = v24;
      if (v24 != 10)
      {
        if (-[PFXTable canAddColumnBreak:](self, "canAddColumnBreak:", a3, 10))
          v25 = v26;
        else
          v25 = 10;
      }
    }
    +[PFXBlock addBreakIfApplicableToEntry:newBreakState:hintCollector:](PFXBlock, "addBreakIfApplicableToEntry:newBreakState:hintCollector:", v29, v25, v23);
    objc_msgSend(a3, "setInTable:", 1);
  }
  return 1;
}

+ (void)ensure2DStrokeArray:(id)a3 hasDim1:(unsigned __int16)a4 dim2:(unsigned __int16)a5
{
  unsigned int v5;
  unsigned int v6;
  unsigned __int16 v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  unsigned int i;

  v5 = a5;
  v6 = a4;
  v8 = (unsigned __int16)objc_msgSend(a3, "count");
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    v11 = 0;
    v12 = (unsigned __int16)objc_msgSend(objc_msgSend(a3, "lastObject"), "count");
    do
    {
      v13 = objc_msgSend(a3, "objectAtIndex:", v11);
      if (v12 < v5)
      {
        v14 = v13;
        v15 = v12;
        do
        {
          objc_msgSend(v14, "addObject:", qword_5437C0);
          ++v15;
        }
        while (v15 < v5);
      }
      ++v11;
    }
    while (v11 != v10);
  }
  for (; v9 < v6; ++v9)
  {
    v16 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      for (i = 0; i < v5; ++i)
        objc_msgSend(v16, "addObject:", qword_5437C0);
    }
    objc_msgSend(a3, "addObject:", v16);

  }
}

- (void)ensureStrokeMatricesMatchModel
{
  +[PFXTable ensure2DStrokeArray:hasDim1:dim2:](PFXTable, "ensure2DStrokeArray:hasDim1:dim2:", self->mHorizontalStrokes, (unsigned __int16)((unsigned __int16)-[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows") + 1), -[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns"));
  +[PFXTable ensure2DStrokeArray:hasDim1:dim2:](PFXTable, "ensure2DStrokeArray:hasDim1:dim2:", self->mVerticalStrokes, (unsigned __int16)((unsigned __int16)-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns") + 1), -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"));
}

- (id)horizontalStrokeAboveRow:(unsigned __int16)a3 inColumn:(unsigned __int16)a4
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](self->mHorizontalStrokes, "objectAtIndex:", a3), "objectAtIndex:", a4);
}

- (void)setHorizontalStroke:(id)a3 aboveRow:(unsigned __int16)a4 inColumn:(unsigned __int16)a5
{
  objc_msgSend(-[NSMutableArray objectAtIndex:](self->mHorizontalStrokes, "objectAtIndex:", a4), "replaceObjectAtIndex:withObject:", a5, a3);
}

- (id)verticalStrokeToTheLeftOfColumn:(unsigned __int16)a3 inRow:(unsigned __int16)a4
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](self->mVerticalStrokes, "objectAtIndex:", a3), "objectAtIndex:", a4);
}

- (void)setVerticalStroke:(id)a3 toTheLeftOfColumn:(unsigned __int16)a4 inRow:(unsigned __int16)a5
{
  objc_msgSend(-[NSMutableArray objectAtIndex:](self->mVerticalStrokes, "objectAtIndex:", a4), "replaceObjectAtIndex:withObject:", a5, a3);
}

+ (void)setStrokeProperty:(int)a3 value:(id)a4 cellPropertyMap:(id)a5
{
  if ((id)qword_5437D0 != a4)
    objc_msgSend(a5, "setObject:forProperty:", a4, *(_QWORD *)&a3);
}

- (void)finalizeStrokesWithState:(id)a3
{
  unsigned __int16 v4;
  id v5;
  unsigned __int16 v6;
  id v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  id v10;
  id v11;
  unint64_t v12;
  __objc2_meth_list **p_opt_class_meths;
  unsigned __int16 v14;
  __objc2_meth_list *v15;
  unsigned __int16 v16;
  __objc2_meth_list *v17;
  id v18;
  __objc2_meth_list *v19;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;

  v27 = objc_msgSend(a3, "currentHtmlDocMediaState");
  -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows");
  v4 = 0;
  do
  {
    if (-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns"))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = -[PFXTable horizontalStrokeAboveRow:inColumn:](self, "horizontalStrokeAboveRow:inColumn:", v4, v6);
        if (v7 == (id)qword_5437C8)
        {
          -[PFXTable setHorizontalStroke:aboveRow:inColumn:](self, "setHorizontalStroke:aboveRow:inColumn:", v5, v4, v6);
          v7 = v5;
        }
        ++v6;
        v5 = v7;
      }
      while (-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns") > v6);
    }
    ++v4;
  }
  while (-[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows") >= v4);
  -[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns");
  v8 = 0;
  do
  {
    if (-[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"))
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = -[PFXTable verticalStrokeToTheLeftOfColumn:inRow:](self, "verticalStrokeToTheLeftOfColumn:inRow:", v8, v9);
        if (v11 == (id)qword_5437C8)
        {
          -[PFXTable setVerticalStroke:toTheLeftOfColumn:inRow:](self, "setVerticalStroke:toTheLeftOfColumn:inRow:", v10, v8, v9);
          v11 = v10;
        }
        ++v9;
        v10 = v11;
      }
      while (-[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows") > v9);
    }
    ++v8;
  }
  while (-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns") >= v8);
  if (-[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"))
  {
    v12 = 0;
    p_opt_class_meths = &OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate.opt_class_meths;
    do
    {
      v32 = v12 + 1;
      if (-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns"))
      {
        v14 = 0;
        v28 = v12;
        do
        {
          v15 = -[PFXTable verticalStrokeToTheLeftOfColumn:inRow:](self, "verticalStrokeToTheLeftOfColumn:inRow:", v14, (unsigned __int16)v12);
          v16 = v14 + 1;
          v33 = -[PFXTable verticalStrokeToTheLeftOfColumn:inRow:](self, "verticalStrokeToTheLeftOfColumn:inRow:", (unsigned __int16)(v14 + 1), (unsigned __int16)v12);
          v17 = -[PFXTable horizontalStrokeAboveRow:inColumn:](self, "horizontalStrokeAboveRow:inColumn:", (unsigned __int16)v12, v14);
          v18 = -[PFXTable horizontalStrokeAboveRow:inColumn:](self, "horizontalStrokeAboveRow:inColumn:", (unsigned __int16)v32, v14);
          v19 = p_opt_class_meths[250];
          if (v15 == v19 || v17 == v19)
          {
            v21 = v18;
            v29 = v12 | ((unint64_t)v14 << 16);
            v30 = v29 | v30 & 0xFFFFFFFF00000000;
            v22 = (void *)TSTTableDefaultCellStyleForCellID(self->mTableModel);
            v23 = objc_alloc_init((Class)TSSPropertyMap);
            +[PFXTable setStrokeProperty:value:cellPropertyMap:](PFXTable, "setStrokeProperty:value:cellPropertyMap:", 901, v15, v23);
            +[PFXTable setStrokeProperty:value:cellPropertyMap:](PFXTable, "setStrokeProperty:value:cellPropertyMap:", 899, v17, v23);
            +[PFXTable setStrokeProperty:value:cellPropertyMap:](PFXTable, "setStrokeProperty:value:cellPropertyMap:", 902, v33, v23);
            +[PFXTable setStrokeProperty:value:cellPropertyMap:](PFXTable, "setStrokeProperty:value:cellPropertyMap:", 900, v21, v23);
            objc_msgSend(v23, "minusPropertyMap:", objc_msgSend(v22, "propertyMap"));
            v24 = objc_msgSend(v27, "stylesheet");
            v25 = v22;
            p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate + 48);
            v26 = objc_msgSend(v24, "variationOfStyle:propertyMap:", v25, v23);

            v31 = v29 | v31 & 0xFFFFFFFF00000000;
            TSTTableSetCellStyleAtCellID(self->mTableModel, v26);
            v12 = v28;
          }
          ++v14;
        }
        while (-[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns") > v16);
      }
      v12 = v32;
    }
    while (v32 < -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"));
  }
}

- (CGSize)compensateForStrokeThickness
{
  -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows");
  operator new[]();
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  -[PFXTable finalizeStrokesWithState:](self, "finalizeStrokesWithState:", a3);
  -[PFXTable compensateForStrokeThickness](self, "compensateForStrokeThickness");
  objc_msgSend(v5, "setResult:", self->mTableInfo);
  v8.receiver = self;
  v8.super_class = (Class)PFXTable;
  -[PFXDrawable mapEndElementWithState:](&v8, "mapEndElementWithState:", a3);
  v6 = objc_msgSend(-[THTableInfo geometry](self->mTableInfo, "geometry"), "mutableCopy");
  objc_msgSend(v6, "setPosition:", TSDAddPoints(objc_msgSend(v6, "position")));
  -[THTableInfo setGeometry:](self->mTableInfo, "setGeometry:", v6);

  self->mTableInfo = 0;
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  if (-[PFXDrawablePlacement mode](self->super.mPlacement, "mode") == 2)
  {
    if (objc_msgSend(v7, "hasHints"))
    {
      objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v5, "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
      objc_msgSend(v7, "popHint");
    }
    objc_msgSend(v5, "setParentBreakStateSameAsCurrent");
  }
  objc_msgSend(a3, "setInTable:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXTable;
  -[PFXDrawable dealloc](&v3, "dealloc");
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)addCellWithSize:(id)a3
{
  unsigned __int16 var0;
  vector<TSUColumnRowRect, std::allocator<TSUColumnRowRect>> *p_mHangingCells;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v7;
  unint64_t mCurrentHangingCellIndex;
  unint64_t v9;
  uint64_t v10;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v11;
  _DWORD v13[2];

  var0 = a3.var0;
  p_mHangingCells = &self->mHangingCells;
  begin = p_mHangingCells->__begin_;
  v7 = p_mHangingCells->__end_ - p_mHangingCells->__begin_;
  mCurrentHangingCellIndex = self->mCurrentHangingCellIndex;
  if (mCurrentHangingCellIndex < v7 >> 3)
  {
    v9 = v7 >> 3;
    do
    {
      v10 = *((_QWORD *)begin + mCurrentHangingCellIndex);
      if (self->mCurrentColumn < BYTE2(v10))
        break;
      self->mCurrentColumn = (BYTE4(v10) + BYTE2(v10) - 1) + 1;
      mCurrentHangingCellIndex = self->mCurrentHangingCellIndex + 1;
      self->mCurrentHangingCellIndex = mCurrentHangingCellIndex;
    }
    while (mCurrentHangingCellIndex < v9);
  }
  LOWORD(v13[0]) = self->mNumberOfRows - 1;
  BYTE2(v13[0]) = self->mCurrentColumn;
  v11 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)v13[0];
  v13[1] = a3;
  sub_209BDC((uint64_t)p_mHangingCells, (char *)begin + 8 * mCurrentHangingCellIndex, (char *)v13);
  ++self->mCurrentHangingCellIndex;
  self->mCurrentColumn += var0;
  return v11;
}

- (void)startRow
{
  self->mCurrentColumn = 0;
  self->mCurrentHangingCellIndex = 0;
}

- (void)endRow
{
  vector<TSUColumnRowRect, std::allocator<TSUColumnRowRect>> *p_mHangingCells;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  int64_t v6;

  p_mHangingCells = &self->mHangingCells;
  begin = self->mHangingCells.__begin_;
  end = self->mHangingCells.__end_;
  while (begin != end)
  {
    if (self->mNumberOfRows - 1 == (unsigned __int16)(*(_QWORD *)begin + HIWORD(*(_QWORD *)begin) - 1))
    {
      v6 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8))
        memmove(begin, (char *)begin + 8, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8));
      end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v6);
      p_mHangingCells->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v6);
    }
    else
    {
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
    }
  }
}

- (THTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (TSTTableModel)tableModel
{
  return self->mTableModel;
}

- (double)width
{
  return self->mWidth;
}

- (double)height
{
  return self->mHeight;
}

- (unsigned)numberOfRows
{
  return self->mNumberOfRows;
}

- (void)setNumberOfRows:(unsigned __int16)a3
{
  self->mNumberOfRows = a3;
}

- (unsigned)numberOfColumns
{
  return self->mNumberOfColumns;
}

- (void)setNumberOfColumns:(unsigned __int16)a3
{
  self->mNumberOfColumns = a3;
}

- (void).cxx_destruct
{
  vector<TSUColumnRowRect, std::allocator<TSUColumnRowRect>> *p_mHangingCells;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  p_mHangingCells = &self->mHangingCells;
  begin = self->mHangingCells.__begin_;
  if (begin)
  {
    p_mHangingCells->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return 0;
}

@end
