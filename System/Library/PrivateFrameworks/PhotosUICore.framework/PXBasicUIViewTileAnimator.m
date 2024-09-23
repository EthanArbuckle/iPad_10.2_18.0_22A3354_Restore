@implementation PXBasicUIViewTileAnimator

+ (void)animateWithOptions:(id)a3 animations:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void (**v8)(id, uint64_t);
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (v15)
  {
    v9 = objc_msgSend(v15, "style");
    if (v9 == 2)
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(v15, "delay");
      objc_msgSend(v11, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v7, v8);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      if (v9 == 3)
      {
        objc_msgSend(v15, "duration");
        objc_msgSend(v10, "px_animateUsingDefaultDampedEaseInEaseOutWithDuration:animations:completion:", v7, v8);
      }
      else
      {
        objc_msgSend(v15, "duration");
        v13 = v12;
        objc_msgSend(v15, "delay");
        objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v7, v8, v13, v14);
      }
    }
  }
  else
  {
    v7[2](v7);
    if (v8)
      v8[2](v8, 1);
  }

}

- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGSize size;
  CGSize v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  CGPoint origin;
  CGSize v23;
  CGPoint center;
  CGSize v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v8 = a3;
  v9 = a5;
  v19[1] = 3221225472;
  v10 = *(_OWORD *)&a4->contentSize.height;
  v30 = *(_OWORD *)&a4->hidden;
  v31 = v10;
  v11 = *(_OWORD *)&a4->contentsRect.size.height;
  v32 = *(_OWORD *)&a4->contentsRect.origin.y;
  v33 = v11;
  v12 = *(_OWORD *)&a4->transform.c;
  v26 = *(_OWORD *)&a4->transform.a;
  v27 = v12;
  v13 = *(_OWORD *)&a4->alpha;
  v28 = *(_OWORD *)&a4->transform.tx;
  v29 = v13;
  size = a4->frame.size;
  origin = a4->frame.origin;
  v23 = size;
  v15 = a4->size;
  center = a4->center;
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[2] = __63__PXBasicUIViewTileAnimator_prepareTile_withGeometry_userData___block_invoke;
  v19[3] = &unk_1E5131A30;
  v25 = v15;
  v19[4] = self;
  v20 = v9;
  v21 = v8;
  v17 = v8;
  v18 = v9;
  objc_msgSend(v16, "performWithoutAnimation:", v19);

}

- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  int v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGSize size;
  CGSize v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGSize v29;
  CGSize v30;
  id v31;
  id v32;
  void (**v33)(_QWORD);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGSize v39;
  CGSize v40;
  id v41;
  void (**v42)(_QWORD);
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  CGPoint v64;
  CGSize v65;
  CGPoint v66;
  CGSize v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  char v76;
  _QWORD aBlock[5];
  id v78;
  id v79;
  CGPoint origin;
  CGSize v81;
  CGPoint center;
  CGSize v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _OWORD v92[12];
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  if (-[NSCountedSet containsObject:](self->_suspendedTiles, "containsObject:", v12))
  {
    v15[2](v15);
  }
  else
  {
    v16 = objc_msgSend(v14, "shouldNotifyTiles");
    v17 = v16;
    if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = *(_OWORD *)&a4->contentSize.height;
      v92[8] = *(_OWORD *)&a4->hidden;
      v92[9] = v18;
      v19 = *(_OWORD *)&a4->contentsRect.size.height;
      v92[10] = *(_OWORD *)&a4->contentsRect.origin.y;
      v92[11] = v19;
      v20 = *(_OWORD *)&a4->transform.c;
      v92[4] = *(_OWORD *)&a4->transform.a;
      v92[5] = v20;
      v21 = *(_OWORD *)&a4->alpha;
      v92[6] = *(_OWORD *)&a4->transform.tx;
      v92[7] = v21;
      size = a4->frame.size;
      v92[0] = a4->frame.origin;
      v92[1] = size;
      v23 = a4->size;
      v92[2] = a4->center;
      v92[3] = v23;
      objc_msgSend(v12, "willAnimateToGeometry:toUserData:withOptions:", v92, v13, v14);
    }
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    v25 = *(_OWORD *)&a4->contentSize.height;
    v88 = *(_OWORD *)&a4->hidden;
    v89 = v25;
    v26 = *(_OWORD *)&a4->contentsRect.size.height;
    v90 = *(_OWORD *)&a4->contentsRect.origin.y;
    v91 = v26;
    v27 = *(_OWORD *)&a4->transform.c;
    v84 = *(_OWORD *)&a4->transform.a;
    v85 = v27;
    v28 = *(_OWORD *)&a4->alpha;
    v86 = *(_OWORD *)&a4->transform.tx;
    v87 = v28;
    v29 = a4->frame.size;
    origin = a4->frame.origin;
    v81 = v29;
    v30 = a4->size;
    center = a4->center;
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5131A30;
    aBlock[4] = self;
    v83 = v30;
    v58 = v13;
    v31 = v13;
    v78 = v31;
    v32 = v12;
    v79 = v32;
    v33 = (void (**)(_QWORD))_Block_copy(aBlock);
    v59[0] = v24;
    v59[1] = 3221225472;
    v59[2] = __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke_2;
    v59[3] = &unk_1E5131A58;
    v76 = v17;
    v34 = v32;
    v60 = v34;
    v35 = *(_OWORD *)&a4->contentSize.height;
    v72 = *(_OWORD *)&a4->hidden;
    v73 = v35;
    v36 = *(_OWORD *)&a4->contentsRect.size.height;
    v74 = *(_OWORD *)&a4->contentsRect.origin.y;
    v75 = v36;
    v37 = *(_OWORD *)&a4->transform.c;
    v68 = *(_OWORD *)&a4->transform.a;
    v69 = v37;
    v38 = *(_OWORD *)&a4->alpha;
    v70 = *(_OWORD *)&a4->transform.tx;
    v71 = v38;
    v39 = a4->frame.size;
    v64 = a4->frame.origin;
    v65 = v39;
    v40 = a4->size;
    v66 = a4->center;
    v67 = v40;
    v61 = v31;
    v41 = v14;
    v62 = v41;
    v42 = v15;
    v63 = v42;
    v43 = _Block_copy(v59);
    if (v41)
    {
      if (objc_msgSend(v41, "style") == 1)
      {
        objc_msgSend(v34, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "snapshotViewAfterScreenUpdates:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "layer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "presentationLayer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "frame");
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;

        objc_msgSend(v45, "setFrame:", v49, v51, v53, v55);
        objc_msgSend(v44, "superview");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addSubview:", v45);

        if (v45)
        {
          v93[0] = v45;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = (void *)MEMORY[0x1E0C9AA60];
        }
        objc_msgSend(MEMORY[0x1E0DC3F10], "performSystemAnimation:onViews:options:animations:completion:", 0, v57, 0, 0, v43);
        v33[2](v33);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "animateWithOptions:animations:completion:", v41, v33, v43);
      }
    }
    else
    {
      v33[2](v33);
      v42[2](v42);
    }

    v13 = v58;
  }

}

- (void)suspendAnimationsForTile:(id)a3
{
  id v4;
  NSCountedSet *suspendedTiles;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  suspendedTiles = self->_suspendedTiles;
  v8 = v4;
  if (!suspendedTiles)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suspendedTiles;
    self->_suspendedTiles = v6;

    v4 = v8;
    suspendedTiles = self->_suspendedTiles;
  }
  -[NSCountedSet addObject:](suspendedTiles, "addObject:", v4);

}

- (void)resumeAnimationsForTile:(id)a3
{
  -[NSCountedSet removeObject:](self->_suspendedTiles, "removeObject:", a3);
}

- (void)_applyGeometry:(PXTileGeometry *)a3 toTile:(id)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  objc_msgSend(a4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenter:", a3->center.x, a3->center.y);
  objc_msgSend(v5, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3->size.width, a3->size.height);
  objc_msgSend(v5, "setAlpha:", a3->alpha);
  objc_msgSend(v5, "setHidden:", a3->hidden);
  v6 = *(_OWORD *)&a3->transform.c;
  v8[0] = *(_OWORD *)&a3->transform.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->transform.tx;
  objc_msgSend(v5, "setTransform:", v8);
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setZPosition:", a3->zPosition + -11000000.0);

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
    objc_msgSend(v5, "layoutIfNeeded");

}

