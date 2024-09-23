@implementation SBTouchRegionManager

uint64_t __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_displayLayoutDidUpdate:", *(_QWORD *)(a1 + 40));
}

void __54__SBTouchRegionManager__queue_displayLayoutDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(v14, "layoutRole");
  if ((unint64_t)(v3 - 7) < 2)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v14, "referenceFrame");
    objc_msgSend(v11, "_queue_floatingHitTestRegionForLayoutRect:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

    v5 = v14;
  }
  else
  {
    if (v3 == 2)
    {
      objc_msgSend(v14, "referenceFrame");
      v5 = v14;
      v10 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v4 = v3 == 1;
      v5 = v14;
      if (!v4)
        goto LABEL_11;
      objc_msgSend(v14, "referenceFrame");
      v5 = v14;
      v10 = *(_QWORD *)(a1 + 48);
    }
    v13 = *(_QWORD **)(v10 + 8);
    v13[4] = v6;
    v13[5] = v7;
    v13[6] = v8;
    v13[7] = v9;
  }
LABEL_11:

}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBTouchRegionManager *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

- (void)_queue_displayLayoutDidUpdate:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  CGFloat *v10;
  __int128 v11;
  void *v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  BOOL IsIdentity;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGAffineTransform v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  CGRect *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  CGRect *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  CGRect v50;
  CGRect v51;

  v5 = a3;
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMainDisplay");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = (CGRect *)&v44;
    v46 = 0x4010000000;
    v47 = &unk_1D0FA064E;
    v10 = (CGFloat *)MEMORY[0x1E0C9D648];
    v11 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v48 = *MEMORY[0x1E0C9D648];
    v49 = v11;
    v38 = 0;
    v39 = (CGRect *)&v38;
    v40 = 0x4010000000;
    v41 = &unk_1D0FA064E;
    v42 = v48;
    v43 = v11;
    objc_msgSend(v5, "elements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __54__SBTouchRegionManager__queue_displayLayoutDidUpdate___block_invoke;
    v34[3] = &unk_1E8EAE8E0;
    v36 = &v44;
    v37 = &v38;
    v34[4] = self;
    v13 = v8;
    v35 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v34);

    v14 = *v10;
    v15 = v10[1];
    v16 = v10[2];
    v17 = v10[3];
    v50.origin.x = *v10;
    v50.origin.y = v15;
    v50.size.width = v16;
    v50.size.height = v17;
    if (!CGRectEqualToRect(v50, v45[1]))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v45[1].origin.x, v45[1].origin.y, v45[1].size.width, v45[1].size.height);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v18);

    }
    if (!CGRectIntersectsRect(v45[1], v39[1]))
    {
      v51.origin.x = v14;
      v51.origin.y = v15;
      v51.size.width = v16;
      v51.size.height = v17;
      if (!CGRectEqualToRect(v51, v39[1]))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v39[1].origin.x, v39[1].origin.y, v39[1].size.width, v39[1].size.height);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
    }
    -[SBTouchRegionManager _queue_calculateHitTestRegionsFromSceneRects:](self, "_queue_calculateHitTestRegionsFromSceneRects:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v21);

    objc_msgSend(v5, "displayConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isMainDisplay"))
    {
      v23 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
      *(_OWORD *)&v33.a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
      *(_OWORD *)&v33.c = v23;
      *(_OWORD *)&v33.tx = *(_OWORD *)&self->_queue_rootWindowTransform.tx;
      IsIdentity = CGAffineTransformIsIdentity(&v33);

      if (IsIdentity)
      {
LABEL_15:
        objc_msgSend(v5, "displayConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "hardwareIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBBackBoardServicesInterface setHitTestRegions:forDisplay:](self->_queue_bksInterface, "setHitTestRegions:forDisplay:", v13, v30);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v44, 8);

        goto LABEL_16;
      }
      -[SBTouchRegionManager _queue_transformHitTestRegions:withDisplayLayout:](self, "_queue_transformHitTestRegions:withDisplayLayout:", v13, v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "count");
      if (v25 != objc_msgSend(v13, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchRegionManager.m"), 507, CFSTR("Number of hit test regions before and after applying the root window transform are mismatched [%lu][%lu]"), objc_msgSend(v13, "count"), objc_msgSend(v22, "count"));

      }
      objc_msgSend(v13, "removeAllObjects");
      objc_msgSend(v22, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v26);

      -[SBTouchRegionManager _queue_calculateBorderHitTestRegionsWithDisplayLayout:](self, "_queue_calculateBorderHitTestRegionsWithDisplayLayout:", v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count") != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchRegionManager.m"), 513, CFSTR("Unexpected number of border hit test regions [%lu]"), objc_msgSend(v27, "count"));

      }
      objc_msgSend(v27, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v28);

    }
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_queue_calculateHitTestRegionsFromSceneRects:(id)a3
{
  double queue_touchRegionBuffer;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  SBTouchRegionManager *v17;
  id v18;
  double v19;
  SEL v20;

  queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTouchRegionManager _queue_calculateTouchRegionsFromSceneRects:](self, "_queue_calculateTouchRegionsFromSceneRects:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke;
  v15[3] = &unk_1E8EAE8B8;
  v19 = queue_touchRegionBuffer;
  v20 = a2;
  v16 = v9;
  v17 = self;
  v10 = v8;
  v18 = v10;
  v11 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);

  v12 = v18;
  v13 = v10;

  return v13;
}

