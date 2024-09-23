@implementation PXMessagesStackItemsLayoutHelper

- (PXMessagesStackItemsLayoutHelper)init
{
  PXMessagesStackItemsLayoutHelper *v2;
  PXMessagesStackItemsLayoutHelper *v3;
  PFMessagesStackLayoutFrameSolver *v4;
  PFMessagesStackLayoutFrameSolver *frameSolver;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMessagesStackItemsLayoutHelper;
  v2 = -[PXMessagesStackItemsLayoutHelper init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_baseGeometriesSize = 7;
    v2->_baseGeometries = ($559C86641F1F299F94BFFDDA7F58F470 *)malloc_type_calloc(7uLL, 0x50uLL, 0x10000404247E4FDuLL);
    v4 = (PFMessagesStackLayoutFrameSolver *)objc_alloc_init(MEMORY[0x1E0D75138]);
    frameSolver = v3->_frameSolver;
    v3->_frameSolver = v4;

  }
  return v3;
}

- (void)dealloc
{
  $559C86641F1F299F94BFFDDA7F58F470 *baseGeometries;
  objc_super v4;

  baseGeometries = self->_baseGeometries;
  if (baseGeometries)
  {
    free(baseGeometries);
    self->_baseGeometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMessagesStackItemsLayoutHelper;
  -[PXMessagesStackItemsLayoutHelper dealloc](&v4, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  unint64_t v4;

  ++self->_nestedChanges;
  (*((void (**)(id, PXMessagesStackItemsLayoutHelper *))a3 + 2))(a3, self);
  v4 = self->_nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
    -[PXMessagesStackItemsLayoutHelper _updateInternalState](self, "_updateInternalState");
}

- (void)_updateInternalState
{
  unint64_t v4;
  unint64_t v5;
  $559C86641F1F299F94BFFDDA7F58F470 *v6;
  double v7;
  double v8;
  void *v9;
  $559C86641F1F299F94BFFDDA7F58F470 *v10;
  CGSize var1;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;

  v4 = -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount");
  v5 = 2 * v4 + 3;
  if (v5 > self->_baseGeometriesSize)
  {
    self->_baseGeometriesSize = v5;
    v6 = ($559C86641F1F299F94BFFDDA7F58F470 *)malloc_type_realloc(self->_baseGeometries, 80 * v5, 0x10000404247E4FDuLL);
    self->_baseGeometries = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 72, CFSTR("Unable to reallocate memory for geometries"));

    }
  }
  -[PXMessagesStackItemsLayoutHelper rotationAngle](self, "rotationAngle");
  v8 = v7;
  -[PFMessagesStackLayoutFrameSolver setStackedItemsCount:](self->_frameSolver, "setStackedItemsCount:", v4);
  -[PXMessagesStackItemsLayoutHelper normalizedContentInsets](self, "normalizedContentInsets");
  -[PFMessagesStackLayoutFrameSolver setNormalizedVerticalInsets:](self->_frameSolver, "setNormalizedVerticalInsets:");
  -[PXMessagesStackItemsLayoutHelper normalizedStackVerticalOffset](self, "normalizedStackVerticalOffset");
  -[PFMessagesStackLayoutFrameSolver setNormalizedVerticalOffset:](self->_frameSolver, "setNormalizedVerticalOffset:");
  -[PXMessagesStackItemsLayoutHelper normalizedStackSizeTransform](self, "normalizedStackSizeTransform");
  -[PFMessagesStackLayoutFrameSolver setNormalizedSizeTransform:](self->_frameSolver, "setNormalizedSizeTransform:");
  -[PFMessagesStackLayoutFrameSolver setRotationAngle:](self->_frameSolver, "setRotationAngle:", v8);
  -[PXMessagesStackItemsLayoutHelper normalizedStackHorizontalOffsets](self, "normalizedStackHorizontalOffsets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMessagesStackLayoutFrameSolver setNormalizedHorizontalOffsets:](self->_frameSolver, "setNormalizedHorizontalOffsets:", v9);

  -[PFMessagesStackLayoutFrameSolver getGeometries:count:](self->_frameSolver, "getGeometries:count:", self->_baseGeometries, self->_baseGeometriesSize);
  self->_zOrderArchSide = 2;
  v10 = &self->_baseGeometries[v4];
  self->_initialItemCentralGeometry.center = v10[1].var0;
  var1 = v10[1].var1;
  v12 = *(_OWORD *)&v10[1].var2;
  v13 = *(_OWORD *)&v10[1].var6;
  *(_OWORD *)&self->_initialItemCentralGeometry.alpha = *(_OWORD *)&v10[1].var4;
  *(_OWORD *)&self->_initialItemCentralGeometry.tapbackScale = v13;
  self->_initialItemCentralGeometry.size = var1;
  *(_OWORD *)&self->_initialItemCentralGeometry.zPos = v12;
  v15 = *(_OWORD *)&v10[1].var4;
  v14 = *(_OWORD *)&v10[1].var6;
  v16 = *(_OWORD *)&v10[1].var2;
  self->_finalItemCentralGeometry.size = v10[1].var1;
  *(_OWORD *)&self->_finalItemCentralGeometry.zPos = v16;
  *(_OWORD *)&self->_finalItemCentralGeometry.alpha = v15;
  *(_OWORD *)&self->_finalItemCentralGeometry.tapbackScale = v14;
  self->_finalItemCentralGeometry.center = v10[1].var0;
  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v17, "applyRotationToFirstAndLast");

  if ((_DWORD)v9)
  {
    self->_initialItemCentralGeometry.rotationAngle = -v8;
    self->_finalItemCentralGeometry.rotationAngle = v8;
  }
}

