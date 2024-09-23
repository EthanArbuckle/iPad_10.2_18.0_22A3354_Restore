@implementation PXTilingController

- (void)requestFocus
{
  id v3;

  -[PXTilingController observer](self, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tilingController:invalidatedWithContext:", self, 1);

}

- (PXTilingController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingController.m"), 104, CFSTR("invalid initializer"));

  abort();
}

- (PXTilingController)initWithLayout:(id)a3
{
  id v5;
  char *v6;
  char *v7;
  __int128 v8;
  PXTilingCoordinateSpace *v9;
  void *v10;
  PXTilingCoordinateSpaceConverter *v11;
  void *v12;
  PXTileStatePool *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXTilingController;
  v6 = -[PXTilingController init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 216) = *(_OWORD *)off_1E50B8810;
    v8 = *((_OWORD *)off_1E50B7FF8 + 1);
    *(_OWORD *)(v6 + 264) = *(_OWORD *)off_1E50B7FF8;
    *(_OWORD *)(v6 + 280) = v8;
    v9 = objc_alloc_init(PXTilingCoordinateSpace);
    v10 = (void *)*((_QWORD *)v7 + 16);
    *((_QWORD *)v7 + 16) = v9;

    *((_QWORD *)v7 + 17) = objc_msgSend(*((id *)v7 + 16), "identifier");
    v11 = objc_alloc_init(PXTilingCoordinateSpaceConverter);
    v12 = (void *)*((_QWORD *)v7 + 18);
    *((_QWORD *)v7 + 18) = v11;

    objc_storeStrong((id *)v7 + 9, a3);
    objc_msgSend(*((id *)v7 + 9), "setObserver:", v7);
    v13 = objc_alloc_init(PXTileStatePool);
    v14 = (void *)*((_QWORD *)v7 + 21);
    *((_QWORD *)v7 + 21) = v13;

    *((_WORD *)v7 + 6) = 257;
    v7[14] = 1;
    *(_DWORD *)(v7 + 17) = 16843009;
    v15 = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v7 + 232) = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v7 + 248) = v15;
    v16 = *MEMORY[0x1E0C9D628];
    v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v7 + 424) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v7 + 440) = v17;
    *(_OWORD *)(v7 + 392) = v16;
    *(_OWORD *)(v7 + 408) = v17;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v7 + 22);
    *((_QWORD *)v7 + 22) = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = (void *)*((_QWORD *)v7 + 23);
    *((_QWORD *)v7 + 23) = v20;

    v22 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)(v7 + 456) = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)(v7 + 472) = v22;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = 0;
    *((_QWORD *)v7 + 4) = 0;
    v7[56] = 0;
  }

  return (PXTilingController *)v7;
}

- (void)dealloc
{
  PXTileIdentifier *identifierBuffer;
  PXTileGeometry *geometryBuffer;
  objc_super v5;

  identifierBuffer = self->_identifierBuffer;
  if (identifierBuffer)
    free(identifierBuffer);
  geometryBuffer = self->_geometryBuffer;
  if (geometryBuffer)
    free(geometryBuffer);
  v5.receiver = self;
  v5.super_class = (Class)PXTilingController;
  -[PXTilingController dealloc](&v5, sel_dealloc);
}

- (void)setScrollController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_scrollController);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_scrollController);
      +[PXTilingControllerCompositionEngine compositionEngineForScrollController:createIfNeeded:](PXTilingControllerCompositionEngine, "compositionEngineForScrollController:createIfNeeded:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "unregisterTilingController:", self);
    }
    v9 = objc_storeWeak((id *)&self->_scrollController, obj);
    +[PXTilingControllerCompositionEngine compositionEngineForScrollController:createIfNeeded:](PXTilingControllerCompositionEngine, "compositionEngineForScrollController:createIfNeeded:", obj, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "registerTilingController:", self);
    -[PXTilingController _invalidateScrollControllerMetrics](self, "_invalidateScrollControllerMetrics");

    v5 = obj;
  }

}

- (void)setScrollDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollDelegate, obj);
    self->_scrollDelegateFlags.respondsToInitialVisibleOriginForLayout = objc_opt_respondsToSelector() & 1;
    self->_scrollDelegateFlags.respondsToTargetVisibleOriginForLayoutProposedVisibleOrigin = objc_opt_respondsToSelector() & 1;
    self->_scrollDelegateFlags.respondsToScrollInfoForLayout = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setTransitionDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_transitionDelegate, obj);
    self->_transitionDelegateFlags.respondsToPrepareForChange = objc_opt_respondsToSelector() & 1;
    self->_transitionDelegateFlags.respondsToTileIdentifierConverterForChange = objc_opt_respondsToSelector() & 1;
    self->_transitionDelegateFlags.respondsToTransitionAnimationCoordinatorForChange = objc_opt_respondsToSelector() & 1;
  }

}

- (PXTileIdentifier)tileIdentifierForTile:(SEL)a3
{
  void *v6;
  uint64_t *v7;
  __int128 v8;
  __int128 v9;
  PXTileIdentifier *result;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v12 = 0;
  v13 = &v12;
  v14 = 0x7810000000;
  v15 = &unk_1A7E74EE7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  -[PXTilingController _tileStates](self, "_tileStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__PXTilingController_tileIdentifierForTile___block_invoke;
  v11[3] = &unk_1E51291D8;
  v11[4] = &v12;
  v11[5] = a4;
  objc_msgSend(v6, "enumerateStatesUsingBlock:", v11);

  v7 = v13;
  v8 = *((_OWORD *)v13 + 5);
  *(_OWORD *)&retstr->index[3] = *((_OWORD *)v13 + 4);
  *(_OWORD *)&retstr->index[5] = v8;
  *(_OWORD *)&retstr->index[7] = *((_OWORD *)v7 + 6);
  retstr->index[9] = v7[14];
  v9 = *((_OWORD *)v7 + 3);
  *(_OWORD *)&retstr->length = *((_OWORD *)v7 + 2);
  *(_OWORD *)&retstr->index[1] = v9;
  _Block_object_dispose(&v12, 8);
  return result;
}

- (BOOL)getTile:(void *)a3 geometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileWithIdentifier:(PXTileIdentifier *)a7
{
  void *v13;
  CGSize v14;
  CGSize v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  BOOL v20;
  void *v21;
  unint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGSize v28;
  CGSize v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGSize v36;
  CGSize v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGSize v42;
  CGSize v43;
  CGPoint v45;
  CGSize v46;
  CGPoint v47;
  CGSize v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  unint64_t v63;

  -[PXTilingController _tileStates](self, "_tileStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(CGSize *)&a7->index[5];
  v47 = *(CGPoint *)&a7->index[3];
  v48 = v14;
  v49 = *(_OWORD *)&a7->index[7];
  *(_QWORD *)&v50 = a7->index[9];
  v15 = *(CGSize *)&a7->index[1];
  v45 = *(CGPoint *)&a7->length;
  v46 = v15;
  v16 = objc_msgSend(v13, "indexOfStateWithTargetIdentifier:", &v45);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = (CGPoint)0;
    v48 = (CGSize)0;
    v45 = (CGPoint)0;
    v46 = (CGSize)0;
LABEL_6:
    -[PXTilingController _tileStates](self, "_tileStates", v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "stateAtIndex:", v16);

    v21 = *(void **)(v31 + 696);
    v32 = *(_OWORD *)(v31 + 432);
    v53 = *(_OWORD *)(v31 + 416);
    v54 = v32;
    v33 = *(_OWORD *)(v31 + 464);
    v55 = *(_OWORD *)(v31 + 448);
    v56 = v33;
    v34 = *(_OWORD *)(v31 + 368);
    v49 = *(_OWORD *)(v31 + 352);
    v50 = v34;
    v35 = *(_OWORD *)(v31 + 400);
    v51 = *(_OWORD *)(v31 + 384);
    v52 = v35;
    v36 = *(CGSize *)(v31 + 304);
    v45 = *(CGPoint *)(v31 + 288);
    v46 = v36;
    v37 = *(CGSize *)(v31 + 336);
    v47 = *(CGPoint *)(v31 + 320);
    v48 = v37;
    v22 = *(_QWORD *)(v31 + 272);
    v23 = *(id *)(v31 + 680);
    v20 = 1;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[PXTilingController _tileStates](self, "_tileStates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __76__PXTilingController_getTile_geometry_group_userData_forTileWithIdentifier___block_invoke;
  v57[3] = &__block_descriptor_120_e414_B24__0__PXProtectedTileState_B_PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q__QB_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v__PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_BB_v_v_vQ_8_B16l;
  v18 = *(_OWORD *)&a7->index[5];
  v60 = *(_OWORD *)&a7->index[3];
  v61 = v18;
  v62 = *(_OWORD *)&a7->index[7];
  v63 = a7->index[9];
  v19 = *(_OWORD *)&a7->index[1];
  v58 = *(_OWORD *)&a7->length;
  v59 = v19;
  v16 = objc_msgSend(v17, "indexOfFirstStatePassingTest:", v57);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = *((_OWORD *)off_1E50B8940 + 9);
  v53 = *((_OWORD *)off_1E50B8940 + 8);
  v54 = v24;
  v25 = *((_OWORD *)off_1E50B8940 + 11);
  v55 = *((_OWORD *)off_1E50B8940 + 10);
  v56 = v25;
  v26 = *((_OWORD *)off_1E50B8940 + 5);
  v49 = *((_OWORD *)off_1E50B8940 + 4);
  v50 = v26;
  v27 = *((_OWORD *)off_1E50B8940 + 7);
  v51 = *((_OWORD *)off_1E50B8940 + 6);
  v52 = v27;
  v28 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
  v45 = *(CGPoint *)off_1E50B8940;
  v46 = v28;
  v29 = (CGSize)*((_OWORD *)off_1E50B8940 + 3);
  v47 = (CGPoint)*((_OWORD *)off_1E50B8940 + 2);
  v48 = v29;
  if (a3)
LABEL_7:
    *a3 = v21;
LABEL_8:
  if (a4)
  {
    v38 = v54;
    *(_OWORD *)&a4->hidden = v53;
    *(_OWORD *)&a4->contentSize.height = v38;
    v39 = v56;
    *(_OWORD *)&a4->contentsRect.origin.y = v55;
    *(_OWORD *)&a4->contentsRect.size.height = v39;
    v40 = v50;
    *(_OWORD *)&a4->transform.a = v49;
    *(_OWORD *)&a4->transform.c = v40;
    v41 = v52;
    *(_OWORD *)&a4->transform.tx = v51;
    *(_OWORD *)&a4->alpha = v41;
    v42 = v46;
    a4->frame.origin = v45;
    a4->frame.size = v42;
    v43 = v48;
    a4->center = v47;
    a4->size = v43;
  }
  if (a5)
    *a5 = v22;
  if (a6)
    *a6 = objc_retainAutorelease(v23);

  return v20;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  -[PXTilingController _indexesOfVisibleTilesInRect:withOptions:](self, "_indexesOfVisibleTilesInRect:withOptions:", a4, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController _tileStates](self, "_tileStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__PXTilingController_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v15[3] = &unk_1E5129220;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "enumerateStatesAtIndexes:usingBlock:", v12, v15);

}

- (PXTileIdentifier)hitTestTileAtPoint:(SEL)a3 padding:(CGPoint)a4 passingTest:(UIEdgeInsets)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  PXTileIdentifier *result;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t *v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[4];
  _QWORD v38[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  y = a4.y;
  x = a4.x;
  v10 = a6;
  PXRectWithEdges();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v51 = 0;
  v52 = &v51;
  v53 = 0x7810000000;
  v54 = &unk_1A7E74EE7;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0xE010000000;
  v38[3] = &unk_1A7E74EE7;
  v19 = *((_OWORD *)off_1E50B8940 + 9);
  v47 = *((_OWORD *)off_1E50B8940 + 8);
  v48 = v19;
  v20 = *((_OWORD *)off_1E50B8940 + 11);
  v49 = *((_OWORD *)off_1E50B8940 + 10);
  v50 = v20;
  v21 = *((_OWORD *)off_1E50B8940 + 5);
  v43 = *((_OWORD *)off_1E50B8940 + 4);
  v44 = v21;
  v22 = *((_OWORD *)off_1E50B8940 + 7);
  v45 = *((_OWORD *)off_1E50B8940 + 6);
  v46 = v22;
  v23 = *((_OWORD *)off_1E50B8940 + 1);
  v39 = *(_OWORD *)off_1E50B8940;
  v40 = v23;
  v24 = *((_OWORD *)off_1E50B8940 + 3);
  v41 = *((_OWORD *)off_1E50B8940 + 2);
  v42 = v24;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0x7FEFFFFFFFFFFFFFLL;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__PXTilingController_hitTestTileAtPoint_padding_passingTest___block_invoke;
  v30[3] = &unk_1E5129248;
  v25 = v10;
  v35 = x;
  v36 = y;
  v31 = v25;
  v32 = v37;
  v33 = v38;
  v34 = &v51;
  -[PXTilingController enumerateTilesInRect:withOptions:usingBlock:](self, "enumerateTilesInRect:withOptions:usingBlock:", 0, v30, v12, v14, v16, v18);
  v26 = v52;
  v27 = *((_OWORD *)v52 + 5);
  *(_OWORD *)&retstr->index[3] = *((_OWORD *)v52 + 4);
  *(_OWORD *)&retstr->index[5] = v27;
  *(_OWORD *)&retstr->index[7] = *((_OWORD *)v26 + 6);
  retstr->index[9] = v26[14];
  v28 = *((_OWORD *)v26 + 3);
  *(_OWORD *)&retstr->length = *((_OWORD *)v26 + 2);
  *(_OWORD *)&retstr->index[1] = v28;

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v51, 8);

  return result;
}

- (void)registerPreheatHandler:(id)a3 withPadding:(UIEdgeInsets)a4 tileGroup:(unint64_t)a5 context:(void *)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v12;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[PXTilingController _preheatRecordForPreheatHandler:context:createIfNeeded:](self, "_preheatRecordForPreheatHandler:context:createIfNeeded:", a3, a6, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPadding:", top, left, bottom, right);
  objc_msgSend(v12, "setTileGroup:", a5);
  -[PXTilingController _invalidateMaxPreheatPadding](self, "_invalidateMaxPreheatPadding");
  -[PXTilingController _invalidatePreheating](self, "_invalidatePreheating");

}

- (void)unregisterPreheatHandler:(id)a3 context:(void *)a4
{
  void *v5;
  id v6;

  -[PXTilingController _preheatRecordForPreheatHandler:context:createIfNeeded:](self, "_preheatRecordForPreheatHandler:context:createIfNeeded:", a3, a4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXTilingController _preheatRecords](self, "_preheatRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

    -[PXTilingController _invalidateMaxPreheatPadding](self, "_invalidateMaxPreheatPadding");
  }

}

- (PXTilingControllerDebugInfo)debugInfo
{
  PXTilingControllerDebugInfo *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PXTilingControllerDebugInfo);
  -[PXTilingController _activeRect](self, "_activeRect");
  -[PXTilingControllerDebugInfo setActiveRect:](v3, "setActiveRect:");
  -[PXTilingController _visibleRect](self, "_visibleRect");
  -[PXTilingControllerDebugInfo setVisibleRect:](v3, "setVisibleRect:");
  -[PXTilingController _pagedRect](self, "_pagedRect");
  -[PXTilingControllerDebugInfo setPagedRect:](v3, "setPagedRect:");
  -[PXTilingController _cachedRect](self, "_cachedRect");
  -[PXTilingControllerDebugInfo setCachedRect:](v3, "setCachedRect:");
  -[PXTilingController layoutContentBounds](self, "layoutContentBounds");
  -[PXTilingControllerDebugInfo setContentBounds:](v3, "setContentBounds:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[PXTilingController _preheatRecords](self, "_preheatRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
        -[PXTilingController _activeRect](self, "_activeRect");
        objc_msgSend(v10, "padding");
        sub_1A7AE3F38();
        PXEdgeInsetsInsetRect();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v7);
  }

  -[PXTilingControllerDebugInfo setPreheatRects:](v3, "setPreheatRects:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController _tileStates](self, "_tileStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController _pagedRect](self, "_pagedRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __31__PXTilingController_debugInfo__block_invoke;
  v54[3] = &unk_1E5129270;
  v22 = v12;
  v55 = v22;
  objc_msgSend(v13, "enumerateStatesInRect:usingBlock:", v54, v15, v17, v19, v21);

  v45 = v22;
  -[PXTilingControllerDebugInfo setPagedItems:](v3, "setPagedItems:", v22);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[PXTilingController _preheatRecords](self, "_preheatRecords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v29), "preheatedTileIndexes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addIndexes:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v27);
  }

  -[PXTilingController _tileStates](self, "_tileStates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __31__PXTilingController_debugInfo__block_invoke_2;
  v48[3] = &unk_1E5129270;
  v49 = v23;
  v33 = v23;
  objc_msgSend(v31, "enumerateStatesAtIndexes:usingBlock:", v24, v48);

  -[PXTilingControllerDebugInfo setPreheatedItems:](v3, "setPreheatedItems:", v33);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController _activeRect](self, "_activeRect");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v46[0] = v32;
  v46[1] = 3221225472;
  v46[2] = __31__PXTilingController_debugInfo__block_invoke_3;
  v46[3] = &unk_1E5130F48;
  v47 = v34;
  v43 = v34;
  -[PXTilingController enumerateTilesInRect:withOptions:usingBlock:](self, "enumerateTilesInRect:withOptions:usingBlock:", 0, v46, v36, v38, v40, v42);
  -[PXTilingControllerDebugInfo setActiveItems:](v3, "setActiveItems:", v43);

  return v3;
}

- (id)debugQuickLookObject
{
  void *v2;
  void *v3;

  -[PXTilingController debugInfo](self, "debugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugQuickLookObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  PXTilingChangeEvent *v8;

  if (a3.width != self->__referenceSize.width || a3.height != self->__referenceSize.height)
  {
    height = a3.height;
    width = a3.width;
    -[PXTilingController _ensureCurrentChange](self, "_ensureCurrentChange");
    self->__referenceSize.width = width;
    self->__referenceSize.height = height;
    if ((PXSizeIsNull() & 1) == 0)
    {
      -[PXTilingController _currentChange](self, "_currentChange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PXTilingChangeEvent initWithChangeToReferenceSize:]([PXTilingChangeEvent alloc], "initWithChangeToReferenceSize:", width, height);
      objc_msgSend(v7, "addEvent:", v8);

    }
    -[PXTilingController _invalidateLayoutMetrics](self, "_invalidateLayoutMetrics");
  }
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  PXTilingChangeEvent *v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    -[PXTilingController _ensureCurrentChange](self, "_ensureCurrentChange");
    self->__contentInset.top = top;
    self->__contentInset.left = left;
    self->__contentInset.bottom = bottom;
    self->__contentInset.right = right;
    if ((PXEdgeInsetsIsNull() & 1) == 0)
    {
      -[PXTilingController _currentChange](self, "_currentChange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXTilingChangeEvent initWithChangeToContentInset:]([PXTilingChangeEvent alloc], "initWithChangeToContentInset:", top, left, bottom, right);
      objc_msgSend(v8, "addEvent:", v9);

    }
    -[PXTilingController _invalidateLayoutMetrics](self, "_invalidateLayoutMetrics");
  }
}

- (void)_setActiveRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__activeRect))
  {
    self->__activeRect.origin.x = x;
    self->__activeRect.origin.y = y;
    self->__activeRect.size.width = width;
    self->__activeRect.size.height = height;
    -[PXTilingController _invalidatePagedRect](self, "_invalidatePagedRect");
    -[PXTilingController _invalidateTiles](self, "_invalidateTiles");
  }
}