- (id)_queue_calculateTouchRegionsFromSceneRects:(id)a3
{
  id v4;
  void *v5;
  double queue_touchRegionBuffer;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke;
  v12[3] = &unk_1E8EAE868;
  v13 = v4;
  v15 = queue_touchRegionBuffer;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "bs_CGRectValue");
  v4 = v3;
  if (BSFloatLessThanFloat() && BSFloatGreaterThanFloat())
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v6, "removeAllObjects");
LABEL_6:
    objc_msgSend(*v5, "addObject:", v7);
    goto LABEL_7;
  }
  if (BSFloatEqualToFloat())
  {
    v5 = (id *)(a1 + 32);
    goto LABEL_6;
  }
LABEL_7:

}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "bs_CGRectValue");
  v4 = v3;
  if (BSFloatLessThanFloat() && BSFloatGreaterThanFloat())
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v6, "removeAllObjects");
LABEL_6:
    objc_msgSend(*v5, "addObject:", v7);
    goto LABEL_7;
  }
  if (BSFloatEqualToFloat())
  {
    v5 = (id *)(a1 + 32);
    goto LABEL_6;
  }
LABEL_7:

}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];

  v3 = a2;
  objc_msgSend(v3, "bs_CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_2;
  v41[3] = &unk_1E8EAE818;
  v43 = v48;
  v44 = v5;
  v45 = v7;
  v46 = v9;
  v47 = v11;
  v15 = v12;
  v42 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v41);
  if (objc_msgSend(v15, "count"))
  {
    v34[0] = v14;
    v34[1] = 3221225472;
    v34[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_3;
    v34[3] = &unk_1E8EAE840;
    v36 = v5;
    v37 = v7;
    v38 = v9;
    v39 = v11;
    v40 = *(_QWORD *)(a1 + 48);
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v34);

  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(a1 + 32);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_4;
  v26[3] = &unk_1E8EAE818;
  v28 = v33;
  v29 = v5;
  v30 = v7;
  v31 = v9;
  v32 = v11;
  v18 = v16;
  v27 = v18;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v26);
  if (objc_msgSend(v18, "count"))
  {
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_5;
    v19[3] = &unk_1E8EAE840;
    v21 = v5;
    v22 = v7;
    v23 = v9;
    v24 = v11;
    v25 = *(_QWORD *)(a1 + 48);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v19);

  }
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v48, 8);
}

void __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[15];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v3 = a2;
  objc_msgSend(v3, "bs_CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke_2;
  v18[3] = &unk_1E8EAE890;
  *(double *)&v18[9] = v4;
  *(double *)&v18[10] = v6;
  *(double *)&v18[11] = v8;
  *(double *)&v18[12] = v10;
  v18[13] = *(_QWORD *)(a1 + 56);
  v18[6] = &v31;
  v18[7] = &v19;
  v18[8] = &v27;
  v18[14] = *(_QWORD *)(a1 + 64);
  v12 = *(void **)(a1 + 32);
  v18[4] = *(_QWORD *)(a1 + 40);
  v18[5] = &v23;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);
  if (*((_BYTE *)v32 + 24))
  {
    v13 = *(double *)(a1 + 56);
    v14 = v11 - v13;
  }
  else
  {
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = v11;
  }
  if (*((_BYTE *)v28 + 24))
    v14 = v14 - *(double *)(a1 + 56);
  if (*((_BYTE *)v24 + 24))
  {
    v15 = *(double *)(a1 + 56);
    v16 = v9 - v15;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D538];
    v16 = v9;
  }
  if (*((_BYTE *)v20 + 24))
    v16 = v16 - *(double *)(a1 + 56);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v5, v7, v9, v11, v15, v13, v16, v14);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

}

