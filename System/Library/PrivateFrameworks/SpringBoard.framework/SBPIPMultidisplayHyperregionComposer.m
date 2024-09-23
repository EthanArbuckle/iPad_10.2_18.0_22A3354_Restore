@implementation SBPIPMultidisplayHyperregionComposer

- (SBPIPMultidisplayHyperregionComposer)init
{
  SBPIPMultidisplayHyperregionComposer *v2;
  uint64_t v3;
  NSMutableDictionary *sceneIdentifiersToComposers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBPIPMultidisplayHyperregionComposer;
  v2 = -[SBPIPMultidisplayHyperregionComposer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sceneIdentifiersToComposers = v2->_sceneIdentifiersToComposers;
    v2->_sceneIdentifiersToComposers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "positionRegionComposerDidInvalidate:", self);

}

- (void)setConnectedWindowScenes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *connectedWindowScenes;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBPIPDefaultPositionHyperregionComposer *v19;
  NSMutableDictionary *sceneIdentifiersToComposers;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[NSMutableDictionary allKeys](self->_sceneIdentifiersToComposers, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v4;
    v8 = (NSArray *)objc_msgSend(v4, "copy");
    connectedWindowScenes = self->_connectedWindowScenes;
    self->_connectedWindowScenes = v8;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = self->_connectedWindowScenes;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "session");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "persistentIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "removeObject:", v17);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneIdentifiersToComposers, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v19 = objc_alloc_init(SBPIPDefaultPositionHyperregionComposer);
            -[SBPIPDefaultPositionHyperregionComposer setRepresentedWindowScene:](v19, "setRepresentedWindowScene:", v15);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sceneIdentifiersToComposers, "setObject:forKeyedSubscript:", v19, v17);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    sceneIdentifiersToComposers = self->_sceneIdentifiersToComposers;
    objc_msgSend(v7, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](sceneIdentifiersToComposers, "removeObjectsForKeys:", v21);

    v4 = v22;
  }

}

