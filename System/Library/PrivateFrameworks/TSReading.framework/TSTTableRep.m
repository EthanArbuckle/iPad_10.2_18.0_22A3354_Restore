@implementation TSTTableRep

- (TSTTableModel)tableModel
{
  return -[TSTTableInfo tableModel](-[TSTTableRep tableInfo](self, "tableInfo"), "tableModel");
}

- (TSTEditingState)editingState
{
  return -[TSTTableInfo editingState](-[TSTTableRep tableInfo](self, "tableInfo"), "editingState");
}

- (TSTMasterLayout)masterLayout
{
  return -[TSTTableInfo masterLayout](-[TSTTableRep tableInfo](self, "tableInfo"), "masterLayout");
}

- (TSDCanvasView)canvasView
{
  if (-[TSDCanvas isCanvasInteractive](self->super.super.mCanvas, "isCanvasInteractive"))
    return (TSDCanvasView *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasView");
  else
    return 0;
}

- (TSDEditorController)editorController
{
  if (-[TSDCanvas isCanvasInteractive](self->super.super.mCanvas, "isCanvasInteractive"))
    return -[TSDInteractiveCanvasController editorController](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "editorController");
  else
    return 0;
}

- (CGAffineTransform)transformToCanvas
{
  CGFloat v4;
  CGFloat v5;

  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  return CGAffineTransformMakeTranslation(retstr, v4, v5);
}

- (CGAffineTransform)transformFromCanvas
{
  CGAffineTransform v5;

  if (self)
    -[TSTTableRep transformToCanvas](self, "transformToCanvas");
  else
    memset(&v5, 0, sizeof(v5));
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGRect)canvasVisibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDCanvas visibleUnscaledRectForClippingReps](-[TSDRep canvas](self, "canvas"), "visibleUnscaledRectForClippingReps");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CALayer)layerForRep
{
  return (CALayer *)-[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
}

- (TSTCellRegion)selectionRegion
{
  if (-[TSTMasterLayout isDynamicallyChangingSelection](-[TSTTableRep masterLayout](self, "masterLayout"), "isDynamicallyChangingSelection"))
  {
    return -[TSTMasterLayout dynamicSelectionRegion](-[TSTTableRep masterLayout](self, "masterLayout"), "dynamicSelectionRegion");
  }
  else
  {
    return (TSTCellRegion *)objc_msgSend(-[TSTTableRep editorSelection](self, "editorSelection"), "cellRegion");
  }
}

- (id)hitRep:(CGPoint)a3
{
  return 0;
}

- (id)hitRepChrome:(CGPoint)a3
{
  return 0;
}

- (id)repForDragging
{
  objc_super v3;

  if (self->mContainedTextEditingRep)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  return -[TSDRep repForDragging](&v3, sel_repForDragging);
}

- (CGRect)layerFrameInScaledCanvas
{
  TSDCanvas *mCanvas;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  mCanvas = self->super.super.mCanvas;
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
  v8 = TSDRoundedRectForScale(v4, v5, v6, v7, self->mCurrentScreenScale);
  v10 = v9;
  v12 = TSDCeilSize(v11);
  v14 = v13;
  v15 = v8;
  v16 = v10;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  return 0;
}

- (void)dealloc
{
  TSDTilingLayer *mOverlayTableName;
  TSDTilingLayer *mOverlayFrozenHeaderCorner;
  objc_super v5;

  self->mHyperlinkField = 0;
  self->mTableChrome = 0;

  self->mReferences = 0;
  mOverlayTableName = self->mOverlayTableName;
  if (mOverlayTableName)
  {
    -[TSDTilingLayer setDelegate:](mOverlayTableName, "setDelegate:", 0);

    self->mOverlayTableName = 0;
  }
  if (self->mOverlayFrozenHeaderColumns)
  {
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderColumnsMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderColumnsMask = 0;
    -[TSDTilingLayer setDelegate:](self->mOverlayFrozenHeaderColumns, "setDelegate:", 0);

    self->mOverlayFrozenHeaderColumns = 0;
  }
  if (self->mOverlayFrozenHeaderRows)
  {
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderRowsMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderRowsMask = 0;
    -[TSDTilingLayer setDelegate:](self->mOverlayFrozenHeaderRows, "setDelegate:", 0);

    self->mOverlayFrozenHeaderRows = 0;
  }
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  if (mOverlayFrozenHeaderCorner)
  {
    -[TSDTilingLayer setDelegate:](mOverlayFrozenHeaderCorner, "setDelegate:", 0);

    self->mOverlayFrozenHeaderCorner = 0;
  }
  if (self->mOverlayFrozenHeaderTableBodyMask)
  {
    -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderTableNameMask, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderTableNameMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderTableNameMask = 0;
    -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderTableBodyMask, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderTableBodyMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderTableBodyMask = 0;
  }
  -[TSTSelectionDragController setTableRep:](self->mCellDragController, "setTableRep:", 0);
  self->mCellDragController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableRep;
  -[TSWPTextHostRep dealloc](&v5, sel_dealloc);
}

+ (Class)tableRepDelegateClass
{
  return 0;
}

- (TSTTableRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSTTableRep *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSTTableRep;
  v4 = -[TSWPTextHostRep initWithLayout:canvas:](&v9, sel_initWithLayout_canvas_, a3, a4);
  if (v4)
  {
    v5 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
    v4->mDragByHandleOnly = objc_msgSend(v5, "dragByHandleOnly");
    v4->mSelectionUsesBezierPath = objc_msgSend(v5, "selectionUsesBezierPath");
    v4->mSelectsCellOnInitialTap = objc_msgSend(v5, "selectsCellOnInitialTap");
    v4->mUsesWholeChromeResizer = objc_msgSend(v5, "usesWholeChromeResizer");
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "integerForKey:", CFSTR("TSTTableRepRatingCellDragging"));
    if (v6 <= 1)
      v7 = v6;
    else
      v7 = 0;
    TSTTableRepRatingCellDraggingValue = v7;
    v4->mVisibleFillKnobs = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    v4->mAnimationStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v4;
}

- (BOOL)shouldRestartTextEditing
{
  return 0;
}

- (BOOL)shouldCommitPendingTextEdit
{
  return 0;
}

- (BOOL)handlesEditMenu
{
  int v3;

  v3 = -[TSTEditingState editingMode](-[TSTTableRep editingState](self, "editingState"), "editingMode");
  if (-[TSDRep isLocked](self, "isLocked"))
    return 0;
  if (v3)
    return 1;
  return self->super.super.mKnobTracker != 0;
}

- (void)updateChildrenFromLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTTableRep;
  -[TSWPTextHostRep updateChildrenFromLayout](&v2, sel_updateChildrenFromLayout);
}

- (BOOL)isDraggable
{
  if (objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
    return TSTLayoutIsPartitionAlongTop(-[TSTTableRep tableLayout](self, "tableLayout"));
  else
    return 1;
}

- (CGRect)deviceBoundsForCellRange:(id)a3
{
  TSTLayout *v5;
  CGFloat v6;
  double x;
  double y;
  double width;
  double height;
  double CanvasRectForRect;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  v27 = TSDRectUnit;
  v28 = *(_OWORD *)&qword_217C29078;
  v5 = -[TSTTableRep tableLayout](self, "tableLayout");
  TSTLayoutGetViewScale(v5);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v6, v6);
  v29.origin.x = TSTLayoutGetAlignedStrokeFrameForRange(v5, *(_QWORD *)&a3);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v24 = v26;
  v25 = CGRectApplyAffineTransform(v29, &v24);
  CanvasRectForRect = TSTLayoutGetCanvasRectForRect(v5, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[TSTTableRep contentsRectForCellRangeAcrossSpaces:contentsCenterInfo:canvasFrame:contentsRect:](self, "contentsRectForCellRangeAcrossSpaces:contentsCenterInfo:canvasFrame:contentsRect:", a3, 0, &v25, &v27);
  memset(&v23, 0, sizeof(v23));
  TSTLayoutGetTransformToDevice(v5, &v23);
  v22 = v23;
  v30.origin.x = CanvasRectForRect;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  result = CGRectApplyAffineTransform(v30, &v22);
  if (*(double *)&v27 > 0.0)
    result.origin.x = result.origin.x + result.size.width * *(double *)&v27;
  v18 = 1.0;
  v19 = *(double *)&v28;
  if (*(double *)&v27 <= 0.0)
    v19 = 1.0;
  v20 = result.size.width * v19;
  if (*((double *)&v27 + 1) > 0.0)
  {
    result.origin.y = result.origin.y + result.size.height * *((double *)&v27 + 1);
    v18 = *((double *)&v28 + 1);
  }
  v21 = result.size.height * v18;
  result.size.height = v21;
  result.size.width = v20;
  return result;
}

- (CGRect)canvasBoundsForCellRange:(id)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v6 = 1.0 / v5;
  -[TSTTableRep deviceBoundsForCellRange:](self, "deviceBoundsForCellRange:", a3);
  v11 = TSDMultiplyRectScalar(v7, v8, v9, v10, v6);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)boundsForCellSelection:(id)a3
{
  uint64_t var1;
  uint64_t var0;
  double FrameForGridRange;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
  if (a3.var1 == 255)
    var1 = 0xFFFFFFFFLL;
  else
    var1 = a3.var1;
  if (a3.var0 == 0xFFFF)
    var0 = 0xFFFFFFFFLL;
  else
    var0 = a3.var0;
  FrameForGridRange = TSTLayoutGetFrameForGridRange(-[TSTTableRep tableLayout](self, "tableLayout"), var1 | (var0 << 32), var1 | (var0 << 32));
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = FrameForGridRange;
  return result;
}