void __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForDisplayIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isChamoisWindowingUIEnabled");

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 8);
  if (v7)
  {
    v13 = MEMORY[0x1E0C809B0];
    v10 = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2;
    v11 = &v13;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v10 = __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_3;
    v11 = &v12;
  }
  v11[1] = 3221225472;
  v11[2] = (uint64_t)v10;
  v11[3] = (uint64_t)&unk_1E8E9E820;
  v11[4] = v8;
  v11[5] = (uint64_t)*(id *)(a1 + 32);
  dispatch_async(v9, v11);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1)
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_159);
  return (id)sharedInstance___shared;
}

uint64_t __38__SBTouchRegionManager_sharedInstance__block_invoke()
{
  SBTouchRegionManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBTouchRegionManager);
  v1 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;

  return kdebug_trace();
}

- (SBTouchRegionManager)init
{
  SBBackBoardServicesInterface *v3;
  void *v4;
  SBTouchRegionManager *v5;

  v3 = objc_alloc_init(SBBackBoardServicesInterface);
  objc_msgSend(MEMORY[0x1E0D230D0], "sharedMonitorForDisplayType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBTouchRegionManager _initWithBKSInterface:displayLayoutMonitor:](self, "_initWithBKSInterface:displayLayoutMonitor:", v3, v4);

  return v5;
}

- (id)_initWithBKSInterface:(id)a3 displayLayoutMonitor:(id)a4
{
  id v7;
  id v8;
  SBTouchRegionManager *v9;
  void *v10;
  uint64_t v11;
  SBMedusa1oSettings *medusaSettings;
  uint64_t v13;
  SBScreenSharingOverlayUISettings *screenSharingSettings;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  double v17;
  double v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBTouchRegionManager;
  v9 = -[SBTouchRegionManager init](&v24, sel_init);
  if (v9)
  {
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "medusa1oSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    medusaSettings = v9->_medusaSettings;
    v9->_medusaSettings = (SBMedusa1oSettings *)v11;

    -[PTSettings addKeyObserver:](v9->_medusaSettings, "addKeyObserver:", v9);
    +[SBScreenSharingOverlayUIDomain rootSettings](SBScreenSharingOverlayUIDomain, "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    screenSharingSettings = v9->_screenSharingSettings;
    v9->_screenSharingSettings = (SBScreenSharingOverlayUISettings *)v13;

    -[PTSettings addKeyObserver:](v9->_screenSharingSettings, "addKeyObserver:", v9);
    Serial = BSDispatchQueueCreateSerial();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)Serial;

    objc_storeStrong((id *)&v9->_queue_bksInterface, a3);
    -[SBMedusa1oSettings gapSwipeBuffer](v9->_medusaSettings, "gapSwipeBuffer");
    v9->_queue_touchRegionBuffer = v17;
    -[SBScreenSharingOverlayUISettings edgeSwipeBuffer](v9->_screenSharingSettings, "edgeSwipeBuffer");
    v9->_queue_edgeTouchRegionBuffer = v18;
    objc_storeStrong((id *)&v9->_queue_displayLayoutMonitor, a4);
    -[FBSDisplayLayoutMonitor addObserver:](v9->_queue_displayLayoutMonitor, "addObserver:", v9);
    v19 = MEMORY[0x1E0C9BAA8];
    v20 = *MEMORY[0x1E0C9BAA8];
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v9->_rootWindowTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v9->_rootWindowTransform.c = v21;
    v22 = *(_OWORD *)(v19 + 32);
    *(_OWORD *)&v9->_rootWindowTransform.tx = v22;
    *(_OWORD *)&v9->_queue_rootWindowTransform.a = v20;
    *(_OWORD *)&v9->_queue_rootWindowTransform.c = v21;
    *(_OWORD *)&v9->_queue_rootWindowTransform.tx = v22;
  }

  return v9;
}

- (void)dealloc
{
  OS_dispatch_queue *v3;
  SBBackBoardServicesInterface *v4;
  FBSDisplayLayoutMonitor *v5;
  NSObject *v6;
  FBSDisplayLayoutMonitor *v7;
  SBBackBoardServicesInterface *v8;
  objc_super v9;
  _QWORD block[4];
  SBBackBoardServicesInterface *v11;
  FBSDisplayLayoutMonitor *v12;
  OS_dispatch_queue *v13;

  v3 = self->_queue;
  v4 = self->_queue_bksInterface;
  v5 = self->_queue_displayLayoutMonitor;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBTouchRegionManager_dealloc__block_invoke;
  block[3] = &unk_1E8E9E270;
  v11 = v4;
  v12 = v5;
  v13 = v3;
  v6 = v3;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

  v9.receiver = self;
  v9.super_class = (Class)SBTouchRegionManager;
  -[SBTouchRegionManager dealloc](&v9, sel_dealloc);
}

id __31__SBTouchRegionManager_dealloc__block_invoke()
{
  id v0;
  id v1;

  v0 = (id)objc_opt_self();
  v1 = (id)objc_opt_self();
  return (id)objc_opt_self();
}

- (double)touchRegionBuffer
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBTouchRegionManager_touchRegionBuffer__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__SBTouchRegionManager_touchRegionBuffer__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 96);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setTouchRegionBuffer:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SBTouchRegionManager_setTouchRegionBuffer___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __45__SBTouchRegionManager_setTouchRegionBuffer___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 96) = result;
  return result;
}

