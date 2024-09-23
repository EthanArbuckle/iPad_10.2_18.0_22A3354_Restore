@implementation PXStoryViewModeFocusedClipsViewTransition

- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModeTransition.m"), 265, CFSTR("%s is not available as initializer"), "-[PXStoryViewModeFocusedClipsViewTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:]");

  abort();
}

- (PXStoryViewModeFocusedClipsViewTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7 focusedClipIdentifiers:(id)a8 trackingClipIdentifier:(int64_t)a9
{
  id v16;
  PXStoryViewModeFocusedClipsViewTransition *v17;
  PXStoryViewModeFocusedClipsViewTransition *v18;
  objc_super v20;

  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryViewModeFocusedClipsViewTransition;
  v17 = -[PXStoryViewModeTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:](&v20, sel_initWithSourceViewMode_sourceSnapshot_destinationViewMode_destinationSnapshot_assetReference_, a3, a4, a5, a6, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_focusedClipIdentifiers, a8);
    v18->_trackingClipIdentifier = a9;
  }

  return v18;
}

- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  unint64_t var1;
  void *v14;
  void *v15;
  void *v16;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a6;
  var1 = a3->var1;
  -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinateSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (var1 <= 5 && ((0x32u >> var1) & 1) != 0 && v14 != 0 && v16 != 0)
  {
    -[PXStoryViewModeFocusedClipsViewTransition focusedClipIdentifiers](self, "focusedClipIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsIndex:", a3->var0);

    if (v21)
    {
      objc_msgSend(v14, "rectInCoordinateSpace:", v16);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v12, "rootLayout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertRect:fromLayout:", v30, v23, v25, v27, v29);

      -[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode");
      -[PXStoryViewModeTransition destinationViewMode](self, "destinationViewMode");
      -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
      PXRectByLinearlyInterpolatingRects();
      x = v31;
      y = v32;
      width = v33;
      height = v34;
    }
  }

  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForClipWithInfo:(id *)a3 proposedCornerRadius:(id)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  v6 = *(_QWORD *)&a4.var0.var0.var0;
  v8 = -[NSIndexSet containsIndex:](self->_focusedClipIdentifiers, "containsIndex:", a3->var0, *(_QWORD *)&a4.var0.var0.var0, *(_QWORD *)&a4.var0.var1[2], a5, a6);
  if ((_DWORD)v8)
  {
    if (-[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode") != v6)
    {
      -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageViewSpec");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cornerRadius");

      }
    }
    if (-[PXStoryViewModeTransition destinationViewMode](self, "destinationViewMode") != v6)
    {
      -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageViewSpec");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cornerRadius");

      }
    }
    -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
    PXFloatSaturate();
    PXFloatByLinearlyInterpolatingFloats();
    PXFloatByLinearlyInterpolatingFloats();
    PXFloatByLinearlyInterpolatingFloats();
    v8 = PXFloatByLinearlyInterpolatingFloats();
  }
  *(_QWORD *)&result.var0.var1[2] = v9;
  *(_QWORD *)&result.var0.var0.var0 = v8;
  return result;
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  __int128 v10;
  $B0175D27BC26B8A5DA33FAD13D27C2F3 *result;
  $B0175D27BC26B8A5DA33FAD13D27C2F3 *v12;
  _BOOL4 v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;

  v10 = *(_OWORD *)&a5->var1.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&retstr->var1.origin.y = v10;
  retstr->var1.size.height = a5->var1.size.height;
  -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
  result = ($B0175D27BC26B8A5DA33FAD13D27C2F3 *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v12 = result;
    v13 = -[NSIndexSet containsIndex:](self->_focusedClipIdentifiers, "containsIndex:", a4->var0);

    if (v13)
    {
      -[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode");
      -[PXStoryViewModeTransition destinationViewMode](self, "destinationViewMode");
      -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
      PXFloatSaturate();
      PXFloatByLinearlyInterpolatingFloats();
      retstr->var0 = v14;
      -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageContentsRect");
      retstr->var1.origin.x = v15;
      retstr->var1.origin.y = v16;
      retstr->var1.size.width = v17;
      retstr->var1.size.height = v18;

    }
  }
  return result;
}

- (double)zPositionForClipWithInfo:(id *)a3 proposedZPosition:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  double result;
  _BOOL4 v9;

  if (-[PXStoryViewModeFocusedClipsViewTransition trackingClipIdentifier](self, "trackingClipIdentifier", a3, a5, a6) == a3->var0)
    return a4 + a4;
  v9 = -[NSIndexSet containsIndex:](self->_focusedClipIdentifiers, "containsIndex:");
  result = a4 * 0.5;
  if (v9)
    return a4;
  return result;
}

- (NSIndexSet)focusedClipIdentifiers
{
  return self->_focusedClipIdentifiers;
}

- (int64_t)trackingClipIdentifier
{
  return self->_trackingClipIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedClipIdentifiers, 0);
}

@end
