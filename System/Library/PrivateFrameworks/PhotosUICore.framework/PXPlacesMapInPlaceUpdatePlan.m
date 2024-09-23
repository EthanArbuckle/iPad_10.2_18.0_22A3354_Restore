@implementation PXPlacesMapInPlaceUpdatePlan

- (PXPlacesMapInPlaceUpdatePlan)init
{
  PXPlacesMapInPlaceUpdatePlan *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *sema;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapInPlaceUpdatePlan;
  v2 = -[PXPlacesMapInPlaceUpdatePlan init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (id)resultForNewLayoutResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  id obj;
  id obja;
  id v81;
  void *v82;
  dispatch_semaphore_t *v83;
  PXPlacesMapUpdatePlanResultImpl *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  v84 = objc_alloc_init(PXPlacesMapUpdatePlanResultImpl);
  -[PXPlacesMapInPlaceUpdatePlan currentLayoutResult](self, "currentLayoutResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v4;
  -[PXPlacesMapInPlaceUpdatePlan _changesBetweenSourceLayoutResult:targetLayoutResult:](self, "_changesBetweenSourceLayoutResult:targetLayoutResult:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (dispatch_semaphore_t *)self;
  -[PXPlacesMapInPlaceUpdatePlan pipelineComponentProvider](self, "pipelineComponentProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "annotationType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 56, CFSTR("PXPlacesMapAnnotationTypeAnnotation is the only type supported at this time"));

  }
  else
  {
    v75 = v9;
    v81 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v76 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v102 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          objc_msgSend(v16, "sourceLayoutItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "targetLayoutItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v82, "addObject:", v17);
          if (v18)
            objc_msgSend(v10, "addObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
      }
      while (v13);
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (v20)
    {
      v21 = (id)v20;
      v22 = *(_QWORD *)v98;
      do
      {
        v23 = 0;
        obj = v21;
        do
        {
          if (*(_QWORD *)v98 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v23);
          v25 = objc_msgSend(v24, "type");
          objc_msgSend(v24, "sourceLayoutItem");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "targetLayoutItem");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          if (v25 == 2)
          {
            if (v26)
            {
              if (v27)
              {
LABEL_21:
                -[dispatch_semaphore_t currentLayoutItemToAnnotationTable](v83, "currentLayoutItemToAnnotationTable");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKey:", v26);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v30)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 93, CFSTR("annotation for sourceItem cannot be nil"));

                }
                if ((objc_msgSend(v30, "conformsToProtocol:", &unk_1EEB5F3D8) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 94, CFSTR("annotation must conform to PXPlacesMapRenderable"));

                }
                v31 = v30;
                objc_msgSend(v7, "setObject:forKey:", v31, v28);
                objc_msgSend(v82, "removeObject:", v26);
                objc_msgSend(v10, "removeObject:", v28);
                if ((objc_msgSend(v26, "isEqualToLayoutItem:", v28) & 1) == 0)
                {
                  objc_msgSend(v7, "setObject:forKey:", v31, v28);
                  objc_msgSend(v82, "removeObject:", v26);
                  objc_msgSend(v10, "removeObject:", v28);
                  objc_msgSend(v28, "geotaggables");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = v22;
                  v34 = v10;
                  v35 = v7;
                  v36 = v19;
                  v37 = (void *)objc_msgSend(v32, "copy");
                  objc_msgSend(v31, "setGeotaggables:", v37);

                  v19 = v36;
                  v7 = v35;
                  v10 = v34;
                  v22 = v33;
                  v21 = obj;

                  -[PXPlacesMapUpdatePlanResultImpl annotationsToRedraw](v84, "annotationsToRedraw");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "addObject:", v31);

                }
                goto LABEL_28;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 90, CFSTR("sourceItem cannot be nil for PXPlacesMapLayoutDiffTypeRelated"));

              if (v28)
                goto LABEL_21;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 91, CFSTR("targetItem cannot be nil for PXPlacesMapLayoutDiffTypeRelated"));

            goto LABEL_21;
          }
LABEL_28:

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v43 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
        v21 = (id)v43;
      }
      while (v43);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obja = v10;
    v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v94 != v46)
            objc_enumerationMutation(obja);
          v48 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          objc_msgSend(v48, "geotaggables");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "coordinate");
          objc_msgSend(v81, "annotationForGeotaggables:initialCoordinate:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v50)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 123, CFSTR("annotation for targetItem cannot be nil"));

          }
          -[PXPlacesMapUpdatePlanResultImpl annotationsToAddImmediately](v84, "annotationsToAddImmediately");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v50);

          objc_msgSend(v7, "setObject:forKey:", v50, v48);
        }
        v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
      }
      while (v45);
    }

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v53 = v82;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v90;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v90 != v56)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k);
          -[dispatch_semaphore_t currentLayoutItemToAnnotationTable](v83, "currentLayoutItemToAnnotationTable");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKey:", v58);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v60)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 132, CFSTR("annotation for sourceItem cannot be nil"));

          }
          -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveImmediately](v84, "annotationsToRemoveImmediately");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v60);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
      }
      while (v55);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v78, "layoutItems");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
    if (v64)
    {
      v65 = v64;
      v66 = 0;
      v67 = *(_QWORD *)v86;
      do
      {
        for (m = 0; m != v65; ++m)
        {
          if (*(_QWORD *)v86 != v67)
            objc_enumerationMutation(v63);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * m));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v69)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v83, CFSTR("PXPlacesMapInPlaceUpdatePlan.m"), 142, CFSTR("annotation for layout item cannot be nil"));

          }
          if (objc_msgSend(v69, "conformsToProtocol:", &unk_1EEB5F3D8))
          {
            v70 = v69;
            if (v66 != objc_msgSend(v70, "index"))
            {
              objc_msgSend(v70, "setIndex:", v66);
              -[PXPlacesMapUpdatePlanResultImpl annotationsWithUpdatedIndex](v84, "annotationsWithUpdatedIndex");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "addObject:", v70);

            }
            ++v66;

          }
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
      }
      while (v65);
    }

    v9 = v75;
    v6 = v76;
  }
  -[dispatch_semaphore_t setCurrentLayoutResult:](v83, "setCurrentLayoutResult:", v78);
  -[dispatch_semaphore_t setCurrentLayoutItemToAnnotationTable:](v83, "setCurrentLayoutItemToAnnotationTable:", v7);
  dispatch_semaphore_signal(v83[1]);

  return v84;
}