- (void)_swapBaseZPositions
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $559C86641F1F299F94BFFDDA7F58F470 *baseGeometries;
  uint64_t *p_var2;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v4 = -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount");
  v5 = 2 * v4;
  if (2 * v4 + 3 > self->_baseGeometriesSize)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedCount <= _baseGeometriesSize"));

  }
  v6 = v5 + 2;
  if (v5 + 2 >= 1)
  {
    baseGeometries = self->_baseGeometries;
    p_var2 = (uint64_t *)&baseGeometries[2 * v4 + 2].var2;
    v9 = (uint64_t *)&baseGeometries->var2;
    v10 = 1;
    do
    {
      v11 = *v9;
      *v9 = *p_var2;
      v9 += 10;
      *p_var2 = v11;
      p_var2 -= 10;
    }
    while (v10++ < --v6);
  }
}

- (void)setZOrderArchSide:(unint64_t)a3
{
  if (self->_zOrderArchSide != a3)
  {
    self->_zOrderArchSide = a3;
    -[PXMessagesStackItemsLayoutHelper _swapBaseZPositions](self, "_swapBaseZPositions");
  }
}

- (void)getGeometries:(id *)a3 count:(unint64_t)a4 forVisibleRect:(CGRect)a5 focus:(double)a6 archSide:(unint64_t)a7 keyframeOverride:(int64_t)a8
{
  int64_t v15;
  unint64_t v16;
  char v17;
  $620E53FD987FAE8BA3E68801FCA0B3F4 *p_initialItemCentralGeometry;
  PXMessagesStackItemsLayoutHelper *v19;
  uint64_t v20;
  unint64_t v21;
  double *p_var3;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  char v60;
  double v62;

  v15 = 2 * -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount") + 3;
  v16 = -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount");
  if (v15 != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalItemCount == count"));

  }
  if (v15 > self->_baseGeometriesSize)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalItemCount <= _baseGeometriesSize"));

  }
  switch(a8)
  {
    case 1:
      v17 = 0;
      p_initialItemCentralGeometry = &self->_initialItemCentralGeometry;
      goto LABEL_10;
    case 2:
      v60 = 0;
      p_initialItemCentralGeometry = &self->_initialItemCentralGeometry;
      goto LABEL_12;
    case 3:
      v17 = 0;
      p_initialItemCentralGeometry = &self->_finalItemCentralGeometry;
LABEL_10:
      v60 = 1;
      goto LABEL_13;
    case 4:
      v60 = 0;
      p_initialItemCentralGeometry = &self->_finalItemCentralGeometry;
      goto LABEL_12;
    default:
      p_initialItemCentralGeometry = 0;
      v60 = 1;
LABEL_12:
      v17 = 1;
LABEL_13:
      if (a7 - 1 <= 1)
        -[PXMessagesStackItemsLayoutHelper setZOrderArchSide:](self, "setZOrderArchSide:", a7);
      if (v15 < 1)
        return;
      v19 = self;
      v20 = 0;
      v21 = v16 + 1;
      v58 = a6 + 1.0;
      v59 = a6;
      p_var3 = &a3->var3;
      break;
  }
  do
  {
    v23 = a6 < 0.0;
    if (a6 <= 0.0)
    {
      a6 = 0.0;
      v25 = v20;
      v24 = v20;
      if (v23)
      {
        if (v20)
          v25 = v20 - 1;
        else
          v25 = 0;
        v24 = v20;
        a6 = v58;
      }
    }
    else
    {
      if (v20 + 1 >= v15)
        v24 = v20;
      else
        v24 = v20 + 1;
      v25 = v20;
    }
    v26 = v60;
    if (v25 != v21)
      v26 = 1;
    if ((v26 & 1) != 0 || (v27 = (uint64_t)p_initialItemCentralGeometry) == 0)
      v27 = (uint64_t)&v19->_baseGeometries[v25];
    if (v24 == v21)
      v28 = v17;
    else
      v28 = 1;
    if ((v28 & 1) != 0 || (v29 = (uint64_t)p_initialItemCentralGeometry) == 0)
      v29 = (uint64_t)&v19->_baseGeometries[v24];
    if (a7 == 2)
    {
      if (v25 != v21)
        goto LABEL_44;
    }
    else if (a7 != 1 || v24 != v21)
    {
LABEL_44:
      PXFloatByLinearlyInterpolatingFloats();
      v62 = v30;
      PXFloatByLinearlyInterpolatingFloats();
      v32 = v31;
      PXFloatByLinearlyInterpolatingFloats();
      v34 = v33;
      PXFloatByLinearlyInterpolatingFloats();
      v36 = v35;
      PXFloatByLinearlyInterpolatingFloats();
      v38 = v37;
      PXFloatByLinearlyInterpolatingFloats();
      v40 = v39;
      PXFloatByLinearlyInterpolatingFloats();
      v42 = v41;
      PXFloatByLinearlyInterpolatingFloats();
      v44 = v43;
      PXFloatByParabolicallyInterpolatingFloats();
      goto LABEL_46;
    }
    PXFloatByParabolicallyInterpolatingFloats();
    v62 = v46;
    PXFloatByLinearlyInterpolatingFloats();
    v32 = v47;
    PXFloatByLinearlyInterpolatingFloats();
    v34 = v48;
    PXFloatByLinearlyInterpolatingFloats();
    v36 = v49;
    PXFloatByParabolicallyInterpolatingFloats();
    v38 = v50;
    PXFloatByParabolicallyInterpolatingFloats();
    v40 = v51;
    PXFloatByLinearlyInterpolatingFloats();
    v42 = v52;
    PXFloatByLinearlyInterpolatingFloats();
    v44 = v53;
    PXFloatByLinearlyInterpolatingFloats();
LABEL_46:
    if (a6 <= 0.5)
      v54 = v27;
    else
      v54 = v29;
    v55 = *(_QWORD *)(v54 + 32);
    *(p_var3 - 5) = a5.origin.x + v62 * a5.size.width;
    *(p_var3 - 4) = a5.origin.y + v32 * a5.size.height;
    *(p_var3 - 3) = a5.size.width * v34;
    *(p_var3 - 2) = a5.size.height * v36;
    *((_QWORD *)p_var3 - 1) = v55;
    *(_QWORD *)p_var3 = v40;
    *((_QWORD *)p_var3 + 1) = v42;
    *((_QWORD *)p_var3 + 2) = v44;
    *((_QWORD *)p_var3 + 3) = v38;
    *((_QWORD *)p_var3 + 4) = v45;
    ++v20;
    p_var3 += 10;
    a6 = v59;
  }
  while (v15 != v20);
}

- (CGSize)maxItemSizeForReferenceSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t v7;
  $559C86641F1F299F94BFFDDA7F58F470 *v8;
  double v9;
  double v10;
  void *v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount") + 1;
  if (v7 >= self->_baseGeometriesSize)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("centralIndex < _baseGeometriesSize"));

  }
  v8 = &self->_baseGeometries[v7];
  v9 = width * v8->var1.width;
  v10 = height * v8->var1.height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)horizontalContentMarginForReferenceSize:(CGSize)a3 itemAspect:(double)a4
{
  double height;
  double width;
  unint64_t v9;
  double result;
  void *v11;

  height = a3.height;
  width = a3.width;
  v9 = -[PXMessagesStackItemsLayoutHelper stackedItemsCount](self, "stackedItemsCount") + 1;
  if (v9 >= self->_baseGeometriesSize)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("centralIndex < _baseGeometriesSize"));

  }
  MEMORY[0x1A85CD660](a4, width * self->_baseGeometries[v9].var1.width, height * self->_baseGeometries[v9].var1.height);
  PXRectWithCenterAndSize();
  return result;
}

- ($559C86641F1F299F94BFFDDA7F58F470)baseGeometryForIndex:(SEL)a3 visibleRect:(int64_t)a4
{
  double y;
  double x;
  $559C86641F1F299F94BFFDDA7F58F470 *v9;
  int64_t v11;
  CGSize v12;
  __int128 v13;
  __int128 v14;
  CGFloat v15;
  void *v16;
  CGFloat width;
  CGFloat height;

  y = a5.origin.y;
  x = a5.origin.x;
  v9 = self;
  if (a4 < 0 || *(_QWORD *)&self->var1.width <= (unint64_t)a4)
  {
    width = a5.size.width;
    height = a5.size.height;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, v9, CFSTR("PXMessagesStackItemsLayoutHelper.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < _baseGeometriesSize"));

    a5.size.width = width;
    a5.size.height = height;
  }
  v11 = *(_QWORD *)&v9->var1.height + 80 * a4;
  v12 = *(CGSize *)(v11 + 16);
  retstr->var0 = *(CGPoint *)v11;
  retstr->var1 = v12;
  v13 = *(_OWORD *)(v11 + 32);
  v14 = *(_OWORD *)(v11 + 64);
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(v11 + 48);
  *(_OWORD *)&retstr->var6 = v14;
  *(double *)&v14 = y + retstr->var0.y * a5.size.height;
  retstr->var0.x = x + retstr->var0.x * a5.size.width;
  *(_QWORD *)&retstr->var0.y = v14;
  v15 = a5.size.height;
  retstr->var1 = (CGSize)vmulq_f64((float64x2_t)a5.size, (float64x2_t)retstr->var1);
  *(_OWORD *)&retstr->var2 = v13;
  return self;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  self->_normalizedStackSizeTransform = a3;
}

- (NSArray)normalizedStackHorizontalOffsets
{
  return self->_normalizedStackHorizontalOffsets;
}

- (void)setNormalizedStackHorizontalOffsets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  self->_normalizedStackVerticalOffset = a3;
}

- (double)normalizedContentInsets
{
  return self->_normalizedContentInsets;
}

- (void)setNormalizedContentInsets:(double)a3
{
  self->_normalizedContentInsets = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (unint64_t)zOrderArchSide
{
  return self->_zOrderArchSide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStackHorizontalOffsets, 0);
  objc_storeStrong((id *)&self->_frameSolver, 0);
}

@end