- (void)_setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__visibleRect))
  {
    v8 = self->__visibleRect.size.width;
    v9 = self->__visibleRect.size.height;
    self->__visibleRect.origin.x = x;
    self->__visibleRect.origin.y = y;
    self->__visibleRect.size.width = width;
    self->__visibleRect.size.height = height;
    if (width != v8 || height != v9)
      -[PXTilingController _invalidateLayoutMetrics](self, "_invalidateLayoutMetrics");
    -[PXTilingController _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
  }
}

- (void)_setMaxPreheatPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    self->__maxPreheatPadding.top = top;
    self->__maxPreheatPadding.left = left;
    self->__maxPreheatPadding.bottom = bottom;
    self->__maxPreheatPadding.right = right;
    -[PXTilingController _invalidatePagedRect](self, "_invalidatePagedRect");
  }
}

- (void)_setPagedRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__pagedRect))
  {
    self->__pagedRect.origin.x = x;
    self->__pagedRect.origin.y = y;
    self->__pagedRect.size.width = width;
    self->__pagedRect.size.height = height;
    PXRectDiff();
  }
}

- (void)_setDirtyRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->__dirtyRect))
  {
    self->__dirtyRect.origin.x = x;
    self->__dirtyRect.origin.y = y;
    self->__dirtyRect.size.width = width;
    self->__dirtyRect.size.height = height;
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    if (!CGRectIsEmpty(v8))
      -[PXTilingController _invalidateTiles](self, "_invalidateTiles");
  }
}

- (void)_setTargetLayout:(id)a3
{
  PXTilingLayout *v5;
  void *v6;
  PXTilingChangeEvent *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (PXTilingLayout *)a3;
  if (self->_targetLayout != v5)
  {
    -[PXTilingController _ensureCurrentChange](self, "_ensureCurrentChange");
    -[PXTilingLayout setObserver:](self->_targetLayout, "setObserver:", 0);
    objc_storeStrong((id *)&self->_targetLayout, a3);
    -[PXTilingLayout setObserver:](self->_targetLayout, "setObserver:", self);
    -[PXTilingController _currentChange](self, "_currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXTilingChangeEvent initWithChangeToLayout:]([PXTilingChangeEvent alloc], "initWithChangeToLayout:", v5);
    objc_msgSend(v6, "addEvent:", v7);

    -[PXTilingController _tileStates](self, "_tileStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PXTilingController__setTargetLayout___block_invoke;
    v10[3] = &unk_1E5129270;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v9, "enumerateStatesUsingBlock:", v10);
    -[PXTilingController _invalidateAllCachedRects](self, "_invalidateAllCachedRects");
    -[PXTilingController _invalidateLayoutMetrics](self, "_invalidateLayoutMetrics");
    -[PXTilingController _invalidateLayoutPreferredVisibleOrigin](self, "_invalidateLayoutPreferredVisibleOrigin");
    -[PXTilingController _invalidateLayoutPosition](self, "_invalidateLayoutPosition");
    -[PXTilingController _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
    -[PXTilingController _invalidateTiles](self, "_invalidateTiles");
    -[PXTilingController _invalidateScrollInfo](self, "_invalidateScrollInfo");

  }
}

- (id)_indexesOfVisibleTilesInRect:(CGRect)a3 withOptions:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)MEMORY[0x1E0CB3788];
  v10 = a4;
  objc_msgSend(v9, "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tileGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTilingController _tileStates](self, "_tileStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__PXTilingController__indexesOfVisibleTilesInRect_withOptions___block_invoke;
  v19[3] = &unk_1E5129298;
  v20 = v12;
  v14 = v11;
  v21 = v14;
  v15 = v12;
  objc_msgSend(v13, "enumerateStatesInRect:usingBlock:", v19, x, y, width, height);
  v16 = v21;
  v17 = v14;

  return v17;
}

- (void)_handleTileAnimationCompletionWithIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[PXTilingController _tileStates](self, "_tileStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stateAtIndex:", a3);

  v7 = *(_QWORD *)(v6 + 704) - 1;
  *(_QWORD *)(v6 + 704) = v7;
  if (!v7 && !self->_isPerformingUpdates)
    -[PXTilingController _invalidateTiles](self, "_invalidateTiles");
}

- (id)_preheatRecordForPreheatHandler:(id)a3 context:(void *)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  PXTilingControllerPreheatRecord *v10;
  uint64_t v11;
  PXTilingControllerPreheatRecord *i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXTilingController _preheatRecords](self, "_preheatRecords", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (PXTilingControllerPreheatRecord *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (PXTilingControllerPreheatRecord *)((char *)i + 1))
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "preheatHandler");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14 == v8)
        {
          v15 = (void *)objc_msgSend(v13, "context");

          if (v15 == a4)
          {
            v10 = v13;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v10 = (PXTilingControllerPreheatRecord *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  if (!v10 && v5)
  {
    v10 = -[PXTilingControllerPreheatRecord initWithPreheatHandler:context:]([PXTilingControllerPreheatRecord alloc], "initWithPreheatHandler:context:", v8, a4);
    -[PXTilingController _preheatRecords](self, "_preheatRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v10);

  }
  return v10;
}

- (void)_prepareBufferForCount:(unint64_t)a3
{
  if (self->_bufferCount < a3)
  {
    self->_identifierBuffer = (PXTileIdentifier *)malloc_type_realloc(self->_identifierBuffer, 88 * a3, 0x1000040931E79F6uLL);
    self->_geometryBuffer = (PXTileGeometry *)malloc_type_realloc(self->_geometryBuffer, 192 * a3, 0x108004042DB75DEuLL);
    self->_bufferCount = a3;
  }
}

- (void)_fillBuffersWithTileStatesAtIndexes:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[4];

  v4 = a3;
  -[PXTilingController _prepareBufferForCount:](self, "_prepareBufferForCount:", objc_msgSend(v4, "count"));
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  -[PXTilingController _tileStates](self, "_tileStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXTilingController__fillBuffersWithTileStatesAtIndexes___block_invoke;
  v6[3] = &unk_1E51292C0;
  v6[4] = self;
  v6[5] = v7;
  objc_msgSend(v5, "enumerateStatesAtIndexes:usingBlock:", v4, v6);

  _Block_object_dispose(v7, 8);
}

- (void)_markRectAsCached:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  double MinY;
  double MaxX;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[PXTilingController _cachedRect](self, "_cachedRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if (-[PXTilingController shouldAggressivelyEvictTileCaches](self, "shouldAggressivelyEvictTileCaches"))
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_17:
      -[PXTilingController _setCachedRect:](self, "_setCachedRect:", x, y, width, height);
      return;
    }
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = v13;
    v20.size.height = v15;
    if (CGRectIsEmpty(v20))
      goto LABEL_17;
    if (x == v9 && width == v13)
    {
      v21.origin.x = v9;
      v21.origin.y = v11;
      v21.size.width = v13;
      v21.size.height = v15;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      if (CGRectIntersectsRect(v21, v33))
        goto LABEL_16;
      v22.origin.x = v9;
      v22.origin.y = v11;
      v22.size.width = v13;
      v22.size.height = v15;
      MaxY = CGRectGetMaxY(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      if (MaxY == CGRectGetMinY(v23))
        goto LABEL_16;
      v24.origin.x = v9;
      v24.origin.y = v11;
      v24.size.width = v13;
      v24.size.height = v15;
      MinY = CGRectGetMinY(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v16 = CGRectGetMaxY(v25);
    }
    else
    {
      if (y != v11 || height != v15)
        goto LABEL_17;
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      if (CGRectIntersectsRect(v26, v34))
        goto LABEL_16;
      v27.origin.x = v9;
      v27.origin.y = v11;
      v27.size.width = v13;
      v27.size.height = v15;
      MaxX = CGRectGetMaxX(v27);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      if (MaxX == CGRectGetMinX(v28))
        goto LABEL_16;
      v29.origin.x = v9;
      v29.origin.y = v11;
      v29.size.width = v13;
      v29.size.height = v15;
      MinY = CGRectGetMinX(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v16 = CGRectGetMaxX(v30);
    }
    if (MinY != v16)
      goto LABEL_17;
LABEL_16:
    v31.origin.x = v9;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v15;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v32 = CGRectUnion(v31, v35);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    goto LABEL_17;
  }
}

- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[PXTilingController _setReferenceSize:](self, "_setReferenceSize:", a3.width, a3.height);
  -[PXTilingController _setContentInset:](self, "_setContentInset:", top, left, bottom, right);
}

- (CGRect)layoutContentBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXTilingController targetLayout](self, "targetLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)layoutScrollBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXTilingController targetLayout](self, "targetLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)layoutPreferredOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void (**v19)(double, double, double, double, double, double);
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  CGPoint result;

  if (!self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingController.m"), 616, CFSTR("property not valid unless within updates"));

  }
  -[PXTilingController _updatedPreferredVisibleOrigin](self, "_updatedPreferredVisibleOrigin");
  v4 = v3;
  v6 = v5;
  if ((PXPointIsNull() & 1) != 0)
  {
    v7 = *(double *)off_1E50B8580;
    v8 = *((double *)off_1E50B8580 + 1);
  }
  else
  {
    -[PXTilingController _visibleRect](self, "_visibleRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PXTilingController targetLayout](self, "targetLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__PXTilingController_layoutPreferredOrigin__block_invoke;
    aBlock[3] = &unk_1E51292E8;
    v31 = v17;
    v18 = v17;
    v19 = (void (**)(double, double, double, double, double, double))_Block_copy(aBlock);
    v19[2](v10, v12, v10, v12, v14, v16);
    objc_msgSend(v18, "contentBounds");
    ((void (*)(void (**)(double, double, double, double, double, double), double, double, double, double, double, double))v19[2])(v19, v4, v6, v20, v21, v22, v23);
    PXPointSubtract();
    v7 = v24;
    v8 = v25;

  }
  v26 = v7;
  v27 = v8;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGPoint)layoutOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[PXTilingController _layoutDesiredOrigin](self, "_layoutDesiredOrigin");
  v4 = v3;
  v6 = v5;
  if (PXPointIsNull())
  {
    -[PXTilingController _coordinateSpace](self, "_coordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTilingController targetLayout](self, "targetLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "parentSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v7)
    {
      if (v9)
        objc_msgSend(v9, "transform", (unsigned __int128)0, (unsigned __int128)0);
      v6 = 0.0;
      v4 = 0.0;
    }

  }
  if (PXPointIsNull())
  {
    -[PXTilingController layoutPreferredOrigin](self, "layoutPreferredOrigin");
    v4 = v11;
    v6 = v12;
  }
  v13 = v4;
  v14 = v6;
  result.y = v14;
  result.x = v13;
  return result;
}

- (PXScrollInfo)scrollInfo
{
  void *v2;
  void *v3;

  -[PXTilingController _scrollInfo](self, "_scrollInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (PXScrollInfo *)v3;
}

- (void)setLayoutOrigin:(CGPoint)a3
{
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", a3.x, a3.y);
  -[PXTilingController _invalidateLayoutPosition](self, "_invalidateLayoutPosition");
}

- (CGPoint)convertPointFromLayout:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXTilingController _coordinateSpaceConverter](self, "_coordinateSpaceConverter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController targetLayout](self, "targetLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v7, "coordinateSpaceIdentifier"), -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), x, y);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)convertRectFromLayout:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTilingController _coordinateSpaceConverter](self, "_coordinateSpaceConverter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController targetLayout](self, "targetLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "coordinateSpaceIdentifier"), -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)convertScrollInfoFromLayout:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double v12;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pagingOrigin");
    -[PXTilingController convertPointFromLayout:](self, "convertPointFromLayout:");
    v7 = v6;
    v9 = v8;
    -[PXTilingController targetLayout](self, "targetLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldFlipHorizontally");

    if (v11)
    {
      objc_msgSend(v5, "interpageSpacing");
      v7 = v7 + v12;
    }
    objc_msgSend(v5, "setPagingOrigin:", v7, v9);
  }
  return v5;
}