- (id)removalPlanResult
{
  PXPlacesMapUpdatePlanResultImpl *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(PXPlacesMapUpdatePlanResultImpl);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  -[PXPlacesMapUpdatePlanResultImpl annotationsToRemoveImmediately](v3, "annotationsToRemoveImmediately");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapInPlaceUpdatePlan currentLayoutItemToAnnotationTable](self, "currentLayoutItemToAnnotationTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  return v3;
}

- (id)_changesBetweenSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4
{
  id v5;
  id v6;
  PXPlacesMapInPlaceLayoutDiffer *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[PXPlacesMapLayoutDiffer initWithSourceLayoutResult:targetLayoutResult:]([PXPlacesMapInPlaceLayoutDiffer alloc], "initWithSourceLayoutResult:targetLayoutResult:", v6, v5);

  -[PXPlacesMapLayoutDiffer computeChanges](v7, "computeChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)annotationForLayoutItem:(id)a3
{
  NSObject *sema;
  id v5;
  void *v6;
  void *v7;

  sema = self->_sema;
  v5 = a3;
  dispatch_semaphore_wait(sema, 0xFFFFFFFFFFFFFFFFLL);
  -[PXPlacesMapInPlaceUpdatePlan currentLayoutItemToAnnotationTable](self, "currentLayoutItemToAnnotationTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  return v7;
}

- (void)reset
{
  PXPlacesMapLayoutResult *currentLayoutResult;
  NSMapTable *currentLayoutItemToAnnotationTable;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  currentLayoutResult = self->_currentLayoutResult;
  self->_currentLayoutResult = 0;

  currentLayoutItemToAnnotationTable = self->_currentLayoutItemToAnnotationTable;
  self->_currentLayoutItemToAnnotationTable = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  return (PXPlacesMapPipelineComponentProvider *)objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
}

- (void)setPipelineComponentProvider:(id)a3
{
  objc_storeWeak((id *)&self->pipelineComponentProvider, a3);
}

- (PXPlacesMapLayoutResult)currentLayoutResult
{
  return (PXPlacesMapLayoutResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentLayoutResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMapTable)currentLayoutItemToAnnotationTable
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentLayoutItemToAnnotationTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutItemToAnnotationTable, 0);
  objc_storeStrong((id *)&self->_currentLayoutResult, 0);
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
  objc_storeStrong((id *)&self->_sema, 0);
}

@end
