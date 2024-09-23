@implementation TSTEditingState

- (TSTCell)editingCell
{
  return self->mEditingCell;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mEditingCellID;
}

- (void)setEditingCellID:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (BOOL)cellWasEditedInCurrentSession
{
  return self->mCellWasEditedInCurrentSession;
}

- (void)setCellWasEditedInCurrentSession:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mCellWasEditedInCurrentSession = a3;
}

- (TSTEditingState)initWithTableInfo:(id)a3
{
  TSTEditingState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTEditingState;
  result = -[TSPObject initWithContext:](&v5, sel_initWithContext_, objc_msgSend(a3, "context"));
  if (result)
  {
    result->mTableInfo = (TSTTableInfo *)a3;
    result->mEditingMode = 0;
    result->mSelection = 0;
    result->mSelectionReflectingEditingState = 0;
    result->mColoredReferences = 0;
    result->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
    result->mCellWasEditedInCurrentSession = 0;
  }
  return result;
}

- (void)setSearchReference:(id)a3
{
  TSTSearchReference *mSearchReference;

  mSearchReference = self->mSearchReference;
  if (mSearchReference != a3)
  {

    self->mSearchReference = (TSTSearchReference *)a3;
  }
}

- (id)initForPasteboardFromSourceInfo:(id)a3 stylesheet:(id)a4
{
  TSTEditingState *v5;

  v5 = -[TSTEditingState initWithTableInfo:](self, "initWithTableInfo:", a3);
  if (v5)
    v5->mEditingStorage = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", -[TSPObject context](v5, "context"), &stru_24D82FEB0, 5, a4, -[TSTTableModel bodyTextStyle](-[TSTEditingState tableModel](v5, "tableModel"), "bodyTextStyle"), objc_msgSend(a4, "defaultListStyle"), 0, 0);
  return v5;
}

- (void)dealloc
{
  TSUPointerKeyDictionary *mColoredReferences;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  self->mEditingCell = 0;
  -[TSTEditingState p_unregisterStorageObserver](self, "p_unregisterStorageObserver");
  -[TSWPStorage removeObserver:](self->mEditingStorage, "removeObserver:", self->mTracker);
  self->mTracker = 0;

  self->mEditingStorage = 0;
  self->mSelection = 0;

  self->mSelectionReflectingEditingState = 0;
  mColoredReferences = self->mColoredReferences;
  if (mColoredReferences)
  {

    self->mColoredReferences = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTEditingState;
  -[TSTEditingState dealloc](&v4, sel_dealloc);
}

- (void)p_performRichTextStorageDOLC:(id)a3 newStorage:(id)a4
{
  TSKDocumentRoot *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = -[TSTTableInfo documentRoot](-[TSTEditingState tableInfo](self, "tableInfo"), "documentRoot");
  if (objc_msgSend(a4, "documentRoot"))
  {
    if (v6 != (TSKDocumentRoot *)objc_msgSend(a4, "documentRoot"))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTEditingState p_performRichTextStorageDOLC:newStorage:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEditingState.mm"), 223, CFSTR("expected equality between %s and %s"), "documentRoot", "newStorage.documentRoot");
    }
  }
  else if (a4 && a4 != a3)
  {
    objc_msgSend(a4, "willBeAddedToDocumentRoot:dolcContext:", v6, 0);
    objc_msgSend(a4, "wasAddedToDocumentRoot:dolcContext:", v6, 0);
  }
  if (a3 && a4 != a3 && objc_msgSend(a3, "documentRoot"))
  {
    if (v6 != (TSKDocumentRoot *)objc_msgSend(a3, "documentRoot"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTEditingState p_performRichTextStorageDOLC:newStorage:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEditingState.mm"), 231, CFSTR("expected equality between %s and %s"), "documentRoot", "oldStorage.documentRoot");
    }
    objc_msgSend(a3, "willBeRemovedFromDocumentRoot:", v6);
    objc_msgSend(a3, "wasRemovedFromDocumentRoot:", v6);
  }
}

- (void)setEditingStorage:(id)a3
{
  if (self->mEditingStorage != a3)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSTEditingState p_unregisterStorageObserver](self, "p_unregisterStorageObserver");
    -[TSTEditingState p_performRichTextStorageDOLC:newStorage:](self, "p_performRichTextStorageDOLC:newStorage:", self->mEditingStorage, a3);
    -[TSWPStorage removeObserver:](self->mEditingStorage, "removeObserver:", self->mTracker);

    self->mEditingStorage = (TSWPStorage *)a3;
    -[TSWPStorage setParentInfo:](self->mEditingStorage, "setParentInfo:", -[TSTEditingState tableInfo](self, "tableInfo"));
    -[TSWPStorage addObserver:](self->mEditingStorage, "addObserver:", self->mTracker);
    -[TSTEditingState p_registerStorageObserver](self, "p_registerStorageObserver");
  }
}