- (void)_ensureCurrentChange
{
  PXTilingChange *currentChange;
  PXTilingChange *v4;
  PXTilingChange *v5;
  void *v6;
  PXTilingChange *v7;
  PXTilingChange *v8;
  PXTilingChange *v9;
  id v10;

  currentChange = self->__currentChange;
  if (!currentChange)
  {
    v4 = objc_alloc_init(PXTilingChange);
    v5 = self->__currentChange;
    self->__currentChange = v4;

    currentChange = self->__currentChange;
  }
  -[PXTilingController targetLayout](self, "targetLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingChange recordLayout:](currentChange, "recordLayout:", v6);

  v7 = self->__currentChange;
  -[PXTilingController _referenceSize](self, "_referenceSize");
  -[PXTilingChange recordReferenceSize:](v7, "recordReferenceSize:");
  v8 = self->__currentChange;
  -[PXTilingController _contentInset](self, "_contentInset");
  -[PXTilingChange recordContentInset:](v8, "recordContentInset:");
  v9 = self->__currentChange;
  -[PXTilingController compositionInvalidationContexts](self, "compositionInvalidationContexts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTilingChange recordCompositionInvalidationContexts:](v9, "recordCompositionInvalidationContexts:", v10);

}

- (PXTilingChange)_currentChange
{
  PXTilingChange *currentChange;
  void *v6;

  currentChange = self->__currentChange;
  if (!currentChange)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingController.m"), 709, CFSTR("invalid access to current change"));

    currentChange = self->__currentChange;
  }
  return currentChange;
}

- (id)_currentChangeIfExists
{
  return self->__currentChange;
}

- (void)_discardCurrentChange
{
  PXTilingChange *currentChange;

  currentChange = self->__currentChange;
  self->__currentChange = 0;

}

- (void)beginUpdate
{
  void *v3;
  void *v4;
  id v5;

  -[PXTilingController _currentChangeIfExists](self, "_currentChangeIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && self->_transitionDelegateFlags.respondsToPrepareForChange)
  {
    v5 = v3;
    -[PXTilingController transitionDelegate](self, "transitionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tilingController:prepareForChange:", self, v5);

    v3 = v5;
  }
  *(_WORD *)&self->_isPerformingUpdates = 1;

}

- (void)updateMetrics
{
  -[PXTilingController _updateScrollControllerMetricsIfNeeded](self, "_updateScrollControllerMetricsIfNeeded");
  -[PXTilingController _updateMaxPreheatPaddingIfNeeded](self, "_updateMaxPreheatPaddingIfNeeded");
  -[PXTilingController _updatePagedRectIfNeeded](self, "_updatePagedRectIfNeeded");
  -[PXTilingController _updateLayoutMetricsIfNeeded](self, "_updateLayoutMetricsIfNeeded");
  self->_hasInitializedLayout = 1;
  -[PXTilingController _updateLayoutPreparationIfNeeded](self, "_updateLayoutPreparationIfNeeded");
  -[PXTilingController _updateLayoutPreferredVisibleOriginIfNeeded](self, "_updateLayoutPreferredVisibleOriginIfNeeded");
  -[PXTilingController _updateScrollInfoIfNeeded](self, "_updateScrollInfoIfNeeded");
}

- (void)updateLayout
{
  -[PXTilingController _updateLayoutPositionIfNeeded](self, "_updateLayoutPositionIfNeeded");
  -[PXTilingController _updateLayoutVisibleRectIfNeeded](self, "_updateLayoutVisibleRectIfNeeded");
  -[PXTilingController _updateLayoutPreparationIfNeeded](self, "_updateLayoutPreparationIfNeeded");
}

- (void)endUpdate
{
  double v3;
  double v4;
  void *v5;

  -[PXTilingController _updateTilesIfNeeded](self, "_updateTilesIfNeeded");
  -[PXTilingController _updatePreheatingIfNeeded](self, "_updatePreheatingIfNeeded");
  -[PXTilingController _discardCurrentChange](self, "_discardCurrentChange");
  v3 = *(double *)off_1E50B8580;
  v4 = *((double *)off_1E50B8580 + 1);
  -[PXTilingController _setUpdatedPreferredVisibleOrigin:](self, "_setUpdatedPreferredVisibleOrigin:", *(double *)off_1E50B8580, v4);
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", v3, v4);
  -[PXTilingController targetLayout](self, "targetLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingController _setCurrentLayout:](self, "_setCurrentLayout:", v5);

  -[PXTilingController _updateDebugDelegateIfNeeded](self, "_updateDebugDelegateIfNeeded");
  self->_isPerformingUpdates = 0;
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.scrollControllerMetrics
      || self->_needsUpdateFlags.pagedRect
      || self->_needsUpdateFlags.layoutMetrics
      || self->_needsUpdateFlags.layoutPreferredVisibleOrigin
      || self->_needsUpdateFlags.layoutPosition
      || self->_needsUpdateFlags.layoutVisibleRect
      || self->_needsUpdateFlags.layoutPreparation
      || self->_needsUpdateFlags.tiles
      || self->_needsUpdateFlags.preheating
      || self->_needsUpdateFlags.maxPreheatPadding;
}

- (void)_setNeedsUpdate
{
  id v3;

  if (!self->_isPerformingUpdates && !self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    -[PXTilingController observer](self, "observer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTilingControllerNeedsUpdate:", self);

  }
}

- (void)_invalidateScrollControllerMetrics
{
  self->_needsUpdateFlags.scrollControllerMetrics = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateScrollControllerMetricsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (self->_needsUpdateFlags.scrollControllerMetrics)
  {
    self->_needsUpdateFlags.scrollControllerMetrics = 0;
    -[PXTilingController scrollController](self, "scrollController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v19, "visibleRect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PXTilingController _setActiveRect:](self, "_setActiveRect:", v4, v6, v8, v10);
    -[PXTilingController _setVisibleRect:](self, "_setVisibleRect:", v12, v14, v16, v18);

  }
}

- (void)_invalidateLayoutMetrics
{
  self->_needsUpdateFlags.layoutMetrics = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutMetricsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  id v24;

  if (self->_needsUpdateFlags.layoutMetrics)
  {
    self->_needsUpdateFlags.layoutMetrics = 0;
    -[PXTilingController targetLayout](self, "targetLayout");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[PXTilingController _referenceSize](self, "_referenceSize");
    v4 = v3;
    v6 = v5;
    -[PXTilingController _visibleRect](self, "_visibleRect");
    v8 = v7;
    v10 = v9;
    -[PXTilingController _contentInset](self, "_contentInset");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v24, "referenceSize");
    v21 = v6 != v20 || v4 != v19;
    if (v21)
      objc_msgSend(v24, "setReferenceSize:", v4, v6);
    objc_msgSend(v24, "visibleSize");
    if (v8 != v23 || v10 != v22)
    {
      objc_msgSend(v24, "setVisibleSize:", v8, v10);
      v21 = 1;
    }
    objc_msgSend(v24, "contentInset");
    if ((PXEdgeInsetsEqualToEdgeInsets() & 1) != 0)
    {
      if (!v21)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v24, "setContentInset:", v12, v14, v16, v18);
    }
    -[PXTilingController _invalidateLayoutPreparation](self, "_invalidateLayoutPreparation");
LABEL_16:

  }
}

- (void)_invalidateLayoutPreferredVisibleOrigin
{
  id v3;

  self->_needsUpdateFlags.layoutPreferredVisibleOrigin = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
  -[PXTilingController _setLayoutDesiredOrigin:](self, "_setLayoutDesiredOrigin:", *(double *)off_1E50B8580, *((double *)off_1E50B8580 + 1));
  -[PXTilingController observer](self, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tilingController:invalidatedWithContext:", self, 2);

}

- (void)_updateLayoutPreferredVisibleOriginIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  if (self->_needsUpdateFlags.layoutPreferredVisibleOrigin)
  {
    self->_needsUpdateFlags.layoutPreferredVisibleOrigin = 0;
    -[PXTilingController targetLayout](self, "targetLayout");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scrollBounds");
    v4 = v3;
    v6 = v5;
    -[PXTilingController _layoutWithInitializedVisibleOrigin](self, "_layoutWithInitializedVisibleOrigin");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v22 == v7)
    {
      -[PXTilingController _coordinateSpace](self, "_coordinateSpace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "coordinateSpace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setParentSpace:", v8);
      -[PXTilingController _visibleRect](self, "_visibleRect");
      v13 = v12;
      v15 = v14;
      -[PXTilingController _coordinateSpaceConverter](self, "_coordinateSpaceConverter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v8, "identifier"), objc_msgSend(v22, "coordinateSpaceIdentifier"), v13, v15);
      v4 = v17;
      v6 = v18;

      if (self->_scrollDelegateFlags.respondsToTargetVisibleOriginForLayoutProposedVisibleOrigin)
      {
        -[PXTilingController scrollDelegate](self, "scrollDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "tilingController:targetVisibleOriginForLayout:proposedVisibleOrigin:", self, v22, v4, v6);
        v4 = v20;
        v6 = v21;

      }
    }
    else
    {
      -[PXTilingController _setLayoutWithInitializedVisibleOrigin:](self, "_setLayoutWithInitializedVisibleOrigin:", v22);
      if (!self->_scrollDelegateFlags.respondsToInitialVisibleOriginForLayout)
      {
LABEL_10:
        -[PXTilingController _setUpdatedPreferredVisibleOrigin:](self, "_setUpdatedPreferredVisibleOrigin:", v4, v6);

        return;
      }
      -[PXTilingController scrollDelegate](self, "scrollDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tilingController:initialVisibleOriginForLayout:", self, v22);
      v4 = v9;
      v6 = v10;
    }

    goto LABEL_10;
  }
}

- (void)_invalidateLayoutPosition
{
  self->_needsUpdateFlags.layoutPosition = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutPositionIfNeeded
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXTilingChangeEvent *v17;
  void *v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;
  CGRect v25;

  if (!self->_needsUpdateFlags.layoutPosition)
    return;
  self->_needsUpdateFlags.layoutPosition = 0;
  -[PXTilingController targetLayout](self, "targetLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldFlipHorizontally");
  -[PXTilingController _layoutDesiredOrigin](self, "_layoutDesiredOrigin");
  v7 = v6;
  v9 = v8;
  if (PXPointIsNull())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingController.m"), 895, CFSTR("layout origin not updated during update"));

    if (v5)
      goto LABEL_4;
LABEL_6:
    v10 = 1.0;
    goto LABEL_7;
  }
  if (!v5)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v4, "contentBounds");
  v7 = v7 + CGRectGetWidth(v25) + v25.origin.x * 2.0;
  v10 = -1.0;
LABEL_7:
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&t1, v10, 1.0);
  CGAffineTransformMakeTranslation(&t2, v7, v9);
  CGAffineTransformConcat(&v24, &t1, &t2);
  -[PXTilingController _coordinateSpace](self, "_coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  memset(&v21, 0, sizeof(v21));
  if (v13)
    objc_msgSend(v13, "transform");
  objc_msgSend(v14, "parentSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v12)
    objc_msgSend(v14, "setParentSpace:", v12);
  v20 = v24;
  v19 = v21;
  if (!CGAffineTransformEqualToTransform(&v20, &v19))
  {
    -[PXTilingController _ensureCurrentChange](self, "_ensureCurrentChange");
    v20 = v24;
    objc_msgSend(v14, "setTransform:", &v20);
    if (v15 == v12)
    {
      -[PXTilingController _currentChange](self, "_currentChange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PXTilingChangeEvent initWithCoordinateSpaceChange]([PXTilingChangeEvent alloc], "initWithCoordinateSpaceChange");
      objc_msgSend(v16, "addEvent:", v17);

    }
    -[PXTilingController _invalidateAllCachedRects](self, "_invalidateAllCachedRects");
    -[PXTilingController _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
    -[PXTilingController _tileStates](self, "_tileStates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enumerateStatesUsingBlock:", &__block_literal_global_119269);

    -[PXTilingController _invalidateTiles](self, "_invalidateTiles");
  }

}

- (void)_invalidateLayoutVisibleRect
{
  self->_needsUpdateFlags.layoutVisibleRect = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutVisibleRectIfNeeded
{
  void *v3;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  CGSize v32;
  CGSize v33;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.layoutVisibleRect)
  {
    self->_needsUpdateFlags.layoutVisibleRect = 0;
    -[PXTilingController targetLayout](self, "targetLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTilingController _visibleRect](self, "_visibleRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PXTilingController _coordinateSpaceConverter](self, "_coordinateSpaceConverter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier"), objc_msgSend(v3, "coordinateSpaceIdentifier"), v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(v3, "visibleOrigin");
    v23 = v16 != v22 || v14 != v21;
    if (v23)
      objc_msgSend(v3, "setVisibleOrigin:", v14, v16);
    objc_msgSend(v3, "visibleSize");
    if ((PXSizeApproximatelyEqualToSize() & 1) != 0)
    {
      if (!v23)
        goto LABEL_14;
    }
    else
    {
      PLUIGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v32.width = v18;
        v32.height = v20;
        NSStringFromCGSize(v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "visibleSize");
        NSStringFromCGSize(v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v25;
        v29 = 2112;
        v30 = v26;
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "Layout visible size should have been updated in _updateLayoutMetricsIfNeeded. Failing gracefully. %@ vs %@", (uint8_t *)&v27, 0x16u);

      }
      objc_msgSend(v3, "setVisibleSize:", v18, v20);
    }
    -[PXTilingController _invalidateLayoutPreparation](self, "_invalidateLayoutPreparation");
LABEL_14:

  }
}

- (void)_invalidateLayoutPreparation
{
  self->_needsUpdateFlags.layoutPreparation = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutPreparationIfNeeded
{
  id v2;

  if (self->_needsUpdateFlags.layoutPreparation)
  {
    self->_needsUpdateFlags.layoutPreparation = 0;
    -[PXTilingController targetLayout](self, "targetLayout");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "prepareLayout");

  }
}

- (void)_invalidatePagedRect
{
  self->_needsUpdateFlags.pagedRect = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePagedRectIfNeeded
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (self->_needsUpdateFlags.pagedRect)
  {
    self->_needsUpdateFlags.pagedRect = 0;
    -[PXTilingController _activeRect](self, "_activeRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PXTilingController _maxPreheatPadding](self, "_maxPreheatPadding");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    v24.origin.x = v11;
    v24.origin.y = v12;
    v24.size.width = v13;
    v24.size.height = v14;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    v20 = CGRectUnion(v19, v24);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    CGRectGetMinX(v20);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectGetMaxX(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetMinY(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetMaxY(v23);
    PXRectWithEdges();
    PXRectRoundToPixel();
    -[PXTilingController _setPagedRect:](self, "_setPagedRect:");
  }
}

- (void)_invalidateRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTilingController _dirtyRect](self, "_dirtyRect");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectUnion(v8, v10);
  -[PXTilingController _setDirtyRect:](self, "_setDirtyRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (void)_invalidateAllCachedRects
{
  -[PXTilingController _setCachedRect:](self, "_setCachedRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[PXTilingController _pagedRect](self, "_pagedRect");
  -[PXTilingController _invalidateRect:](self, "_invalidateRect:");
}

- (void)_invalidateCachesOutsideRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTilingController _cachedRect](self, "_cachedRect");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectIntersection(v8, v10);
  -[PXTilingController _setCachedRect:](self, "_setCachedRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (void)_invalidateTiles
{
  self->_needsUpdateFlags.tiles = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
  -[PXTilingController _invalidatePreheating](self, "_invalidatePreheating");
}

- (void)_updateTilesIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPoint *v21;
  CGSize v22;
  NSObject *v23;
  CGPoint v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  PXTileTransitionSimpleAnimationCoordinator *v51;
  void *v52;
  void *v53;
  void *v54;
  PXTileTransitionSimpleAnimationCoordinator *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  PXTileTransitionSimpleAnimationCoordinator *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  _QWORD v93[4];
  NSObject *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  _QWORD v101[5];
  PXTileTransitionSimpleAnimationCoordinator *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108[7];
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  PXTileTransitionSimpleAnimationCoordinator *v112;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  PXTilingController *v123;
  id v124;
  void *v125;
  SEL v126;
  CGRect rect;
  _QWORD v128[4];
  id v129;
  id v130;
  CGPoint buf;
  CGPoint v132;
  uint64_t v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v133 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.tiles)
  {
    self->_needsUpdateFlags.tiles = 0;
    -[PXTilingController tileSource](self, "tileSource");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v92)
    {
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.x) = 138412290;
        *(_QWORD *)((char *)&buf.x + 4) = self;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "Skipping update due to missing tile source %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_46;
    }
    -[PXTilingController _tileStates](self, "_tileStates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "count");
    kdebug_trace();
    -[PXTilingController targetLayout](self, "targetLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[PXTilingController _coordinateSpaceIdentifier](self, "_coordinateSpaceIdentifier");
    -[PXTilingController _coordinateSpaceConverter](self, "_coordinateSpaceConverter");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTilingController transitionDelegate](self, "transitionDelegate");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTilingController _currentChangeIfExists](self, "_currentChangeIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "isIdentity") & 1) == 0
      && self->_transitionDelegateFlags.respondsToTileIdentifierConverterForChange
      && (objc_msgSend(v88, "tilingController:tileIdentifierConverterForChange:", self, v7),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v128[0] = MEMORY[0x1E0C809B0];
      v128[1] = 3221225472;
      v128[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke;
      v128[3] = &unk_1E5129298;
      v89 = v8;
      v129 = v89;
      v130 = v4;
      objc_msgSend(v130, "enumerateStatesUsingBlock:", v128);

    }
    else
    {
      v89 = 0;
    }
    -[PXTilingController _cachedRect](self, "_cachedRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PXTilingController _dirtyRect](self, "_dirtyRect");
    x = v134.origin.x;
    y = v134.origin.y;
    width = v134.size.width;
    height = v134.size.height;
    if (!CGRectIsEmpty(v134))
    {
      v21 = (CGPoint *)MEMORY[0x1E0C9D628];
      -[PXTilingController _setDirtyRect:](self, "_setDirtyRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      buf = (CGPoint)0;
      v132 = (CGPoint)0;
      memset(&rect, 0, sizeof(rect));
      v135.origin.x = v10;
      v135.origin.y = v12;
      v135.size.width = v14;
      v135.size.height = v16;
      v136.origin.x = x;
      v136.origin.y = y;
      v136.size.width = width;
      v136.size.height = height;
      if (CGRectContainsRect(v135, v136))
      {
        buf.x = x;
        buf.y = y;
        v132.x = width;
        v132.y = height;
        v22 = (CGSize)v21[1];
        rect.origin = *v21;
        rect.size = v22;
      }
      else if ((PXRectIntersectWithBasicRemainders() & 1) == 0)
      {
        v24 = v21[1];
        buf = *v21;
        v132 = v24;
        rect.origin.x = x;
        rect.origin.y = y;
        rect.size.width = width;
        rect.size.height = height;
      }
      -[PXTilingController _markRectAsCached:](self, "_markRectAsCached:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      if (!CGRectIsEmpty(rect))
      {
        objc_msgSend(v90, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v91, objc_msgSend(v5, "coordinateSpaceIdentifier"), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        kdebug_trace();
        v120[0] = MEMORY[0x1E0C809B0];
        v120[1] = 3221225472;
        v120[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_2;
        v120[3] = &unk_1E5129370;
        v121 = v4;
        v125 = v91;
        v126 = a2;
        v122 = v90;
        v123 = self;
        v124 = v5;
        objc_msgSend(v124, "enumerateTilesInRect:withOptions:usingBlock:", 0, v120, v26, v28, v30, v32);
        kdebug_trace();

      }
      objc_msgSend(v7, "fromLayout");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toLayout");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = v5;
      v37 = v36;

      v38 = objc_opt_respondsToSelector();
      v39 = v89;
      if ((v38 & 1) == 0)
        v39 = 0;
      v40 = v39;
      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_4;
      v113[3] = &unk_1E5129398;
      v114 = v40;
      v115 = v33;
      v41 = v4;
      v42 = v4;
      v43 = v7;
      v44 = a2;
      v45 = v5;
      v46 = v41;
      v116 = v41;
      v118 = v37;
      v119 = v91;
      v117 = v90;
      v47 = v37;
      v48 = v33;
      v49 = v40;
      v50 = v46;
      v5 = v45;
      a2 = v44;
      v7 = v43;
      v4 = v42;
      objc_msgSend(v50, "enumerateStatesUsingBlock:", v113);

    }
    if (v7 && (objc_msgSend(v7, "isIdentity") & 1) == 0)
    {
      objc_msgSend(v7, "defaultAnimationOptionsForTilingController:", self);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v51 = -[PXTileTransitionSimpleAnimationCoordinator initWithAnimationOptions:]([PXTileTransitionSimpleAnimationCoordinator alloc], "initWithAnimationOptions:", v52);
      }
      else if (self->_transitionDelegateFlags.respondsToTransitionAnimationCoordinatorForChange)
      {
        objc_msgSend(v7, "fromLayout");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53
          && !+[PXTilingCoordinateSpaceConverter canConvertBetweenCoordinateSpaceIdentifier:andCoordinateSpaceIdentifier:](PXTilingCoordinateSpaceConverter, "canConvertBetweenCoordinateSpaceIdentifier:andCoordinateSpaceIdentifier:", objc_msgSend(v53, "coordinateSpaceIdentifier"), v91))
        {
          v51 = 0;
        }
        else
        {
          objc_msgSend(v88, "tilingController:transitionAnimationCoordinatorForChange:", self, v7);
          v51 = (PXTileTransitionSimpleAnimationCoordinator *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v51 = 0;
      }

    }
    else
    {
      v51 = 0;
    }
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_5;
    v111[3] = &unk_1E51293C0;
    v55 = v51;
    v112 = v55;
    objc_msgSend(v4, "indexesOfStatesPassingTest:", v111);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_6;
    v109[3] = &unk_1E5129270;
    v57 = v4;
    v110 = v57;
    objc_msgSend(v57, "enumerateStatesAtIndexes:usingBlock:", v56, v109);
    -[PXTilingController _activeRect](self, "_activeRect");
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;
    -[PXTilingController tileAnimator](self, "tileAnimator");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)&buf, self);
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_8;
    v101[3] = &unk_1E5129438;
    v108[1] = (id)a2;
    v101[4] = self;
    v67 = v55;
    v102 = v67;
    v68 = v90;
    v103 = v68;
    v108[2] = v91;
    v69 = v5;
    v70 = v57;
    v104 = v70;
    v108[3] = v59;
    v108[4] = v61;
    v108[5] = v63;
    v108[6] = v65;
    v105 = v92;
    v71 = v69;
    v106 = v71;
    v72 = v66;
    v107 = v72;
    objc_copyWeak(v108, (id *)&buf);
    objc_msgSend(v70, "enumerateStatesUsingBlock:", v101);
    objc_destroyWeak(v108);

    objc_destroyWeak((id *)&buf);
    if (-[PXTilingController shouldAggressivelyEvictTileCaches](self, "shouldAggressivelyEvictTileCaches"))
    {
      -[PXTilingController _pagedRect](self, "_pagedRect");
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;
    }
    else
    {
      if (objc_msgSend(v70, "count") < 2001)
      {
        v85 = 0;
        v74 = *MEMORY[0x1E0C9D5E0];
        v76 = *(_QWORD *)(MEMORY[0x1E0C9D5E0] + 8);
        v78 = *(_QWORD *)(MEMORY[0x1E0C9D5E0] + 16);
        v80 = *(_QWORD *)(MEMORY[0x1E0C9D5E0] + 24);
        goto LABEL_43;
      }
      -[PXTilingController _pagedRect](self, "_pagedRect");
      PXEdgeInsetsMake();
      PXEdgeInsetsInsetRect();
      v74 = v81;
      v76 = v82;
      v78 = v83;
      v80 = v84;
      -[PXTilingController _invalidateCachesOutsideRect:](self, "_invalidateCachesOutsideRect:");
    }
    v85 = 1;
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_2_50;
    v93[3] = &unk_1E5129460;
    v23 = v70;
    v94 = v23;
    v100 = v85;
    v96 = v74;
    v97 = v76;
    v98 = v78;
    v99 = v80;
    v87 = v86;
    v95 = v87;
    -[NSObject enumerateStatesUsingBlock:](v23, "enumerateStatesUsingBlock:", v93);
    -[PXTilingController _updatePreheatingIfNeeded](self, "_updatePreheatingIfNeeded");
    if (objc_msgSend(v87, "count"))
      -[NSObject checkInIndexes:](v23, "checkInIndexes:", v87);
    -[NSObject count](v23, "count");
    kdebug_trace();

LABEL_46:
  }
}

- (void)_invalidatePreheating
{
  self->_needsUpdateFlags.preheating = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updatePreheatingIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (self->_needsUpdateFlags.preheating)
  {
    self->_needsUpdateFlags.preheating = 0;
    -[PXTilingController _activeRect](self, "_activeRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__119249;
    v18 = __Block_byref_object_dispose__119250;
    v19 = 0;
    -[PXTilingController _preheatRecords](self, "_preheatRecords");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__PXTilingController__updatePreheatingIfNeeded__block_invoke;
    v13[3] = &unk_1E5129488;
    v13[6] = v4;
    v13[7] = v6;
    v13[8] = v8;
    v13[9] = v10;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    if (objc_msgSend((id)v15[5], "count"))
    {
      -[PXTilingController _preheatRecords](self, "_preheatRecords");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsAtIndexes:", v15[5]);

      -[PXTilingController _invalidateMaxPreheatPadding](self, "_invalidateMaxPreheatPadding");
      -[PXTilingController _updateMaxPreheatPaddingIfNeeded](self, "_updateMaxPreheatPaddingIfNeeded");
    }
    _Block_object_dispose(&v14, 8);

  }
}

- (void)_invalidateMaxPreheatPadding
{
  self->_needsUpdateFlags.maxPreheatPadding = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateMaxPreheatPaddingIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.maxPreheatPadding)
  {
    self->_needsUpdateFlags.maxPreheatPadding = 0;
    v4 = *(double *)off_1E50B8020;
    v3 = *((double *)off_1E50B8020 + 1);
    v6 = *((double *)off_1E50B8020 + 2);
    v5 = *((double *)off_1E50B8020 + 3);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PXTilingController _preheatRecords](self, "_preheatRecords", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "padding");
          if (v6 < v13)
            v6 = v13;
          objc_msgSend(v12, "padding");
          if (v4 < v14)
            v4 = v14;
          objc_msgSend(v12, "padding");
          if (v3 < v15)
            v3 = v15;
          objc_msgSend(v12, "padding");
          if (v5 < v16)
            v5 = v16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    -[PXTilingController _setMaxPreheatPadding:](self, "_setMaxPreheatPadding:", v4, v3, v6, v5);
  }
}

- (void)_invalidateScrollInfo
{
  id v3;

  self->_needsUpdateFlags.scrollInfo = 1;
  -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
  -[PXTilingController observer](self, "observer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tilingController:invalidatedWithContext:", self, 2);

}

- (void)_updateScrollInfoIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  if (self->_needsUpdateFlags.scrollInfo)
  {
    self->_needsUpdateFlags.scrollInfo = 0;
    -[PXTilingController targetLayout](self, "targetLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_scrollDelegateFlags.respondsToScrollInfoForLayout
      || (-[PXTilingController scrollDelegate](self, "scrollDelegate"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "tilingController:scrollInfoForLayout:", self, v3),
          v6 = (id)objc_claimAutoreleasedReturnValue(),
          v4,
          (v5 = (uint64_t)v6) == 0))
    {
      objc_msgSend(v3, "scrollInfo");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v5;
    -[PXTilingController _setScrollInfo:](self, "_setScrollInfo:", v5);

  }
}

- (void)_updateDebugDelegateIfNeeded
{
  void *v3;
  id v4;

  -[PXTilingController debugDelegate](self, "debugDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "tilingControllerDidUpdateDebugInfo:", self);
    v3 = v4;
  }

}

- (void)tilingLayout:(id)a3 invalidatedWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXTilingChangeEvent *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __n128 (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  char v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v7 = a4;
  if (self->_hasInitializedLayout)
  {
    -[PXTilingController _ensureCurrentChange](self, "_ensureCurrentChange");
    -[PXTilingController _currentChange](self, "_currentChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXTilingChangeEvent initWithLayoutInvalidationContext:]([PXTilingChangeEvent alloc], "initWithLayoutInvalidationContext:", v7);
    objc_msgSend(v8, "addEvent:", v9);

    -[PXTilingController _invalidateLayoutPreparation](self, "_invalidateLayoutPreparation");
    if ((objc_msgSend(v7, "invalidatedContentBounds") & 1) != 0
      || objc_msgSend(v7, "invalidatedScrollBounds"))
    {
      -[PXTilingController observer](self, "observer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tilingController:invalidatedWithContext:", self, 2);

      -[PXTilingController _setNeedsUpdate](self, "_setNeedsUpdate");
    }
    if (objc_msgSend(v7, "invalidatedVisibleRect"))
    {
      -[PXTilingController _setLayoutWithInitializedVisibleOrigin:](self, "_setLayoutWithInitializedVisibleOrigin:", 0);
      -[PXTilingController _invalidateLayoutPreferredVisibleOrigin](self, "_invalidateLayoutPreferredVisibleOrigin");
    }
    if (objc_msgSend(v7, "invalidatedScrollInfo"))
      -[PXTilingController _invalidateScrollInfo](self, "_invalidateScrollInfo");
    v11 = objc_msgSend(v7, "invalidatedAllTiles");
    objc_msgSend(v7, "invalidatedTileGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = MEMORY[0x1E0C809B0];
    if (v11 && objc_msgSend(v12, "count"))
      goto LABEL_14;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke;
    v25[3] = &unk_1E51294B0;
    v25[4] = &v26;
    objc_msgSend(v7, "enumerateInvalidatedTileIdentifiersUsingBlock:", v25);
    if (*((_BYTE *)v27 + 24))
      LOBYTE(v11) = 1;
    _Block_object_dispose(&v26, 8);
    if ((v11 & 1) != 0)
    {
LABEL_14:
      v15 = 1;
    }
    else
    {
      if (!objc_msgSend(v13, "count"))
      {
LABEL_18:

        goto LABEL_19;
      }
      v15 = 0;
    }
    -[PXTilingController _tileStates](self, "_tileStates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    v19 = 3221225472;
    v20 = __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke_2;
    v21 = &unk_1E51294D8;
    v24 = v15;
    v22 = v13;
    v23 = v16;
    v17 = v16;
    objc_msgSend(v17, "enumerateStatesUsingBlock:", &v18);
    -[PXTilingController _invalidateAllCachedRects](self, "_invalidateAllCachedRects", v18, v19, v20, v21);
    -[PXTilingController _invalidateTiles](self, "_invalidateTiles");

    goto LABEL_18;
  }
LABEL_19:

}

- (PXTilingLayout)targetLayout
{
  return self->_targetLayout;
}

- (PXTilingLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)_setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (PXScrollController)scrollController
{
  return (PXScrollController *)objc_loadWeakRetained((id *)&self->_scrollController);
}

- (PXTileSource)tileSource
{
  return (PXTileSource *)objc_loadWeakRetained((id *)&self->_tileSource);
}

- (void)setTileSource:(id)a3
{
  objc_storeWeak((id *)&self->_tileSource, a3);
}

- (PXTileAnimator)tileAnimator
{
  return (PXTileAnimator *)objc_loadWeakRetained((id *)&self->_tileAnimator);
}

- (void)setTileAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_tileAnimator, a3);
}

- (PXTilingControllerScrollDelegate)scrollDelegate
{
  return (PXTilingControllerScrollDelegate *)objc_loadWeakRetained((id *)&self->_scrollDelegate);
}

- (PXTilingControllerTransitionDelegate)transitionDelegate
{
  return (PXTilingControllerTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitionDelegate);
}

- (BOOL)shouldAggressivelyEvictTileCaches
{
  return self->_shouldAggressivelyEvictTileCaches;
}

- (void)setShouldAggressivelyEvictTileCaches:(BOOL)a3
{
  self->_shouldAggressivelyEvictTileCaches = a3;
}

- (PXTilingCoordinateSpace)_coordinateSpace
{
  return self->__coordinateSpace;
}

- (void)_coordinateSpaceIdentifier
{
  return self->__coordinateSpaceIdentifier;
}

- (PXTilingCoordinateSpaceConverter)_coordinateSpaceConverter
{
  return self->__coordinateSpaceConverter;
}

- (PXTilingLayout)_layoutWithInitializedVisibleOrigin
{
  return (PXTilingLayout *)objc_loadWeakRetained((id *)&self->__layoutWithInitializedVisibleOrigin);
}

- (void)_setLayoutWithInitializedVisibleOrigin:(id)a3
{
  objc_storeWeak((id *)&self->__layoutWithInitializedVisibleOrigin, a3);
}

- (CGSize)_referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->__referenceSize.width;
  height = self->__referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)_contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__contentInset.top;
  left = self->__contentInset.left;
  bottom = self->__contentInset.bottom;
  right = self->__contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_activeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__activeRect.origin.x;
  y = self->__activeRect.origin.y;
  width = self->__activeRect.size.width;
  height = self->__activeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__visibleRect.origin.x;
  y = self->__visibleRect.origin.y;
  width = self->__visibleRect.size.width;
  height = self->__visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)_updatedPreferredVisibleOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->__updatedPreferredVisibleOrigin.x;
  y = self->__updatedPreferredVisibleOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setUpdatedPreferredVisibleOrigin:(CGPoint)a3
{
  self->__updatedPreferredVisibleOrigin = a3;
}

- (CGPoint)_layoutDesiredOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->__layoutDesiredOrigin.x;
  y = self->__layoutDesiredOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setLayoutDesiredOrigin:(CGPoint)a3
{
  self->__layoutDesiredOrigin = a3;
}

- (PXScrollInfo)_scrollInfo
{
  return self->__scrollInfo;
}

- (void)_setScrollInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CGRect)_pagedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__pagedRect.origin.x;
  y = self->__pagedRect.origin.y;
  width = self->__pagedRect.size.width;
  height = self->__pagedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_cachedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__cachedRect.origin.x;
  y = self->__cachedRect.origin.y;
  width = self->__cachedRect.size.width;
  height = self->__cachedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setCachedRect:(CGRect)a3
{
  self->__cachedRect = a3;
}

- (PXTileStatePool)_tileStates
{
  return self->__tileStates;
}

- (CGRect)_dirtyRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__dirtyRect.origin.x;
  y = self->__dirtyRect.origin.y;
  width = self->__dirtyRect.size.width;
  height = self->__dirtyRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSMutableIndexSet)_dirtyTileIndexes
{
  return self->__dirtyTileIndexes;
}

- (NSMutableArray)_preheatRecords
{
  return self->__preheatRecords;
}

- (UIEdgeInsets)_maxPreheatPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__maxPreheatPadding.top;
  left = self->__maxPreheatPadding.left;
  bottom = self->__maxPreheatPadding.bottom;
  right = self->__maxPreheatPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXTilingControllerObserver)observer
{
  return (PXTilingControllerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSArray)compositionInvalidationContexts
{
  return self->_compositionInvalidationContexts;
}

- (void)setCompositionInvalidationContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (PXTilingDebugDelegate)debugDelegate
{
  return (PXTilingDebugDelegate *)objc_loadWeakRetained((id *)&self->_debugDelegate);
}

- (void)setDebugDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_debugDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debugDelegate);
  objc_storeStrong((id *)&self->_compositionInvalidationContexts, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->__preheatRecords, 0);
  objc_storeStrong((id *)&self->__dirtyTileIndexes, 0);
  objc_storeStrong((id *)&self->__tileStates, 0);
  objc_storeStrong((id *)&self->__scrollInfo, 0);
  objc_destroyWeak((id *)&self->__layoutWithInitializedVisibleOrigin);
  objc_storeStrong((id *)&self->__coordinateSpaceConverter, 0);
  objc_storeStrong((id *)&self->__coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_tileAnimator);
  objc_destroyWeak((id *)&self->_tileSource);
  objc_destroyWeak((id *)&self->_scrollController);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_targetLayout, 0);
  objc_storeStrong((id *)&self->__currentChange, 0);
}

uint64_t __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

__n128 __58__PXTilingController_tilingLayout_invalidatedWithContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[5];
  uint64_t v15;

  if (*(_QWORD *)(a3 + 8)
    && (*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(a1 + 32), "containsIndex:", *(_QWORD *)(a3 + 272))))
  {
    *(_BYTE *)a3 = 1;
    v7 = *(void **)(a1 + 40);
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    objc_msgSend(v7, "setTargetIdentifier:forTileStateAtIndex:", v14, a2);
    *(_BYTE *)(a3 + 280) = 1;
    v8 = *((_OWORD *)off_1E50B8940 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E50B8940 + 8);
    *(_OWORD *)(a3 + 624) = v8;
    v9 = *((_OWORD *)off_1E50B8940 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E50B8940 + 10);
    *(_OWORD *)(a3 + 656) = v9;
    v10 = *((_OWORD *)off_1E50B8940 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E50B8940 + 4);
    *(_OWORD *)(a3 + 560) = v10;
    v11 = *((_OWORD *)off_1E50B8940 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E50B8940 + 6);
    *(_OWORD *)(a3 + 592) = v11;
    v12 = *((_OWORD *)off_1E50B8940 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E50B8940;
    *(_OWORD *)(a3 + 496) = v12;
    result = *((__n128 *)off_1E50B8940 + 2);
    v13 = *((_OWORD *)off_1E50B8940 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v13;
  }
  return result;
}

void __47__PXTilingController__updatePreheatingIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PXTilingEnumerationOptions *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "preheatHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v28, "padding");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    if (objc_msgSend(v28, "tileGroup"))
    {
      v14 = objc_alloc_init(PXTilingEnumerationOptions);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v28, "tileGroup"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTilingEnumerationOptions setTileGroups:](v14, "setTileGroups:", v15);

    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_indexesOfVisibleTilesInRect:withOptions:", v14, v7, v9, v11, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preheatedTileIndexes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPreheatedTileIndexes:", v20);
    v22 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v22, "removeIndexes:", v21);
    v23 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v23, "removeIndexes:", v20);
    v24 = *(void **)(a1 + 32);
    v25 = objc_msgSend(v22, "count");
    v26 = objc_msgSend(v23, "count");
    if (v25 <= v26)
      v27 = v26;
    else
      v27 = v25;
    objc_msgSend(v24, "_prepareBufferForCount:", v27);
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fillBuffersWithTileStatesAtIndexes:", v23);
      objc_msgSend(v5, "stopPreheatingTilesForIdentifiers:withGeometries:count:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), objc_msgSend(v23, "count"), objc_msgSend(v28, "context"));
    }
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fillBuffersWithTileStatesAtIndexes:", v22);
      objc_msgSend(v5, "startPreheatingTilesForIdentifiers:withGeometries:count:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), objc_msgSend(v22, "count"), objc_msgSend(v28, "context"));
    }

  }
  else
  {
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v16, "addIndex:", a3);
  }

}