- (id)_composerForWindowScene:(id)a3
{
  NSMutableDictionary *sceneIdentifiersToComposers;
  void *v4;
  void *v5;
  void *v6;

  sceneIdentifiersToComposers = self->_sceneIdentifiersToComposers;
  objc_msgSend(a3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sceneIdentifiersToComposers, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_identifierForScene:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mutableRegionMapForScene:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  _OWORD v20[4];
  double projectedPositionStashProgress;
  CGSize pipCurrentSize;
  CGSize v23;
  CGSize pipStashedSize;
  CGPoint v25;
  CGPoint origin;
  CGSize v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGSize v35;
  CGSize v36;
  CGSize v37;
  CGPoint v38;
  CGPoint v39;
  CGSize v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  -[SBPIPMultidisplayHyperregionComposer _composerForWindowScene:](self, "_composerForWindowScene:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = (CGSize)0;
  v41 = 0u;
  v38 = (CGPoint)0;
  v39 = (CGPoint)0;
  v36 = (CGSize)0;
  v37 = (CGSize)0;
  v35 = (CGSize)0;
  v9 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  v32 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  v33 = v9;
  v34 = *(_OWORD *)&a4->offscreenCorners;
  v10 = *(_OWORD *)&a4->edgeInsets.bottom;
  v28 = *(_OWORD *)&a4->edgeInsets.top;
  v29 = v10;
  v11 = *(_OWORD *)&a4->minimumPadding.bottom;
  v30 = *(_OWORD *)&a4->minimumPadding.top;
  v31 = v11;
  pipAnchorPointOffset = a4->pipAnchorPointOffset;
  pipStashedSize = a4->pipStashedSize;
  v25 = pipAnchorPointOffset;
  size = a4->containerBounds.size;
  origin = a4->containerBounds.origin;
  v27 = size;
  pipLastSteadySize = a4->pipLastSteadySize;
  pipCurrentSize = a4->pipCurrentSize;
  v23 = pipLastSteadySize;
  -[SBPIPMultidisplayHyperregionComposer _adjustGeometryContextIfNeeded:forComposer:](self, "_adjustGeometryContextIfNeeded:forComposer:", &pipCurrentSize, v8);
  v32 = v45;
  v33 = v46;
  v34 = v47;
  v28 = v41;
  v29 = v42;
  v30 = v43;
  v31 = v44;
  pipStashedSize = v37;
  v25 = v38;
  origin = v39;
  v27 = v40;
  pipCurrentSize = v35;
  v23 = v36;
  v15 = *(_OWORD *)&a5->currentPosition.y;
  v20[2] = *(_OWORD *)&a5->initialPosition.y;
  v20[3] = v15;
  projectedPositionStashProgress = a5->projectedPositionStashProgress;
  v16 = *(_OWORD *)&a5->projectedPosition.y;
  v20[0] = *(_OWORD *)&a5->isStashed;
  v20[1] = v16;
  objc_msgSend(v8, "positionRegionsForRegions:geometry:interaction:", 0, &pipCurrentSize, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  return v18;
}

- (id)mergeMutableRegionsMap:(id)a3 withMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
    v8 = v5;
  else
    v8 = v6;
  v9 = v8;
  v10 = v9;
  if (v5 && v7)
  {
    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v5, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      v33 = *(_QWORD *)v38;
      v34 = v15;
      do
      {
        v19 = 0;
        v35 = v17;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend(v5, "objectForKeyedSubscript:", v20, v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v20);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v21)
            v24 = v22 == 0;
          else
            v24 = 1;
          if (v24)
          {
            if (v21)
              v25 = v21;
            else
              v25 = (void *)v22;
            v26 = v25;
          }
          else
          {
            v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD68]), "initWithDimensions:", objc_msgSend(v21, "_dimensions"));
            objc_msgSend(v21, "_regions");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_regions");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v28);
            v29 = v7;
            v30 = v5;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "_setRegions:", v31);

            v5 = v30;
            v7 = v29;
            v15 = v34;

            v18 = v33;
            v17 = v35;
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }

  }
  else
  {
    v15 = v9;
  }

  return v15;
}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  NSUInteger v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v33;
  NSArray *obj;
  SBPIPMultidisplayHyperregionComposer *v35;
  void *v36;
  _OWORD v37[4];
  double projectedPositionStashProgress;
  _OWORD v39[13];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v8 = -[NSArray count](self->_connectedWindowScenes, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "targetWindowSceneForRegionComposer:", self);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = self;
  obj = self->_connectedWindowScenes;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (a5->hasActiveGesture || v36 == v15 || v8 <= 1)
        {
          v18 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
          v39[10] = *(_OWORD *)&a4->stashedMinimumPadding.top;
          v39[11] = v18;
          v39[12] = *(_OWORD *)&a4->offscreenCorners;
          v19 = *(_OWORD *)&a4->edgeInsets.bottom;
          v39[6] = *(_OWORD *)&a4->edgeInsets.top;
          v39[7] = v19;
          v20 = *(_OWORD *)&a4->minimumPadding.bottom;
          v39[8] = *(_OWORD *)&a4->minimumPadding.top;
          v39[9] = v20;
          pipAnchorPointOffset = a4->pipAnchorPointOffset;
          v39[2] = a4->pipStashedSize;
          v39[3] = pipAnchorPointOffset;
          size = a4->containerBounds.size;
          v39[4] = a4->containerBounds.origin;
          v39[5] = size;
          pipLastSteadySize = a4->pipLastSteadySize;
          v39[0] = a4->pipCurrentSize;
          v39[1] = pipLastSteadySize;
          v24 = *(_OWORD *)&a5->currentPosition.y;
          v37[2] = *(_OWORD *)&a5->initialPosition.y;
          v37[3] = v24;
          projectedPositionStashProgress = a5->projectedPositionStashProgress;
          v25 = *(_OWORD *)&a5->projectedPosition.y;
          v37[0] = *(_OWORD *)&a5->isStashed;
          v37[1] = v25;
          -[SBPIPMultidisplayHyperregionComposer mutableRegionMapForScene:geometry:interaction:](v35, "mutableRegionMapForScene:geometry:interaction:", v15, v39, v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 >= 2)
          {
            objc_msgSend(v15, "_sbDisplayConfiguration");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = SBSDisplayEdgeAdjacentToNeighboringDisplay();
            if (v28)
            {
              if (v28 == 2)
              {
                v29 = &unk_1E91D1C88;
                goto LABEL_18;
              }
            }
            else
            {
              v29 = &unk_1E91D1C70;
LABEL_18:
              objc_msgSend(v26, "removeObjectForKey:", v29);
            }
            if (v36 != v15)
            {
              objc_msgSend(v26, "removeObjectForKey:", &unk_1E91D1C70);
              objc_msgSend(v26, "removeObjectForKey:", &unk_1E91D1C88);
              objc_msgSend(v26, "removeObjectForKey:", &unk_1E91D1CA0);
              objc_msgSend(v26, "removeObjectForKey:", &unk_1E91D1CB8);
            }

          }
          -[SBPIPMultidisplayHyperregionComposer mergeMutableRegionsMap:withMap:](v35, "mergeMutableRegionsMap:withMap:", v12, v26);
          v30 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v30;
          continue;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v11)
        goto LABEL_27;
    }
  }
  v12 = 0;
