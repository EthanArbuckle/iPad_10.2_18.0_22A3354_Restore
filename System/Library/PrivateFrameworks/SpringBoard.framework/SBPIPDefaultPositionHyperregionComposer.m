@implementation SBPIPDefaultPositionHyperregionComposer

- (SBPIPDefaultPositionHyperregionComposer)init
{
  SBPIPDefaultPositionHyperregionComposer *v2;
  void *v3;
  SBPIPPositionHyperregionLibrary *v4;
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPDefaultPositionHyperregionComposer;
  v2 = -[SBPIPDefaultPositionHyperregionComposer init](&v7, sel_init);
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
    v4 = objc_alloc_init(SBPIPPositionHyperregionLibrary);
    regionsLibrary = v2->_regionsLibrary;
    v2->_regionsLibrary = v4;

  }
  return v2;
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "positionRegionComposerDidInvalidate:", self);

}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  CGSize v8;
  CGPoint v9;
  CGPoint v10;
  CGSize v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSDictionary *lastResolvedRegionsMap;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGPoint v25;
  CGSize v26;
  CGSize v27;
  CGSize v28;
  CGSize v29;
  CGPoint v30;
  CGSize v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  NSDictionary *v37;
  NSDictionary *lastRegionsMap;
  NSDictionary *v39;
  NSDictionary *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGPoint v44;
  CGSize v45;
  CGSize v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGPoint v50;
  CGSize v51;
  CGSize v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGPoint v56;
  CGSize v57;
  CGSize v58;
  NSDictionary *v59;
  NSDictionary *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGPoint v64;
  CGSize v65;
  CGSize v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CGPoint v70;
  CGSize v71;
  CGSize v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGPoint v76;
  CGSize v77;
  CGSize v78;
  CGPoint v79;
  CGSize v80;
  NSDictionary *v81;
  CGSize v83;
  CGSize v84;
  CGSize v85;
  CGPoint v86;
  CGPoint v87;
  CGSize v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CGSize pipCurrentSize;
  CGSize v97;
  CGSize pipStashedSize;
  CGPoint v99;
  CGPoint origin;
  CGSize v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;

  v8 = *(CGSize *)&self->_lastInteractionStateContext.projectedPosition.y;
  v9 = *(CGPoint *)&self->_lastInteractionStateContext.currentPosition.y;
  pipStashedSize = *(CGSize *)&self->_lastInteractionStateContext.initialPosition.y;
  v99 = v9;
  origin.x = self->_lastInteractionStateContext.projectedPositionStashProgress;
  pipCurrentSize = *(CGSize *)&self->_lastInteractionStateContext.isStashed;
  v97 = v8;
  v10 = *(CGPoint *)&a5->currentPosition.y;
  v85 = *(CGSize *)&a5->initialPosition.y;
  v86 = v10;
  v87.x = a5->projectedPositionStashProgress;
  v11 = *(CGSize *)&a5->projectedPosition.y;
  v83 = *(CGSize *)&a5->isStashed;
  v84 = v11;
  if ((SBPIPPositionInteractionStateContextIsEqualToContext((unsigned __int8 *)&pipCurrentSize, (unsigned __int8 *)&v83) & 1) == 0)
  {
    *(_OWORD *)&self->_lastInteractionStateContext.isStashed = *(_OWORD *)&a5->isStashed;
    v12 = *(_OWORD *)&a5->projectedPosition.y;
    v13 = *(_OWORD *)&a5->initialPosition.y;
    v14 = *(_OWORD *)&a5->currentPosition.y;
    self->_lastInteractionStateContext.projectedPositionStashProgress = a5->projectedPositionStashProgress;
    *(_OWORD *)&self->_lastInteractionStateContext.initialPosition.y = v13;
    *(_OWORD *)&self->_lastInteractionStateContext.currentPosition.y = v14;
    *(_OWORD *)&self->_lastInteractionStateContext.projectedPosition.y = v12;
    lastResolvedRegionsMap = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = 0;

  }
  v16 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  v106 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  v107 = v16;
  v108 = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  v17 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  v102 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  v103 = v17;
  v18 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  v104 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  v105 = v18;
  pipAnchorPointOffset = self->_lastGeometryContext.pipAnchorPointOffset;
  pipStashedSize = self->_lastGeometryContext.pipStashedSize;
  v99 = pipAnchorPointOffset;
  size = self->_lastGeometryContext.containerBounds.size;
  origin = self->_lastGeometryContext.containerBounds.origin;
  v101 = size;
  pipLastSteadySize = self->_lastGeometryContext.pipLastSteadySize;
  pipCurrentSize = self->_lastGeometryContext.pipCurrentSize;
  v97 = pipLastSteadySize;
  v22 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  v93 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  v94 = v22;
  v95 = *(_OWORD *)&a4->offscreenCorners;
  v23 = *(_OWORD *)&a4->edgeInsets.bottom;
  v89 = *(_OWORD *)&a4->edgeInsets.top;
  v90 = v23;
  v24 = *(_OWORD *)&a4->minimumPadding.bottom;
  v91 = *(_OWORD *)&a4->minimumPadding.top;
  v92 = v24;
  v25 = a4->pipAnchorPointOffset;
  v85 = a4->pipStashedSize;
  v86 = v25;
  v26 = a4->containerBounds.size;
  v87 = a4->containerBounds.origin;
  v88 = v26;
  v27 = a4->pipLastSteadySize;
  v83 = a4->pipCurrentSize;
  v84 = v27;
  if ((SBPIPPositionGeometryContextIsEqualToContext((uint64_t)&pipCurrentSize, (uint64_t)&v83) & 1) == 0)
  {
    self->_lastGeometryContext.pipCurrentSize = a4->pipCurrentSize;
    v28 = a4->pipLastSteadySize;
    v29 = a4->pipStashedSize;
    v30 = a4->containerBounds.origin;
    self->_lastGeometryContext.pipAnchorPointOffset = a4->pipAnchorPointOffset;
    self->_lastGeometryContext.containerBounds.origin = v30;
    self->_lastGeometryContext.pipLastSteadySize = v28;
    self->_lastGeometryContext.pipStashedSize = v29;
    v31 = a4->containerBounds.size;
    v32 = *(_OWORD *)&a4->edgeInsets.top;
    v33 = *(_OWORD *)&a4->minimumPadding.top;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom = *(_OWORD *)&a4->edgeInsets.bottom;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top = v33;
    self->_lastGeometryContext.containerBounds.size = v31;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top = v32;
    v34 = *(_OWORD *)&a4->minimumPadding.bottom;
    v35 = *(_OWORD *)&a4->stashedMinimumPadding.top;
    v36 = *(_OWORD *)&a4->offscreenCorners;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    *(_OWORD *)&self->_lastGeometryContext.offscreenCorners = v36;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom = v34;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top = v35;
    v37 = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = 0;

    lastRegionsMap = self->_lastRegionsMap;
    self->_lastRegionsMap = 0;

  }
  v39 = self->_lastResolvedRegionsMap;
  if (!v39)
  {
    if (!self->_lastRegionsMap)
    {
      v40 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      v41 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      v107 = v41;
      v108 = *(_OWORD *)&a4->offscreenCorners;
      v42 = *(_OWORD *)&a4->edgeInsets.bottom;
      v102 = *(_OWORD *)&a4->edgeInsets.top;
      v103 = v42;
      v43 = *(_OWORD *)&a4->minimumPadding.bottom;
      v104 = *(_OWORD *)&a4->minimumPadding.top;
      v105 = v43;
      v44 = a4->pipAnchorPointOffset;
      pipStashedSize = a4->pipStashedSize;
      v99 = v44;
      v45 = a4->containerBounds.size;
      origin = a4->containerBounds.origin;
      v101 = v45;
      v46 = a4->pipLastSteadySize;
      pipCurrentSize = a4->pipCurrentSize;
      v97 = v46;
      -[SBPIPDefaultPositionHyperregionComposer _addRegionWithType:geometry:toMap:](self, "_addRegionWithType:geometry:toMap:", 1, &pipCurrentSize, v40);
      v47 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      v107 = v47;
      v108 = *(_OWORD *)&a4->offscreenCorners;
      v48 = *(_OWORD *)&a4->edgeInsets.bottom;
      v102 = *(_OWORD *)&a4->edgeInsets.top;
      v103 = v48;
      v49 = *(_OWORD *)&a4->minimumPadding.bottom;
      v104 = *(_OWORD *)&a4->minimumPadding.top;
      v105 = v49;
      v50 = a4->pipAnchorPointOffset;
      pipStashedSize = a4->pipStashedSize;
      v99 = v50;
      v51 = a4->containerBounds.size;
      origin = a4->containerBounds.origin;
      v101 = v51;
      v52 = a4->pipLastSteadySize;
      pipCurrentSize = a4->pipCurrentSize;
      v97 = v52;
      -[SBPIPDefaultPositionHyperregionComposer _addRegionWithType:geometry:toMap:](self, "_addRegionWithType:geometry:toMap:", 2, &pipCurrentSize, v40);
      v53 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      v107 = v53;
      v108 = *(_OWORD *)&a4->offscreenCorners;
      v54 = *(_OWORD *)&a4->edgeInsets.bottom;
      v102 = *(_OWORD *)&a4->edgeInsets.top;
      v103 = v54;
      v55 = *(_OWORD *)&a4->minimumPadding.bottom;
      v104 = *(_OWORD *)&a4->minimumPadding.top;
      v105 = v55;
      v56 = a4->pipAnchorPointOffset;
      pipStashedSize = a4->pipStashedSize;
      v99 = v56;
      v57 = a4->containerBounds.size;
      origin = a4->containerBounds.origin;
      v101 = v57;
      v58 = a4->pipLastSteadySize;
      pipCurrentSize = a4->pipCurrentSize;
      v97 = v58;
      -[SBPIPDefaultPositionHyperregionComposer _addRegionWithType:geometry:toMap:](self, "_addRegionWithType:geometry:toMap:", 3, &pipCurrentSize, v40);
      v59 = self->_lastRegionsMap;
      self->_lastRegionsMap = v40;

    }
    v60 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_lastRegionsMap);
    if (a5->hasActiveGesture)
    {
      v61 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      v107 = v61;
      v108 = *(_OWORD *)&a4->offscreenCorners;
      v62 = *(_OWORD *)&a4->edgeInsets.bottom;
      v102 = *(_OWORD *)&a4->edgeInsets.top;
      v103 = v62;
      v63 = *(_OWORD *)&a4->minimumPadding.bottom;
      v104 = *(_OWORD *)&a4->minimumPadding.top;
      v105 = v63;
      v64 = a4->pipAnchorPointOffset;
      pipStashedSize = a4->pipStashedSize;
      v99 = v64;
      v65 = a4->containerBounds.size;
      origin = a4->containerBounds.origin;
      v101 = v65;
      v66 = a4->pipLastSteadySize;
      pipCurrentSize = a4->pipCurrentSize;
      v97 = v66;
      -[SBPIPDefaultPositionHyperregionComposer _addRegionWithType:geometry:toMap:](self, "_addRegionWithType:geometry:toMap:", 6, &pipCurrentSize, v60);
    }
    else
    {
      if (a5->isFreelyPositionable)
      {
        v67 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v107 = v67;
        v108 = *(_OWORD *)&a4->offscreenCorners;
        v68 = *(_OWORD *)&a4->edgeInsets.bottom;
        v102 = *(_OWORD *)&a4->edgeInsets.top;
        v103 = v68;
        v69 = *(_OWORD *)&a4->minimumPadding.bottom;
        v104 = *(_OWORD *)&a4->minimumPadding.top;
        v105 = v69;
        v70 = a4->pipAnchorPointOffset;
        pipStashedSize = a4->pipStashedSize;
        v99 = v70;
        v71 = a4->containerBounds.size;
        origin = a4->containerBounds.origin;
        v101 = v71;
        v72 = a4->pipLastSteadySize;
        pipCurrentSize = a4->pipCurrentSize;
        v97 = v72;
        -[SBPIPDefaultPositionHyperregionComposer _addRegionWithType:geometry:toMap:](self, "_addRegionWithType:geometry:toMap:", 5, &pipCurrentSize, v60);
      }
      v73 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      v107 = v73;
      v108 = *(_OWORD *)&a4->offscreenCorners;
      v74 = *(_OWORD *)&a4->edgeInsets.bottom;
      v102 = *(_OWORD *)&a4->edgeInsets.top;
      v103 = v74;
      v75 = *(_OWORD *)&a4->minimumPadding.bottom;
      v104 = *(_OWORD *)&a4->minimumPadding.top;
      v105 = v75;
      v76 = a4->pipAnchorPointOffset;
      pipStashedSize = a4->pipStashedSize;
      v99 = v76;
      v77 = a4->containerBounds.size;
      origin = a4->containerBounds.origin;
      v101 = v77;
      v78 = a4->pipLastSteadySize;
      pipCurrentSize = a4->pipCurrentSize;
      v97 = v78;
      v79 = *(CGPoint *)&a5->currentPosition.y;
      v85 = *(CGSize *)&a5->initialPosition.y;
      v86 = v79;
      v87.x = a5->projectedPositionStashProgress;
      v80 = *(CGSize *)&a5->projectedPosition.y;
      v83 = *(CGSize *)&a5->isStashed;
      v84 = v80;
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:](self, "_pruneRegionsMap:geometry:interaction:", v60, &pipCurrentSize, &v83);
    }
    v81 = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = v60;

    v39 = self->_lastResolvedRegionsMap;
  }
  return v39;
}

