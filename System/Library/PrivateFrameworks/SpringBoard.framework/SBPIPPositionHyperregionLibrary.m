@implementation SBPIPPositionHyperregionLibrary

- (SBPIPPositionHyperregionLibrary)init
{
  SBPIPPositionHyperregionLibrary *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPIPPositionHyperregionLibrary;
  v2 = -[SBPIPPositionHyperregionLibrary init](&v5, sel_init);
  if (v2)
  {
    if (__sb__runningInSpringBoard())
    {
      v2->_isPad = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_isPad = objc_msgSend(v3, "userInterfaceIdiom") == 1;

    }
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  _UIHyperregionUnion *lastAllUnified;
  _UIHyperregionUnion *lastCornersRegion;
  _UIHyperregionUnion *lastStashedLeftRegion;
  _UIHyperregionUnion *lastStashedRightRegion;
  _UIHyperregionUnion *lastOffscreenCorners;
  const __CFString *v10;
  _UIHyperregionUnion *lastContainerInsetRegion;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _OWORD v23[13];
  objc_super v24;
  _QWORD v25[7];
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)SBPIPPositionHyperregionLibrary;
  -[SBPIPPositionHyperregionLibrary description](&v24, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lastAllUnified = (_UIHyperregionUnion *)&stru_1E8EC7EC0;
  v25[0] = CFSTR("Corners");
  v25[1] = CFSTR("Stashed Left");
  lastCornersRegion = self->_lastCornersRegion;
  lastStashedLeftRegion = self->_lastStashedLeftRegion;
  if (!lastCornersRegion)
    lastCornersRegion = (_UIHyperregionUnion *)&stru_1E8EC7EC0;
  if (!lastStashedLeftRegion)
    lastStashedLeftRegion = (_UIHyperregionUnion *)&stru_1E8EC7EC0;
  v26[0] = lastCornersRegion;
  v26[1] = lastStashedLeftRegion;
  lastStashedRightRegion = self->_lastStashedRightRegion;
  lastOffscreenCorners = self->_lastOffscreenCorners;
  if (!lastStashedRightRegion)
    lastStashedRightRegion = (_UIHyperregionUnion *)&stru_1E8EC7EC0;
  v25[2] = CFSTR("Stashed Right");
  v25[3] = CFSTR("Offscreen Corners");
  if (lastOffscreenCorners)
    v10 = (const __CFString *)lastOffscreenCorners;
  else
    v10 = &stru_1E8EC7EC0;
  v26[2] = lastStashedRightRegion;
  v26[3] = v10;
  v25[4] = CFSTR("Container Inset");
  v25[5] = CFSTR("Unified");
  lastContainerInsetRegion = self->_lastContainerInsetRegion;
  if (!lastContainerInsetRegion)
    lastContainerInsetRegion = (_UIHyperregionUnion *)&stru_1E8EC7EC0;
  if (self->_lastAllUnified)
    lastAllUnified = self->_lastAllUnified;
  v26[4] = lastContainerInsetRegion;
  v26[5] = lastAllUnified;
  v25[6] = CFSTR("Geometry");
  v12 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  v23[10] = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  v23[11] = v12;
  v23[12] = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  v13 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  v23[6] = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  v23[7] = v13;
  v14 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  v23[8] = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  v23[9] = v14;
  pipAnchorPointOffset = self->_lastGeometryContext.pipAnchorPointOffset;
  v23[2] = self->_lastGeometryContext.pipStashedSize;
  v23[3] = pipAnchorPointOffset;
  size = self->_lastGeometryContext.containerBounds.size;
  v23[4] = self->_lastGeometryContext.containerBounds.origin;
  v23[5] = size;
  pipLastSteadySize = self->_lastGeometryContext.pipLastSteadySize;
  v23[0] = self->_lastGeometryContext.pipCurrentSize;
  v23[1] = pipLastSteadySize;
  SBPIPPositionGeometryContextDescription((uint64_t)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (id)regionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGPoint v16;
  CGSize v17;
  CGSize v18;
  CGSize v19;
  CGSize v20;
  CGPoint v21;
  CGSize v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGPoint v32;
  CGSize v33;
  CGSize v34;
  _UIHyperregionUnion *v35;
  _UIHyperregionUnion *lastCornersRegion;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGPoint v40;
  CGSize v41;
  CGSize v42;
  _UIHyperregionUnion *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGPoint v47;
  CGSize v48;
  CGSize v49;
  _UIHyperregionUnion *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGPoint v54;
  CGSize v55;
  CGSize v56;
  _UIHyperregionUnion *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGPoint v61;
  CGSize v62;
  CGSize v63;
  _UIHyperregionUnion *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGPoint v68;
  CGSize v69;
  CGSize v70;
  _UIHyperregionUnion *v71;
  void *v74;
  _OWORD v75[13];
  CGSize pipCurrentSize;
  CGSize v77;
  CGSize pipStashedSize;
  CGPoint v79;
  CGPoint origin;
  CGSize v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPPositionHyperregionLibrary.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionType > 0"));

  }
  v7 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  v87 = v7;
  v88 = *(_OWORD *)&a4->offscreenCorners;
  v8 = *(_OWORD *)&a4->edgeInsets.bottom;
  v82 = *(_OWORD *)&a4->edgeInsets.top;
  v83 = v8;
  v9 = *(_OWORD *)&a4->minimumPadding.bottom;
  v84 = *(_OWORD *)&a4->minimumPadding.top;
  v85 = v9;
  pipAnchorPointOffset = a4->pipAnchorPointOffset;
  pipStashedSize = a4->pipStashedSize;
  v79 = pipAnchorPointOffset;
  size = a4->containerBounds.size;
  origin = a4->containerBounds.origin;
  v81 = size;
  pipLastSteadySize = a4->pipLastSteadySize;
  pipCurrentSize = a4->pipCurrentSize;
  v77 = pipLastSteadySize;
  v13 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  v75[10] = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  v75[11] = v13;
  v75[12] = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  v14 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  v75[6] = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  v75[7] = v14;
  v15 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  v75[8] = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  v75[9] = v15;
  v16 = self->_lastGeometryContext.pipAnchorPointOffset;
  v75[2] = self->_lastGeometryContext.pipStashedSize;
  v75[3] = v16;
  v17 = self->_lastGeometryContext.containerBounds.size;
  v75[4] = self->_lastGeometryContext.containerBounds.origin;
  v75[5] = v17;
  v18 = self->_lastGeometryContext.pipLastSteadySize;
  v75[0] = self->_lastGeometryContext.pipCurrentSize;
  v75[1] = v18;
  if ((SBPIPPositionGeometryContextIsEqualToContext((uint64_t)&pipCurrentSize, (uint64_t)v75) & 1) == 0)
  {
    self->_lastGeometryContext.pipCurrentSize = a4->pipCurrentSize;
    v19 = a4->pipLastSteadySize;
    v20 = a4->pipStashedSize;
    v21 = a4->containerBounds.origin;
    self->_lastGeometryContext.pipAnchorPointOffset = a4->pipAnchorPointOffset;
    self->_lastGeometryContext.containerBounds.origin = v21;
    self->_lastGeometryContext.pipLastSteadySize = v19;
    self->_lastGeometryContext.pipStashedSize = v20;
    v22 = a4->containerBounds.size;
    v23 = *(_OWORD *)&a4->edgeInsets.top;
    v24 = *(_OWORD *)&a4->minimumPadding.top;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom = *(_OWORD *)&a4->edgeInsets.bottom;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top = v24;
    self->_lastGeometryContext.containerBounds.size = v22;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top = v23;
    v25 = *(_OWORD *)&a4->minimumPadding.bottom;
    v26 = *(_OWORD *)&a4->stashedMinimumPadding.top;
    v27 = *(_OWORD *)&a4->offscreenCorners;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    *(_OWORD *)&self->_lastGeometryContext.offscreenCorners = v27;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom = v25;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top = v26;
    -[SBPIPPositionHyperregionLibrary _resetLastKnownRegions](self, "_resetLastKnownRegions");
  }
  -[SBPIPPositionHyperregionLibrary _lastKnownRegionForType:](self, "_lastKnownRegionForType:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    switch(a3)
    {
      case 1:
        v29 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v29;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v30 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v30;
        v31 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v31;
        v32 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v32;
        v33 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v33;
        v34 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v34;
        -[SBPIPPositionHyperregionLibrary _cornersRegionWithGeometry:](self, "_cornersRegionWithGeometry:", &pipCurrentSize);
        v35 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastCornersRegion;
        self->_lastCornersRegion = v35;
        goto LABEL_13;
      case 2:
        v37 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v37;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v38 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v38;
        v39 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v39;
        v40 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v40;
        v41 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v41;
        v42 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v42;
        -[SBPIPPositionHyperregionLibrary _stashedLeftRegionWithGeometry:](self, "_stashedLeftRegionWithGeometry:", &pipCurrentSize);
        v43 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastStashedLeftRegion;
        self->_lastStashedLeftRegion = v43;
        goto LABEL_13;
      case 3:
        v44 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v44;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v45 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v45;
        v46 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v46;
        v47 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v47;
        v48 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v48;
        v49 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v49;
        -[SBPIPPositionHyperregionLibrary _stashedRightRegionWithGeometry:](self, "_stashedRightRegionWithGeometry:", &pipCurrentSize);
        v50 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastStashedRightRegion;
        self->_lastStashedRightRegion = v50;
        goto LABEL_13;
      case 4:
        v51 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v51;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v52 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v52;
        v53 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v53;
        v54 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v54;
        v55 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v55;
        v56 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v56;
        -[SBPIPPositionHyperregionLibrary _offscreenCornersRegionWithGeometry:](self, "_offscreenCornersRegionWithGeometry:", &pipCurrentSize);
        v57 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastOffscreenCorners;
        self->_lastOffscreenCorners = v57;
        goto LABEL_13;
      case 5:
        v58 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v58;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v59 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v59;
        v60 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v60;
        v61 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v61;
        v62 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v62;
        v63 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v63;
        -[SBPIPPositionHyperregionLibrary _containerInsetRegionWithGeometry:](self, "_containerInsetRegionWithGeometry:", &pipCurrentSize);
        v64 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastContainerInsetRegion;
        self->_lastContainerInsetRegion = v64;
        goto LABEL_13;
      case 6:
        v65 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v87 = v65;
        v88 = *(_OWORD *)&a4->offscreenCorners;
        v66 = *(_OWORD *)&a4->edgeInsets.bottom;
        v82 = *(_OWORD *)&a4->edgeInsets.top;
        v83 = v66;
        v67 = *(_OWORD *)&a4->minimumPadding.bottom;
        v84 = *(_OWORD *)&a4->minimumPadding.top;
        v85 = v67;
        v68 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v79 = v68;
        v69 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v81 = v69;
        v70 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v77 = v70;
        -[SBPIPPositionHyperregionLibrary _allUnifiedRegionWithGeometry:](self, "_allUnifiedRegionWithGeometry:", &pipCurrentSize);
        v71 = (_UIHyperregionUnion *)objc_claimAutoreleasedReturnValue();
        lastCornersRegion = self->_lastAllUnified;
        self->_lastAllUnified = v71;
LABEL_13:

        break;
      default:
        break;
    }
    -[SBPIPPositionHyperregionLibrary _lastKnownRegionForType:](self, "_lastKnownRegionForType:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v28;
}

- (id)_lastKnownRegionForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 5)
    self = (SBPIPPositionHyperregionLibrary *)*((id *)&self->_lastGeometryContext.orientation + a3);
  return self;
}

- (void)_resetLastKnownRegions
{
  _UIHyperregionUnion *lastCornersRegion;
  _UIHyperregionUnion *lastStashedLeftRegion;
  _UIHyperregionUnion *lastStashedRightRegion;
  _UIHyperregionUnion *lastOffscreenCorners;
  _UIHyperregionUnion *lastContainerInsetRegion;
  _UIHyperregionUnion *lastAllUnified;

  lastCornersRegion = self->_lastCornersRegion;
  self->_lastCornersRegion = 0;

  lastStashedLeftRegion = self->_lastStashedLeftRegion;
  self->_lastStashedLeftRegion = 0;

  lastStashedRightRegion = self->_lastStashedRightRegion;
  self->_lastStashedRightRegion = 0;

  lastOffscreenCorners = self->_lastOffscreenCorners;
  self->_lastOffscreenCorners = 0;

  lastContainerInsetRegion = self->_lastContainerInsetRegion;
  self->_lastContainerInsetRegion = 0;

  lastAllUnified = self->_lastAllUnified;
  self->_lastAllUnified = 0;

}

- (id)_cornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double v21;
  int v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v31;
  double MaxX;
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[6];
  _OWORD v37[13];
  _QWORD v38[5];
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 2);
  v38[0] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 2);
  v38[1] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 2);
  v38[2] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 2);
  v38[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v37[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v37[11] = v10;
  v37[12] = *(_OWORD *)&a3->offscreenCorners;
  v11 = *(_OWORD *)&a3->edgeInsets.bottom;
  v37[6] = *(_OWORD *)&a3->edgeInsets.top;
  v37[7] = v11;
  v12 = *(_OWORD *)&a3->minimumPadding.bottom;
  v37[8] = *(_OWORD *)&a3->minimumPadding.top;
  v37[9] = v12;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v37[2] = a3->pipStashedSize;
  v37[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v37[4] = a3->containerBounds.origin;
  v37[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v37[0] = a3->pipCurrentSize;
  v37[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedInsetRectWithinContainerBoundsWithGeometry:](self, "_validatedInsetRectWithinContainerBoundsWithGeometry:", v37);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v31 = CGRectGetMaxX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v21 = CGRectGetMaxY(v42);
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, a3->pipCurrentSize.width, a3->pipCurrentSize.height, *(_QWORD *)&a3->containerBounds.origin.x, *(_QWORD *)&a3->containerBounds.origin.y, *(_QWORD *)&a3->containerBounds.size.width, *(_QWORD *)&a3->containerBounds.size.height);
  if (!SBRectContainsPoint())
    MaxY = y;
  v22 = SBRectContainsPoint();
  if (v22)
    v23 = v31;
  else
    v23 = MaxX;
  if (!v22)
    v21 = y;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke;
  v36[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v36[4] = x;
  *(double *)&v36[5] = y;
  objc_msgSend(v24, "_mutateValue:", v36);

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_2;
  v35[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v35[4] = x;
  *(double *)&v35[5] = MaxY;
  objc_msgSend(v26, "_mutateValue:", v35);

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_3;
  v34[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v34[4] = v23;
  *(double *)&v34[5] = v21;
  objc_msgSend(v27, "_mutateValue:", v34);

  objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v25;
  v33[1] = 3221225472;
  v33[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_4;
  v33[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v33[4] = MaxX;
  *(double *)&v33[5] = y;
  objc_msgSend(v28, "_mutateValue:", v33);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  objc_msgSend(v29, "_setRegions:", v9);

  return v29;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_4(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_offscreenCornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  CGPoint origin;
  __int128 v8;
  CGSize pipCurrentSize;
  CGPoint pipAnchorPointOffset;
  unint64_t offscreenCorners;
  id v12;
  _QWORD *v13;
  uint8x8_t v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v21;
  _QWORD v22[2];
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  CGSize v26;
  CGSize pipLastSteadySize;
  CGSize pipStashedSize;
  CGPoint v29;
  CGPoint v30;
  CGSize size;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;

  if (a3->offscreenCorners == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPPositionHyperregionLibrary.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("geometry.offscreenCorners != UIRectCornerAllCorners"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = 3221225472;
  v5 = *(_OWORD *)&a3->minimumPadding.top;
  v35 = *(_OWORD *)&a3->minimumPadding.bottom;
  v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v36 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v37 = v6;
  v38 = *(_OWORD *)&a3->offscreenCorners;
  origin = a3->containerBounds.origin;
  size = a3->containerBounds.size;
  v8 = *(_OWORD *)&a3->edgeInsets.bottom;
  v32 = *(_OWORD *)&a3->edgeInsets.top;
  v33 = v8;
  v34 = v5;
  pipCurrentSize = a3->pipCurrentSize;
  pipLastSteadySize = a3->pipLastSteadySize;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  pipStashedSize = a3->pipStashedSize;
  v29 = pipAnchorPointOffset;
  v30 = origin;
  offscreenCorners = a3->offscreenCorners;
  v22[0] = MEMORY[0x1E0C809B0];
  v23 = __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke;
  v24 = &unk_1E8EB6638;
  v26 = pipCurrentSize;
  v12 = v4;
  v25 = v12;
  v13 = v22;
  if (offscreenCorners)
  {
    v39 = 0;
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)offscreenCorners);
    v14.i16[0] = vaddlv_u8(v14);
    v15 = v14.i32[0];
    if (v14.i32[0])
    {
      v16 = 0;
      do
      {
        if (((1 << v16) & offscreenCorners) != 0)
        {
          ((void (*)(_QWORD *))v23)(v13);
          if (v39)
            break;
          --v15;
        }
        if (v16 > 0x3E)
          break;
        ++v16;
      }
      while (v15 > 0);
    }
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  objc_msgSend(v17, "_setRegions:", v12);

  return v17;
}

void __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[6];

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD58]), "initWithDimensions:", 2);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 56) * 0.5;
  if (a2 == 8 || a2 == 2)
    v6 = v5 + CGRectGetMaxX(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 192);
  else
    v6 = CGRectGetMinX(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 192) - v5;
  v7 = v4 * 0.5;
  if (a2 == 8 || a2 == 4)
    v8 = v7 + CGRectGetMaxY(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 184);
  else
    v8 = CGRectGetMinY(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 168) - v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke_2;
  v10[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v10[4] = v6;
  *(double *)&v10[5] = v8;
  objc_msgSend(v9, "_mutateValue:", v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

double __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_stashedLeftRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MaxX;
  CGFloat MaxY;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[8];
  _OWORD v26[13];
  _QWORD v27[2];
  CGRect v28;
  CGRect v29;

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v26[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v26[11] = v6;
  v26[12] = *(_OWORD *)&a3->offscreenCorners;
  v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v26[6] = *(_OWORD *)&a3->edgeInsets.top;
  v26[7] = v7;
  v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v26[8] = *(_OWORD *)&a3->minimumPadding.top;
  v26[9] = v8;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v26[2] = a3->pipStashedSize;
  v26[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v26[4] = a3->containerBounds.origin;
  v26[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v26[0] = a3->pipCurrentSize;
  v26[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedMinimumPaddingAndEdgeInsetInsetRect:](self, "_validatedMinimumPaddingAndEdgeInsetInsetRect:", v26);
  v13 = v12;
  v15 = v14;
  v16 = a3->pipCurrentSize.width * -0.5;
  v17 = CGRectGetMinX(a3->containerBounds) + v16;
  v28.size.width = 0.0;
  v28.origin.x = v17;
  v28.origin.y = v13;
  v28.size.height = v15;
  MaxX = CGRectGetMaxX(v28);
  v29.size.width = 0.0;
  v29.origin.x = v17;
  v29.origin.y = v13;
  v29.size.height = v15;
  MaxY = CGRectGetMaxY(v29);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD60]), "initWithDimensions:", 2);
  v21 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke;
  v25[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v25[4] = v17;
  *(CGFloat *)&v25[5] = v13;
  v25[6] = 0;
  *(CGFloat *)&v25[7] = v15;
  objc_msgSend(v20, "_mutateMinimumPoint:", v25);
  v24[0] = v21;
  v24[1] = 3221225472;
  v24[2] = __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke_2;
  v24[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v24[4] = MaxX;
  *(CGFloat *)&v24[5] = MaxY;
  objc_msgSend(v20, "_mutateMaximumPoint:", v24);
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRegions:", v22);

  return v5;
}

double __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_stashedRightRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MaxX;
  CGFloat MaxY;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[8];
  _OWORD v26[13];
  _QWORD v27[2];
  CGRect v28;
  CGRect v29;

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v26[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v26[11] = v6;
  v26[12] = *(_OWORD *)&a3->offscreenCorners;
  v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v26[6] = *(_OWORD *)&a3->edgeInsets.top;
  v26[7] = v7;
  v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v26[8] = *(_OWORD *)&a3->minimumPadding.top;
  v26[9] = v8;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v26[2] = a3->pipStashedSize;
  v26[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v26[4] = a3->containerBounds.origin;
  v26[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v26[0] = a3->pipCurrentSize;
  v26[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedMinimumPaddingAndEdgeInsetInsetRect:](self, "_validatedMinimumPaddingAndEdgeInsetInsetRect:", v26);
  v13 = v12;
  v15 = v14;
  v16 = a3->pipCurrentSize.width * 0.5;
  v17 = v16 + CGRectGetMaxX(a3->containerBounds);
  v28.size.width = 0.0;
  v28.origin.x = v17;
  v28.origin.y = v13;
  v28.size.height = v15;
  MaxX = CGRectGetMaxX(v28);
  v29.size.width = 0.0;
  v29.origin.x = v17;
  v29.origin.y = v13;
  v29.size.height = v15;
  MaxY = CGRectGetMaxY(v29);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD60]), "initWithDimensions:", 2);
  v21 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke;
  v25[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v25[4] = v17;
  *(CGFloat *)&v25[5] = v13;
  v25[6] = 0;
  *(CGFloat *)&v25[7] = v15;
  objc_msgSend(v20, "_mutateMinimumPoint:", v25);
  v24[0] = v21;
  v24[1] = 3221225472;
  v24[2] = __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke_2;
  v24[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v24[4] = MaxX;
  *(CGFloat *)&v24[5] = MaxY;
  objc_msgSend(v20, "_mutateMaximumPoint:", v24);
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRegions:", v22);

  return v5;
}

double __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_containerInsetRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  CGFloat MaxY;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[8];
  _OWORD v24[13];
  _QWORD v25[2];
  CGRect v26;
  CGRect v27;

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v24[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v24[11] = v6;
  v24[12] = *(_OWORD *)&a3->offscreenCorners;
  v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v24[6] = *(_OWORD *)&a3->edgeInsets.top;
  v24[7] = v7;
  v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v24[8] = *(_OWORD *)&a3->minimumPadding.top;
  v24[9] = v8;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v24[2] = a3->pipStashedSize;
  v24[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v24[4] = a3->containerBounds.origin;
  v24[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v24[0] = a3->pipCurrentSize;
  v24[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedInsetRectWithinContainerBoundsWithGeometry:](self, "_validatedInsetRectWithinContainerBoundsWithGeometry:", v24);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD60]), "initWithDimensions:", 2);
  v19 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke;
  v23[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v23[4] = x;
  *(CGFloat *)&v23[5] = y;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  objc_msgSend(v18, "_mutateMinimumPoint:", v23);
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke_2;
  v22[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v22[4] = MaxX;
  *(CGFloat *)&v22[5] = MaxY;
  objc_msgSend(v18, "_mutateMaximumPoint:", v22);
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRegions:", v20);

  return v5;
}

double __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_allUnifiedRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  CGFloat MaxY;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[8];
  _OWORD v24[13];
  _QWORD v25[2];
  CGRect v26;
  CGRect v27;

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", 2);
  v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v24[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v24[11] = v6;
  v24[12] = *(_OWORD *)&a3->offscreenCorners;
  v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v24[6] = *(_OWORD *)&a3->edgeInsets.top;
  v24[7] = v7;
  v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v24[8] = *(_OWORD *)&a3->minimumPadding.top;
  v24[9] = v8;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v24[2] = a3->pipStashedSize;
  v24[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v24[4] = a3->containerBounds.origin;
  v24[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v24[0] = a3->pipCurrentSize;
  v24[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedStashedToStashedMaximumumRectWithGeometry:](self, "_validatedStashedToStashedMaximumumRectWithGeometry:", v24);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD60]), "initWithDimensions:", 2);
  v19 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke;
  v23[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v23[4] = x;
  *(CGFloat *)&v23[5] = y;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  objc_msgSend(v18, "_mutateMinimumPoint:", v23);
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke_2;
  v22[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v22[4] = MaxX;
  *(CGFloat *)&v22[5] = MaxY;
  objc_msgSend(v18, "_mutateMaximumPoint:", v22);
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRegions:", v20);

  return v5;
}

double __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (CGRect)_validatedInsetRectWithinContainerBoundsWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v3;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  char v17;
  _BOOL4 IsNull;
  BOOL v19;
  double left;
  double top;
  double bottom;
  double right;
  int64_t orientation;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  NSSize v75;
  CGFloat aRect;
  CGFloat aRect_8;
  CGFloat aRect_16;
  CGFloat aRect_24;
  CGFloat v80;
  uint8_t buf[4];
  SBPIPPositionHyperregionLibrary *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  NSRect v101;
  NSRect v102;
  NSRect v103;
  NSRect v104;
  CGRect v105;
  NSRect v106;
  NSRect v107;
  NSRect v108;
  NSRect v109;
  NSRect v110;
  NSRect v111;
  NSRect v112;
  CGRect result;
  CGRect v114;

  v95 = *MEMORY[0x1E0C80C00];
  width = a3->pipCurrentSize.width;
  height = a3->pipCurrentSize.height;
  x = a3->containerBounds.origin.x;
  y = a3->containerBounds.origin.y;
  v11 = a3->containerBounds.size.width;
  v10 = a3->containerBounds.size.height;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, a3->pipCurrentSize.width, height, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v11, *(_QWORD *)&v10);
  aRect_24 = v13;
  v80 = v12;
  aRect_8 = v15;
  aRect_16 = v14;
  v16 = __sb__runningInSpringBoard();
  v17 = v16;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_22;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v17 & 1) != 0)
        goto LABEL_22;
LABEL_12:

      goto LABEL_22;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_12;
  }
  v96.origin.y = aRect_24;
  v96.origin.x = v80;
  v96.size.height = aRect_8;
  v96.size.width = aRect_16;
  IsNull = CGRectIsNull(v96);
  v19 = IsNull;
  if ((v17 & 1) != 0)
  {
    if (!IsNull)
      goto LABEL_22;
  }
  else
  {

    if (!v19)
      goto LABEL_22;
  }
  top = a3->minimumPadding.top;
  left = a3->minimumPadding.left;
  bottom = a3->minimumPadding.bottom;
  right = a3->minimumPadding.right;
  orientation = a3->orientation;
  if ((unint64_t)(orientation - 3) > 1)
  {
    if (orientation == 1)
      top = a3->edgeInsets.top;
    else
      bottom = a3->edgeInsets.bottom;
  }
  else if (orientation == 3)
  {
    left = a3->edgeInsets.left;
  }
  else
  {
    right = a3->edgeInsets.right;
  }
  v97.origin.x = x + left;
  v97.origin.y = y + top;
  v97.size.width = v11 - (right + left);
  v97.size.height = v10 - (bottom + top);
  v98 = CGRectInset(v97, width * 0.5, height * 0.5);
  aRect_24 = v98.origin.y;
  v80 = v98.origin.x;
  aRect_8 = v98.size.height;
  aRect_16 = v98.size.width;
LABEL_22:
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->minimumPadding.top, a3->minimumPadding.left, a3->minimumPadding.bottom, a3->minimumPadding.right, width, height, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v11, *(_QWORD *)&v10);
  v73 = v11;
  v74 = v10;
  v72 = y;
  v75.height = height;
  aRect = x;
  v25 = v99.origin.x;
  v75.width = width;
  v26 = v99.origin.y;
  v27 = v99.size.width;
  v28 = v99.size.height;
  v114.origin.y = aRect_24;
  v114.origin.x = v80;
  v114.size.height = aRect_8;
  v114.size.width = aRect_16;
  v100 = CGRectIntersection(v99, v114);
  v29 = v100.origin.x;
  v30 = v100.origin.y;
  v31 = v100.size.width;
  v32 = v100.size.height;
  v33 = CGRectIsNull(v100);
  v68 = v28;
  v69 = v27;
  if (v33)
    v34 = v28;
  else
    v34 = v32;
  if (v33)
    v35 = v27;
  else
    v35 = v31;
  v70 = v26;
  v71 = v25;
  if (v33)
    v36 = v26;
  else
    v36 = v30;
  if (v33)
    v37 = v25;
  else
    v37 = v29;
  v38 = v37;
  v39 = v36;
  v40 = v35;
  v41 = v34;
  if (CGRectIsNull(*(CGRect *)(&v34 - 3)))
  {
    -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), v75, *(_QWORD *)&aRect, *(_QWORD *)&v72, *(_QWORD *)&v73, *(_QWORD *)&v74);
    v38 = v42;
    v39 = v43;
    v40 = v44;
    v41 = v45;
    SBLogPIP();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v101.origin.y = aRect_24;
      v101.origin.x = v80;
      v101.size.height = aRect_8;
      v101.size.width = aRect_16;
      NSStringFromRect(v101);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v102.origin.y = v70;
      v102.origin.x = v71;
      v102.size.height = v68;
      v102.size.width = v69;
      NSStringFromRect(v102);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSize(v75);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v103.origin.x = aRect;
      v103.origin.y = v72;
      v103.size.width = v73;
      v103.size.height = v74;
      NSStringFromRect(v103);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromUIEdgeInsets(a3->minimumPadding);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v104.origin.x = v38;
      v104.origin.y = v39;
      v104.size.width = v40;
      v104.size.height = v41;
      NSStringFromRect(v104);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v82 = self;
      v83 = 2114;
      v84 = v47;
      v85 = 2114;
      v86 = v48;
      v87 = 2114;
      v88 = v49;
      v89 = 2114;
      v90 = v50;
      v91 = 2114;
      v92 = v51;
      v93 = 2114;
      v94 = v52;
      _os_log_error_impl(&dword_1D0540000, v46, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library falling back to maximum rect size as inset rect is still too small. Desired inset rect: %{public}@, minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);

    }
  }
  else
  {
    v105.origin.x = v29;
    v105.origin.y = v30;
    v105.size.width = v31;
    v105.size.height = v32;
    if (!CGRectIsNull(v105))
      goto LABEL_41;
    SBLogPIP();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v109.origin.y = aRect_24;
      v109.origin.x = v80;
      v109.size.height = aRect_8;
      v109.size.width = aRect_16;
      NSStringFromRect(v109);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v110.origin.y = v70;
      v110.origin.x = v71;
      v110.size.height = v68;
      v110.size.width = v69;
      NSStringFromRect(v110);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSize(v75);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v111.origin.x = aRect;
      v111.origin.y = v72;
      v111.size.width = v73;
      v111.size.height = v74;
      NSStringFromRect(v111);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromUIEdgeInsets(a3->minimumPadding);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v112.origin.x = v38;
      v112.origin.y = v39;
      v112.size.width = v40;
      v112.size.height = v41;
      NSStringFromRect(v112);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v82 = self;
      v83 = 2114;
      v84 = v62;
      v85 = 2114;
      v86 = v63;
      v87 = 2114;
      v88 = v64;
      v89 = 2114;
      v90 = v65;
      v91 = 2114;
      v92 = v66;
      v93 = 2114;
      v94 = v67;
      _os_log_error_impl(&dword_1D0540000, v46, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library couldn't satisfy required edge insets. Desired inset rect: %{public}@, minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);

    }
  }

LABEL_41:
  SBLogPIP();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    v106.origin.x = v38;
    v106.origin.y = v39;
    v106.size.width = v40;
    v106.size.height = v41;
    NSStringFromRect(v106);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUIEdgeInsets(a3->edgeInsets);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v107.origin.y = v70;
    v107.origin.x = v71;
    v107.size.height = v68;
    v107.size.width = v69;
    NSStringFromRect(v107);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v108.origin.x = v29;
    v108.size.width = v31;
    v108.origin.y = v30;
    v108.size.height = v32;
    NSStringFromRect(v108);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v82 = self;
    v83 = 2114;
    v84 = v58;
    v85 = 2114;
    v86 = v59;
    v87 = 2114;
    v88 = v60;
    v89 = 2114;
    v90 = v61;
    _os_log_debug_impl(&dword_1D0540000, v53, OS_LOG_TYPE_DEBUG, "[%p][Layout][Insets] Validated inset rect: validatedInsetRect%{public}@\t for edgeInsets{%{public}@} minimumInsetRect{%{public}@} insetsIntersection{%{public}@}", buf, 0x34u);

  }
  v54 = v38;
  v55 = v39;
  v56 = v40;
  v57 = v41;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (CGRect)_validatedMinimumPaddingAndEdgeInsetInsetRect:(SBPIPPositionGeometryContext *)a3
{
  double width;
  double height;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double v21;
  double v22;
  double v23;
  _BOOL4 IsNull;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  NSObject *v29;
  CGFloat v30;
  int v31;
  BOOL v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  NSObject *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat aRect;
  CGFloat v62;
  CGFloat y;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  uint8_t buf[4];
  SBPIPPositionHyperregionLibrary *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  int v85;
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  NSRect v90;
  NSRect v91;
  NSRect v92;
  NSRect v93;
  NSRect v94;
  NSRect v95;
  NSRect v96;
  NSRect v97;
  CGRect result;
  CGRect v99;

  v86 = *MEMORY[0x1E0C80C00];
  width = a3->pipStashedSize.width;
  height = a3->pipStashedSize.height;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->stashedMinimumPadding.top, a3->stashedMinimumPadding.left, a3->stashedMinimumPadding.bottom, a3->stashedMinimumPadding.right, width, height, *(_QWORD *)&a3->containerBounds.origin.x, *(_QWORD *)&a3->containerBounds.origin.y, *(_QWORD *)&a3->containerBounds.size.width, *(_QWORD *)&a3->containerBounds.size.height);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v69 = v11;
  v14 = v13;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, width, height, *(_QWORD *)&a3->containerBounds.origin.x, *(_QWORD *)&a3->containerBounds.origin.y, *(_QWORD *)&a3->containerBounds.size.width, *(_QWORD *)&a3->containerBounds.size.height);
  v16 = v15;
  v99.origin.y = v17;
  v99.size.width = v18;
  v99.size.height = v19;
  v87.origin.x = v8;
  v87.origin.y = v10;
  v87.size.width = v12;
  v87.size.height = v14;
  v99.origin.x = v16;
  v62 = v99.size.width;
  y = v99.origin.y;
  aRect = v99.size.height;
  v88 = CGRectIntersection(v87, v99);
  x = v88.origin.x;
  v21 = v88.origin.y;
  v22 = v88.size.width;
  v23 = v88.size.height;
  IsNull = CGRectIsNull(v88);
  if (IsNull)
    v25 = v8;
  else
    v25 = x;
  v65 = v8;
  v66 = v25;
  v64 = v10;
  if (IsNull)
    v26 = v10;
  else
    v26 = v21;
  v27 = v69;
  if (!IsNull)
    v27 = v22;
  v67 = v27;
  v68 = v14;
  if (IsNull)
    v28 = v14;
  else
    v28 = v23;
  v59 = x;
  v60 = v21;
  v89.origin.x = x;
  v89.origin.y = v21;
  v57 = v22;
  v58 = v23;
  v89.size.width = v22;
  v89.size.height = v23;
  if (CGRectIsNull(v89))
  {
    SBLogPIP();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v95.origin.x = v16;
      v95.size.width = v62;
      v95.origin.y = y;
      v95.size.height = aRect;
      NSStringFromRect(v95);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v96.origin.y = v64;
      v96.origin.x = v65;
      v96.size.height = v14;
      v96.size.width = v69;
      NSStringFromRect(v96);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSize(a3->pipCurrentSize);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromRect(a3->containerBounds);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromUIEdgeInsets(a3->stashedMinimumPadding);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v97.origin.x = v66;
      v97.size.width = v67;
      v97.origin.y = v26;
      v97.size.height = v28;
      NSStringFromRect(v97);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v71 = self;
      v72 = 2114;
      v73 = v51;
      v74 = 2114;
      v75 = v52;
      v76 = 2114;
      v77 = v53;
      v78 = 2114;
      v79 = v54;
      v80 = 2114;
      v81 = v55;
      v82 = 2114;
      v83 = v56;
      _os_log_error_impl(&dword_1D0540000, v29, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library couldn't satisfy required edge insets. Desired inset rect: %{public}@, stashed minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);

    }
  }
  v30 = v16;
  v31 = 0;
  if (self->_isPad)
  {
    v33 = v26;
    v34 = v28;
    v35 = v28;
    v36 = v26;
    v38 = v66;
    v37 = v67;
    v39 = v66;
  }
  else
  {
    v32 = v28 / v68 < 0.7;
    v33 = v26;
    v34 = v28;
    v35 = v28;
    v36 = v26;
    v38 = v66;
    v37 = v67;
    v39 = v66;
    if (v32)
    {
      v31 = 1;
      v36 = v64;
      v39 = v65;
      v35 = v68;
      v37 = v69;
    }
  }
  SBLogPIP();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v90.origin.x = v39;
    v90.origin.y = v36;
    v90.size.width = v37;
    v90.size.height = v35;
    NSStringFromRect(v90);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUIEdgeInsets(a3->edgeInsets);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v91.origin.y = v64;
    v91.origin.x = v65;
    v91.size.height = v68;
    v91.size.width = v69;
    NSStringFromRect(v91);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v92.origin.x = v30;
    v92.size.width = v62;
    v92.origin.y = y;
    v92.size.height = aRect;
    NSStringFromRect(v92);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v93.origin.x = v59;
    v93.origin.y = v60;
    v93.size.width = v57;
    v93.size.height = v58;
    NSStringFromRect(v93);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v94.origin.x = v38;
    v94.origin.y = v33;
    v94.size.width = v67;
    v94.size.height = v34;
    NSStringFromRect(v94);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219778;
    v71 = self;
    v72 = 2114;
    v73 = v45;
    v74 = 2114;
    v75 = v46;
    v76 = 2114;
    v77 = v47;
    v78 = 2114;
    v79 = v48;
    v80 = 2114;
    v81 = v49;
    v82 = 2114;
    v83 = v50;
    v84 = 1024;
    v85 = v31;
    _os_log_debug_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEBUG, "[%p][Layout][Insets] Validated container inset rect for stashed-sized PIP: validatedInsetRect%{public}@\t for edgeInsets{%{public}@} minimumPaddingRect{%{public}@} insetRect{%{public}@} intersection{%{public}@} validatedRect{%{public}@} shouldIgnoreInsetRect{%{BOOL}u}", buf, 0x4Eu);

  }
  v41 = v39;
  v42 = v36;
  v43 = v37;
  v44 = v35;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGRect)_validatedStashedToStashedMaximumumRectWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  void *v3;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  __int128 v10;
  __int128 v11;
  CGSize pipLastSteadySize;
  CGPoint pipAnchorPointOffset;
  CGPoint origin;
  double width;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  int v23;
  char v24;
  int64_t orientation;
  int64_t *p_orientation;
  unint64_t v27;
  double y;
  double x;
  CGFloat v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGPoint v35;
  CGSize v36;
  CGSize v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGSize pipCurrentSize;
  CGSize v43;
  CGSize pipStashedSize;
  CGPoint v45;
  CGPoint v46;
  CGSize v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v59;

  v6 = *(_OWORD *)&a3->minimumPadding.bottom;
  v7 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v8 = *(_OWORD *)&a3->offscreenCorners;
  v52 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v53 = v7;
  v54 = v8;
  size = a3->containerBounds.size;
  v10 = *(_OWORD *)&a3->edgeInsets.bottom;
  v11 = *(_OWORD *)&a3->minimumPadding.top;
  v48 = *(_OWORD *)&a3->edgeInsets.top;
  v49 = v10;
  v50 = v11;
  v51 = v6;
  pipLastSteadySize = a3->pipLastSteadySize;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  origin = a3->containerBounds.origin;
  pipStashedSize = a3->pipStashedSize;
  v45 = pipAnchorPointOffset;
  width = a3->pipLastSteadySize.width;
  v46 = origin;
  v47 = size;
  pipCurrentSize = a3->pipCurrentSize;
  v43 = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary _validatedMinimumPaddingAndEdgeInsetInsetRect:](self, "_validatedMinimumPaddingAndEdgeInsetInsetRect:", &pipCurrentSize);
  v17 = v16;
  height = v18;
  v20 = width * 0.5;
  v21 = CGRectGetMinX(a3->containerBounds) - width * 0.5;
  v22 = width + CGRectGetWidth(a3->containerBounds);
  v23 = __sb__runningInSpringBoard();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "userInterfaceIdiom") && SBFEffectiveHomeButtonType() == 2)
    {
      p_orientation = &a3->orientation;
      v27 = a3->orientation - 3;

      if (v27 >= 2)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_19;
  }
  v24 = v23;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    goto LABEL_19;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if ((v24 & 1) != 0)
      goto LABEL_19;
    goto LABEL_13;
  }
  p_orientation = &a3->orientation;
  orientation = a3->orientation;
  if ((v24 & 1) != 0)
  {
    if ((unint64_t)(orientation - 3) > 1)
      goto LABEL_19;
    goto LABEL_16;
  }
  if ((unint64_t)(orientation - 3) > 1)
    goto LABEL_19;
