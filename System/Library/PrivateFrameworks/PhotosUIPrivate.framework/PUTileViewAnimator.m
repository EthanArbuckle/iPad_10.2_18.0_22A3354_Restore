@implementation PUTileViewAnimator

- (PUTileViewAnimator)init
{
  PUTileViewAnimator *v2;
  uint64_t v3;
  NSMapTable *synchronizedAnimationGroupsByTransition;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUTileViewAnimator;
  v2 = -[PUTileViewAnimator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    synchronizedAnimationGroupsByTransition = v2->__synchronizedAnimationGroupsByTransition;
    v2->__synchronizedAnimationGroupsByTransition = (NSMapTable *)v3;

  }
  return v2;
}

- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUTileViewAnimator *v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewAnimator.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isKindOfClass:[PUTileViewController class]]"));

  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewAnimator.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileViewController isKindOfClass:[PUTileViewController class]]"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(v9, "removeAllAnimations");
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PUTileViewAnimator_prepareTileControllerForAnimation_withInitialLayoutInfo___block_invoke;
  v15[3] = &unk_1E58AAA58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = a2;
  v14 = v9;
  v11 = v8;
  objc_msgSend(v10, "performWithoutAnimation:", v15);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[4];
  id v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[4];
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[4];
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[4];
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  char v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD aBlock[4];
  id v124;
  id v125;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewAnimator.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isKindOfClass:[PUTileViewController class]]"));

  }
  v15 = objc_msgSend(v12, "kind");
  objc_msgSend(v12, "duration");
  v17 = v16;
  objc_msgSend(v12, "delay");
  v19 = v18;
  objc_msgSend(v12, "completionGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v12, "shouldFadeOutSnapshotAfterCompletionGroup");
  objc_msgSend(v14, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E58ABCA8;
  v23 = v14;
  v124 = v23;
  v24 = v11;
  v125 = v24;
  v25 = _Block_copy(aBlock);
  if (objc_msgSend(v12, "highFrameRateReason")
    && objc_msgSend(MEMORY[0x1E0D7CCE8], "highFramerateRequiresReasonAndRange"))
  {
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2;
    v120[3] = &unk_1E58AB968;
    v121 = v12;
    v122 = v25;
    v25 = _Block_copy(v120);

  }
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_4;
  v115[3] = &unk_1E58A9000;
  v58 = v20;
  v116 = v58;
  v57 = v13;
  v118 = v57;
  v119 = v21;
  v26 = v22;
  v117 = v26;
  v27 = _Block_copy(v115);
  switch(v15)
  {
    case 1000:
      objc_msgSend(v12, "springDampingRatio");
      v29 = v28;
      v30 = MEMORY[0x1E0C809B0];
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_9;
      v103[3] = &unk_1E58A9050;
      v31 = v26;
      v104 = v31;
      v105 = v17;
      v106 = v19;
      v107 = v29;
      v108 = 6;
      v32 = _Block_copy(v103);
      v96[0] = v30;
      v96[1] = 3221225472;
      v96[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_10;
      v96[3] = &unk_1E58A9078;
      v97 = v31;
      v99 = v17;
      v100 = v19;
      v101 = v29;
      v102 = 6;
      v98 = v25;
      v33 = _Block_copy(v96);

      v34 = v104;
      break;
    case 1001:
      v30 = MEMORY[0x1E0C809B0];
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_11;
      v92[3] = &unk_1E58A90A0;
      v35 = v26;
      v93 = v35;
      v94 = v19;
      v95 = 6;
      v32 = _Block_copy(v92);
      v87[0] = v30;
      v87[1] = 3221225472;
      v87[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_12;
      v87[3] = &unk_1E58A90C8;
      v88 = v35;
      v90 = v19;
      v91 = 6;
      v89 = v25;
      v33 = _Block_copy(v87);

      v34 = v93;
      break;
    case 1002:
      objc_msgSend(v12, "springMass");
      v37 = v36;
      objc_msgSend(v12, "springStiffness");
      v39 = v38;
      objc_msgSend(v12, "springDampingRatio");
      v41 = v40 + v40;
      PXFloatSqrt();
      v43 = v41 * v42;
      v44 = objc_msgSend(v12, "springNumberOfOscillations");
      objc_msgSend(MEMORY[0x1E0DC3F10], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", v44 + 1, v37, v39, v43, 0.0);
      v46 = v45;
      v30 = MEMORY[0x1E0C809B0];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_13;
      v79[3] = &unk_1E58A90F0;
      v47 = v26;
      v80 = v47;
      v81 = v46;
      v82 = v19;
      v83 = 6;
      v84 = v37;
      v85 = v39;
      v86 = v43;
      v32 = _Block_copy(v79);
      v70[0] = v30;
      v70[1] = 3221225472;
      v70[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_14;
      v70[3] = &unk_1E58A9118;
      v71 = v47;
      v73 = v46;
      v74 = v19;
      v75 = 6;
      v76 = v37;
      v77 = v39;
      v78 = v43;
      v72 = v25;
      v33 = _Block_copy(v70);

      v34 = v80;
      break;
    case 1003:
      objc_msgSend(v12, "customViewAnimatorBlock");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_15;
      v67[3] = &unk_1E58A9140;
      v68 = v48;
      v69 = v25;
      v34 = v48;
      v33 = _Block_copy(v67);

      v32 = 0;
      break;
    default:
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewAnimator.m"), 169, CFSTR("unknown animation kind %@"), v49);

        v33 = 0;
        v32 = 0;
        v30 = MEMORY[0x1E0C809B0];
      }
      else
      {
        v30 = MEMORY[0x1E0C809B0];
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_8;
        v109[3] = &unk_1E58A9028;
        v110 = v26;
        v112 = v17;
        v113 = v19;
        v114 = 6;
        v111 = v25;
        v33 = _Block_copy(v109);

        v32 = 0;
        v34 = v110;
      }
      break;
  }

  v60[0] = v30;
  v60[1] = 3221225472;
  v60[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_16;
  v60[3] = &unk_1E58A9190;
  v61 = v12;
  v62 = v23;
  v63 = v24;
  v64 = v27;
  v65 = v32;
  v66 = v33;
  v50 = v12;
  v51 = v27;
  v52 = v32;
  v53 = v23;
  v54 = v24;
  v55 = v33;
  -[PUTileViewAnimator _performAnimations:withOptions:](self, "_performAnimations:withOptions:", v60, v50);

}

- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4
{
  objc_msgSend(a3, "applyLayoutInfo:", a4);
}

- (void)_performAnimations:(id)a3 withOptions:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  -[PUTileAnimator currentTransition](self, "currentTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v7, "isSynchronizedWithTransition") & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__PUTileViewAnimator__performAnimations_withOptions___block_invoke;
    v13[3] = &unk_1E58ABAC8;
    v14 = v6;
    +[PUAnimationGroup animationGroupWithAnimations:](PUAnimationGroup, "animationGroupWithAnimations:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PUTileViewAnimator _synchronizedAnimationGroupsByTransition](self, "_synchronizedAnimationGroupsByTransition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUTileViewAnimator _synchronizedAnimationGroupsByTransition](self, "_synchronizedAnimationGroupsByTransition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v8);

      }
      objc_msgSend(v11, "addObject:", v9);

    }
  }
  else
  {
    v6[2](v6);
  }

}

- (void)transition:(id)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUTileViewAnimator;
  -[PUTileAnimator transition:didComplete:](&v19, sel_transition_didComplete_, v6, v4);
  if (v4)
  {
    -[PUTileViewAnimator _synchronizedAnimationGroupsByTransition](self, "_synchronizedAnimationGroupsByTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "finishImmediately", (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
  -[PUTileViewAnimator _synchronizedAnimationGroupsByTransition](self, "_synchronizedAnimationGroupsByTransition", (_QWORD)v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v6);

}

- (NSMapTable)_synchronizedAnimationGroupsByTransition
{
  return self->__synchronizedAnimationGroupsByTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__synchronizedAnimationGroupsByTransition, 0);
}

uint64_t __53__PUTileViewAnimator__performAnimations_withOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyLayoutInfo:", *(_QWORD *)(a1 + 40));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  PXFrameRateRangeTypeGetCAFrameRateRange();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(*(id *)(a1 + 32), "highFrameRateReason");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3;
  v13[3] = &unk_1E58ABAC8;
  v14 = *(id *)(a1 + 40);
  LODWORD(v10) = v4;
  LODWORD(v11) = v6;
  LODWORD(v12) = v8;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v9, v13, v10, v11, v12);

}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_5;
    block[3] = &unk_1E58A8FD8;
    v7 = *(_BYTE *)(a1 + 56);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_group_notify(v2, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_animateViews:withDuration:delay:options:animations:completion:", v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), v7, v8);

}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_9(double *a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  _OWORD v25[3];

  v18 = *((_QWORD *)a1 + 4);
  v19 = a1[5];
  v20 = a1[6];
  v21 = *((_QWORD *)a1 + 7);
  v22 = *((_QWORD *)a1 + 8);
  v23 = a2[1];
  v25[0] = *a2;
  v25[1] = v23;
  v25[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateView:toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:", v18, v25, v22, a3, a4, a5, a6, a7, a8, a9, v19, v20, v21, a15, a16, a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_animateViews:withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v6, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0.0, v7, v8);

}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_11(double *a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v23[3];

  v18 = *((_QWORD *)a1 + 4);
  v19 = a1[5];
  v20 = *((_QWORD *)a1 + 6);
  v21 = a2[1];
  v23[0] = *a2;
  v23[1] = v21;
  v23[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateView:toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:", v18, v23, v20, a3, a4, a5, a6, a7, a8, a9, v19, a15, a16, a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_animateViews:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 48), 0.0, v7, v8);

}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_13(uint64_t a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v26[3];

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(double *)(a1 + 40);
  v20 = *(double *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v22 = *(_OWORD *)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 80);
  v24 = a2[1];
  v26[0] = *a2;
  v26[1] = v24;
  v26[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateView:toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:", v18, v26, v21, a3, a4, a5, a6, a7, a8, a9, v19, v20, v22, v23, a15, a16,
           a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_animateViews:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), 0.0, v7, v8);

}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_16(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  void (*v30)(uint64_t, _OWORD *, _QWORD *, double, double, double, double, double, double);
  void *v31;
  uint64_t v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  _OWORD v40[3];
  _QWORD v41[4];
  NSObject *v42;
  _QWORD *v43;
  _QWORD block[4];
  id v45;
  _QWORD *v46;
  _QWORD v47[3];
  char v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initialVelocity");
  v6 = v5;
  v7 = v2;
  v8 = v3;
  v9 = v4;
  if (v5 == 0.0 && v2 == 0.0 && v3 == 0.0 && v4 == 0.0
    || (+[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "carryOverVelocities"),
        v10,
        !v11))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v48 = 1;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_17;
    block[3] = &unk_1E58AA720;
    v45 = *(id *)(a1 + 56);
    v46 = v47;
    dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 40), "tilingView");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "center");
      v16 = v15;
      v18 = v17;
      objc_msgSend(*(id *)(a1 + 48), "coordinateSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject contentCoordinateSystem](v14, "contentCoordinateSystem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v19, v20, v16, v18);
      v23 = v22;

      objc_msgSend(*(id *)(a1 + 48), "size");
      v34 = v25;
      v35 = v24;
      v36 = v23;
      v50 = 0u;
      v51 = 0u;
      *(_OWORD *)buf = 0u;
      v26 = *(void **)(a1 + 48);
      if (v26)
        objc_msgSend(v26, "transform");
      v27 = *MEMORY[0x1E0C9D538];
      v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      dispatch_group_enter(v12);
      v29 = *(_QWORD *)(a1 + 64);
      v41[0] = v13;
      v41[1] = 3221225472;
      v41[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_18;
      v41[3] = &unk_1E58A9168;
      v43 = v47;
      v42 = v12;
      v30 = *(void (**)(uint64_t, _OWORD *, _QWORD *, double, double, double, double, double, double))(v29 + 16);
      v40[0] = *(_OWORD *)buf;
      v40[1] = v50;
      v40[2] = v51;
      v30(v29, v40, v41, v21, v36, v27, v28, v35, v34);

    }
    else
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}"), *(_QWORD *)&v6, *(_QWORD *)&v7, *(_QWORD *)&v8, *(_QWORD *)&v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v31;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "initial velocity ignored (%@)", buf, 0xCu);

      }
    }

    v32 = *(_QWORD *)(a1 + 72);
    v37[0] = v13;
    v37[1] = 3221225472;
    v37[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_23;
    v37[3] = &unk_1E58A9168;
    v39 = v47;
    v33 = v12;
    v38 = v33;
    (*(void (**)(uint64_t, _QWORD *))(v32 + 16))(v32, v37);

    _Block_object_dispose(v47, 8);
  }
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_18(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_23(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshotViewAfterScreenUpdates:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "frame");
    objc_msgSend(v2, "setFrame:");
    if (v5)
    {
      objc_msgSend(v5, "transform");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
    }
    objc_msgSend(v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v22;
    v17[5] = v23;
    v17[6] = v24;
    v17[7] = v25;
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    v17[3] = v21;
    objc_msgSend(v6, "setTransform:", v17);

    objc_msgSend(v5, "zPosition");
    v8 = v7;
    objc_msgSend(v2, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setZPosition:", v8);

    objc_msgSend(*(id *)(a1 + 32), "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:aboveSubview:", v2, *(_QWORD *)(a1 + 32));

    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_6;
    v15[3] = &unk_1E58ABD10;
    v16 = v2;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_7;
    v13[3] = &unk_1E58A9910;
    v14 = v16;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v15, v13, 0.5);

  }
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PUTileViewAnimator_prepareTileControllerForAnimation_withInitialLayoutInfo___block_invoke(uint64_t a1)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "center");
  if (!CGFloatIsValid() || (CGFloatIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PUTileViewAnimator.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PUPointIsValid(initialLayoutInfo.center)"));

  }
  return objc_msgSend(*(id *)(a1 + 48), "applyLayoutInfo:", *(_QWORD *)(a1 + 32));
}

@end