- (id)_unprunedCornersForGeometry:(SBPIPPositionGeometryContext *)a3
{
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  _OWORD v11[13];

  regionsLibrary = self->_regionsLibrary;
  v4 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v11[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v11[11] = v4;
  v11[12] = *(_OWORD *)&a3->offscreenCorners;
  v5 = *(_OWORD *)&a3->edgeInsets.bottom;
  v11[6] = *(_OWORD *)&a3->edgeInsets.top;
  v11[7] = v5;
  v6 = *(_OWORD *)&a3->minimumPadding.bottom;
  v11[8] = *(_OWORD *)&a3->minimumPadding.top;
  v11[9] = v6;
  pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v11[2] = a3->pipStashedSize;
  v11[3] = pipAnchorPointOffset;
  size = a3->containerBounds.size;
  v11[4] = a3->containerBounds.origin;
  v11[5] = size;
  pipLastSteadySize = a3->pipLastSteadySize;
  v11[0] = a3->pipCurrentSize;
  v11[1] = pipLastSteadySize;
  -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](regionsLibrary, "regionWithType:geometry:", 1, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _OWORD v17[13];
  CGPoint v18;

  v18 = a3;
  v7 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v17[10] = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v17[11] = v7;
  v17[12] = *(_OWORD *)&a5->offscreenCorners;
  v8 = *(_OWORD *)&a5->edgeInsets.bottom;
  v17[6] = *(_OWORD *)&a5->edgeInsets.top;
  v17[7] = v8;
  v9 = *(_OWORD *)&a5->minimumPadding.bottom;
  v17[8] = *(_OWORD *)&a5->minimumPadding.top;
  v17[9] = v9;
  pipAnchorPointOffset = a5->pipAnchorPointOffset;
  v17[2] = a5->pipStashedSize;
  v17[3] = pipAnchorPointOffset;
  size = a5->containerBounds.size;
  v17[4] = a5->containerBounds.origin;
  v17[5] = size;
  pipLastSteadySize = a5->pipLastSteadySize;
  v17[0] = a5->pipCurrentSize;
  v17[1] = pipLastSteadySize;
  -[SBPIPDefaultPositionHyperregionComposer _unprunedCornersForGeometry:](self, "_unprunedCornersForGeometry:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_regionIndexForClosestPoint:toPoint:", 0, &v18);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogPIP();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBPIPDefaultPositionHyperregionComposer canonicalPositionForPoint:proposedPosition:geometry:interaction:].cold.1();

    v14 = a4;
  }

  return v14;
}

- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  void *v13;
  void *v14;
  void *v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[13];
  CGPoint result;

  v7 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v21[10] = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v21[11] = v7;
  v21[12] = *(_OWORD *)&a5->offscreenCorners;
  v8 = *(_OWORD *)&a5->edgeInsets.bottom;
  v21[6] = *(_OWORD *)&a5->edgeInsets.top;
  v21[7] = v8;
  v9 = *(_OWORD *)&a5->minimumPadding.bottom;
  v21[8] = *(_OWORD *)&a5->minimumPadding.top;
  v21[9] = v9;
  pipAnchorPointOffset = a5->pipAnchorPointOffset;
  v21[2] = a5->pipStashedSize;
  v21[3] = pipAnchorPointOffset;
  size = a5->containerBounds.size;
  v21[4] = a5->containerBounds.origin;
  v21[5] = size;
  pipLastSteadySize = a5->pipLastSteadySize;
  v21[0] = a5->pipCurrentSize;
  v21[1] = pipLastSteadySize;
  -[SBPIPDefaultPositionHyperregionComposer _unprunedCornersForGeometry:](self, "_unprunedCornersForGeometry:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_regions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndex:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (double *)objc_msgSend(v15, "_value");

  v17 = *v16;
  v18 = v16[1];

  v19 = v17;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_addRegionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4 toMap:(id)a5
{
  SBPIPPositionHyperregionLibrary *regionsLibrary;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  id v13;
  void *v14;
  void *v15;
  CGSize pipCurrentSize;
  CGSize v17;
  CGSize pipStashedSize;
  CGPoint v19;
  CGPoint origin;
  CGSize v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  regionsLibrary = self->_regionsLibrary;
  v7 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  v26 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  v27 = v7;
  v28 = *(_OWORD *)&a4->offscreenCorners;
  v8 = *(_OWORD *)&a4->edgeInsets.bottom;
  v22 = *(_OWORD *)&a4->edgeInsets.top;
  v23 = v8;
  v9 = *(_OWORD *)&a4->minimumPadding.bottom;
  v24 = *(_OWORD *)&a4->minimumPadding.top;
  v25 = v9;
  pipAnchorPointOffset = a4->pipAnchorPointOffset;
  pipStashedSize = a4->pipStashedSize;
  v19 = pipAnchorPointOffset;
  size = a4->containerBounds.size;
  origin = a4->containerBounds.origin;
  v21 = size;
  pipLastSteadySize = a4->pipLastSteadySize;
  pipCurrentSize = a4->pipCurrentSize;
  v17 = pipLastSteadySize;
  v13 = a5;
  -[SBPIPPositionHyperregionLibrary regionWithType:geometry:](regionsLibrary, "regionWithType:geometry:", a3, &pipCurrentSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, pipCurrentSize, v17, pipStashedSize, v19, origin, v21, v22, v23, v24, v25, v26, v27, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, v15);

}

- (void)_pruneRegionsMap:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  void *v5;
  id v9;
  void *v10;
  double Width;
  double v12;
  double v13;
  double v14;
  double x;
  double v16;
  double projectedPositionStashProgress;
  int v18;
  char v19;
  int64_t orientation;
  int64_t *p_orientation;
  unint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  double currentPositionStashProgress;

  v9 = a3;
  v10 = v9;
  if (!a5->isInteractive && a5->isStashed)
    objc_msgSend(v9, "removeObjectForKey:", &unk_1E91D16D0);
  Width = CGRectGetWidth(a4->containerBounds);
  v12 = CGRectGetWidth(a4->containerBounds);
  v13 = CGRectGetWidth(a4->containerBounds);
  if (self->_isPad)
    v14 = 6.0;
  else
    v14 = 2.0;
  x = a5->initialPosition.x;
  v16 = a5->currentPosition.x;
  projectedPositionStashProgress = a5->projectedPositionStashProgress;
  currentPositionStashProgress = a5->currentPositionStashProgress;
  v18 = __sb__runningInSpringBoard();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "userInterfaceIdiom") && SBFEffectiveHomeButtonType() == 2)
    {
      p_orientation = &a4->orientation;
      v22 = a4->orientation - 3;

      if (v22 >= 2)
        goto LABEL_30;
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_30;
  }
  v19 = v18;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    goto LABEL_30;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if ((v19 & 1) != 0)
      goto LABEL_30;
    goto LABEL_19;
  }
  p_orientation = &a4->orientation;
  orientation = a4->orientation;
  if ((v19 & 1) != 0)
  {
    if ((unint64_t)(orientation - 3) > 1)
      goto LABEL_30;
    goto LABEL_22;
  }
  if ((unint64_t)(orientation - 3) > 1)
    goto LABEL_30;