- (void)contentsRectForCellRangeAcrossSpaces:(id)a3 contentsCenterInfo:(id *)a4 canvasFrame:(CGRect *)a5 contentsRect:(CGRect *)a6
{
  __int16 v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  TSTLayout *v20;
  void *Space;
  uint64_t FrozenHeaderRowsSpace;
  uint64_t FrozenHeaderColumnsSpace;
  uint64_t v24;
  CGFloat v25;
  double MinX;
  unint64_t Range;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unint64_t v36;
  double MinY;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  double MaxX;
  double v48;
  double var2;
  double var1;
  unint64_t v51;
  double v52;
  CGSize v53;
  double v54;
  double var5;
  double var4;
  double v57;
  double MaxY;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v11 = ~a3.var0.var0;
  x = a5->origin.x;
  y = a5->origin.y;
  width = a5->size.width;
  height = a5->size.height;
  v17 = 0.0;
  v16 = 0.0;
  v18 = 1.0;
  v19 = 1.0;
  v20 = -[TSTTableRep tableLayout](self, "tableLayout");
  Space = (void *)TSTLayoutGetSpace(-[TSTTableRep tableLayout](self, "tableLayout"));
  FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v20);
  FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v20);
  if (v11)
  {
    if ((*(_QWORD *)&a3 & 0xFF0000) != 0xFF0000)
    {
      if (HIWORD(*(unint64_t *)&a3))
      {
        if ((*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
        {
          v24 = FrozenHeaderColumnsSpace;
          if (FrozenHeaderRowsSpace | FrozenHeaderColumnsSpace)
          {
            -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
            memset(&v64, 0, sizeof(v64));
            CGAffineTransformMakeScale(&v64, v25, v25);
            v65.origin.x = TSTLayoutGetAlignedMaskRectForSpace(v20, Space);
            v63 = v64;
            v66 = CGRectApplyAffineTransform(v65, &v63);
            v67 = CGRectIntegral(v66);
            v59 = v67.origin.x;
            v60 = v67.size.width;
            v61 = v67.size.height;
            v62 = v67.origin.y;
            if (!v24 || !TSTLayoutGetFrozenHeaderColumnsFloating(v20) || a4 && a4->var1 <= 0.0)
            {
LABEL_37:
              if (!FrozenHeaderRowsSpace)
              {
LABEL_74:
                a5->origin.x = x;
                a5->origin.y = y;
                a5->size.width = width;
                a5->size.height = height;
                a6->origin.x = v17;
                a6->origin.y = v16;
                a6->size.width = v18;
                a6->size.height = v19;
                return;
              }
              goto LABEL_38;
            }
            v68.origin.x = x;
            v68.origin.y = y;
            v68.size.width = width;
            v68.size.height = height;
            MinX = CGRectGetMinX(v68);
            v69.origin.x = v59;
            v69.size.width = v60;
            v69.size.height = v61;
            v69.origin.y = v62;
            if (MinX >= CGRectGetMinX(v69))
            {
LABEL_36:
              v16 = 0.0;
              goto LABEL_37;
            }
            Range = TSTLayoutSpaceGetRange(v24);
            v28 = 0;
            v29 = 16711680;
            v30 = 0xFFFFLL;
            if ((_WORD)Range != 0xFFFF)
            {
              v31 = 0;
              if ((Range & 0xFF0000) == 0xFF0000)
                goto LABEL_31;
              v28 = 0;
              v29 = 16711680;
              v30 = 0xFFFFLL;
              if (HIWORD(Range))
              {
                v31 = 0;
                if ((Range & 0xFFFF00000000) != 0)
                {
                  v30 = 0;
                  v32 = BYTE2(Range) <= a3.var0.var1 ? a3.var0.var1 : BYTE2(Range);
                  v33 = (unsigned __int16)Range <= a3.var0.var0 ? a3.var0.var0 : (unsigned __int16)Range;
                  v34 = (BYTE4(Range) + BYTE2(Range) - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                      ? (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                      : (BYTE4(Range) + BYTE2(Range) - 1);
                  v35 = (unsigned __int16)(Range + HIWORD(Range) - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                      ? (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                      : (unsigned __int16)(Range + HIWORD(Range) - 1);
                  v29 = 0;
                  v28 = 0;
                  v31 = 0;
                  if (v33 <= v35 && v32 <= v34)
                  {
                    v31 = ((unint64_t)(v35 - v33) << 48) + 0x1000000000000;
                    v28 = (unint64_t)(unsigned __int16)(v34 - v32 + 1) << 32;
                    v29 = v32 << 16;
                    v30 = v33;
                  }
                }
                goto LABEL_31;
              }
            }
            v31 = 0;
LABEL_31:
            if (!HIWORD(v31) || (v36 = v29 | v31 | v30 | v28, (v36 & 0xFFFF00000000) == 0))
            {
              v74.origin.x = x;
              v74.origin.y = y;
              v74.size.width = width;
              v74.size.height = height;
              MaxX = CGRectGetMaxX(v74);
              v75.size.width = v60;
              v75.origin.x = v59;
              v75.size.height = v61;
              v75.origin.y = v62;
              if (MaxX < CGRectGetMinX(v75))
                goto LABEL_77;
              if (a4 && a4->var0)
              {
                v48 = v59 - x;
                var2 = a4->var2;
                v16 = 0.0;
                if (v59 - x <= var2)
                {
                  v17 = v48 / a4->var1;
                }
                else
                {
                  var1 = a4->var1;
                  if (width - v48 <= var2 + a4->var3)
                    v17 = 1.0 - (width - v48) / var1;
                  else
                    v17 = var2 / var1;
                }
              }
              else
              {
                v48 = v59 - x;
                v17 = (v59 - x) / width;
                v16 = 0.0;
              }
              x = v59;
              v18 = 1.0 - v17;
              width = width - v48;
              if (!FrozenHeaderRowsSpace)
                goto LABEL_74;
LABEL_38:
              if (!TSTLayoutGetFrozenHeaderRowsFloating(v20) || a4 && a4->var4 <= 0.0)
                goto LABEL_74;
              v72.origin.x = x;
              v72.origin.y = y;
              v72.size.width = width;
              v72.size.height = height;
              MinY = CGRectGetMinY(v72);
              v73.origin.x = v59;
              v73.size.width = v60;
              v73.size.height = v61;
              v73.origin.y = v62;
              if (MinY >= CGRectGetMinY(v73))
                goto LABEL_73;
              v38 = TSTLayoutSpaceGetRange(FrozenHeaderRowsSpace);
              v39 = 0;
              v40 = 16711680;
              v41 = 0xFFFFLL;
              if ((_WORD)v38 != 0xFFFF)
              {
                v42 = 0;
                if ((v38 & 0xFF0000) == 0xFF0000)
                  goto LABEL_68;
                v39 = 0;
                v40 = 16711680;
                v41 = 0xFFFFLL;
                if (HIWORD(v38))
                {
                  v42 = 0;
                  if ((v38 & 0xFFFF00000000) != 0)
                  {
                    v41 = 0;
                    v43 = BYTE2(v38) <= a3.var0.var1 ? a3.var0.var1 : BYTE2(v38);
                    v44 = (unsigned __int16)v38 <= a3.var0.var0 ? a3.var0.var0 : (unsigned __int16)v38;
                    v45 = (BYTE4(v38) + BYTE2(v38) - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                        ? (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
                        : (BYTE4(v38) + BYTE2(v38) - 1);
                    v46 = (unsigned __int16)(v38 + HIWORD(v38) - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                        ? (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1)
                        : (unsigned __int16)(v38 + HIWORD(v38) - 1);
                    v40 = 0;
                    v39 = 0;
                    v42 = 0;
                    if (v44 <= v46 && v43 <= v45)
                    {
                      v42 = ((unint64_t)(v46 - v44) << 48) + 0x1000000000000;
                      v39 = (unint64_t)(unsigned __int16)(v45 - v43 + 1) << 32;
                      v40 = v43 << 16;
                      v41 = v44;
                    }
                  }
                  goto LABEL_68;
                }
              }
              v42 = 0;
LABEL_68:
              if (HIWORD(v42))
              {
                v51 = v40 | v42 | v41 | v39;
                if ((v51 & 0xFFFF00000000) != 0)
                {
                  if (((v51 ^ *(_QWORD *)&a3) & 0xFFFFFFFF00FFFFFFLL) != 0)
                  {
                    v76.origin.x = x;
                    v76.origin.y = y;
                    v76.size.width = width;
                    v76.size.height = height;
                    MaxY = CGRectGetMaxY(v76);
                    v77.origin.x = v59;
                    v77.size.width = v60;
                    v77.size.height = v61;
                    v77.origin.y = v62;
                    if (MaxY < CGRectGetMinY(v77))
                    {
                      height = v62 - y;
                      v19 = 1.00000012;
                    }
                  }
LABEL_73:
                  v16 = 0.0;
                  goto LABEL_74;
                }
              }
              v78.origin.x = x;
              v78.origin.y = y;
              v78.size.width = width;
              v78.size.height = height;
              v52 = CGRectGetMaxY(v78);
              v79.origin.x = v59;
              v79.size.width = v60;
              v79.size.height = v61;
              v79.origin.y = v62;
              if (v52 >= CGRectGetMinY(v79))
              {
                if (a4 && a4->var0)
                {
                  v54 = v62 - y;
                  y = v62;
                  var5 = a4->var5;
                  if (v54 <= var5)
                  {
                    v16 = v54 / a4->var4;
                  }
                  else
                  {
                    var4 = a4->var4;
                    if (height - v54 <= var5 + a4->var6)
                      v16 = 1.0 - (height - v54) / var4;
                    else
                      v16 = var5 / var4;
                  }
                }
                else
                {
                  v54 = v62 - y;
                  y = v62;
                  v16 = v54 / height;
                }
                v19 = 1.0 - v16;
                height = height - v54;
                goto LABEL_74;
              }
LABEL_77:
              v53 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
              a5->origin = (CGPoint)*MEMORY[0x24BDBF090];
              a5->size = v53;
              a6->origin = (CGPoint)CGRectEmptyUnitSquare;
              a6->size = (CGSize)unk_217C2C338;
              return;
            }
            if (((v36 ^ *(_QWORD *)&a3) & 0xFFFFFFFF00FFFFFFLL) != 0)
            {
              v70.origin.x = x;
              v70.origin.y = y;
              v70.size.width = width;
              v70.size.height = height;
              v57 = CGRectGetMaxX(v70);
              v71.size.width = v60;
              v71.origin.x = v59;
              v71.size.height = v61;
              v71.origin.y = v62;
              if (v57 < CGRectGetMinX(v71))
              {
                width = v59 - x;
                v18 = 1.00000012;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
  }
}

- (id)editorSelection
{
  return 0;
}

- (void)updateFromLayout
{
  TSTLayout *v3;
  double v4;
  CGFloat v5;
  double v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v7;
  unint64_t Range;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  objc_super v20;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v5 = v4;
  TSTLayoutSetViewScale(v3, v4);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  TSTTableRepSetupUserSpaceToDeviceSpaceTransform(self, v5, v6);
  if (TSTLayoutSetTabsVisible((uint64_t)-[TSTTableRep tableLayout](self, "tableLayout"), 0))
    -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSTTableRep validateVisibleRect](self, "validateVisibleRect");
  if (!self->super.super.mSelectionHighlightLayerValid)
    -[TSTTableChromeProvider selectionHighlightLayerInvalidateLayout](-[TSTTableRep tableChrome](self, "tableChrome"), "selectionHighlightLayerInvalidateLayout");
  v7 = -[TSTLayout editingSpillingTextRange](-[TSTTableRep tableLayout](self, "tableLayout"), "editingSpillingTextRange");
  if (v7.var0.var0 != 0xFFFF
    && (*(_QWORD *)&v7 & 0xFF0000) != 0xFF0000
    && HIWORD(*(unint64_t *)&v7)
    && (*(_QWORD *)&v7 & 0xFFFF00000000) != 0)
  {
    -[TSTTableRep dirtyCellRange:](self, "dirtyCellRange:", -[TSTLayout editingSpillingTextRange](-[TSTTableRep tableLayout](self, "tableLayout"), "editingSpillingTextRange"));
  }
  Range = TSTMasterLayoutGetRange((uint64_t)-[TSTLayout masterLayout](v3, "masterLayout"));
  v9 = TSTMasterLayoutExpandCellRangeToCoverMergedCells(-[TSTTableRep masterLayout](self, "masterLayout"), *(_QWORD *)&self->mDirtyCellRange);
  v10 = -[TSTMasterLayout emptyFilteredTable](-[TSTTableRep masterLayout](self, "masterLayout"), "emptyFilteredTable");
  v11 = v9 & 0xFF0000;
  if (!v10 || (unsigned __int16)v9 == 0xFFFFLL || v11 == 16711680 || !HIWORD(v9) || (v9 & 0xFFFF00000000) == 0)
  {
    v12 = 0;
    v13 = 16711680;
    v14 = 0xFFFFLL;
    if ((unsigned __int16)v9 != 0xFFFFLL)
    {
      v15 = 0;
      if (v11 == 16711680)
        goto LABEL_38;
      v12 = 0;
      v13 = 16711680;
      v14 = 0xFFFFLL;
      if (HIWORD(v9))
      {
        v15 = 0;
        if ((v9 & 0xFFFF00000000) == 0)
          goto LABEL_38;
        v12 = 0;
        v13 = 16711680;
        v14 = 0xFFFFLL;
        if ((_WORD)Range != 0xFFFF)
        {
          v15 = 0;
          if ((Range & 0xFF0000) != 0xFF0000)
          {
            v12 = 0;
            v13 = 16711680;
            v14 = 0xFFFFLL;
            if (HIWORD(Range))
            {
              v15 = 0;
              if ((Range & 0xFFFF00000000) != 0)
              {
                v14 = 0;
                if (BYTE2(v9) <= BYTE2(Range))
                  v16 = BYTE2(Range);
                else
                  v16 = BYTE2(v9);
                if ((unsigned __int16)v9 <= (unsigned __int16)Range)
                  v17 = (unsigned __int16)Range;
                else
                  v17 = (unsigned __int16)v9;
                if ((BYTE4(v9) + BYTE2(v9) - 1) >= (BYTE4(Range) + BYTE2(Range) - 1))
                  v18 = (BYTE4(Range) + BYTE2(Range) - 1);
                else
                  v18 = (BYTE4(v9) + BYTE2(v9) - 1);
                v19 = (unsigned __int16)(Range + HIWORD(Range) - 1);
                if ((unsigned __int16)(v9 + HIWORD(v9) - 1) < v19)
                  v19 = (unsigned __int16)(v9 + HIWORD(v9) - 1);
                v13 = 0;
                v12 = 0;
                v15 = 0;
                if (v17 <= v19 && v16 <= v18)
                {
                  v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
                  v12 = (unint64_t)(unsigned __int16)(v18 - v16 + 1) << 32;
                  v13 = v16 << 16;
                  v14 = v17;
                }
              }
              goto LABEL_38;
            }
            goto LABEL_37;
          }
LABEL_38:
          Range = v13 | v15 | v14 | v12;
          goto LABEL_39;
        }
      }
    }
LABEL_37:
    v15 = 0;
    goto LABEL_38;
  }
LABEL_39:
  self->mDirtyCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  if ((_WORD)Range != 0xFFFF && (Range & 0xFF0000) != 0xFF0000 && HIWORD(Range) && (Range & 0xFFFF00000000) != 0)
    -[TSTTableRep setNeedsDisplayInCellRange:](self, "setNeedsDisplayInCellRange:", Range);
  v20.receiver = self;
  v20.super_class = (Class)TSTTableRep;
  -[TSDRep updateFromLayout](&v20, sel_updateFromLayout);
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableRep;
  -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](&v6, sel_layoutInRootChangedFrom_to_translatedOnly_, a3, a4, a5);
  -[TSTTableChromeProvider invalidateAllChrome](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAllChrome");
}

- (void)validateStrokesInEditingSpillingTextRange
{
  unint64_t v2;
  TSTLayoutCellIterator *v4;
  unint64_t v5;
  TSDStroke *v6;
  TSDStroke *v7;
  TSDStroke *v8;
  TSDStroke *v9;
  int v10;
  int v11;
  unint64_t v12;
  $CA3468F20078D5D2DB35E78E73CA60DA v13;
  TSTLayoutCellIterator *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];

  v13 = -[TSTLayout editingSpillingTextRange](-[TSTTableRep tableLayout](self, "tableLayout"), "editingSpillingTextRange");
  v4 = [TSTLayoutCellIterator alloc];
  v5 = -[TSTTableRep masterLayout](self, "masterLayout");
  v14 = -[TSTLayoutCellIterator initWithMasterLayout:range:flags:](v4, "initWithMasterLayout:range:flags:", v5, -[TSTLayout editingSpillingTextRange](-[TSTTableRep tableLayout](self, "tableLayout"), "editingSpillingTextRange"), 128);
  while (TSTLayoutCellIteratorGetNextCell((uint64_t)v14, v19))
  {
    v6 = (TSDStroke *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (TSDStroke *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (TSDStroke *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (TSDStroke *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = WORD2(v19[0]);
    v11 = BYTE6(v19[0]);
    v17 = 0;
    v18 = 0;
    v15 = 0;
    v16 = 0;
    v12 = WORD2(v19[0]) | ((unint64_t)BYTE6(v19[0]) << 16) | ((unint64_t)HIBYTE(v19[0]) << 24);
    v2 = v12 | v2 & 0xFFFFFFFF00000000;
    TSTMasterLayoutGetStrokesForCellID(-[TSTTableRep masterLayout](self, "masterLayout"), v2, &v18, &v17, &v16, &v15);
    if (v18 && v10 != v13.var0.var0)
    {
      v6 = (TSDStroke *)(id)objc_msgSend(v18, "mutableCopy");
      -[TSDStroke setColor:](v6, "setColor:", -[TSUColor colorWithAlphaComponent:](-[TSDStroke color](v6, "color"), "colorWithAlphaComponent:", 0.100000001));
      -[TSDStroke setDontClearBackground:](v6, "setDontClearBackground:", 1);
    }
    if (v16 && v10 != (unsigned __int16)(v13.var0.var0 + v13.var1.var1 - 1))
    {
      v7 = (TSDStroke *)(id)objc_msgSend(v16, "mutableCopy");
      -[TSDStroke setColor:](v7, "setColor:", -[TSUColor colorWithAlphaComponent:](-[TSDStroke color](v7, "color"), "colorWithAlphaComponent:", 0.100000001));
      -[TSDStroke setDontClearBackground:](v7, "setDontClearBackground:", 1);
    }
    if (v17 && v11 != v13.var0.var1)
    {
      v8 = (TSDStroke *)(id)objc_msgSend(v17, "mutableCopy");
      -[TSDStroke setColor:](v8, "setColor:", -[TSUColor colorWithAlphaComponent:](-[TSDStroke color](v8, "color"), "colorWithAlphaComponent:", 0.100000001));
      -[TSDStroke setDontClearBackground:](v8, "setDontClearBackground:", 1);
    }
    if (v15 && v11 != (LOBYTE(v13.var1.var0) + v13.var0.var1 - 1))
    {
      v9 = (TSDStroke *)(id)objc_msgSend(v15, "mutableCopy");
      -[TSDStroke setColor:](v9, "setColor:", -[TSUColor colorWithAlphaComponent:](-[TSDStroke color](v9, "color"), "colorWithAlphaComponent:", 0.100000001));
      -[TSDStroke setDontClearBackground:](v9, "setDontClearBackground:", 1);
    }
    v5 = v12 | v5 & 0xFFFFFFFF00000000;
    TSTMasterLayoutSetStrokesForCellID(-[TSTTableRep masterLayout](self, "masterLayout"), v5, v6, v7, v9, v8);
  }
  TSTMasterLayoutSetStrokesValidForRange(-[TSTTableRep masterLayout](self, "masterLayout"), *(_QWORD *)&v13);

}

- (void)validateVisibleRect
{
  TSTLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TSTLayout validate](-[TSTTableRep tableLayout](self, "tableLayout"), "validate");
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
    -[TSDInteractiveCanvasController animatingViewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "animatingViewScale");
  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  -[TSTTableRep canvasVisibleRect](self, "canvasVisibleRect");
  TSTLayoutSetCanvasVisibleRect((uint64_t)v3, v4, v5, v6, v7);
  -[TSTTableRep p_frozenHeaderOverlayLayers](self, "p_frozenHeaderOverlayLayers");
  if (self->mOverlayTableName)
    -[TSTTableRep validateTableName](self, "validateTableName");
  if (self->mOverlayFrozenHeaderCorner)
    -[TSTTableRep validateFrozenHeaderCorner](self, "validateFrozenHeaderCorner");
  if (self->mOverlayFrozenHeaderRows)
    -[TSTTableRep validateFrozenHeaderRows](self, "validateFrozenHeaderRows");
  if (self->mOverlayFrozenHeaderColumns)
    -[TSTTableRep validateFrozenHeaderColumns](self, "validateFrozenHeaderColumns");
  if (self->mOverlayFrozenHeaderTableBodyMask)
    -[TSTTableRep validateFrozenHeaderTableBodyMask](self, "validateFrozenHeaderTableBodyMask");
}

- (BOOL)isFullyVisibleWithBorder:(int)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[TSTTableRep canvasVisibleRect](self, "canvasVisibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14.origin.x = TSTLayoutGetCanvasStrokeFrame(-[TSTTableRep tableLayout](self, "tableLayout"));
  v16 = CGRectInset(v14, (double)-a3, (double)-a3);
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  return CGRectContainsRect(v15, v16);
}

- (void)viewScaleDidChange
{
  objc_super v3;

  TSTLayoutInvalidateLayoutSpaceTableOffsets(-[TSTTableRep tableLayout](self, "tableLayout"));
  -[TSTTableChromeProvider invalidateAllChrome](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAllChrome");
  -[TSTTableChromeProvider invalidateAddressBarSelection](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAddressBarSelection");
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  -[TSDRep viewScaleDidChange](&v3, sel_viewScaleDidChange);
}

- (void)screenScaleDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTTableRep;
  -[TSDRep screenScaleDidChange](&v2, sel_screenScaleDidChange);
}

- (void)invalidateSelection
{
  TSDKnobTracker *mKnobTracker;

  -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
  mKnobTracker = self->super.super.mKnobTracker;
  if (!mKnobTracker || !-[TSDKnobTracker didBegin](mKnobTracker, "didBegin"))
    -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSTTableChromeProvider invalidateAddressBarSelection](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAddressBarSelection");
  -[TSTTableChromeProvider selectionHighlightLayerInvalidateDisplay](-[TSTTableRep tableChrome](self, "tableChrome"), "selectionHighlightLayerInvalidateDisplay");
}

- (void)invalidateCellRange:(id)a3
{
  -[TSTTableRep invalidateCellRange:fittingRange:invalidateSize:](self, "invalidateCellRange:fittingRange:invalidateSize:", a3, a3, 1);
}

- (void)invalidateCellRange:(id)a3 fittingRange:(id)a4 invalidateSize:(BOOL)a5
{
  _BOOL4 v5;
  TSTLayout *v8;

  v5 = a5;
  v8 = -[TSTTableRep tableLayout](self, "tableLayout");
  TSTLayoutInvalidateCellRangeAndFittingRange(v8);
  -[TSTTableRep dirtyCellRange:](self, "dirtyCellRange:", a3);
  if (v5)
  {
    -[TSTLayout invalidateSize](v8, "invalidateSize");
    -[TSTTableChromeProvider invalidateAllChrome](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAllChrome");
  }
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
    -[TSTTableRep invalidateSelection](self, "invalidateSelection");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  -[TSDRep setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[TSDTilingLayer setNeedsDisplay](self->mOverlayFrozenHeaderRows, "setNeedsDisplay");
  -[TSDTilingLayer setNeedsDisplay](self->mOverlayFrozenHeaderColumns, "setNeedsDisplay");
  -[TSDTilingLayer setNeedsDisplay](self->mOverlayFrozenHeaderCorner, "setNeedsDisplay");
  -[TSDTilingLayer setNeedsDisplay](self->mOverlayTableName, "setNeedsDisplay");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSTLayout *v8;
  uint64_t FrozenHeaderRowsSpace;
  uint64_t FrozenHeaderColumnsSpace;
  uint64_t FrozenHeaderCornerSpace;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double Frame;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  int v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  int v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  _BOOL4 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  TSDTilingLayer *mOverlayFrozenHeaderRows;
  TSDTilingLayer *mOverlayFrozenHeaderColumns;
  TSDTilingLayer *mOverlayFrozenHeaderCorner;
  CGFloat rect2;
  CGFloat v61;
  CGFloat v62;
  double r1;
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v64.receiver = self;
    v64.super_class = (Class)TSTTableRep;
    -[TSDRep setNeedsDisplayInRect:](&v64, sel_setNeedsDisplayInRect_, x, y, width, height);
    v8 = -[TSTTableRep tableLayout](self, "tableLayout");
    FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v8);
    FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v8);
    FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v8);
    v12 = -[TSTLayout newCanvasRevealedVertically](v8, "newCanvasRevealedVertically");
    -[TSTLayout setNewCanvasRevealedVertically:](v8, "setNewCanvasRevealedVertically:", 0);
    v13 = -[TSTLayout newCanvasRevealedHorizontally](v8, "newCanvasRevealedHorizontally");
    -[TSTLayout setNewCanvasRevealedHorizontally:](v8, "setNewCanvasRevealedHorizontally:", 0);
    -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
    v15 = v14;
    v17 = v16;
    r1 = v18;
    v20 = v19;
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", x, y, width, height);
    v61 = v22;
    v62 = v21;
    rect2 = v23;
    v25 = v24;
    if (!FrozenHeaderRowsSpace)
      goto LABEL_6;
    if (!self->mOverlayFrozenHeaderRows)
      goto LABEL_6;
    Frame = TSTLayoutSpaceGetFrame(FrozenHeaderRowsSpace);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[TSDTilingLayer frame](self->mOverlayFrozenHeaderRows, "frame");
    v73.origin.y = v61;
    v73.origin.x = v62;
    v73.size.width = rect2;
    v73.size.height = v25;
    if (CGRectIntersectsRect(v65, v73))
    {
      v66.origin.x = Frame;
      v66.origin.y = v28;
      v66.size.width = v30;
      v66.size.height = v32;
      v74.origin.x = v15;
      v74.origin.y = v17;
      v74.size.width = r1;
      v74.size.height = v20;
      v33 = !CGRectIntersectsRect(v66, v74);
    }
    else
    {
LABEL_6:
      v33 = 0;
    }
    if (FrozenHeaderColumnsSpace && self->mOverlayFrozenHeaderColumns)
    {
      v34 = v20;
      v35 = TSTLayoutSpaceGetFrame(FrozenHeaderColumnsSpace);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      -[TSDTilingLayer frame](self->mOverlayFrozenHeaderColumns, "frame");
      v75.origin.y = v61;
      v75.origin.x = v62;
      v75.size.width = rect2;
      v75.size.height = v25;
      if (CGRectIntersectsRect(v67, v75))
      {
        v68.origin.x = v35;
        v68.origin.y = v37;
        v68.size.width = v39;
        v68.size.height = v41;
        v76.origin.x = v15;
        v76.origin.y = v17;
        v76.size.width = r1;
        v20 = v34;
        v76.size.height = v34;
        v42 = !CGRectIntersectsRect(v68, v76);
      }
      else
      {
        v42 = 0;
        v20 = v34;
      }
    }
    else
    {
      v42 = 0;
    }
    if (FrozenHeaderCornerSpace && self->mOverlayFrozenHeaderCorner)
    {
      v43 = v20;
      v44 = TSTLayoutSpaceGetFrame(FrozenHeaderCornerSpace);
      v46 = v45;
      v48 = v47;
      v50 = v49;
      -[TSDTilingLayer frame](self->mOverlayFrozenHeaderCorner, "frame");
      v77.origin.y = v61;
      v77.origin.x = v62;
      v77.size.width = rect2;
      v77.size.height = v25;
      if (CGRectIntersectsRect(v69, v77))
      {
        v70.origin.x = v44;
        v70.origin.y = v46;
        v70.size.width = v48;
        v70.size.height = v50;
        v78.origin.x = v15;
        v78.origin.y = v17;
        v78.size.width = r1;
        v20 = v43;
        v78.size.height = v43;
        v51 = CGRectIntersectsRect(v70, v78);
        v33 |= !v51;
        v42 |= !v51;
      }
      else
      {
        v20 = v43;
      }
    }
    v52 = -0.0;
    if (v12 | v42)
      v53 = v15;
    else
      v53 = -0.0;
    if (v12 | v42)
      v54 = 0.0;
    else
      v54 = v15;
    if (v13 | v33)
      v52 = v17;
    v55 = v20 + v52;
    if (v13 | v33)
      v56 = 0.0;
    else
      v56 = v17;
    if (FrozenHeaderRowsSpace)
    {
      mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
      if (mOverlayFrozenHeaderRows)
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", v15, v56, r1, v55);
    }
    if (FrozenHeaderColumnsSpace)
    {
      mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
      if (mOverlayFrozenHeaderColumns)
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderColumns, "setNeedsDisplayInRect:", v54, v17, r1 + v53, v20);
    }
    if (FrozenHeaderCornerSpace)
    {
      mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
      if (mOverlayFrozenHeaderCorner)
      {
        v71.origin.x = v15;
        v71.origin.y = v56;
        v71.size.width = r1;
        v71.size.height = v55;
        v79.origin.x = v54;
        v79.origin.y = v17;
        v79.size.width = r1 + v53;
        v79.size.height = v20;
        v72 = CGRectUnion(v71, v79);
        -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderCorner, "setNeedsDisplayInRect:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
      }
    }
  }
}

- (void)setNeedsDisplayInCellRange:(id)a3
{
  TSTLayoutSpaceBundle *v5;
  _QWORD v6[6];

  v5 = -[TSTLayout spaceBundle](-[TSTTableRep tableLayout](self, "tableLayout"), "spaceBundle");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__TSTTableRep_setNeedsDisplayInCellRange___block_invoke;
  v6[3] = &unk_24D82EF78;
  v6[4] = self;
  v6[5] = a3;
  -[TSTLayoutSpaceBundle performActionOnEachLayoutSpace:](v5, "performActionOnEachLayoutSpace:", v6);
}

uint64_t __42__TSTTableRep_setNeedsDisplayInCellRange___block_invoke(uint64_t a1, TSTLayoutSpace *a2)
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double FrameForRange;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t Range;
  unint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double MaxX;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  CGRect rect;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = TSTLayoutSpaceIntersectionCellRange((uint64_t)a2, *(_QWORD *)(a1 + 40));
  v5 = v4;
  if ((_WORD)v4 != 0xFFFF)
  {
    v6 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
    if (!v6 && (v4 & 0xFFFF00000000) != 0)
    {
      v44.origin.x = TSTLayoutSpaceGetStrokeFrame((uint64_t)a2);
      v45 = CGRectInset(v44, -1000.0, -1000.0);
      x = v45.origin.x;
      y = v45.origin.y;
      width = v45.size.width;
      height = v45.size.height;
      FrameForRange = TSTLayoutSpaceGetFrameForRange(a2, v5);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      Range = TSTLayoutSpaceGetRange((uint64_t)a2);
      v21 = Range;
      v22 = *(_QWORD *)(a1 + 40);
      v23 = -0.0;
      if (BYTE2(v22) == BYTE2(Range))
        v23 = FrameForRange;
      v24 = v17 + v23;
      if (BYTE2(v22) == BYTE2(Range))
        FrameForRange = 0.0;
      if ((BYTE4(v22) + BYTE2(v22) - 1) >= (BYTE4(Range)
                                                                                           + BYTE2(Range)
                                                                                           - 1))
      {
        v46.origin.x = FrameForRange;
        v46.origin.y = v15;
        v46.size.width = v24;
        v46.size.height = v19;
        MaxX = CGRectGetMaxX(v46);
        v47.origin.x = x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        v24 = MaxX - CGRectGetMinX(v47);
        v22 = *(_QWORD *)(a1 + 40);
      }
      v26 = -0.0;
      if ((unsigned __int16)v22 == (unsigned __int16)v21)
        v26 = v15;
      v27 = v19 + v26;
      if ((unsigned __int16)v22 == (unsigned __int16)v21)
        v15 = 0.0;
      if ((unsigned __int16)(v22 + HIWORD(v22) - 1) >= (unsigned __int16)(v21 + HIWORD(v21) - 1))
      {
        v28 = FrameForRange;
        v29 = v15;
        v30 = v24;
        MaxY = CGRectGetMaxY(*(CGRect *)(&v27 - 3));
        v48.origin.x = x;
        v48.origin.y = y;
        v48.size.width = width;
        v48.size.height = height;
        v27 = MaxY - CGRectGetMinY(v48);
      }
      objc_msgSend(*(id *)(a1 + 32), "convertNaturalRectToLayerRelative:", FrameForRange, v15, v24, v27);
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      if (-[TSTLayoutSpace isFrozen](a2, "isFrozen"))
      {
        if (-[TSTLayoutSpace isColumns](a2, "isColumns"))
        {
          v40 = *(_QWORD *)(a1 + 32);
          v41 = 400;
        }
        else
        {
          v42 = -[TSTLayoutSpace isRows](a2, "isRows");
          v40 = *(_QWORD *)(a1 + 32);
          if (v42)
            v41 = 392;
          else
            v41 = 384;
        }
        objc_msgSend(*(id *)(v40 + v41), "setNeedsDisplayInRect:", v33, v35, v37, v39);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "convertNaturalRectFromLayerRelative:", v33, v35, v37, v39);
        rect.origin.y = *(CGFloat *)(a1 + 32);
        *(_QWORD *)&rect.size.width = TSTTableRep;
        -[CGFloat setNeedsDisplayInRect:]((objc_super *)&rect.origin.y, sel_setNeedsDisplayInRect_);
      }
    }
  }
  return 0;
}

- (void)dirtyCellRange:(id)a3
{
  self->mDirtyCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(_QWORD *)&self->mDirtyCellRange, *(_QWORD *)&a3);
}

- (void)p_invalidateCellCommentBadges
{
  if (TSTTableNumberOfComments(-[TSTTableRep tableModel](self, "tableModel")))
    -[TSTTableRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)invalidateAnnotationColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  -[TSDRep invalidateAnnotationColor](&v3, sel_invalidateAnnotationColor);
  -[TSTTableRep p_invalidateCellCommentBadges](self, "p_invalidateCellCommentBadges");
}

- (void)invalidateComments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  -[TSDRep invalidateComments](&v3, sel_invalidateComments);
  -[TSTTableRep p_invalidateCellCommentBadges](self, "p_invalidateCellCommentBadges");
}

- (void)orientationDidChange:(id)a3
{
  -[TSDCanvas layoutInvalidated](-[TSDRep canvas](self, "canvas", a3), "layoutInvalidated");
  -[TSTTableChromeProvider invalidateAllChrome](-[TSTTableRep tableChrome](self, "tableChrome"), "invalidateAllChrome");
}

- (TSTAnimation)currentAnimation
{
  return (TSTAnimation *)-[NSMutableArray lastObject](self->mAnimationStack, "lastObject");
}

- (void)pushAnimation:(id)a3
{
  -[NSMutableArray push_tsu:](self->mAnimationStack, "push_tsu:", a3);
}

- (void)popAnimation
{
  -[NSMutableArray pop_tsu](self->mAnimationStack, "pop_tsu");
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  TSTLayoutSpace *FrozenHeaderCornerSpace;

  if (self->mOverlayTableName == a3)
  {
    TSTTableRepDrawTableName(self, a4, 0);
    return;
  }
  if (self->mOverlayFrozenHeaderCorner == a3)
  {
    FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderCornerSpace(-[TSTTableRep tableLayout](self, "tableLayout"));
LABEL_10:
    TSTTableRepDrawFrozenHeaderRegion(self, FrozenHeaderCornerSpace, (CALayer *)a3, a4);
    return;
  }
  if (self->mOverlayFrozenHeaderColumns == a3)
  {
    FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderColumnsSpace(-[TSTTableRep tableLayout](self, "tableLayout"));
    goto LABEL_10;
  }
  if (self->mOverlayFrozenHeaderRows == a3)
  {
    FrozenHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetFrozenHeaderRowsSpace(-[TSTTableRep tableLayout](self, "tableLayout"));
    goto LABEL_10;
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("delegate")) & 1) != 0)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)overlayLayers
{
  return 0;
}

- (id)additionalLayersOverLayer
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[TSKHighlightArrayController layers](-[TSWPTextHostRep highlightArrayController](self, "highlightArrayController"), "layers");
  if (-[NSArray count](v4, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          objc_msgSend(v9, "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
          objc_msgSend(v9, "setZPosition:", 0.0);
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  }
  v10 = -[TSKHighlightArrayController layers](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "layers");
  if (-[NSArray count](v10, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_msgSend(v15, "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
          objc_msgSend(v15, "setZPosition:", 0.0);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }
    objc_msgSend(v3, "addObjectsFromArray:", v10);
  }
  objc_msgSend(v3, "addObjectsFromArray:", -[TSTTableRep p_tableNameOverlayLayers](self, "p_tableNameOverlayLayers"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSTTableRep p_frozenHeaderOverlayLayers](self, "p_frozenHeaderOverlayLayers"));
  return v3;
}

- (id)additionalLayersUnderLayer
{
  return 0;
}

- (id)p_tableNameOverlayLayers
{
  void *v3;
  TSTLayout *v4;
  TSDTilingLayer *mOverlayTableName;
  TSDTilingLayer *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[TSTTableRep tableLayout](self, "tableLayout");
  if (TSTLayoutGetTableNameVisible((uint64_t)v4)
    && TSTLayoutIsPartitionAlongLeft(v4)
    && !-[TSTLayout inPrintPreviewMode](v4, "inPrintPreviewMode"))
  {
    if (self->mOverlayTableName)
      goto LABEL_9;
    v7 = objc_alloc_init(TSDTilingLayer);
    self->mOverlayTableName = v7;
    -[TSDTilingLayer setName:](v7, "setName:", CFSTR("mOverlayTableName"));
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    -[TSDTilingLayer setContentsScale:](self->mOverlayTableName, "setContentsScale:");
    -[TSDTilingLayer setDrawsInBackground:](self->mOverlayTableName, "setDrawsInBackground:", -[TSTTableRep canDrawInBackgroundDuringScroll](self, "canDrawInBackgroundDuringScroll"));
    -[TSDTilingLayer setDelegate:](self->mOverlayTableName, "setDelegate:", self);
    -[TSTTableRep invalidateTableName](self, "invalidateTableName");
    -[TSTTableRep validateTableName](self, "validateTableName");
    if (self->mOverlayTableName)
LABEL_9:
      objc_msgSend(v3, "addObject:");
  }
  else
  {
    mOverlayTableName = self->mOverlayTableName;
    if (mOverlayTableName)
    {
      -[TSDTilingLayer setDelegate:](mOverlayTableName, "setDelegate:", 0);

      self->mOverlayTableName = 0;
    }
  }
  return v3;
}

- (void)validateTableName
{
  TSTLayout *v3;
  TSDTilingLayer *mOverlayTableName;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double height;
  void *FrozenHeaderRowsSpace;
  double RenderingFrame;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  _QWORD rect1[7];
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  mOverlayTableName = self->mOverlayTableName;
  -[TSDTilingLayer bounds](mOverlayTableName, "bounds");
  rect1[0] = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  TSTLayoutGetFrame(v3);
  height = v12;
  if (self->mOverlayFrozenHeaderRows)
    FrozenHeaderRowsSpace = (void *)TSTLayoutGetFrozenHeaderRowsSpace(v3);
  else
    FrozenHeaderRowsSpace = (void *)TSTLayoutGetSpace(v3);
  RenderingFrame = TSTLayoutGetRenderingFrame(v3, FrozenHeaderRowsSpace);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (v3)
    -[TSDAbstractLayout transform](v3, "transform");
  else
    memset(&v46, 0, sizeof(v46));
  v47.origin.x = RenderingFrame;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  v48 = CGRectApplyAffineTransform(v47, &v46);
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  if (self->mOverlayFrozenHeaderRows && TSTLayoutGetFrozenHeaderRowsFloating(v3))
  {
    memset(&v45, 0, sizeof(v45));
    TSTLayoutGetFrozenTableNameTransformToLayout(v3, &v45);
    *(CGAffineTransform *)&rect1[1] = v45;
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v50 = CGRectApplyAffineTransform(v49, (CGAffineTransform *)&rect1[1]);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
  }
  -[TSDCanvas convertUnscaledToBoundsRect:](-[TSDRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", x, y, width, height);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v34 = TSDRoundedRectForScale(v26, v28, v30, v32, v33);
  v36 = v35;
  v38 = TSDCeilSize(v37);
  -[TSDTilingLayer setFrame:](mOverlayTableName, "setFrame:", v34, v36, v38, v39);
  -[TSDTilingLayer bounds](mOverlayTableName, "bounds");
  v52.origin.x = v40;
  v52.origin.y = v41;
  v52.size.width = v42;
  v52.size.height = v43;
  *(_QWORD *)&v51.origin.x = rect1[0];
  v51.origin.y = v7;
  v51.size.width = v9;
  v51.size.height = v11;
  if (!CGRectEqualToRect(v51, v52))
    -[TSTTableRep invalidateTableName](self, "invalidateTableName");
}

- (id)p_frozenHeaderOverlayLayers
{
  void *v3;
  TSTLayout *v4;
  uint64_t FrozenHeaderColumnsSpace;
  uint64_t FrozenHeaderRowsSpace;
  uint64_t FrozenHeaderCornerSpace;
  TSDTilingLayer *v8;
  int FrozenHeaderRowsFloating;
  TSDTilingLayer *mOverlayFrozenHeaderRows;
  TSDTilingLayer *v11;
  TSDTilingLayer *v12;
  int FrozenHeaderColumnsFloating;
  TSDTilingLayer *mOverlayFrozenHeaderColumns;
  TSDTilingLayer *v15;
  CALayer *v16;
  CALayer *v17;
  double v18;
  double v19;
  CALayer *v20;
  CALayer *v21;
  TSDTilingLayer *mOverlayFrozenHeaderCorner;
  TSDTilingLayer *v23;
  _BOOL8 v24;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[TSTTableRep tableLayout](self, "tableLayout");
  FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v4);
  FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v4);
  FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v4);
  if (FrozenHeaderRowsSpace
    && -[TSTTableModel numberOfHeaderRows](-[TSTLayout tableModel](v4, "tableModel"), "numberOfHeaderRows"))
  {
    if (!self->mOverlayFrozenHeaderRows)
    {
      v8 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderRows = v8;
      -[TSDTilingLayer setDelegate:](v8, "setDelegate:", self);
      -[TSDTilingLayer setZPosition:](self->mOverlayFrozenHeaderRows, "setZPosition:", 0.0);
      -[TSDTilingLayer setDrawsInBackground:](self->mOverlayFrozenHeaderRows, "setDrawsInBackground:", -[TSTTableRep canDrawInBackgroundDuringScroll](self, "canDrawInBackgroundDuringScroll"));
      -[TSDTilingLayer setTilingMode:](self->mOverlayFrozenHeaderRows, "setTilingMode:", -[TSTTableRep tilingMode](self, "tilingMode"));
      -[TSDTilingLayer setHidden:](self->mOverlayFrozenHeaderRows, "setHidden:", 1);
      -[TSTTableRep validateFrozenHeaderRows](self, "validateFrozenHeaderRows");
      -[TSDTilingLayer setNeedsDisplayInRect:](self->mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
    }
    FrozenHeaderRowsFloating = TSTLayoutGetFrozenHeaderRowsFloating(v4);
    mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
    if (FrozenHeaderRowsFloating)
    {
      -[TSDTilingLayer setHidden:](mOverlayFrozenHeaderRows, "setHidden:", 0);
      if (!self->mOverlayFrozenHeaderRowsMask)
      {
        self->mOverlayFrozenHeaderRowsMask = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
        -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
        -[CALayer setContentsScale:](self->mOverlayFrozenHeaderRowsMask, "setContentsScale:");
        -[CALayer setDelegate:](self->mOverlayFrozenHeaderRowsMask, "setDelegate:", self);
        -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderRowsMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "greenColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
        -[TSDTilingLayer setMask:](self->mOverlayFrozenHeaderRows, "setMask:", self->mOverlayFrozenHeaderRowsMask);
        -[TSTTableRep validateFrozenHeaderRows](self, "validateFrozenHeaderRows");
      }
    }
    else
    {
      -[TSDTilingLayer setHidden:](mOverlayFrozenHeaderRows, "setHidden:", 1);
      -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderRowsMask, "removeFromSuperlayer");
      -[CALayer setDelegate:](self->mOverlayFrozenHeaderRowsMask, "setDelegate:", 0);

      self->mOverlayFrozenHeaderRowsMask = 0;
      -[TSDTilingLayer setMask:](self->mOverlayFrozenHeaderRows, "setMask:", 0);
    }
    objc_msgSend(v3, "addObject:", self->mOverlayFrozenHeaderRows);
    if (!FrozenHeaderColumnsSpace)
      goto LABEL_20;
  }
  else
  {
    v11 = self->mOverlayFrozenHeaderRows;
    if (v11)
    {
      -[TSDTilingLayer setDelegate:](v11, "setDelegate:", 0);

      self->mOverlayFrozenHeaderRows = 0;
      -[TSDTilingLayer setDelegate:](self->mOverlayFrozenHeaderCorner, "setDelegate:", 0);

      self->mOverlayFrozenHeaderCorner = 0;
      -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderRowsMask, "removeFromSuperlayer");
      -[CALayer setDelegate:](self->mOverlayFrozenHeaderRowsMask, "setDelegate:", 0);

      self->mOverlayFrozenHeaderRowsMask = 0;
    }
    if (!FrozenHeaderColumnsSpace)
      goto LABEL_20;
  }
  if (-[TSTTableModel numberOfHeaderColumns](-[TSTLayout tableModel](v4, "tableModel"), "numberOfHeaderColumns"))
  {
    if (!self->mOverlayFrozenHeaderColumns)
    {
      v12 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderColumns = v12;
      -[TSDTilingLayer setDelegate:](v12, "setDelegate:", self);
      -[TSDTilingLayer setZPosition:](self->mOverlayFrozenHeaderColumns, "setZPosition:", 0.0);
      -[TSDTilingLayer setDrawsInBackground:](self->mOverlayFrozenHeaderColumns, "setDrawsInBackground:", -[TSTTableRep canDrawInBackgroundDuringScroll](self, "canDrawInBackgroundDuringScroll"));
      -[TSDTilingLayer setTilingMode:](self->mOverlayFrozenHeaderColumns, "setTilingMode:", -[TSTTableRep tilingMode](self, "tilingMode"));
      -[TSDTilingLayer setHidden:](self->mOverlayFrozenHeaderColumns, "setHidden:", 1);
      -[TSTTableRep validateFrozenHeaderColumns](self, "validateFrozenHeaderColumns");
      -[TSDTilingLayer setNeedsDisplay](self->mOverlayFrozenHeaderColumns, "setNeedsDisplay");
    }
    FrozenHeaderColumnsFloating = TSTLayoutGetFrozenHeaderColumnsFloating(v4);
    mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
    if (FrozenHeaderColumnsFloating)
    {
      -[TSDTilingLayer setHidden:](mOverlayFrozenHeaderColumns, "setHidden:", 0);
      if (!self->mOverlayFrozenHeaderColumnsMask)
      {
        self->mOverlayFrozenHeaderColumnsMask = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
        -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
        -[CALayer setContentsScale:](self->mOverlayFrozenHeaderColumnsMask, "setContentsScale:");
        -[CALayer setDelegate:](self->mOverlayFrozenHeaderColumnsMask, "setDelegate:", self);
        -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderColumnsMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blueColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
        -[TSDTilingLayer setMask:](self->mOverlayFrozenHeaderColumns, "setMask:", self->mOverlayFrozenHeaderColumnsMask);
        -[TSTTableRep validateFrozenHeaderColumns](self, "validateFrozenHeaderColumns");
      }
    }
    else
    {
      -[TSDTilingLayer setHidden:](mOverlayFrozenHeaderColumns, "setHidden:", 1);
      -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderColumnsMask, "removeFromSuperlayer");
      -[CALayer setDelegate:](self->mOverlayFrozenHeaderColumnsMask, "setDelegate:", 0);

      self->mOverlayFrozenHeaderColumnsMask = 0;
      -[TSDTilingLayer setMask:](self->mOverlayFrozenHeaderColumns, "setMask:", 0);
    }
    if (self->mOverlayFrozenHeaderColumns)
      objc_msgSend(v3, "addObject:");
    goto LABEL_25;
  }
LABEL_20:
  v15 = self->mOverlayFrozenHeaderColumns;
  if (v15)
  {
    -[TSDTilingLayer setDelegate:](v15, "setDelegate:", 0);

    self->mOverlayFrozenHeaderColumns = 0;
    -[TSDTilingLayer setDelegate:](self->mOverlayFrozenHeaderCorner, "setDelegate:", 0);

    self->mOverlayFrozenHeaderCorner = 0;
    -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderColumnsMask, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderColumnsMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderColumnsMask = 0;
    -[TSDTilingLayer setMask:](self->mOverlayFrozenHeaderColumns, "setMask:", 0);
  }
LABEL_25:
  if (FrozenHeaderRowsSpace && (TSTLayoutGetFrozenHeaderRowsFloating(v4) & 1) != 0
    || FrozenHeaderColumnsSpace && TSTLayoutGetFrozenHeaderColumnsFloating(v4))
  {
    v16 = -[TSTTableRep layerForRep](self, "layerForRep");
    v17 = v16;
    if (self->mOverlayFrozenHeaderTableBodyMask)
    {
      if (v16 && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
        -[CALayer setMask:](v17, "setMask:", self->mOverlayFrozenHeaderTableBodyMask);
    }
    else
    {
      -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
      v19 = v18;
      v20 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      self->mOverlayFrozenHeaderTableBodyMask = v20;
      -[CALayer setDelegate:](v20, "setDelegate:", self);
      -[CALayer setContentsScale:](self->mOverlayFrozenHeaderTableBodyMask, "setContentsScale:", v19);
      -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderTableBodyMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "redColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
      v21 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      self->mOverlayFrozenHeaderTableNameMask = v21;
      -[CALayer setDelegate:](v21, "setDelegate:", self);
      -[CALayer setContentsScale:](self->mOverlayFrozenHeaderTableNameMask, "setContentsScale:", v19);
      -[CALayer setBackgroundColor:](self->mOverlayFrozenHeaderTableNameMask, "setBackgroundColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "orangeColor"), "colorWithAlphaComponent:", 1.0), "CGColor"));
      -[CALayer addSublayer:](self->mOverlayFrozenHeaderTableBodyMask, "addSublayer:", self->mOverlayFrozenHeaderTableNameMask);
      if (v17 && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
        -[CALayer setMask:](v17, "setMask:", self->mOverlayFrozenHeaderTableBodyMask);
      -[TSTTableRep validateFrozenHeaderTableBodyMask](self, "validateFrozenHeaderTableBodyMask");
    }
  }
  else if (self->mOverlayFrozenHeaderTableBodyMask)
  {
    -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderTableNameMask, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderTableNameMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderTableNameMask = 0;
    -[CALayer removeFromSuperlayer](self->mOverlayFrozenHeaderTableBodyMask, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->mOverlayFrozenHeaderTableBodyMask, "setDelegate:", 0);

    self->mOverlayFrozenHeaderTableBodyMask = 0;
  }
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  if (FrozenHeaderCornerSpace)
  {
    if (!mOverlayFrozenHeaderCorner)
    {
      v23 = objc_alloc_init(TSDTilingLayer);
      self->mOverlayFrozenHeaderCorner = v23;
      -[TSDTilingLayer setDelegate:](v23, "setDelegate:", self);
      -[TSDTilingLayer setDrawsInBackground:](self->mOverlayFrozenHeaderCorner, "setDrawsInBackground:", -[TSTTableRep canDrawInBackgroundDuringScroll](self, "canDrawInBackgroundDuringScroll"));
      -[TSDTilingLayer setZPosition:](self->mOverlayFrozenHeaderCorner, "setZPosition:", 0.0);
      -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
      -[TSDTilingLayer setContentsScale:](self->mOverlayFrozenHeaderCorner, "setContentsScale:");
      -[TSDTilingLayer setHidden:](self->mOverlayFrozenHeaderCorner, "setHidden:", 1);
      -[TSTTableRep validateFrozenHeaderCorner](self, "validateFrozenHeaderCorner");
      -[TSDTilingLayer setNeedsDisplay](self->mOverlayFrozenHeaderCorner, "setNeedsDisplay");
    }
    v24 = !TSTLayoutGetFrozenHeaderRowsFloating(v4)
       || (TSTLayoutGetFrozenHeaderColumnsFloating(v4) & 1) == 0;
    -[TSDTilingLayer setHidden:](self->mOverlayFrozenHeaderCorner, "setHidden:", v24);
    objc_msgSend(v3, "addObject:", self->mOverlayFrozenHeaderCorner);
  }
  else if (mOverlayFrozenHeaderCorner)
  {
    -[TSDTilingLayer setDelegate:](mOverlayFrozenHeaderCorner, "setDelegate:", 0);

    self->mOverlayFrozenHeaderCorner = 0;
  }
  return v3;
}

- (CGRect)p_alignedLayerFrameForLayoutSpace:(id)a3 transform:(CGAffineTransform *)a4
{
  double RenderingFrame;
  double v8;
  double v9;
  double v10;
  double CanvasRectForLayoutRect;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect result;

  RenderingFrame = TSTLayoutGetRenderingFrame(-[TSTTableRep tableLayout](self, "tableLayout"), a3);
  CanvasRectForLayoutRect = TSTLayoutSpaceGetCanvasRectForLayoutRect((uint64_t)a3, RenderingFrame, v8, v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[TSDCanvas convertUnscaledToBoundsRect:](-[TSDRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", CanvasRectForLayoutRect, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  TSDRoundedRectForScale(v19, v21, v23, v25, v26);
  v28 = TSDCeilSize(v27);
  v30 = v29;
  v31 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v48.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v48.c = v31;
  *(_OWORD *)&v48.tx = *(_OWORD *)&a4->tx;
  v32 = CanvasRectForLayoutRect;
  *(double *)&v31 = v13;
  v33 = v15;
  v34 = v17;
  v49 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v31 - 8), &v48);
  -[TSDCanvas convertUnscaledToBoundsRect:](-[TSDRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v44 = TSDRoundedRectForScale(v36, v38, v40, v42, v43);
  v46 = v30 + 6.0;
  v47 = v28 + 6.0;
  result.size.height = v46;
  result.size.width = v47;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)validateFrozenHeaderCorner
{
  TSTLayout *v3;
  TSDTilingLayer *mOverlayFrozenHeaderCorner;
  uint64_t FrozenHeaderCornerSpace;
  uint64_t v6;
  uint64_t GridRange;
  unsigned int v8;
  unsigned int v9;
  _BYTE v10[48];

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
  FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v3);
  if (FrozenHeaderCornerSpace)
  {
    if (mOverlayFrozenHeaderCorner)
    {
      v6 = FrozenHeaderCornerSpace;
      GridRange = TSTLayoutSpaceGetGridRange(FrozenHeaderCornerSpace);
      if ((_DWORD)GridRange != -1
        && v8 != -1
        && GridRange <= v8
        && HIDWORD(GridRange) != -1
        && v9 != -1
        && HIDWORD(GridRange) <= v9)
      {
        TSTLayoutGetFrozenHeaderCornerTransformToLayout(v3, (uint64_t)v10);
        -[TSTTableRep p_alignedLayerFrameForLayoutSpace:transform:](self, "p_alignedLayerFrameForLayoutSpace:transform:", v6, v10);
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderCorner, "setFrame:");
      }
    }
  }
}

- (void)validateFrozenHeaderRows
{
  TSTLayout *v3;
  TSDTilingLayer *mOverlayFrozenHeaderRows;
  CALayer *mOverlayFrozenHeaderRowsMask;
  uint64_t FrozenHeaderRowsSpace;
  void *v7;
  uint64_t GridRange;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17[2];
  _BYTE v18[48];
  CGRect v19;
  CGRect v20;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
  mOverlayFrozenHeaderRowsMask = self->mOverlayFrozenHeaderRowsMask;
  FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
  if (FrozenHeaderRowsSpace)
  {
    if (mOverlayFrozenHeaderRows)
    {
      v7 = (void *)FrozenHeaderRowsSpace;
      GridRange = TSTLayoutSpaceGetGridRange(FrozenHeaderRowsSpace);
      if ((_DWORD)GridRange != -1
        && v9 != -1
        && GridRange <= v9
        && HIDWORD(GridRange) != -1
        && v10 != -1
        && HIDWORD(GridRange) <= v10)
      {
        TSTLayoutGetFrozenHeaderRowsTransformToLayout(v3, (uint64_t)v18);
        -[TSTTableRep p_alignedLayerFrameForLayoutSpace:transform:](self, "p_alignedLayerFrameForLayoutSpace:transform:", v7, v18);
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderRows, "setFrame:");
        if (mOverlayFrozenHeaderRowsMask)
        {
          -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
          v12 = v11;
          memset(&v17[1], 0, sizeof(CGAffineTransform));
          objc_msgSend(v7, "transformToDevice");
          v19.origin.x = TSTLayoutGetAlignedMaskRectForSpace(v3, v7);
          v17[0] = v17[1];
          v20 = CGRectApplyAffineTransform(v19, v17);
          v13 = TSDMultiplyRectScalar(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 1.0 / v12);
          -[CALayer setFrame:](mOverlayFrozenHeaderRowsMask, "setFrame:", TSDRoundedRectForScale(v13, v14, v15, v16, v12));
        }
      }
    }
  }
}

- (void)validateFrozenHeaderColumns
{
  TSTLayout *v3;
  TSDTilingLayer *mOverlayFrozenHeaderColumns;
  CALayer *mOverlayFrozenHeaderColumnsMask;
  uint64_t FrozenHeaderColumnsSpace;
  void *v7;
  uint64_t GridRange;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17[2];
  _BYTE v18[48];
  CGRect v19;
  CGRect v20;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
  mOverlayFrozenHeaderColumnsMask = self->mOverlayFrozenHeaderColumnsMask;
  FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
  if (FrozenHeaderColumnsSpace)
  {
    if (mOverlayFrozenHeaderColumns)
    {
      v7 = (void *)FrozenHeaderColumnsSpace;
      GridRange = TSTLayoutSpaceGetGridRange(FrozenHeaderColumnsSpace);
      if ((_DWORD)GridRange != -1
        && v9 != -1
        && GridRange <= v9
        && HIDWORD(GridRange) != -1
        && v10 != -1
        && HIDWORD(GridRange) <= v10)
      {
        TSTLayoutGetFrozenHeaderColumnsTransformToLayout(v3, (uint64_t)v18);
        -[TSTTableRep p_alignedLayerFrameForLayoutSpace:transform:](self, "p_alignedLayerFrameForLayoutSpace:transform:", v7, v18);
        -[TSDTilingLayer setFrame:](mOverlayFrozenHeaderColumns, "setFrame:");
        if (mOverlayFrozenHeaderColumnsMask)
        {
          -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
          v12 = v11;
          memset(&v17[1], 0, sizeof(CGAffineTransform));
          objc_msgSend(v7, "transformToDevice");
          v19.origin.x = TSTLayoutGetAlignedMaskRectForSpace(v3, v7);
          v17[0] = v17[1];
          v20 = CGRectApplyAffineTransform(v19, v17);
          v13 = TSDMultiplyRectScalar(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 1.0 / v12);
          -[CALayer setFrame:](mOverlayFrozenHeaderColumnsMask, "setFrame:", TSDRoundedRectForScale(v13, v14, v15, v16, v12));
        }
      }
    }
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableRep;
  -[TSWPTextHostRep addAdditionalChildLayersToArray:](&v3, sel_addAdditionalChildLayersToArray_, a3);
}

- (void)validateFrozenHeaderTableBodyMask
{
  TSTLayout *v3;
  uint64_t Space;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double x;
  double y;
  double v14;
  double v15;
  double width;
  double height;
  uint64_t FrozenHeaderRowsSpace;
  uint64_t FrozenHeaderColumnsSpace;
  BOOL v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  Space = TSTLayoutGetSpace(v3);
  if (Space && self->mOverlayFrozenHeaderTableBodyMask)
  {
    v5 = (void *)Space;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v7 = v6;
    memset(&v34, 0, sizeof(v34));
    objc_msgSend(v5, "transformToDevice");
    v35.origin.x = TSTLayoutGetAlignedMaskRectForSpace(v3, v5);
    v33 = v34;
    v36 = CGRectApplyAffineTransform(v35, &v33);
    v8 = TSDMultiplyRectScalar(v36.origin.x, v36.origin.y, v36.size.width, v36.size.height, 1.0 / v7);
    v37.origin.x = TSDRoundedRectForScale(v8, v9, v10, v11, v7);
    x = v37.origin.x;
    y = v37.origin.y;
    v38 = CGRectInset(v37, -50.0, -100.0);
    v14 = v38.origin.x;
    v15 = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
    FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
    if (FrozenHeaderColumnsSpace)
      v20 = FrozenHeaderRowsSpace == 0;
    else
      v20 = 0;
    if (v20)
      v21 = v15;
    else
      v21 = y;
    if (FrozenHeaderRowsSpace != 0 && FrozenHeaderColumnsSpace == 0)
      x = v14;
    else
      y = v21;
    -[CALayer setFrame:](self->mOverlayFrozenHeaderTableBodyMask, "setFrame:", x, y, width, height);
    if (TSTLayoutGetTableNameVisible((uint64_t)v3)
      && -[TSTEditingState editingMode](-[TSTTableRep editingState](self, "editingState"), "editingMode") == 7)
    {
      v39.origin.x = TSTLayoutGetAlignedStrokeFrame(v3);
      v39.size.height = v22;
      v32 = v34;
      v39.origin.y = 0.0;
      v40 = CGRectApplyAffineTransform(v39, &v32);
      v23 = TSDMultiplyRectScalar(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, 1.0 / v7);
      v27 = TSDRoundedRectForScale(v23, v24, v25, v26, v7) - x;
      v31 = v30 - y;
    }
    else
    {
      v27 = *MEMORY[0x24BDBF090];
      v31 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v28 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    -[CALayer setFrame:](self->mOverlayFrozenHeaderTableNameMask, "setFrame:", v27, v31, v28, v29);
  }
}

- (void)invalidateFrozenHeaders
{
  TSTLayout *v3;
  uint64_t FrozenHeaderRowsSpace;
  uint64_t FrozenHeaderColumnsSpace;
  uint64_t FrozenHeaderCornerSpace;
  TSDTilingLayer *mOverlayFrozenHeaderRows;
  TSDTilingLayer *mOverlayFrozenHeaderColumns;
  TSDTilingLayer *mOverlayFrozenHeaderCorner;

  v3 = -[TSTTableRep tableLayout](self, "tableLayout");
  FrozenHeaderRowsSpace = TSTLayoutGetFrozenHeaderRowsSpace(v3);
  FrozenHeaderColumnsSpace = TSTLayoutGetFrozenHeaderColumnsSpace(v3);
  FrozenHeaderCornerSpace = TSTLayoutGetFrozenHeaderCornerSpace(v3);
  if (FrozenHeaderRowsSpace)
  {
    mOverlayFrozenHeaderRows = self->mOverlayFrozenHeaderRows;
    if (mOverlayFrozenHeaderRows)
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderRows, "setNeedsDisplayInRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  }
  if (FrozenHeaderColumnsSpace)
  {
    mOverlayFrozenHeaderColumns = self->mOverlayFrozenHeaderColumns;
    if (mOverlayFrozenHeaderColumns)
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderColumns, "setNeedsDisplayInRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  }
  if (FrozenHeaderCornerSpace)
  {
    mOverlayFrozenHeaderCorner = self->mOverlayFrozenHeaderCorner;
    if (mOverlayFrozenHeaderCorner)
      -[TSDTilingLayer setNeedsDisplayInRect:](mOverlayFrozenHeaderCorner, "setNeedsDisplayInRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  }
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableRep;
  v4 = -[TSDRep canDrawTilingLayerInBackground:](&v6, sel_canDrawTilingLayerInBackground_, a3);
  if (v4)
    LOBYTE(v4) = !-[TSTTableRep mustDrawOnMainThreadForInteractiveCanvas](self, "mustDrawOnMainThreadForInteractiveCanvas");
  return v4;
}

- (void)beginDragInsertFromPalette
{
  -[TSTMasterLayout beginDynamicMode:](-[TSTTableRep masterLayout](self, "masterLayout"), "beginDynamicMode:", -[TSTTableRep tableLayout](self, "tableLayout"));
  -[TSTMasterLayout updateDynamicRepressFrozenHeader:](-[TSTTableRep masterLayout](self, "masterLayout"), "updateDynamicRepressFrozenHeader:", 1);
}

- (void)endDragInsertFromPalette
{
  -[TSTMasterLayout endDynamicMode](-[TSTTableRep masterLayout](self, "masterLayout"), "endDynamicMode");
}

- (BOOL)canDrawInBackgroundDuringScroll
{
  return !-[TSTTableRep mustDrawOnMainThreadForInteractiveCanvas](self, "mustDrawOnMainThreadForInteractiveCanvas");
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  TSTMasterLayout *v2;
  TSTLayoutDynamicContentProtocol *v3;

  v2 = -[TSTTableRep masterLayout](self, "masterLayout");
  v3 = -[TSTMasterLayout dynamicContentDelegate](v2, "dynamicContentDelegate");
  if (-[TSTMasterLayout isDynamicallyResizingTableName](v2, "isDynamicallyResizingTableName"))
    return 1;
  if (v3)
    return -[TSTLayoutDynamicContentProtocol dynamicContentMustDrawOnMainThread](v3, "dynamicContentMustDrawOnMainThread");
  return 0;
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (int)tilingMode
{
  return 2;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  objc_super v8;

  TSTMasterLayoutLock((uint64_t)-[TSTTableRep masterLayout](self, "masterLayout"));
  self->mRecursivelyDrawingInContext = 1;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v6 = v5;
  v7 = TSDCGContextAssociatedScreenScale((uint64_t)a3);
  TSTTableRepSetupUserSpaceToDeviceSpaceTransform(self, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)TSTTableRep;
  -[TSDRep recursivelyDrawInContext:](&v8, sel_recursivelyDrawInContext_, a3);
  self->mRecursivelyDrawingInContext = 0;
  TSTMasterLayoutUnlock((uint64_t)-[TSTTableRep masterLayout](self, "masterLayout"));
}

- (void)drawInContext:(CGContext *)a3
{
  TSTLayout *v5;
  TSTTableAnimationController *mAnimationController;
  TSDTilingLayer *mOverlayTableName;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  TSTLayoutSpace *Space;
  TSTLayoutSpace *RepeatHeaderRowsSpace;
  TSTLayoutSpace *v14;
  TSTLayoutSpace *RepeatHeaderColumnsSpace;
  TSTLayoutSpace *v16;
  TSTLayoutSpace *RepeatHeaderCornerSpace;
  TSTLayoutSpace *v18;
  CGAffineTransform v19;
  CGRect ClipBoundingBox;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v5 = -[TSTTableRep tableLayout](self, "tableLayout");
  mAnimationController = self->mAnimationController;
  if (!mAnimationController
    || -[TSTTableAnimationController shouldRenderTableRep](mAnimationController, "shouldRenderTableRep"))
  {
    if (self->mRecursivelyDrawingInContext || -[TSTLayout inPrintPreviewMode](v5, "inPrintPreviewMode"))
    {
      mOverlayTableName = self->mOverlayTableName;
      if (mOverlayTableName)
      {
        -[TSDTilingLayer setDelegate:](mOverlayTableName, "setDelegate:", 0);

        self->mOverlayTableName = 0;
      }
      TSTTableRepDrawTableName(self, a3, 0);
    }
    ClipBoundingBox = CGContextGetClipBoundingBox(a3);
    x = ClipBoundingBox.origin.x;
    y = ClipBoundingBox.origin.y;
    width = ClipBoundingBox.size.width;
    height = ClipBoundingBox.size.height;
    -[TSTTableRep transformFromCanvas](self, "transformFromCanvas");
    CGContextConcatCTM(a3, &v19);
    Space = (TSTLayoutSpace *)TSTLayoutGetSpace(v5);
    -[TSTLayoutSpace lockForRead](Space, "lockForRead");
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    TSTTableRepDrawSpaceInContext(self, Space, v21, a3);
    -[TSTLayoutSpace unlock](Space, "unlock");
    if (TSTLayoutIsPartitionPaginated(v5))
    {
      RepeatHeaderRowsSpace = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderRowsSpace(v5);
      if (RepeatHeaderRowsSpace)
      {
        v14 = RepeatHeaderRowsSpace;
        -[TSTLayoutSpace lockForRead](RepeatHeaderRowsSpace, "lockForRead");
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        TSTTableRepDrawSpaceInContext(self, v14, v22, a3);
        -[TSTLayoutSpace unlock](v14, "unlock");
      }
      RepeatHeaderColumnsSpace = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderColumnsSpace(v5);
      if (RepeatHeaderColumnsSpace)
      {
        v16 = RepeatHeaderColumnsSpace;
        -[TSTLayoutSpace lockForRead](RepeatHeaderColumnsSpace, "lockForRead");
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        TSTTableRepDrawSpaceInContext(self, v16, v23, a3);
        -[TSTLayoutSpace unlock](v16, "unlock");
      }
      RepeatHeaderCornerSpace = (TSTLayoutSpace *)TSTLayoutGetRepeatHeaderCornerSpace(v5);
      if (RepeatHeaderCornerSpace)
      {
        v18 = RepeatHeaderCornerSpace;
        -[TSTLayoutSpace lockForRead](RepeatHeaderCornerSpace, "lockForRead");
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        TSTTableRepDrawSpaceInContext(self, v18, v24, a3);
        -[TSTLayoutSpace unlock](v18, "unlock");
      }
    }
  }
}

- (id)p_textImageForPath:(CGPath *)a3 shouldPulsate:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGContext *v20;
  TSTLayoutSpace *Space;
  uint64_t GridRangeForLayoutRect;
  unint64_t v23;
  int v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  CGImage *Image;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGAffineTransform transform;
  CGSize v44;
  CGRect BoundingBox;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v4 = a4;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v8 = v7;
  -[TSDCanvas viewScale](self->super.super.mCanvas, "viewScale");
  v10 = v9;
  v11 = &kFindSelectionPulseInset;
  if (!v4)
    v11 = &kFindSelectionInset;
  v12 = *(double *)v11;
  BoundingBox = CGPathGetBoundingBox(a3);
  y = BoundingBox.origin.y;
  x = BoundingBox.origin.x;
  height = BoundingBox.size.height;
  width = BoundingBox.size.width;
  v46 = CGRectInset(BoundingBox, -v12, -v12);
  v13 = v46.origin.y;
  v14 = v46.size.width;
  v41 = v46.origin.x;
  v42 = v46.size.height;
  v47 = CGRectInset(v46, -6.0, -6.0);
  v15 = v47.origin.x;
  v16 = v47.origin.y;
  v17 = v47.size.width;
  v18 = v47.size.height;
  v48 = CGRectIntegral(v47);
  v39 = v48.origin.y;
  v40 = v48.origin.x;
  v38 = v8;
  v19 = v8 * v10;
  v49.origin.x = TSDMultiplyRectScalar(v15, v16, v17, v18, v19);
  v50 = CGRectIntegral(v49);
  v20 = TSDBitmapContextCreate(11, v50.size.width);
  if (v20)
  {
    TSDSetCGContextInfo((uint64_t)v20, -[TSDCanvas isPrinting](-[TSDRep canvas](self, "canvas"), "isPrinting"), -[TSDCanvas isDrawingIntoPDF](-[TSDRep canvas](self, "canvas"), "isDrawingIntoPDF"), 1, -[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds"), v10);
    CGContextScaleCTM(v20, v19, v19);
    CGContextTranslateCTM(v20, -v40, -v39);
    CGContextSetShouldSmoothFonts(v20, 0);
    CGContextSetShouldAntialias(v20, 1);
    v51.origin.x = v41;
    v51.origin.y = v13;
    v51.size.width = v14;
    v51.size.height = v42;
    v52 = CGRectInset(v51, -2.0, -2.0);
    CGContextClipToRect(v20, v52);
    -[TSWPTextHostRep drawTextBackground:insetRect:pulsating:](self, "drawTextBackground:insetRect:pulsating:", v20, v4, v41, v13, v14, v42);
    v44.width = 0.0;
    v44.height = -2.0;
    CGContextSetShadow(v20, v44, 2.0);
    Space = (TSTLayoutSpace *)TSTLayoutGetSpace(-[TSTTableRep tableLayout](self, "tableLayout"));
    GridRangeForLayoutRect = TSTLayoutSpaceGetGridRangeForLayoutRect(Space, v41, v13, v14, v42);
    if ((_DWORD)GridRangeForLayoutRect == -1
      || (_DWORD)v23 == -1
      || GridRangeForLayoutRect > v23)
    {
      v28 = v23;
      v30 = GridRangeForLayoutRect;
      v29 = v23;
    }
    else
    {
      v24 = v23 - 1;
      v25 = (v23 & 0xFFFFFFFF00000000 | (v23 - 1)) - 0x100000000;
      if (HIDWORD(GridRangeForLayoutRect) > HIDWORD(v23))
      {
        v24 = v23;
        v25 = v23;
      }
      if (HIDWORD(v23) == -1)
        v26 = v23;
      else
        v26 = v24;
      if (HIDWORD(v23) == -1)
        v27 = v23;
      else
        v27 = v25;
      if (HIDWORD(GridRangeForLayoutRect) == -1)
        v28 = v23;
      else
        v28 = v27;
      if (HIDWORD(GridRangeForLayoutRect) == -1)
        v29 = v23;
      else
        v29 = v27;
      if (HIDWORD(GridRangeForLayoutRect) == -1)
        v26 = v23;
      v30 = GridRangeForLayoutRect;
      LODWORD(v23) = v26;
    }
    if ((_DWORD)GridRangeForLayoutRect != -1
      && (_DWORD)v23 != -1
      && v23 >= GridRangeForLayoutRect
      && HIDWORD(GridRangeForLayoutRect) != -1)
    {
      v31 = HIDWORD(v28);
      if ((_DWORD)v31 != -1 && HIDWORD(GridRangeForLayoutRect) <= v31)
      {
        v53.origin.y = y;
        v53.origin.x = x;
        v53.size.height = height;
        v53.size.width = width;
        CGContextClipToRect(v20, v53);
        -[TSTTableRep transformFromCanvas](self, "transformFromCanvas");
        CGContextConcatCTM(v20, &transform);
        TSTTableRepPrepareToDrawLayoutSpace(self, Space, v20);
        TSTTableRepDrawCellContent(self, Space, v30, v29, v20);
        if (Space)
          CGContextRestoreGState(v20);
      }
    }
    Image = CGBitmapContextCreateImage(v20);
    CGContextRelease(v20);
    if (Image)
    {
      v20 = (CGContext *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C90]), "initWithCGImage:scale:orientation:", Image, 0, v38);
      CGImageRelease(Image);
    }
    else
    {
      return 0;
    }
  }
  return v20;
}

- (CGPath)p_newPathForSearchReference:(id)a3
{
  return 0;
}

- (void)p_hideSelectionLayers
{
  -[CAShapeLayer setHidden:](self->mFindSelectionHighlightLayer, "setHidden:", 1);
  -[TSKHighlightArrayController stop](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "stop");
}

- (void)p_editingDidEnd
{
  -[CAShapeLayer setHidden:](self->mFindSelectionHighlightLayer, "setHidden:", 1);
  if (-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"))
    -[TSKHighlightArrayController stop](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "stop");
}

- (CGPath)newPathForSearchReference:(id)a3
{
  return 0;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  return -[TSTTableRep p_textImageForPath:shouldPulsate:](self, "p_textImageForPath:shouldPulsate:", a4, a5);
}

- (CGRect)boundsForResizeGuideUI
{
  double RenderingFrame;
  double v3;
  double v4;
  double v5;
  CGRect result;

  RenderingFrame = TSTLayoutGetRenderingFrame(-[TSTTableRep tableLayout](self, "tableLayout"), 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = RenderingFrame;
  return result;
}

- (NSString)description
{
  objc_class *v3;
  objc_class *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  TSDLayout *v8;
  objc_class *v9;
  NSString *v10;
  TSTLayoutHint *v11;
  $CA3468F20078D5D2DB35E78E73CA60DA v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v17;
  NSString *v18;
  void *v19;
  CGRect v20;

  v19 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v3);
  -[TSDRep info](self, "info");
  v4 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v4);
  v5 = -[TSDRep info](self, "info");
  -[TSDRep layout](self, "layout");
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = -[TSDRep layout](self, "layout");
  -[TSTLayout layoutHint](-[TSTTableRep tableLayout](self, "tableLayout"), "layoutHint");
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = -[TSTLayout layoutHint](-[TSTTableRep tableLayout](self, "tableLayout"), "layoutHint");
  v12 = -[TSTLayoutHint cellRange](-[TSTLayout layoutHint](-[TSTTableRep tableLayout](self, "tableLayout"), "layoutHint"), "cellRange");
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v12.var0.var1, v12.var0.var0);
  v15 = objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@, %@)"), v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), v12.var1.var0, HIWORD(*(unint64_t *)&v12)));
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  return (NSString *)objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p> layout=<%@ %p> layoutHint=<%@ %p %@> frameInUnscaledCanvas=%@>"), v18, self, v17, v5, v7, v8, v10, v11, v15, NSStringFromCGRect(v20));
}

- (TSTCanvasReferenceController)canvasReferenceController
{
  return self->mCanvasReferenceController;
}

- (TSTTableAnimationController)animationController
{
  return self->mAnimationController;
}

- (void)setAnimationController:(id)a3
{
  self->mAnimationController = (TSTTableAnimationController *)a3;
}

- (TSTTableChromeProvider)tableChrome
{
  return self->mTableChrome;
}

- (TSTTableRepDelegate)delegate
{
  return self->mDelegate;
}

- (TSTSelectionDragController)cellDragController
{
  return self->mCellDragController;
}

- (void)setCellDragController:(id)a3
{
  self->mCellDragController = (TSTSelectionDragController *)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)ratingsDragCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mRatingsDragCellID;
}

- (void)setRatingsDragCellID:(id)a3
{
  self->mRatingsDragCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTTableKnobTrackerVisitorProtocol)visitorKnobTracker
{
  return self->mVisitorKnobTracker;
}

- (BOOL)isZoomToEditOperationInProgress
{
  return self->mIsZoomToEditOperationInProgress;
}

@end