- (double)edgeTouchRegionBuffer
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SBTouchRegionManager_edgeTouchRegionBuffer__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __45__SBTouchRegionManager_edgeTouchRegionBuffer__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setEdgeTouchRegionBuffer:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBTouchRegionManager_setEdgeTouchRegionBuffer___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __49__SBTouchRegionManager_setEdgeTouchRegionBuffer___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = result;
  return result;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SBTouchRegionManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBTouchRegionManager_setDisplayLayoutMonitor___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void *__48__SBTouchRegionManager_setDisplayLayoutMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  void *result;

  v2 = *(void **)(a1 + 32);
  result = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if (v2 != result)
  {
    objc_msgSend(result, "removeObserver:");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObserver:");
  }
  return result;
}

- (void)setRootWindowTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  NSObject *queue;
  __int128 v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = *(_OWORD *)&self->_rootWindowTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_rootWindowTransform.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_rootWindowTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v7 = *(_OWORD *)&a3->a;
    v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_rootWindowTransform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_rootWindowTransform.tx = v8;
    *(_OWORD *)&self->_rootWindowTransform.a = v7;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke;
    block[3] = &unk_1E8EA5150;
    block[4] = self;
    v10 = *(_OWORD *)&a3->c;
    v12 = *(_OWORD *)&a3->a;
    v13 = v10;
    v14 = *(_OWORD *)&a3->tx;
    dispatch_async(queue, block);
  }
}

void __47__SBTouchRegionManager_setRootWindowTransform___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v2 = *(_OWORD **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 72);
  v2[4] = *(_OWORD *)(a1 + 56);
  v2[5] = v4;
  v2[3] = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "display");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_2;
  block[3] = &unk_1E8E9E270;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  char v11;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSceneForDisplayIdentity:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChamoisWindowingUIEnabled");

  v6 = a1[5];
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_3;
  block[3] = &unk_1E8E9EE00;
  v11 = v5;
  block[4] = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __47__SBTouchRegionManager_setRootWindowTransform___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_queue_handleChamoisUILayout:", v4);
  else
    return objc_msgSend(v3, "_queue_displayLayoutDidUpdate:", v4);
}