double __42__PXTilingController__updateTilesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  double result;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  if (*(_BYTE *)a3)
  {
    v6 = *(_OWORD *)(a3 + 56);
    v19 = *(_OWORD *)(a3 + 40);
    v20 = v6;
    v21 = *(_OWORD *)(a3 + 72);
    v22 = *(_QWORD *)(a3 + 88);
    v7 = *(_OWORD *)(a3 + 24);
    v17 = *(_OWORD *)(a3 + 8);
    v18 = v7;
    v16 = *(_QWORD *)(a3 + 272);
    if (objc_msgSend(*(id *)(a1 + 32), "transformTileIdentifier:group:", &v17, &v16))
    {
      v9 = *(void **)(a1 + 40);
      v14[2] = v19;
      v14[3] = v20;
      v14[4] = v21;
      v15 = v22;
      v14[0] = v17;
      v14[1] = v18;
      objc_msgSend(v9, "setTargetIdentifier:forTileStateAtIndex:", v14, a2);
      v10 = v20;
      *(_OWORD *)(a3 + 216) = v19;
      *(_OWORD *)(a3 + 232) = v10;
      *(_OWORD *)(a3 + 248) = v21;
      v11 = v22;
      result = *(double *)&v17;
      v12 = v18;
      *(_OWORD *)(a3 + 184) = v17;
      *(_OWORD *)(a3 + 200) = v12;
      v13 = v16;
      *(_QWORD *)(a3 + 264) = v11;
      *(_QWORD *)(a3 + 272) = v13;
    }
  }
  return result;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_2(uint64_t a1, __int128 *a2, _OWORD *a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _OWORD v35[12];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;

  v9 = a5;
  v10 = *(void **)(a1 + 32);
  v11 = a2[3];
  v38 = a2[2];
  v39 = v11;
  v40 = a2[4];
  *(_QWORD *)&v41 = *((_QWORD *)a2 + 10);
  v12 = a2[1];
  v36 = *a2;
  v37 = v12;
  v13 = objc_msgSend(v10, "indexOfStateWithTargetIdentifier:", &v36);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = *(void **)(a1 + 32);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_3;
    v48[3] = &__block_descriptor_128_e401_v16__0__PXTileState_B_PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q___PXTileIdentifier_Q_10Q__QB_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v__PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_BB_v_v_vQ_8l;
    v15 = a2[3];
    v51 = a2[2];
    v52 = v15;
    v53 = a2[4];
    v16 = *((_QWORD *)a2 + 10);
    v17 = a2[1];
    v49 = *a2;
    v50 = v17;
    v54 = v16;
    v55 = a4;
    v13 = objc_msgSend(v14, "checkOutIndexWithInitialConfiguration:", v48);
  }
  v18 = objc_msgSend(*(id *)(a1 + 32), "stateAtIndex:", v13);
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    v20 = *(_QWORD *)(a1 + 64);
    v21 = a3[9];
    v35[8] = a3[8];
    v35[9] = v21;
    v22 = a3[11];
    v35[10] = a3[10];
    v35[11] = v22;
    v23 = a3[5];
    v35[4] = a3[4];
    v35[5] = v23;
    v24 = a3[7];
    v35[6] = a3[6];
    v35[7] = v24;
    v25 = a3[1];
    v35[0] = *a3;
    v35[1] = v25;
    v26 = a3[3];
    v35[2] = a3[2];
    v35[3] = v26;
    objc_msgSend(v19, "convertTileGeometry:toCoordinateSpaceIdentifier:", v35, v20);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
  }
  v27 = v45;
  *(_OWORD *)(v18 + 608) = v44;
  *(_OWORD *)(v18 + 624) = v27;
  v28 = v47;
  *(_OWORD *)(v18 + 640) = v46;
  *(_OWORD *)(v18 + 656) = v28;
  v29 = v41;
  *(_OWORD *)(v18 + 544) = v40;
  *(_OWORD *)(v18 + 560) = v29;
  v30 = v43;
  *(_OWORD *)(v18 + 576) = v42;
  *(_OWORD *)(v18 + 592) = v30;
  v31 = v37;
  *(_OWORD *)(v18 + 480) = v36;
  *(_OWORD *)(v18 + 496) = v31;
  v32 = v39;
  *(_OWORD *)(v18 + 512) = v38;
  *(_OWORD *)(v18 + 528) = v32;
  *(_BYTE *)(v18 + 673) = 1;
  v33 = v9;
  v34 = *(id *)(v18 + 688);
  if (v34 != v33)
  {

    *(_QWORD *)(v18 + 688) = v33;
  }

}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v4;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  int v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;

  if (!*(_BYTE *)(a3 + 280))
    return;
  v4 = (__int128 *)(a3 + 96);
  if (!*(_QWORD *)(a3 + 96))
    return;
  v6 = 0;
  v80 = 0;
  v7 = *(_QWORD *)off_1E50B8948;
  if (*(_QWORD *)(a3 + 472) == *(_QWORD *)off_1E50B8948)
  {
    v10 = *(_OWORD *)(a3 + 8);
    v11 = *(_OWORD *)(a3 + 56);
    v76 = *(_OWORD *)(a3 + 40);
    v77 = v11;
    v78 = *(_OWORD *)(a3 + 72);
    v79 = *(_QWORD *)(a3 + 88);
    v12 = *(_OWORD *)(a3 + 24);
    v74 = v10;
    v75 = v12;
    if ((_QWORD)v10)
      goto LABEL_7;
    v26 = *(_OWORD *)(a3 + 144);
    v76 = *(_OWORD *)(a3 + 128);
    v77 = v26;
    v78 = *(_OWORD *)(a3 + 160);
    v79 = *(_QWORD *)(a3 + 176);
    v27 = *(_OWORD *)(a3 + 112);
    v74 = *v4;
    v75 = v27;
    if (!objc_msgSend(*(id *)(a1 + 32), "reverseTransformTileIdentifier:", &v74))
    {
      v6 = 0;
      v79 = 0;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v74 = 0u;
      goto LABEL_4;
    }
    if ((_QWORD)v74)
    {
LABEL_7:
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v13 = *(void **)(a1 + 40);
      v61 = 0;
      v51 = v76;
      v52 = v77;
      v53 = v78;
      *(_QWORD *)&v54 = v79;
      v49 = v74;
      v50 = v75;
      v14 = objc_msgSend(v13, "getGeometry:group:userData:forTileWithIdentifier:", &v62, &v80, &v61, &v49);
      v6 = v61;
      if (v14)
      {
        v15 = objc_msgSend(*(id *)(a1 + 48), "stateAtIndex:", a2);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v16 = *(void **)(a1 + 56);
        if (v16)
        {
          v17 = *(_QWORD *)(a1 + 72);
          v45 = v70;
          v46 = v71;
          v47 = v72;
          v48 = v73;
          v41 = v66;
          v42 = v67;
          v43 = v68;
          v44 = v69;
          v37 = v62;
          v38 = v63;
          v39 = v64;
          v40 = v65;
          objc_msgSend(v16, "convertTileGeometry:toCoordinateSpaceIdentifier:", &v37, v17);
        }
        objc_msgSend(*(id *)(a1 + 48), "setCurrentGeometry:forTileStateAtIndex:", &v49, a2);
        *(_BYTE *)(v15 + 672) = 1;
        v18 = v6;
        v19 = *(id *)(v15 + 680);
        if (v19 != v18)
        {

          *(_QWORD *)(v15 + 680) = v18;
        }

      }
      goto LABEL_4;
    }
    v6 = 0;
  }