- (void)setTableInfo:(id)a3
{
  TSWPStorage *mEditingStorage;

  self->mTableInfo = (TSTTableInfo *)a3;
  mEditingStorage = self->mEditingStorage;
  if (mEditingStorage)
    -[TSWPStorage setParentInfo:](mEditingStorage, "setParentInfo:");
}

- (TSTTableModel)tableModel
{
  return -[TSTTableInfo tableModel](self->mTableInfo, "tableModel");
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (TSTTableSelection)selection
{
  return TSTEditingStateGetSelection(self, 1);
}

- (void)setSelection:(id)a3
{
  TSTEditingStateSetSelection(self, (TSTTableSelection *)a3);
}

- (void)setEditingCell:(id)a3
{
  TSTCell *mEditingCell;
  TSTCell *v6;
  TSTCell *v7;
  TSDCommentStorage *mCommentStorage;

  mEditingCell = self->mEditingCell;
  if (mEditingCell != a3 && (unint64_t)a3 | (unint64_t)mEditingCell)
  {
    -[TSPObject willModify](self, "willModify");
    v6 = (TSTCell *)objc_msgSend(a3, "copy");
    v7 = v6;
    if (v6)
    {
      mCommentStorage = v6->mPrivate.mCommentStorage;
      if (mCommentStorage)
        TSTCellSetCommentStorageClearingID((TSDCommentStorage *)v6, (TSDCommentStorage *)(id)-[TSDCommentStorage copyWithContext:](mCommentStorage, "copyWithContext:", -[TSPObject context](self, "context")), 1);
    }

    self->mEditingCell = v7;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3;
  unint64_t v4;
  BOOL v5;

  v3 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTEditingState editingCellID](self, "editingCellID");
  v4 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTEditingState tableModel](self, "tableModel"), *(_DWORD *)&v3);
  if ((_WORD)v4 == 0xFFFF)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  v5 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
  if (v5 || (v4 & 0xFFFF00000000) == 0)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v4;
}

- (id)storageForCellID:(id)a3
{
  TSTCell *v5;
  uint64_t v6;
  BOOL v7;
  TSWPStorage *v8;
  _BOOL4 v9;
  TSKDocumentRoot *v10;
  TSSStylesheet *v11;
  TSWPParagraphStyle *TextStyleAtCellID;
  unsigned int v13;
  BOOL v14;
  int v15;
  id v17;
  int v18;
  TSWPStorage *v19;
  uint64_t v21;

  v5 = objc_alloc_init(TSTCell);
  v6 = a3;
  if (TSTCellAtCellID((uint64_t)-[TSTEditingState tableModel](self, "tableModel"), *(_DWORD *)&a3, v5))
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7 || *((unsigned __int8 *)&v5->mPrivate + 1) << 8 != 2304)
  {
    v9 = -[TSDDrawableInfo isThemeContent](-[TSTEditingState tableInfo](self, "tableInfo"), "isThemeContent");
    v10 = -[TSTTableInfo documentRoot](-[TSTEditingState tableInfo](self, "tableInfo"), "documentRoot");
    if (v9)
      v10 = -[TSKDocumentRoot theme](v10, "theme");
    v11 = -[TSKDocumentRoot stylesheet](v10, "stylesheet");
    TextStyleAtCellID = TSTTableGetTextStyleAtCellID((uint64_t *)-[TSTEditingState tableModel](self, "tableModel"), v6, 0);
    if (v5)
    {
      v13 = *((unsigned __int8 *)&v5->mPrivate + 1);
      v14 = v13 > 7;
      v15 = (1 << v13) & 0xA4;
      if (!v14 && v15 != 0)
      {
        v17 = -[TSTMasterLayout accountingParagraphStylePropertyMapForCell:atCellID:](-[TSTTableInfo masterLayout](-[TSTEditingState tableInfo](self, "tableInfo"), "masterLayout"), "accountingParagraphStylePropertyMapForCell:atCellID:", v5, v6);
        if (v17)
          TextStyleAtCellID = -[TSSStylesheet variationOfStyle:propertyMap:](v11, "variationOfStyle:propertyMap:", TextStyleAtCellID, v17);
      }
    }
    v18 = -[TSSStyle intValueForProperty:](TextStyleAtCellID, "intValueForProperty:", 44);
    if (v18 == -1)
      v18 = -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTEditingState tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798) == 1;
    LODWORD(v21) = v18;
    v8 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", -[TSPObject context](self, "context"), NSStringForEditingWithTSTCell((uint64_t)v5), 5, v11, TextStyleAtCellID, -[TSSStylesheet defaultListStyle](v11, "defaultListStyle"), 0, 0, v21);
  }
  else
  {
    v8 = -[TSWPStorage copyWithContext:](-[TSTRichTextPayload storage](v5->mPrivate.mRichTextPayload, "storage"), "copyWithContext:", -[TSPObject context](self, "context"));
  }
  v19 = v8;

  return v19;
}