LABEL_27:

  v31 = (void *)objc_msgSend(v12, "copy");
  return v31;
}

- (SBPIPPositionGeometryContext)_adjustGeometryContextIfNeeded:(SEL)a3 forComposer:(SBPIPPositionGeometryContext *)a4
{
  SBPIPPositionHyperregionComposerDelegate **p_delegate;
  id v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  SBPIPPositionGeometryContext *result;
  _OWORD v19[13];

  p_delegate = &self->_delegate;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v9, "representedWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    v12 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    v19[10] = *(_OWORD *)&a4->stashedMinimumPadding.top;
    v19[11] = v12;
    v19[12] = *(_OWORD *)&a4->offscreenCorners;
    v13 = *(_OWORD *)&a4->edgeInsets.bottom;
    v19[6] = *(_OWORD *)&a4->edgeInsets.top;
    v19[7] = v13;
    v14 = *(_OWORD *)&a4->minimumPadding.bottom;
    v19[8] = *(_OWORD *)&a4->minimumPadding.top;
    v19[9] = v14;
    pipAnchorPointOffset = a4->pipAnchorPointOffset;
    v19[2] = a4->pipStashedSize;
    v19[3] = pipAnchorPointOffset;
    size = a4->containerBounds.size;
    v19[4] = a4->containerBounds.origin;
    v19[5] = size;
    pipLastSteadySize = a4->pipLastSteadySize;
    v19[0] = a4->pipCurrentSize;
    v19[1] = pipLastSteadySize;
    objc_msgSend(WeakRetained, "regionComposer:transformGeometryContext:toWindowScene:", self, v19, v11);
  }
  else
  {
    *(_OWORD *)&retstr->stashedMinimumPadding.bottom = 0u;
    *(_OWORD *)&retstr->offscreenCorners = 0u;
    *(_OWORD *)&retstr->minimumPadding.bottom = 0u;
    *(_OWORD *)&retstr->stashedMinimumPadding.top = 0u;
    *(_OWORD *)&retstr->edgeInsets.bottom = 0u;
    *(_OWORD *)&retstr->minimumPadding.top = 0u;
    retstr->containerBounds.size = 0u;
    *(_OWORD *)&retstr->edgeInsets.top = 0u;
    retstr->pipAnchorPointOffset = 0u;
    retstr->containerBounds.origin = 0u;
    retstr->pipLastSteadySize = 0u;
    retstr->pipStashedSize = 0u;
    retstr->pipCurrentSize = 0u;
  }

  return result;
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  double y;
  double x;
  id WeakRetained;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  _OWORD v25[4];
  double projectedPositionStashProgress;
  CGSize pipCurrentSize;
  CGSize v28;
  CGSize pipStashedSize;
  CGPoint v30;
  CGPoint origin;
  CGSize v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGSize v40;
  CGSize v41;
  CGSize v42;
  CGPoint v43;
  CGPoint v44;
  CGSize v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "targetWindowSceneForRegionComposer:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPMultidisplayHyperregionComposer _composerForWindowScene:](self, "_composerForWindowScene:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = (CGSize)0;
  v46 = 0u;
  v43 = (CGPoint)0;
  v44 = (CGPoint)0;
  v41 = (CGSize)0;
  v42 = (CGSize)0;
  v15 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v37 = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v38 = v15;
  v39 = *(_OWORD *)&a5->offscreenCorners;
  v40 = (CGSize)0;
  v16 = *(_OWORD *)&a5->edgeInsets.bottom;
  v33 = *(_OWORD *)&a5->edgeInsets.top;
  v34 = v16;
  v17 = *(_OWORD *)&a5->minimumPadding.bottom;
  v35 = *(_OWORD *)&a5->minimumPadding.top;
  v36 = v17;
  pipAnchorPointOffset = a5->pipAnchorPointOffset;
  pipStashedSize = a5->pipStashedSize;
  v30 = pipAnchorPointOffset;
  size = a5->containerBounds.size;
  origin = a5->containerBounds.origin;
  v32 = size;
  pipLastSteadySize = a5->pipLastSteadySize;
  pipCurrentSize = a5->pipCurrentSize;
  v28 = pipLastSteadySize;
  -[SBPIPMultidisplayHyperregionComposer _adjustGeometryContextIfNeeded:forComposer:](self, "_adjustGeometryContextIfNeeded:forComposer:", &pipCurrentSize, v14);
  v37 = v50;
  v38 = v51;
  v39 = v52;
  v33 = v46;
  v34 = v47;
  v35 = v48;
  v36 = v49;
  pipStashedSize = v42;
  v30 = v43;
  origin = v44;
  v32 = v45;
  pipCurrentSize = v40;
  v28 = v41;
  v21 = *(_OWORD *)&a6->currentPosition.y;
  v25[2] = *(_OWORD *)&a6->initialPosition.y;
  v25[3] = v21;
  projectedPositionStashProgress = a6->projectedPositionStashProgress;
  v22 = *(_OWORD *)&a6->projectedPosition.y;
  v25[0] = *(_OWORD *)&a6->isStashed;
  v25[1] = v22;
  v23 = objc_msgSend(v14, "canonicalPositionForPoint:proposedPosition:geometry:interaction:", a4, &pipCurrentSize, v25, x, y);

  return v23;
}

- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  double y;
  double x;
  id WeakRetained;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint pipAnchorPointOffset;
  CGSize size;
  CGSize pipLastSteadySize;
  __int128 v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _OWORD v29[4];
  double projectedPositionStashProgress;
  CGSize pipCurrentSize;
  CGSize v32;
  CGSize pipStashedSize;
  CGPoint v34;
  CGPoint origin;
  CGSize v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGSize v44;
  CGSize v45;
  CGSize v46;
  CGPoint v47;
  CGPoint v48;
  CGSize v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "targetWindowSceneForRegionComposer:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPMultidisplayHyperregionComposer _composerForWindowScene:](self, "_composerForWindowScene:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = (CGSize)0;
  v50 = 0u;
  v47 = (CGPoint)0;
  v48 = (CGPoint)0;
  v45 = (CGSize)0;
  v46 = (CGSize)0;
  v15 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v41 = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v42 = v15;
  v43 = *(_OWORD *)&a5->offscreenCorners;
  v44 = (CGSize)0;
  v16 = *(_OWORD *)&a5->edgeInsets.bottom;
  v37 = *(_OWORD *)&a5->edgeInsets.top;
  v38 = v16;
  v17 = *(_OWORD *)&a5->minimumPadding.bottom;
  v39 = *(_OWORD *)&a5->minimumPadding.top;
  v40 = v17;
  pipAnchorPointOffset = a5->pipAnchorPointOffset;
  pipStashedSize = a5->pipStashedSize;
  v34 = pipAnchorPointOffset;
  size = a5->containerBounds.size;
  origin = a5->containerBounds.origin;
  v36 = size;
  pipLastSteadySize = a5->pipLastSteadySize;
  pipCurrentSize = a5->pipCurrentSize;
  v32 = pipLastSteadySize;
  -[SBPIPMultidisplayHyperregionComposer _adjustGeometryContextIfNeeded:forComposer:](self, "_adjustGeometryContextIfNeeded:forComposer:", &pipCurrentSize, v14);
  v41 = v54;
  v42 = v55;
  v43 = v56;
  v37 = v50;
  v38 = v51;
  v39 = v52;
  v40 = v53;
  pipStashedSize = v46;
  v34 = v47;
  origin = v48;
  v36 = v49;
  pipCurrentSize = v44;
  v32 = v45;
  v21 = *(_OWORD *)&a6->currentPosition.y;
  v29[2] = *(_OWORD *)&a6->initialPosition.y;
  v29[3] = v21;
  projectedPositionStashProgress = a6->projectedPositionStashProgress;
  v22 = *(_OWORD *)&a6->projectedPosition.y;
  v29[0] = *(_OWORD *)&a6->isStashed;
  v29[1] = v22;
  objc_msgSend(v14, "defaultCornerPositionForLayoutSettingsPosition:proposedCenter:geometry:interaction:", a3, &pipCurrentSize, v29, x, y);
  v24 = v23;
  v26 = v25;

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (NSArray)connectedWindowScenes
{
  return self->_connectedWindowScenes;
}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  return (SBPIPPositionHyperregionComposerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)sceneIdentifiersToComposers
{
  return self->_sceneIdentifiersToComposers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifiersToComposers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
}

@end