LABEL_4:
  if (*(_QWORD *)(a3 + 664) == v7)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v20 = *(void **)(a1 + 64);
    v36 = 0;
    v21 = v4[3];
    v51 = v4[2];
    v52 = v21;
    v53 = v4[4];
    *(_QWORD *)&v54 = *((_QWORD *)v4 + 10);
    v22 = v4[1];
    v49 = *v4;
    v50 = v22;
    v23 = objc_msgSend(v20, "getGeometry:group:userData:forTileWithIdentifier:", &v62, &v80, &v36, &v49);
    v8 = v36;

    if (v23)
    {
      v24 = *(void **)(a1 + 56);
      if (v24)
      {
        v25 = *(_QWORD *)(a1 + 72);
        v45 = v70;
        v46 = v71;
        v47 = v72;
        v48 = v73;
        v41 = v66;
        v42 = v67;
        v43 = v68;
        v44 = v69;
        v37 = v62;
        v38 = v63;
        v39 = v64;
        v40 = v65;
        objc_msgSend(v24, "convertTileGeometry:toCoordinateSpaceIdentifier:", &v37, v25);
      }
      else
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
      }
      v28 = v58;
      *(_OWORD *)(a3 + 608) = v57;
      *(_OWORD *)(a3 + 624) = v28;
      v29 = v60;
      *(_OWORD *)(a3 + 640) = v59;
      *(_OWORD *)(a3 + 656) = v29;
      v30 = v54;
      *(_OWORD *)(a3 + 544) = v53;
      *(_OWORD *)(a3 + 560) = v30;
      v31 = v56;
      *(_OWORD *)(a3 + 576) = v55;
      *(_OWORD *)(a3 + 592) = v31;
      v32 = v50;
      *(_OWORD *)(a3 + 480) = v49;
      *(_OWORD *)(a3 + 496) = v32;
      v33 = v52;
      *(_OWORD *)(a3 + 512) = v51;
      *(_OWORD *)(a3 + 528) = v33;
      *(_BYTE *)(a3 + 673) = 1;
      v34 = v8;
      v35 = *(id *)(a3 + 688);
      if (v35 != v34)
      {

        *(_QWORD *)(a3 + 688) = v34;
      }

    }
  }
  else
  {
    v8 = v6;
  }

}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  _OWORD v22[12];
  _OWORD v23[12];
  _OWORD v24[5];
  uint64_t v25;

  if (!*(_BYTE *)(a2 + 280)
    || !*(_QWORD *)(a2 + 96)
    || *(_QWORD *)(a2 + 472) == *(_QWORD *)off_1E50B8948
    || *(_QWORD *)(a2 + 664) == *(_QWORD *)off_1E50B8948)
  {
    return 0;
  }
  v2 = *(void **)(a2 + 680);
  v3 = *(_QWORD *)(a2 + 688);
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a2 + 144);
  v24[2] = *(_OWORD *)(a2 + 128);
  v24[3] = v5;
  v24[4] = *(_OWORD *)(a2 + 160);
  v25 = *(_QWORD *)(a2 + 176);
  v6 = *(_OWORD *)(a2 + 112);
  v24[0] = *(_OWORD *)(a2 + 96);
  v24[1] = v6;
  v7 = *(_OWORD *)(a2 + 432);
  v23[8] = *(_OWORD *)(a2 + 416);
  v23[9] = v7;
  v8 = *(_OWORD *)(a2 + 464);
  v23[10] = *(_OWORD *)(a2 + 448);
  v23[11] = v8;
  v9 = *(_OWORD *)(a2 + 368);
  v23[4] = *(_OWORD *)(a2 + 352);
  v23[5] = v9;
  v10 = *(_OWORD *)(a2 + 400);
  v23[6] = *(_OWORD *)(a2 + 384);
  v23[7] = v10;
  v11 = *(_OWORD *)(a2 + 304);
  v23[0] = *(_OWORD *)(a2 + 288);
  v23[1] = v11;
  v12 = *(_OWORD *)(a2 + 336);
  v23[2] = *(_OWORD *)(a2 + 320);
  v23[3] = v12;
  v13 = *(_OWORD *)(a2 + 624);
  v22[8] = *(_OWORD *)(a2 + 608);
  v22[9] = v13;
  v14 = *(_OWORD *)(a2 + 656);
  v22[10] = *(_OWORD *)(a2 + 640);
  v22[11] = v14;
  v15 = *(_OWORD *)(a2 + 560);
  v22[4] = *(_OWORD *)(a2 + 544);
  v22[5] = v15;
  v16 = *(_OWORD *)(a2 + 592);
  v22[6] = *(_OWORD *)(a2 + 576);
  v22[7] = v16;
  v17 = *(_OWORD *)(a2 + 496);
  v22[0] = *(_OWORD *)(a2 + 480);
  v22[1] = v17;
  v18 = *(_OWORD *)(a2 + 528);
  v22[2] = *(_OWORD *)(a2 + 512);
  v22[3] = v18;
  v19 = v2;
  v20 = objc_msgSend(v4, "useDoubleSidedAnimationForUpdatedTileWithIdentifier:fromGeometry:fromUserData:toGeometry:toUserData:", v24, v23, v19, v22, v3);

  return v20;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v5 = *(_OWORD *)(a3 + 144);
  v30 = *(_OWORD *)(a3 + 128);
  v31 = v5;
  v32 = *(_OWORD *)(a3 + 160);
  v33 = *(_QWORD *)(a3 + 176);
  v6 = *(_OWORD *)(a3 + 112);
  v28 = *(_OWORD *)(a3 + 96);
  v29 = v6;
  v7 = *(_QWORD *)(a3 + 272);
  v8 = *(_OWORD *)(a3 + 608);
  v9 = *(_OWORD *)(a3 + 624);
  v10 = *(_OWORD *)(a3 + 656);
  v45 = *(_OWORD *)(a3 + 640);
  v46 = v10;
  v43 = v8;
  v44 = v9;
  v11 = *(_OWORD *)(a3 + 480);
  v12 = *(_OWORD *)(a3 + 496);
  v13 = *(_OWORD *)(a3 + 512);
  v38 = *(_OWORD *)(a3 + 528);
  v37 = v13;
  v36 = v12;
  v35 = v11;
  v14 = *(_OWORD *)(a3 + 544);
  v15 = *(_OWORD *)(a3 + 560);
  v16 = *(_OWORD *)(a3 + 576);
  v42 = *(_OWORD *)(a3 + 592);
  v41 = v16;
  v40 = v15;
  v39 = v14;
  v17 = *(id *)(a3 + 688);
  v18 = *((_OWORD *)off_1E50B8940 + 9);
  *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E50B8940 + 8);
  *(_OWORD *)(a3 + 624) = v18;
  v19 = *((_OWORD *)off_1E50B8940 + 11);
  *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E50B8940 + 10);
  *(_OWORD *)(a3 + 656) = v19;
  v20 = *((_OWORD *)off_1E50B8940 + 5);
  *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E50B8940 + 4);
  *(_OWORD *)(a3 + 560) = v20;
  v21 = *((_OWORD *)off_1E50B8940 + 7);
  *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E50B8940 + 6);
  *(_OWORD *)(a3 + 592) = v21;
  v22 = *((_OWORD *)off_1E50B8940 + 1);
  *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E50B8940;
  *(_OWORD *)(a3 + 496) = v22;
  v23 = *((_OWORD *)off_1E50B8940 + 3);
  *(_OWORD *)(a3 + 512) = *((_OWORD *)off_1E50B8940 + 2);
  *(_OWORD *)(a3 + 528) = v23;
  *(_BYTE *)(a3 + 673) = 0;
  v24 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_7;
  v26[3] = &unk_1E51293E8;
  v34 = v7;
  v27 = v17;
  v25 = v17;
  objc_msgSend(v24, "checkOutIndexWithInitialConfiguration:", v26);

}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGSize v12;
  __int128 v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGSize v19;
  __int128 v20;
  int v21;
  id v22;
  id v23;
  BOOL v24;
  int v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  char v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGSize v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGSize v66;
  __int128 v67;
  __int128 v68;
  CGSize v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGSize size;
  __int128 v80;
  __int128 v81;
  char v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  CGSize v92;
  __int128 v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  CGSize v99;
  __int128 v100;
  void *v101;
  uint64_t v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  int v115;
  uint64_t v116;
  BOOL v117;
  _QWORD v119[4];
  id v120[2];
  CGAffineTransform v121;
  __int128 v122;
  __int128 v123;
  CGFloat v124;
  CGAffineTransform v125;
  _QWORD v126[4];
  id v127;
  CGAffineTransform *p_t2;
  CGAffineTransform *v129;
  CGAffineTransform v130;
  __int128 v131;
  __int128 v132;
  CGFloat v133;
  CGRect v134;
  __int128 v135;
  __int128 v136;
  CGAffineTransform v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  CGAffineTransform t2;
  __int128 v145;
  CGAffineTransform v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  CGRect rect2;
  __int128 v154;
  __int128 v155;
  CGAffineTransform v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  CGRect rect1;
  __int128 v163;
  __int128 v164;
  CGAffineTransform v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  CGAffineTransform v171;
  __int128 v172;
  __int128 v173;
  CGFloat v174;
  CGRect t1;
  _OWORD t1_32[2];
  CGAffineTransform v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint64_t v183;
  CGRect v184;
  CGRect v185;

  v3 = a3;
  v183 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)&v171.tx = *(_OWORD *)(a3 + 128);
  v172 = v5;
  v173 = *(_OWORD *)(a3 + 160);
  v174 = *(double *)(a3 + 176);
  v6 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v171.a = *(_OWORD *)(a3 + 96);
  *(_OWORD *)&v171.c = v6;
  v7 = *(_QWORD *)(a3 + 696);
  v8 = *(_OWORD *)(a3 + 432);
  v167 = *(_OWORD *)(a3 + 416);
  v168 = v8;
  v9 = *(_OWORD *)(a3 + 464);
  v169 = *(_OWORD *)(a3 + 448);
  v170 = v9;
  v10 = *(_OWORD *)(a3 + 368);
  *(_OWORD *)&v165.a = *(_OWORD *)(a3 + 352);
  *(_OWORD *)&v165.c = v10;
  v11 = *(_OWORD *)(a3 + 400);
  *(_OWORD *)&v165.tx = *(_OWORD *)(a3 + 384);
  v166 = v11;
  v12 = *(CGSize *)(a3 + 304);
  rect1.origin = *(CGPoint *)(a3 + 288);
  rect1.size = v12;
  v13 = *(_OWORD *)(a3 + 336);
  v163 = *(_OWORD *)(a3 + 320);
  v164 = v13;
  v14 = *(id *)(a3 + 680);
  v15 = *(_OWORD *)(v3 + 624);
  v158 = *(_OWORD *)(v3 + 608);
  v159 = v15;
  v16 = *(_OWORD *)(v3 + 656);
  v160 = *(_OWORD *)(v3 + 640);
  v161 = v16;
  v17 = *(_OWORD *)(v3 + 560);
  *(_OWORD *)&v156.a = *(_OWORD *)(v3 + 544);
  *(_OWORD *)&v156.c = v17;
  v18 = *(_OWORD *)(v3 + 592);
  *(_OWORD *)&v156.tx = *(_OWORD *)(v3 + 576);
  v157 = v18;
  v19 = *(CGSize *)(v3 + 496);
  rect2.origin = *(CGPoint *)(v3 + 480);
  rect2.size = v19;
  v20 = *(_OWORD *)(v3 + 528);
  v154 = *(_OWORD *)(v3 + 512);
  v155 = v20;
  v21 = *(unsigned __int8 *)(v3 + 673);
  v22 = *(id *)(v3 + 688);
  v23 = v22;
  if (*(_BYTE *)(v3 + 280))
  {
    if (*((_QWORD *)&v170 + 1) == *(_QWORD *)off_1E50B8948)
    {
      v28 = *(void **)(a1 + 40);
      v152 = 0;
      t2 = v171;
      v145 = v172;
      *(_OWORD *)&v146.a = v173;
      v146.c = v174;
      v179 = v158;
      v180 = v159;
      v181 = v160;
      v182 = v161;
      v177 = v156;
      v178 = v157;
      t1 = rect2;
      t1_32[0] = v154;
      t1_32[1] = v155;
      v26 = objc_msgSend(v28, "getInitialGeometry:initialUserData:forAppearingTileWithIdentifier:toGeometry:toUserData:", &rect1, &v152, &t2, &t1, v23);
      v29 = v152;

      if ((v26 & 1) != 0)
      {
        v14 = v29;
      }
      else
      {
        v167 = v158;
        v168 = v159;
        v169 = v160;
        v170 = v161;
        v165 = v156;
        v166 = v157;
        rect1 = rect2;
        v163 = v154;
        v164 = v155;
        v14 = v23;

      }
      v40 = *(void **)(a1 + 48);
      if (v40)
      {
        v41 = *(_QWORD *)(a1 + 104);
        v148 = v167;
        v149 = v168;
        v150 = v169;
        v151 = v170;
        v146 = v165;
        v147 = v166;
        *(CGPoint *)&t2.a = rect1.origin;
        *(CGSize *)&t2.c = rect1.size;
        *(_OWORD *)&t2.tx = v163;
        v145 = v164;
        objc_msgSend(v40, "convertTileGeometry:toCoordinateSpaceIdentifier:", &t2, v41);
      }
      else
      {
        v182 = 0u;
        v181 = 0u;
        v180 = 0u;
        v179 = 0u;
        v178 = 0u;
        memset(&v177, 0, sizeof(v177));
        memset(t1_32, 0, sizeof(t1_32));
        memset(&t1, 0, sizeof(t1));
      }
      v25 = 0;
      v167 = v179;
      v168 = v180;
      v169 = v181;
      v170 = v182;
      v165 = v177;
      v166 = v178;
      rect1 = t1;
      v24 = v21 != 0;
      v27 = 1;
      v163 = t1_32[0];
      v164 = t1_32[1];
    }
    else
    {
      v24 = v21 != 0;
      if (*((_QWORD *)&v161 + 1) == *(_QWORD *)off_1E50B8948)
      {
        if (*(_QWORD *)(v3 + 96))
        {
          v30 = *(void **)(a1 + 56);
          memset(&v177, 0, 24);
          memset(t1_32, 0, sizeof(t1_32));
          memset(&t1, 0, sizeof(t1));
          objc_msgSend(v30, "setTargetIdentifier:forTileStateAtIndex:", &t1, a2);
        }
        v31 = *(_OWORD *)(v3 + 232);
        *(_OWORD *)&v171.tx = *(_OWORD *)(v3 + 216);
        v172 = v31;
        v173 = *(_OWORD *)(v3 + 248);
        v174 = *(double *)(v3 + 264);
        v32 = *(_OWORD *)(v3 + 200);
        *(_OWORD *)&v171.a = *(_OWORD *)(v3 + 184);
        *(_OWORD *)&v171.c = v32;
        v33 = *(void **)(a1 + 40);
        v143 = 0;
        v34 = *(_OWORD *)(v3 + 232);
        *(_OWORD *)&t2.tx = *(_OWORD *)(v3 + 216);
        v145 = v34;
        *(_OWORD *)&v146.a = *(_OWORD *)(v3 + 248);
        v146.c = *(CGFloat *)(v3 + 264);
        v35 = *(_OWORD *)(v3 + 200);
        *(_OWORD *)&t2.a = *(_OWORD *)(v3 + 184);
        *(_OWORD *)&t2.c = v35;
        v179 = v167;
        v180 = v168;
        v181 = v169;
        v182 = v170;
        v177 = v165;
        v178 = v166;
        t1 = rect1;
        t1_32[0] = v163;
        t1_32[1] = v164;
        v36 = objc_msgSend(v33, "getFinalGeometry:finalUserData:forDisappearingTileWithIdentifier:fromGeometry:fromUserData:", &rect2, &v143, &t2, &t1, v14);
        v37 = v143;

        if ((v36 & 1) != 0)
        {
          v38 = *(void **)(a1 + 48);
          if (v38)
          {
            v39 = *(_QWORD *)(a1 + 104);
            v148 = v158;
            v149 = v159;
            v150 = v160;
            v151 = v161;
            v146 = v156;
            v147 = v157;
            *(CGPoint *)&t2.a = rect2.origin;
            *(CGSize *)&t2.c = rect2.size;
            *(_OWORD *)&t2.tx = v154;
            v145 = v155;
            objc_msgSend(v38, "convertTileGeometry:toCoordinateSpaceIdentifier:", &t2, v39);
          }
          else
          {
            v182 = 0u;
            v181 = 0u;
            v180 = 0u;
            v179 = 0u;
            v178 = 0u;
            memset(&v177, 0, sizeof(v177));
            memset(t1_32, 0, sizeof(t1_32));
            memset(&t1, 0, sizeof(t1));
          }
          v25 = 0;
          v26 = 0;
          v24 = 0;
          v158 = v179;
          v159 = v180;
          v160 = v181;
          v161 = v182;
          v156 = v177;
          v157 = v178;
          rect2 = t1;
          v27 = 3;
          v23 = v37;
          v154 = t1_32[0];
          v155 = t1_32[1];
        }
        else
        {
          v42 = *((_OWORD *)off_1E50B8940 + 9);
          v158 = *((_OWORD *)off_1E50B8940 + 8);
          v159 = v42;
          v43 = *((_OWORD *)off_1E50B8940 + 11);
          v160 = *((_OWORD *)off_1E50B8940 + 10);
          v161 = v43;
          v44 = *((_OWORD *)off_1E50B8940 + 5);
          *(_OWORD *)&v156.a = *((_OWORD *)off_1E50B8940 + 4);
          *(_OWORD *)&v156.c = v44;
          v45 = *((_OWORD *)off_1E50B8940 + 7);
          *(_OWORD *)&v156.tx = *((_OWORD *)off_1E50B8940 + 6);
          v157 = v45;
          v46 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
          rect2.origin = *(CGPoint *)off_1E50B8940;
          rect2.size = v46;
          v47 = *((_OWORD *)off_1E50B8940 + 3);
          v154 = *((_OWORD *)off_1E50B8940 + 2);
          v155 = v47;

          v23 = 0;
          v25 = 0;
          v26 = 0;
          v24 = 0;
          v27 = 3;
        }
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v27 = 2;
      }
    }
  }
  else
  {
    v24 = v21 != 0;
    if (v14 == v22)
    {
      v27 = 0;
      v26 = 0;
      v25 = 1;
      v23 = v14;
    }
    else
    {
      v25 = objc_msgSend(v14, "isEqual:", v22);
      v26 = 0;
      v27 = 2;
      if (v25)
        v27 = 0;
    }
  }
  v48 = *((_QWORD *)&v161 + 1);
  v49 = *(_QWORD *)off_1E50B8948;
  if (*((_QWORD *)&v161 + 1) == *(_QWORD *)off_1E50B8948)
    goto LABEL_43;
  v115 = v25;
  v117 = v24;
  v116 = v27;
  if (v7)
  {
LABEL_27:
    v50 = v163;
    v51 = v164;
    v121 = v165;
    v52 = v166;
    v53 = v167;
    v114 = *((double *)&v167 + 1);
    v112 = *(double *)&v168;
    v109 = *(double *)&v169;
    v110 = *((double *)&v168 + 1);
    v107 = *(double *)&v170;
    v108 = *((double *)&v169 + 1);
    v54 = *((_QWORD *)&v170 + 1);
    v55 = v154;
    v56 = v155;
    v125 = v156;
    v57 = v157;
    v58 = v158;
    v113 = *((double *)&v158 + 1);
    v111 = *(double *)&v159;
    v105 = *(double *)&v160;
    v106 = *((double *)&v159 + 1);
    v103 = *(double *)&v161;
    v104 = *((double *)&v160 + 1);
    if (!CGRectEqualToRect(rect1, rect2))
      goto LABEL_40;
    if (*(double *)&v50 != *(double *)&v55)
      goto LABEL_40;
    if (*((double *)&v50 + 1) != *((double *)&v55 + 1))
      goto LABEL_40;
    if (*(double *)&v51 != *(double *)&v56)
      goto LABEL_40;
    if (*((double *)&v51 + 1) != *((double *)&v56 + 1))
      goto LABEL_40;
    t1 = *(CGRect *)&v121.a;
    t1_32[0] = *(_OWORD *)&v121.tx;
    t2 = v125;
    if (!CGAffineTransformEqualToTransform((CGAffineTransform *)&t1, &t2))
      goto LABEL_40;
    if (*((double *)&v52 + 1) != *((double *)&v57 + 1))
      goto LABEL_40;
    if (v53 != v58)
      goto LABEL_40;
    if (*(double *)&v52 != *(double *)&v57)
      goto LABEL_40;
    if (v114 != v113)
      goto LABEL_40;
    if (v112 != v111)
      goto LABEL_40;
    v184.origin.y = v109;
    v184.origin.x = v110;
    v184.size.height = v107;
    v184.size.width = v108;
    v185.origin.y = v105;
    v185.origin.x = v106;
    v185.size.height = v103;
    v185.size.width = v104;
    if (!CGRectEqualToRect(v184, v185) || v54 != v48 || v14 != v23 && (objc_msgSend(v14, "isEqual:", v23) & 1) == 0)
    {
LABEL_40:
      if (v115)
      {
        PLUIGetLog();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          t1_32[0] = *(_OWORD *)&v171.tx;
          t1_32[1] = v172;
          *(_OWORD *)&v177.a = v173;
          v177.c = v174;
          t1.origin = *(CGPoint *)&v171.a;
          t1.size = *(CGSize *)&v171.c;
          PXTileIdentifierDescription((unint64_t *)&t1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = *(_OWORD *)(v3 + 432);
          v179 = *(_OWORD *)(v3 + 416);
          v180 = v88;
          v89 = *(_OWORD *)(v3 + 464);
          v181 = *(_OWORD *)(v3 + 448);
          v182 = v89;
          v90 = *(_OWORD *)(v3 + 368);
          *(_OWORD *)&v177.a = *(_OWORD *)(v3 + 352);
          *(_OWORD *)&v177.c = v90;
          v91 = *(_OWORD *)(v3 + 400);
          *(_OWORD *)&v177.tx = *(_OWORD *)(v3 + 384);
          v178 = v91;
          v92 = *(CGSize *)(v3 + 304);
          t1.origin = *(CGPoint *)(v3 + 288);
          t1.size = v92;
          v93 = *(_OWORD *)(v3 + 336);
          t1_32[0] = *(_OWORD *)(v3 + 320);
          t1_32[1] = v93;
          PXTileGeometryDescription();
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = *(_OWORD *)(v3 + 624);
          v179 = *(_OWORD *)(v3 + 608);
          v180 = v95;
          v96 = *(_OWORD *)(v3 + 656);
          v181 = *(_OWORD *)(v3 + 640);
          v182 = v96;
          v97 = *(_OWORD *)(v3 + 560);
          *(_OWORD *)&v177.a = *(_OWORD *)(v3 + 544);
          *(_OWORD *)&v177.c = v97;
          v98 = *(_OWORD *)(v3 + 592);
          *(_OWORD *)&v177.tx = *(_OWORD *)(v3 + 576);
          v178 = v98;
          v99 = *(CGSize *)(v3 + 496);
          t1.origin = *(CGPoint *)(v3 + 480);
          t1.size = v99;
          v100 = *(_OWORD *)(v3 + 528);
          t1_32[0] = *(_OWORD *)(v3 + 512);
          t1_32[1] = v100;
          PXTileGeometryDescription();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = *(_QWORD *)(a1 + 72);
          LODWORD(t1.origin.x) = 138413570;
          *(_QWORD *)((char *)&t1.origin.x + 4) = v87;
          WORD2(t1.origin.y) = 2112;
          *(_QWORD *)((char *)&t1.origin.y + 6) = v94;
          HIWORD(t1.size.width) = 2112;
          *(_QWORD *)&t1.size.height = v14;
          LOWORD(t1_32[0]) = 2112;
          *(_QWORD *)((char *)t1_32 + 2) = v101;
          WORD5(t1_32[0]) = 2112;
          *(_QWORD *)((char *)t1_32 + 12) = v23;
          WORD2(t1_32[1]) = 2112;
          *(_QWORD *)((char *)&t1_32[1] + 6) = v102;
          _os_log_impl(&dword_1A6789000, v86, OS_LOG_TYPE_DEFAULT, "Tile changed unexpectedly. Falling back to PXTileAnimationTypeUpdate. identifier=%@ fromGeometry=%@ fromUserData=%@ toGeometry=%@ toUserData=%@ layout=%@", (uint8_t *)&t1, 0x3Eu);

        }
        v116 = 2;
      }
      v59 = *(void **)(a1 + 40);
      v121 = v171;
      v122 = v172;
      v123 = v173;
      v124 = v174;
      v179 = v167;
      v180 = v168;
      v181 = v169;
      v182 = v170;
      v177 = v165;
      v178 = v166;
      t1 = rect1;
      t1_32[0] = v163;
      t1_32[1] = v164;
      v148 = v158;
      v149 = v159;
      v150 = v160;
      v151 = v161;
      v146 = v156;
      v147 = v157;
      *(CGPoint *)&t2.a = rect2.origin;
      *(CGSize *)&t2.c = rect2.size;
      *(_OWORD *)&t2.tx = v154;
      v145 = v155;
      objc_msgSend(v59, "optionsForAnimatingTileWithIdentifier:animationType:fromGeometry:fromUserData:toGeometry:toUserData:", &v121, v116, &t1, v14, &t2, v23, *(_QWORD *)&v103, *(_QWORD *)&v104, *(_QWORD *)&v105, *(_QWORD *)&v106, *(_QWORD *)&v107, *(_QWORD *)&v108, *(_QWORD *)&v109, *(_QWORD *)&v110);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      ++*(_QWORD *)(v3 + 704);
      v61 = *(void **)(a1 + 80);
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_48;
      v119[3] = &unk_1E51447A0;
      objc_copyWeak(v120, (id *)(a1 + 88));
      v120[1] = a2;
      v179 = v158;
      v180 = v159;
      v181 = v160;
      v182 = v161;
      v177 = v156;
      v178 = v157;
      t1 = rect2;
      t1_32[0] = v154;
      t1_32[1] = v155;
      objc_msgSend(v61, "animateTile:toGeometry:userData:withOptions:completionHandler:", v7, &t1, v23, v60, v119);
      objc_destroyWeak(v120);

    }
    goto LABEL_42;
  }
  if (*((_QWORD *)&v170 + 1) != v49)
  {
    if (CGRectIntersectsRect(rect1, *(CGRect *)(a1 + 112)))
      goto LABEL_55;
    v48 = *((_QWORD *)&v161 + 1);
  }
  if (v48 == v49)
  {
    v7 = 0;
    goto LABEL_43;
  }
  if (!CGRectIntersectsRect(rect2, *(CGRect *)(a1 + 112)))
  {
    v7 = 0;
LABEL_42:
    v24 = v117;
    goto LABEL_43;
  }