- (id)displayLayoutMonitor
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SBTouchRegionManager_displayLayoutMonitor__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SBTouchRegionManager_displayLayoutMonitor__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double y;
  double v6;
  double height;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a2, "bs_CGRectValue");
  v4 = v3;
  y = v13.origin.y;
  v13.origin.x = *(CGFloat *)(a1 + 40);
  v15.origin.y = *(CGFloat *)(a1 + 48);
  v15.size.width = *(CGFloat *)(a1 + 56);
  v15.size.height = *(CGFloat *)(a1 + 64);
  v15.origin.x = v13.origin.x;
  v14 = CGRectIntersection(v13, v15);
  v6 = v14.origin.y;
  height = v14.size.height;
  if (!CGRectIsNull(v14))
  {
    v8 = *(double *)(a1 + 72);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", *(double *)(a1 + 40) + *(double *)(a1 + 56) - v8, v6, v8, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v4, y, v8, height);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

void __67__SBTouchRegionManager__queue_calculateTouchRegionsFromSceneRects___block_invoke_5(uint64_t a1, void *a2)
{
  double x;
  double v4;
  double v5;
  double v6;
  double width;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a2, "bs_CGRectValue");
  x = v13.origin.x;
  v5 = v4;
  v15.origin.x = *(CGFloat *)(a1 + 40);
  v13.origin.y = *(CGFloat *)(a1 + 48);
  v15.size.width = *(CGFloat *)(a1 + 56);
  v15.size.height = *(CGFloat *)(a1 + 64);
  v15.origin.y = v13.origin.y;
  v14 = CGRectIntersection(v13, v15);
  v6 = v14.origin.x;
  width = v14.size.width;
  if (!CGRectIsNull(v14))
  {
    v8 = *(double *)(a1 + 72);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v6, *(double *)(a1 + 48) + *(double *)(a1 + 64) - v8, width, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", x, v5, width, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

void __69__SBTouchRegionManager__queue_calculateHitTestRegionsFromSceneRects___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double x;
  double y;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(a2, "bs_CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v26.origin.x = v3;
  v26.origin.y = v5;
  v26.size.width = v7;
  v26.size.height = v9;
  v24 = CGRectIntersection(*(CGRect *)(a1 + 72), v26);
  x = v24.origin.x;
  y = v24.origin.y;
  if (!CGRectIsNull(v24))
  {
    v13 = *(double *)(a1 + 72);
    v14 = *(double *)(a1 + 80);
    if (v13 == x && v14 == y)
    {
      if (BSFloatEqualToFloat())
      {
        v18 = *(_QWORD *)(a1 + 40);
        goto LABEL_14;
      }
      if (BSFloatEqualToFloat())
      {
        v18 = *(_QWORD *)(a1 + 48);
        goto LABEL_14;
      }
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 88);
      v17 = *(_QWORD *)(a1 + 96);
      CGRectGetMaxX(*(CGRect *)&v13);
      if (BSFloatEqualToFloat())
      {
        v18 = *(_QWORD *)(a1 + 56);
LABEL_14:
        *(_BYTE *)(*(_QWORD *)(v18 + 8) + 24) = 1;
        return;
      }
      CGRectGetMaxY(*(CGRect *)(a1 + 72));
      if (BSFloatEqualToFloat())
      {
        v18 = *(_QWORD *)(a1 + 64);
        goto LABEL_14;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 112);
    v20 = *(_QWORD *)(a1 + 32);
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    NSStringFromCGRect(v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(*(CGRect *)(a1 + 72));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("SBTouchRegionManager.m"), 414, CFSTR("This touchRegion: %@ doesn't intersect this rect along the side: %@"), v21, v22);

  }
}

- (id)_queue_floatingHitTestRegionForLayoutRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double queue_touchRegionBuffer;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v8 = 0;
  }
  else
  {
    queue_touchRegionBuffer = self->_queue_touchRegionBuffer;
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v16 = CGRectInset(v15, -queue_touchRegionBuffer, 0.0);
    v10 = v16.origin.x;
    v11 = v16.origin.y;
    v12 = v16.size.width;
    v13 = v16.size.height;
    v16.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v16.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v17 = CGRectInset(v16, queue_touchRegionBuffer, 0.0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v10, v11, v12, v13, v17.origin.x, 0.0, v17.size.width, v13);
  }
  return v8;
}