LABEL_15:
  orientation = *p_orientation;
LABEL_16:
  if (orientation == 3)
    v21 = v20;
  v22 = CGRectGetWidth(a3->containerBounds);
LABEL_19:
  x = a3->pipAnchorPointOffset.x;
  y = a3->pipAnchorPointOffset.y;
  if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v30 = -fabs(x);
    v31 = -fabs(y);
    v55.origin.x = v21;
    v55.origin.y = v17;
    v55.size.width = v22;
    v55.size.height = height;
    v56 = CGRectInset(v55, v30, v31);
    v21 = v56.origin.x;
    v17 = v56.origin.y;
    v22 = v56.size.width;
    height = v56.size.height;
  }
  v32 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v52 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v53 = v32;
  v54 = *(_OWORD *)&a3->offscreenCorners;
  v33 = *(_OWORD *)&a3->edgeInsets.bottom;
  v48 = *(_OWORD *)&a3->edgeInsets.top;
  v49 = v33;
  v34 = *(_OWORD *)&a3->minimumPadding.bottom;
  v50 = *(_OWORD *)&a3->minimumPadding.top;
  v51 = v34;
  v35 = a3->pipAnchorPointOffset;
  pipStashedSize = a3->pipStashedSize;
  v45 = v35;
  v36 = a3->containerBounds.size;
  v46 = a3->containerBounds.origin;
  v47 = v36;
  v37 = a3->pipLastSteadySize;
  pipCurrentSize = a3->pipCurrentSize;
  v43 = v37;
  -[SBPIPPositionHyperregionLibrary _validatedInsetRectWithinContainerBoundsWithGeometry:](self, "_validatedInsetRectWithinContainerBoundsWithGeometry:", &pipCurrentSize);
  v59.origin.x = v38;
  v59.origin.y = v39;
  v59.size.width = v40;
  v59.size.height = v41;
  v57.origin.x = v21;
  v57.origin.y = v17;
  v57.size.width = v22;
  v57.size.height = height;
  return CGRectUnion(v57, v59);
}

- (CGRect)_insetRectForEdgeInsets:(UIEdgeInsets)a3 pipSize:(CGSize)a4 containerBounds:(CGRect)a5
{
  CGFloat v5;
  CGFloat v6;
  CGRect v7;

  v5 = a3.top + a5.origin.y;
  v6 = a5.size.width - (a3.left + a3.right);
  v7.size.height = a5.size.height - (a3.top + a3.bottom);
  v7.origin.x = a3.left + a5.origin.x;
  v7.origin.y = v5;
  v7.size.width = v6;
  return CGRectInset(v7, a4.width * 0.5, a4.height * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAllUnified, 0);
  objc_storeStrong((id *)&self->_lastContainerInsetRegion, 0);
  objc_storeStrong((id *)&self->_lastOffscreenCorners, 0);
  objc_storeStrong((id *)&self->_lastStashedRightRegion, 0);
  objc_storeStrong((id *)&self->_lastStashedLeftRegion, 0);
  objc_storeStrong((id *)&self->_lastCornersRegion, 0);
}

@end