LABEL_55:
  if (v26)
  {
    t2.a = 0.0;
    *(_QWORD *)&t2.b = &t2;
    *(_QWORD *)&t2.c = 0x2020000000;
    t2.d = NAN;
    v121.a = 0.0;
    *(_QWORD *)&v121.b = &v121;
    *(_OWORD *)&v121.c = 0x2020000000uLL;
    v70 = *(void **)(a1 + 56);
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __42__PXTilingController__updateTilesIfNeeded__block_invoke_9;
    v126[3] = &unk_1E5129410;
    v130 = v171;
    v133 = v174;
    v132 = v173;
    v131 = v172;
    v135 = v163;
    v136 = v164;
    v134 = rect1;
    v137 = v165;
    v138 = v166;
    v141 = v169;
    v142 = v170;
    v139 = v167;
    v140 = v168;
    v127 = v14;
    p_t2 = &t2;
    v129 = &v121;
    objc_msgSend(v70, "enumerateStatesUsingBlock:", v126);
    if (*(_QWORD *)(*(_QWORD *)&v121.b + 24))
    {
      v71 = *(void **)(a1 + 56);
      memset(&v177, 0, 24);
      memset(t1_32, 0, sizeof(t1_32));
      memset(&t1, 0, sizeof(t1));
      objc_msgSend(v71, "setTargetIdentifier:forTileStateAtIndex:", &t1, a2);
      v3 = *(_QWORD *)(*(_QWORD *)&v121.b + 24);
      v72 = *(void **)(*(_QWORD *)&t2.b + 24);
      v7 = *(_QWORD *)(v3 + 696);
      v73 = *(void **)(a1 + 56);
      t1_32[0] = *(_OWORD *)&v171.tx;
      t1_32[1] = v172;
      *(_OWORD *)&v177.a = v173;
      v177.c = v174;
      t1.origin = *(CGPoint *)&v171.a;
      t1.size = *(CGSize *)&v171.c;
      a2 = v72;
      objc_msgSend(v73, "setTargetIdentifier:forTileStateAtIndex:", &t1);
      v74 = *(_OWORD *)&v171.c;
      *(_OWORD *)(v3 + 184) = *(_OWORD *)&v171.a;
      v75 = v172;
      *(_OWORD *)(v3 + 216) = *(_OWORD *)&v171.tx;
      *(_OWORD *)(v3 + 232) = v75;
      *(_OWORD *)(v3 + 248) = v173;
      *(CGFloat *)(v3 + 264) = v174;
      *(_OWORD *)(v3 + 200) = v74;
      v76 = v157;
      *(_OWORD *)(v3 + 576) = *(_OWORD *)&v156.tx;
      *(_OWORD *)(v3 + 592) = v76;
      v77 = *(_OWORD *)&v156.c;
      *(_OWORD *)(v3 + 544) = *(_OWORD *)&v156.a;
      *(_OWORD *)(v3 + 560) = v77;
      v78 = v155;
      *(_OWORD *)(v3 + 512) = v154;
      *(_OWORD *)(v3 + 528) = v78;
      size = rect2.size;
      *(CGPoint *)(v3 + 480) = rect2.origin;
      *(CGSize *)(v3 + 496) = size;
      v80 = v159;
      *(_OWORD *)(v3 + 608) = v158;
      *(_OWORD *)(v3 + 624) = v80;
      v81 = v161;
      *(_OWORD *)(v3 + 640) = v160;
      *(_OWORD *)(v3 + 656) = v81;
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v121, 8);
    _Block_object_dispose(&t2, 8);
  }
  else
  {
    v7 = 0;
  }
  v82 = !v24;
  if (v7)
    v82 = 1;
  if ((v82 & 1) == 0)
  {
    v83 = *(void **)(a1 + 64);
    v84 = *(_QWORD *)(a1 + 72);
    t1_32[0] = *(_OWORD *)&v171.tx;
    t1_32[1] = v172;
    *(_OWORD *)&v177.a = v173;
    v177.c = v174;
    t1.origin = *(CGPoint *)&v171.a;
    t1.size = *(CGSize *)&v171.c;
    v7 = objc_msgSend(v83, "checkOutTileForIdentifier:layout:", &t1, v84);
    v85 = *(void **)(a1 + 80);
    v179 = v167;
    v180 = v168;
    v181 = v169;
    v182 = v170;
    v177 = v165;
    v178 = v166;
    t1 = rect1;
    t1_32[0] = v163;
    t1_32[1] = v164;
    objc_msgSend(v85, "prepareTile:withGeometry:userData:", v7, &t1, v14);
    *(_QWORD *)(v3 + 696) = v7;
  }
  if (v7)
  {
    v48 = *((_QWORD *)&v161 + 1);
    goto LABEL_27;
  }