- (void)_queue_handleChamoisUILayout:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  BOOL IsIdentity;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CGAffineTransform v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hardwareIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isMainDisplay"))
  {

    goto LABEL_9;
  }
  v9 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
  *(_OWORD *)&v29.a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
  *(_OWORD *)&v29.c = v9;
  *(_OWORD *)&v29.tx = *(_OWORD *)&self->_queue_rootWindowTransform.tx;
  IsIdentity = CGAffineTransformIsIdentity(&v29);

  if (IsIdentity)
  {
LABEL_9:
    -[SBBackBoardServicesInterface setHitTestRegions:forDisplay:](self->_queue_bksInterface, "setHitTestRegions:forDisplay:", MEMORY[0x1E0C9AA60], v7);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:", v14, v16, v18, v20);
  objc_msgSend(v21, "setExclusiveTouchNormalizedSubRect:", 0.0, 0.0, 1.0, 1.0);
  v30[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTouchRegionManager _queue_transformHitTestRegions:withDisplayLayout:](self, "_queue_transformHitTestRegions:withDisplayLayout:", v22, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchRegionManager.m"), 537, CFSTR("Unexpected number of transformed hit test regions [%lu]"), objc_msgSend(v23, "count"));

  }
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v24);

  -[SBTouchRegionManager _queue_calculateBorderHitTestRegionsWithDisplayLayout:](self, "_queue_calculateBorderHitTestRegionsWithDisplayLayout:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchRegionManager.m"), 542, CFSTR("Unexpected number of border hit test regions [%lu]"), objc_msgSend(v25, "count"));

  }
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v26);

  -[SBBackBoardServicesInterface setHitTestRegions:forDisplay:](self->_queue_bksInterface, "setHitTestRegions:forDisplay:", v11, v7);
LABEL_10:

}

- (CGAffineTransform)_queue_hitTestRegionTransformWithDisplayLayout:(SEL)a3
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform *result;
  double tx;
  double ty;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  v6 = a4;
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = v11 * self->_queue_rootWindowTransform.c + self->_queue_rootWindowTransform.a * v9;
  v13 = v11 * self->_queue_rootWindowTransform.d + self->_queue_rootWindowTransform.b * v9;
  objc_msgSend(v6, "displayConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointScale");
  v16 = v15;

  objc_msgSend(v6, "displayConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "nativeOrientation");
  v19 = v18;

  v20 = 6.28318531 - v19;
  memset(&v29.c, 0, 32);
  if (v19 == 0.0)
    v20 = 0.0;
  *(_OWORD *)&v29.a = 0uLL;
  CGAffineTransformMakeRotation(&v27, v20);
  UIIntegralTransform();
  result = CGAffineTransformScale(&v29, &v28, 1.0 / v16, 1.0 / v16);
  tx = self->_queue_rootWindowTransform.tx;
  ty = self->_queue_rootWindowTransform.ty;
  v24 = v29.tx + ty * v29.c + v29.a * tx;
  v25 = v29.ty + ty * v29.d + v29.b * tx;
  v26 = *(_OWORD *)&self->_queue_rootWindowTransform.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->_queue_rootWindowTransform.a;
  *(_OWORD *)&retstr->c = v26;
  retstr->tx = v24 + (v9 - v12) * 0.5;
  retstr->ty = v25 + (v11 - v13) * 0.5;
  return result;
}

- (id)_queue_transformHitTestRegions:(id)a3 withDisplayLayout:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v6 = a3;
  -[SBTouchRegionManager _queue_hitTestRegionTransformWithDisplayLayout:](self, "_queue_hitTestRegionTransformWithDisplayLayout:", a4);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v12 = v15;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __73__SBTouchRegionManager__queue_transformHitTestRegions_withDisplayLayout___block_invoke;
  v10[3] = &unk_1E8EAE908;
  v13 = v16;
  v14 = v17;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