- (void)_applyGeometry:(PXTileGeometry *)a3 userData:(id)a4 toTile:(id)a5
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGSize size;
  CGSize v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGSize v20;
  CGSize v21;
  CGPoint origin;
  CGSize v23;
  CGPoint center;
  CGSize v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v8 = *(_OWORD *)&a3->contentSize.height;
  v30 = *(_OWORD *)&a3->hidden;
  v31 = v8;
  v9 = *(_OWORD *)&a3->contentsRect.size.height;
  v32 = *(_OWORD *)&a3->contentsRect.origin.y;
  v33 = v9;
  v10 = *(_OWORD *)&a3->transform.c;
  v26 = *(_OWORD *)&a3->transform.a;
  v27 = v10;
  v11 = *(_OWORD *)&a3->alpha;
  v28 = *(_OWORD *)&a3->transform.tx;
  v29 = v11;
  size = a3->frame.size;
  origin = a3->frame.origin;
  v23 = size;
  v13 = a3->size;
  center = a3->center;
  v25 = v13;
  v14 = a5;
  v15 = a4;
  -[PXBasicUIViewTileAnimator _applyGeometry:toTile:](self, "_applyGeometry:toTile:", &origin, v14);
  v16 = *(_OWORD *)&a3->contentSize.height;
  v30 = *(_OWORD *)&a3->hidden;
  v31 = v16;
  v17 = *(_OWORD *)&a3->contentsRect.size.height;
  v32 = *(_OWORD *)&a3->contentsRect.origin.y;
  v33 = v17;
  v18 = *(_OWORD *)&a3->transform.c;
  v26 = *(_OWORD *)&a3->transform.a;
  v27 = v18;
  v19 = *(_OWORD *)&a3->alpha;
  v28 = *(_OWORD *)&a3->transform.tx;
  v29 = v19;
  v20 = a3->frame.size;
  origin = a3->frame.origin;
  v23 = v20;
  v21 = a3->size;
  center = a3->center;
  v25 = v21;
  objc_msgSend(v14, "didApplyGeometry:withUserData:", &origin, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedTiles, 0);
}

uint64_t __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[12];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 200);
  v11[8] = *(_OWORD *)(a1 + 184);
  v11[9] = v4;
  v5 = *(_OWORD *)(a1 + 232);
  v11[10] = *(_OWORD *)(a1 + 216);
  v11[11] = v5;
  v6 = *(_OWORD *)(a1 + 136);
  v11[4] = *(_OWORD *)(a1 + 120);
  v11[5] = v6;
  v7 = *(_OWORD *)(a1 + 168);
  v11[6] = *(_OWORD *)(a1 + 152);
  v11[7] = v7;
  v8 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v8;
  v9 = *(_OWORD *)(a1 + 104);
  v11[2] = *(_OWORD *)(a1 + 88);
  v11[3] = v9;
  return objc_msgSend(v2, "_applyGeometry:userData:toTile:", v11, v1, v3);
}

uint64_t __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[12];

  if (*(_BYTE *)(a1 + 256) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_OWORD *)(a1 + 208);
    v12[8] = *(_OWORD *)(a1 + 192);
    v12[9] = v5;
    v6 = *(_OWORD *)(a1 + 240);
    v12[10] = *(_OWORD *)(a1 + 224);
    v12[11] = v6;
    v7 = *(_OWORD *)(a1 + 144);
    v12[4] = *(_OWORD *)(a1 + 128);
    v12[5] = v7;
    v8 = *(_OWORD *)(a1 + 176);
    v12[6] = *(_OWORD *)(a1 + 160);
    v12[7] = v8;
    v9 = *(_OWORD *)(a1 + 80);
    v12[0] = *(_OWORD *)(a1 + 64);
    v12[1] = v9;
    v10 = *(_OWORD *)(a1 + 112);
    v12[2] = *(_OWORD *)(a1 + 96);
    v12[3] = v10;
    objc_msgSend(v2, "didAnimateToGeometry:toUserData:withOptions:", v12, v3, v4);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__PXBasicUIViewTileAnimator_prepareTile_withGeometry_userData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  _OWORD v12[12];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 200);
  v12[8] = *(_OWORD *)(a1 + 184);
  v12[9] = v5;
  v6 = *(_OWORD *)(a1 + 232);
  v12[10] = *(_OWORD *)(a1 + 216);
  v12[11] = v6;
  v7 = *(_OWORD *)(a1 + 136);
  v12[4] = *(_OWORD *)(a1 + 120);
  v12[5] = v7;
  v8 = *(_OWORD *)(a1 + 168);
  v12[6] = *(_OWORD *)(a1 + 152);
  v12[7] = v8;
  v9 = *(_OWORD *)(a1 + 72);
  v12[0] = *(_OWORD *)(a1 + 56);
  v12[1] = v9;
  v10 = *(_OWORD *)(a1 + 104);
  v12[2] = *(_OWORD *)(a1 + 88);
  v12[3] = v10;
  objc_msgSend(v2, "_applyGeometry:userData:toTile:", v12, v3, v4);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

@end