LABEL_43:
  v62 = v159;
  *(_OWORD *)(v3 + 608) = v158;
  *(_OWORD *)(v3 + 624) = v62;
  v63 = v161;
  *(_OWORD *)(v3 + 640) = v160;
  *(_OWORD *)(v3 + 656) = v63;
  v64 = *(_OWORD *)&v156.c;
  *(_OWORD *)(v3 + 544) = *(_OWORD *)&v156.a;
  *(_OWORD *)(v3 + 560) = v64;
  v65 = v157;
  *(_OWORD *)(v3 + 576) = *(_OWORD *)&v156.tx;
  *(_OWORD *)(v3 + 592) = v65;
  v66 = rect2.size;
  *(CGPoint *)(v3 + 480) = rect2.origin;
  *(CGSize *)(v3 + 496) = v66;
  v67 = v155;
  *(_OWORD *)(v3 + 512) = v154;
  *(_OWORD *)(v3 + 528) = v67;
  *(_BYTE *)(v3 + 673) = v24;
  if (!*(_QWORD *)(v3 + 704)
    && v7
    && (*(_QWORD *)(v3 + 664) == v49
     || !CGRectIntersectsRect(*(CGRect *)(v3 + 480), *(CGRect *)(a1 + 112))
     || !*(_BYTE *)(v3 + 673)))
  {
    v68 = *(_OWORD *)(v3 + 232);
    t1_32[0] = *(_OWORD *)(v3 + 216);
    t1_32[1] = v68;
    *(_OWORD *)&v177.a = *(_OWORD *)(v3 + 248);
    v177.c = *(CGFloat *)(v3 + 264);
    v69 = *(CGSize *)(v3 + 200);
    t1.origin = *(CGPoint *)(v3 + 184);
    t1.size = v69;
    objc_msgSend(*(id *)(a1 + 64), "checkInTile:withIdentifier:", v7, &t1, *(_QWORD *)&v103, *(_QWORD *)&v104, *(_QWORD *)&v105, *(_QWORD *)&v106, *(_QWORD *)&v107, *(_QWORD *)&v108, *(_QWORD *)&v109, *(_QWORD *)&v110);
    *(_QWORD *)(v3 + 696) = 0;
  }

}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_2_50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  id v8;
  id v9;
  uint64_t result;
  void *v11;

  v6 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(a3 + 40) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a3 + 56) = v6;
  *(_OWORD *)(a3 + 72) = *(_OWORD *)(a3 + 160);
  v7 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a3 + 96);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 88) = *(_QWORD *)(a3 + 176);
  *(_OWORD *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 280) = 0;
  *(_BYTE *)(a3 + 672) = *(_BYTE *)(a3 + 673);
  v8 = *(id *)(a3 + 688);
  v9 = *(id *)(a3 + 680);
  if (v9 != v8)
  {

    *(_QWORD *)(a3 + 680) = v8;
  }

  result = objc_msgSend(*(id *)(a1 + 32), "setCurrentGeometry:forTileStateAtIndex:", a3 + 480, a2);
  if (!*(_QWORD *)(a3 + 8) && !*(_QWORD *)(a3 + 696)
    || *(_BYTE *)(a1 + 80)
    && (result = CGRectIntersectsRect(*(CGRect *)(a3 + 288), *(CGRect *)(a1 + 48)), (result & 1) == 0)
    && !*(_QWORD *)(a3 + 696))
  {
    v11 = *(void **)(a3 + 688);
    if (v11)
    {

      *(_QWORD *)(a3 + 688) = 0;
    }
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  }
  return result;
}

uint64_t __42__PXTilingController__updateTilesIfNeeded__block_invoke_9(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform t2;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  CGAffineTransform t1;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  if (*(_QWORD *)(a3 + 696) && !*(_QWORD *)(a3 + 96))
  {
    v7 = (_QWORD *)result;
    v8 = *(_OWORD *)(a3 + 232);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a3 + 216);
    v51 = v8;
    v52 = *(_OWORD *)(a3 + 248);
    v53 = *(_QWORD *)(a3 + 264);
    v9 = *(_OWORD *)(a3 + 200);
    *(_OWORD *)&t1.a = *(_OWORD *)(a3 + 184);
    *(_OWORD *)&t1.c = v9;
    v10 = *(_OWORD *)(result + 104);
    *(_OWORD *)&t2.tx = *(_OWORD *)(result + 88);
    v47 = v10;
    v48 = *(_OWORD *)(result + 120);
    v49 = *(_QWORD *)(result + 136);
    v11 = *(_OWORD *)(result + 72);
    *(_OWORD *)&t2.a = *(_OWORD *)(result + 56);
    *(_OWORD *)&t2.c = v11;
    v12 = *(_QWORD *)&t1.a == *(_QWORD *)&t2.a;
    if (*(_QWORD *)&t1.a && *(_QWORD *)&t1.a == *(_QWORD *)&t2.a)
    {
      v13 = 1;
      do
      {
        v14 = *((_QWORD *)&t1.a + v13);
        v15 = *((_QWORD *)&t2.a + v13);
        v12 = v14 == v15;
        if (v13 >= *(_QWORD *)&t1.a)
          break;
        ++v13;
      }
      while (v14 == v15);
    }
    if (v12)
    {
      v16 = *(double *)(a3 + 512);
      v17 = *(double *)(a3 + 520);
      v18 = *(double *)(a3 + 528);
      v19 = *(double *)(a3 + 536);
      *(_OWORD *)&v45.a = *(_OWORD *)(a3 + 544);
      *(_OWORD *)&v45.c = *(_OWORD *)(a3 + 560);
      *(_OWORD *)&v45.tx = *(_OWORD *)(a3 + 576);
      v41 = *(double *)(a3 + 592);
      v43 = *(double *)(a3 + 600);
      v20 = *(unsigned __int8 *)(a3 + 608);
      v39 = *(double *)(a3 + 616);
      v37 = *(double *)(a3 + 624);
      v34 = *(double *)(a3 + 640);
      v35 = *(double *)(a3 + 632);
      v32 = *(double *)(a3 + 656);
      v33 = *(double *)(a3 + 648);
      v21 = *(_QWORD *)(a3 + 664);
      v23 = *(double *)(result + 176);
      v22 = *(double *)(result + 184);
      v25 = *(double *)(result + 192);
      v24 = *(double *)(result + 200);
      *(_OWORD *)&v44.a = *(_OWORD *)(result + 208);
      *(_OWORD *)&v44.c = *(_OWORD *)(result + 224);
      *(_OWORD *)&v44.tx = *(_OWORD *)(result + 240);
      v40 = *(double *)(result + 256);
      v42 = *(double *)(result + 264);
      v26 = *(unsigned __int8 *)(result + 272);
      v38 = *(double *)(result + 280);
      v36 = *(double *)(result + 288);
      v30 = *(double *)(result + 304);
      v31 = *(double *)(result + 296);
      v28 = *(double *)(result + 320);
      v29 = *(double *)(result + 312);
      v27 = *(_QWORD *)(result + 328);
      result = CGRectEqualToRect(*(CGRect *)(a3 + 480), *(CGRect *)(result + 144));
      if ((_DWORD)result)
      {
        if (v16 == v23 && v17 == v22 && v18 == v25 && v19 == v24)
        {
          t1 = v45;
          t2 = v44;
          result = CGAffineTransformEqualToTransform(&t1, &t2);
          if ((_DWORD)result)
          {
            if (v43 == v42 && v20 == v26 && v41 == v40 && v39 == v38 && v37 == v36)
            {
              v54.origin.y = v34;
              v54.origin.x = v35;
              v54.size.height = v32;
              v54.size.width = v33;
              v55.origin.y = v30;
              v55.origin.x = v31;
              v55.size.height = v28;
              v55.size.width = v29;
              result = CGRectEqualToRect(v54, v55);
              if ((result & 1) != 0 && v21 == v27)
              {
                result = *(_QWORD *)(a3 + 688);
                if (result == v7[4] || (result = objc_msgSend((id)result, "isEqual:"), (_DWORD)result))
                {
                  *(_QWORD *)(*(_QWORD *)(v7[5] + 8) + 24) = a2;
                  *(_QWORD *)(*(_QWORD *)(v7[6] + 8) + 24) = a3;
                  *a4 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTileAnimationCompletionWithIndex:", *(_QWORD *)(a1 + 40));

}

void __42__PXTilingController__updateTilesIfNeeded__block_invoke_7(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;

  *(_BYTE *)a2 = 0;
  v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 184) = v4;
  v5 = *(_OWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 88);
  v7 = *(_OWORD *)(a1 + 104);
  *(_QWORD *)(a2 + 264) = *(_QWORD *)(a1 + 120);
  *(_OWORD *)(a2 + 248) = v7;
  *(_OWORD *)(a2 + 232) = v6;
  *(_OWORD *)(a2 + 216) = v5;
  memmove((void *)(a2 + 96), (const void *)(a1 + 40), 0x58uLL);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a2 + 56) = v8;
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a2 + 160);
  *(_QWORD *)(a2 + 88) = *(_QWORD *)(a2 + 176);
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a2 + 24) = v9;
  *(_QWORD *)(a2 + 272) = *(_QWORD *)(a1 + 128);
  *(_BYTE *)(a2 + 280) = 1;
  v10 = *((_OWORD *)off_1E50B8940 + 9);
  *(_OWORD *)(a2 + 416) = *((_OWORD *)off_1E50B8940 + 8);
  *(_OWORD *)(a2 + 432) = v10;
  v11 = *((_OWORD *)off_1E50B8940 + 11);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)off_1E50B8940 + 10);
  *(_OWORD *)(a2 + 464) = v11;
  v12 = *((_OWORD *)off_1E50B8940 + 5);
  *(_OWORD *)(a2 + 352) = *((_OWORD *)off_1E50B8940 + 4);
  *(_OWORD *)(a2 + 368) = v12;
  v13 = *((_OWORD *)off_1E50B8940 + 7);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)off_1E50B8940 + 6);
  *(_OWORD *)(a2 + 400) = v13;
  v14 = *((_OWORD *)off_1E50B8940 + 1);
  *(_OWORD *)(a2 + 288) = *(_OWORD *)off_1E50B8940;
  *(_OWORD *)(a2 + 304) = v14;
  v15 = *((_OWORD *)off_1E50B8940 + 3);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)off_1E50B8940 + 2);
  *(_OWORD *)(a2 + 336) = v15;
  *(_BYTE *)(a2 + 672) = 0;
  v16 = *(_OWORD *)(a1 + 136);
  v17 = *(_OWORD *)(a1 + 152);
  v18 = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(a2 + 512) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)(a2 + 528) = v18;
  *(_OWORD *)(a2 + 480) = v16;
  *(_OWORD *)(a2 + 496) = v17;
  v19 = *(_OWORD *)(a1 + 200);
  v20 = *(_OWORD *)(a1 + 216);
  v21 = *(_OWORD *)(a1 + 248);
  *(_OWORD *)(a2 + 576) = *(_OWORD *)(a1 + 232);
  *(_OWORD *)(a2 + 592) = v21;
  *(_OWORD *)(a2 + 544) = v19;
  *(_OWORD *)(a2 + 560) = v20;
  v22 = *(_OWORD *)(a1 + 264);
  v23 = *(_OWORD *)(a1 + 280);
  v24 = *(_OWORD *)(a1 + 312);
  *(_OWORD *)(a2 + 640) = *(_OWORD *)(a1 + 296);
  *(_OWORD *)(a2 + 656) = v24;
  *(_OWORD *)(a2 + 608) = v22;
  *(_OWORD *)(a2 + 624) = v23;
  *(_BYTE *)(a2 + 673) = 1;
  v25 = *(id *)(a1 + 32);
  v26 = *(id *)(a2 + 688);
  v27 = v25;
  if (v26 != v25)
  {

    *(_QWORD *)(a2 + 688) = v27;
  }

}