LABEL_21:
  orientation = *p_orientation;
LABEL_22:
  SBLogPIP();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
  if (orientation == 3)
  {
    if (v24)
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.9();

    v25 = &unk_1E91D16E8;
  }
  else
  {
    if (v24)
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.10();

    v25 = &unk_1E91D1700;
  }
  objc_msgSend(v10, "removeObjectForKey:", v25);
LABEL_30:
  if (!a5->isInteractive)
    goto LABEL_71;
  v26 = Width * 0.5;
  if (a5->isStashed)
  {
    v27 = v13 / v14;
    if (x >= v27 + CGRectGetMinX(a4->containerBounds) || v16 >= v27 + CGRectGetMinX(a4->containerBounds))
    {
      if (x <= CGRectGetMaxX(a4->containerBounds) - v27 || v16 <= CGRectGetMaxX(a4->containerBounds) - v27)
      {
LABEL_43:
        if (projectedPositionStashProgress < 0.15)
        {
          SBLogPIP();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.6();

          objc_msgSend(v10, "removeObjectForKey:", &unk_1E91D16E8);
          objc_msgSend(v10, "removeObjectForKey:", &unk_1E91D1700);
        }
        goto LABEL_47;
      }
      SBLogPIP();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.8();

      objc_msgSend(v10, "objectForKey:", &unk_1E91D16D0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "copy");
      v40 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v30, "_regions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "arrayWithArray:", v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "_regions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndex:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObject:", v43);

      objc_msgSend(v29, "_regions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndex:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObject:", v45);

      objc_msgSend(v30, "_setRegions:", v33);
      v38 = &unk_1E91D16E8;
    }
    else
    {
      SBLogPIP();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.7();

      objc_msgSend(v10, "objectForKey:", &unk_1E91D16D0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "copy");
      v31 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v30, "_regions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "arrayWithArray:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "_regions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndex:", 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObject:", v35);

      objc_msgSend(v29, "_regions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndex:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObject:", v37);

      objc_msgSend(v30, "_setRegions:", v33);
      v38 = &unk_1E91D1700;
    }
    objc_msgSend(v10, "setObject:forKey:", v30, &unk_1E91D16D0);
    objc_msgSend(v10, "removeObjectForKey:", v38);

    goto LABEL_43;
  }