void __73__SBTouchRegionManager__queue_transformHitTestRegions_withDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  __int128 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  v3 = (objc_class *)MEMORY[0x1E0D00D60];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "rect");
  v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v16.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tx = *(_OWORD *)(a1 + 72);
  v18 = CGRectApplyAffineTransform(v17, &v16);
  v7 = (void *)objc_msgSend(v5, "initWithRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  objc_msgSend(v4, "exclusiveTouchNormalizedSubRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "setExclusiveTouchNormalizedSubRect:", v9, v11, v13, v15);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (id)_queue_calculateBorderHitTestRegionsWithDisplayLayout:(id)a3
{
  double queue_edgeTouchRegionBuffer;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double x;
  void *v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double width;
  double v44;
  double height;
  double v46;
  double v47;
  double y;
  double v49;
  double v50;
  CGAffineTransform v51;
  CGRect v52;
  CGRect v53;

  queue_edgeTouchRegionBuffer = self->_queue_edgeTouchRegionBuffer;
  v5 = a3;
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SBTouchRegionManager _queue_hitTestRegionTransformWithDisplayLayout:](self, "_queue_hitTestRegionTransformWithDisplayLayout:", v5);
  v52.origin.x = v8;
  v49 = v12;
  v52.origin.y = v10;
  v52.size.width = v12;
  v52.size.height = v14;
  v53 = CGRectApplyAffineTransform(v52, &v51);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v8;
  v46 = x;
  v17 = x - v8;
  v18 = (double *)MEMORY[0x1E0C9D648];
  if (x - v8 <= queue_edgeTouchRegionBuffer)
  {
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v19 = v17 - queue_edgeTouchRegionBuffer;
    v20 = 0.0;
    v21 = 0.0;
    v22 = v14;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v50, v10, v17, v14, v20, v21, v19, v22);
  objc_msgSend(v16, "addObject:", v23);
  v24 = v46 + width;
  v25 = v50 + v49 - (v46 + width);
  if (v25 <= queue_edgeTouchRegionBuffer)
  {
    v27 = *v18;
    v26 = v18[1];
    v28 = v18[3];
    v44 = v18[2];
  }
  else
  {
    v44 = v25 - queue_edgeTouchRegionBuffer;
    v26 = 0.0;
    v27 = queue_edgeTouchRegionBuffer;
    v28 = v14;
  }
  v47 = v14;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v24, v10, v25, v14, v27, v26, v44, v28);
  objc_msgSend(v16, "addObject:", v29);
  v30 = y - v10;
  if (y - v10 <= queue_edgeTouchRegionBuffer)
  {
    v32 = *v18;
    v33 = v18[1];
    v35 = v18[2];
    v31 = v18[3];
    v34 = v49;
  }
  else
  {
    v31 = v30 - queue_edgeTouchRegionBuffer;
    v32 = 0.0;
    v33 = 0.0;
    v34 = v49;
    v35 = v49;
  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v50, v10, v34, v30, v32, v33, v35, v31);
  objc_msgSend(v16, "addObject:", v36);
  v37 = v10 + v47 - (y + height);
  if (v37 <= queue_edgeTouchRegionBuffer)
  {
    v39 = *v18;
    queue_edgeTouchRegionBuffer = v18[1];
    v40 = v34;
    v34 = v18[2];
    v38 = v18[3];
  }
  else
  {
    v38 = v37 - queue_edgeTouchRegionBuffer;
    v39 = 0.0;
    v40 = v34;
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D60]), "initWithRect:exclusiveTouchSubRect:", v50, y + height, v40, v37, v39, queue_edgeTouchRegionBuffer, v34, v38);
  objc_msgSend(v16, "addObject:", v41);

  return v16;
}

uint64_t __73__SBTouchRegionManager_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleChamoisUILayout:", *(_QWORD *)(a1 + 40));
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  SBScreenSharingOverlayUISettings *v7;

  v7 = (SBScreenSharingOverlayUISettings *)a3;
  v6 = a4;
  if ((SBScreenSharingOverlayUISettings *)self->_medusaSettings == v7
    && objc_msgSend(v6, "isEqual:", CFSTR("gapSwipeBuffer")))
  {
    -[SBMedusa1oSettings gapSwipeBuffer](self->_medusaSettings, "gapSwipeBuffer");
    -[SBTouchRegionManager setTouchRegionBuffer:](self, "setTouchRegionBuffer:");
  }
  else if (self->_screenSharingSettings == v7 && objc_msgSend(v6, "isEqual:", CFSTR("edgeSwipeBuffer")))
  {
    -[SBScreenSharingOverlayUISettings edgeSwipeBuffer](self->_screenSharingSettings, "edgeSwipeBuffer");
    -[SBTouchRegionManager setEdgeTouchRegionBuffer:](self, "setEdgeTouchRegionBuffer:");
  }

}

- (CGAffineTransform)rootWindowTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_queue_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_queue_bksInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
