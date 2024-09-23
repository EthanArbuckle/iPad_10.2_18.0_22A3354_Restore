@implementation TSTLayout

- (CGSize)scaleToFit
{
  double width;
  double height;
  CGSize result;

  width = self->mCached.scaleToFitEnclosingTextColumn.width;
  height = self->mCached.scaleToFitEnclosingTextColumn.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaleToFit:(CGSize)a3
{
  self->mCached.scaleToFitEnclosingTextColumn = a3;
}

- (TSTEditingState)editingState
{
  return -[TSTTableInfo editingState](-[TSTLayout tableInfo](self, "tableInfo"), "editingState");
}

- (TSTTableModel)tableModel
{
  return -[TSTTableInfo tableModel](-[TSTLayout tableInfo](self, "tableInfo"), "tableModel");
}

- (void)setLayoutHint:(id)a3
{
  TSTLayoutHint *mLayoutHint;
  TSTLayoutHint *v6;

  mLayoutHint = self->mLayoutHint;
  if (mLayoutHint != a3)
  {
    if (mLayoutHint)
    {
      -[TSTLayoutHint setLayout:](mLayoutHint, "setLayout:", 0);

    }
    v6 = (TSTLayoutHint *)a3;
    self->mLayoutHint = v6;
    -[TSTLayoutHint setLayout:](v6, "setLayout:", self);
  }
}

- (TSTLayout)initWithInfo:(id)a3 layoutHint:(id)a4
{
  char *v6;
  void *v7;
  id v8;
  id v9;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSTLayout;
  v6 = -[TSDLayout initWithInfo:](&v16, sel_initWithInfo_);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a3, "masterLayout");
    *((_QWORD *)v6 + 38) = v7;
    v8 = v7;
    v9 = a4;
    *((_QWORD *)v6 + 39) = v9;
    objc_msgSend(v9, "setLayout:", v6);
    *((_QWORD *)v6 + 49) = -[TSTLayoutSpaceBundle initWithLayout:]([TSTLayoutSpaceBundle alloc], "initWithLayout:", v6);
    if (v6[385])
      v6[385] = 0;
    TSTLayoutSetPartitionRange(v6);
    objc_msgSend((id)objc_msgSend(v6, "spaceBundle"), "invalidateTableOffsets");
    objc_msgSend(*((id *)v6 + 38), "invalidateTableNameHeight");
    v6[384] = 0;
    *((_OWORD *)v6 + 30) = TSDEdgeInsetsInvalid;
    *((_OWORD *)v6 + 31) = unk_217C2C3E8;
    *((_DWORD *)v6 + 136) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v6 + 408) = _Q0;
    *(_OWORD *)(v6 + 424) = _Q0;
    *((_QWORD *)v6 + 75) = 0xFFFFFFLL;
    v6[390] = objc_msgSend(v6, "p_getLayoutDirectionLeftToRight");
  }
  return (TSTLayout *)v6;
}

- (TSTLayout)initWithInfo:(id)a3
{
  return -[TSTLayout initWithInfo:layoutHint:](self, "initWithInfo:layoutHint:", a3, (id)objc_msgSend((id)objc_msgSend(a3, "masterLayout"), "newLayoutHint"));
}

- (void)dealloc
{
  TSTLayoutHint *mLayoutHint;
  TSTLayoutHint *v4;
  objc_super v5;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "documentRoot"), "changeNotifier"), "removeObserver:forChangeSource:", self, -[TSTLayout masterLayout](self, "masterLayout"));
  if (self->mContainedTextEditingLayout)
    -[TSTLayout removeContainedTextEditingLayout](self, "removeContainedTextEditingLayout");
  -[TSTLayoutSpaceBundle invalidateTableOffsets](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateTableOffsets");

  self->mSpaceBundle = 0;
  self->mMasterLayout = 0;
  mLayoutHint = self->mLayoutHint;
  if (mLayoutHint)
  {
    -[TSTLayoutHint setLayout:](mLayoutHint, "setLayout:", 0);
    v4 = self->mLayoutHint;
  }
  else
  {
    v4 = 0;
  }

  self->mLayoutHint = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  -[TSWPTextHostLayout dealloc](&v5, sel_dealloc);
}