double __42__PXTilingController__updateTilesIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double result;

  *(_BYTE *)a2 = 0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_QWORD *)(a2 + 88) = 0;
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 200) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 184) = v4;
  v5 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 80);
  v7 = *(_OWORD *)(a1 + 96);
  *(_QWORD *)(a2 + 264) = *(_QWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 248) = v7;
  *(_OWORD *)(a2 + 232) = v6;
  *(_OWORD *)(a2 + 216) = v5;
  memmove((void *)(a2 + 96), (const void *)(a1 + 32), 0x58uLL);
  *(_QWORD *)(a2 + 272) = *(_QWORD *)(a1 + 120);
  *(_BYTE *)(a2 + 280) = 1;
  v8 = *((_OWORD *)off_1E50B8940 + 3);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)off_1E50B8940 + 2);
  *(_OWORD *)(a2 + 336) = v8;
  v9 = *((_OWORD *)off_1E50B8940 + 1);
  *(_OWORD *)(a2 + 288) = *(_OWORD *)off_1E50B8940;
  *(_OWORD *)(a2 + 304) = v9;
  v10 = *((_OWORD *)off_1E50B8940 + 7);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)off_1E50B8940 + 6);
  *(_OWORD *)(a2 + 400) = v10;
  v11 = *((_OWORD *)off_1E50B8940 + 5);
  *(_OWORD *)(a2 + 352) = *((_OWORD *)off_1E50B8940 + 4);
  *(_OWORD *)(a2 + 368) = v11;
  v12 = *((_OWORD *)off_1E50B8940 + 11);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)off_1E50B8940 + 10);
  *(_OWORD *)(a2 + 464) = v12;
  v13 = *((_OWORD *)off_1E50B8940 + 9);
  *(_OWORD *)(a2 + 416) = *((_OWORD *)off_1E50B8940 + 8);
  *(_OWORD *)(a2 + 432) = v13;
  *(_BYTE *)(a2 + 672) = 0;
  result = 0.0;
  *(_OWORD *)(a2 + 680) = 0u;
  return result;
}

__n128 __51__PXTilingController__updateLayoutPositionIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  if (*(_QWORD *)(a3 + 8))
  {
    *(_BYTE *)(a3 + 280) = 1;
    v3 = *((_OWORD *)off_1E50B8940 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E50B8940 + 8);
    *(_OWORD *)(a3 + 624) = v3;
    v4 = *((_OWORD *)off_1E50B8940 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E50B8940 + 10);
    *(_OWORD *)(a3 + 656) = v4;
    v5 = *((_OWORD *)off_1E50B8940 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E50B8940 + 4);
    *(_OWORD *)(a3 + 560) = v5;
    v6 = *((_OWORD *)off_1E50B8940 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E50B8940 + 6);
    *(_OWORD *)(a3 + 592) = v6;
    v7 = *((_OWORD *)off_1E50B8940 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E50B8940;
    *(_OWORD *)(a3 + 496) = v7;
    result = *((__n128 *)off_1E50B8940 + 2);
    v9 = *((_OWORD *)off_1E50B8940 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v9;
  }
  return result;
}

double __43__PXTilingController_layoutPreferredOrigin__block_invoke(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGRect v13;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldFlipHorizontally"))
  {
    v13.origin.x = a4;
    v13.origin.y = a5;
    v13.size.width = a6;
    v13.size.height = a7;
    return -(a2 - CGRectGetMidX(v13) * 2.0);
  }
  return a2;
}

__n128 __58__PXTilingController__fillBuffersWithTileStatesAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __n128 result;
  __int128 v16;
  __int128 v17;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 88 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(_OWORD *)(a3 + 144);
  v4 = *(_OWORD *)(a3 + 160);
  v6 = *(_OWORD *)(a3 + 128);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a3 + 176);
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = v4;
  *(_OWORD *)(v3 + 32) = v6;
  v7 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)v3 = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v3 + 16) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 192 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = *(_OWORD *)(a3 + 592);
  v11 = *(_OWORD *)(a3 + 544);
  v10 = *(_OWORD *)(a3 + 560);
  *(_OWORD *)(v8 + 96) = *(_OWORD *)(a3 + 576);
  *(_OWORD *)(v8 + 112) = v9;
  *(_OWORD *)(v8 + 64) = v11;
  *(_OWORD *)(v8 + 80) = v10;
  v12 = *(_OWORD *)(a3 + 656);
  v14 = *(_OWORD *)(a3 + 608);
  v13 = *(_OWORD *)(a3 + 624);
  *(_OWORD *)(v8 + 160) = *(_OWORD *)(a3 + 640);
  *(_OWORD *)(v8 + 176) = v12;
  *(_OWORD *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 144) = v13;
  result = *(__n128 *)(a3 + 480);
  v16 = *(_OWORD *)(a3 + 496);
  v17 = *(_OWORD *)(a3 + 528);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a3 + 512);
  *(_OWORD *)(v8 + 48) = v17;
  *(__n128 *)v8 = result;
  *(_OWORD *)(v8 + 16) = v16;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void *__63__PXTilingController__indexesOfVisibleTilesInRect_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (!result || (result = (void *)objc_msgSend(result, "containsIndex:", *(_QWORD *)(a3 + 272)), (_DWORD)result))
  {
    if (*(_BYTE *)(a3 + 672))
    {
      if (*(_QWORD *)(a3 + 8))
        return (void *)objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
    }
  }
  return result;
}

__n128 __39__PXTilingController__setTargetLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  _OWORD v12[5];
  uint64_t v13;

  if (*(_QWORD *)(a3 + 8))
  {
    *(_BYTE *)a3 = 1;
    v4 = *(void **)(a1 + 32);
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    objc_msgSend(v4, "setTargetIdentifier:forTileStateAtIndex:", v12, a2);
    *(_BYTE *)(a3 + 280) = 1;
    v5 = *((_OWORD *)off_1E50B8940 + 9);
    *(_OWORD *)(a3 + 608) = *((_OWORD *)off_1E50B8940 + 8);
    *(_OWORD *)(a3 + 624) = v5;
    v6 = *((_OWORD *)off_1E50B8940 + 11);
    *(_OWORD *)(a3 + 640) = *((_OWORD *)off_1E50B8940 + 10);
    *(_OWORD *)(a3 + 656) = v6;
    v7 = *((_OWORD *)off_1E50B8940 + 5);
    *(_OWORD *)(a3 + 544) = *((_OWORD *)off_1E50B8940 + 4);
    *(_OWORD *)(a3 + 560) = v7;
    v8 = *((_OWORD *)off_1E50B8940 + 7);
    *(_OWORD *)(a3 + 576) = *((_OWORD *)off_1E50B8940 + 6);
    *(_OWORD *)(a3 + 592) = v8;
    v9 = *((_OWORD *)off_1E50B8940 + 1);
    *(_OWORD *)(a3 + 480) = *(_OWORD *)off_1E50B8940;
    *(_OWORD *)(a3 + 496) = v9;
    result = *((__n128 *)off_1E50B8940 + 2);
    v11 = *((_OWORD *)off_1E50B8940 + 3);
    *(__n128 *)(a3 + 512) = result;
    *(_OWORD *)(a3 + 528) = v11;
  }
  return result;
}

uint64_t __36__PXTilingController__setPagedRect___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "_invalidateTiles");
  if (a2 == -1)
    return objc_msgSend(*(id *)(result + 32), "_invalidateRect:");
  return result;
}

void __31__PXTilingController_debugInfo__block_invoke(uint64_t a1, uint64_t a2, double *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3[36], a3[37], a3[38], a3[39]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __31__PXTilingController_debugInfo__block_invoke_2(uint64_t a1, uint64_t a2, double *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3[36], a3[37], a3[38], a3[39]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __31__PXTilingController_debugInfo__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double *a4)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *a4, a4[1], a4[2], a4[3]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __61__PXTilingController_hitTestTileAtPoint_padding_passingTest___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, double *a4, _OWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t result;
  double v28;
  double v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[12];
  _OWORD v46[12];
  _OWORD v47[5];
  uint64_t v48;

  v11 = a1[4];
  v12 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t))(v11 + 16);
  v13 = *(_OWORD *)(a2 + 48);
  v47[2] = *(_OWORD *)(a2 + 32);
  v47[3] = v13;
  v47[4] = *(_OWORD *)(a2 + 64);
  v48 = *(_QWORD *)(a2 + 80);
  v14 = *(_OWORD *)(a2 + 16);
  v47[0] = *(_OWORD *)a2;
  v47[1] = v14;
  v15 = *((_OWORD *)a4 + 9);
  v46[8] = *((_OWORD *)a4 + 8);
  v46[9] = v15;
  v16 = *((_OWORD *)a4 + 11);
  v46[10] = *((_OWORD *)a4 + 10);
  v46[11] = v16;
  v17 = *((_OWORD *)a4 + 5);
  v46[4] = *((_OWORD *)a4 + 4);
  v46[5] = v17;
  v18 = *((_OWORD *)a4 + 7);
  v46[6] = *((_OWORD *)a4 + 6);
  v46[7] = v18;
  v19 = *((_OWORD *)a4 + 1);
  v46[0] = *(_OWORD *)a4;
  v46[1] = v19;
  v20 = *((_OWORD *)a4 + 3);
  v46[2] = *((_OWORD *)a4 + 2);
  v46[3] = v20;
  v21 = a5[9];
  v45[8] = a5[8];
  v45[9] = v21;
  v22 = a5[11];
  v45[10] = a5[10];
  v45[11] = v22;
  v23 = a5[5];
  v45[4] = a5[4];
  v45[5] = v23;
  v24 = a5[7];
  v45[6] = a5[6];
  v45[7] = v24;
  v25 = a5[1];
  v45[0] = *a5;
  v45[1] = v25;
  v26 = a5[3];
  v45[2] = a5[2];
  v45[3] = v26;
  result = v12(v11, v47, a3, v46, v45, a6, a7, a8);
  if ((_DWORD)result)
  {
    PXRectWithCenterAndSize();
    result = PXRectShortestDistanceToPoint();
    v29 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v28 < v29 || v28 == v29 && a4[15] > *(double *)(*(_QWORD *)(a1[6] + 8) + 152))
    {
      v30 = *(_QWORD *)(a1[7] + 8);
      v32 = *(_OWORD *)(a2 + 48);
      v31 = *(_OWORD *)(a2 + 64);
      v33 = *(_OWORD *)(a2 + 32);
      *(_QWORD *)(v30 + 112) = *(_QWORD *)(a2 + 80);
      *(_OWORD *)(v30 + 80) = v32;
      *(_OWORD *)(v30 + 96) = v31;
      *(_OWORD *)(v30 + 64) = v33;
      v34 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)(v30 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v30 + 48) = v34;
      v35 = *(_OWORD **)(a1[6] + 8);
      v36 = *((_OWORD *)a4 + 7);
      v38 = *((_OWORD *)a4 + 4);
      v37 = *((_OWORD *)a4 + 5);
      v35[8] = *((_OWORD *)a4 + 6);
      v35[9] = v36;
      v35[6] = v38;
      v35[7] = v37;
      v39 = *((_OWORD *)a4 + 11);
      v41 = *((_OWORD *)a4 + 8);
      v40 = *((_OWORD *)a4 + 9);
      v35[12] = *((_OWORD *)a4 + 10);
      v35[13] = v39;
      v35[10] = v41;
      v35[11] = v40;
      v42 = *(_OWORD *)a4;
      v43 = *((_OWORD *)a4 + 1);
      v44 = *((_OWORD *)a4 + 3);
      v35[4] = *((_OWORD *)a4 + 2);
      v35[5] = v44;
      v35[2] = v42;
      v35[3] = v43;
      *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v28;
    }
  }
  return result;
}

uint64_t __66__PXTilingController_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[12];
  _OWORD v25[12];
  _OWORD v26[5];
  uint64_t v27;

  v5 = *(_QWORD *)(a3 + 696);
  if (v5)
  {
    v6 = *(_QWORD *)(result + 32);
    v7 = *(_QWORD *)(a3 + 272);
    v8 = *(_QWORD *)(a3 + 680);
    v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, _OWORD *, _OWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16);
    v10 = *(_OWORD *)(a3 + 56);
    v26[2] = *(_OWORD *)(a3 + 40);
    v26[3] = v10;
    v26[4] = *(_OWORD *)(a3 + 72);
    v27 = *(_QWORD *)(a3 + 88);
    v11 = *(_OWORD *)(a3 + 24);
    v26[0] = *(_OWORD *)(a3 + 8);
    v26[1] = v11;
    v12 = *(_OWORD *)(a3 + 432);
    v25[8] = *(_OWORD *)(a3 + 416);
    v25[9] = v12;
    v13 = *(_OWORD *)(a3 + 464);
    v25[10] = *(_OWORD *)(a3 + 448);
    v25[11] = v13;
    v14 = *(_OWORD *)(a3 + 368);
    v25[4] = *(_OWORD *)(a3 + 352);
    v25[5] = v14;
    v15 = *(_OWORD *)(a3 + 400);
    v25[6] = *(_OWORD *)(a3 + 384);
    v25[7] = v15;
    v16 = *(_OWORD *)(a3 + 304);
    v25[0] = *(_OWORD *)(a3 + 288);
    v25[1] = v16;
    v17 = *(_OWORD *)(a3 + 336);
    v25[2] = *(_OWORD *)(a3 + 320);
    v25[3] = v17;
    v18 = *(_OWORD *)(a3 + 624);
    v24[8] = *(_OWORD *)(a3 + 608);
    v24[9] = v18;
    v19 = *(_OWORD *)(a3 + 656);
    v24[10] = *(_OWORD *)(a3 + 640);
    v24[11] = v19;
    v20 = *(_OWORD *)(a3 + 560);
    v24[4] = *(_OWORD *)(a3 + 544);
    v24[5] = v20;
    v21 = *(_OWORD *)(a3 + 592);
    v24[6] = *(_OWORD *)(a3 + 576);
    v24[7] = v21;
    v22 = *(_OWORD *)(a3 + 496);
    v24[0] = *(_OWORD *)(a3 + 480);
    v24[1] = v22;
    v23 = *(_OWORD *)(a3 + 528);
    v24[2] = *(_OWORD *)(a3 + 512);
    v24[3] = v23;
    return v9(v6, v26, v5, v25, v24, v7, v8, a4);
  }
  return result;
}

BOOL __76__PXTilingController_getTile_geometry_group_userData_forTileWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _BOOL8 result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;
  _OWORD v12[5];
  uint64_t v13;

  v2 = *(_OWORD *)(a2 + 56);
  v12[2] = *(_OWORD *)(a2 + 40);
  v12[3] = v2;
  v12[4] = *(_OWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a2 + 88);
  v3 = *(_OWORD *)(a2 + 24);
  v12[0] = *(_OWORD *)(a2 + 8);
  v12[1] = v3;
  v4 = *(_OWORD *)(a1 + 80);
  v10[2] = *(_OWORD *)(a1 + 64);
  v10[3] = v4;
  v10[4] = *(_OWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 112);
  v5 = *(_OWORD *)(a1 + 48);
  v10[0] = *(_OWORD *)(a1 + 32);
  v10[1] = v5;
  result = *(_QWORD *)&v12[0] == *(_QWORD *)&v10[0];
  if (*(_QWORD *)&v12[0] && *(_QWORD *)&v12[0] == *(_QWORD *)&v10[0])
  {
    v7 = 1;
    do
    {
      v8 = *((_QWORD *)v12 + v7);
      v9 = *((_QWORD *)v10 + v7);
      result = v8 == v9;
      if (v7 >= *(_QWORD *)&v12[0])
        break;
      ++v7;
    }
    while (v8 == v9);
  }
  return result;
}

__n128 __44__PXTilingController_tileIdentifierForTile___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(a3 + 696))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_OWORD *)(a3 + 56);
    v6 = *(_OWORD *)(a3 + 72);
    v7 = *(_OWORD *)(a3 + 40);
    *(_QWORD *)(v4 + 112) = *(_QWORD *)(a3 + 88);
    *(_OWORD *)(v4 + 80) = v5;
    *(_OWORD *)(v4 + 96) = v6;
    *(_OWORD *)(v4 + 64) = v7;
    result = *(__n128 *)(a3 + 8);
    v9 = *(_OWORD *)(a3 + 24);
    *(__n128 *)(v4 + 32) = result;
    *(_OWORD *)(v4 + 48) = v9;
    *a4 = 1;
  }
  return result;
}

- (id)imageTileWithIdentifier:(PXTileIdentifier *)a3
{
  __int128 v3;
  __int128 v4;
  id v5;
  _OWORD v7[5];
  unint64_t v8;
  id v9;

  v9 = 0;
  v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  v7[4] = *(_OWORD *)&a3->index[7];
  v8 = a3->index[9];
  v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  v5 = 0;
  if (-[PXTilingController getTile:geometry:group:userData:forTileWithIdentifier:](self, "getTile:geometry:group:userData:forTileWithIdentifier:", &v9, 0, 0, 0, v7))
  {
    v5 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

- (id)titleSubtitleTileWithIdentifier:(PXTileIdentifier *)a3
{
  __int128 v3;
  __int128 v4;
  id v5;
  _OWORD v7[5];
  unint64_t v8;
  id v9;

  v9 = 0;
  v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  v7[4] = *(_OWORD *)&a3->index[7];
  v8 = a3->index[9];
  v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  v5 = 0;
  if (-[PXTilingController getTile:geometry:group:userData:forTileWithIdentifier:](self, "getTile:geometry:group:userData:forTileWithIdentifier:", &v9, 0, 0, 0, v7))
  {
    v5 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

@end