- (id)prepareEditingStorageToEditCell:(id)a3
{
  return 0;
}

- (int)editingMode
{
  return self->mEditingMode;
}

- (void)changeEditingMode:(int)a3
{
  int mEditingMode;

  mEditingMode = self->mEditingMode;
  if (mEditingMode != a3)
  {
    self->mPreviousEditingMode = mEditingMode;
    self->mEditingMode = a3;

    self->mSelectionReflectingEditingState = 0;
    if (a3 != 6)
      self->mEditingCellInProxy = 0;
  }
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  -[TSTEditingState setCellWasEditedInCurrentSession:](self, "setCellWasEditedInCurrentSession:", 1, a4.location, a4.length, a5, *(_QWORD *)&a6);
}

- (void)p_registerStorageObserver
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing"))-[TSWPStorage addObserver:](self->mEditingStorage, "addObserver:", self);
}

- (void)p_unregisterStorageObserver
{
  -[TSWPStorage removeObserver:](self->mEditingStorage, "removeObserver:", self);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  -[TSWPStorage adoptStylesheet:withMapper:](-[TSTEditingState editingStorage](self, "editingStorage"), "adoptStylesheet:withMapper:", a3, a4);
}

- (BOOL)p_shouldSetCellPostFlight
{
  return (-[TSKCommandController isUndoing](-[TSTEditingState commandController](self, "commandController"), "isUndoing") & 1) == 0&& (-[TSKCommandController isRedoing](-[TSTEditingState commandController](self, "commandController"), "isRedoing") & 1) == 0&& -[TSTEditingState cellWasEditedInCurrentSession](self, "cellWasEditedInCurrentSession");
}

- (void)willEndEditingDueToCancelOperation
{
  -[TSTEditingState setEndingEditingDueToCancelOperation:](self, "setEndingEditingDueToCancelOperation:", 1);
}

- (void)didEndEditingDueToCancelOperation
{
  -[TSTEditingState setEndingEditingDueToCancelOperation:](self, "setEndingEditingDueToCancelOperation:", 0);
}

- (TSWPStorage)editingStorage
{
  return self->mEditingStorage;
}

- (BOOL)editingCellInProxy
{
  return self->mEditingCellInProxy;
}

- (void)setEditingCellInProxy:(BOOL)a3
{
  self->mEditingCellInProxy = a3;
}

- (TSTSearchReference)searchReference
{
  return self->mSearchReference;
}

- (BOOL)isEndingEditingDueToCancelOperation
{
  return self->mEndingEditingDueToCancelOperation;
}

- (void)setEndingEditingDueToCancelOperation:(BOOL)a3
{
  self->mEndingEditingDueToCancelOperation = a3;
}

- (TSTTextStatisticsTracker)tracker
{
  return self->mTracker;
}

- (void)setTracker:(id)a3
{
  self->mTracker = (TSTTextStatisticsTracker *)a3;
}

- (unsigned)lastColumnHitByTap
{
  return self->mLastColumnHitByTap;
}

- (void)setLastColumnHitByTap:(unsigned __int8)a3
{
  self->mLastColumnHitByTap = a3;
}

- (int)previousEditingMode
{
  return self->mPreviousEditingMode;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)lastEditingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_lastEditingCellID;
}

- (void)setLastEditingCellID:(id)a3
{
  self->_lastEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (NSArray)coloredReferences
{
  return self->_coloredReferences;
}

- (TSKCommandController)commandController
{
  return self->_commandController;
}

- (BOOL)isDispatchingPreflight
{
  return self->_dispatchingPreflight;
}

- (void)setDispatchingPreflight:(BOOL)a3
{
  self->_dispatchingPreflight = a3;
}

@end