- (void)willBeAddedToLayoutController:(id)a3
{
  -[TSTMasterLayout setChangeNotifier:](self->mMasterLayout, "setChangeNotifier:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "canvas"), "canvasController"), "documentRoot"), "changeNotifier"));
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  objc_super v5;

  if (self->mContainedTextEditingLayout)
    -[TSTLayout removeContainedTextEditingLayout](self, "removeContainedTextEditingLayout");
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  -[TSDLayout willBeRemovedFromLayoutController:](&v5, sel_willBeRemovedFromLayoutController_, a3);
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (-[TSDLayout layoutState](self, "layoutState") != 4)
  {
    v6.receiver = self;
    v6.super_class = (Class)TSTLayout;
    -[TSDAbstractLayout offsetGeometryBy:](&v6, sel_offsetGeometryBy_, x, y);
  }
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  TSTMasterLayout *v4;
  int v5;
  int TableNumberOfRows;
  unsigned __int16 TableNumberOfColumns;
  unsigned int v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  double v11;
  double v12;
  int v13;
  unsigned int v14;
  unsigned __int8 v15;
  double v16;
  CGFloat v17;
  double width;
  double height;
  CGSize result;
  CGRect v21;
  CGRect v22;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v4 = -[TSTLayout masterLayout](self, "masterLayout");
  v5 = -[TSTMasterLayout tableRowsBehavior](v4, "tableRowsBehavior");
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v4);
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)v4);
  if (TableNumberOfRows)
  {
    v8 = 0;
    v9 = 0;
    v10 = TableNumberOfRows;
    do
    {
      if (TSTMasterLayoutIsRowHidden(v4, (unsigned __int16)v8))
      {
        --v10;
      }
      else
      {
        if (v5 == 1)
        {
          TSTMasterLayoutFittingHeightOfRow(v4, (unsigned __int16)v8);
          v3 = v3 + v11;
        }
        v3 = v3 + TSTMasterLayoutStrokeHeightOfGridRow(v4, v8, 0, 0xFFFFFFFF);
        v9 = v8;
      }
      ++v8;
    }
    while (TableNumberOfRows != v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v12 = TSTMasterLayoutStrokeHeightOfGridRow(v4, v9 + 1, 0, 0xFFFFFFFF);
  v13 = TableNumberOfColumns;
  if ((_BYTE)TableNumberOfColumns)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if (TSTMasterLayoutIsColumnHidden(v4, v14))
      {
        --TableNumberOfColumns;
      }
      else
      {
        v2 = v2 + TSTMasterLayoutStrokeWidthOfGridColumn(v4, v14, 0, 0xFFFFFFFF);
        v15 = v14;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = (float)((float)v10 * 8.0);
  if (v5 == 1)
    v16 = -0.0;
  v17 = v16 + v3 + v12;
  v21.size.width = v2
                 + TSTMasterLayoutStrokeWidthOfGridColumn(v4, v15 + 1, 0, 0xFFFFFFFF)
                 + (float)((float)TableNumberOfColumns * 8.0);
  v21.origin.x = *(CGFloat *)MEMORY[0x24BDBF090];
  v21.origin.y = *(CGFloat *)(MEMORY[0x24BDBF090] + 8);
  v21.size.height = v17;
  v22 = CGRectInset(v21, -1.0, -1.0);
  width = v22.size.width;
  height = v22.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  v10.receiver = self;
  v10.super_class = (Class)TSTLayout;
  -[TSDLayout infoGeometryPositionForCurrentAttachedLayoutGeometry](&v10, sel_infoGeometryPositionForCurrentAttachedLayoutGeometry);
  v4 = v3;
  v6 = v5;
  -[TSTLayoutSpace tableOffset](-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"), "tableOffset");
  v8 = TSDAddPoints(v4, v6, v7);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  if (-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"))
  {
    -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](self, "geometry"), "frame");
    v5 = TSDSubtractPoints(v3, v4, self->mRenderingFrameForLayoutGeometryFromInfo.origin.x);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSTLayout;
    -[TSDLayout capturedInfoPositionForAttachment](&v7, sel_capturedInfoPositionForAttachment);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)layoutGeometryFromInfo
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double RenderingFrame;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "position");
  v4 = v3;
  v6 = v5;
  -[TSTLayoutSpace tableOffset](-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"), "tableOffset");
  v8 = v7;
  if (-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"))
  {
    -[TSTLayout capturedInfoPositionForAttachment](self, "capturedInfoPositionForAttachment");
  }
  else
  {
    if (!-[TSTMasterLayout isDynamicallyChangingInfoGeometry](-[TSTLayout masterLayout](self, "masterLayout"), "isDynamicallyChangingInfoGeometry"))goto LABEL_6;
    -[TSDInfoGeometry position](-[TSTMasterLayout dynamicInfoGeometry](-[TSTLayout masterLayout](self, "masterLayout"), "dynamicInfoGeometry"), "position");
  }
  v4 = v9;
  v6 = v10;
LABEL_6:
  RenderingFrame = TSTLayoutGetRenderingFrame(self, 0);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = v4 + RenderingFrame;
  v19 = v6 + v12;
  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
  {
    v18 = TSDSubtractPoints(v18, v19, v8);
    v21 = v20;
    TSTLayoutGetTableNameHeight((uint64_t)self);
    v19 = v21 + v22;
  }
  self->mRenderingFrameForLayoutGeometryFromInfo.origin.x = RenderingFrame;
  self->mRenderingFrameForLayoutGeometryFromInfo.origin.y = v13;
  self->mRenderingFrameForLayoutGeometryFromInfo.size.width = v15;
  self->mRenderingFrameForLayoutGeometryFromInfo.size.height = v17;
  return -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v18, v19, v15, v17);
}

- (id)computeLayoutGeometry
{
  $A9F317E960FF98EB1BC9EE0DF2A48046 *p_mCached;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double height;
  id v18;
  void *v19;

  p_mCached = &self->mCached;
  __asm { FMOV            V0.2D, #1.0 }
  self->mCached.scaleToFitParent = _Q0;
  v8 = -[TSDLayout layoutGeometryFromProvider](self, "layoutGeometryFromProvider");
  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
  {
    objc_opt_class();
    -[TSDAbstractLayout parent](self, "parent");
    v9 = (void *)TSUDynamicCast();
    if (v9)
    {
      objc_msgSend(v9, "maximumFrameSizeForChild:", self);
      v11 = v10;
      v13 = v12;
      -[TSTLayout alignmentFrame](self, "alignmentFrame");
      if (v14 > v11)
        p_mCached->scaleToFitParent.width = v11 / v14;
      if (v15 <= v13)
      {
        height = p_mCached->scaleToFitParent.height;
      }
      else
      {
        height = v13 / v15;
        p_mCached->scaleToFitParent.height = v13 / v15;
      }
      if (p_mCached->scaleToFitParent.width != 1.0 || height != 1.0)
      {
        -[TSTLayoutSpaceBundle invalidateTableOffsets](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateTableOffsets");
        -[TSTLayoutSpaceBundle invalidateCoordinates](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateCoordinates");
        v8 = -[TSDLayout layoutGeometryFromProvider](self, "layoutGeometryFromProvider");
      }
    }
  }
  v18 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  if (v18 && (v19 = v18, (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(v19, "adjustLayoutGeometry:forLayout:", v8, self);
  else
    return v8;
}

- (id)initialInfoGeometry
{
  return -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", self->super.super.super.mCapturedInfoGeometryPositionForInline.x, self->super.super.super.mCapturedInfoGeometryPositionForInline.y, self->mCapturedStrokeFrameSizeForInline.width, self->mCapturedStrokeFrameSizeForInline.height);
}

- (int)wrapFitType
{
  return 0;
}

- (CGRect)alignmentFrame
{
  int v3;
  TSTLayoutSpace *v4;
  double StrokeFrame;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  TSDLayoutGeometry *v15;
  CGAffineTransform v16;
  CGRect v17;

  v3 = -[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText");
  v4 = -[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space");
  if (v3)
    StrokeFrame = TSTLayoutSpaceGetStrokeFrame((uint64_t)v4);
  else
    StrokeFrame = TSTLayoutSpaceGetFrame((uint64_t)v4);
  v9 = StrokeFrame;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  TSTLayoutGetTableNameHeight((uint64_t)self);
  v14 = v13;
  v15 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v15)
    -[TSDLayoutGeometry transform](v15, "transform");
  else
    memset(&v16, 0, sizeof(v16));
  v17.size.height = v14 + v12;
  v17.origin.y = v10 - v14;
  v17.origin.x = v9;
  v17.size.width = v11;
  return CGRectApplyAffineTransform(v17, &v16);
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  double StrokeFrame;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  TSDLayoutGeometry *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  TSDAbstractLayout *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  StrokeFrame = TSTLayoutSpaceGetStrokeFrame((uint64_t)-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v10)
    -[TSDLayoutGeometry transform](v10, "transform");
  else
    memset(&v21, 0, sizeof(v21));
  v22.origin.x = StrokeFrame;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  v23 = CGRectApplyAffineTransform(v22, &v21);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    v15 = -[TSDAbstractLayout parent](self, "parent");
    if (v15)
      -[TSDAbstractLayout transformInRoot](v15, "transformInRoot");
    else
      memset(&v20, 0, sizeof(v20));
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v25 = CGRectApplyAffineTransform(v24, &v20);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)inPrintPreviewMode
{
  return 0;
}

- (BOOL)inFindReplaceMode
{
  return 0;
}

- (BOOL)isZoomedEditing
{
  return 0;
}

- (void)validate
{
  double v3;
  double v4;
  double v5;
  double v6;
  TSTTablePartitioner *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSTMasterLayout *v13;
  TSTMasterLayout *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t (*__ptr32 *v17)();
  uint64_t HeaderRowsRepeat;
  uint64_t HeaderColumnsRepeat;
  unint64_t RangeForHint;
  unint64_t PartitionHeaderColumnsCellRange;
  unint64_t PartitionHeaderRowsCellRange;
  TSTLayoutSpace *v23;
  unint64_t v24;
  unsigned int v25;
  TSTLayoutSpace *v26;
  unsigned int v27;
  TSTLayoutSpace *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  TSTLayoutSpace *v34;
  unsigned int v35;
  TSTLayoutSpace *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  TSTLayoutSpace *v40;
  unsigned int v41;
  TSTLayoutSpace *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  TSTLayoutSpaceBundle *v48;
  int v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  TSTLayoutSpace *v53;
  TSTLayoutSpace *v54;
  _BOOL4 v55;
  TSTLayoutSpace *v56;
  unsigned int v57;
  uint64_t v58;
  TSTLayoutSpace *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  TSTLayoutSpace *v63;
  double CanvasStrokeFrame;
  double v65;
  double v66;
  double v67;
  TSTLayoutSpace *v68;
  unsigned int v69;
  uint64_t v70;
  TSTLayoutSpace *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  TSTLayoutSpace *v79;
  unsigned int v80;
  uint64_t v81;
  TSTLayoutSpace *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  TSTLayoutSpaceBundle *v92;
  unint64_t PartitionHeaderCornerCellRange;
  char v94;
  int v95;
  objc_super v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, void *);
  void *v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  char v108;
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;

  -[TSTLayout scaleToFit](self, "scaleToFit");
  v4 = v3;
  v6 = v5;
  v7 = -[TSTTableInfo partitioner](-[TSTLayout tableInfo](self, "tableInfo"), "partitioner");
  v8 = -[TSTTablePartitioner scaleIsValid](v7, "scaleIsValid");
  v9 = 1.0;
  v10 = 1.0;
  if (v8)
    -[TSTTablePartitioner scaleToFit](v7, "scaleToFit", 1.0, 1.0);
  -[TSTLayout setScaleToFit:](self, "setScaleToFit:", v9, v10);
  -[TSTLayout scaleToFit](self, "scaleToFit");
  if (v4 != v12 || v6 != v11)
  {
    -[TSTLayoutHint cellRange](-[TSTLayout layoutHint](self, "layoutHint"), "cellRange");
    TSTLayoutInvalidateCellRangeAndFittingRange(self);
    -[TSTLayout invalidateSize](self, "invalidateSize");
    -[TSTLayout setNeedsDisplay](self, "setNeedsDisplay");
  }
  self->mLayoutDirectionIsLeftToRight = -[TSTLayout p_getLayoutDirectionLeftToRight](self, "p_getLayoutDirectionLeftToRight");
  v13 = -[TSTLayout masterLayout](self, "masterLayout");
  -[TSTMasterLayout validate](v13, "validate");
  -[TSTMasterLayout validateLayoutHint:](v13, "validateLayoutHint:", -[TSTLayout layoutHint](self, "layoutHint"));
  TSTLayoutSetPartitionRange(self);
  -[TSTLayout validateTableNameVisibility](self, "validateTableNameVisibility");
  v14 = -[TSTLayout masterLayout](self, "masterLayout");
  v15 = -[TSTLayoutHint partitionPosition](-[TSTLayout layoutHint](self, "layoutHint"), "partitionPosition");
  v16 = MEMORY[0x24BDAC760];
  v17 = &off_217C27000;
  if ((~v15 & 0xF) != 0)
  {
    if (TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)v14))
      HeaderRowsRepeat = TSTMasterLayoutGetHeaderRowsRepeat((uint64_t)v14);
    else
      HeaderRowsRepeat = 0;
    if (TSTMasterLayoutGetTableNumberOfHeaderColumns((unsigned __int16 *)v14))
      HeaderColumnsRepeat = TSTMasterLayoutGetHeaderColumnsRepeat((uint64_t)v14);
    else
      HeaderColumnsRepeat = 0;
    RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)-[TSTLayout masterLayout](self, "masterLayout"), -[TSTLayout layoutHint](self, "layoutHint"));
    PartitionHeaderColumnsCellRange = TSTLayoutGetPartitionHeaderColumnsCellRange(self);
    PartitionHeaderRowsCellRange = TSTLayoutGetPartitionHeaderRowsCellRange(self);
    PartitionHeaderCornerCellRange = TSTLayoutGetPartitionHeaderCornerCellRange(self);
    v23 = -[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space");
    -[TSTLayoutSpace setHeaderRowsRepeat:](v23, "setHeaderRowsRepeat:", HeaderRowsRepeat);
    -[TSTLayoutSpace setHeaderColumnsRepeat:](v23, "setHeaderColumnsRepeat:", HeaderColumnsRepeat);
    v24 = HIWORD(RangeForHint);
    if ((_DWORD)HeaderColumnsRepeat)
    {
      if (!v24
        || (RangeForHint & 0xFFFF00000000) == 0
        || !HIWORD(PartitionHeaderColumnsCellRange)
        || (PartitionHeaderColumnsCellRange & 0xFFFF00000000) == 0
        || (unsigned __int16)RangeForHint > (unsigned __int16)PartitionHeaderColumnsCellRange
        || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)PartitionHeaderColumnsCellRange
        || BYTE2(PartitionHeaderColumnsCellRange) < BYTE2(RangeForHint)
        || (v25 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1),
            v25 < BYTE2(PartitionHeaderColumnsCellRange))
        || v25 < (BYTE4(PartitionHeaderColumnsCellRange) + BYTE2(PartitionHeaderColumnsCellRange) - 1)
        || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)(PartitionHeaderColumnsCellRange + HIWORD(PartitionHeaderColumnsCellRange) - 1))
      {
        v95 = HeaderRowsRepeat;
        if (!-[TSTLayoutSpaceBundle repeatHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderColumnsSpace"))
        {
          v26 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 5);
          -[TSTLayoutSpaceBundle setRepeatHeaderColumnsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderColumnsSpace:", v26);

        }
        if (BYTE2(PartitionHeaderColumnsCellRange) == 255)
          v27 = -1;
        else
          v27 = BYTE2(PartitionHeaderColumnsCellRange);
        if (WORD2(PartitionHeaderColumnsCellRange))
          HeaderRowsRepeat = WORD2(PartitionHeaderColumnsCellRange) + v27 - 1;
        else
          HeaderRowsRepeat = 0xFFFFFFFFLL;
        v28 = -[TSTLayoutSpaceBundle repeatHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderColumnsSpace");
        if ((unsigned __int16)PartitionHeaderColumnsCellRange == 0xFFFF)
          v29 = 0xFFFFFFFFLL;
        else
          v29 = (unsigned __int16)PartitionHeaderColumnsCellRange;
        v30 = v27 | ((unint64_t)v29 << 32);
        v31 = ((PartitionHeaderColumnsCellRange >> 16) & 0xFFFF00000000) + (v29 << 32) - 0x100000000;
        if (((PartitionHeaderColumnsCellRange >> 16) & 0xFFFF00000000) == 0)
          v31 = 0xFFFFFFFF00000000;
        TSTLayoutSpaceSetGridRange((uint64_t)v28, v30, HeaderRowsRepeat | v31);
        v16 = MEMORY[0x24BDAC760];
        LODWORD(HeaderRowsRepeat) = v95;
      }
      if ((_DWORD)HeaderRowsRepeat)
      {
LABEL_40:
        if (!v24
          || (RangeForHint & 0xFFFF00000000) == 0
          || !HIWORD(PartitionHeaderRowsCellRange)
          || (PartitionHeaderRowsCellRange & 0xFFFF00000000) == 0
          || (unsigned __int16)RangeForHint > (unsigned __int16)PartitionHeaderRowsCellRange
          || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)PartitionHeaderRowsCellRange
          || BYTE2(PartitionHeaderRowsCellRange) < BYTE2(RangeForHint)
          || (v32 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1),
              v32 < BYTE2(PartitionHeaderRowsCellRange))
          || v32 < (BYTE4(PartitionHeaderRowsCellRange) + BYTE2(PartitionHeaderRowsCellRange) - 1)
          || (unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) < (unsigned __int16)(PartitionHeaderRowsCellRange + HIWORD(PartitionHeaderRowsCellRange) - 1))
        {
          v33 = HeaderColumnsRepeat;
          if (!-[TSTLayoutSpaceBundle repeatHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderRowsSpace"))
          {
            v34 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 6);
            -[TSTLayoutSpaceBundle setRepeatHeaderRowsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderRowsSpace:", v34);

          }
          if (BYTE2(PartitionHeaderRowsCellRange) == 255)
            v35 = -1;
          else
            v35 = BYTE2(PartitionHeaderRowsCellRange);
          if (WORD2(PartitionHeaderRowsCellRange))
            HeaderColumnsRepeat = WORD2(PartitionHeaderRowsCellRange) + v35 - 1;
          else
            HeaderColumnsRepeat = 0xFFFFFFFFLL;
          v36 = -[TSTLayoutSpaceBundle repeatHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderRowsSpace");
          if ((unsigned __int16)PartitionHeaderRowsCellRange == 0xFFFF)
            v37 = 0xFFFFFFFFLL;
          else
            v37 = (unsigned __int16)PartitionHeaderRowsCellRange;
          v38 = v35 | ((unint64_t)v37 << 32);
          v39 = ((PartitionHeaderRowsCellRange >> 16) & 0xFFFF00000000) + (v37 << 32) - 0x100000000;
          if (((PartitionHeaderRowsCellRange >> 16) & 0xFFFF00000000) == 0)
            v39 = 0xFFFFFFFF00000000;
          TSTLayoutSpaceSetGridRange((uint64_t)v36, v38, HeaderColumnsRepeat | v39);
          LODWORD(HeaderColumnsRepeat) = v33;
        }
        if ((_DWORD)HeaderColumnsRepeat)
        {
          v94 = HeaderColumnsRepeat;
          v17 = &off_217C27000;
          if (!-[TSTLayoutSpaceBundle repeatHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderCornerSpace"))
          {
            v40 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 4);
            -[TSTLayoutSpaceBundle setRepeatHeaderCornerSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderCornerSpace:", v40);

          }
          if (BYTE2(PartitionHeaderCornerCellRange) == 255)
            v41 = -1;
          else
            v41 = BYTE2(PartitionHeaderCornerCellRange);
          if (WORD2(PartitionHeaderCornerCellRange))
            HeaderColumnsRepeat = WORD2(PartitionHeaderCornerCellRange) + v41 - 1;
          else
            HeaderColumnsRepeat = 0xFFFFFFFFLL;
          v42 = -[TSTLayoutSpaceBundle repeatHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "repeatHeaderCornerSpace");
          if ((unsigned __int16)PartitionHeaderCornerCellRange == 0xFFFF)
            v43 = 0xFFFFFFFFLL;
          else
            v43 = (unsigned __int16)PartitionHeaderCornerCellRange;
          v44 = v41 | ((unint64_t)v43 << 32);
          v45 = ((PartitionHeaderCornerCellRange >> 16) & 0xFFFF00000000) + (v43 << 32) - 0x100000000;
          if (((PartitionHeaderCornerCellRange >> 16) & 0xFFFF00000000) == 0)
            v45 = 0xFFFFFFFF00000000;
          TSTLayoutSpaceSetGridRange((uint64_t)v42, v44, HeaderColumnsRepeat | v45);
          LOBYTE(HeaderColumnsRepeat) = v94;
          goto LABEL_82;
        }
LABEL_81:
        -[TSTLayoutSpaceBundle setRepeatHeaderCornerSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderCornerSpace:", 0);
        v17 = &off_217C27000;
LABEL_82:
        -[TSTLayoutSpace viewScale](v23, "viewScale");
        v47 = v46;
        v114 = 0u;
        v115 = 0u;
        v113 = 0u;
        if (v23)
        {
          -[TSTLayoutSpace transformToCanvas](v23, "transformToCanvas");
          v111 = 0u;
          v112 = 0u;
          v110 = 0u;
          -[TSTLayoutSpace transformToDevice](v23, "transformToDevice");
        }
        else
        {
          v111 = 0uLL;
          v112 = 0uLL;
          v110 = 0uLL;
        }
        v48 = -[TSTLayout spaceBundle](self, "spaceBundle");
        v97 = v16;
        v98 = *((_QWORD *)v17 + 176);
        v99 = ___ZL28TSTLayoutUpdateRepeatHeadersP9TSTLayout_block_invoke;
        v100 = &__block_descriptor_138_e24_B16__0__TSTLayoutSpace_8l;
        v108 = HeaderRowsRepeat;
        v109 = HeaderColumnsRepeat;
        v101 = v47;
        v102 = v113;
        v103 = v114;
        v104 = v115;
        v105 = v110;
        v106 = v111;
        v107 = v112;
        -[TSTLayoutSpaceBundle performActionOnRepeatLayoutSpaces:](v48, "performActionOnRepeatLayoutSpaces:", &v97);
        goto LABEL_86;
      }
    }
    else
    {
      -[TSTLayoutSpaceBundle setRepeatHeaderColumnsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderColumnsSpace:", 0);
      if ((_DWORD)HeaderRowsRepeat)
        goto LABEL_40;
    }
    -[TSTLayoutSpaceBundle setRepeatHeaderRowsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderRowsSpace:", 0);
    goto LABEL_81;
  }
  -[TSTLayoutSpaceBundle setRepeatHeaderColumnsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderColumnsSpace:", 0);
  -[TSTLayoutSpaceBundle setRepeatHeaderRowsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderRowsSpace:", 0);
  -[TSTLayoutSpaceBundle setRepeatHeaderCornerSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setRepeatHeaderCornerSpace:", 0);
LABEL_86:
  if (objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "isCanvasInteractive")&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "animatingViewScale") & 1) == 0)
  {
    v49 = !-[TSTLayout inPrintPreviewMode](self, "inPrintPreviewMode");
  }
  else
  {
    v49 = 0;
  }
  v50 = TSTLayoutGetPartitionHeaderColumnsCellRange(self);
  v51 = TSTLayoutGetPartitionHeaderRowsCellRange(self);
  v52 = TSTLayoutGetPartitionHeaderCornerCellRange(self);
  v53 = -[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space");
  if (v49 && TSTLayoutGetFrozenHeaderColumnsEnabled(self))
  {
    v54 = -[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace");
    v55 = v54 == 0;
    if (!v54)
    {
      v56 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 2);
      -[TSTLayoutSpaceBundle setFrozenHeaderColumnsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderColumnsSpace:", v56);

    }
    if (BYTE2(v50) == 255)
      v57 = -1;
    else
      v57 = BYTE2(v50);
    if (WORD2(v50))
      v58 = WORD2(v50) + v57 - 1;
    else
      v58 = 0xFFFFFFFFLL;
    v59 = -[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace");
    if ((unsigned __int16)v50 == 0xFFFF)
      v60 = 0xFFFFFFFFLL;
    else
      v60 = (unsigned __int16)v50;
    v61 = v57 | ((unint64_t)v60 << 32);
    v62 = ((v50 >> 16) & 0xFFFF00000000) + (v60 << 32) - 0x100000000;
    if (((v50 >> 16) & 0xFFFF00000000) == 0)
      v62 = 0xFFFFFFFF00000000;
    TSTLayoutSpaceSetGridRange((uint64_t)v59, v61, v58 | v62);
    v16 = MEMORY[0x24BDAC760];
    v17 = &off_217C27000;
  }
  else
  {
    v63 = -[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace");
    v55 = v63 != 0;
    if (v63)
    {
      CanvasStrokeFrame = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace"));
      -[TSTLayout setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"), CanvasStrokeFrame, v65, v66, v67));
      -[TSTLayoutSpaceBundle setFrozenHeaderColumnsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderColumnsSpace:", 0);
    }
    if (!v49)
      goto LABEL_124;
  }
  if (TSTLayoutGetFrozenHeaderRowsEnabled(self))
  {
    if (!-[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace"))
    {
      v68 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 3);
      -[TSTLayoutSpaceBundle setFrozenHeaderRowsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderRowsSpace:", v68);

      v55 = 1;
    }
    if (BYTE2(v51) == 255)
      v69 = -1;
    else
      v69 = BYTE2(v51);
    if (WORD2(v51))
      v70 = WORD2(v51) + v69 - 1;
    else
      v70 = 0xFFFFFFFFLL;
    v71 = -[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace");
    if ((unsigned __int16)v51 == 0xFFFF)
      v72 = 0xFFFFFFFFLL;
    else
      v72 = (unsigned __int16)v51;
    v73 = v69 | ((unint64_t)v72 << 32);
    v74 = ((v51 >> 16) & 0xFFFF00000000) + (v72 << 32) - 0x100000000;
    if (((v51 >> 16) & 0xFFFF00000000) == 0)
      v74 = 0xFFFFFFFF00000000;
    TSTLayoutSpaceSetGridRange((uint64_t)v71, v73, v70 | v74);
    v17 = &off_217C27000;
    goto LABEL_126;
  }
LABEL_124:
  if (-[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace"))
  {
    v75 = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace"));
    -[TSTLayout setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"), v75, v76, v77, v78));
    -[TSTLayoutSpaceBundle setFrozenHeaderRowsSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderRowsSpace:", 0);
    v55 = 1;
  }
LABEL_126:
  if (-[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace")&& -[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace"))
  {
    if (!-[TSTLayoutSpaceBundle frozenHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderCornerSpace"))
    {
      v55 = 1;
      v79 = -[TSTLayoutSpace initWithLayoutSpaceBundle:type:]([TSTLayoutSpace alloc], "initWithLayoutSpaceBundle:type:", -[TSTLayout spaceBundle](self, "spaceBundle"), 1);
      -[TSTLayoutSpaceBundle setFrozenHeaderCornerSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderCornerSpace:", v79);

    }
    if (BYTE2(v52) == 255)
      v80 = -1;
    else
      v80 = BYTE2(v52);
    if (WORD2(v52))
      v81 = WORD2(v52) + v80 - 1;
    else
      v81 = 0xFFFFFFFFLL;
    v82 = -[TSTLayoutSpaceBundle frozenHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderCornerSpace");
    if ((unsigned __int16)v52 == 0xFFFF)
      v83 = 0xFFFFFFFFLL;
    else
      v83 = (unsigned __int16)v52;
    v84 = v80 | ((unint64_t)v83 << 32);
    v85 = ((v52 >> 16) & 0xFFFF00000000) + (v83 << 32) - 0x100000000;
    if (((v52 >> 16) & 0xFFFF00000000) == 0)
      v85 = 0xFFFFFFFF00000000;
    TSTLayoutSpaceSetGridRange((uint64_t)v82, v84, v81 | v85);
  }
  else if (-[TSTLayoutSpaceBundle frozenHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderCornerSpace"))
  {
    v86 = TSTLayoutSpaceGetCanvasStrokeFrame((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderCornerSpace"));
    -[TSTLayout setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", TSTLayoutSpaceGetLayoutRectForCanvasRect((uint64_t)-[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space"), v86, v87, v88, v89));
    -[TSTLayoutSpaceBundle setFrozenHeaderCornerSpace:](-[TSTLayout spaceBundle](self, "spaceBundle"), "setFrozenHeaderCornerSpace:", 0);
    v55 = 1;
  }
  -[TSTLayoutSpace viewScale](v53, "viewScale");
  v91 = v90;
  v114 = 0u;
  v115 = 0u;
  v113 = 0u;
  if (v53)
  {
    -[TSTLayoutSpace transformToCanvas](v53, "transformToCanvas");
    v111 = 0u;
    v112 = 0u;
    v110 = 0u;
    -[TSTLayoutSpace transformToDevice](v53, "transformToDevice");
  }
  else
  {
    v111 = 0uLL;
    v112 = 0uLL;
    v110 = 0uLL;
  }
  v92 = -[TSTLayout spaceBundle](self, "spaceBundle");
  v97 = v16;
  v98 = *((_QWORD *)v17 + 176);
  v99 = ___ZL28TSTLayoutUpdateFrozenHeadersP9TSTLayout_block_invoke;
  v100 = &__block_descriptor_136_e24_B16__0__TSTLayoutSpace_8l;
  v101 = v91;
  v102 = v113;
  v103 = v114;
  v104 = v115;
  v105 = v110;
  v106 = v111;
  v107 = v112;
  -[TSTLayoutSpaceBundle performActionOnFrozenLayoutSpaces:](v92, "performActionOnFrozenLayoutSpaces:", &v97);
  if (v55)
    -[TSTLayout invalidate](self, "invalidate");
  self->mCoordinatesChangedMaskForChrome |= -[TSTLayoutSpaceBundle validateLayoutSpaces](-[TSTLayout spaceBundle](self, "spaceBundle"), "validateLayoutSpaces");
  v96.receiver = self;
  v96.super_class = (Class)TSTLayout;
  -[TSDLayout validate](&v96, sel_validate);
  TSTLayoutUpdateTransformToCanvas(self);
}

- (void)setNeedsDisplay
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTLayout;
  -[TSDLayout setNeedsDisplay](&v2, sel_setNeedsDisplay);
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v8.receiver = self;
    v8.super_class = (Class)TSTLayout;
    -[TSDLayout setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTLayout;
  -[TSDDrawableLayout invalidate](&v3, sel_invalidate);
  -[TSTLayoutHint setIsValid:](-[TSTLayout layoutHint](self, "layoutHint"), "setIsValid:", 0);
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTLayout;
  -[TSDLayout invalidateSize](&v3, sel_invalidateSize);
  -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)bezierPathsForCellRegion:(id)a3 transform:(CGAffineTransform *)a4 viewScale:(double)a5 inset:(double)a6 block:(id)a7
{
  int FrozenHeaderColumnsFloating;
  int FrozenHeaderRowsFloating;
  char v12;
  unint64_t Range;
  unsigned __int16 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  int v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  int v33;
  unint64_t v34;
  unint64_t v35;
  __int16 v36;
  __int16 v37;
  unint64_t v38;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id obj;
  unint64_t v47;
  _QWORD v48[10];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  __int16 v56;
  char v57;
  char v58;
  __int16 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  __int16 v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v47 = objc_msgSend(a3, "boundingCellRange");
  FrozenHeaderColumnsFloating = TSTLayoutGetFrozenHeaderColumnsFloating(self);
  FrozenHeaderRowsFloating = TSTLayoutGetFrozenHeaderRowsFloating(self);
  v12 = FrozenHeaderRowsFloating;
  if (FrozenHeaderColumnsFloating)
  {
    Range = TSTLayoutSpaceGetRange((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace"));
    v14 = Range;
    v15 = Range >> 16;
    v43 = HIWORD(Range);
    if ((v12 & 1) == 0)
    {
      v37 = Range;
      v38 = Range >> 16;
      LOWORD(v44) = 0;
      LOWORD(v45) = 0;
      LOWORD(v34) = 0;
      LOBYTE(v35) = 0;
      LOBYTE(v41) = -1;
      LOWORD(v42) = 0;
      v33 = 0xFFFFFF;
      v36 = -1;
      goto LABEL_35;
    }
  }
  else
  {
    LODWORD(v15) = 255;
    v14 = -1;
    if (!FrozenHeaderRowsFloating)
    {
      LOWORD(v44) = 0;
      LOWORD(v45) = 0;
      LOWORD(v34) = 0;
      LOBYTE(v35) = 0;
      LOWORD(v42) = 0;
      LOWORD(v43) = 0;
      v33 = 0xFFFFFF;
      LODWORD(v38) = 255;
      LOBYTE(v41) = -1;
      v36 = -1;
      v37 = -1;
      goto LABEL_35;
    }
    v43 = 0;
  }
  v16 = TSTLayoutSpaceGetRange((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace"));
  v35 = v16 >> 24;
  v36 = v16;
  v41 = v16 >> 16;
  v42 = HIDWORD(v16);
  v45 = HIWORD(v16);
  LODWORD(v38) = v15;
  if (FrozenHeaderColumnsFloating)
  {
    v17 = v16;
    v18 = TSTLayoutSpaceGetRange((uint64_t)-[TSTLayoutSpaceBundle frozenHeaderCornerSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderCornerSpace"));
    v44 = HIWORD(v18);
    if (v15 >= 0x10000)
    {
      v19 = v14 | (v43 << 48) | ((unint64_t)v15 << 16);
      if (HIWORD(v19))
      {
        if (v44)
        {
          if ((v18 & 0xFFFF00000000) != 0
            && v14 <= (unsigned __int16)v18
            && (unsigned __int16)(v43 + v14 - 1) >= (unsigned __int16)v18
            && BYTE2(v18) >= v15)
          {
            v20 = (BYTE4(v19) + v15 - 1);
            if (v20 >= BYTE2(v18) && v20 >= (BYTE4(v18) + BYTE2(v18) - 1))
            {
              if ((unsigned __int16)(v43 + v14 - 1) < (unsigned __int16)(v18 + HIWORD(v18) - 1))
                v21 = 0;
              else
                v21 = HIWORD(v18);
              v14 += v21;
              LOWORD(v43) = v43 - v21;
            }
          }
        }
      }
    }
    v37 = v14;
    v33 = v18;
    v34 = HIDWORD(v18);
    if (v45)
    {
      if ((v17 & 0xFFFF00000000) != 0)
      {
        if (v44)
        {
          if ((v18 & 0xFFFF00000000) != 0
            && (unsigned __int16)v17 <= (unsigned __int16)v18
            && (unsigned __int16)(v17 + v45 - 1) >= (unsigned __int16)v18
            && BYTE2(v17) <= BYTE2(v18))
          {
            v22 = (v42 + BYTE2(v17) - 1);
            if (v22 >= BYTE2(v18) && v22 >= (BYTE4(v18) + BYTE2(v18) - 1))
            {
              if ((unsigned __int16)(v17 + v45 - 1) < (unsigned __int16)(v18 + HIWORD(v18) - 1))
                v23 = 0;
              else
                v23 = WORD2(v18);
              LOBYTE(v41) = v23 + v41;
              LOWORD(v42) = v42 - v23;
            }
          }
        }
      }
    }
  }
  else
  {
    v37 = v14;
    LOWORD(v44) = 0;
    v33 = 0xFFFFFF;
    LOWORD(v34) = 0;
  }
LABEL_35:
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_msgSend(TSTLayoutGetVisibleLayoutSpaces(self), "reverseObjectEnumerator");
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v77 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v28 = objc_msgSend(v27, "layoutSpaceType");
        if (TSTLayoutSpaceIntersectsCellRange((_BOOL8)v27, v47))
        {
          v70 = 0;
          v71 = &v70;
          v72 = 0x3052000000;
          v73 = __Block_byref_object_copy__70;
          v74 = __Block_byref_object_dispose__71;
          v75 = 0;
          v64 = 0;
          v65 = &v64;
          v66 = 0x3052000000;
          v67 = __Block_byref_object_copy__70;
          v68 = __Block_byref_object_dispose__71;
          v69 = 0;
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __70__TSTLayout_bezierPathsForCellRegion_transform_viewScale_inset_block___block_invoke;
          v48[3] = &unk_24D82F850;
          v52 = v28;
          v53 = v37;
          v54 = v38;
          v55 = v43;
          v56 = v36;
          v57 = v41;
          v58 = v35;
          v59 = v42;
          v60 = v45;
          v61 = v33;
          v62 = v34;
          v63 = v44;
          v48[4] = v27;
          v48[5] = self;
          *(double *)&v48[8] = a5;
          *(double *)&v48[9] = a6;
          v29 = *(_OWORD *)&a4->tx;
          v30 = *(_OWORD *)&a4->a;
          v50 = *(_OWORD *)&a4->c;
          v51 = v29;
          v49 = v30;
          v48[6] = &v64;
          v48[7] = &v70;
          objc_msgSend(a3, "enumerateCellRangesUsingBlock:", v48);
          v31 = (void *)v65[5];
          if (v31)
          {
            if ((objc_msgSend(v31, "isEmpty") & 1) == 0)
              (*((void (**)(id, uint64_t, uint64_t, void *))a7 + 2))(a7, v65[5], v71[5], v27);
          }
          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(&v70, 8);
        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v24);
  }
}

uint64_t __70__TSTLayout_bezierPathsForCellRegion_transform_viewScale_inset_block___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unint64_t v43;
  TSTLayout *v44;
  unint64_t v45;
  CGFloat v46;
  CGFloat v47;
  id *v48;
  uint64_t v49;
  BOOL v50;
  int v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  BOOL v66;
  uint64_t v67;
  unint64_t v68;
  __int16 v69;
  unsigned int v70;
  unsigned int v71;
  BOOL v72;
  unsigned int v73;
  unsigned int v74;
  TSDBezierPath *AlignedStrokeFramePathForRange;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  _OWORD v81[3];
  _OWORD v82[3];
  id v83;

  v2 = a2;
  result = TSTLayoutSpaceIntersectsCellRange(*(_QWORD *)(a1 + 32), a2);
  if ((_DWORD)result)
  {
    v5 = v2 >> 16;
    v6 = WORD2(v2);
    v7 = HIWORD(v2);
    switch(*(_DWORD *)(a1 + 128))
    {
      case 0:
        v8 = *(_QWORD *)(a1 + 132);
        if (*(_WORD *)(a1 + 132) != 0xFFFF)
        {
          v9 = (v8 & 0xFF0000) == 0xFF0000 || HIWORD(v8) == 0;
          if (!v9 && (v8 & 0xFFFF00000000) != 0)
          {
            v49 = 0xFFFFLL;
            v50 = (~(_DWORD)v2 & 0xFF0000) == 0 || (unsigned __int16)v2 == 0xFFFFLL;
            v51 = !v50;
            v52 = 0;
            if (v50)
            {
              v54 = 0;
              v53 = 16711680;
            }
            else
            {
              v53 = 16711680;
              v49 = 0xFFFFLL;
              v54 = 0;
              if (v7 && (v2 & 0xFFFF00000000) != 0)
              {
                v49 = 0;
                v55 = BYTE2(v8);
                if (BYTE2(v8) <= BYTE2(v2))
                  v55 = BYTE2(v2);
                if ((unsigned __int16)*(_QWORD *)(a1 + 132) <= (unsigned __int16)v2)
                  v56 = (unsigned __int16)v2;
                else
                  v56 = (unsigned __int16)*(_QWORD *)(a1 + 132);
                if ((BYTE4(v8) + BYTE2(v8) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1))
                  v57 = (BYTE4(v2) + BYTE2(v2) - 1);
                else
                  v57 = (BYTE4(v8) + BYTE2(v8) - 1);
                if ((unsigned __int16)(v8 + HIWORD(v8) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1))
                  v58 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
                else
                  v58 = (unsigned __int16)(v8 + HIWORD(v8) - 1);
                v53 = 0;
                v52 = 0;
                v54 = 0;
                if (v56 <= v58 && v55 <= v57)
                {
                  v54 = ((unint64_t)(v58 - v56) << 48) + 0x1000000000000;
                  v52 = (unint64_t)(unsigned __int16)(v57 - v55 + 1) << 32;
                  v53 = v55 << 16;
                  v49 = v56;
                }
              }
            }
            v59 = v53 | v54 | v49 | v52;
            if ((_WORD)v59 != 0xFFFF && (v59 & 0xFF0000) != 0xFF0000 && HIWORD(v59) && (v59 & 0xFFFF00000000) != 0)
            {
              v60 = 0;
              if (v51)
              {
                v61 = 0;
                if (v7 && (v2 & 0xFFFF00000000) != 0)
                {
                  v62 = BYTE2(v8);
                  if (BYTE2(v8) <= BYTE2(v2))
                    v62 = BYTE2(v2);
                  v63 = (unsigned __int16)*(_QWORD *)(a1 + 132);
                  if (v63 <= (unsigned __int16)v2)
                    v63 = (unsigned __int16)v2;
                  if ((BYTE4(v8) + BYTE2(v8) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1))
                    v64 = (BYTE4(v2) + BYTE2(v2) - 1);
                  else
                    v64 = (BYTE4(v8) + BYTE2(v8) - 1);
                  v65 = (unsigned __int16)(v8 + HIWORD(v8) - 1);
                  if (v65 >= (unsigned __int16)(v2 + HIWORD(v2) - 1))
                    v65 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
                  v66 = v62 > v64;
                  if (v62 <= v64)
                    v60 = (((unint64_t)(v64 - v62) << 32) + 0x100000000) & 0xFFFF00000000;
                  else
                    v60 = 0;
                  if (v66)
                    v67 = 0;
                  else
                    v67 = 0x1000000000000;
                  if (v63 <= v65)
                  {
                    v61 = v67;
                  }
                  else
                  {
                    v60 = 0;
                    v61 = 0;
                  }
                }
              }
              else
              {
                v61 = 0;
              }
              v80 = (v61 | v60) >> 32;
              LOBYTE(v5) = v80 + BYTE2(v2);
              v6 = (unsigned __int16)(WORD2(v2) - v80);
            }
          }
        }
        v11 = *(_QWORD *)(a1 + 140);
        if (*(_WORD *)(a1 + 140) == 0xFFFF
          || (v11 & 0xFF0000) == 0xFF0000
          || !HIWORD(v11)
          || (v11 & 0xFFFF00000000) == 0)
        {
          goto LABEL_161;
        }
        v12 = v2 & 0xFFFF0000FF000000 | (v6 << 32);
        v13 = v12 | ((unint64_t)v5 << 16);
        v14 = v13 | (unsigned __int16)v2;
        v15 = 0xFFFFLL;
        v16 = (_BYTE)v5 == 0xFF || (unsigned __int16)v2 == 0xFFFFLL;
        v17 = !v16;
        v18 = 0;
        if (v16)
        {
          v20 = 0;
          v19 = 16711680;
        }
        else
        {
          v19 = 16711680;
          v15 = 0xFFFFLL;
          if ((_DWORD)v6)
          {
            v20 = 0;
            if (HIWORD(v14))
            {
              v15 = 0;
              v21 = BYTE2(v11);
              if (BYTE2(v11) <= v5)
                v21 = v5;
              if ((unsigned __int16)*(_QWORD *)(a1 + 140) <= (unsigned __int16)v2)
                v22 = (unsigned __int16)v2;
              else
                v22 = (unsigned __int16)*(_QWORD *)(a1 + 140);
              if ((BYTE4(v11) + BYTE2(v11) - 1) >= (BYTE4(v12) + BYTE2(v13) - 1))
                v23 = (BYTE4(v12) + BYTE2(v13) - 1);
              else
                v23 = (BYTE4(v11) + BYTE2(v11) - 1);
              if ((unsigned __int16)(v11 + HIWORD(v11) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1))
                v24 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
              else
                v24 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
              v19 = 0;
              v18 = 0;
              v20 = 0;
              if (v22 <= v24 && v21 <= v23)
              {
                v20 = ((unint64_t)(v24 - v22) << 48) + 0x1000000000000;
                v18 = (unint64_t)(unsigned __int16)(v23 - v21 + 1) << 32;
                v19 = v21 << 16;
                v15 = v22;
              }
            }
          }
          else
          {
            v20 = 0;
          }
        }
        v68 = v19 | v20 | v15 | v18;
        if ((_WORD)v68 == 0xFFFF || (v68 & 0xFF0000) == 0xFF0000 || !HIWORD(v68) || (v68 & 0xFFFF00000000) == 0)
          goto LABEL_161;
        v69 = 0;
        if (v17 && (_DWORD)v6 && HIWORD(v14))
        {
          v69 = 0;
          v70 = v5;
          if (BYTE2(v11) > v5)
            v70 = BYTE2(v11);
          v71 = (unsigned __int16)*(_QWORD *)(a1 + 140);
          if (v71 <= (unsigned __int16)v2)
            v71 = (unsigned __int16)v2;
          v72 = (BYTE4(v11) + BYTE2(v11) - 1) >= (BYTE4(v12)
                                                                                                + BYTE2(v13)
                                                                                                - 1);
          v73 = (BYTE4(v12) + BYTE2(v13) - 1);
          if (!v72)
            v73 = (BYTE4(v11) + BYTE2(v11) - 1);
          v74 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
          if (v74 >= (unsigned __int16)(v2 + HIWORD(v2) - 1))
            v74 = (unsigned __int16)(v2 + HIWORD(v2) - 1);
          if (v71 <= v74 && v70 <= v73)
            v69 = v74 - v71 + 1;
        }
        LOWORD(v43) = v69 + v2;
        v7 = (unsigned __int16)(HIWORD(v2) - v69);
        goto LABEL_162;
      case 1:
        v25 = 0;
        v26 = *(_QWORD *)(a1 + 148);
        v27 = 16711680;
        v28 = 0xFFFFLL;
        if (*(_WORD *)(a1 + 148) == 0xFFFF)
          goto LABEL_89;
        v29 = 0;
        if ((v26 & 0xFF0000) == 0xFF0000)
          goto LABEL_90;
        v25 = 0;
        v27 = 16711680;
        v28 = 0xFFFFLL;
        if (!HIWORD(v26))
          goto LABEL_89;
        v29 = 0;
        if ((v26 & 0xFFFF00000000) == 0)
          goto LABEL_90;
        v25 = 0;
        v27 = 16711680;
        v28 = 0xFFFFLL;
        if ((unsigned __int16)v2 == 0xFFFFLL)
          goto LABEL_89;
        v29 = 0;
        if ((v2 & 0xFF0000) != 0xFF0000)
        {
          v25 = 0;
          v27 = 16711680;
          v28 = 0xFFFFLL;
          if (v7)
          {
            v29 = 0;
            if ((v2 & 0xFFFF00000000) != 0)
            {
              v28 = 0;
              v30 = BYTE2(v26) <= BYTE2(v2) ? BYTE2(v2) : BYTE2(v26);
              v31 = (unsigned __int16)*(_QWORD *)(a1 + 148) <= (unsigned __int16)v2
                  ? (unsigned __int16)v2
                  : (unsigned __int16)*(_QWORD *)(a1 + 148);
              v32 = (BYTE4(v26) + BYTE2(v26) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)
                  ? (BYTE4(v2) + BYTE2(v2) - 1)
                  : (BYTE4(v26) + BYTE2(v26) - 1);
              v33 = (unsigned __int16)(v26 + HIWORD(v26) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  ? (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  : (unsigned __int16)(v26 + HIWORD(v26) - 1);
              v27 = 0;
              v25 = 0;
              v29 = 0;
              if (v31 <= v33 && v30 <= v32)
              {
                v29 = ((unint64_t)(v33 - v31) << 48) + 0x1000000000000;
                v25 = (unint64_t)(unsigned __int16)(v32 - v30 + 1) << 32;
                v27 = v30 << 16;
                v28 = v31;
              }
            }
          }
          else
          {
LABEL_89:
            v29 = 0;
          }
        }
LABEL_90:
        v83 = 0;
        v44 = *(TSTLayout **)(a1 + 40);
        v45 = v27 | v29 | v28 | v25;
        v46 = *(double *)(a1 + 64);
        v47 = *(double *)(a1 + 72);
        v48 = 0;
        goto LABEL_163;
      case 2:
        v34 = 0;
        v35 = *(_QWORD *)(a1 + 132);
        goto LABEL_64;
      case 3:
        v34 = 0;
        v35 = *(_QWORD *)(a1 + 140);
LABEL_64:
        v36 = 16711680;
        v37 = 0xFFFFLL;
        if ((_WORD)v35 == 0xFFFF)
          goto LABEL_87;
        v38 = 0;
        if ((v35 & 0xFF0000) == 0xFF0000)
          goto LABEL_88;
        v34 = 0;
        v36 = 16711680;
        v37 = 0xFFFFLL;
        if (!HIWORD(v35))
          goto LABEL_87;
        v38 = 0;
        if ((v35 & 0xFFFF00000000) == 0)
          goto LABEL_88;
        v34 = 0;
        v36 = 16711680;
        v37 = 0xFFFFLL;
        if ((unsigned __int16)v2 == 0xFFFFLL)
          goto LABEL_87;
        v38 = 0;
        if ((v2 & 0xFF0000) != 0xFF0000)
        {
          v34 = 0;
          v36 = 16711680;
          v37 = 0xFFFFLL;
          if (v7)
          {
            v38 = 0;
            if ((v2 & 0xFFFF00000000) != 0)
            {
              v37 = 0;
              v39 = BYTE2(v35) <= BYTE2(v2) ? BYTE2(v2) : BYTE2(v35);
              v40 = (unsigned __int16)v35 <= (unsigned __int16)v2
                  ? (unsigned __int16)v2
                  : (unsigned __int16)v35;
              v41 = (BYTE4(v35) + BYTE2(v35) - 1) >= (BYTE4(v2) + BYTE2(v2) - 1)
                  ? (BYTE4(v2) + BYTE2(v2) - 1)
                  : (BYTE4(v35) + BYTE2(v35) - 1);
              v42 = (unsigned __int16)(v35 + HIWORD(v35) - 1) >= (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  ? (unsigned __int16)(v2 + HIWORD(v2) - 1)
                  : (unsigned __int16)(v35 + HIWORD(v35) - 1);
              v36 = 0;
              v34 = 0;
              v38 = 0;
              if (v40 <= v42 && v39 <= v41)
              {
                v38 = ((unint64_t)(v42 - v40) << 48) + 0x1000000000000;
                v34 = (unint64_t)(unsigned __int16)(v41 - v39 + 1) << 32;
                v36 = v39 << 16;
                v37 = v40;
              }
            }
          }
          else
          {
LABEL_87:
            v38 = 0;
          }
        }
LABEL_88:
        v43 = v36 | v38 | v37 | v34;
        v5 = v43 >> 16;
        v6 = WORD2(v43);
        v7 = HIWORD(v38);
        LODWORD(v2) = v43;
LABEL_162:
        v83 = 0;
        v44 = *(TSTLayout **)(a1 + 40);
        v45 = (v6 << 32) | (v7 << 48) | v2 & 0xFF000000 | ((unint64_t)v5 << 16) | (unsigned __int16)v43;
        v46 = *(double *)(a1 + 64);
        v47 = *(double *)(a1 + 72);
        v48 = &v83;
LABEL_163:
        AlignedStrokeFramePathForRange = TSTLayoutGetAlignedStrokeFramePathForRange(v44, v45, 0, v48, v46, v47);
        v76 = *(_OWORD *)(a1 + 96);
        v82[0] = *(_OWORD *)(a1 + 80);
        v82[1] = v76;
        v82[2] = *(_OWORD *)(a1 + 112);
        -[TSDBezierPath transformUsingAffineTransform:](AlignedStrokeFramePathForRange, "transformUsingAffineTransform:", v82);
        v77 = *(_OWORD *)(a1 + 96);
        v81[0] = *(_OWORD *)(a1 + 80);
        v81[1] = v77;
        v81[2] = *(_OWORD *)(a1 + 112);
        result = objc_msgSend(v83, "transformUsingAffineTransform:", v81);
        if (AlignedStrokeFramePathForRange)
        {
          v78 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          result = *(_QWORD *)(v78 + 40);
          if (result)
          {
            result = objc_msgSend((id)result, "uniteWithBezierPath:", AlignedStrokeFramePathForRange);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
          }
          else
          {
            *(_QWORD *)(v78 + 40) = AlignedStrokeFramePathForRange;
          }
        }
        if (v83)
        {
          v79 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          result = *(_QWORD *)(v79 + 40);
          if (result)
          {
            result = objc_msgSend((id)result, "uniteWithBezierPath:");
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
          }
          else
          {
            *(_QWORD *)(v79 + 40) = v83;
          }
        }
        break;
      default:
LABEL_161:
        LOWORD(v43) = v2;
        goto LABEL_162;
    }
  }
  return result;
}

- (void)invalidateTableNameVisibility
{
  self->mTableNameVisibilityIsValid = 0;
}

- (void)validateTableNameVisibility
{
  _BOOL4 mTableNameVisible;
  _BOOL8 v4;

  if (!self->mTableNameVisibilityIsValid)
  {
    mTableNameVisible = self->mTableNameVisible;
    if (TSTMasterLayoutGetTableNameEnabled((uint64_t)-[TSTLayout masterLayout](self, "masterLayout")))
      v4 = -[TSTLayoutHint partitionPosition](-[TSTLayout layoutHint](self, "layoutHint"), "partitionPosition") & 1;
    else
      LODWORD(v4) = 0;
    self->mTableNameVisible = v4;
    if (mTableNameVisible != v4)
    {
      -[TSTLayoutSpaceBundle invalidateTableOffsets](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateTableOffsets");
      -[TSTLayoutSpaceBundle invalidateCoordinates](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateCoordinates");
    }
    self->mTableNameVisibilityIsValid = 1;
  }
}

- (BOOL)isBeingManipulated
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTLayout;
  return -[TSDLayout isBeingManipulated](&v4, sel_isBeingManipulated)
      || -[TSTMasterLayout inDynamicLayoutMode](-[TSTLayout masterLayout](self, "masterLayout"), "inDynamicLayoutMode")
      || -[TSTMasterLayout dynamicRepResize](-[TSTLayout masterLayout](self, "masterLayout"), "dynamicRepResize");
}

- (void)p_updateCachedStyleInformationFromCellID:(id)a3
{
  void *CellStyleAtCellID;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  unsigned int v15;

  CellStyleAtCellID = (void *)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0);
  if (CellStyleAtCellID
    || (CellStyleAtCellID = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0)) != 0)
  {
    v6 = (void *)objc_msgSend(CellStyleAtCellID, "valueForProperty:", 904);
    if (v6)
    {
      v7 = v6;
      if ((objc_msgSend(v6, "isEqual:", 0) & 1) == 0)
      {
        objc_msgSend(v7, "topInset");
        v9 = v8;
        objc_msgSend(v7, "leftInset");
        v11 = v10;
        objc_msgSend(v7, "bottomInset");
        v13 = v12;
        objc_msgSend(v7, "rightInset");
        self->mCachedPaddingForEditingCell.top = v9;
        self->mCachedPaddingForEditingCell.left = v11;
        self->mCachedPaddingForEditingCell.bottom = v13;
        self->mCachedPaddingForEditingCell.right = v14;
        self->mCachedPaddingForEditingCell.left = TSTMasterLayoutApplyMinimumHorizontalInset(v11);
        self->mCachedPaddingForEditingCell.right = TSTMasterLayoutApplyMinimumHorizontalInset(self->mCachedPaddingForEditingCell.right);
      }
    }
    self->mCachedVerticalAlignmentForEditingCell = 0;
    v15 = objc_msgSend(CellStyleAtCellID, "intValueForProperty:", 903);
    if ((v15 & 0x7FFFFFFF) != 0)
      self->mCachedVerticalAlignmentForEditingCell = v15;
  }
}

- (id)children
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTLayout;
  result = -[TSDAbstractLayout children](&v4, sel_children);
  if (self->mContainedTextEditingLayout)
  {
    if (result)
      return (id)objc_msgSend(result, "arrayByAddingObject:");
    else
      return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  }
  return result;
}

- (void)updateChildrenFromInfo
{
  TSWPLayout *mContainedTextEditingLayout;
  objc_super v5;

  if (self->mContainedTextEditingLayout)
  {
LABEL_10:
    if (!TSTLayoutExtendedPartitionRangeIntersectsCellRange(self, -[TSTEditingState editingCellRange](-[TSTLayout editingState](self, "editingState"), "editingCellRange")))-[TSTLayout removeContainedTextEditingLayout](self, "removeContainedTextEditingLayout");
    goto LABEL_12;
  }
  if (!objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing")|| -[TSTEditingState editingMode](-[TSTLayout editingState](self, "editingState"), "editingMode") != 6|| -[TSTEditingState editingCellInProxy](-[TSTLayout editingState](self, "editingState"), "editingCellInProxy")|| !TSTLayoutExtendedPartitionRangeIntersectsCellRange(self, -[TSTEditingState editingCellRange](-[TSTLayout editingState](self, "editingState"), "editingCellRange"))|| !objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "isCanvasInteractive")|| !-[TSTMasterLayout containedTextEditor](-[TSTLayout masterLayout](self, "masterLayout"), "containedTextEditor"))
  {
    if (!self->mContainedTextEditingLayout)
      goto LABEL_14;
    goto LABEL_10;
  }
  -[TSTLayout setupContainedTextEditingLayout:](self, "setupContainedTextEditingLayout:", -[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID"));
LABEL_12:
  mContainedTextEditingLayout = self->mContainedTextEditingLayout;
  if (mContainedTextEditingLayout)
  {
    -[TSWPLayout performSelector:](mContainedTextEditingLayout, "performSelector:", a2);
    -[TSTLayout p_updateCachedStyleInformationFromCellID:](self, "p_updateCachedStyleInformationFromCellID:", -[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID"));
  }
LABEL_14:
  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  -[TSWPTextHostLayout updateChildrenFromInfo](&v5, sel_updateChildrenFromInfo);
}

- (TSWPLayout)containedTextEditingLayout
{
  return self->mContainedTextEditingLayout;
}

- (void)removeContainedTextEditingLayout
{
  CGSize v3;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mEditingSpillingTextRange;
  TSTChangeDescriptor *v7;

  self->mCachedPaddingForEditingCell = *(UIEdgeInsets *)TSDEdgeInsetsInvalid;
  self->mCachedVerticalAlignmentForEditingCell = 0;
  v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mComputedEditingCellContentFrame.size = v3;
  if ((TSTLayout *)-[TSDAbstractLayout parent](self->mContainedTextEditingLayout, "parent") == self)
    -[TSDLayout setParent:](self->mContainedTextEditingLayout, "setParent:", 0);
  objc_opt_class();
  -[TSDLayout info](self->mContainedTextEditingLayout, "info");
  objc_msgSend((id)TSUDynamicCast(), "removeObserver:", self);

  self->mContainedTextEditingLayout = 0;
  -[TSTMasterLayout removeDynamicLayoutEndIfNecessary:](-[TSTLayout masterLayout](self, "masterLayout"), "removeDynamicLayoutEndIfNecessary:", self);
  mEditingSpillingTextRange = self->mEditingSpillingTextRange;
  if (self->mEditingSpillingTextRange.origin.row != 0xFFFF
    && (*(_QWORD *)&mEditingSpillingTextRange & 0xFF0000) != 0xFF0000
    && HIWORD(*(unint64_t *)&mEditingSpillingTextRange) != 0
    && (*(_QWORD *)&mEditingSpillingTextRange & 0xFFFF00000000) != 0)
  {
    v7 = +[TSTChangeDescriptor changeDescriptorWithType:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:strokeRange:", 27);
    -[TSTMasterLayout addChangeDescriptor:](-[TSTLayout masterLayout](self, "masterLayout"), "addChangeDescriptor:", v7);
    +[TSKBroadcast asyncNotificationWithAccessController:changeNotifier:changeKind:details:changeSource:](TSKBroadcast, "asyncNotificationWithAccessController:changeNotifier:changeKind:details:changeSource:", objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "accessController"), objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "changeNotifier"), 1, v7, -[TSTLayout tableInfo](self, "tableInfo"));
  }
  self->mEditingSpillingTextRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->mSpillingTextSize = (CGSize)*MEMORY[0x24BDBF148];
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  +[TSTFindReplace searchLayout:forString:options:hitBlock:](TSTFindReplace, "searchLayout:forString:options:hitBlock:", self, a3, a4, a5);
}

- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4
{
  +[TSTFindReplace searchLayout:forSpellingErrorsWithHitBlock:stop:](TSTFindReplace, "searchLayout:forSpellingErrorsWithHitBlock:stop:", self, a3, a4);
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
  +[TSTFindReplace searchLayout:forAnnotationsWithHitBlock:](TSTFindReplace, "searchLayout:forAnnotationsWithHitBlock:", self, a3);
}

- (id)childSearchTargets
{
  return 0;
}

- (CGPoint)calculatePointFromSearchReference:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4;
  unsigned __int8 var1;
  unsigned int var0;
  uint64_t v7;
  BOOL v9;

  v4 = -[TSTLayoutHint cellRange](-[TSTLayout layoutHint](self, "layoutHint"), "cellRange");
  var1 = v4.var0.var1;
  var0 = v4.var0.var0;
  v7 = objc_msgSend((id)objc_msgSend(a3, "layoutHint"), "cellRange");
  v9 = var0 == (unsigned __int16)v7 && var1 < BYTE2(v7);
  return var0 < (unsigned __int16)v7 || v9;
}

- (CGRect)rectForSelection:(id)a3
{
  unint64_t v4;
  double AlignedStrokeFrameForRange;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSTLayoutSpace *v12;
  TSTLayoutSpace *v13;
  TSTLayoutSpace *v14;
  double FrozenHeadersTabOffset;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  objc_opt_class();
  v4 = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "cellRegion"), "boundingCellRange");
  AlignedStrokeFrameForRange = TSTLayoutGetAlignedStrokeFrameForRange(self, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[TSTLayoutSpaceBundle space](-[TSTLayout spaceBundle](self, "spaceBundle"), "space");
  v13 = -[TSTLayoutSpaceBundle frozenHeaderColumnsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderColumnsSpace");
  v14 = -[TSTLayoutSpaceBundle frozenHeaderRowsSpace](-[TSTLayout spaceBundle](self, "spaceBundle"), "frozenHeaderRowsSpace");
  FrozenHeadersTabOffset = TSTLayoutGetFrozenHeadersTabOffset(self);
  v17 = v16;
  v18 = FrozenHeadersTabOffset + 0.0;
  if (!TSTLayoutSpaceIntersectsCellRange((_BOOL8)v13, v4) && TSTLayoutGetFrozenHeaderColumnsEnabled(self))
    v18 = v18 + TSTLayoutSpaceGetHeaderColumnsWidth(v12);
  v19 = v17 + 0.0;
  if (!TSTLayoutSpaceIntersectsCellRange((_BOOL8)v14, v4) && TSTLayoutGetFrozenHeaderRowsEnabled(self))
  {
    v20 = v19 + TSTLayoutSpaceGetHeaderRowsHeight(v12);
    TSTLayoutGetTableNameHeight((uint64_t)self);
    v19 = v20 + v21;
  }
  v22 = AlignedStrokeFrameForRange - v18;
  v23 = v7 - v19;
  v24 = v9 + v18;
  v25 = v11 + v19;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  unint64_t v4;
  double AlignedStrokeFrameForRange;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_opt_class();
  v4 = objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "cellRegion"), "boundingCellRange");
  AlignedStrokeFrameForRange = TSTLayoutGetAlignedStrokeFrameForRange(self, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = AlignedStrokeFrameForRange;
  return result;
}

- (CGSize)adjustedInsets
{
  float64x2_t v2;
  double left;
  float64_t v9;
  double v10;
  double v11;
  CGSize result;

  v2 = *(float64x2_t *)&self->mCachedPaddingForEditingCell.top;
  __asm { FMOV            V1.2D, #-1.0 }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v2, _Q1), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->mCachedPaddingForEditingCell.bottom, _Q1))))) & 1) != 0&& self->mContainedTextEditingLayout)
  {
    left = self->mCachedPaddingForEditingCell.left;
  }
  else
  {
    -[TSTMasterLayout paddingForCellID:](-[TSTLayout masterLayout](self, "masterLayout"), "paddingForCellID:", 0);
    v2.f64[0] = v9;
    left = v10;
  }
  v11 = v2.f64[0];
  result.height = v11;
  result.width = left;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;

  -[TSTLayout adjustedInsets](self, "adjustedInsets", a3, a5, a6);
  v9 = 10.0;
  if (a4 <= 10.0)
    v9 = a4;
  if (v8 >= (a4 - v9) * 0.5)
    v10 = (a4 - v9) * 0.5;
  else
    v10 = v8;
  v11 = a4 + v10 * -2.0;
  if (v11 < v9)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4102, CFSTR("created an undersized column"));
  }
  if (a5)
    *a5 = v11;
  return v10;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (CGRect)computedEditingCellContentFrame
{
  CGPoint *v3;
  CGRect *p_mComputedEditingCellContentFrame;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unint64_t var0;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $CA3468F20078D5D2DB35E78E73CA60DA v13;
  _BOOL4 v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int var1;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  unsigned __int16 v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  double ArbitraryRectAcrossSpacesForGridRange;
  CGFloat v44;
  double v45;
  CGFloat v46;
  unint64_t RangeForHint;
  uint64_t mContainedTextEditorParagraphAlignment;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned __int8 v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  unsigned int v57;
  int VisibleColumn;
  unint64_t v59;
  unint64_t v60;
  unsigned int v61;
  double v62;
  unsigned int v63;
  double v64;
  double v65;
  double ContentFrameForRange;
  double v67;
  unint64_t v68;
  CGSize v69;
  double x;
  double y;
  double width;
  double height;
  void *v74;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v75;
  char v76;
  char v77;
  CGRect result;

  v3 = (CGPoint *)MEMORY[0x24BDBF090];
  p_mComputedEditingCellContentFrame = &self->mComputedEditingCellContentFrame;
  if (CGRectEqualToRect(*MEMORY[0x24BDBF090], self->mComputedEditingCellContentFrame))
  {
    v5 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTLayout tableInfo](self, "tableInfo"), "editingState"), "editingCellID");
    v77 = 0;
    v6 = v5;
    v7 = objc_msgSend((id)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v5, &v77), "intValueForProperty:", 896);
    self->mContainedTextEditorTextWraps = v7 != 0x80000000 && v7 != 0;
    v8 = objc_msgSend(-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](-[TSTEditingState editingStorage](-[TSTLayout editingState](self, "editingState"), "editingStorage"), "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86);
    self->mContainedTextEditorParagraphAlignment = v8;
    if (v8 == 4)
      self->mContainedTextEditorParagraphAlignment = -[TSTLayout p_naturalAlignmentForCellID:](self, "p_naturalAlignmentForCellID:", *(unsigned int *)&v5);
    v75 = v5;
    var0 = v5.var0;
    v76 = 1;
    v10 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v5);
    v11 = v10;
    if ((_WORD)v10 == 0xFFFF
      || (v10 & 0xFF0000) == 0xFF0000
      || (v12 = HIWORD(v10)) == 0
      || (v10 & 0xFFFF00000000) == 0)
    {
      if (BYTE2(v6) == 255)
        v23 = 0xFFFFFFFFLL;
      else
        v23 = BYTE2(v6);
      if ((_DWORD)var0 == 0xFFFF)
        v24 = 0xFFFFFFFFLL;
      else
        v24 = var0;
      v25 = v23 | (v24 << 32);
      v26 = TSTTableHeightOfRow((uint64_t)-[TSTLayout tableModel](self, "tableModel"), (unsigned __int16)v6, &v76);
      v27 = v25;
    }
    else
    {
      v13 = -[TSTLayoutHint cellRange](-[TSTLayout layoutHint](self, "layoutHint"), "cellRange");
      v14 = (~*(_DWORD *)&v13.var0 & 0xFF0000) != 0 && v13.var0.var0 != 0xFFFF;
      if (v14)
      {
        v15 = 0;
        v16 = 16711680;
        v17 = 0xFFFFLL;
        v18 = 0;
        if (HIWORD(*(unint64_t *)&v13) && (*(_QWORD *)&v13 & 0xFFFF00000000) != 0)
        {
          v17 = 0;
          var1 = v13.var0.var1;
          if (BYTE2(v11) > v13.var0.var1)
            var1 = BYTE2(v11);
          if ((unsigned __int16)v11 <= v13.var0.var0)
            v20 = v13.var0.var0;
          else
            v20 = (unsigned __int16)v11;
          if ((BYTE4(v11) + BYTE2(v11) - 1) >= (LOBYTE(v13.var1.var0)
                                                                                               + v13.var0.var1
                                                                                               - 1))
            v21 = (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1);
          else
            v21 = (BYTE4(v11) + BYTE2(v11) - 1);
          if ((unsigned __int16)(v11 + v12 - 1) >= (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1))
            v22 = (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1);
          else
            v22 = (unsigned __int16)(v11 + v12 - 1);
          v16 = 0;
          v15 = 0;
          v18 = 0;
          if (v20 <= v22 && var1 <= v21)
          {
            v18 = ((unint64_t)(v22 - v20) << 48) + 0x1000000000000;
            v15 = (unint64_t)(unsigned __int16)(v21 - var1 + 1) << 32;
            v16 = var1 << 16;
            v17 = v20;
          }
        }
      }
      else
      {
        v15 = 0;
        v18 = 0;
        v16 = 16711680;
        v17 = 0xFFFFLL;
      }
      v28 = v16 | v18 | v17 | v15;
      if ((_WORD)v28 != 0xFFFF && (v28 & 0xFF0000) != 0xFF0000 && HIWORD(v28) && (v28 & 0xFFFF00000000) != 0)
      {
        v29 = 0;
        if (v14)
        {
          v30 = 16711680;
          v31 = 0xFFFFLL;
          v32 = 0;
          if (HIWORD(*(unint64_t *)&v13) && (*(_QWORD *)&v13 & 0xFFFF00000000) != 0)
          {
            v31 = 0;
            v33 = v13.var0.var1;
            if (BYTE2(v11) > v13.var0.var1)
              v33 = BYTE2(v11);
            if ((unsigned __int16)v11 <= v13.var0.var0)
              v34 = v13.var0.var0;
            else
              v34 = (unsigned __int16)v11;
            if ((BYTE4(v11) + BYTE2(v11) - 1) >= (LOBYTE(v13.var1.var0)
                                                                                                 + v13.var0.var1
                                                                                                 - 1))
              v35 = (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1);
            else
              v35 = (BYTE4(v11) + BYTE2(v11) - 1);
            v36 = v13.var0.var0 + v13.var1.var1 - 1;
            v37 = v36;
            if ((unsigned __int16)(v11 + v12 - 1) < v36)
              v37 = (unsigned __int16)(v11 + v12 - 1);
            v30 = 0;
            v29 = 0;
            v32 = 0;
            if (v34 <= v37 && v33 <= v35)
            {
              v32 = ((unint64_t)(v37 - v34) << 48) + 0x1000000000000;
              v29 = (unint64_t)(unsigned __int16)(v35 - v33 + 1) << 32;
              v30 = v33 << 16;
              v31 = v34;
            }
          }
        }
        else
        {
          v32 = 0;
          v30 = 16711680;
          v31 = 0xFFFFLL;
        }
        v11 = v30 | v32 | v31 | v29;
      }
      if (BYTE2(v11) == 255)
        v38 = -1;
      else
        v38 = BYTE2(v11);
      v39 = WORD2(v11) + v38 - 1;
      if (!WORD2(v11))
        v39 = 0xFFFFFFFFLL;
      if ((unsigned __int16)v11 == 0xFFFF)
        v40 = 0xFFFFFFFFLL;
      else
        v40 = (unsigned __int16)v11;
      v25 = v38 | ((unint64_t)v40 << 32);
      v41 = ((v11 >> 16) & 0xFFFF00000000) + (v40 << 32) - 0x100000000;
      if (((v11 >> 16) & 0xFFFF00000000) == 0)
        v41 = 0xFFFFFFFF00000000;
      v27 = v39 | v41;
      v26 = TSTTableHeightOfRow((uint64_t)-[TSTLayout tableModel](self, "tableModel"), (unsigned __int16)(v11 + HIWORD(v11) - 1), &v76);
    }
    v42 = -[TSTMasterLayout tableRowsBehavior](-[TSTLayout masterLayout](self, "masterLayout", v26), "tableRowsBehavior");
    self->mContainedTextEditorSpills = 0;
    if (self->mContainedTextEditorTextWraps)
    {
      if (v42 == 3)
        self->mContainedTextEditorSpills = v76 ^ 1;
      ArbitraryRectAcrossSpacesForGridRange = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v25, v27, (uint64_t)&__block_literal_global_65_0);
    }
    else
    {
      self->mContainedTextEditorSpills = 1;
      RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)-[TSTLayout masterLayout](self, "masterLayout"), -[TSTLayout layoutHint](self, "layoutHint"));
      if ((_WORD)v11 == 0xFFFF || (v11 & 0xFF0000) == 0xFF0000 || !HIWORD(v11) || (v11 & 0xFFFF00000000) == 0)
        v11 = v6 | 0x1000100000000;
      mContainedTextEditorParagraphAlignment = self->mContainedTextEditorParagraphAlignment;
      if (-[TSTLayout layoutDirectionIsLeftToRight](self, "layoutDirectionIsLeftToRight"))
      {
        switch((int)mContainedTextEditorParagraphAlignment)
        {
          case 0:
          case 3:
            goto LABEL_84;
          case 1:
            goto LABEL_113;
          case 2:
            goto LABEL_86;
          default:
            goto LABEL_85;
        }
      }
      switch((int)mContainedTextEditorParagraphAlignment)
      {
        case 0:
LABEL_113:
          v50 = v11;
          v49 = var0;
          goto LABEL_114;
        case 1:
        case 3:
LABEL_84:
          v49 = ((_DWORD)RangeForHint + ((RangeForHint >> 16) & 0xFF0000) + 16711680) & 0xFF0000 | var0;
          v50 = v11;
LABEL_114:
          v68 = TSTCellRangeUnionCellID(v50, v49);
          ArbitraryRectAcrossSpacesForGridRange = TSTLayoutGetContentFrameForRange(self, v68);
          break;
        case 2:
          goto LABEL_86;
        default:
LABEL_85:
          v74 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v51 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout computedEditingCellContentFrame]");
          objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4237, CFSTR("Unexpected cell alignment: %d"), mContainedTextEditorParagraphAlignment);
LABEL_86:
          v52 = *(_DWORD *)&v75 & 0xFF000000;
          LOBYTE(v6) = BYTE2(v6);
          v53 = BYTE2(v6);
          if (BYTE2(RangeForHint) != BYTE2(v6))
          {
            v54 = TSTMasterLayoutPreviousVisibleColumn(-[TSTLayout masterLayout](self, "masterLayout"), (BYTE2(v6) - 1));
            if (v54 == 255)
              v53 = BYTE2(v6);
            else
              v53 = v54;
          }
          v55 = TSTCellRangeUnionCellID(var0 | 0x1000100000000, v52 | (v53 << 16) | var0);
          v56 = v55;
          v57 = HIDWORD(RangeForHint) + WORD1(RangeForHint) + 255;
          if (v57 != BYTE2(v6))
          {
            v56 = v55;
            VisibleColumn = TSTMasterLayoutNextVisibleColumn(-[TSTLayout masterLayout](self, "masterLayout"), (BYTE2(v6) + 1));
            if (VisibleColumn != 255)
              LOBYTE(v6) = VisibleColumn;
          }
          v59 = TSTCellRangeUnionCellID(v52 | (v6 << 16) | var0 | 0x1000100000000, var0 & 0xFF00FFFF | (v57 << 16));
          v60 = v59;
          if ((v11 & 0xFFFF00000000) == 0
            || (!HIWORD(v56)
             || (v56 & 0xFFFF00000000) == 0
             || (unsigned __int16)v11 > (unsigned __int16)v56
             || (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)v56
             || BYTE2(v56) < BYTE2(v11)
             || (v61 = (BYTE4(v11) + BYTE2(v11) - 1), v61 < BYTE2(v56))
             || v61 < (BYTE4(v56) + BYTE2(v56) - 1)
             || (v62 = 0.0,
                 (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)(v56 + HIWORD(v56) - 1)))
            && (!HIWORD(v59)
             || (v59 & 0xFFFF00000000) == 0
             || (unsigned __int16)v11 > (unsigned __int16)v59
             || (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)v59
             || BYTE2(v59) < BYTE2(v11)
             || (v63 = (BYTE4(v11) + BYTE2(v11) - 1), v63 < BYTE2(v59))
             || v63 < (BYTE4(v59) + BYTE2(v59) - 1)
             || (v62 = 0.0,
                 (unsigned __int16)(v11 + HIWORD(v11) - 1) < (unsigned __int16)(v59 + HIWORD(v59) - 1))))
          {
            TSTLayoutGetContentFrameForRange(self, v56);
            v62 = v64;
            TSTLayoutGetContentFrameForRange(self, v60);
            if (v62 >= v65)
              v62 = v65;
          }
          ContentFrameForRange = TSTLayoutGetContentFrameForRange(self, v11);
          v45 = v67 + v62 * 2.0;
          ArbitraryRectAcrossSpacesForGridRange = ContentFrameForRange - v62;
          break;
      }
    }
    p_mComputedEditingCellContentFrame->origin.x = ArbitraryRectAcrossSpacesForGridRange;
    p_mComputedEditingCellContentFrame->origin.y = v44;
    p_mComputedEditingCellContentFrame->size.width = v45;
    p_mComputedEditingCellContentFrame->size.height = v46;
    if (CGRectIsNull(*(CGRect *)&ArbitraryRectAcrossSpacesForGridRange))
    {
      v69 = (CGSize)v3[1];
      p_mComputedEditingCellContentFrame->origin = *v3;
      p_mComputedEditingCellContentFrame->size = v69;
    }
  }
  x = p_mComputedEditingCellContentFrame->origin.x;
  y = p_mComputedEditingCellContentFrame->origin.y;
  width = p_mComputedEditingCellContentFrame->size.width;
  height = p_mComputedEditingCellContentFrame->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unsigned)p_naturalAlignmentForCellID:(id)a3
{
  __int16 v5;
  unsigned int v6;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v7;
  void *v8;
  uint64_t v9;
  int v10;
  TSTCell *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  BOOL v15;

  v5 = ~a3.var0;
  v6 = -[TSTLayout p_defaultAlignmentForTableWritingDirection](self, "p_defaultAlignmentForTableWritingDirection");
  v7 = a3;
  if (!v5 || (*(_QWORD *)&a3.var0 & 0xFF0000) == 0xFF0000)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout p_naturalAlignmentForCellID:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4301, CFSTR("Contained text editing layout but invalid editing cell ID?"));
  }
  if ((*(_DWORD *)&a3 & 0xFFFFFF) == (-[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID") & 0xFFFFFF))v10 = -[TSWPStorage writingDirectionForParagraphAtCharIndex:](-[TSTEditingState editingStorage](-[TSTLayout editingState](self, "editingState"), "editingStorage"), "writingDirectionForParagraphAtCharIndex:", 0);
  else
    v10 = -[TSSStyle intValueForProperty:](TSTTableGetTextStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0), "intValueForProperty:", 44);
  if (v10 != -1)
    v6 = v10 == 1;
  v11 = objc_alloc_init(TSTCell);
  if (!TSTCellAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v7, v11) && v11)
  {
    v12 = *((unsigned __int8 *)&v11->mPrivate + 1);
    v13 = v12 > 7;
    v14 = (1 << v12) & 0xA4;
    v15 = v13 || v14 == 0;
    if (!v15
      && -[TSSStyle intValueForProperty:](TSTTableGetTextStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v7, 0), "intValueForProperty:", 86) == 4)
    {
      return 1;
    }
  }
  return v6;
}

- (unsigned)naturalAlignmentForTextLayout:(id)a3
{
  if (self->mContainedTextEditingLayout == a3
    && -[TSWPStorage canBeStoredInAStringValueCell](-[TSTEditingState editingStorage](-[TSTLayout editingState](self, "editingState"), "editingStorage"), "canBeStoredInAStringValueCell"))
  {
    return -[TSTLayout p_naturalAlignmentForCellID:](self, "p_naturalAlignmentForCellID:", -[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID"));
  }
  else
  {
    return 4;
  }
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  if (self->mContainedTextEditorTextWraps)
    return 1;
  else
    return 37;
}

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  double v3;

  -[TSTLayout computedEditingCellContentFrame](self, "computedEditingCellContentFrame", a3);
  return v3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  if (self->mContainedTextEditingLayout == a3)
    return self->mCachedVerticalAlignmentForEditingCell;
  else
    return 0;
}

- (void)invalidateForAutosizingTextLayout:(id)a3
{
  CGSize v4;

  TSTLayoutInvalidateCell(self, -[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTLayout tableInfo](self, "tableInfo", a3), "editingState"), "editingCellID"));
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mComputedEditingCellContentFrame.size = v4;
}

- (CGSize)p_rangeUpAndLeftOfIntersectionRangeOfGridRange:(id)a3
{
  $85CD2974BE96D4886BB301820D1C36C2 var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0;
  BOOL v6;
  TSTLayoutSpaceBundle *v7;
  uint64_t v8;
  TSTMasterLayout *v9;
  unint64_t v10;
  unsigned int v11;
  BOOL v13;
  unint64_t v14;
  BOOL v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[7];
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __n128 (*v30)(__n128 *, __n128 *);
  uint64_t (*v31)();
  void *v32;
  uint64_t v33;
  uint64_t v34;
  CGSize result;

  var1 = a3.var1;
  var0 = a3.var0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x4012000000;
  v30 = __Block_byref_object_copy__93;
  v31 = __Block_byref_object_dispose__94;
  v32 = &unk_217C8B239;
  v33 = -1;
  v34 = -1;
  v6 = -[TSTMasterLayout isDynamicallyRepressingFrozenHeaders](-[TSTLayout masterLayout](self, "masterLayout"), "isDynamicallyRepressingFrozenHeaders");
  v7 = -[TSTLayout spaceBundle](self, "spaceBundle");
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __60__TSTLayout_p_rangeUpAndLeftOfIntersectionRangeOfGridRange___block_invoke;
  v25[3] = &unk_24D82F878;
  v26 = v6;
  v25[5] = var0;
  v25[6] = var1;
  v25[4] = &v27;
  -[TSTLayoutSpaceBundle performActionOnEachLayoutSpace:](v7, "performActionOnEachLayoutSpace:", v25);
  v8 = v28[6];
  v9 = -[TSTLayout masterLayout](self, "masterLayout");
  v10 = (((((v8 - (*(_QWORD *)&var0 & 0xFFFFFFFF00000000)) & 0xFFFFFFFF00000000) + *(_QWORD *)&var0) & 0xFFFFFFFF00000000)
       - 0x100000000) >> 32;
  if (((v8 - (*(_QWORD *)&var0 & 0xFFFFFFFF00000000)) & 0xFFFFFFFF00000000) == 0)
    LODWORD(v10) = -1;
  v11 = v8 - 1;
  if ((_DWORD)v8 == var0.var0)
    v11 = -1;
  v13 = v10 < var0.var1 || (_DWORD)v10 == -1 || var0.var1 == -1;
  v14 = (((unint64_t)(v10 - var0.var1) << 32) + 0x100000000) >> 16;
  if (v13)
    LODWORD(v14) = 0;
  v16 = v11 < var0.var0 || v11 == -1 || var0.var0 == -1;
  v17 = (v11 - LOBYTE(var0.var0) + 1);
  if (v16)
    v17 = 0;
  v18 = v14 | v17;
  v19 = (unint64_t)LOBYTE(var0.var0) << 16;
  if (var0.var0 == -1)
    v19 = 16711680;
  v20 = TSTMasterLayoutContentSizeForCellRange(v9, v19 & 0xFFFFFFFFFFFF0000 | LOWORD(var0.var1) | (v18 << 32), 1);
  v22 = v21;
  _Block_object_dispose(&v27, 8);
  v23 = v20;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

uint64_t __60__TSTLayout_p_rangeUpAndLeftOfIntersectionRangeOfGridRange___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(a2, "isFrozen") && *(_BYTE *)(a1 + 56))
    return 0;
  result = (uint64_t)TSTLayoutSpaceIntersectsGridRange(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    v5 = TSTLayoutSpaceIntersectionGridRange(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v6 + 48) = v5;
    *(_QWORD *)(v6 + 56) = v7;
    return 1;
  }
  return result;
}

- (BOOL)p_layoutWhollyContainsGridRange:(id)a3
{
  $85CD2974BE96D4886BB301820D1C36C2 var1;
  $85CD2974BE96D4886BB301820D1C36C2 var0;
  BOOL v6;
  TSTLayoutSpaceBundle *v7;
  _QWORD v9[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = -[TSTMasterLayout isDynamicallyRepressingFrozenHeaders](-[TSTLayout masterLayout](self, "masterLayout"), "isDynamicallyRepressingFrozenHeaders");
  v7 = -[TSTLayout spaceBundle](self, "spaceBundle");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TSTLayout_p_layoutWhollyContainsGridRange___block_invoke;
  v9[3] = &unk_24D82F878;
  v10 = v6;
  v9[5] = var0;
  v9[6] = var1;
  v9[4] = &v11;
  -[TSTLayoutSpaceBundle performActionOnEachLayoutSpace:](v7, "performActionOnEachLayoutSpace:", v9);
  LOBYTE(var0.var0) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return var0.var0;
}

uint64_t __45__TSTLayout_p_layoutWhollyContainsGridRange___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v15;
  uint64_t v16;

  if (objc_msgSend(a2, "isFrozen") && *(_BYTE *)(a1 + 56)
    || !TSTLayoutSpaceIntersectsGridRange(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    return 0;
  }
  v4 = TSTLayoutSpaceIntersectionGridRange(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = *(_DWORD *)(a1 + 40);
  v7 = *(_DWORD *)(a1 + 44);
  v10 = *(_DWORD *)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 52);
  v15 = (_DWORD)v4 == -1 || v5 == -1 || v4 > v5 || HIDWORD(v4) == -1 || v6 == -1 || HIDWORD(v4) > v6;
  if (v15 && (v8 == -1 || v10 == -1 || v8 > v10 || v7 == -1 || v9 == -1 || v7 > v9)
    || (v16 = 0, v4 == __PAIR64__(v7, v8)) && v5 == v10 && v6 == v9)
  {
    v16 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return v16;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double height;
  double width;
  double ArbitraryRectAcrossSpacesForGridRange;
  double v9;
  double v10;
  double v11;
  int v12;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v13;
  unint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  $5CFCD363C99B2F51819B67AD7AD2E060 v24;
  unint64_t v25;
  unsigned int column;
  uint64_t v27;
  uint64_t row;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
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
  unint64_t v42;
  double v43;
  CGRect result;

  height = a4.height;
  width = a4.width;
  ArbitraryRectAcrossSpacesForGridRange = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = objc_msgSend((id)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTLayout tableModel](self, "tableModel"), -[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID"), 0), "intValueForProperty:", 896);
  v13 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID");
  v14 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v13);
  v15 = self->mContainedTextEditingLayout != a3 || (unsigned __int16)~v13.var0 == 0;
  if (!v15 && (*(_QWORD *)&v13.var0 & 0xFF0000) != 0xFF0000)
  {
    if ((v12 & 0x7FFFFFFF) != 0 && !self->mContainedTextEditorSpills)
    {
      v24 = ($5CFCD363C99B2F51819B67AD7AD2E060)v14;
      if ((_WORD)v14 == 0xFFFF || (v14 & 0xFF0000) == 0xFF0000 || !HIWORD(v14) || (v14 & 0xFFFF00000000) == 0)
      {
        v24 = ($5CFCD363C99B2F51819B67AD7AD2E060)v13;
        LODWORD(v25) = 65537;
      }
      else
      {
        v25 = HIDWORD(v14);
      }
      if (v24.column == 255)
        column = -1;
      else
        column = v24.column;
      if ((_WORD)v25)
        v27 = (unsigned __int16)v25 + column - 1;
      else
        v27 = 0xFFFFFFFFLL;
      if (v24.row == 0xFFFF)
        row = 0xFFFFFFFFLL;
      else
        row = v24.row;
      v29 = column | ((unint64_t)row << 32);
      v30 = (((unint64_t)v25 << 16) & 0xFFFF00000000) + (row << 32) - 0x100000000;
      if ((((unint64_t)v25 << 16) & 0xFFFF00000000) == 0)
        v30 = 0xFFFFFFFF00000000;
      v31 = v27 | v30;
      -[TSTLayout validate](self, "validate");
      -[TSTLayout computedEditingCellContentFrame](self, "computedEditingCellContentFrame");
      v33 = v32;
      v35 = v34;
      if (-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v29, v31))
      {
        ArbitraryRectAcrossSpacesForGridRange = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v29, v31, (uint64_t)&__block_literal_global_65_0);
        v9 = v36;
        v10 = v37;
        v11 = v38;
      }
      else
      {
        -[TSTLayout p_rangeUpAndLeftOfIntersectionRangeOfGridRange:](self, "p_rangeUpAndLeftOfIntersectionRangeOfGridRange:", v29, v31);
        ArbitraryRectAcrossSpacesForGridRange = v33 - v39;
        v9 = v35 - v40;
        v10 = TSTMasterLayoutContentSizeForCellRange(-[TSTLayout masterLayout](self, "masterLayout"), *(unsigned int *)&v24 | ((unint64_t)v25 << 32), 1);
        v11 = v41;
      }
      self->mEditingSpillingTextRange.origin = v24;
      self->mEditingSpillingTextRange.size = ($AD264490EA47AD084B10A83F4B3C584F)v25;
      if (-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v29, v29))
      {
        if (-[TSTLayout layoutDirectionIsLeftToRight](self, "layoutDirectionIsLeftToRight"))
          v42 = v29;
        else
          v42 = v27 | (row << 32);
        ArbitraryRectAcrossSpacesForGridRange = TSTLayoutGetArbitraryRectAcrossSpacesForGridRange(self, v42, v42, (uint64_t)&__block_literal_global_69);
        v9 = v43;
      }
    }
    else
    {
      -[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:](self, "p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:", a3, 0, width, height);
      ArbitraryRectAcrossSpacesForGridRange = v20;
      v9 = v21;
      v10 = v22;
      v11 = v23;
    }
  }
  v16 = ArbitraryRectAcrossSpacesForGridRange;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)p_computeSpillingTextFrameForLayout:(id)a3 textSize:(CGSize)a4 editingSpillRange:(id *)a5
{
  uint64_t v5;
  double height;
  double width;
  double v9;
  double v10;
  _BOOL4 v11;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12;
  unsigned int mContainedTextEditorParagraphAlignment;
  unint64_t v14;
  unint64_t v15;
  double ContentFrameForRange;
  double v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int var0;
  unsigned int v29;
  unsigned int v30;
  int var1;
  unsigned int v32;
  int v33;
  unint64_t v34;
  unsigned int v35;
  int v36;
  unint64_t v37;
  char v38;
  int v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  double v46;
  uint64_t v47;
  unsigned __int16 v48;
  unint64_t mEditingSpillingTextRange;
  BOOL v50;
  BOOL v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  _BOOL4 v61;
  uint64_t v62;
  _BOOL4 v63;
  BOOL v64;
  unsigned int v65;
  char v66;
  uint64_t v67;
  _BOOL4 v68;
  unsigned int v69;
  unsigned int v70;
  unsigned __int16 v71;
  unsigned int v72;
  int v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  _BOOL4 v80;
  unsigned __int16 v81;
  int v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  $CA3468F20078D5D2DB35E78E73CA60DA *v87;
  unint64_t v88;
  unint64_t v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  __int16 v93;
  __int16 v94;
  unsigned int v95;
  unint64_t v96;
  unint64_t v97;
  unsigned __int16 v98;
  char v99;
  __int16 v100;
  unsigned __int16 v101;
  unint64_t v102;
  double v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  double AlignedContentFrameForRange;
  double v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  double MaxX;
  double v118;
  double v119;
  double v120;
  double v121;
  int v122;
  unint64_t v123;
  char v124;
  unsigned int v126;
  double v127;
  void *v128;
  unsigned int v129;
  uint64_t v130;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v131;
  unsigned int v132;
  _BOOL4 v133;
  uint64_t RangeForHint;
  CGAffineTransform v135;
  CGPoint v136;
  CGPoint v137;
  CGPoint v138;
  CGPoint v139;
  CGPoint v140;
  CGPoint v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect result;

  height = a4.height;
  width = a4.width;
  -[TSTLayout computedEditingCellContentFrame](self, "computedEditingCellContentFrame", a3);
  if (width >= v9)
  {
    -[TSTLayout computedEditingCellContentFrame](self, "computedEditingCellContentFrame");
    width = v10;
  }
  self->mSpillingTextSize.width = width;
  self->mSpillingTextSize.height = height;
  v11 = -[TSTLayout layoutDirectionIsLeftToRight](self, "layoutDirectionIsLeftToRight");
  RangeForHint = TSTMasterLayoutGetRangeForHint((uint64_t)-[TSTLayout masterLayout](self, "masterLayout"), -[TSTLayout layoutHint](self, "layoutHint"));
  v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTEditingState editingCellID](-[TSTLayout editingState](self, "editingState"), "editingCellID");
  mContainedTextEditorParagraphAlignment = self->mContainedTextEditorParagraphAlignment;
  if (mContainedTextEditorParagraphAlignment - 3 <= 1)
    mContainedTextEditorParagraphAlignment = -[TSTLayout p_naturalAlignmentForCellID:](self, "p_naturalAlignmentForCellID:", *(unsigned int *)&v12);
  v14 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), *(_DWORD *)&v12);
  v15 = v14;
  if ((_WORD)v14 == 0xFFFF || (v14 & 0xFF0000) == 0xFF0000 || !HIWORD(v14) || (v14 & 0xFFFF00000000) == 0)
    v15 = *(unsigned int *)&v12 | 0x1000100000000;
  ContentFrameForRange = TSTLayoutGetContentFrameForRange(self, v15);
  v20 = ContentFrameForRange;
  v21 = v17;
  v132 = mContainedTextEditorParagraphAlignment;
  v133 = v11;
  v130 = v12;
  v127 = width;
  if (self->mContainedTextEditorTextWraps)
  {
    v22 = height + v17;
    v23 = ContentFrameForRange;
    goto LABEL_20;
  }
  if (mContainedTextEditorParagraphAlignment == 2)
  {
    v23 = ContentFrameForRange + (width + v18) * 0.5;
    v20 = ContentFrameForRange + (v18 - width) * 0.5;
LABEL_18:
    v22 = height + v21;
    goto LABEL_20;
  }
  if (mContainedTextEditorParagraphAlignment == 1)
  {
    v23 = ContentFrameForRange;
    v20 = CGRectGetMaxX(*(CGRect *)&ContentFrameForRange) - width;
    goto LABEL_18;
  }
  if (mContainedTextEditorParagraphAlignment)
  {
    v5 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = v15;
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]");
    v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm");
    v27 = v25;
    v15 = v24;
    objc_msgSend((id)v5, "handleFailureInFunction:file:lineNumber:description:", v27, v26, 4601, CFSTR("Unexpected alignment (natural or justified) when calculating spill frame."));
    v23 = *MEMORY[0x24BDBEFB0];
    v22 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v20 = *MEMORY[0x24BDBEFB0];
    v21 = v22;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v135, width, height);
    v23 = v135.tx + v21 * v135.c + v135.a * v20;
    v22 = v135.ty + v21 * v135.d + v135.b * v20;
  }
LABEL_20:
  var0 = v12.var0;
  v29 = *(_DWORD *)&v12 & 0xFF000000;
  v30 = HIWORD(*(unsigned int *)&v12);
  v131 = v12;
  v122 = !v11;
  if (!self->mContainedTextEditorTextWraps && v11)
  {
    var1 = v12.var1;
    v32 = HIWORD(*(unsigned int *)&v12);
    if (v12.var1 > BYTE2(RangeForHint))
    {
      v33 = v12.var1 << 16;
      LOBYTE(v32) = v12.var1;
      while (1)
      {
        v5 = v5 & 0xFFFFFFFF00000000 | v33 | v29 | v12.var0;
        v34 = TSTCellRangeUnionCellID(v15, v5);
        v142.origin.x = TSTLayoutGetContentFrameForRange(self, v34);
        v136.x = v20;
        v136.y = v21;
        if (CGRectContainsPoint(v142, v136))
          break;
        LOBYTE(v32) = v32 - 1;
        v33 -= 0x10000;
        if (v32 <= BYTE2(RangeForHint))
        {
          LOBYTE(v32) = BYTE2(RangeForHint);
          break;
        }
      }
    }
    v35 = HIDWORD(RangeForHint) + WORD1(RangeForHint) + 255;
    if (v12.var1 < (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1))
    {
      v36 = v12.var1 << 16;
      while (1)
      {
        v5 = v5 & 0xFFFFFFFF00000000 | v36 | v29 | var0;
        v37 = TSTCellRangeUnionCellID(v15, v5);
        v143.origin.x = TSTLayoutGetContentFrameForRange(self, v37);
        if (CGRectGetMaxX(v143) >= v23)
          break;
        ++var1;
        v36 += 0x10000;
        if (var1 == (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1))
          goto LABEL_48;
      }
      LOBYTE(v35) = var1;
LABEL_48:
      v12 = v131;
      goto LABEL_49;
    }
    goto LABEL_46;
  }
  v38 = self->mContainedTextEditorTextWraps || v11;
  v35 = HIWORD(*(unsigned int *)&v12);
  v32 = HIWORD(*(unsigned int *)&v12);
  if ((v38 & 1) == 0)
  {
    v32 = HIWORD(*(unsigned int *)&v12);
    if ((BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1) > v12.var1)
    {
      LOBYTE(v32) = v12.var1;
      v39 = v12.var1 << 16;
      while (1)
      {
        v5 = v5 & 0xFFFFFFFF00000000 | v39 | v29 | v12.var0;
        v40 = TSTCellRangeUnionCellID(v15, v5);
        v144.origin.x = TSTLayoutGetContentFrameForRange(self, v40);
        v137.x = v20;
        v137.y = v21;
        if (CGRectContainsPoint(v144, v137))
          break;
        LOBYTE(v32) = v32 + 1;
        v39 += 0x10000;
        if ((BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1) == v32)
        {
          LOBYTE(v32) = BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1;
          break;
        }
      }
    }
    LOBYTE(v35) = v12.var1;
    if (v12.var1 > BYTE2(RangeForHint))
    {
      v41 = v12.var1 << 16;
      while (1)
      {
        v5 = v5 & 0xFFFFFFFF00000000 | v41 | v29 | var0;
        v42 = TSTCellRangeUnionCellID(v15, v5);
        v145.origin.x = TSTLayoutGetContentFrameForRange(self, v42);
        if (CGRectGetMaxX(v145) >= v23)
          goto LABEL_48;
        LOBYTE(v35) = v35 - 1;
        v41 -= 0x10000;
        if (v35 <= BYTE2(RangeForHint))
        {
          LOBYTE(v35) = BYTE2(RangeForHint);
          goto LABEL_48;
        }
      }
    }
LABEL_46:
    LOBYTE(v35) = v12.var1;
  }
LABEL_49:
  v123 = v15;
  v124 = v30;
  v43 = v29 | (v32 << 16) | var0;
  if ((unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) <= v12.var0)
  {
    LOWORD(v44) = v12.var0;
  }
  else
  {
    v44 = var0;
    while (1)
    {
      v45 = TSTCellRangeUnionCellID(v43 | 0x1000100000000, (v35 << 16) | v44 | v29);
      v146.origin.x = TSTLayoutGetContentFrameForRange(self, v45);
      v146.size.height = ceil(v46);
      if (CGRectGetMaxY(v146) >= v22)
        break;
      if ((unsigned __int16)(RangeForHint + HIWORD(RangeForHint) - 1) == (unsigned __int16)++v44)
      {
        LOWORD(v44) = RangeForHint + HIWORD(RangeForHint) - 1;
        break;
      }
    }
    v12 = v131;
  }
  if (((unsigned __int16)v29 | (unsigned __int16)var0) == -1 || (v43 & 0xFF0000) == 0xFF0000)
  {
    v128 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v47 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]");
    objc_msgSend(v128, "handleFailureInFunction:file:lineNumber:description:", v47, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm"), 4660, CFSTR("Unable to determine upper left cell ID for spilling text."));
  }
  v48 = v12.var0;
  v129 = HIBYTE(*(unsigned int *)&v12);
  mEditingSpillingTextRange = (unint64_t)self->mEditingSpillingTextRange;
  if (self->mEditingSpillingTextRange.origin.row == 0xFFFF
    || ((mEditingSpillingTextRange & 0xFF0000) != 0xFF0000 ? (v50 = HIWORD(mEditingSpillingTextRange) == 0) : (v50 = 1),
        !v50 ? (v51 = (mEditingSpillingTextRange & 0xFFFF00000000) == 0) : (v51 = 1),
        v51))
  {
    mEditingSpillingTextRange = v130 | 0x1000100000000;
    v52 = v133;
  }
  else
  {
    v52 = v133;
  }
  v53 = TSTLayoutGetContentFrameForRange(self, mEditingSpillingTextRange);
  v57 = v53;
  v58 = v54;
  v59 = v55;
  v60 = v56;
  if (v132)
    v61 = v52;
  else
    v61 = 0;
  if (v61 && v32 > BYTE2(RangeForHint) && v127 > CGRectGetWidth(*(CGRect *)&v53))
  {
    v62 = var0 & 0xFF00FFFF | ((v32 - 1) << 16);
    v147.origin.x = TSTLayoutGetStrokeFrameForRange(self, v62 | 0x1000100000000);
    v138.x = v20;
    v138.y = v21;
    v63 = CGRectContainsPoint(v147, v138);
    v64 = !v63;
    if (v63)
      v12.var0 = v62;
    v131.var0 = v12.var0;
    if (v63)
      LOBYTE(v32) = v32 - 1;
    v65 = v129;
  }
  else
  {
    v66 = v133;
    if (v132 == 1)
      v66 = 1;
    v65 = HIBYTE(*(unsigned int *)&v12);
    if ((v66 & 1) != 0
      || v32 >= (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)
      || (v148.origin.x = v57,
          v148.origin.y = v58,
          v148.size.width = v59,
          v148.size.height = v60,
          v127 <= CGRectGetWidth(v148)))
    {
      v126 = HIBYTE(*(unsigned int *)&v12);
      goto LABEL_94;
    }
    v67 = var0 & 0xFF00FFFF | ((v32 + 1) << 16);
    v149.origin.x = TSTLayoutGetStrokeFrameForRange(self, v67 | 0x1000100000000);
    v139.x = v20;
    v139.y = v21;
    v68 = CGRectContainsPoint(v149, v139);
    v64 = !v68;
    if (v68)
      v48 = v67;
    v131.var0 = v48;
    if (v68)
      LOBYTE(v32) = v32 + 1;
  }
  if (v64)
    v69 = v65;
  else
    v69 = 0;
  v126 = v69;
LABEL_94:
  if (v35 >= (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1))
    v70 = (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1);
  else
    v70 = v35;
  if ((_WORD)v44 == 0xFFFF)
    v71 = RangeForHint + HIWORD(RangeForHint) - 1;
  else
    v71 = v44;
  v72 = v71;
  v73 = v71 | (v70 << 16) | v29;
  v74 = v133;
  if (((unsigned __int16)v72 | (unsigned __int16)v29) == -1 || (*(_QWORD *)&v73 & 0xFF0000) == 0xFF0000)
  {
    v75 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v76 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTLayout p_computeSpillingTextFrameForLayout:textSize:editingSpillRange:]");
    v77 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayout.mm");
    v78 = (void *)v75;
    v79 = v76;
    v65 = v129;
    v74 = v133;
    objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, v77, 4693, CFSTR("Unable to determine a bottom right corner cell ID for spill text that is being edited"));
  }
  v80 = v132 != 1 && v74;
  if (v80
    && v35 < (BYTE4(RangeForHint) + BYTE2(RangeForHint) - 1)
    && (v150.origin.x = v57,
        v150.origin.y = v58,
        v150.size.width = v59,
        v150.size.height = v60,
        v127 > CGRectGetWidth(v150)))
  {
    v151.origin.x = TSTLayoutGetStrokeFrameForRange(self, v72 & 0xFF00FFFF | ((v70 + 1) << 16) | 0x1000100000000);
    v140.x = v23;
    v140.y = v22;
    if (CGRectContainsPoint(v151, v140))
    {
      LOBYTE(v70) = v70 + 1;
      v65 = 0;
    }
    v81 = v131.var0;
  }
  else
  {
    v82 = v122;
    if (!v132)
      v82 = 0;
    if (v82 == 1)
    {
      v83 = BYTE4(RangeForHint) - 1;
      if (!v74)
        v83 = 0;
      v81 = v131.var0;
      if (v70 > (v83 + BYTE2(RangeForHint)))
      {
        v152.origin.x = v57;
        v152.origin.y = v58;
        v152.size.width = v59;
        v152.size.height = v60;
        if (v127 > CGRectGetWidth(v152))
        {
          v153.origin.x = TSTLayoutGetStrokeFrameForRange(self, v72 & 0xFF00FFFF | ((v70 - 1) << 16) | 0x1000100000000);
          v141.x = v23;
          v141.y = v22;
          if (CGRectContainsPoint(v153, v141))
          {
            LOBYTE(v70) = v70 - 1;
            v65 = 0;
          }
        }
      }
    }
    else
    {
      v81 = v131.var0;
    }
  }
  v84 = TSTCellRangeUnionCellID((v32 << 16) | (v126 << 24) | v81 | 0x1000100000000, (v70 << 16) | (v65 << 24) | v72);
  if (v72 > (unsigned __int16)(v123 + HIWORD(v123) - 1))
    self->mCachedVerticalAlignmentForEditingCell = 0;
  v85 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), v130);
  if ((_WORD)v85 == 0xFFFF || (v85 & 0xFF0000) == 0xFF0000 || (v86 = HIWORD(v85)) == 0 || (v85 & 0xFFFF00000000) == 0)
  {
    v85 = v130 | 0x1000100000000;
    v87 = a5;
  }
  else
  {
    v87 = a5;
    if ((_WORD)v84 == 0xFFFF || (v84 & 0xFF0000) == 0xFF0000 || !HIWORD(v84) || (v84 & 0xFFFF00000000) == 0)
    {
      v89 = v85 >> 16;
      v92 = v85 & 0xFF000000;
      v88 = HIDWORD(v85);
      LOWORD(v84) = v85;
    }
    else
    {
      v88 = HIDWORD(v84);
      if ((unsigned __int16)v84 <= (unsigned __int16)v85
        && (unsigned __int16)(v84 + HIWORD(v84) - 1) >= (unsigned __int16)v85
        && (v89 = v84 >> 16, BYTE2(v85) >= BYTE2(v84))
        && (v90 = (BYTE4(v84) + BYTE2(v84) - 1), v90 >= BYTE2(v85))
        && v90 >= (BYTE4(v85) + BYTE2(v85) - 1)
        && (unsigned __int16)(v84 + HIWORD(v84) - 1) >= (unsigned __int16)(v85 + HIWORD(v85) - 1))
      {
        v92 = v84 & 0xFF000000;
        v86 = HIWORD(v84);
      }
      else if ((unsigned __int16)v85 <= (unsigned __int16)v84
             && (unsigned __int16)(v85 + HIWORD(v85) - 1) >= (unsigned __int16)v84
             && (v89 = v85 >> 16, BYTE2(v84) >= BYTE2(v85))
             && (v91 = (BYTE4(v85) + BYTE2(v85) - 1), v91 >= BYTE2(v84))
             && v91 >= (BYTE4(v84) + BYTE2(v84) - 1)
             && (unsigned __int16)(v85 + HIWORD(v85) - 1) >= (unsigned __int16)(v84 + HIWORD(v84) - 1))
      {
        v92 = v85 & 0xFF000000;
        LOWORD(v84) = v85;
        v88 = HIDWORD(v85);
      }
      else
      {
        v92 = 0;
        if (BYTE2(v84) >= BYTE2(v85))
          LOWORD(v89) = BYTE2(v85);
        else
          LOWORD(v89) = BYTE2(v84);
        v93 = v84;
        if ((unsigned __int16)v84 >= (unsigned __int16)v85)
          v93 = v85;
        v94 = v84 + HIWORD(v84);
        LOWORD(v84) = v93;
        LODWORD(v88) = (v88 + BYTE2(v84) - 1);
        if (v88 <= (BYTE4(v85) + BYTE2(v85) - 1))
          LOWORD(v88) = (BYTE4(v85) + BYTE2(v85) - 1);
        v95 = (unsigned __int16)(v94 - 1);
        if (v95 <= (unsigned __int16)(v85 + HIWORD(v85) - 1))
          LOWORD(v95) = v85 + HIWORD(v85) - 1;
        LOWORD(v88) = v88 - v89 + 1;
        v86 = (unsigned __int16)(v95 - v93 + 1);
      }
    }
    v84 = ((unint64_t)(unsigned __int16)v88 << 32) | (v86 << 48) | v92 & 0xFF000000 | ((unint64_t)v89 << 16) | (unsigned __int16)v84;
  }
  v96 = v84 >> 16;
  v97 = HIDWORD(v84);
  if (v132)
    v98 = WORD2(v84);
  else
    v98 = (BYTE4(v85) + BYTE2(v85) - 1) - BYTE2(v84) + 1;
  if (v132 == 1)
    v99 = v124;
  else
    v99 = BYTE2(v84);
  if (v132 == 1)
  {
    v98 = WORD2(v84);
    v100 = (BYTE4(v85) + BYTE2(v85) - 1) - BYTE2(v84) + 1;
  }
  else
  {
    v100 = WORD2(v84);
  }
  if (v132)
    LOWORD(v97) = v100;
  else
    LOBYTE(v96) = v124;
  if (v74)
  {
    v101 = v97;
  }
  else
  {
    LOBYTE(v96) = v99;
    v101 = v98;
  }
  v102 = v84 & 0xFF00FFFF | (v96 << 16);
  if (v87)
  {
    v87->var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)v102;
    v87->var1.var0 = v101;
    v87->var1.var1 = HIWORD(v84);
  }
  v103 = TSTLayoutGetContentFrameForRange(self, v84 & 0xFFFF000000000000 | ((unint64_t)v101 << 32) | v102);
  v105 = v104;
  v107 = v106;
  v109 = v108;
  AlignedContentFrameForRange = TSTLayoutGetAlignedContentFrameForRange(self, v102 | 0x1000100000000);
  v114 = v113;
  if (!v74)
  {
    v115 = v110;
    v116 = v111;
    v154.origin.x = v103;
    v154.origin.y = v105;
    v154.size.width = v107;
    v154.size.height = v109;
    MaxX = CGRectGetMaxX(v154);
    v155.origin.x = AlignedContentFrameForRange;
    v155.origin.y = v114;
    v155.size.width = v115;
    v155.size.height = v116;
    AlignedContentFrameForRange = v103 - (MaxX - CGRectGetMaxX(v155));
  }
  self->mEditingSpillingTextRange.origin = ($5CFCD363C99B2F51819B67AD7AD2E060)v102;
  self->mEditingSpillingTextRange.size.numberOfColumns = v101;
  self->mEditingSpillingTextRange.size.numberOfRows = HIWORD(v84);
  v118 = AlignedContentFrameForRange;
  v119 = v114;
  v120 = v107;
  v121 = v109;
  result.size.height = v121;
  result.size.width = v120;
  result.origin.y = v119;
  result.origin.x = v118;
  return result;
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTLayout;
  v3 = -[TSDLayout dependentLayouts](&v5, sel_dependentLayouts);
  if (self->mContainedTextEditingLayout)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v3);
    objc_msgSend(v3, "addObject:", self->mContainedTextEditingLayout);
  }
  return v3;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array", a3);
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)maskRectForTextLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (self->mContainedTextEditingLayout == a3)
  {
    v8 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTLayout tableModel](self, "tableModel"), -[TSTTableInfo editingCellID](-[TSTLayout tableInfo](self, "tableInfo"), "editingCellID"));
    v9 = v8;
    if ((_WORD)v8 != 0xFFFF)
    {
      v10 = (v8 & 0xFF0000) == 0xFF0000 || HIWORD(v8) == 0;
      if (!v10 && (v8 & 0xFFFF00000000) != 0)
      {
        if (BYTE2(v8) == 255)
          v12 = -1;
        else
          v12 = BYTE2(v8);
        v13 = (unsigned __int16)v8;
        if (WORD2(v8))
          v14 = WORD2(v8) + v12 - 1;
        else
          v14 = 0xFFFFFFFFLL;
        -[TSTLayout validate](self, "validate");
        v15 = v12 | ((unint64_t)v13 << 32);
        v16 = ((v9 >> 16) & 0xFFFF00000000) + ((unint64_t)v13 << 32) - 0x100000000;
        if (((v9 >> 16) & 0xFFFF00000000) == 0)
          v16 = 0xFFFFFFFF00000000;
        v17 = v14 | v16;
        -[TSTLayout p_rangeUpAndLeftOfIntersectionRangeOfGridRange:](self, "p_rangeUpAndLeftOfIntersectionRangeOfGridRange:", v15, v14 | v16);
        v19 = v18;
        v21 = v20;
        if (!-[TSTLayout p_layoutWhollyContainsGridRange:](self, "p_layoutWhollyContainsGridRange:", v15, v17))
        {
          TSTLayoutGetFrameForGridRange(self, v15, v17);
          v5 = v22;
          v6 = v23;
          v3 = v19;
          v4 = v21;
        }
      }
    }
  }
  v24 = v3;
  v25 = v4;
  v26 = v5;
  v27 = v6;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGSize)initialTextSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 8.0;
  v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)p_processChange:(id)a3 forChangeSource:(id)a4 actions:(id)a5
{
  int v9;
  void *v10;
  int v11;
  int v12;

  v9 = objc_msgSend(a3, "kind");
  if (objc_msgSend(a4, "isEqual:", -[TSTLayout tableInfo](self, "tableInfo")) && v9 == 1)
  {
    objc_opt_class();
    objc_msgSend(a3, "details");
    v10 = (void *)TSUDynamicCast();
    if (v10)
      v11 = objc_msgSend(v10, "changeDescriptor");
    else
      v11 = -1;
    objc_msgSend(a3, "details");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = 40;
    else
      v12 = v11;
    switch(v12)
    {
      case 0:
      case 17:
      case 18:
      case 27:
      case 37:
      case 38:
        objc_msgSend(a5, "setLayoutInvalidate:", 1);
        return;
      case 1:
      case 2:
      case 4:
      case 5:
      case 13:
      case 14:
      case 19:
      case 20:
      case 21:
      case 22:
      case 24:
      case 25:
      case 26:
      case 28:
      case 33:
      case 36:
        goto LABEL_10;
      case 3:
      case 23:
        objc_msgSend(a5, "setLayoutInvalidate:", 1);
        goto LABEL_11;
      case 8:
      case 9:
      case 10:
      case 34:
      case 35:
        objc_msgSend(a5, "setLayoutInvalidate:", 1);
        objc_msgSend(a5, "setLayoutInvalidateSize:", 1);
        objc_msgSend(a5, "setLayoutSpacesInvalidateCoordinates:", 1);
        objc_msgSend(a5, "setLayoutInvalidateProvider:", 1);
        return;
      case 29:
      case 40:
        objc_msgSend(a5, "setLayoutInvalidateProvider:", 1);
LABEL_10:
        objc_msgSend(a5, "setLayoutInvalidate:", 1);
        objc_msgSend(a5, "setLayoutInvalidateSize:", 1);
        goto LABEL_11;
      case 31:
        objc_msgSend(a5, "setLayoutInvalidate:", 1);
        objc_msgSend(a5, "setLayoutInvalidateSize:", 1);
        objc_msgSend(a5, "setLayoutInvalidateTableNameVisibility:", 1);
LABEL_11:
        objc_msgSend(a5, "setLayoutSpacesInvalidateCoordinates:", 1);
        objc_msgSend(a5, "setLayoutSpacesInvalidateTableOffsets:", 1);
        break;
      default:
        return;
    }
  }
}

- (void)p_processChangeActions:(id)a3
{
  CGSize v5;
  TSWPLayout *v6;

  if (objc_msgSend(a3, "layoutInvalidate"))
    -[TSTLayout invalidate](self, "invalidate");
  if (objc_msgSend(a3, "layoutInvalidateProvider"))
  {
    v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->mComputedEditingCellContentFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->mComputedEditingCellContentFrame.size = v5;
    v6 = -[TSTLayout containedTextEditingLayout](self, "containedTextEditingLayout");
    if (v6)
      -[TSDLayout invalidateFrame](v6, "invalidateFrame");
    -[TSDLayout invalidateChildren](self, "invalidateChildren");
  }
  if (objc_msgSend(a3, "layoutInvalidateSize"))
  {
    if (-[TSDDrawableInfo isInlineWithText](-[TSTLayout tableInfo](self, "tableInfo"), "isInlineWithText"))
      -[TSTTablePartitioner setScaleToFit:](-[TSTTableInfo partitioner](-[TSTLayout tableInfo](self, "tableInfo"), "partitioner"), "setScaleToFit:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[TSTLayout invalidateSize](self, "invalidateSize");
  }
  if (objc_msgSend(a3, "layoutSpacesInvalidateCoordinates"))
    -[TSTLayoutSpaceBundle invalidateCoordinates](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateCoordinates");
  if (objc_msgSend(a3, "layoutSpacesInvalidateTableOffsets"))
    -[TSTLayoutSpaceBundle invalidateTableOffsets](-[TSTLayout spaceBundle](self, "spaceBundle"), "invalidateTableOffsets");
  if (objc_msgSend(a3, "layoutInvalidateTableNameVisibility"))
    -[TSTLayout invalidateTableNameVisibility](self, "invalidateTableNameVisibility");
}

- (void)processChanges:(id)a3
{
  TSTLayoutProcessChangesActions *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TSTLayout;
  -[TSDLayout processChanges:](&v14, sel_processChanges_);
  if (-[TSTTablePartitioner scaledLayout](-[TSTTableInfo partitioner](-[TSTLayout tableInfo](self, "tableInfo"), "partitioner"), "scaledLayout") != self)-[TSTLayout processChanges:](-[TSTTablePartitioner scaledLayout](-[TSTTableInfo partitioner](-[TSTLayout tableInfo](self, "tableInfo"), "partitioner"), "scaledLayout"), "processChanges:", a3);
  if (!self->mProcessChangesFiltering)
  {
    v5 = objc_alloc_init(TSTLayoutProcessChangesActions);
    if (a3)
    {
      if (objc_msgSend(a3, "count"))
      {
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v11;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v11 != v8)
                objc_enumerationMutation(a3);
              -[TSTLayout p_processChange:forChangeSource:actions:](self, "p_processChange:forChangeSource:actions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), -[TSDLayout info](self, "info"), v5);
            }
            while (v7 != v9);
            v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          }
          while (v7);
        }
      }
    }
    -[TSTLayout p_processChangeActions:](self, "p_processChangeActions:", v5);

  }
}

- (int)reapCoordinatesChangedMaskForChrome
{
  int mCoordinatesChangedMaskForChrome;

  mCoordinatesChangedMaskForChrome = self->mCoordinatesChangedMaskForChrome;
  self->mCoordinatesChangedMaskForChrome = 0;
  return mCoordinatesChangedMaskForChrome;
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mEditingSpillingTextRange;
  BOOL v10;
  BOOL v11;

  if (objc_msgSend(a3, "wpKind") == 5)
  {
    objc_msgSend(+[TSKChangeCollector threadCollector](TSKChangeCollector, "threadCollector"), "registerChange:details:forChangeSource:", 1, +[TSTChangeDescriptor changeDescriptorWithType:cellRegion:](TSTChangeDescriptor, "changeDescriptorWithType:cellRegion:", 33, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", -[TSTTableInfo editingCellID](-[TSTLayout tableInfo](self, "tableInfo"), "editingCellID") | 0x1000100000000)), -[TSTLayout tableInfo](self, "tableInfo"));
    mEditingSpillingTextRange = self->mEditingSpillingTextRange;
    if (self->mEditingSpillingTextRange.origin.row == 0xFFFF
      || ((*(_QWORD *)&mEditingSpillingTextRange & 0xFF0000) != 0xFF0000
        ? (v10 = mEditingSpillingTextRange.size.numberOfRows == 0)
        : (v10 = 1),
          !v10 ? (v11 = (*(_QWORD *)&mEditingSpillingTextRange & 0xFFFF00000000) == 0) : (v11 = 1),
          v11))
    {
      if (a6)
        return;
    }
    else
    {
      objc_msgSend(+[TSKChangeCollector threadCollector](TSKChangeCollector, "threadCollector"), "registerChange:details:forChangeSource:", 1, +[TSTChangeDescriptor changeDescriptorWithType:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:strokeRange:", 27), -[TSTLayout tableInfo](self, "tableInfo"));
      if (a6)
        return;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86) != self->mContainedTextEditorParagraphAlignment)-[TSTLayout invalidateForAutosizingTextLayout:](self, "invalidateForAutosizingTextLayout:", self->mContainedTextEditingLayout);
  }
}

- (unsigned)p_defaultAlignmentForTableWritingDirection
{
  return !-[TSTLayout p_getLayoutDirectionLeftToRight](self, "p_getLayoutDirectionLeftToRight");
}

- (BOOL)p_getLayoutDirectionLeftToRight
{
  return -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTLayout tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798) != 1;
}

- (BOOL)newCanvasRevealedHorizontally
{
  return self->mNewCanvasRevealedHorizontally;
}

- (void)setNewCanvasRevealedHorizontally:(BOOL)a3
{
  self->mNewCanvasRevealedHorizontally = a3;
}

- (BOOL)newCanvasRevealedVertically
{
  return self->mNewCanvasRevealedVertically;
}

- (void)setNewCanvasRevealedVertically:(BOOL)a3
{
  self->mNewCanvasRevealedVertically = a3;
}

- (void)setContainedTextEditingLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (UIEdgeInsets)paddingForEditingCell
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mCachedPaddingForEditingCell.top;
  left = self->mCachedPaddingForEditingCell.left;
  bottom = self->mCachedPaddingForEditingCell.bottom;
  right = self->mCachedPaddingForEditingCell.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (TSTLayoutSpaceBundle)spaceBundle
{
  return self->mSpaceBundle;
}

- (void)setSpaceBundle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingSpillingTextRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mEditingSpillingTextRange;
}

- (BOOL)layoutDirectionIsLeftToRight
{
  return self->mLayoutDirectionIsLeftToRight;
}

- (TSTMasterLayout)masterLayout
{
  return self->mMasterLayout;
}

- (void)setMasterLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (TSTLayoutHint)layoutHint
{
  return self->mLayoutHint;
}

- (BOOL)processChangesFiltering
{
  return self->mProcessChangesFiltering;
}

- (void)setProcessChangesFiltering:(BOOL)a3
{
  self->mProcessChangesFiltering = a3;
}

@end