LABEL_47:
  v47 = v12 / 6.0;
  v48 = v26 + CGRectGetMinX(a4->containerBounds);
  v49 = v26 + CGRectGetMinX(a4->containerBounds);
  if (x < v48)
  {
    if (v16 < v49)
    {
      SBLogPIP();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.2();

      objc_msgSend(v10, "removeObjectForKey:", &unk_1E91D1700);
      if (!a5->isStashed && !self->_isPad && currentPositionStashProgress < 0.25)
      {
        SBLogPIP();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.1();
LABEL_69:
        v52 = &unk_1E91D16E8;
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    if (v16 >= CGRectGetMaxX(a4->containerBounds) - v47)
      goto LABEL_71;
    SBLogPIP();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.3();
LABEL_65:
    v52 = &unk_1E91D1700;
LABEL_70:

    objc_msgSend(v10, "removeObjectForKey:", v52);
    goto LABEL_71;
  }
  if (v16 > v49)
  {
    objc_msgSend(v10, "removeObjectForKey:", &unk_1E91D16E8);
    if (a5->isStashed || self->_isPad || currentPositionStashProgress >= 0.25)
      goto LABEL_71;
    SBLogPIP();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.4();
    goto LABEL_65;
  }
  if (v16 > CGRectGetMaxX(a4->containerBounds) - v47)
  {
    SBLogPIP();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.5();
    goto LABEL_69;
  }
LABEL_71:

}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  return (SBPIPPositionHyperregionComposerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)representedWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_representedWindowScene);
}

- (void)setRepresentedWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_representedWindowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_representedWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastResolvedRegionsMap, 0);
  objc_storeStrong((id *)&self->_lastRegionsMap, 0);
  objc_storeStrong((id *)&self->_regionsLibrary, 0);
}

- (void)canonicalPositionForPoint:proposedPosition:geometry:interaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1D0540000, v1, OS_LOG_TYPE_ERROR, "Unexpectedly could not find index for cornersRegion: %{public}@; controller %{public}@",
    v2,
    0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side stash region. Interaction began and ended on the left side but not close enough to the stashed region.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region since interaction began and ended on the left.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region. Interaction began on the left and ended on the right hand side, but not close enough to the right edge.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region. Interaction began and ended on the right side but not close enough to the stashed region.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side stash region. Interaction began on the right and ended on the left hand side, but not close enough to the left edge.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing stash regions since interaction ended not stashed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side regions since interaction started stashed, left side.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side regions since interaction started stashed, right side.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing left stash region since in landscape right orientation on a notched phone.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%p][Layout][Regions] Position: removing right stash region since in landscape left orientation on a notched phone.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
